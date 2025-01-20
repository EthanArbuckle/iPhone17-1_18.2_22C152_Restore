@interface IRAVOutputContextController
- (AVOutputContext)outputContext;
- (IRAVOutputContextController)initWithOutputContextType:(int64_t)a3;
- (NSHashTable)observers;
- (NSNotificationCenter)notificationCenter;
- (id)_associatedOutputContextForType:(int64_t)a3;
- (id)getOutputDevice;
- (id)getPredictedOutputDevice;
- (os_unfair_lock_s)lock;
- (void)_didUpdateOutputDevice:(id)a3;
- (void)_didUpdatePredictedOutputDevice:(id)a3;
- (void)_registerForAVOutputContextOutputDeviceDidChangeNotification;
- (void)_registerForAVOutputContextPredictedOutputDeviceDidChangeNotification;
- (void)_unregisterForAVOutputContextOutputDeviceDidChangeNotification;
- (void)_unregisterForAVOutputContextPredictedOutputDeviceDidChangeNotification;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOutputContext:(id)a3;
@end

@implementation IRAVOutputContextController

- (IRAVOutputContextController)initWithOutputContextType:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v9 = (os_log_t *)MEMORY[0x263F50090];
    v10 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_FAULT)) {
      -[IRAVOutputContextController initWithOutputContextType:](v10);
    }
    v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "/Library/Caches/com.apple.xbs/Sources/IntelligentRouting/IntelligentRoutingDaemon/DataProviders/AVOutputCont"
            "ext/IRAVOutputContextController.m";
      __int16 v15 = 1024;
      int v16 = 31;
      __int16 v17 = 2080;
      v18 = "-[IRAVOutputContextController initWithOutputContextType:]";
      _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_INFO, "#output-context-controller, %s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  v12.receiver = self;
  v12.super_class = (Class)IRAVOutputContextController;
  v3 = [(IRAVOutputContextController *)&v12 init];
  v4 = v3;
  if (v3)
  {
    [(IRAVOutputContextController *)v3 setLock:0];
    v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(IRAVOutputContextController *)v4 setObservers:v5];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [(IRAVOutputContextController *)v4 setNotificationCenter:v6];

    v7 = [(IRAVOutputContextController *)v4 _associatedOutputContextForType:0];
    [(IRAVOutputContextController *)v4 setOutputContext:v7];

    [(IRAVOutputContextController *)v4 _registerForAVOutputContextOutputDeviceDidChangeNotification];
    [(IRAVOutputContextController *)v4 _registerForAVOutputContextPredictedOutputDeviceDidChangeNotification];
  }
  return v4;
}

- (void)dealloc
{
  [(IRAVOutputContextController *)self _unregisterForAVOutputContextOutputDeviceDidChangeNotification];
  [(IRAVOutputContextController *)self _unregisterForAVOutputContextPredictedOutputDeviceDidChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)IRAVOutputContextController;
  [(IRAVOutputContextController *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(IRAVOutputContextController *)self observers];
  char v6 = [v5 containsObject:v8];

  if ((v6 & 1) == 0)
  {
    v7 = [(IRAVOutputContextController *)self observers];
    [v7 addObject:v8];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(IRAVOutputContextController *)self observers];
  char v6 = [v5 containsObject:v8];

  if (v6)
  {
    v7 = [(IRAVOutputContextController *)self observers];
    [v7 removeObject:v8];
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)getOutputDevice
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(IRAVOutputContextController *)self outputContext];
  v5 = [v4 outputDevice];
  char v6 = +[IRAVOutputDeviceDO AVOutputDeviceToDO:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)getPredictedOutputDevice
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(IRAVOutputContextController *)self outputContext];
  v5 = [v4 predictedOutputDevice];
  char v6 = +[IRAVOutputDeviceDO AVOutputDeviceToDO:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)_associatedOutputContextForType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      self = [MEMORY[0x263EFA7B8] sharedAudioPresentationOutputContext];
      break;
    case 1:
      self = [MEMORY[0x263EFA7B8] sharedSystemScreenContext];
      break;
    case 0:
      self = [MEMORY[0x263EFA7B8] sharedSystemAudioContext];
      break;
  }

  return self;
}

- (void)_didUpdateOutputDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(IRAVOutputContextController *)self outputContext];
  char v6 = [v5 outputDevice];

  v7 = +[IRAVOutputDeviceDO AVOutputDeviceToDO:v6];
  id v8 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
    -[IRAVOutputContextController _didUpdateOutputDevice:]((uint64_t)v7, v8);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v9 = [(IRAVOutputContextController *)self observers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) context:self didUpdateOutputDevice:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_didUpdatePredictedOutputDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(IRAVOutputContextController *)self outputContext];
  char v6 = [v5 predictedOutputDevice];

  v7 = +[IRAVOutputDeviceDO AVOutputDeviceToDO:v6];
  id v8 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
    -[IRAVOutputContextController _didUpdatePredictedOutputDevice:]((uint64_t)v7, v8);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v9 = [(IRAVOutputContextController *)self observers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) context:self didUpdatePredicatedOutputDevice:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_registerForAVOutputContextOutputDeviceDidChangeNotification
{
  id v5 = [(IRAVOutputContextController *)self notificationCenter];
  uint64_t v3 = *MEMORY[0x263EF9FA0];
  id v4 = [(IRAVOutputContextController *)self outputContext];
  [v5 addObserver:self selector:sel__didUpdateOutputDevice_ name:v3 object:v4];
}

- (void)_unregisterForAVOutputContextOutputDeviceDidChangeNotification
{
  notificationCenter = self->_notificationCenter;
  uint64_t v4 = *MEMORY[0x263EF9FA0];
  id v5 = [(IRAVOutputContextController *)self outputContext];
  [(NSNotificationCenter *)notificationCenter removeObserver:self name:v4 object:v5];
}

- (void)_registerForAVOutputContextPredictedOutputDeviceDidChangeNotification
{
  id v5 = [(IRAVOutputContextController *)self notificationCenter];
  uint64_t v3 = *MEMORY[0x263EF9FB0];
  uint64_t v4 = [(IRAVOutputContextController *)self outputContext];
  [v5 addObserver:self selector:sel__didUpdatePredictedOutputDevice_ name:v3 object:v4];
}

- (void)_unregisterForAVOutputContextPredictedOutputDeviceDidChangeNotification
{
  notificationCenter = self->_notificationCenter;
  uint64_t v4 = *MEMORY[0x263EF9FB0];
  id v5 = [(IRAVOutputContextController *)self outputContext];
  [(NSNotificationCenter *)notificationCenter removeObserver:self name:v4 object:v5];
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setOutputContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)initWithOutputContextType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_25418E000, log, OS_LOG_TYPE_FAULT, "#output-context-controller, [ErrorId - AVOutputContext type] Currently only Audio output context type is supported", v1, 2u);
}

- (void)_didUpdateOutputDevice:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_25418E000, a2, OS_LOG_TYPE_DEBUG, "#output-context-controller, Output device has been updated: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_didUpdatePredictedOutputDevice:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_25418E000, a2, OS_LOG_TYPE_DEBUG, "#output-context-controller, Predicted output device has been updated: %@", (uint8_t *)&v2, 0xCu);
}

@end