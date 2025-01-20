@interface AMDHealthKitWorkoutEvent
+ (BOOL)validateInput:(id)a3;
+ (id)fetchRequest;
- (void)populateRecord:(id)a3;
@end

@implementation AMDHealthKitWorkoutEvent

+ (BOOL)validateInput:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(id *)(__b[1] + 8 * v8);
      id v4 = (id)[v22 objectForKey:0x26BEB24D8];
      char v19 = 0;
      char v17 = 0;
      char v15 = 0;
      char v13 = 0;
      BOOL v5 = 1;
      if (v4)
      {
        id v20 = (id)[v22 objectForKey:@"eventType"];
        char v19 = 1;
        BOOL v5 = 1;
        if (v20)
        {
          id v18 = (id)[v22 objectForKey:@"isFirstPartyDonation"];
          char v17 = 1;
          BOOL v5 = 1;
          if (v18)
          {
            id v16 = (id)[v22 objectForKey:@"isIndoor"];
            char v15 = 1;
            BOOL v5 = 1;
            if (v16)
            {
              id v14 = (id)[v22 objectForKey:@"isUpdate"];
              char v13 = 1;
              BOOL v5 = v14 == 0;
            }
          }
        }
      }
      if (v13) {

      }
      if (v15) {
      if (v17)
      }

      if (v19) {
      if (v5)
      }
        break;
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
        if (!v9) {
          goto LABEL_22;
        }
      }
    }
    char v24 = 0;
    int v12 = 1;
  }
  else
  {
LABEL_22:
    int v12 = 0;
  }

  if (!v12) {
    char v24 = 1;
  }
  objc_storeStrong(location, 0);
  return v24 & 1;
}

- (void)populateRecord:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = v20;
  id v17 = (id)[location[0] valueForKey:0x26BEB24D8];
  -[AMDHealthKitWorkoutEvent setEventTime:](v16, "setEventTime:", [v17 unsignedLongLongValue]);

  id v18 = (id)[location[0] valueForKey:@"activityType"];
  if (v18)
  {
    id v14 = v20;
    id v15 = (id)[location[0] valueForKey:@"activityType"];
    -[AMDHealthKitWorkoutEvent setActivityType:](v14, "setActivityType:");
  }
  id v13 = (id)[location[0] valueForKey:@"activityUUID"];

  if (v13)
  {
    uint64_t v11 = v20;
    id v12 = (id)[location[0] valueForKey:@"activityUUID"];
    -[AMDHealthKitWorkoutEvent setActivityUUID:](v11, "setActivityUUID:");
  }
  v3 = v20;
  id v4 = (id)[location[0] valueForKey:@"eventType"];
  -[AMDHealthKitWorkoutEvent setEventType:](v3, "setEventType:", (__int16)[v4 unsignedShortValue]);

  BOOL v5 = v20;
  id v6 = (id)[location[0] valueForKey:@"isFirstPartyDonation"];
  -[AMDHealthKitWorkoutEvent setIsFirstPartyDonation:](v5, "setIsFirstPartyDonation:", [v6 BOOLValue] & 1);

  uint64_t v7 = v20;
  id v8 = (id)[location[0] valueForKey:@"isIndoor"];
  -[AMDHealthKitWorkoutEvent setIsIndoor:](v7, "setIsIndoor:", [v8 BOOLValue] & 1);

  unint64_t v9 = v20;
  id v10 = (id)[location[0] valueForKey:@"isUpdate"];
  -[AMDHealthKitWorkoutEvent setIsUpdate:](v9, "setIsUpdate:", [v10 BOOLValue] & 1);

  objc_storeStrong(location, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDHealthKitWorkoutEvent", a2, a1);
}

@end