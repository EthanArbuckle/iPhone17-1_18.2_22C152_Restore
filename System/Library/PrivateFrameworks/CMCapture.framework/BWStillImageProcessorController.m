@interface BWStillImageProcessorController
+ (BOOL)usesCustomProcessingFlow;
+ (void)initialize;
- (BOOL)supportsExternalMemoryResource;
- (BWStillImageProcessorController)initWithConfiguration:(id)a3;
- (BWStillImageProcessorController)initWithName:(id)a3 type:(unint64_t)a4 configuration:(id)a5;
- (BWStillImageProcessorControllerConfiguration)configuration;
- (BWStillImageProcessorControllerRequest)currentRequest;
- (CMIExternalMemoryDescriptor)externalMemoryDescriptor;
- (CMIExternalMemoryResource)externalMemoryResource;
- (MetalImageBufferProcessor)metalImageBufferProcessor;
- (NSString)name;
- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5;
- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4;
- (int)prepare;
- (int)process;
- (unint64_t)type;
- (void)_completeCurrentRequestAndInitiateNextRequest;
- (void)_prepare;
- (void)_process;
- (void)_updateStateIfNeeded;
- (void)cancelProcessing;
- (void)dealloc;
- (void)purgeResources;
- (void)reset;
- (void)setExternalMemoryResource:(id)a3;
@end

@implementation BWStillImageProcessorController

- (BWStillImageProcessorControllerConfiguration)configuration
{
  return self->_configuration;
}

- (BWStillImageProcessorController)initWithName:(id)a3 type:(unint64_t)a4 configuration:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)BWStillImageProcessorController;
  v8 = [(BWStillImageProcessorController *)&v13 init];
  if (v8)
  {
    v8->_name = (NSString *)a3;
    v8->_type = a4;
    v8->_configuration = (BWStillImageProcessorControllerConfiguration *)a5;
    if (([(id)objc_opt_class() usesCustomProcessingFlow] & 1) == 0)
    {
      char v9 = +[FigStateMachine indexForState:16];
      v10 = [FigStateMachine alloc];
      v11 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:](v10, "initWithLabel:stateCount:initialState:owner:", [NSString stringWithFormat:@"%@ state machine", -[BWStillImageProcessorController name](v8, "name")], v9, 1, v8);
      [(FigStateMachine *)v11 setPerformsAtomicStateTransitions:0];
      [(FigStateMachine *)v11 setLabel:@"Idle" forState:1];
      [(FigStateMachine *)v11 setLabel:@"Ready" forState:2];
      [(FigStateMachine *)v11 setLabel:@"Waiting" forState:4];
      [(FigStateMachine *)v11 setLabel:@"Processing" forState:8];
      [(FigStateMachine *)v11 whenTransitioningToStates:1 callHandler:&__block_literal_global_0];
      [(FigStateMachine *)v11 whenTransitioningToStates:2 callHandler:&__block_literal_global_315];
      [(FigStateMachine *)v11 whenTransitioningToState:4 callHandler:&__block_literal_global_317];
      [(FigStateMachine *)v11 whenTransitioningToState:8 callHandler:&__block_literal_global_319];
      v8->_stateMachine = v11;
      v8->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (BOOL)usesCustomProcessingFlow
{
  return 1;
}

- (BWStillImageProcessorController)initWithConfiguration:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessorController;
  [(BWStillImageProcessorController *)&v3 dealloc];
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  int v9 = 0;
  if (([(id)objc_opt_class() usesCustomProcessingFlow] & 1) == 0)
  {
    if (-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType")&& !-[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", [a3 portType]))
    {
      return -12780;
    }
    else
    {
      id v7 = [(BWStillImageProcessorController *)self requestForInput:a3 delegate:a4 errOut:&v9];
      if (!v9)
      {
        [(NSMutableArray *)self->_requestQueue addObject:v7];
        if ([(FigStateMachine *)self->_stateMachine currentState] == 1) {
          [(FigStateMachine *)self->_stateMachine transitionToState:2];
        }
      }
    }
  }
  return v9;
}

- (void)cancelProcessing
{
  if (([(id)objc_opt_class() usesCustomProcessingFlow] & 1) == 0)
  {
    [(NSMutableArray *)self->_requestQueue removeAllObjects];
    if ([(FigStateMachine *)self->_stateMachine currentState] != 8)
    {
      [(BWStillImageProcessorControllerRequest *)self->_currentRequest setErr:4294950490];
      [(BWStillImageProcessorController *)self _completeCurrentRequestAndInitiateNextRequest];
      [(BWStillImageProcessorController *)self _updateStateIfNeeded];
    }
  }
}

- (void)purgeResources
{
  v2 = objc_opt_class();
  [v2 usesCustomProcessingFlow];
}

