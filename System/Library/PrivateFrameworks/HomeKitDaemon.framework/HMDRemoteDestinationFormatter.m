@interface HMDRemoteDestinationFormatter
+ (id)defaultFormatter;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (id)stringForObjectValue:(id)a3;
@end

@implementation HMDRemoteDestinationFormatter

+ (id)defaultFormatter
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  if (a5)
  {
    v5 = @"String does not appear to be valid remote destination";
    if (!a4) {
      v5 = @"Invalid parameter 'string'";
    }
    *a5 = v5;
  }
  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = v6;
    if (self)
    {
      v8 = +[HMDAccountRegistry sharedRegistry];
      v9 = [v8 deviceForDevice:v7];

      v10 = [v9 account];
      if ([v10 isCurrentAccount])
      {
        v11 = [v9 localHandles];
        if (!objc_msgSend(v11, "hmf_isEmpty"))
        {
          v20 = [v11 firstObject];
          v12 = [v20 destination];

          goto LABEL_23;
        }
      }
      v12 = [v9 remoteDestinationString];
LABEL_23:

      goto LABEL_35;
    }
    goto LABEL_34;
  }
  id v13 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v7 = v14;

  if (v7)
  {
    uint64_t v15 = [v7 device];
LABEL_15:
    v16 = (void *)v15;
    uint64_t v17 = [(HMDRemoteDestinationFormatter *)self stringForObjectValue:v15];
LABEL_21:
    v12 = (void *)v17;

    goto LABEL_35;
  }
  id v18 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v7 = v19;

  if (v7)
  {
    v16 = [v7 primaryHandle];
    uint64_t v17 = __destinationForAccountHandle((uint64_t)self, v16);
    goto LABEL_21;
  }
  id v21 = v18;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v7 = v22;

  if (v7)
  {
    v12 = __destinationForAccountHandle((uint64_t)self, v7);
    goto LABEL_35;
  }
  id v23 = v21;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v7 = v24;

  if (v7)
  {
    uint64_t v15 = [v7 handle];
    goto LABEL_15;
  }
LABEL_34:
  v12 = 0;
LABEL_35:

  return v12;
}

@end