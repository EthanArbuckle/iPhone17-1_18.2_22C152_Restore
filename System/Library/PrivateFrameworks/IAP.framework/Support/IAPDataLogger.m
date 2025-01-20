@interface IAPDataLogger
+ (id)sanitizeString:(id)a3;
+ (unint64_t)sanitizeData:(unint64_t)a3;
+ (void)AggAccAttach:(id)a3 WithManufacturer:(id)a4;
+ (void)AggAccDetach:(id)a3 WithManufacturer:(id)a4 AndConnectionTime:(unint64_t)a5;
+ (void)PowerlogAccAttach:(id)a3;
+ (void)PowerlogAccDetach:(id)a3 AndConnectionTime:(unint64_t)a4;
+ (void)PowerlogEASession:(id)a3 forAccessory:(id)a4 forProtocolID:(unsigned __int8)a5 forPortType:(unsigned __int8)a6 isSessionOpen:(BOOL)a7;
@end

@implementation IAPDataLogger

+ (id)sanitizeString:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableCharacterSet);
  objc_msgSend(v4, "formUnionWithCharacterSet:", +[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet"));
  objc_msgSend(v4, "formUnionWithCharacterSet:", +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
  [v4 addCharactersInString:@"_-.!"];
  id v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", objc_msgSend(a3, "dataUsingEncoding:allowLossyConversion:", 1, 1), 1);
  id v6 = objc_msgSend(objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", objc_msgSend(v4, "invertedSet")), "componentsJoinedByString:", &stru_10012A858);

  return v6;
}

+ (unint64_t)sanitizeData:(unint64_t)a3
{
  return 100 * (a3 / 0x64);
}

+ (void)AggAccAttach:(id)a3 WithManufacturer:(id)a4
{
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"accessory.attach.%@.%@", [a1 sanitizeString:a4], objc_msgSend(a1, "sanitizeString:", a3));
  _ADClientAddValueForScalarKey(v4, 1);
}

+ (void)AggAccDetach:(id)a3 WithManufacturer:(id)a4 AndConnectionTime:(unint64_t)a5
{
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"accessory.usage.%@.%@", [a1 sanitizeString:a4], objc_msgSend(a1, "sanitizeString:", a3));
  v10.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v10.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  v8 = (NSString *)gettimeofday(&v10, 0);
  if (v10.tv_sec < a5)
  {
    __break(0x5515u);
  }
  else
  {
    v9.n128_f64[0] = (double)(unint64_t)[a1 sanitizeData:v10.tv_sec - a5];
    v8 = v7;
  }
  _ADClientPushValueForDistributionKey(v8, v9);
}

+ (void)PowerlogAccAttach:(id)a3
{
  v16[0] = IAPAppAccessoryNameKey;
  v16[1] = IAPAppAccessoryManufacturerKey;
  v16[2] = IAPAppAccessoryModelNumberKey;
  v16[3] = IAPAppAccessoryFirmwareRevisionKey;
  v16[4] = IAPAppAccessoryHardwareRevisionKey;
  v16[5] = IAPAppAccessoryProtocolsKey;
  v16[6] = IAPAppAccessoryPreferredAppKey;
  v16[7] = IAPAppAccessoryConnectionTimeInSecKey;
  id v4 = +[NSArray arrayWithObjects:v16 count:8];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([a3 objectForKey:v10]) {
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", v10), v10);
        }
      }
      id v7 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [v5 setObject:&__kCFBooleanTrue forKey:IAPAppAccessoryConnectedKey];
  PLLogRegisteredEvent();
}

