@interface CloudServicesAnalytics
+ (id)databasePath;
+ (id)logger;
- (void)logSuccessForEvent:(id)a3;
- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5;
@end

@implementation CloudServicesAnalytics

+ (id)databasePath
{
  return (id)MEMORY[0x270F9A6D0](CloudServicesAnalytics, sel_defaultAnalyticsDatabasePath_, @"CloudServicesAnalytics");
}

+ (id)logger
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CloudServicesAnalytics;
  v2 = objc_msgSendSuper2(&v4, sel_logger);

  return v2;
}

- (void)logSuccessForEvent:(id)a3
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"%@", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logSuccessForEventNamed_(self, v4, (uint64_t)v5);
}

- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  v27[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    v26[0] = @"errorDomain";
    id v10 = a3;
    v13 = objc_msgSend_domain(v10, v11, v12);
    v26[1] = @"errorCode";
    v27[0] = v13;
    v14 = NSNumber;
    uint64_t v17 = objc_msgSend_code(v10, v15, v16);

    v19 = objc_msgSend_numberWithInteger_(v14, v18, v17);
    v27[1] = v19;
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)v27, v26, 2);

    if (v9)
    {
      v24 = objc_msgSend_mutableCopy(v9, v22, v23);
      objc_msgSend_setValuesForKeysWithDictionary_(v24, v25, (uint64_t)v21);

      v21 = v24;
    }
    objc_msgSend_logHardFailureForEventNamed_withAttributes_(self, v22, (uint64_t)v8, v21);
  }
}

@end