@interface AVFigRoutingContextSendConfigureDeviceCommandOperation
+ (void)initialize;
- (AVFigRoutingContextSendConfigureDeviceCommandOperation)init;
- (AVFigRoutingContextSendConfigureDeviceCommandOperation)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 configuratorBlock:(id)a4;
- (AVOutputDeviceConfigurationRetrieval)finalConfiguration;
- (BOOL)isAsynchronous;
- (void)dealloc;
- (void)setFinalConfiguration:(id)a3;
- (void)start;
@end

@implementation AVFigRoutingContextSendConfigureDeviceCommandOperation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVFigRoutingContextSendConfigureDeviceCommandOperation)init
{
  return [(AVFigRoutingContextSendConfigureDeviceCommandOperation *)self initWithRoutingContext:0 configuratorBlock:0];
}

- (AVFigRoutingContextSendConfigureDeviceCommandOperation)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 configuratorBlock:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AVFigRoutingContextSendConfigureDeviceCommandOperation;
  v6 = [(AVOperation *)&v12 init];
  v7 = v6;
  if (a3)
  {
    v8 = (OpaqueFigRoutingContext *)CFRetain(a3);
    v7->_routingContext = v8;
    if (v8 && (uint64_t v9 = [a4 copy], (v7->_configuratorBlock = (id)v9) != 0)) {
      v10 = v7;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
    v6->_routingContext = 0;
  }

  return v10;
}

- (void)dealloc
{
  routingContext = self->_routingContext;
  if (routingContext) {
    CFRelease(routingContext);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVFigRoutingContextSendConfigureDeviceCommandOperation;
  [(AVOperation *)&v4 dealloc];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  if ([(AVOperation *)self evaluateDependenciesAndMarkAsExecuting])
  {
    v3 = objc_alloc_init(AVFigRoutingContextCommandOutputDeviceConfigurationModification);
    (*((void (**)(void))self->_configuratorBlock + 2))();
    CFDictionaryRef v4 = [(AVFigRoutingContextCommandOutputDeviceConfigurationModification *)v3 routingContextCommandPayload];
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E4F20500]);
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E4F20518]);
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E4F20508]);
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E4F20510]);
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E4F204E8]);
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E4F204F0]);
    if (dword_1E93569B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v6 = self;
    routingContext = self->_routingContext;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    v10 = *(void (**)(OpaqueFigRoutingContext *, void, const __CFDictionary *, void (*)(uint64_t, const __CFDictionary *, signed int, void *), AVFigRoutingContextSendConfigureDeviceCommandOperation *))(v9 + 136);
    if (v10) {
      v10(routingContext, *MEMORY[0x1E4F21228], v4, AVSendCommandCompletion, v6);
    }
  }
}

- (AVOutputDeviceConfigurationRetrieval)finalConfiguration
{
  return self->_finalConfiguration;
}

- (void)setFinalConfiguration:(id)a3
{
}

@end