@interface UIEvent(PKAdditions)
- (const)PK_isEventFromCrayon;
- (const)PK_isEventFromPencil;
- (uint64_t)PK_activeInputPropertiesForTouch:()PKAdditions;
@end

@implementation UIEvent(PKAdditions)

- (const)PK_isEventFromPencil
{
  CFArrayRef result = (const __CFArray *)[a1 _hidEvent];
  if (result)
  {
    CFArrayRef result = (const __CFArray *)IOHIDEventGetChildren();
    if (result)
    {
      CFArrayRef v2 = result;
      if (CFArrayGetCount(result)
        && (CFArrayGetValueAtIndex(v2, 0), IOHIDEventGetType() == 11))
      {
        return (const __CFArray *)(IOHIDEventGetIntegerValue() == 0);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (const)PK_isEventFromCrayon
{
  CFArrayRef result = (const __CFArray *)[a1 _hidEvent];
  if (result)
  {
    CFArrayRef result = (const __CFArray *)objc_msgSend(a1, "PK_isEventFromPencil");
    if (result)
    {
      CFArrayRef result = (const __CFArray *)IOHIDEventGetChildren();
      if (result)
      {
        CFArrayRef v3 = result;
        if (CFArrayGetCount(result)
          && (CFArrayGetValueAtIndex(v3, 0), IOHIDEventGetType() == 11))
        {
          return (const __CFArray *)(IOHIDEventGetIntegerValue() == 11);
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)PK_activeInputPropertiesForTouch:()PKAdditions
{
  id v4 = a3;
  if (objc_msgSend(a1, "PK_isEventFromPencil"))
  {
    if ([v4 estimatedProperties])
    {
      v6 = [v4 estimationUpdateIndex];

      if (v6) {
        uint64_t v5 = 23;
      }
      else {
        uint64_t v5 = 19;
      }
    }
    else
    {
      uint64_t v5 = 23;
    }
  }
  else
  {
    uint64_t v5 = 8;
  }

  return v5;
}

@end