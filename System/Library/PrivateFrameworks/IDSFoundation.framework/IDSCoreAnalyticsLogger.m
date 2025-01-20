@interface IDSCoreAnalyticsLogger
+ (id)defaultLogger;
- (IDSCoreAnalyticsLogger)initWithDomain:(id)a3;
- (NSString)domain;
- (void)logMetric:(id)a3;
@end

@implementation IDSCoreAnalyticsLogger

- (IDSCoreAnalyticsLogger)initWithDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSCoreAnalyticsLogger;
  v6 = [(IDSCoreAnalyticsLogger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_domain, a3);
  }

  return v7;
}

+ (id)defaultLogger
{
  id v2 = objc_alloc((Class)a1);
  id v5 = objc_msgSend_initWithDomain_(v2, v3, @"com.apple.IDS", v4);
  return v5;
}

- (void)logMetric:(id)a3
{
  id v21 = a3;
  double v4 = NSString;
  v8 = objc_msgSend_domain(self, v5, v6, v7);
  v12 = objc_msgSend_name(v21, v9, v10, v11);
  v15 = objc_msgSend_stringWithFormat_(v4, v13, @"%@.%@", v14, v8, v12);

  if (qword_1E944F0B8 != -1) {
    dispatch_once(&qword_1E944F0B8, &unk_1EEFCD818);
  }
  v19 = (void (*)(void *, void *))off_1E944F0E0;
  if (off_1E944F0E0)
  {
    v20 = objc_msgSend_dictionaryRepresentation(v21, v16, v17, v18);
    v19(v15, v20);
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
}

@end