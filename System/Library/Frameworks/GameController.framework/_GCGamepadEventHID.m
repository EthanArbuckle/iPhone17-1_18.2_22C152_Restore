@interface _GCGamepadEventHID
- (BOOL)hasValidValueForElement:(int64_t)a3;
- (_GCGamepadEventHID)initWithHIDEvent:(__IOHIDEvent *)a3;
- (__IOHIDEvent)event;
- (float)floatValueForElement:(int64_t)a3;
- (unint64_t)timestamp;
- (void)dealloc;
@end

@implementation _GCGamepadEventHID

- (_GCGamepadEventHID)initWithHIDEvent:(__IOHIDEvent *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)_GCGamepadEventHID;
  v4 = [(_GCGamepadEventHID *)&v18 init];
  if (v4)
  {
    v4->_event = (__IOHIDEvent *)CFRetain(a3);
    if (IOHIDEventGetType() == 35)
    {
      IOHIDEventGetChildren();
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = *(__IOHIDEvent **)(*((void *)&v14 + 1) + 8 * i);
            uint64_t IntegerValue = IOHIDEventGetIntegerValue();
            uint64_t v12 = IOHIDEventGetIntegerValue();
            if (IntegerValue == 65280 && v12 == 67)
            {
              v4->_extendedEvent = v10;
              goto LABEL_14;
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
  }
  return v4;
}

- (void)dealloc
{
  self->_extendedEvent = 0;
  CFRelease(self->_event);
  self->_event = 0;
  v3.receiver = self;
  v3.super_class = (Class)_GCGamepadEventHID;
  [(_GCGamepadEventHID *)&v3 dealloc];
}

- (unint64_t)timestamp
{
  return IOHIDEventGetTimeStamp();
}

- (BOOL)hasValidValueForElement:(int64_t)a3
{
  if (self->_extendedEvent)
  {
    LOBYTE(v3) = 1;
  }
  else if ((unint64_t)a3 >= 0x2F)
  {
    uint64_t v6 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v6 handleFailureInMethod:a2 object:self file:@"_GCGamepadEventImpl.m" lineNumber:342 description:@"Unknown element"];

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x7E00003FFFFFuLL >> a3) & 1;
  }
  return v3;
}

- (float)floatValueForElement:(int64_t)a3
{
  if (self->_extendedEvent)
  {
    uint64_t DataValue = IOHIDEventGetDataValue();
    if (a3 > 46)
    {
      v10 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      [v10 handleFailureInMethod:a2 object:self file:@"_GCGamepadEventImpl.m" lineNumber:376 description:@"Unknown element"];

      return 0.0;
    }
    else
    {
      return *(float *)(DataValue + 4 * a3 + 8);
    }
  }
  else
  {
    float v7 = 0.0;
    switch(a3)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 18:
      case 19:
      case 20:
      case 21:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
        IOHIDEventGetFloatValue();
        return v14;
      case 10:
      case 11:
        IOHIDEventGetFloatValue();
        float v9 = v8;
        if (a3 != 10) {
          goto LABEL_9;
        }
        goto LABEL_6;
      case 12:
      case 13:
        IOHIDEventGetFloatValue();
        float v9 = v11;
        if (a3 != 13) {
          goto LABEL_9;
        }
        goto LABEL_6;
      case 14:
      case 15:
        IOHIDEventGetFloatValue();
        float v9 = v12;
        if (a3 != 14) {
          goto LABEL_9;
        }
        goto LABEL_6;
      case 16:
      case 17:
        IOHIDEventGetFloatValue();
        float v9 = v13;
        if (a3 == 17)
        {
LABEL_6:
          float v7 = fmaxf(v9, 0.0);
        }
        else
        {
LABEL_9:
          if (v9 >= 0.0) {
            float v7 = 0.0;
          }
          else {
            float v7 = -v9;
          }
        }
        break;
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
        return v7;
      default:
        long long v16 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
        [v16 handleFailureInMethod:a2 object:self file:@"_GCGamepadEventImpl.m" lineNumber:491 description:@"Unknown element"];

        break;
    }
  }
  return v7;
}

- (__IOHIDEvent)event
{
  return self->_event;
}

@end