- (BOOL)supportsExternalMemoryResource
{
  [(BWStillImageProcessorController *)self metalImageBufferProcessor];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  objc_super v3 = [(BWStillImageProcessorController *)self metalImageBufferProcessor];
  return [(MetalImageBufferProcessor *)v3 supportsExternalMemoryResource];
}

- (CMIExternalMemoryDescriptor)externalMemoryDescriptor
{
  [(BWStillImageProcessorController *)self metalImageBufferProcessor];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  objc_super v3 = [(BWStillImageProcessorController *)self metalImageBufferProcessor];
  return (CMIExternalMemoryDescriptor *)[(MetalImageBufferProcessor *)v3 externalMemoryDescriptorForConfiguration:0];
}

- (void)setExternalMemoryResource:(id)a3
{
  [(BWStillImageProcessorController *)self metalImageBufferProcessor];
  if (objc_opt_respondsToSelector())
  {
    v5 = [(BWStillImageProcessorController *)self metalImageBufferProcessor];
    [(MetalImageBufferProcessor *)v5 setExternalMemoryResource:a3];
  }
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  [(BWStillImageProcessorController *)self metalImageBufferProcessor];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  objc_super v3 = [(BWStillImageProcessorController *)self metalImageBufferProcessor];
  return (CMIExternalMemoryResource *)[(MetalImageBufferProcessor *)v3 externalMemoryResource];
}

- (void)reset
{
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
}

- (int)prepare
{
}

- (int)process
{
}

- (MetalImageBufferProcessor)metalImageBufferProcessor
{
  return 0;
}

- (void)_updateStateIfNeeded
{
  currentRequest = self->_currentRequest;
  unsigned int v4 = [(FigStateMachine *)self->_stateMachine currentState];
  if (currentRequest)
  {
    if (v4 == 2)
    {
      uint64_t v5 = 4;
    }
    else if (v4 == 4)
    {
      if ([(BWStillImageProcessorControllerRequest *)currentRequest readyForProcessing]) {
        uint64_t v5 = 8;
      }
      else {
        uint64_t v5 = 4;
      }
    }
    else
    {
      uint64_t v5 = 2;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  if (v5 != [(FigStateMachine *)self->_stateMachine currentState])
  {
    stateMachine = self->_stateMachine;
    [(FigStateMachine *)stateMachine transitionToState:v5];
  }
}

- (void)_completeCurrentRequestAndInitiateNextRequest
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(BWStillImageProcessorControllerRequest *)self->_currentRequest delegate];
  unsigned int v4 = [(BWStillImageProcessorControllerRequest *)self->_currentRequest input];
  uint64_t v5 = [(BWStillImageProcessorControllerRequest *)self->_currentRequest err];
  unint64_t v6 = [(BWStillImageProcessorControllerRequest *)self->_currentRequest outputType];
  id v7 = [(BWStillImageProcessorControllerRequest *)self->_currentRequest outputFrame];
  if (v7)
  {
    CFTypeRef v8 = CFRetain(v7);
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    CFTypeRef v8 = 0;
    if (!v6) {
      goto LABEL_8;
    }
  }
  if (!v5 && !v8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    self->_currentRequest = 0;
    goto LABEL_14;
  }
LABEL_8:

  self->_currentRequest = 0;
  if (!v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_14:
  [(BWStillImageProcessorController *)self _updateStateIfNeeded];
  [(BWStillImageProcessorControllerDelegate *)v3 processorController:self didFinishProcessingSampleBuffer:v8 type:v6 processorInput:v4 err:v5];
  if (v8) {
LABEL_10:
  }
    CFRelease(v8);
LABEL_11:
  [(BWStillImageProcessorControllerDelegate *)v3 processorController:self didFinishProcessingInput:v4 err:v5];

  v10 = (BWStillImageProcessorControllerRequest *)(id)[(NSMutableArray *)self->_requestQueue firstObject];
  self->_currentRequest = v10;
  if (v10)
  {
    [(NSMutableArray *)self->_requestQueue removeObjectAtIndex:0];
    [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)self->_currentRequest input] setDelegate:self];
  }
}

- (void)_prepare
{
  [(BWStillImageProcessorControllerRequest *)self->_currentRequest setErr:[(BWStillImageProcessorController *)self prepare]];
  if ([(BWStillImageProcessorControllerRequest *)self->_currentRequest err])
  {
    [(BWStillImageProcessorController *)self reset];
  }
}

- (void)_process
{
  if (![(BWStillImageProcessorControllerRequest *)self->_currentRequest err])
  {
    objc_super v3 = (void *)MEMORY[0x1A6272C70]();
    [(BWStillImageProcessorControllerRequest *)self->_currentRequest setErr:[(BWStillImageProcessorController *)self process]];
    currentRequest = self->_currentRequest;
    [(BWStillImageProcessorControllerRequest *)currentRequest err];
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (BWStillImageProcessorControllerRequest)currentRequest
{
  return self->_currentRequest;
}

@end