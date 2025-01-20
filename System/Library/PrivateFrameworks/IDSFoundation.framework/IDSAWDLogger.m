@interface IDSAWDLogger
+ (id)logger;
- (void)logMetric:(id)a3;
@end

@implementation IDSAWDLogger

+ (id)logger
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (void)logMetric:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IDSAWDLogging, v4, v5, v6);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_awdRepresentation(v3, v7, v8, v9);
  uint64_t v14 = objc_msgSend_awdIdentifier(v3, v11, v12, v13);

  objc_msgSend_submitMetric_withIdentifier_(v17, v15, (uint64_t)v10, v16, v14);
}

@end