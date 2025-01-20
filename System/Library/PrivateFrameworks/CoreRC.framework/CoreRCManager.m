@interface CoreRCManager
+ (CoreRCManager)allocWithZone:(_NSZone *)a3;
- (BOOL)sendCommand:(unint64_t)a3 fromDevice:(id)a4 toDevice:(id)a5 withDuration:(unint64_t)a6 error:(id *)a7;
- (BOOL)sendHIDEvent:(id)a3 fromDevice:(id)a4 toDevice:(id)a5 error:(id *)a6;
- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 ofDevice:(id)a5 error:(id *)a6;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 ofBus:(id)a5 error:(id *)a6;
- (CoreIRLearningSession)learningSessionInternal;
- (CoreRCManager)init;
- (CoreRCManager)initWithSerialQueue:(id)a3;
- (NSMutableSet)busesInternal;
- (NSSet)buses;
- (OS_dispatch_queue)serialQueue;
- (id)delegate;
- (id)extendedPropertyForKey:(id)a3 ofDevice:(id)a4 error:(id *)a5;
- (id)managedBusEquivalentTo:(id)a3;
- (id)managedBusForDevice:(id)a3;
- (id)managedDeviceEquivalentTo:(id)a3;
- (id)propertyForKey:(id)a3 ofBus:(id)a4 error:(id *)a5;
- (void)addBus:(id)a3;
- (void)dealloc;
- (void)notifyDelegateAddBus:(id)a3;
- (void)notifyDelegateRemoveBus:(id)a3;
- (void)notifyDelegateUpdateBus:(id)a3;
- (void)removeBus:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CoreRCManager

+ (CoreRCManager)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)objc_opt_class();
  return (CoreRCManager *)NSAllocateObject(v4, 0, a3);
}

- (CoreRCManager)init
{
  return [(CoreRCManager *)self initWithSerialQueue:0];
}

- (CoreRCManager)initWithSerialQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CoreRCManager;
  v4 = [(CoreRCManager *)&v7 init];
  if (v4)
  {
    id v5 = (id)MEMORY[0x263EF83A0];
    if (a3) {
      id v5 = a3;
    }
    v4->_serialQueue = (OS_dispatch_queue *)v5;
    v4->_busesInternal = (NSMutableSet *)objc_opt_new();
  }
  return v4;
}

- (void)dealloc
{
  [(NSMutableSet *)self->_busesInternal removeAllObjects];

  v3.receiver = self;
  v3.super_class = (Class)CoreRCManager;
  [(CoreRCManager *)&v3 dealloc];
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 ofBus:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)propertyForKey:(id)a3 ofBus:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 ofDevice:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)extendedPropertyForKey:(id)a3 ofDevice:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CoreRCManagerDelegate *)a3;
}

- (NSSet)buses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  objc_super v3 = [(CoreRCManager *)self busesInternal];
  return (NSSet *)[v2 setWithSet:v3];
}

- (id)managedBusEquivalentTo:(id)a3
{
  v4 = [(CoreRCManager *)self busesInternal];
  return (id)[(NSMutableSet *)v4 member:a3];
}

- (id)managedBusForDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(CoreRCManager *)self busesInternal];
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "uniqueID"), "isEqual:", objc_msgSend(a3, "busUniqueID"))) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)managedDeviceEquivalentTo:(id)a3
{
  id v4 = -[CoreRCManager managedBusForDevice:](self, "managedBusForDevice:");
  return (id)[v4 deviceOnBusEquivalentTo:a3];
}

- (void)addBus:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreRCManager.m", 166, @"inBus must not be nil: %@", self);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v6 = self;
    __int16 v7 = 2112;
    id v8 = a3;
    _os_log_impl(&dword_24C4AB000, &_os_log_internal, OS_LOG_TYPE_INFO, "[CoreRC] manager: %@ addBus: %@", buf, 0x16u);
  }
  [a3 setManager:self];
  [a3 willAddToManager:self];
  [(NSMutableSet *)[(CoreRCManager *)self busesInternal] addObject:a3];
  [(CoreRCManager *)self notifyDelegateAddBus:a3];
  [a3 didAddToManager:self];
}

- (void)removeBus:(id)a3
{
  id v4 = [(CoreRCManager *)self managedBusEquivalentTo:a3];
  if (v4)
  {
    id v5 = v4;
    [v4 willRemoveFromManager:self];
    [(NSMutableSet *)[(CoreRCManager *)self busesInternal] removeObject:v5];
    [(CoreRCManager *)self notifyDelegateRemoveBus:v5];
    [v5 didRemoveFromManager:self];
    [v5 setManager:0];
    id v4 = v5;
  }
}

- (void)notifyDelegateAddBus:(id)a3
{
  id v5 = [(CoreRCManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 manager:self hasAdded:a3];
  }
}

- (void)notifyDelegateRemoveBus:(id)a3
{
  id v5 = [(CoreRCManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 manager:self hasRemoved:a3];
  }
}

- (void)notifyDelegateUpdateBus:(id)a3
{
  id v5 = [(CoreRCManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 manager:self hasUpdated:a3];
  }
}

- (BOOL)sendHIDEvent:(id)a3 fromDevice:(id)a4 toDevice:(id)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)sendCommand:(unint64_t)a3 fromDevice:(id)a4 toDevice:(id)a5 withDuration:(unint64_t)a6 error:(id *)a7
{
  return 0;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMutableSet)busesInternal
{
  return self->_busesInternal;
}

- (CoreIRLearningSession)learningSessionInternal
{
  return self->_learningSessionInternal;
}

@end