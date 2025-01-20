@interface EchoCodecCapability
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEchoCodecCapability:(id)a3;
- (EchoCodecCapability)init;
- (EchoCodecCapability)initWithCoder:(id)a3;
- (NSArray)algorithmVersionNumbers;
- (_NSRange)frameSizeRange;
- (_NSRange)hpfCutOffFreqRange;
- (_NSRange)numFrameRepeatRange;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EchoCodecCapability

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EchoCodecCapability)init
{
  v3 = [NSString stringWithUTF8String:"echo"];
  v13.receiver = self;
  v13.super_class = (Class)EchoCodecCapability;
  v4 = [(AUPasscodeCodecCapability *)&v13 initWithAlgorithmName:v3];

  if (v4)
  {
    v4->_frameSizeRange = (_NSRange)xmmword_237D2DCB0;
    v4->_numFrameRepeatRange = (_NSRange)xmmword_237D2DCC0;
    v4->_hpfCutOffFreqRange = (_NSRange)xmmword_237D2DCD0;
    v5 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = 0;
    char v7 = 1;
    do
    {
      char v8 = v7;
      v9 = [NSNumber numberWithInt:kSupportedAlgorithmVersions[v6]];
      [v5 addObject:v9];

      char v7 = 0;
      uint64_t v6 = 1;
    }
    while ((v8 & 1) != 0);
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
    algorithmVersionNumbers = v4->_algorithmVersionNumbers;
    v4->_algorithmVersionNumbers = (NSArray *)v10;
  }
  return v4;
}

- (EchoCodecCapability)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [NSString stringWithUTF8String:"echo"];
  v19.receiver = self;
  v19.super_class = (Class)EchoCodecCapability;
  uint64_t v6 = [(AUPasscodeCodecCapability *)&v19 initWithAlgorithmName:v5];

  if (v6)
  {
    uint64_t v7 = [v4 decodeIntegerForKey:@"frmSizeRangeLoc"];
    uint64_t v8 = [v4 decodeIntegerForKey:@"frmSizeRangeLen"];
    v6->_frameSizeRange.location = v7;
    v6->_frameSizeRange.length = v8;
    uint64_t v9 = [v4 decodeIntegerForKey:@"numFrmRepeatRangeLoc"];
    uint64_t v10 = [v4 decodeIntegerForKey:@"numFrmRepeatRangeLen"];
    v6->_numFrameRepeatRange.location = v9;
    v6->_numFrameRepeatRange.length = v10;
    v11 = (void *)MEMORY[0x263EFFA08];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    objc_super v13 = [v11 setWithArray:v12];

    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"algorithmVersions"];
    algorithmVersionNumbers = v6->_algorithmVersionNumbers;
    v6->_algorithmVersionNumbers = (NSArray *)v14;

    uint64_t v16 = [v4 decodeIntegerForKey:@"hpfCutOffRangeLoc"];
    uint64_t v17 = [v4 decodeIntegerForKey:@"hpfCutOffRangeLen"];
    v6->_hpfCutOffFreqRange.location = v16;
    v6->_hpfCutOffFreqRange.length = v17;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[EchoCodecCapability frameSizeRange](self, "frameSizeRange"), @"frmSizeRangeLoc");
  [(EchoCodecCapability *)self frameSizeRange];
  [v8 encodeInteger:v4 forKey:@"frmSizeRangeLen"];
  objc_msgSend(v8, "encodeInteger:forKey:", -[EchoCodecCapability numFrameRepeatRange](self, "numFrameRepeatRange"), @"numFrmRepeatRangeLoc");
  [(EchoCodecCapability *)self numFrameRepeatRange];
  [v8 encodeInteger:v5 forKey:@"numFrmRepeatRangeLen"];
  uint64_t v6 = [(EchoCodecCapability *)self algorithmVersionNumbers];
  [v8 encodeObject:v6 forKey:@"algorithmVersions"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[EchoCodecCapability hpfCutOffFreqRange](self, "hpfCutOffFreqRange"), @"hpfCutOffRangeLoc");
  [(EchoCodecCapability *)self hpfCutOffFreqRange];
  [v8 encodeInteger:v7 forKey:@"hpfCutOffRangeLen"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(EchoCodecCapability *)self isEqualToEchoCodecCapability:v4];

  return v5;
}

- (BOOL)isEqualToEchoCodecCapability:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EchoCodecCapability;
  if ([(AUPasscodeCodecCapability *)&v22 isEqual:v4])
  {
    uint64_t v5 = [(EchoCodecCapability *)self frameSizeRange];
    uint64_t v7 = v6;
    BOOL v9 = 0;
    if (v5 == [v4 frameSizeRange] && v7 == v8)
    {
      uint64_t v10 = [(EchoCodecCapability *)self numFrameRepeatRange];
      uint64_t v12 = v11;
      BOOL v9 = 0;
      if (v10 == [v4 numFrameRepeatRange] && v12 == v13)
      {
        uint64_t v14 = [(EchoCodecCapability *)self algorithmVersionNumbers];
        v15 = [v4 algorithmVersionNumbers];
        if ([v14 isEqual:v15])
        {
          uint64_t v16 = [(EchoCodecCapability *)self hpfCutOffFreqRange];
          uint64_t v18 = v17;
          BOOL v9 = v16 == [v4 hpfCutOffFreqRange] && v18 == v19;
        }
        else
        {
          BOOL v9 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (_NSRange)frameSizeRange
{
  p_frameSizeRange = &self->_frameSizeRange;
  NSUInteger location = self->_frameSizeRange.location;
  NSUInteger length = p_frameSizeRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)numFrameRepeatRange
{
  p_numFrameRepeatRange = &self->_numFrameRepeatRange;
  NSUInteger location = self->_numFrameRepeatRange.location;
  NSUInteger length = p_numFrameRepeatRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSArray)algorithmVersionNumbers
{
  return self->_algorithmVersionNumbers;
}

- (_NSRange)hpfCutOffFreqRange
{
  p_hpfCutOffFreqRange = &self->_hpfCutOffFreqRange;
  NSUInteger location = self->_hpfCutOffFreqRange.location;
  NSUInteger length = p_hpfCutOffFreqRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
}

@end