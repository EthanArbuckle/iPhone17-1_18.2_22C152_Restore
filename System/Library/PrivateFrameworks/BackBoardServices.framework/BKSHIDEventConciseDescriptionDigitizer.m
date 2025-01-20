@interface BKSHIDEventConciseDescriptionDigitizer
@end

@implementation BKSHIDEventConciseDescriptionDigitizer

void ___BKSHIDEventConciseDescriptionDigitizer_block_invoke(uint64_t a1, void *a2)
{
}

void ___BKSHIDEventConciseDescriptionDigitizer_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int Type = IOHIDEventGetType();
  v5 = *(void **)(a1 + 32);
  if (Type == 11)
  {
    id v6 = v5;
    if (IOHIDEventGetType() == 11)
    {
      uint64_t IntegerValue = IOHIDEventGetIntegerValue();
      IOHIDEventGetFloatValue();
      double v9 = v8;
      IOHIDEventGetFloatValue();
      double v11 = v10;
      id v12 = (id)[v6 appendInteger:IntegerValue withName:@"path"];
      id v13 = (id)objc_msgSend(v6, "appendPoint:withName:", 0, v9, v11);
      _BKSHIDEventAppendEventFlags((uint64_t)v3, v6);
    }
    else
    {
      [v6 appendString:IOHIDEventTypeGetName() withName:0];
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < *(void *)(a1 + 56))
    {
      v14 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
      v15 = v14;
      if (v14)
      {
        uint64_t v16 = [v14 pathIndex];
        if (v16 == IOHIDEventGetIntegerValue())
        {
          id v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:format:", objc_msgSend(v15, "touchIdentifier"), @"touchID", 1);
          uint64_t v18 = [v15 hitTestContextCategory];
          if (v18)
          {
            v19 = *(void **)(a1 + 32);
            v20 = NSStringFromBKSTouchHitTestContextCategory(v18);
            [v19 appendString:v20 withName:@"hcat"];
          }
          unsigned int v21 = [v15 locus];
          if (v21)
          {
            v22 = *(void **)(a1 + 32);
            v23 = NSStringFromBKSHIDTouchLocus(v21);
            [v22 appendString:v23 withName:0];
          }
          v24 = *(void **)(a1 + 32);
          [v15 preciseLocation];
          id v25 = (id)objc_msgSend(v24, "appendPoint:withName:", 0);
          v26 = [v15 authenticationMessage];

          if (v26) {
            [*(id *)(a1 + 32) appendString:@"auth" withName:0];
          }
          v27 = [v15 securityAnalysis];

          if (v27) {
            [*(id *)(a1 + 32) appendString:@"sa" withName:0];
          }
        }
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = ___BKSHIDEventConciseDescriptionDigitizer_block_invoke_3;
    v28[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
    v28[4] = v3;
    [v5 appendCustomFormatWithName:@":" block:v28];
  }
}

void ___BKSHIDEventConciseDescriptionDigitizer_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  BKSHIDEventGetConciseDescription(v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 appendString:v4];
}

@end