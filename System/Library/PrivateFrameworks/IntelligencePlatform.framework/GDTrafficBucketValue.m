@interface GDTrafficBucketValue
+ (BOOL)supportsSecureCoding;
- (GDTrafficBucketValue)initWithBucket:(int64_t)a3 bucketValue:(double)a4;
- (GDTrafficBucketValue)initWithCoder:(id)a3;
- (double)bucketValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)bucket;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDTrafficBucketValue

- (double)bucketValue
{
  return self->_bucketValue;
}

- (int64_t)bucket
{
  return self->_bucket;
}

- (id)description
{
  unint64_t bucket = self->_bucket;
  if (bucket > 3) {
    v4 = 0;
  }
  else {
    v4 = off_1E60137E0[bucket];
  }
  id v5 = [NSString alloc];
  v9 = objc_msgSend_initWithFormat_(v5, v6, @"GDTrafficBucketValue<bucket: %@, bucketValue: %lf>", v7, v8, v4, *(void *)&self->_bucketValue);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(GDTrafficBucketValue, a2, (uint64_t)a3, v3, v4);
  int64_t bucket = self->_bucket;

  return (id)MEMORY[0x1F4181798](v6, sel_initWithBucket_bucketValue_, bucket, v7, v8);
}

- (GDTrafficBucketValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_bucket);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);
  uint64_t v14 = (int)objc_msgSend_intValue(v9, v10, v11, v12, v13);

  uint64_t v15 = objc_opt_class();
  v16 = NSStringFromSelector(sel_bucketValue);
  v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16, v18);

  objc_msgSend_doubleValue(v19, v20, v21, v22, v23);

  return (GDTrafficBucketValue *)MEMORY[0x1F4181798](self, sel_initWithBucket_bucketValue_, v14, v24, v25);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t bucket = self->_bucket;
  id v6 = a3;
  v10 = objc_msgSend_numberWithInteger_(v4, v7, bucket, v8, v9);
  uint64_t v11 = NSStringFromSelector(sel_bucket);
  objc_msgSend_encodeObject_forKey_(v6, v12, (uint64_t)v10, (uint64_t)v11, v13);

  objc_msgSend_numberWithDouble_(NSNumber, v14, v15, v16, v17, self->_bucketValue);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = NSStringFromSelector(sel_bucketValue);
  objc_msgSend_encodeObject_forKey_(v6, v19, (uint64_t)v21, (uint64_t)v18, v20);
}

- (GDTrafficBucketValue)initWithBucket:(int64_t)a3 bucketValue:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GDTrafficBucketValue;
  result = [(GDTrafficBucketValue *)&v7 init];
  if (result)
  {
    result->_int64_t bucket = a3;
    result->_bucketValue = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end