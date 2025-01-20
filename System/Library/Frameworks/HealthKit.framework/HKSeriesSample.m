@interface HKSeriesSample
+ (BOOL)supportsSecureCoding;
- (BOOL)_isFrozen;
- (BOOL)_shouldNotifyOnInsert;
- (HKSeriesSample)initWithCoder:(id)a3;
- (NSUInteger)count;
- (id)_validateSample;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)_valueDescription;
- (void)_setCount:(unint64_t)a3;
- (void)_setFrozen:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSeriesSample

- (void)_setCount:(unint64_t)a3
{
}

- (BOOL)_isFrozen
{
  return self->_frozen;
}

- (NSUInteger)count
{
  return atomic_load(&self->_count);
}

- (BOOL)_shouldNotifyOnInsert
{
  return self->_frozen;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKSeriesSample;
  id v4 = a3;
  [(HKSample *)&v6 encodeWithCoder:v4];
  uint64_t v5 = atomic_load(&self->_count);
  objc_msgSend(v4, "encodeInt64:forKey:", v5, @"cnt", v6.receiver, v6.super_class);
  [v4 encodeBool:self->_frozen forKey:@"fzn"];
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKSeriesSample;
  id v4 = -[HKSample _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_msgSend(v5, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v6, a2, @"Invalid data type %@"", objc_opt_class());

    id v4 = (void *)v7;
  }

  return v4;
}

- (id)_validateSample
{
  v4.receiver = self;
  v4.super_class = (Class)HKSeriesSample;
  v2 = [(HKObject *)&v4 _validateConfiguration];

  return v2;
}

- (id)_valueDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"count=%lld", -[HKSeriesSample count](self, "count"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSeriesSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKSeriesSample;
  uint64_t v5 = [(HKSample *)&v7 initWithCoder:v4];
  if (v5)
  {
    atomic_store([v4 decodeInt64ForKey:@"cnt"], &v5->_count);
    v5->_frozen = [v4 decodeBoolForKey:@"fzn"];
  }

  return v5;
}

- (void)_setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

@end