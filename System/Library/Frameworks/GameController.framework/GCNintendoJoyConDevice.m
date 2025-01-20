@interface GCNintendoJoyConDevice
@end

@implementation GCNintendoJoyConDevice

void __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

void __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_3;
  v3[3] = &unk_26D22B6B8;
  v3[4] = v2;
  id v4 = v1;
  [v4 connectToDeviceService:&unk_26D2B3DA8 withClient:v2 reply:v3];
}

void __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2 && gc_isInternalBuild())
  {
    uint64_t v6 = a1;
    v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(v6 + 32);
      uint64_t v9 = *(void *)(v6 + 40);
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'JoyCon Fusion Gesture Service' on connection %@: %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

void __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_101(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_2_103;
  v6[3] = &unk_26D22B6E0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 connectToDeviceService:&unk_26D2B3E08 withClient:v3 reply:v6];

  objc_destroyWeak(&v8);
}

void __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_2_103(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_storeStrong(WeakRetained + 9, a2);
      int v10 = [v9 readBattery];
      [v9 propagateBattery:v10];
    }
    else if (gc_isInternalBuild())
    {
      uint64_t v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        int v14 = 138412802;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Battery Service' on connection %@: %@", (uint8_t *)&v14, 0x20u);
      }
    }
  }
}

void __46___GCNintendoJoyConDevice_Client___addClient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeClient:v2];
}

intptr_t __50___GCNintendoJoyConDevice_Components__readBattery__block_invoke(uint64_t a1, unsigned int a2, unsigned int a3)
{
  id v6 = [GCDeviceBattery alloc];
  *(float *)&double v7 = (float)a2;
  uint64_t v8 = [(GCDeviceBattery *)v6 initWithLevel:a3 batteryState:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v11);
}

void __56___GCNintendoJoyConDevice_Components__propagateBattery___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*((void *)WeakRetained + 8) + 16))();
    id v2 = v3;
  }
}

void __62___GCNintendoJoyConDevice_Fusion__homeButtonLongPressGesture___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained device:*(void *)(a1 + 32) fusionGestureActive:*(unsigned __int8 *)(a1 + 40)];
}

@end