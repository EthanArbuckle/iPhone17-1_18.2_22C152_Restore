@interface BKSHIDHapticFeedbackRequest
+ (BOOL)supportsSecureCoding;
+ (id)build:(id)a3;
+ (id)new;
+ (id)protobufSchema;
- (BKSHIDHapticFeedbackRequest)init;
- (BKSHIDHapticFeedbackRequest)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)powerSourceID;
- (NSString)description;
- (NSString)pattern;
- (id)_init;
- (id)_initWithCopyOf:(id *)a1;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)deviceType;
- (unint64_t)hash;
- (unint64_t)senderID;
- (unint64_t)timestamp;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDHapticFeedbackRequest

- (id)_initWithCopyOf:(id *)a1
{
  v3 = a2;
  if (a1)
  {
    a1 = (id *)-[BKSHIDHapticFeedbackRequest _init](a1);
    if (a1)
    {
      uint64_t v4 = [v3[1] copy];
      id v5 = a1[1];
      a1[1] = (id)v4;

      a1[2] = v3[2];
      a1[3] = v3[3];
      objc_storeStrong(a1 + 4, v3[4]);
      a1[5] = v3[5];
    }
  }

  return a1;
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
        uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:sel__init object:v1 file:@"BKSHIDHapticFeedbackRequest.m" lineNumber:64 description:@"BKSHIDHapticFeedbackRequest cannot be subclassed"];
      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)BKSHIDHapticFeedbackRequest;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSourceID, 0);
  objc_storeStrong((id *)&self->_pattern, 0);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSNumber)powerSourceID
{
  return self->_powerSourceID;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (NSString)pattern
{
  return self->_pattern;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v10 = a3;
  id v4 = (id)[v10 appendObject:self->_pattern withName:@"pattern"];
  objc_super v5 = NSStringFromBKSHIDHapticFeedbackRequestDeviceType(self->_deviceType);
  id v6 = (id)[v10 appendObject:v5 withName:@"deviceType"];

  id v7 = (id)[v10 appendUInt64:self->_senderID withName:@"senderID" format:1];
  id v8 = (id)[v10 appendObject:self->_powerSourceID withName:@"powerSourceID"];
  id v9 = (id)[v10 appendInt64:self->_timestamp withName:@"timestamp"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMutableHIDHapticFeedbackRequest alloc];
  return -[BKSHIDHapticFeedbackRequest _initWithCopyOf:]((id *)&v4->super.super.isa, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = v4;
    BOOL v6 = BSEqualObjects()
      && v5[2] == self->_deviceType
      && v5[3] == self->_senderID
      && BSEqualObjects()
      && v5[5] == self->_timestamp;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  [(NSString *)self->_pattern hash];
  [(NSNumber *)self->_powerSourceID hash];
  uint64_t v3 = [NSNumber numberWithInteger:self->_deviceType];
  [v3 hash];

  id v4 = [NSNumber numberWithUnsignedLongLong:self->_senderID];
  [v4 hash];

  objc_super v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  [v5 hash];

  return BSHashPurifyNS();
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  pattern = self->_pattern;
  if (pattern) {
    [v6 encodeObject:pattern forKey:@"pattern"];
  }
  [v6 encodeInteger:self->_deviceType forKey:@"deviceType"];
  [v6 encodeInt64:self->_senderID forKey:@"senderID"];
  powerSourceID = self->_powerSourceID;
  if (powerSourceID) {
    [v6 encodeObject:powerSourceID forKey:@"powerSourceID"];
  }
  [v6 encodeInt64:self->_timestamp forKey:@"timestamp"];
}

- (BKSHIDHapticFeedbackRequest)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BKSHIDHapticFeedbackRequest;
  id v3 = a3;
  id v4 = [(BKSHIDHapticFeedbackRequest *)&v11 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"pattern", v11.receiver, v11.super_class);
  pattern = v4->_pattern;
  v4->_pattern = (NSString *)v5;

  v4->_deviceType = [v3 decodeIntegerForKey:@"deviceType"];
  v4->_senderID = [v3 decodeInt64ForKey:@"senderID"];
  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"powerSourceID"];
  powerSourceID = v4->_powerSourceID;
  v4->_powerSourceID = (NSNumber *)v7;

  uint64_t v9 = [v3 decodeInt64ForKey:@"timestamp"];
  v4->_timestamp = v9;
  return v4;
}

- (BKSHIDHapticFeedbackRequest)init
{
  id v3 = [MEMORY[0x1E4F28B00] currentHandler];
  id v4 = [NSString stringWithUTF8String:"-[BKSHIDHapticFeedbackRequest init]"];
  [v3 handleFailureInFunction:v4 file:@"BKSHIDHapticFeedbackRequest.m" lineNumber:53 description:@"cannot directly allocate BKSHIDHapticFeedbackRequest"];

  return 0;
}

+ (id)protobufSchema
{
  return (id)[MEMORY[0x1E4F4F808] buildSchemaForClass:a1 builder:&__block_literal_global_10042];
}

void __45__BKSHIDHapticFeedbackRequest_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_pattern"];
  [v2 addField:"_deviceType"];
  [v2 addField:"_senderID"];
  [v2 addField:"_powerSourceID"];
  [v2 addField:"_timestamp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"+[BKSHIDHapticFeedbackRequest new]"];
  [v2 handleFailureInFunction:v3 file:@"BKSHIDHapticFeedbackRequest.m" lineNumber:58 description:@"cannot directly allocate BKSHIDHapticFeedbackRequest"];

  return 0;
}

+ (id)build:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = -[BKSHIDHapticFeedbackRequest _init]([BKSMutableHIDHapticFeedbackRequest alloc]);
  v3[2](v3, v4);

  uint64_t v5 = (void *)[v4 copy];
  return v5;
}

@end