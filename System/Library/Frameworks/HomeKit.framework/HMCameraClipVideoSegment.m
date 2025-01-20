@interface HMCameraClipVideoSegment
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMCameraClipVideoSegment)initWithByteLength:(unint64_t)a3 byteOffset:(unint64_t)a4;
- (HMCameraClipVideoSegment)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (unint64_t)byteLength;
- (unint64_t)byteOffset;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraClipVideoSegment

- (unint64_t)byteOffset
{
  return self->_byteOffset;
}

- (unint64_t)byteLength
{
  return self->_byteLength;
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMCameraClipVideoSegment byteLength](self, "byteLength"));
  v5 = (void *)[v3 initWithName:@"Byte Length" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMCameraClipVideoSegment byteOffset](self, "byteOffset"));
  v8 = (void *)[v6 initWithName:@"Byte Offset" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraClipVideoSegment byteLength](self, "byteLength"), @"HMCCVS.bl");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraClipVideoSegment byteOffset](self, "byteOffset"), @"HMCCVS.bo");
}

- (HMCameraClipVideoSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HMCCVS.bl"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HMCCVS.bo"];

  return [(HMCameraClipVideoSegment *)self initWithByteLength:v5 byteOffset:v6];
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMCameraClipVideoSegment *)self byteLength];
  return [(HMCameraClipVideoSegment *)self byteOffset] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6 && (unint64_t v7 = -[HMCameraClipVideoSegment byteLength](self, "byteLength"), v7 == [v6 byteLength]))
  {
    unint64_t v8 = [(HMCameraClipVideoSegment *)self byteOffset];
    BOOL v9 = v8 == [v6 byteOffset];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (HMCameraClipVideoSegment)initWithByteLength:(unint64_t)a3 byteOffset:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMCameraClipVideoSegment;
  result = [(HMCameraClipVideoSegment *)&v7 init];
  if (result)
  {
    result->_byteLength = a3;
    result->_byteOffset = a4;
  }
  return result;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end