+ (void)PowerlogAccDetach:(id)a3 AndConnectionTime:(unint64_t)a4
{
  v20[0] = IAPAppAccessoryNameKey;
  v20[1] = IAPAppAccessoryManufacturerKey;
  v20[2] = IAPAppAccessoryModelNumberKey;
  v20[3] = IAPAppAccessoryFirmwareRevisionKey;
  v20[4] = IAPAppAccessoryHardwareRevisionKey;
  v20[5] = IAPAppAccessoryProtocolsKey;
  v20[6] = IAPAppAccessoryPreferredAppKey;
  v20[7] = IAPAppAccessoryConnectionTimeInSecKey;
  id v6 = +[NSArray arrayWithObjects:v20 count:8];
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ([a3 objectForKey:v12]) {
          objc_msgSend(v7, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", v12), v12);
        }
      }
      id v9 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  v14.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v14.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v14, 0);
  if (v14.tv_sec < a4) {
    __break(0x5515u);
  }
  long long v13 = +[NSNumber numberWithLong:v14.tv_sec - a4];
  [v7 setObject:v13 forKey:IAPAppAccessoryUsageTimeInSecsKey];
  [v7 setObject:&__kCFBooleanFalse forKey:IAPAppAccessoryConnectedKey];
  PLLogRegisteredEvent();
}

+ (void)PowerlogEASession:(id)a3 forAccessory:(id)a4 forProtocolID:(unsigned __int8)a5 forPortType:(unsigned __int8)a6 isSessionOpen:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  uint64_t v9 = a5;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  if (a3) {
    CFStringRef v13 = (const __CFString *)a3;
  }
  else {
    CFStringRef v13 = @"Unknown process";
  }
  id v32 = v12;
  [v12 setObject:v13 forKey:IAPEASessionAppBundleIDKey];
  id v14 = [a4 objectForKey:IAPAppAccessoryProtocolsKey];
  id v15 = [v14 keyEnumerator];
  while (1)
  {
    id v16 = [v15 nextObject];
    if (!v16) {
      break;
    }
    id v17 = v16;
    if (objc_msgSend(objc_msgSend(v14, "objectForKey:", v16), "isEqualToNumber:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9)))
    {
      [v32 setObject:v17 forKey:IAPEASessionProtocolKey];
      long long v18 = +[NSString stringWithString:v17];
      goto LABEL_9;
    }
  }
  long long v18 = 0;
LABEL_9:
  objc_msgSend(v32, "setObject:forKey:", objc_msgSend(a4, "objectForKey:", IAPAppAccessoryNameKey), IAPAppAccessoryNameKey);
  v19 = +[NSNumber numberWithUnsignedInt:v8];
  [v32 setObject:v19 forKey:IAPAccessoryPortTypeKey];
  if (!v7)
  {
    [v32 setObject:&__kCFBooleanFalse forKey:IAPEASessionIsSessionOpenKey];
    id v26 = [a4 objectForKey:IAPEASessionOpenedTimesKey];
    if (v26) {
      BOOL v27 = v18 == 0;
    }
    else {
      BOOL v27 = 1;
    }
    if (v27) {
      goto LABEL_21;
    }
    v28 = v26;
    v33.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v33.tv_usec = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday(&v33, 0);
    __darwin_time_t tv_sec = v33.tv_sec;
    id v30 = objc_msgSend(objc_msgSend(v28, "objectForKey:", v18), "longValue");
    if (__OFSUB__(tv_sec, v30))
    {
      __break(0x5515u);
      return;
    }
    v23 = +[NSNumber numberWithLong:tv_sec - (void)v30];
    v25 = (NSString *)IAPEASessionUsageTimeInSecsKey;
    v24 = v32;
LABEL_20:
    [v24 setObject:v23 forKey:v25];
    goto LABEL_21;
  }
  [v32 setObject:&__kCFBooleanTrue forKey:IAPEASessionIsSessionOpenKey];
  if (a4 && v18)
  {
    v33.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v33.tv_usec = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday(&v33, 0);
    uint64_t v20 = IAPEASessionOpenedTimesKey;
    id v21 = [a4 objectForKey:IAPEASessionOpenedTimesKey];
    if (!v21)
    {
      id v31 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v31, "setObject:forKey:", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v33.tv_sec), v18);
      [a4 setObject:v31 forKey:v20];

      goto LABEL_21;
    }
    id v22 = v21;
    v23 = +[NSNumber numberWithLong:v33.tv_sec];
    v24 = v22;
    v25 = v18;
    goto LABEL_20;
  }
LABEL_21:
  PLLogRegisteredEvent();
}

@end