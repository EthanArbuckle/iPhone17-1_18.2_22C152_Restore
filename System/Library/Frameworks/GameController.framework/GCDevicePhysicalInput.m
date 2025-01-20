@interface GCDevicePhysicalInput
@end

@implementation GCDevicePhysicalInput

uint64_t __45___GCDevicePhysicalInput_updateWithElements___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) update:a2 forUsages:2 with:*(void *)(a1 + 40)];
}

double __60___GCDevicePhysicalInput_EventHandling__handleGamepadEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)-[_GCDevicePhysicalInputBase elements](a2);
  double v5 = NSTimeIntervalFromMachAbsoluteTime([*(id *)(a1 + 32) timestamp]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = __60___GCDevicePhysicalInput_EventHandling__handleGamepadEvent___block_invoke_2;
        v14[3] = &unk_26D22C978;
        uint64_t v12 = *(void *)(a1 + 32);
        v14[4] = v11;
        v14[5] = v12;
        *(double *)&v14[6] = v5;
        -[_GCDevicePhysicalInputTransaction mutableUpdateContextForElementAtIndex:withHandler:](a2, v8 + v10++, (uint64_t)v14);
      }
      while (v7 != v10);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      v8 += v10;
    }
    while (v7);
  }
  return v5;
}

uint64_t __60___GCDevicePhysicalInput_EventHandling__handleGamepadEvent___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) update:a2 forGamepadEvent:*(void *)(a1 + 40) withTimestamp:*(double *)(a1 + 48)];
  if (v6)
  {
    if (gc_isInternalBuild())
    {
      GCLogger = getGCLogger();
      if (os_log_type_enabled(GCLogger, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 138412802;
        uint64_t v11 = v9;
        __int16 v12 = 1040;
        int v13 = a3;
        __int16 v14 = 2098;
        uint64_t v15 = a2;
        _os_log_debug_impl(&dword_220998000, GCLogger, OS_LOG_TYPE_DEBUG, "[%@ handleGamepadEvent:] -> %{public}.*P", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
  return v6;
}

double __58___GCDevicePhysicalInput_EventHandling__handleMouseEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)-[_GCDevicePhysicalInputBase elements](a2);
  uint64_t v6 = *(void *)(a1 + 32);
  double v5 = (long long *)(a1 + 32);
  double v7 = NSTimeIntervalFromMachAbsoluteTime(v6);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  uint64_t v8 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = __58___GCDevicePhysicalInput_EventHandling__handleMouseEvent___block_invoke_2;
        v16[3] = &unk_26D22C9C8;
        v16[4] = v13;
        long long v17 = *v5;
        uint64_t v18 = *((void *)v5 + 2);
        double v19 = v7;
        -[_GCDevicePhysicalInputTransaction mutableUpdateContextForElementAtIndex:withHandler:](a2, v10 + v12++, (uint64_t)v16);
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      v10 += v12;
    }
    while (v9);
  }
  return v7;
}

uint64_t __58___GCDevicePhysicalInput_EventHandling__handleMouseEvent___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  double v7 = *(double *)(a1 + 64);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)(a1 + 40);
  *(void *)&v12[16] = *(void *)(a1 + 56);
  uint64_t v8 = [v6 update:a2 forMouseEvent:v12 withTimestamp:v7];
  if (v8)
  {
    if (gc_isInternalBuild())
    {
      GCLogger = getGCLogger();
      if (os_log_type_enabled(GCLogger, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v12 = 138412802;
        *(void *)&v12[4] = v11;
        *(_WORD *)&v12[12] = 1040;
        *(_DWORD *)&v12[14] = a3;
        *(_WORD *)&v12[18] = 2098;
        *(void *)&v12[20] = a2;
        _os_log_debug_impl(&dword_220998000, GCLogger, OS_LOG_TYPE_DEBUG, "[%@ handleMouseEvent:] -> %{public}.*P", v12, 0x1Cu);
      }
    }
  }
  return v8;
}

@end