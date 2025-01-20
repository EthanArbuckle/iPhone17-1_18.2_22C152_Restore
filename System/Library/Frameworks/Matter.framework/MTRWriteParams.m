@interface MTRWriteParams
+ (BOOL)supportsSecureCoding;
- (MTRWriteParams)init;
- (MTRWriteParams)initWithCoder:(id)a3;
- (NSNumber)dataVersion;
- (NSNumber)timedWriteTimeout;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDataVersion:(NSNumber *)dataVersion;
- (void)setTimedWriteTimeout:(NSNumber *)timedWriteTimeout;
@end

@implementation MTRWriteParams

- (MTRWriteParams)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRWriteParams;
  v2 = [(MTRWriteParams *)&v6 init];
  v3 = v2;
  if (v2)
  {
    timedWriteTimeout = v2->_timedWriteTimeout;
    v2->_timedWriteTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWriteParams);
  v7 = objc_msgSend_timedWriteTimeout(self, v5, v6);
  objc_msgSend_setTimedWriteTimeout_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_dataVersion(self, v9, v10);
  objc_msgSend_setDataVersion_(v4, v12, (uint64_t)v11);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTRWriteParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTRWriteParams;
  v5 = [(MTRWriteParams *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"sTimedWriteTimeoutKey");
    objc_msgSend_setTimedWriteTimeout_(v5, v9, (uint64_t)v8);

    uint64_t v10 = objc_opt_class();
    v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"sDataVersionKey");
    objc_msgSend_setDataVersion_(v5, v13, (uint64_t)v12);

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  uint64_t v6 = objc_msgSend_timedWriteTimeout(self, v4, v5);

  if (v6)
  {
    v9 = objc_msgSend_timedWriteTimeout(self, v7, v8);
    objc_msgSend_encodeObject_forKey_(v16, v10, (uint64_t)v9, @"sTimedWriteTimeoutKey");
  }
  v11 = objc_msgSend_dataVersion(self, v7, v8);

  if (v11)
  {
    v14 = objc_msgSend_dataVersion(self, v12, v13);
    objc_msgSend_encodeObject_forKey_(v16, v15, (uint64_t)v14, @"sDataVersionKey");
  }
}

- (NSNumber)timedWriteTimeout
{
  return self->_timedWriteTimeout;
}

- (void)setTimedWriteTimeout:(NSNumber *)timedWriteTimeout
{
}

- (NSNumber)dataVersion
{
  return self->_dataVersion;
}

- (void)setDataVersion:(NSNumber *)dataVersion
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataVersion, 0);

  objc_storeStrong((id *)&self->_timedWriteTimeout, 0);
}

@end