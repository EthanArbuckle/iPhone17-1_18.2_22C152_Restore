@interface HMDAccountHandleFormatter
+ (id)defaultFormatter;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (id)accountHandleFromString:(id)a3;
- (id)privateStringForObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation HMDAccountHandleFormatter

+ (id)defaultFormatter
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (id)privateStringForObjectValue:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = v4;
  if (!v6)
  {
    id v8 = v4;
    objc_opt_class();
    id v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
    id v10 = v9;

    v7 = [(HMDAccountHandleFormatter *)self accountHandleFromString:v10];

    if (!v7) {
      goto LABEL_14;
    }
  }
  uint64_t v11 = [v7 type];
  if (v11 == 2)
  {
    v12 = [v7 URI];
    v23 = [v12 unprefixedURI];
    v14 = self;
    id v15 = v23;
    uint64_t v24 = MEMORY[0x230FBD990]();
    uint64_t v25 = [v15 length];
    BOOL v26 = [v15 characterAtIndex:0] == 43;
    BOOL v27 = (unint64_t)(v25 - v26) >= 4;
    uint64_t v28 = v25 - v26 - 4;
    if (v28 != 0 && v27)
    {
      v60 = v14;
      uint64_t v37 = v24;
      v38 = v12;
      v39 = [MEMORY[0x263F089D8] string];
      if (v28 >= 1)
      {
        uint64_t v40 = v28;
        do
        {
          [v39 appendString:@"."];
          --v40;
        }
        while (v40);
      }
      objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", v26, v28, v39);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v12 = v38;
      uint64_t v24 = v37;
      v14 = v60;
    }
    else
    {
      v29 = (void *)MEMORY[0x230FBD990]();
      v30 = v14;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v67 = v32;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Phone number is too short to partially redact", buf, 0xCu);
      }
      v33 = 0;
    }
    v36 = (void *)v24;
    goto LABEL_31;
  }
  if (v11 != 1)
  {
LABEL_14:
    v22 = 0;
    goto LABEL_34;
  }
  v12 = [v7 URI];
  v13 = [v12 unprefixedURI];
  v14 = self;
  id v15 = v13;
  uint64_t v16 = MEMORY[0x230FBD990]();
  if ((unint64_t)[v15 length] > 4)
  {
    uint64_t v34 = [v15 rangeOfString:@"@"];
    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v35 = v34;
      if (v34)
      {
        uint64_t v58 = v16;
        v59 = v14;
        v61 = v12;
        v43 = [v15 substringToIndex:v34];
        v57 = objc_msgSend(v43, "stringByReplacingCharactersInRange:withString:", 1, v35 - 1, @"***");

        v44 = [v15 substringFromIndex:v35 + 1];
        v45 = [v44 componentsSeparatedByString:@"."];

        v46 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v45, "count"));
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v47 = v45;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v62 objects:buf count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v63 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              if ([v52 length])
              {
                v53 = objc_msgSend(v52, "stringByReplacingCharactersInRange:withString:", 1, objc_msgSend(v52, "length") - 1, @"***");
                [v46 addObject:v53];
              }
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v62 objects:buf count:16];
          }
          while (v49);
        }

        v54 = [v46 componentsJoinedByString:@"."];

        v55 = NSString;
        v56 = [v54 lowercaseString];
        v33 = [v55 stringWithFormat:@"%@@%@", v57, v56];

        v14 = v59;
        v12 = v61;
        uint64_t v16 = v58;
        goto LABEL_25;
      }
    }
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = v14;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v67 = v20;
      v21 = "%{public}@Failed to determine '@' range";
      goto LABEL_23;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = v14;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v67 = v20;
      v21 = "%{public}@Invalid email address length";
LABEL_23:
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, v21, buf, 0xCu);
    }
  }

  v33 = 0;
LABEL_25:
  v36 = (void *)v16;
LABEL_31:
  v41 = @"<redacted>";
  if (v33) {
    v41 = v33;
  }
  v22 = v41;

LABEL_34:
  return v22;
}

- (id)accountHandleFromString:(id)a3
{
  id v8 = 0;
  BOOL v3 = [(HMDAccountHandleFormatter *)self getObjectValue:&v8 forString:a3 errorDescription:0];
  id v4 = v8;
  v5 = v4;
  id v6 = 0;
  if (v3) {
    id v6 = v4;
  }

  return v6;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  v7 = (void *)IDSCopyAddressDestinationForDestination();
  if (([v7 _appearsToBeEmail] & 1) != 0
    || [v7 hasPrefix:@"mailto:"])
  {
    id v8 = objc_alloc(MEMORY[0x263F4A0E8]);
    uint64_t v9 = MEMORY[0x230FBC250](v7);
LABEL_7:
    id v10 = (void *)v9;
    uint64_t v11 = (void *)[v8 initWithPrefixedURI:v9];

    if (a3) {
      *a3 = [[HMDAccountHandle alloc] initWithURI:v11];
    }
    BOOL v12 = 1;
    goto LABEL_10;
  }
  if (([v7 _appearsToBePhoneNumber] & 1) != 0
    || [v7 hasPrefix:@"tel:"])
  {
    id v8 = objc_alloc(MEMORY[0x263F4A0E8]);
    uint64_t v9 = IDSCopyIDForPhoneNumber();
    goto LABEL_7;
  }
  BOOL v12 = 0;
  uint64_t v11 = 0;
  if (a5) {
    *a5 = @"String does not appear to be valid handle type";
  }
LABEL_10:

  return v12;
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
  id v6 = v4;
  if (v5) {
    goto LABEL_9;
  }
  id v7 = v4;
  objc_opt_class();
  id v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
  id v9 = v8;

  id v6 = [(HMDAccountHandleFormatter *)self accountHandleFromString:v9];

  if (v6)
  {
LABEL_9:
    id v10 = [v6 URI];
    uint64_t v11 = [v10 unprefixedURI];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

@end