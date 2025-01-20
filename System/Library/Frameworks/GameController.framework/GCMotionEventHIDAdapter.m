@interface GCMotionEventHIDAdapter
@end

@implementation GCMotionEventHIDAdapter

void __51___GCMotionEventHIDAdapter_initWithSource_service___block_invoke(uint64_t a1)
{
  if (IOHIDEventGetType() == 1)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v3 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 65280 && v3 == 59)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (!v4 || v4 == IOHIDEventGetSenderID() || IOHIDEventGetSenderID() == -1)
      {
        v5 = objc_opt_new();
        [v5 setTimestamp:IOHIDEventGetTimeStamp()];
        v6 = IOHIDEventGetChildren();
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v22;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v6);
              }
              int Type = IOHIDEventGetType();
              switch(Type)
              {
                case 10:
                  [v5 setHasAttitude:1];
                  IOHIDEventGetFloatValue();
                  objc_msgSend(v5, "setAttitudeX:");
                  IOHIDEventGetFloatValue();
                  objc_msgSend(v5, "setAttitudeY:");
                  IOHIDEventGetFloatValue();
                  objc_msgSend(v5, "setAttitudeZ:");
                  IOHIDEventGetFloatValue();
                  objc_msgSend(v5, "setAttitudeW:");
                  break;
                case 13:
                  [v5 setHasAccelerometer:1];
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setAccelerometerX:");
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setAccelerometerY:");
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setAccelerometerZ:");
                  break;
                case 20:
                  [v5 setHasGyro:1];
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setGyroPitch:");
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setGyroYaw:");
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setGyroRoll:");
                  break;
              }
              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
          }
          while (v8);
        }
        v12 = objc_getProperty(*(id *)(a1 + 40), sel_observers, 24, 1);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v18;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v18 != v15) {
                objc_enumerationMutation(v12);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v16++) + 16))();
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v14);
        }
      }
    }
  }
}

void __48___GCMotionEventHIDAdapter_observeMotionEvents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  uint64_t v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    do
    {
      v5 = [*(id *)(a1 + 32) observers];
      v6 = (void *)[v5 mutableCopy];

      uint64_t v7 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      [v6 removeObject:v7];

      [*(id *)(a1 + 32) setObservers:v6];
      uint64_t v8 = [*(id *)(a1 + 32) observers];
      uint64_t v9 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      char v10 = [v8 containsObject:v9];
    }
    while ((v10 & 1) != 0);
  }
}

@end