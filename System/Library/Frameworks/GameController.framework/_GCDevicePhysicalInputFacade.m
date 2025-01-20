@interface _GCDevicePhysicalInputFacade
+ (BOOL)automaticallyNotifiesObserversOfQueue;
- (GCDevice)device;
- (GCPhysicalInputElementCollection)axes;
- (GCPhysicalInputElementCollection)buttons;
- (GCPhysicalInputElementCollection)dpads;
- (GCPhysicalInputElementCollection)elements;
- (GCPhysicalInputElementCollection)switches;
- (OS_dispatch_queue)queue;
- (_GCDevicePhysicalInputFacade)initWithParameters:(id)a3;
- (_GCDevicePhysicalInputFacade)initWithTemplate:(id)a3 context:(id)a4;
- (double)lastEventLatency;
- (double)lastEventTimestamp;
- (id)_elementsForProtocol:(id *)result;
- (id)alternatePhysicalInputWithAttribute:(id)a3;
- (id)capture;
- (id)changedElements;
- (id)elementValueDidChangeHandler;
- (id)inputStateAvailableHandler;
- (id)nextInputState;
- (id)objectForKeyedSubscript:(id)a3;
- (int64_t)changeForElement:(id)a3;
- (int64_t)inputStateQueueDepth;
- (void)setElementValueDidChangeHandler:(id)a3;
- (void)setInputStateAvailableHandler:(id)a3;
- (void)setInputStateQueueDepth:(int64_t)a3;
- (void)setQueue:(id)a3;
@end

@implementation _GCDevicePhysicalInputFacade

- (_GCDevicePhysicalInputFacade)initWithParameters:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_GCDevicePhysicalInputFacade;
  return [(_GCDevicePhysicalInputView *)&v4 initWithParameters:a3];
}

- (_GCDevicePhysicalInputFacade)initWithTemplate:(id)a3 context:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_GCDevicePhysicalInputFacade;
  return [(_GCDevicePhysicalInputView *)&v5 initWithTemplate:a3 context:a4];
}

- (id)alternatePhysicalInputWithAttribute:(id)a3
{
  if (!a3) {
    objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputFacade.m", 32, @"Invalid parameter not satisfying: %s", "attribute");
  }
  id result = (id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = [(id)-[_GCDevicePhysicalInputBase attributes]((uint64_t)result) setByAddingObject:a3];
    v8 = [v6 dataSource];
    v9 = [v8 physicalInputWithAttributes:v7];
    id v10 = (id)-[_GCDevicePhysicalInputBase facade]((uint64_t)v9);

    return v10;
  }
  return result;
}

- (GCDevice)device
{
  v2 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);

  return (GCDevice *)[v2 device];
}

- (double)lastEventTimestamp
{
  v2 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);

  [v2 lastEventTimestamp];
  return result;
}

- (double)lastEventLatency
{
  v2 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);

  [v2 lastEventLatency];
  return result;
}

- (id)_elementsForProtocol:(id *)result
{
  if (result)
  {
    v3 = (id *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)result);
    if (v3)
    {
      return -[_GCDevicePhysicalInputBase elementsForProtocol:](v3, a2);
    }
    else
    {
      return (id *)+[GCPhysicalInputElementCollection collection]();
    }
  }
  return result;
}

- (GCPhysicalInputElementCollection)elements
{
  return (GCPhysicalInputElementCollection *)-[_GCDevicePhysicalInputFacade _elementsForProtocol:]((id *)&self->super.super.isa, 0);
}

- (GCPhysicalInputElementCollection)buttons
{
  return (GCPhysicalInputElementCollection *)-[_GCDevicePhysicalInputFacade _elementsForProtocol:]((id *)&self->super.super.isa, &unk_26D2906D8);
}

- (GCPhysicalInputElementCollection)axes
{
  return (GCPhysicalInputElementCollection *)-[_GCDevicePhysicalInputFacade _elementsForProtocol:]((id *)&self->super.super.isa, &unk_26D2954D8);
}

- (GCPhysicalInputElementCollection)switches
{
  return (GCPhysicalInputElementCollection *)-[_GCDevicePhysicalInputFacade _elementsForProtocol:]((id *)&self->super.super.isa, &unk_26D28FF98);
}

- (GCPhysicalInputElementCollection)dpads
{
  return (GCPhysicalInputElementCollection *)-[_GCDevicePhysicalInputFacade _elementsForProtocol:]((id *)&self->super.super.isa, &unk_26D290658);
}

- (id)objectForKeyedSubscript:(id)a3
{
  objc_super v4 = (id *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  objc_super v5 = -[_GCDevicePhysicalInputBase elementsForProtocol:](v4, 0);

  return (id)[v5 elementForAlias:a3];
}

+ (BOOL)automaticallyNotifiesObserversOfQueue
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  if ([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot]) {
    return 0;
  }
  v3 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);

  return (OS_dispatch_queue *)-[_GCDevicePhysicalInput queue](v3);
}

