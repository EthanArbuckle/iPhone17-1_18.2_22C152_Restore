@interface ASDCheckQueueRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDCheckQueueRequestOptions)initWithCoder:(id)a3;
- (ASDCheckQueueRequestOptions)initWithReason:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)reason;
- (void)encodeWithCoder:(id)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation ASDCheckQueueRequestOptions

- (ASDCheckQueueRequestOptions)initWithReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASDCheckQueueRequestOptions;
  result = [(ASDCheckQueueRequestOptions *)&v5 init];
  if (result) {
    result->_reason = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[ASDCheckQueueRequestOptions allocWithZone:a3] init];
  *((void *)result + 1) = self->_reason;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDCheckQueueRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASDCheckQueueRequestOptions;
  objc_super v5 = [(ASDRequestOptions *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reasonKey"];
    v5->_reason = [v6 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  unint64_t reason = self->_reason;
  id v5 = a3;
  id v6 = [v3 numberWithInteger:reason];
  [v5 encodeObject:v6 forKey:@"reasonKey"];
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_unint64_t reason = a3;
}

@end