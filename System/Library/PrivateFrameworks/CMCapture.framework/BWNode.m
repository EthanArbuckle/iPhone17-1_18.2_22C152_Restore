@interface BWNode
+ (void)initialize;
- (BOOL)allInputsHaveReachedState:(int)a3;
- (BOOL)hasNonLiveConfigurationChanges;
- (BOOL)input:(id)a3 hasReachedState:(int)a4;
- (BOOL)supportsConcurrentLiveInputCallbacks;
- (BOOL)supportsLiveReconfiguration;
- (BWGraph)graph;
- (BWNode)init;
- (BWNodeInput)input;
- (BWNodeOutput)output;
- (BWNodeRenderDelegate)renderDelegate;
- (NSArray)inputs;
- (NSArray)outputs;
- (NSString)description;
- (NSString)name;
- (NSString)nodeSubType;
- (NSString)nodeType;
- (NSString)subgraphName;
- (id)osStatePropertyList;
- (id)osStatePropertyListWithVerbose:(BOOL)a3;
- (int)deferredPreparePriority;
- (int64_t)configurationID;
- (void)_handleMessage:(id)a3 fromInput:(id)a4;
- (void)addInput:(id)a3;
- (void)addOutput:(id)a3;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)didSelectFormat:(id)a3 forOutput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4;
- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)removeOutput:(id)a3;
- (void)setConfigurationID:(int64_t)a3;
- (void)setDeferredPreparePriority:(int)a3;
- (void)setGraph:(id)a3;
- (void)setName:(id)a3;
- (void)setRenderDelegate:(id)a3;
- (void)setSubgraphName:(id)a3;
- (void)setSupportsConcurrentLiveInputCallbacks:(BOOL)a3;
- (void)setSupportsLiveReconfiguration:(BOOL)a3;
- (void)suspendResources;
@end

@implementation BWNode

- (int)deferredPreparePriority
{
  return self->_deferredPreparePriority;
}

- (BWNodeOutput)output
{
  return self->_output;
}

- (NSArray)outputs
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_outputs];
}

- (NSArray)inputs
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_inputs];
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    [(BWNode *)self didSelectFormat:a3 forInput:a4];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v19 = self;
    outputs = self->_outputs;
    uint64_t v10 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(outputs);
          }
          v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
          if (v15)
          {
            uint64_t v16 = v15;
            if ([v14 mediaPropertiesForAttachedMediaKey:v15])
            {
              uint64_t v18 = [NSString stringWithFormat:@"%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", v19, v14, v16, a5];
              objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0]);
            }
            v17 = objc_alloc_init(BWNodeOutputMediaProperties);
            [v14 _setMediaProperties:v17 forAttachedMediaKey:v16];
            [(BWNodeOutputMediaProperties *)v17 setResolvedFormat:a3];
          }
        }
        uint64_t v11 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (void)didSelectFormat:(id)a3 forOutput:(id)a4 forAttachedMediaKey:(id)a5
{
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    [(BWNode *)self didSelectFormat:a3 forOutput:a4];
  }
}

- (void)setSupportsConcurrentLiveInputCallbacks:(BOOL)a3
{
  self->_supportsConcurrentLiveInputCallbacks = a3;
}

- (void)addInput:(id)a3
{
  if (a3)
  {
    inputs = self->_inputs;
    if (!inputs)
    {
      inputs = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      self->_inputs = inputs;
    }
    [(NSMutableArray *)inputs addObject:a3];
    self->_singleInput = [(NSMutableArray *)self->_inputs count] == 1;
    if (!self->_input) {
      self->_input = (BWNodeInput *)a3;
    }
  }
}

- (void)setSupportsLiveReconfiguration:(BOOL)a3
{
  self->_supportsLiveReconfiguration = a3;
}

- (void)addOutput:(id)a3
{
  if (a3)
  {
    outputs = self->_outputs;
    if (!outputs)
    {
      outputs = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      self->_outputs = outputs;
    }
    [(NSMutableArray *)outputs addObject:a3];
    self->_singleOutput = [(NSMutableArray *)self->_outputs count] == 1;
    if (!self->_output) {
      self->_output = (BWNodeOutput *)a3;
    }
  }
}

