@interface HIDEvent(HIDFramework)
- (BOOL)conformsToEventType:()HIDFramework;
- (BOOL)isEqualToHIDEvent:()HIDFramework;
- (id)serialize:()HIDFramework error:;
- (uint64_t)appendEvent:()HIDFramework;
- (uint64_t)children;
- (uint64_t)copyWithZone:()HIDFramework;
- (uint64_t)dataValueForField:()HIDFramework;
- (uint64_t)doubleValueForField:()HIDFramework;
- (uint64_t)initWithBytes:()HIDFramework length:;
- (uint64_t)initWithData:()HIDFramework;
- (uint64_t)integerValueForField:()HIDFramework;
- (uint64_t)isEqual:()HIDFramework;
- (uint64_t)options;
- (uint64_t)parent;
- (uint64_t)removeEvent:()HIDFramework;
- (uint64_t)senderID;
- (uint64_t)setDoubleValue:()HIDFramework forField:;
- (uint64_t)setIntegerValue:()HIDFramework forField:;
- (uint64_t)setOptions:()HIDFramework;
- (uint64_t)setTimestamp:()HIDFramework;
- (uint64_t)timestamp;
- (uint64_t)type;
- (void)initWithType:()HIDFramework timestamp:senderID:;
- (void)removeAllEvents;
@end

@implementation HIDEvent(HIDFramework)

- (uint64_t)type
{
  return MEMORY[0x1F40E8A38]();
}

- (uint64_t)timestamp
{
  return MEMORY[0x1F40E8A28]();
}

- (uint64_t)options
{
  return MEMORY[0x1F40E89E8]();
}

- (uint64_t)integerValueForField:()HIDFramework
{
  return IOHIDEventGetIntegerValue();
}

- (void)initWithType:()HIDFramework timestamp:senderID:
{
  v2 = (void *)IOHIDEventCreate();

  if (v2)
  {
    IOHIDEventSetSenderID();
    id v3 = v2;
  }

  return v2;
}

- (uint64_t)initWithData:()HIDFramework
{
  uint64_t v4 = MEMORY[0x1E01914A0](*MEMORY[0x1E4F1CF80], a3);

  return v4;
}

- (uint64_t)initWithBytes:()HIDFramework length:
{
  uint64_t v5 = MEMORY[0x1E0191490](*MEMORY[0x1E4F1CF80], a3, a4);

  return v5;
}

- (uint64_t)copyWithZone:()HIDFramework
{
  return MEMORY[0x1F40E8900](*MEMORY[0x1E4F1CF80], a1);
}

- (BOOL)isEqualToHIDEvent:()HIDFramework
{
  return a3 && _IOHIDEventEqual() != 0;
}

- (uint64_t)isEqual:()HIDFramework
{
  id v4 = a3;
  if (a1 == v4)
  {
    uint64_t v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = [a1 isEqualToHIDEvent:v4];
    }
    else {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)serialize:()HIDFramework error:
{
  if (a3)
  {
    Data = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    Data = (void *)IOHIDEventCreateData();
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!Data)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithIOReturn:3758097084];
  }
LABEL_7:
  return Data;
}

- (uint64_t)setIntegerValue:()HIDFramework forField:
{
  return MEMORY[0x1F40E8A80](a1, a4);
}

- (uint64_t)doubleValueForField:()HIDFramework
{
  return MEMORY[0x1F40E89D8](a1, a3);
}

- (uint64_t)setDoubleValue:()HIDFramework forField:
{
  return MEMORY[0x1F40E8A68](a1, a3);
}

- (uint64_t)dataValueForField:()HIDFramework
{
  return MEMORY[0x1F40E89D0](a1, a3);
}

- (uint64_t)appendEvent:()HIDFramework
{
  return MEMORY[0x1F40E88D8](a1, a3, 0);
}

- (uint64_t)removeEvent:()HIDFramework
{
  return IOHIDEventRemoveEvent();
}

- (void)removeAllEvents
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "children", 0, 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        IOHIDEventRemoveEvent();
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)conformsToEventType:()HIDFramework
{
  return IOHIDEventConformsTo() != 0;
}

- (uint64_t)setTimestamp:()HIDFramework
{
  return MEMORY[0x1F40E8A98](a1, a3);
}

- (uint64_t)senderID
{
  return MEMORY[0x1F40E8A20]();
}

- (uint64_t)setOptions:()HIDFramework
{
  return MEMORY[0x1F40E8A70](a1, a3);
}

- (uint64_t)parent
{
  return MEMORY[0x1F40E8A10]();
}

- (uint64_t)children
{
  return MEMORY[0x1F40E89C8]();
}

@end