@interface HSSetupStateMachineCHIPPartnerEcosystem
- (BOOL)_sync_shouldSkipStep:(int64_t)a3 withConfiguration:(id)a4;
- (Class)configurationObjectClass;
- (int64_t)stepFollowingStep:(int64_t)a3 withConfiguration:(id)a4;
@end

@implementation HSSetupStateMachineCHIPPartnerEcosystem

- (Class)configurationObjectClass
{
  return (Class)objc_opt_class();
}

- (int64_t)stepFollowingStep:(int64_t)a3 withConfiguration:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
    if (!v9)
    {
      v10 = +[NSAssertionHandler currentHandler];
      v11 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v9 = 0;
  }

  v12 = [v9 pairingError];

  if (!v12)
  {
    v14 = sub_100049CCC();
    v15 = +[NSNumber numberWithInteger:a3];
    id v16 = [v14 indexOfObject:v15];

    if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10006806C(v17);
      }
    }
    else
    {
      unint64_t v18 = (unint64_t)v16 + 1;
      if (v18 < (unint64_t)[v14 count])
      {
        v19 = [v14 objectAtIndexedSubscript:v18];
        int v20 = [v19 intValue];

        if (v20 >= 10) {
          [v9 setIsReadyToPair:1];
        }
        v21 = [v14 objectAtIndexedSubscript:v18];
        int64_t v13 = (int)[v21 intValue];

        goto LABEL_20;
      }
      v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000680F0(v17);
      }
    }

    int64_t v13 = 53;
LABEL_20:

    goto LABEL_21;
  }
  int64_t v13 = 53;
LABEL_21:

  return v13;
}

- (BOOL)_sync_shouldSkipStep:(int64_t)a3 withConfiguration:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
    if (!v9)
    {
      v10 = +[NSAssertionHandler currentHandler];
      v11 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v9 = 0;
  }

  BOOL v12 = 0;
  switch(a3)
  {
    case 1:
    case 4:
      int64_t v13 = [v9 setupDescription];
      v14 = [v13 setupAccessoryPayload];

      if (v14) {
        goto LABEL_14;
      }
      v15 = [v9 delegate];
      id v16 = [v15 stateMachineConfigurationGetDiscoveredAccessory:v9];

      v17 = [v9 delegate];
      unint64_t v18 = [v17 stateMachineConfigurationGetSetupCode:v9];

      BOOL v12 = v16 && ![v16 requiresSetupCode] || [v18 length] != 0;
      goto LABEL_21;
    case 2:
    case 3:
      v19 = [v9 setupDescription];
      int v20 = [v19 setupAccessoryPayload];

      if (v20)
      {
LABEL_14:
        BOOL v12 = 1;
      }
      else
      {
        v25 = [v9 delegate];
        id v16 = [v25 stateMachineConfigurationGetDiscoveredAccessory:v9];

        BOOL v12 = v16 != 0;
LABEL_22:
      }
LABEL_23:

      return v12;
    case 6:
      id v16 = [v9 matterDeviceSetupRequest];
      unint64_t v18 = [v16 topology];
      v21 = [v18 homes];
      if (v21)
      {
        v22 = [v9 matterDeviceSetupRequest];
        v23 = [v22 topology];
        v24 = [v23 homes];
        BOOL v12 = (unint64_t)[v24 count] < 2;
      }
      else
      {
        BOOL v12 = 1;
      }
      goto LABEL_20;
    case 14:
      id v16 = [v9 matterDeviceSetupRequest];
      unint64_t v18 = [v16 topology];
      v21 = [v18 homes];
      BOOL v12 = [v21 count] == 0;
LABEL_20:

LABEL_21:
      goto LABEL_22;
    default:
      goto LABEL_23;
  }
}

@end