- (BWNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWNode;
  v2 = [(BWNode *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_deferredPreparePriority = 2;
    if (![(BWNode *)v2 name]) {
      -[BWNode setName:](v3, "setName:", [(id)objc_opt_class() description]);
    }
  }
  return v3;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setSubgraphName:(id)a3
{
}

- (BOOL)supportsConcurrentLiveInputCallbacks
{
  return self->_supportsConcurrentLiveInputCallbacks;
}

- (void)setGraph:(id)a3
{
  self->_graph = (BWGraph *)a3;
}

- (NSString)nodeType
{
  return 0;
}

- (BOOL)supportsLiveReconfiguration
{
  return self->_supportsLiveReconfiguration;
}

- (BOOL)allInputsHaveReachedState:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(BWNode *)self supportsConcurrentLiveInputCallbacks]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"allInputsHaveReachedState: isn't supported for for concurrent live input callbacks" userInfo:0]);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v5 = [(BWNode *)self inputs];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if ((a3 == 1) == ([*(id *)(*((void *)&v11 + 1) + 8 * v9) liveFormat] == 0)) {
          return 0;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (void)_handleMessage:(id)a3 fromInput:(id)a4
{
  int v7 = *((_DWORD *)a3 + 2);
  int v8 = *((_DWORD *)a3 + 3);
  uint64_t v9 = (void *)MEMORY[0x1A6272C70](self, a2);
  if (v7 == 1)
  {
    switch(v8)
    {
      case 3:
LABEL_6:
        uint64_t v11 = [a4 liveFormat];
        uint64_t v12 = [a3 configurationID];
        [(BWNodeRenderDelegate *)self->_renderDelegate node:self format:v11 didBecomeLiveForInput:a4 configurationID:v12];
        -[BWNode configurationWithID:updatedFormat:didBecomeLiveForInput:](self, "configurationWithID:updatedFormat:didBecomeLiveForInput:", v12, [a3 updatedFormat], a4);
        break;
      case 4:
LABEL_7:
        [(BWNodeRenderDelegate *)self->_renderDelegate node:self format:0 didBecomeLiveForInput:a4 configurationID:self->_configurationID];
        [(BWNode *)self didReachEndOfDataForInput:a4];
        break;
      case 5:
LABEL_8:
        -[BWNode handleNodeError:forInput:](self, "handleNodeError:forInput:", [a3 nodeError], a4);
        break;
      case 6:
LABEL_9:
        -[BWNode handleStillImageReferenceFrameBracketedCaptureSequenceNumber:forInput:](self, "handleStillImageReferenceFrameBracketedCaptureSequenceNumber:forInput:", [a3 referenceFrameBracketedCaptureSequenceNumber], a4);
        break;
      case 7:
LABEL_10:
        -[BWNode handleStillImagePrewarmWithSettings:forInput:](self, "handleStillImagePrewarmWithSettings:forInput:", [a3 stillImageSettings], a4);
        break;
      case 8:
LABEL_11:
        [(BWNode *)self suspendResources];
        break;
      default:
        break;
    }
  }
  else if (v7 == 2)
  {
    switch(v8)
    {
      case 1:
        uint64_t v10 = [a3 sampleBuffer];
        [(BWNodeRenderDelegate *)self->_renderDelegate node:self willRenderSampleBuffer:v10 forInput:a4];
        [(BWNode *)self renderSampleBuffer:v10 forInput:a4];
        break;
      case 2:
        -[BWNode handleDroppedSample:forInput:](self, "handleDroppedSample:forInput:", [a3 droppedSample], a4);
        break;
      case 3:
        goto LABEL_6;
      case 4:
        goto LABEL_7;
      case 5:
        goto LABEL_8;
      case 6:
        goto LABEL_9;
      case 7:
        goto LABEL_10;
      case 8:
        goto LABEL_11;
      default:
        break;
    }
  }
}

- (BWNodeRenderDelegate)renderDelegate
{
  return self->_renderDelegate;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BWNode *)self outputs];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) prepareForConfiguredFormatToBecomeLive];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setConfigurationID:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_configurationID = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [(BWNode *)self inputs];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v9++) setConfigurationID:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = [(BWNode *)self outputs];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setConfigurationID:a3];
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BWNodeInput)input
{
  return self->_input;
}

- (void)setDeferredPreparePriority:(int)a3
{
  self->_deferredPreparePriority = a3;
}

- (NSString)description
{
  name = self->_name;
  if (name) {
    uint64_t v4 = (__CFString *)[NSString stringWithFormat:@" '%@'", name];
  }
  else {
    uint64_t v4 = &stru_1EFA403E0;
  }
  return (NSString *)[NSString stringWithFormat:@"<%@: %p>%@", objc_opt_class(), self, v4];
}

- (BWGraph)graph
{
  return self->_graph;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self->_input)
  {
    if (!self->_singleInput || self->_output && !self->_singleOutput)
    {
      uint64_t v6 = NSString;
      uint64_t v8 = NSStringFromSelector(a2);
      uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(v6, "stringWithFormat:", @"%@ BWNode base class implementation only works for single input single output nodes, please implement %@ in %@", self, v8, objc_opt_class()), 0 reason userInfo];
      objc_exception_throw(v9);
    }
    output = self->_output;
    [(BWNodeOutput *)output makeConfiguredFormatLive];
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (self->_input && self->_singleInput && (!self->_output || self->_singleOutput)) {
    -[BWNodeOutput emitDroppedSample:](self->_output, "emitDroppedSample:", a3, a4);
  }
}

