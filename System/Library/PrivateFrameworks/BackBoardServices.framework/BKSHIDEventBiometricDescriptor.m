@interface BKSHIDEventBiometricDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorWithBiometricEventType:(unsigned int)a3;
- (BKSHIDEventBiometricDescriptor)init;
- (BKSHIDEventBiometricDescriptor)initWithBiometricEventType:(unsigned int)a3;
- (BKSHIDEventBiometricDescriptor)initWithCoder:(id)a3;
- (BOOL)describes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresFuzzyMatching;
- (unint64_t)hash;
- (unsigned)biometricEventType;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventBiometricDescriptor

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (v10.receiver = self,
        v10.super_class = (Class)BKSHIDEventBiometricDescriptor,
        [(BKSHIDEventDescriptor *)&v10 isEqual:v6]))
  {
    int v7 = [v6 biometricEventType];
    BOOL v8 = v7 == [(BKSHIDEventBiometricDescriptor *)self biometricEventType];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unsigned)biometricEventType
{
  return *(_DWORD *)&self->_isWildcard;
}

- (BKSHIDEventBiometricDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"biometricEventType"];

  uint64_t v6 = [v5 unsignedIntValue];
  return [(BKSHIDEventBiometricDescriptor *)self initWithBiometricEventType:v6];
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = *(unsigned int *)&self->_isWildcard;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInt:v4];
  [v5 encodeObject:v6 forKey:@"biometricEventType"];
}

- (BOOL)requiresFuzzyMatching
{
  return *((unsigned char *)&self->super._hidEventType + 4);
}

- (BOOL)describes:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  BOOL v6 = *((unsigned char *)&self->super._hidEventType + 4) && [v4 hidEventType] == 29
    || [(BKSHIDEventBiometricDescriptor *)self isEqual:v5];

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKSHIDEventBiometricDescriptor;
  [(BKSHIDEventDescriptor *)&v6 appendDescriptionToFormatter:v4];
  id v5 = (id)[v4 appendInteger:*(unsigned int *)&self->_isWildcard withName:@"biometricEventType"];
}

- (unint64_t)hash
{
  return *(unsigned int *)&self->_isWildcard | 0x1D0000;
}

- (BKSHIDEventBiometricDescriptor)initWithBiometricEventType:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventBiometricDescriptor;
  result = [(BKSHIDEventDescriptor *)&v5 _initWithEventType:29];
  if (result) {
    *(_DWORD *)&result->_isWildcard = a3;
  }
  return result;
}

- (BKSHIDEventBiometricDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventBiometricDescriptor;
  result = [(BKSHIDEventDescriptor *)&v3 _initWithEventType:39];
  if (result) {
    *((unsigned char *)&result->super._hidEventType + 4) = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptorWithBiometricEventType:(unsigned int)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithBiometricEventType:*(void *)&a3];
  return v3;
}

@end