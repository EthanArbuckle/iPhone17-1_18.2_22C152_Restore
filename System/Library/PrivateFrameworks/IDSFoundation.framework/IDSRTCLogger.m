@interface IDSRTCLogger
+ (id)loggerWithCategory:(unsigned __int16)a3;
- (IDSRTCLogger)initWithCategory:(unsigned __int16)a3;
- (unsigned)category;
- (void)logMetric:(id)a3;
@end

@implementation IDSRTCLogger

- (IDSRTCLogger)initWithCategory:(unsigned __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSRTCLogger;
  result = [(IDSRTCLogger *)&v5 init];
  if (result) {
    result->_category = a3;
  }
  return result;
}

+ (id)loggerWithCategory:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = objc_alloc((Class)a1);
  v7 = objc_msgSend_initWithCategory_(v4, v5, v3, v6);
  return v7;
}

- (void)logMetric:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_RTCSessionPromiseWithBatchingInterval_(MEMORY[0x1E4F59E10], v5, v6, 30.0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19DB42E88;
  v11[3] = &unk_1E59759F8;
  v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  objc_msgSend_registerResultBlock_(v7, v9, (uint64_t)v11, v10);
}

- (unsigned)category
{
  return self->_category;
}

@end