- (void)setQueue:(id)a3
{
  if ([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot])
  {
    GCRuntimeIssuesLogger = getGCRuntimeIssuesLogger();
    if (os_log_type_enabled(GCRuntimeIssuesLogger, OS_LOG_TYPE_FAULT)) {
      -[_GCDevicePhysicalInputFacade setQueue:]();
    }
  }
  else
  {
    objc_super v5 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    -[_GCDevicePhysicalInput setQueue:](v5, a3);
  }
}

- (id)elementValueDidChangeHandler
{
  if ([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot]) {
    return 0;
  }
  v3 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);

  return [(_GCDevicePhysicalInput *)v3 elementValueDidChangeHandler];
}

- (void)setElementValueDidChangeHandler:(id)a3
{
  if ([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot])
  {
    GCRuntimeIssuesLogger = getGCRuntimeIssuesLogger();
    if (os_log_type_enabled(GCRuntimeIssuesLogger, OS_LOG_TYPE_FAULT)) {
      -[_GCDevicePhysicalInputFacade setElementValueDidChangeHandler:]();
    }
  }
  else
  {
    objc_super v5 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    -[_GCDevicePhysicalInput setElementValueDidChangeHandler:](v5, (char *)a3);
  }
}

- (id)capture
{
  if ([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot]) {
    return self;
  }
  objc_super v4 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  uint64_t v5 = -[_GCDevicePhysicalInput currentTransaction](v4);

  return (id)-[_GCDevicePhysicalInputBase facade](v5);
}

- (id)inputStateAvailableHandler
{
  if ([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot]) {
    return 0;
  }
  v3 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);

  return [(_GCDevicePhysicalInput *)v3 inputStateAvailableHandler];
}

- (void)setInputStateAvailableHandler:(id)a3
{
  if ([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot])
  {
    GCRuntimeIssuesLogger = getGCRuntimeIssuesLogger();
    if (os_log_type_enabled(GCRuntimeIssuesLogger, OS_LOG_TYPE_FAULT)) {
      -[_GCDevicePhysicalInputFacade setInputStateAvailableHandler:]();
    }
  }
  else
  {
    uint64_t v5 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    -[_GCDevicePhysicalInput setInputStateAvailableHandler:](v5, (char *)a3);
  }
}

- (int64_t)inputStateQueueDepth
{
  if ([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot]) {
    return 0;
  }
  v3 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);

  return -[_GCDevicePhysicalInput transactionQueueDepth](v3);
}

- (void)setInputStateQueueDepth:(int64_t)a3
{
  if ([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot])
  {
    GCRuntimeIssuesLogger = getGCRuntimeIssuesLogger();
    if (os_log_type_enabled(GCRuntimeIssuesLogger, OS_LOG_TYPE_FAULT)) {
      -[_GCDevicePhysicalInputFacade setInputStateQueueDepth:]();
    }
  }
  else
  {
    if (a3 <= 0) {
      objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputFacade.m", 156, @"*** Input state queue depth must be >= 1.  %zd is invalid.", a3);
    }
    id v6 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    -[_GCDevicePhysicalInput setTransactionQueueDepth:](v6, a3);
  }
}

- (id)nextInputState
{
  if ([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot]) {
    return 0;
  }
  v3 = (void *)[(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) popTransaction];
  id v4 = (id)-[_GCDevicePhysicalInputBase facade]((uint64_t)v3);

  return v4;
}

- (int64_t)changeForElement:(id)a3
{
  if (!-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self)) {
    return -1;
  }
  if (([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot] & 1) == 0) {
    [(_GCDevicePhysicalInputFacade *)self doesNotRecognizeSelector:a2];
  }
  uint64_t v6 = -[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  uint64_t v7 = [(id)-[_GCDevicePhysicalInputBase elements](v6) indexOfObject:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  unint64_t v8 = v7;
  uint64_t v9 = -[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  if (!-[_GCDevicePhysicalInputTransaction updateContextIsValidForElementAtIndex:](v9)) {
    return -1;
  }
  id v10 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  return -[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](v10, v8, 0, 1) != 0;
}

- (id)changedElements
{
  id result = (id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  if (result)
  {
    if (([(id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self) isSnapshot] & 1) == 0) {
      [(_GCDevicePhysicalInputFacade *)self doesNotRecognizeSelector:a2];
    }
    uint64_t v5 = (_GCDevicePhysicalInputChangedElementsEnumerator *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    return -[_GCDevicePhysicalInputTransaction changedElements](v5);
  }
  return result;
}

- (void)setQueue:.cold.1()
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_10(&dword_220998000, v0, v1, "Setting a 'queue' on a snapshot is ignored.", v2, v3, v4, v5, v6);
}

- (void)setElementValueDidChangeHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_10(&dword_220998000, v0, v1, "Setting a 'elementValueDidChangeHandler' on a snapshot is ignored.", v2, v3, v4, v5, v6);
}

- (void)setInputStateAvailableHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_10(&dword_220998000, v0, v1, "Setting a 'inputStateAvailableHandler' on a snapshot is ignored.", v2, v3, v4, v5, v6);
}

- (void)setInputStateQueueDepth:.cold.1()
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_10(&dword_220998000, v0, v1, "Setting 'inputStateQueueDepth' on a snapshot is ignored.", v2, v3, v4, v5, v6);
}

@end