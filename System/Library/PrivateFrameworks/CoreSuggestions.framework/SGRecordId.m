@interface SGRecordId
+ (BOOL)supportsSecureCoding;
+ (SGRecordId)recordIdWithInternalEntityId:(int64_t)a3;
+ (SGRecordId)recordIdWithNumericValue:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecordId:(id)a3;
- (SGRecordId)initWithCoder:(id)a3;
- (SGRecordId)initWithInternalEntityId:(int64_t)a3;
- (id)description;
- (int64_t)internalEntityId;
- (int64_t)numericValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGRecordId

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<SGRecordId %llu>", self->_internalEntityId);

  return v2;
}

- (BOOL)isEqualToRecordId:(id)a3
{
  return a3 && *((void *)a3 + 1) == self->_internalEntityId;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGRecordId *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGRecordId *)self isEqualToRecordId:v5];

  return v6;
}

- (unint64_t)hash
{
  return self->_internalEntityId ^ (self->_internalEntityId >> 32);
}

- (int64_t)numericValue
{
  return self->_internalEntityId;
}

- (int64_t)internalEntityId
{
  return self->_internalEntityId;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SGRecordId)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SGRecordId;
  v5 = [(SGRecordId *)&v7 init];
  if (v5) {
    v5->_internalEntityId = [v4 decodeInt64ForKey:@"internalEntityId"];
  }

  return v5;
}

- (SGRecordId)initWithInternalEntityId:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGRecordId;
  result = [(SGRecordId *)&v5 init];
  if (result) {
    result->_internalEntityId = a3;
  }
  return result;
}

+ (SGRecordId)recordIdWithNumericValue:(int64_t)a3
{
  v3 = [[SGRecordId alloc] initWithInternalEntityId:a3];

  return v3;
}

+ (SGRecordId)recordIdWithInternalEntityId:(int64_t)a3
{
  v3 = [[SGRecordId alloc] initWithInternalEntityId:a3];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end