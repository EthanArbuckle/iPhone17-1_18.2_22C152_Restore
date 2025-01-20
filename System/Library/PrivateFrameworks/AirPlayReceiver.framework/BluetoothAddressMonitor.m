@interface BluetoothAddressMonitor
- (BluetoothAddressMonitor)initWithSystemInfo:(OpaqueAPReceiverSystemInfo *)a3 queue:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation BluetoothAddressMonitor

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v7)
  {
    v8 = (const void *)v7;
    id v9 = (id)[(CBPeripheralManager *)self->_cbManager nonConnectableAdvertisingAddress];
    if (v9)
    {
      CFRetain(v8);
      id v10 = v9;
      queue = self->_queue;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __74__BluetoothAddressMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v12[3] = &unk_264896140;
      v12[4] = v9;
      v12[5] = v8;
      dispatch_async(queue, v12);
    }

    CFRelease(v8);
  }
  else
  {
  }
}

void __74__BluetoothAddressMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  CFDataRef v3 = *(const __CFData **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  CFDataRef v4 = *(const __CFData **)(v2 + 720);
  if (v4 != v3)
  {
    BOOL v5 = !v3 || v4 == 0;
    if (v5 || !CFEqual(v4, v3))
    {
      if (gLogCategory_APReceiverSystemInfo <= 50
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        IsAppleInternalBuild();
        IsAppleInternalBuild();
        CFDataRef v6 = *(const __CFData **)(v2 + 720);
        if (v6) {
          CFDataGetBytePtr(v6);
        }
        IsAppleInternalBuild();
        IsAppleInternalBuild();
        if (v3) {
          CFDataGetBytePtr(v3);
        }
        LogPrintF();
      }
      uint64_t v7 = *(const void **)(v2 + 720);
      if (v3) {
        CFRetain(v3);
      }
      *(void *)(v2 + 720) = v3;
      if (v7) {
        CFRelease(v7);
      }
      sysInfo_updateAdvertiserInfoAndNotify(v2, @"BluetoothAddressChanged");
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (Mutable)
      {
        id v9 = Mutable;
        CFDictionarySetValue(Mutable, @"NonUrgent", (const void *)*MEMORY[0x263EFFB40]);
        sysInfo_updateAdvertiserInfoAndNotify(v2, @"AdvertisingParameterChanged");
        CFRelease(v9);
      }
      else
      {
        APSLogErrorAt();
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  id v10 = *(void **)(a1 + 32);
}

- (BluetoothAddressMonitor)initWithSystemInfo:(OpaqueAPReceiverSystemInfo *)a3 queue:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BluetoothAddressMonitor;
  BOOL v5 = [(BluetoothAddressMonitor *)&v9 init];
  if (v5)
  {
    uint64_t v6 = FigCFWeakReferenceHolderCreateWithReferencedObject();
    v5->_systemInfoWeak = (OpaqueFigCFWeakReferenceHolder *)v6;
    if (v6 && (v5->_queue = (OS_dispatch_queue *)a4) != 0)
    {
      dispatch_retain((dispatch_object_t)a4);
      uint64_t v7 = (CBPeripheralManager *)objc_opt_new();
      v5->_cbManager = v7;
      [(CBPeripheralManager *)v7 addObserver:v5 forKeyPath:@"advertisingAddress" options:5 context:0];
    }
    else
    {
      APSLogErrorAt();
      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  self->_cbManager = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  systemInfoWeak = self->_systemInfoWeak;
  if (systemInfoWeak)
  {
    CFRelease(systemInfoWeak);
    self->_systemInfoWeak = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)BluetoothAddressMonitor;
  [(BluetoothAddressMonitor *)&v5 dealloc];
}

- (void)invalidate
{
}

@end