@interface HDFitnessMachineStatus
+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4;
+ (id)unitTest_fakeStatusUpdateForState:(unint64_t)a3;
+ (id)uuid;
- (id)description;
- (unint64_t)machineState;
- (void)setMachineState:(unint64_t)a3;
@end

@implementation HDFitnessMachineStatus

+ (id)uuid
{
  return +[CBUUID UUIDWithString:@"0x2ADA"];
}

+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(HDHealthServiceCharacteristic *)[HDFitnessMachineStatus alloc] _init];
  v7 = (char *)[v5 length];
  id v8 = v5;
  id v9 = [v8 bytes];

  id v20 = v9;
  if (v9 && v7)
  {
    v10 = &v7[(void)v9];
    int v11 = [(id)objc_opt_class() uint8FromData:&v20 before:v10];
    [v6 setMachineState:0];
    switch(v11)
    {
      case 1:
        v12 = v6;
        uint64_t v13 = 1;
        goto LABEL_15;
      case 2:
        unsigned int v16 = [(id)objc_opt_class() uint8FromData:&v20 before:v10];
        if (v20)
        {
          int v17 = v16;
          if (v16 == 2)
          {
            v12 = v6;
            uint64_t v13 = 3;
          }
          else
          {
            if (v16 != 1)
            {
              _HKInitializeLogging();
              v19 = HKLogServices;
              if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
                sub_417E8(v17, v19);
              }
              goto LABEL_16;
            }
            v12 = v6;
            uint64_t v13 = 2;
          }
LABEL_15:
          [v12 setMachineState:v13];
LABEL_16:
          id v14 = v6;
          goto LABEL_17;
        }
        +[NSError hk_assignError:a4, 303, @"Insufficient data (%lu bytes) for stopped or paused by user fitness machine status.", v7 code format];
        break;
      case 3:
        v12 = v6;
        uint64_t v13 = 4;
        goto LABEL_15;
      case 4:
        v12 = v6;
        uint64_t v13 = 5;
        goto LABEL_15;
      default:
        _HKInitializeLogging();
        v15 = HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
          sub_41770(v11, v15);
        }
        goto LABEL_16;
    }
  }
  else
  {
    +[NSError hk_assignError:a4, 303, @"Insufficient data (%lu bytes) for fitness machine status.", v7 code format];
  }
  id v14 = 0;
LABEL_17:

  return v14;
}

- (id)description
{
  unint64_t machineState = self->_machineState;
  if (machineState > 5) {
    CFStringRef v3 = &stru_61AE0;
  }
  else {
    CFStringRef v3 = off_61650[machineState];
  }
  v4 = [(id)objc_opt_class() uuid];
  id v5 = +[NSString stringWithFormat:@"Fitness Machine Status(%@) %@", v4, v3];

  return v5;
}

+ (id)unitTest_fakeStatusUpdateForState:(unint64_t)a3
{
  id v4 = [(HDHealthServiceCharacteristic *)[HDFitnessMachineStatus alloc] _init];
  [v4 setMachineState:a3];

  return v4;
}

- (unint64_t)machineState
{
  return self->_machineState;
}

- (void)setMachineState:(unint64_t)a3
{
  self->_unint64_t machineState = a3;
}

@end