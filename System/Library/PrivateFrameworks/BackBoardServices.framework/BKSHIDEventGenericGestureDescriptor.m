@interface BKSHIDEventGenericGestureDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorForAnyGenericGestureType;
+ (id)descriptorWithGenericGestureType:(unsigned int)a3;
- (BKSHIDEventGenericGestureDescriptor)init;
- (BKSHIDEventGenericGestureDescriptor)initWithCoder:(id)a3;
- (BKSHIDEventGenericGestureDescriptor)initWithGenericGestureType:(unsigned int)a3;
- (BOOL)describes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresFuzzyMatching;
- (unint64_t)hash;
- (unsigned)genericGestureType;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventGenericGestureDescriptor

- (BOOL)describes:(id)a3
{
  id v4 = a3;
  v5 = v4;
  BOOL v6 = *((unsigned char *)&self->super._hidEventType + 4) && [v4 hidEventType] == 39
    || [(BKSHIDEventGenericGestureDescriptor *)self isEqual:v5];

  return v6;
}

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
  BOOL v6 = v5;
  BOOL v7 = v6
    && (v9.receiver = self,
        v9.super_class = (Class)BKSHIDEventGenericGestureDescriptor,
        [(BKSHIDEventDescriptor *)&v9 isEqual:v6])
    && v6[4] == *(_DWORD *)&self->_isWildcard
    && *((unsigned __int8 *)v6 + 12) == *((unsigned __int8 *)&self->super._hidEventType + 4);

  return v7;
}

- (unsigned)genericGestureType
{
  return *(_DWORD *)&self->_isWildcard;
}

- (BKSHIDEventGenericGestureDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeBoolForKey:@"genericGestureIsWildcardType"]) {
    v5 = [(BKSHIDEventGenericGestureDescriptor *)self init];
  }
  else {
    v5 = -[BKSHIDEventGenericGestureDescriptor initWithGenericGestureType:](self, "initWithGenericGestureType:", [v4 decodeIntegerForKey:@"genericGestureType"]);
  }
  BOOL v6 = v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)&self->super._hidEventType + 4)) {
    [a3 encodeBool:1 forKey:@"genericGestureIsWildcardType"];
  }
  else {
    [a3 encodeInteger:*(unsigned int *)&self->_isWildcard forKey:@"genericGestureType"];
  }
}

- (BOOL)requiresFuzzyMatching
{
  return *((unsigned char *)&self->super._hidEventType + 4);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKSHIDEventGenericGestureDescriptor;
  [(BKSHIDEventDescriptor *)&v6 appendDescriptionToFormatter:v4];
  id v5 = (id)[v4 appendInteger:*(int *)&self->_isWildcard withName:@"genericGestureType"];
}

- (unint64_t)hash
{
  return *(unsigned int *)&self->_isWildcard | 0x270000;
}

- (BKSHIDEventGenericGestureDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventGenericGestureDescriptor;
  result = [(BKSHIDEventDescriptor *)&v3 _initWithEventType:39];
  if (result) {
    *((unsigned char *)&result->super._hidEventType + 4) = 1;
  }
  return result;
}

- (BKSHIDEventGenericGestureDescriptor)initWithGenericGestureType:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventGenericGestureDescriptor;
  result = [(BKSHIDEventDescriptor *)&v5 _initWithEventType:39];
  if (result) {
    *(_DWORD *)&result->_isWildcard = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptorWithGenericGestureType:(unsigned int)a3
{
  objc_super v3 = [[BKSHIDEventGenericGestureDescriptor alloc] initWithGenericGestureType:*(void *)&a3];
  return v3;
}

+ (id)descriptorForAnyGenericGestureType
{
  v2 = objc_alloc_init(BKSHIDEventGenericGestureDescriptor);
  return v2;
}

@end