- (void)setRenderDelegate:(id)a3
{
  self->_renderDelegate = (BWNodeRenderDelegate *)a3;
}

+ (void)initialize
{
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_inputs makeObjectsPerformSelector:sel_invalidate];

  [(NSMutableArray *)self->_outputs makeObjectsPerformSelector:sel_invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BWNode;
  [(BWNode *)&v3 dealloc];
}

- (NSString)nodeSubType
{
  return 0;
}

- (BOOL)hasNonLiveConfigurationChanges
{
  return 0;
}

- (void)suspendResources
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  outputs = self->_outputs;
  uint64_t v3 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(outputs);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) suspendResources];
      }
      uint64_t v4 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (self->_input)
  {
    if (!self->_singleInput || self->_output && !self->_singleOutput)
    {
      uint64_t v4 = NSString;
      uint64_t v6 = NSStringFromSelector(a2);
      long long v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(v4, "stringWithFormat:", @"%@ BWNode base class implementation only works for single input single output nodes, please implement %@ in %@", self, v6, objc_opt_class()), 0 reason userInfo];
      objc_exception_throw(v7);
    }
    output = self->_output;
    [(BWNodeOutput *)output markEndOfLiveOutput];
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (self->_input)
  {
    if (!self->_singleInput || self->_output && !self->_singleOutput)
    {
      uint64_t v5 = NSString;
      long long v7 = NSStringFromSelector(a2);
      long long v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(v5, "stringWithFormat:", @"%@ BWNode base class implementation only works for single input single output nodes, please implement %@ in %@", self, v7, objc_opt_class()), 0 reason userInfo];
      objc_exception_throw(v8);
    }
    output = self->_output;
    -[BWNodeOutput emitNodeError:](output, "emitNodeError:", a3, a4);
  }
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  if (self->_input && self->_singleInput && (!self->_output || self->_singleOutput)) {
    -[BWNodeOutput emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:](self->_output, "emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:", *(void *)&a3, a4);
  }
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_inputs containsObject:a4])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    outputs = self->_outputs;
    uint64_t v7 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(outputs);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) emitStillImagePrewarmMessageWithSettings:a3];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)removeOutput:(id)a3
{
  if (a3)
  {
    -[NSMutableArray removeObject:](self->_outputs, "removeObject:");
    if (self->_output == a3) {
      self->_output = (BWNodeOutput *)[(NSMutableArray *)self->_outputs firstObject];
    }
  }
}

- (BOOL)input:(id)a3 hasReachedState:(int)a4
{
  uint64_t v5 = [a3 liveFormat];
  BOOL v6 = v5 == 0;
  if (a4) {
    BOOL v6 = 0;
  }
  if (a4 == 1) {
    return v5 != 0;
  }
  else {
    return v6;
  }
}

- (id)osStatePropertyList
{
  return [(BWNode *)self osStatePropertyListWithVerbose:1];
}

- (id)osStatePropertyListWithVerbose:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:self->_subgraphName forKeyedSubscript:@"subgraphName"];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", -[BWNode description](self, "description"), @"description");
  if (v3)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_supportsConcurrentLiveInputCallbacks), @"supportsCurrentLiveInputCallbacks");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_supportsLiveReconfiguration), @"supportsLiveReconfiguration");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_singleInput), @"singleInput");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_singleOutput), @"singleOutput");
    if (self->_singleInput)
    {
      uint64_t v6 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_inputs, "objectAtIndexedSubscript:", 0), "osStatePropertyList");
      uint64_t v7 = @"nodeInput";
      uint64_t v8 = v5;
    }
    else
    {
      uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      inputs = self->_inputs;
      uint64_t v11 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v30 != v13) {
              objc_enumerationMutation(inputs);
            }
            objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "osStatePropertyList"));
          }
          uint64_t v12 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v12);
      }
      uint64_t v7 = @"nodeInputs";
      uint64_t v8 = v5;
      uint64_t v6 = (uint64_t)v9;
    }
    [v8 setObject:v6 forKeyedSubscript:v7];
    if (self->_singleOutput)
    {
      uint64_t v15 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_outputs, "objectAtIndexedSubscript:", 0), "osStatePropertyList");
      uint64_t v16 = @"nodeOutput";
      long long v17 = v5;
    }
    else
    {
      long long v18 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      outputs = self->_outputs;
      uint64_t v20 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v26 != v22) {
              objc_enumerationMutation(outputs);
            }
            objc_msgSend(v18, "addObject:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "osStatePropertyList"));
          }
          uint64_t v21 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v21);
      }
      uint64_t v16 = @"nodeOutputs";
      long long v17 = v5;
      uint64_t v15 = (uint64_t)v18;
    }
    [v17 setObject:v15 forKeyedSubscript:v16];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deferredPreparePriority), @"deferredPreparePriority");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_configurationID), @"configurationID");
  }
  return v5;
}

- (NSString)subgraphName
{
  return self->_subgraphName;
}

@end