@interface CFMachPortCreateWithPort4
@end

@implementation CFMachPortCreateWithPort4

void ___CFMachPortCreateWithPort4_block_invoke(uint64_t a1)
{
  _cfmp_source_invalidated(0, *(_DWORD *)(a1 + 40));
  v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

void ___CFMachPortCreateWithPort4_block_invoke_2(uint64_t a1)
{
  block[6] = *(void *)off_1ECE0A5B0;
  _cfmp_source_record_deadness(0, *(_DWORD *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)&__CFAllMachPortsLock);
  if (__CFAllMachPorts)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)__CFAllMachPorts);
    if (Count >= 1)
    {
      CFIndex v2 = Count;
      for (CFIndex i = 0; i < v2; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)__CFAllMachPorts, i);
        if (ValueAtIndex)
        {
          v5 = ValueAtIndex;
          if (!__CFMachPortCheck(ValueAtIndex[5]) || CFGetRetainCount(v5) == 1)
          {
            if (!v5[4])
            {
              os_unfair_lock_lock((os_unfair_lock_t)v5 + 24);
              if (v5[4])
              {
                os_unfair_lock_unlock((os_unfair_lock_t)v5 + 24);
              }
              else
              {
                v5[4] = 1;
                __dmb(0xBu);
                v6 = *((void *)v5 + 3);
                if (v6)
                {
                  dispatch_source_cancel(v6);
                  *((void *)v5 + 3) = 0;
                }
                uint64_t v7 = *((void *)v5 + 5);
                *((void *)v5 + 5) = 0;
                CFRetain(v5);
                os_unfair_lock_unlock((os_unfair_lock_t)v5 + 24);
                block[0] = off_1ECE0A5A0;
                block[1] = 3221225472;
                block[2] = ____CFMachPortChecker_block_invoke;
                block[3] = &__block_descriptor_48_e5_v8__0l;
                block[4] = v5;
                block[5] = v7;
                dispatch_async((dispatch_queue_t)off_1ECE0A5E0, block);
              }
            }
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)__CFAllMachPorts, i--);
            --v2;
          }
        }
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__CFAllMachPortsLock);
}

@end