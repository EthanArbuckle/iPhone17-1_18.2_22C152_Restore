@interface BKSProximityDetectionMaskChangeEvent
+ (BOOL)supportsSecureCoding;
+ (id)build:(id)a3;
+ (id)new;
- (BKSProximityDetectionMaskChangeEvent)init;
- (BKSProximityDetectionMaskChangeEvent)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_init;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)mode;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)detectionMask;
- (void)_initWithCopyOf:(void *)a1;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSProximityDetectionMaskChangeEvent

- (unsigned)detectionMask
{
  return self->_detectionMask;
}

+ (id)build:(id)a3
{
  v3 = (void (**)(id, id))a3;
  id v4 = -[BKSProximityDetectionMaskChangeEvent _init]([BKSMutableProximityEvent alloc]);
  v3[2](v3, v4);

  v5 = (void *)[v4 copy];
  return v5;
}

- (id)_init
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        id v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:sel__init object:v1 file:@"BKSProximityDetectionMaskChangeEvent.m" lineNumber:46 description:@"BKSProximityDetectionMaskChangeEvent cannot be subclassed"];
      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)BKSProximityDetectionMaskChangeEvent;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (void)_initWithCopyOf:(void *)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v4 = -[BKSProximityDetectionMaskChangeEvent _init](a1);
    a1 = v4;
    if (v4)
    {
      *((_DWORD *)v4 + 2) = v3[2];
      *((_DWORD *)v4 + 3) = v3[3];
      *((void *)v4 + 2) = *((void *)v3 + 2);
    }
  }

  return a1;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)mode
{
  return self->_mode;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  id v4 = (id)[v7 appendInteger:self->_detectionMask withName:@"detectionMask"];
  id v5 = (id)[v7 appendInteger:self->_mode withName:@"mode"];
  id v6 = (id)[v7 appendInt64:self->_timestamp withName:@"timestamp"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMutableProximityEvent alloc];
  return -[BKSProximityDetectionMaskChangeEvent _initWithCopyOf:](v4, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = v5[2] == self->_detectionMask && v5[3] == self->_mode && *((void *)v5 + 2) == self->_timestamp;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [NSNumber numberWithUnsignedInt:self->_detectionMask];
  [v3 hash];

  id v4 = [NSNumber numberWithUnsignedInt:self->_mode];
  [v4 hash];

  id v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  [v5 hash];

  return BSHashPurifyNS();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t detectionMask = self->_detectionMask;
  id v5 = a3;
  [v5 encodeInteger:detectionMask forKey:@"detectionMask"];
  [v5 encodeInteger:self->_mode forKey:@"mode"];
  [v5 encodeInt64:self->_timestamp forKey:@"timestamp"];
}

- (BKSProximityDetectionMaskChangeEvent)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKSProximityDetectionMaskChangeEvent;
  id v3 = a3;
  id v4 = [(BKSProximityDetectionMaskChangeEvent *)&v7 init];
  v4->_uint64_t detectionMask = objc_msgSend(v3, "decodeInt32ForKey:", @"detectionMask", v7.receiver, v7.super_class);
  v4->_mode = [v3 decodeIntegerForKey:@"mode"];
  uint64_t v5 = [v3 decodeInt64ForKey:@"timestamp"];

  v4->_timestamp = v5;
  return v4;
}

- (BKSProximityDetectionMaskChangeEvent)init
{
  id v3 = [MEMORY[0x1E4F28B00] currentHandler];
  id v4 = [NSString stringWithUTF8String:"-[BKSProximityDetectionMaskChangeEvent init]"];
  [v3 handleFailureInFunction:v4 file:@"BKSProximityDetectionMaskChangeEvent.m" lineNumber:35 description:@"cannot directly allocate BKSProximityDetectionMaskChangeEvent"];

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"+[BKSProximityDetectionMaskChangeEvent new]"];
  [v2 handleFailureInFunction:v3 file:@"BKSProximityDetectionMaskChangeEvent.m" lineNumber:40 description:@"cannot directly allocate BKSProximityDetectionMaskChangeEvent"];

  return 0;
}

@end