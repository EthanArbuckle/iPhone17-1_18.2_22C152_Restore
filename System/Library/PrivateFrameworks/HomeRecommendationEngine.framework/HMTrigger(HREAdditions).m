@interface HMTrigger(HREAdditions)
+ (id)_hre_hashForPresenceEvent:()HREAdditions inHome:verbose:;
+ (id)hre_verboseHashForEvent:()HREAdditions inHome:;
- (id)hre_triggerComparisonIdentifierInHome:()HREAdditions;
@end

@implementation HMTrigger(HREAdditions)

- (id)hre_triggerComparisonIdentifierInHome:()HREAdditions
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  objc_opt_class();
  id v7 = a1;
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = [v9 events];
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __65__HMTrigger_HREAdditions__hre_triggerComparisonIdentifierInHome___block_invoke;
    v27 = &unk_264CF4B78;
    id v28 = v7;
    id v29 = v4;
    v11 = objc_msgSend(v10, "na_map:", &v24);
    v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_16];
    v13 = [v12 componentsJoinedByString:@"-"];
  }
  else
  {
    v13 = 0;
  }
  objc_opt_class();
  id v14 = v7;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    v17 = NSString;
    v18 = [v16 fireDate];
    v19 = [v16 recurrence];
    uint64_t v20 = [v17 stringWithFormat:@"%@-%@", v18, v19];

    v13 = (__CFString *)v20;
  }
  v21 = &stru_26EAB1AB0;
  if (v13) {
    v21 = v13;
  }
  v22 = [NSString stringWithFormat:@"%@-%@", v6, v21, v24, v25, v26, v27, v28];

  return v22;
}

+ (id)hre_verboseHashForEvent:()HREAdditions inHome:
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [v10 characteristic];
    v12 = objc_msgSend(v10, "hre_triggeringValues");
    uint64_t v13 = [v12 count];

    id v14 = NSString;
    id v15 = [v11 uniqueIdentifier];
    if (v13 != 1)
    {
      id v16 = [v10 thresholdRange];
      v17 = [v16 minValue];
      v22 = [v10 thresholdRange];
      v23 = [v22 maxValue];
      v21 = [v14 stringWithFormat:@"thresholdCharacteristic:%@, range:(min:%@, max:%@)", v15, v17, v23];

      goto LABEL_14;
    }
    objc_msgSend(v10, "hre_triggeringValues");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = [v16 firstObject];
    [v14 stringWithFormat:@"characteristic:%@, targetValue:%@", v15, v17];
  }
  else
  {
    objc_opt_class();
    id v11 = v8;
    if (objc_opt_isKindOfClass()) {
      v18 = v11;
    }
    else {
      v18 = 0;
    }
    id v19 = v18;

    if (!v19)
    {
      objc_opt_class();
      id v15 = v11;
      if (objc_opt_isKindOfClass()) {
        uint64_t v25 = v15;
      }
      else {
        uint64_t v25 = 0;
      }
      id v26 = v25;

      if (v26)
      {
        v27 = NSString;
        id v16 = [v26 significantEvent];
        id v28 = [v26 offset];
        v21 = [v27 stringWithFormat:@"timeEvent:%@, offset:%@", v16, v28];
      }
      else
      {
        objc_opt_class();
        id v29 = v15;
        if (objc_opt_isKindOfClass()) {
          v30 = v29;
        }
        else {
          v30 = 0;
        }
        id v16 = v30;

        if (v16) {
          objc_msgSend(a1, "_hre_hashForPresenceEvent:inHome:verbose:", v16, v7, 1);
        }
        else {
        v21 = [NSString stringWithFormat:@"%@", v29];
        }
        id v15 = 0;
      }
      id v11 = 0;
      goto LABEL_15;
    }
    id v15 = [v19 characteristic];
    uint64_t v20 = NSString;
    id v16 = [v15 uniqueIdentifier];
    v17 = [v19 triggerValue];
    [v20 stringWithFormat:@"characteristic:%@, targetValue:%@", v16, v17];
  v21 = };
LABEL_14:

LABEL_15:

  return v21;
}

+ (id)_hre_hashForPresenceEvent:()HREAdditions inHome:verbose:
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 presenceEventType];
  id v10 = [v8 users];
  id v11 = (void *)[v10 mutableCopy];

  v12 = [v8 currentUser];

  [v11 removeObject:v12];
  uint64_t v13 = &stru_26EAB1AB0;
  if ([v11 count] && a5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"userType:%lu", objc_msgSend(v7, "presenceUserType"));
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (![v11 count] || (a5 & 1) == 0)
  {
    uint64_t v14 = 2;
    if (v9 != 4) {
      uint64_t v14 = v9;
    }
    if (v9 == 3) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v14;
    }
  }
  id v15 = [NSString stringWithFormat:@"presenceEventType:%lu, %@", v9, v13];

  return v15;
}

@end