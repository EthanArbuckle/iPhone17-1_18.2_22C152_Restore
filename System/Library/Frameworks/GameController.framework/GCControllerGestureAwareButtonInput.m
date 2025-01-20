@interface GCControllerGestureAwareButtonInput
@end

@implementation GCControllerGestureAwareButtonInput

void __68___GCControllerGestureAwareButtonInput_registerSetValueEvent_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = objc_opt_new();
    v4 = +[NSDate date];
    [v4 timeIntervalSince1970];
    *(void *)(v3 + 8) = v5;

    float v6 = *(float *)(a1 + 56);
    [*(id *)(a1 + 32) deadzone];
    *(unsigned char *)(v3 + 16) = v6 > v7;
    if (([*(id *)(a1 + 32) isDoublePressGestureRecognizerEnabled] & 1) == 0) {
      *(unsigned char *)(v3 + 20) = 1;
    }
    if (([*(id *)(a1 + 32) isSinglePressGestureRecognizerEnabled] & 1) == 0) {
      *(unsigned char *)(v3 + 21) = 1;
    }
    if (([*(id *)(a1 + 32) isLongPressGestureRecognizerEnabled] & 1) == 0) {
      *(unsigned char *)(v3 + 19) = 1;
    }
    if ([*(id *)(a1 + 32) isDoublePressGestureRecognizerEnabled])
    {
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_executeDoublePressRecognizerForEvent:queue:", v3, *(void *)(a1 + 40));
    }
    else
    {
      if (gc_isInternalBuild())
      {
        v8 = getGCLogger();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v9 = *(unsigned __int8 *)(v3 + 16);
          int v14 = 67109120;
          int v15 = v9;
          _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected double press)", (uint8_t *)&v14, 8u);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_forwardEvent:queue:", v3, *(void *)(a1 + 40));
    }
    if ([*(id *)(a1 + 32) isSinglePressGestureRecognizerEnabled])
    {
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_executeSinglePressRecognizerForEvent:queue:", v3, *(void *)(a1 + 40));
    }
    else
    {
      if (gc_isInternalBuild())
      {
        v10 = getGCLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = *(unsigned __int8 *)(v3 + 16);
          int v14 = 67109120;
          int v15 = v11;
          _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected single press)", (uint8_t *)&v14, 8u);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_forwardEvent:queue:", v3, *(void *)(a1 + 40));
    }
    if ([*(id *)(a1 + 32) isLongPressGestureRecognizerEnabled])
    {
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_executeLongPressRecognizerForEvent:queue:", v3, *(void *)(a1 + 40));
    }
    else
    {
      if (gc_isInternalBuild())
      {
        v12 = getGCLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v13 = *(unsigned __int8 *)(v3 + 16);
          int v14 = 67109120;
          int v15 = v13;
          _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected long press)", (uint8_t *)&v14, 8u);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_forwardEvent:queue:", v3, *(void *)(a1 + 40));
    }
  }
}

void __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 20) = 1;
  if (gc_isInternalBuild())
  {
    uint64_t v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 67109120;
      int v7 = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected double press)", buf, 8u);
    }
  }
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[17] && v2[18] && v2[19])
  {
    v2[17] = 1;
    if (*(void *)(*(void *)(a1 + 40) + 248))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke_115;
      block[3] = &unk_26D22A8C0;
      block[4] = *(void *)(a1 + 40);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "__onqueue_forwardEvent:queue:");
  }
}

uint64_t __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke_115(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "Double recognizer failed, triggering single press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 248) + 16))();
}

uint64_t __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke_116(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "Triggering multi press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 240) + 16))();
}

void __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 17))
  {
    if (gc_isInternalBuild())
    {
      v2 = getGCLogger();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_INFO, "[GESTURE] Long press recognized after delay", buf, 2u);
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 17) = 1;
    if (*(void *)(*(void *)(a1 + 40) + 232))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_117;
      block[3] = &unk_26D22A8C0;
      block[4] = *(void *)(a1 + 40);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

uint64_t __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_117(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "Triggering long press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 232) + 16))();
}

uint64_t __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_118(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "Triggering long press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 232) + 16))();
}

uint64_t __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_119(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "Long press recognizer failed, triggering single press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 248) + 16))();
}

uint64_t __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_120(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected long press)", (uint8_t *)v5, 8u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "__onqueue_forwardEvent:queue:", *(void *)(a1 + 32), *(void *)(a1 + 48));
}

uint64_t __93___GCControllerGestureAwareButtonInput___onqueue_executeSinglePressRecognizerForEvent_queue___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "Directly triggering single press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 248) + 16))();
}

uint64_t __93___GCControllerGestureAwareButtonInput___onqueue_executeSinglePressRecognizerForEvent_queue___block_invoke_121(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected single press)", (uint8_t *)v5, 8u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "__onqueue_forwardEvent:queue:", *(void *)(a1 + 32), *(void *)(a1 + 48));
}

@end