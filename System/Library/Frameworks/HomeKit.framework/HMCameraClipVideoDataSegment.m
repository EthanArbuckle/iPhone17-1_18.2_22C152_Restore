@interface HMCameraClipVideoDataSegment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMCameraClipVideoDataSegment)initWithByteLength:(unint64_t)a3 byteOffset:(unint64_t)a4 duration:(double)a5 timeOffset:(double)a6;
- (HMCameraClipVideoDataSegment)initWithCoder:(id)a3;
- (double)duration;
- (double)timeOffset;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraClipVideoDataSegment

- (double)timeOffset
{
  return self->_timeOffset;
}

- (double)duration
{
  return self->_duration;
}

- (id)attributeDescriptions
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)HMCameraClipVideoDataSegment;
  v3 = [(HMCameraClipVideoSegment *)&v17 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = NSString;
  [(HMCameraClipVideoDataSegment *)self duration];
  v7 = objc_msgSend(v5, "stringWithFormat:", @"%.3f", v6);
  v8 = (void *)[v4 initWithName:@"Duration" value:v7];
  v18[0] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = NSString;
  [(HMCameraClipVideoDataSegment *)self timeOffset];
  v12 = objc_msgSend(v10, "stringWithFormat:", @"%.3f", v11);
  v13 = (void *)[v9 initWithName:@"Time Offset" value:v12];
  v18[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v15 = [v3 arrayByAddingObjectsFromArray:v14];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMCameraClipVideoDataSegment;
  id v4 = a3;
  [(HMCameraClipVideoSegment *)&v5 encodeWithCoder:v4];
  [(HMCameraClipVideoDataSegment *)self duration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HMCCVDS.ck.d");
  [(HMCameraClipVideoDataSegment *)self timeOffset];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HMCCVDS.ck.to");
}

- (HMCameraClipVideoDataSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[HMCameraClipVideoSegment alloc] initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"HMCCVDS.ck.d"];
    double v7 = v6;
    [v4 decodeDoubleForKey:@"HMCCVDS.ck.to"];
    self = [(HMCameraClipVideoDataSegment *)self initWithByteLength:[(HMCameraClipVideoSegment *)v5 byteLength] byteOffset:[(HMCameraClipVideoSegment *)v5 byteOffset] duration:v7 timeOffset:v8];
    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)HMCameraClipVideoDataSegment;
  unint64_t v3 = [(HMCameraClipVideoSegment *)&v8 hash];
  [(HMCameraClipVideoDataSegment *)self duration];
  unint64_t v5 = v3 ^ (unint64_t)v4;
  [(HMCameraClipVideoDataSegment *)self timeOffset];
  return v5 ^ (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (v15.receiver = self,
        v15.super_class = (Class)HMCameraClipVideoDataSegment,
        [(HMCameraClipVideoSegment *)&v15 isEqual:v6])
    && (-[HMCameraClipVideoDataSegment duration](self, "duration"), double v8 = v7, [v6 duration], v8 == v9))
  {
    [(HMCameraClipVideoDataSegment *)self timeOffset];
    double v11 = v10;
    [v6 timeOffset];
    BOOL v13 = v11 == v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (HMCameraClipVideoDataSegment)initWithByteLength:(unint64_t)a3 byteOffset:(unint64_t)a4 duration:(double)a5 timeOffset:(double)a6
{
  v9.receiver = self;
  v9.super_class = (Class)HMCameraClipVideoDataSegment;
  result = [(HMCameraClipVideoSegment *)&v9 initWithByteLength:a3 byteOffset:a4];
  if (result)
  {
    result->_duration = a5;
    result->_timeOffset = a6;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end