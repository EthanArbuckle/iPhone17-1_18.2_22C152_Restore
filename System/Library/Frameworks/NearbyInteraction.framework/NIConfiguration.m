@interface NIConfiguration
+ (BOOL)supportsSecureCoding;
+ (NIConfiguration)new;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)_internalIsCameraAssistanceInClientProcess;
- (BOOL)_internalIsExtendedDistanceMeasurementEnabled;
- (BOOL)_internalOsTransactionRequired;
- (BOOL)supportsCameraAssistance;
- (NIConfiguration)init;
- (NIConfiguration)initWithCoder:(id)a3;
- (NIConfiguration)initWithConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionInternal;
- (id)initInternal;
- (unint64_t)enabledGestures;
- (unint64_t)suspensionPolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabledGestures:(unint64_t)a3;
- (void)setSupportsCameraAssistance:(BOOL)a3;
- (void)setSuspensionPolicy:(unint64_t)a3;
@end

@implementation NIConfiguration

- (NIConfiguration)init
{
}

+ (NIConfiguration)new
{
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)NIConfiguration;
  id result = [(NIConfiguration *)&v3 init];
  if (result)
  {
    *((int64x2_t *)result + 1) = vdupq_n_s64(3uLL);
    *((unsigned char *)result + 8) = 0;
  }
  return result;
}

- (NIConfiguration)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 364, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)NIConfiguration;
  v6 = [(NIConfiguration *)&v9 init];
  if (v6)
  {
    v6->_suspensionPolicy = [v5 suspensionPolicy];
    v6->_enabledGestures = [v5 enabledGestures];
    v6->_supportsCameraAssistance = [v5 supportsCameraAssistance];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithConfiguration:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_suspensionPolicy forKey:@"suspensionPolicy"];
  [v4 encodeInteger:self->_enabledGestures forKey:@"enabledGestures"];
  [v4 encodeBool:self->_supportsCameraAssistance forKey:@"supportsCameraAssistance"];
}

- (NIConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (NIConfiguration *)[objc_alloc((Class)objc_opt_class()) initInternal];

  if (v5)
  {
    v6 = operator new(0x18uLL);
    *(_OWORD *)v6 = xmmword_1A2C7AB00;
    v6[2] = 1;
    v7 = operator new(0x10uLL);
    _OWORD *v7 = xmmword_1A2C7AAF0;
    uint64_t v8 = [v4 decodeIntegerForKey:@"suspensionPolicy"];
    uint64_t v9 = [v4 decodeIntegerForKey:@"enabledGestures"];
    char v10 = [v4 decodeBoolForKey:@"supportsCameraAssistance"];
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    v5->_suspensionPolicy = 0;
    v5->_enabledGestures = 0;
    v5->_supportsCameraAssistance = v10;
    do
    {
      uint64_t v13 = v6[v11];
      if ((v13 & v8) != 0)
      {
        v12 |= v13;
        v5->_suspensionPolicy = v12;
      }
      ++v11;
    }
    while (v11 != 3);
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      uint64_t v16 = *(void *)((char *)v7 + v14);
      if ((v16 & v9) != 0)
      {
        v15 |= v16;
        v5->_enabledGestures = v15;
      }
      v14 += 8;
    }
    while (v14 != 16);
    v17 = v5;
    operator delete(v7);
    operator delete(v6);
  }

  return v5;
}

- (id)descriptionInternal
{
  return 0;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return 0;
}

- (BOOL)_internalIsCameraAssistanceInClientProcess
{
  return 1;
}

- (BOOL)_internalOsTransactionRequired
{
  return 1;
}

- (BOOL)_internalIsExtendedDistanceMeasurementEnabled
{
  return 0;
}

- (BOOL)supportsCameraAssistance
{
  return self->_supportsCameraAssistance;
}

- (void)setSupportsCameraAssistance:(BOOL)a3
{
  self->_supportsCameraAssistance = a3;
}

- (unint64_t)suspensionPolicy
{
  return self->_suspensionPolicy;
}

- (void)setSuspensionPolicy:(unint64_t)a3
{
  self->_suspensionPolicy = a3;
}

- (unint64_t)enabledGestures
{
  return self->_enabledGestures;
}

- (void)setEnabledGestures:(unint64_t)a3
{
  self->_enabledGestures = a3;
}

@end