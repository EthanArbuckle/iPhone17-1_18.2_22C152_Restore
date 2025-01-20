@interface MADVideoRemoveBackgroundRequest
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maskTime;
- (MADVideoRemoveBackgroundRequest)init;
- (MADVideoRemoveBackgroundRequest)initWithCoder:(id)a3;
- (MADVideoRemoveBackgroundResult)result;
- (NSArray)stickerIdentifiers;
- (NSNumber)maxDimension;
- (NSNumber)maxFileSize;
- (NSNumber)minDimension;
- (NSValue)instancePoint;
- (UTType)outputType;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setInstancePoint:(id)a3;
- (void)setMaskTime:(id *)a3;
- (void)setMaxDimension:(id)a3;
- (void)setMaxFileSize:(id)a3;
- (void)setMinDimension:(id)a3;
- (void)setOutputType:(id)a3;
- (void)setStickerIdentifiers:(id)a3;
@end

@implementation MADVideoRemoveBackgroundRequest

- (MADVideoRemoveBackgroundRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)MADVideoRemoveBackgroundRequest;
  v2 = [(MADVideoRemoveBackgroundRequest *)&v8 init];
  v3 = (MADVideoRemoveBackgroundRequest *)v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v2 + 72) = *MEMORY[0x1E4F1F9F8];
    *((void *)v2 + 11) = *(void *)(v4 + 16);
    uint64_t v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"public.heics"];
    outputType = v3->_outputType;
    v3->_outputType = (UTType *)v5;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoRemoveBackgroundRequest)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MADVideoRemoveBackgroundRequest;
  uint64_t v5 = [(MADVideoRequest *)&v22 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MaxDimension"];
    maxDimension = v5->_maxDimension;
    v5->_maxDimension = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MinDimension"];
    minDimension = v5->_minDimension;
    v5->_minDimension = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MaxFileSize"];
    maxFileSize = v5->_maxFileSize;
    v5->_maxFileSize = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstancePoint"];
    instancePoint = v5->_instancePoint;
    v5->_instancePoint = (NSValue *)v12;

    v5->_maskTime.value = [v4 decodeInt64ForKey:@"MaskTimeValue"];
    v5->_maskTime.timescale = [v4 decodeInt32ForKey:@"MaskTimeScale"];
    v5->_maskTime.flags = [v4 decodeInt32ForKey:@"MaskTimeFlags"];
    v5->_maskTime.epoch = [v4 decodeInt64ForKey:@"MaskTimeEpoch"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OutputType"];
    outputType = v5->_outputType;
    v5->_outputType = (UTType *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v18 = [v16 setWithArray:v17];

    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"StickerIdentifiers"];
    stickerIdentifiers = v5->_stickerIdentifiers;
    v5->_stickerIdentifiers = (NSArray *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVideoRemoveBackgroundRequest;
  id v4 = a3;
  [(MADVideoRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_maxDimension, @"MaxDimension", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_minDimension forKey:@"MinDimension"];
  [v4 encodeObject:self->_maxFileSize forKey:@"MaxFileSize"];
  [v4 encodeObject:self->_instancePoint forKey:@"InstancePoint"];
  [v4 encodeInt64:self->_maskTime.value forKey:@"MaskTimeValue"];
  [v4 encodeInt32:self->_maskTime.timescale forKey:@"MaskTimeScale"];
  [v4 encodeInt32:self->_maskTime.flags forKey:@"MaskTimeFlags"];
  [v4 encodeInt64:self->_maskTime.epoch forKey:@"MaskTimeEpoch"];
  [v4 encodeObject:self->_outputType forKey:@"OutputType"];
  [v4 encodeObject:self->_stickerIdentifiers forKey:@"StickerIdentifiers"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p", v5, self];

  maxDimension = self->_maxDimension;
  if (maxDimension) {
    [v3 appendFormat:@", maxDimension: %d", -[NSNumber unsignedIntegerValue](maxDimension, "unsignedIntegerValue")];
  }
  minDimension = self->_minDimension;
  if (minDimension) {
    [v3 appendFormat:@", minDimension: %d", -[NSNumber unsignedIntegerValue](minDimension, "unsignedIntegerValue")];
  }
  maxFileSize = self->_maxFileSize;
  if (maxFileSize) {
    [v3 appendFormat:@", maxFileSize: %d", -[NSNumber unsignedIntegerValue](maxFileSize, "unsignedIntegerValue")];
  }
  instancePoint = self->_instancePoint;
  if (instancePoint)
  {
    [(NSValue *)instancePoint pointValue];
    [v3 appendFormat:@", instancePoint: (%0.3f, %0.3f)", v10, v11];
  }
  if (self->_maskTime.flags)
  {
    uint64_t timescale = self->_maskTime.timescale;
    CMTime time = (CMTime)self->_maskTime;
    [v3 appendFormat:@", maskTime: %lld/%d (%0.3fs)", time.value, timescale, CMTimeGetSeconds(&time)];
  }
  [v3 appendFormat:@", outputType: %@", self->_outputType];
  if ([(NSArray *)self->_stickerIdentifiers count]) {
    [v3 appendFormat:@", stickerIdentifiers: %@", self->_stickerIdentifiers];
  }
  v13 = [(MADVideoRequest *)self results];
  [v3 appendFormat:@", results: %@", v13];

  uint64_t v14 = [(MADVideoRequest *)self error];
  [v3 appendFormat:@", error: %@>", v14];

  return v3;
}

- (MADVideoRemoveBackgroundResult)result
{
  v2 = [(MADVideoRequest *)self results];
  v3 = [v2 firstObject];

  return (MADVideoRemoveBackgroundResult *)v3;
}

- (NSNumber)maxDimension
{
  return self->_maxDimension;
}

- (void)setMaxDimension:(id)a3
{
}

- (NSNumber)minDimension
{
  return self->_minDimension;
}

- (void)setMinDimension:(id)a3
{
}

- (NSNumber)maxFileSize
{
  return self->_maxFileSize;
}

- (void)setMaxFileSize:(id)a3
{
}

- (NSValue)instancePoint
{
  return self->_instancePoint;
}

- (void)setInstancePoint:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maskTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setMaskTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_maskTime.value = *(_OWORD *)&a3->var0;
  self->_maskTime.epoch = var3;
}

- (UTType)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(id)a3
{
}

- (NSArray)stickerIdentifiers
{
  return self->_stickerIdentifiers;
}

- (void)setStickerIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerIdentifiers, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
  objc_storeStrong((id *)&self->_instancePoint, 0);
  objc_storeStrong((id *)&self->_maxFileSize, 0);
  objc_storeStrong((id *)&self->_minDimension, 0);
  objc_storeStrong((id *)&self->_maxDimension, 0);
}

@end