@interface VideoAttributes
+ (VideoAttributes)videoAttributesWithVideoAttributes:(id)a3;
+ (id)cameraUIDForVideoAttributeCamera:(int)a3;
+ (int)videoAttributeCameraForCameraUID:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)framePresentationTime;
- (BOOL)cameraSwitching;
- (BOOL)videoMirrored;
- (BOOL)videoSourceScreen;
- (CGRect)contentsRect;
- (CGSize)ratio;
- (VideoAttributes)init;
- (VideoAttributes)initWithCameraStatusBits:(unsigned __int8)a3 aspectRatio:(CGSize)a4 contentsRect:(CGRect)a5 scaleFactor:(float)a6;
- (VideoAttributes)initWithCoder:(id)a3;
- (VideoAttributes)initWithEncodedDictionary:(id)a3;
- (float)scaleFactor;
- (id)copyEncodedDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)camera;
- (int)orientation;
- (void)decodeFromNSDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCamera:(int)a3;
- (void)setCameraSwitching:(BOOL)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setFramePresentationTime:(id *)a3;
- (void)setOrientation:(int)a3;
- (void)setRatio:(CGSize)a3;
- (void)setScaleFactor:(float)a3;
- (void)setVideoMirrored:(BOOL)a3;
- (void)setVideoSourceScreen:(BOOL)a3;
- (void)updateCameraStatusBits:(unsigned __int8)a3;
@end

@implementation VideoAttributes

- (void)decodeFromNSDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = (NSString *)[a3 objectForKeyedSubscript:@"ratio"];
    v6 = (void *)[a3 objectForKeyedSubscript:@"orientation"];
    v7 = (void *)[a3 objectForKeyedSubscript:@"camera"];
    v8 = (void *)[a3 objectForKeyedSubscript:@"cameraSwitching"];
    v9 = (NSString *)[a3 objectForKeyedSubscript:@"contentsRect"];
    v10 = (void *)[a3 objectForKeyedSubscript:@"isVideoSourceScreen"];
    v11 = (void *)[a3 objectForKeyedSubscript:@"videoMirrored"];
    v14 = (void *)[a3 objectForKeyedSubscript:@"framePresentationTimeValue"];
    v12 = (void *)[a3 objectForKeyedSubscript:@"framePresentationTimeTimeScale"];
    v15 = (void *)[a3 objectForKeyedSubscript:@"scaleFactor"];
    self->ratio = NSSizeFromString(v5);
    self->orientation = [v6 intValue];
    self->camera = [v7 intValue];
    self->cameraSwitching = [v8 intValue] != 0;
    self->contentsRect = NSRectFromString(v9);
    self->videoSourceScreen = [v10 intValue] != 0;
    self->videoMirrored = [v11 intValue] != 0;
    CMTimeMake(&v16, [v14 longLongValue], objc_msgSend(v12, "intValue"));
    *(CMTime *)(&self->videoMirrored + 3) = v16;
    [v15 floatValue];
    HIDWORD(self->framePresentationTime.epoch) = v13;
  }
}

- (VideoAttributes)initWithEncodedDictionary:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VideoAttributes;
  v4 = [(VideoAttributes *)&v6 init];
  [(VideoAttributes *)v4 decodeFromNSDictionary:a3];
  return v4;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CGFloat width = self->ratio.width;
  CGFloat height = self->ratio.height;
  uint64_t orientation = self->orientation;
  v5 = "Invalid";
  if (orientation >= 3)
  {
    if (orientation == 3) {
      objc_super v6 = "LandscapeRight";
    }
    else {
      objc_super v6 = "Invalid";
    }
  }
  else
  {
    objc_super v6 = off_1E6DB7BD8[orientation];
  }
  int camera = self->camera;
  if (camera == 1) {
    v5 = "Back";
  }
  if (camera) {
    v8 = v5;
  }
  else {
    v8 = "Front";
  }
  if (self->cameraSwitching) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  CGFloat x = self->contentsRect.origin.x;
  CGFloat y = self->contentsRect.origin.y;
  if (self->videoSourceScreen) {
    v12 = "YES";
  }
  else {
    v12 = "NO";
  }
  if (self->videoMirrored) {
    int v13 = "YES";
  }
  else {
    int v13 = "NO";
  }
  CGSize size = self->contentsRect.size;
  *(_OWORD *)&time.value = *(_OWORD *)(&self->videoMirrored + 3);
  time.epoch = *(void *)&self->framePresentationTime.flags;
  return (id)[NSString stringWithFormat:@"[ratio:%.2fx%.2f orientation:%s camera:%s switching:%s contentsRect:%.3fx%.3f@(%.3f,%.3f) videoSourceScreen:%s videoMirrored:%s framePresentationTime:%f scaleFactor:%f]", *(void *)&width, *(void *)&height, v6, v8, v9, size, *(void *)&x, *(void *)&y, v12, v13, CMTimeGetSeconds(&time), *((float *)&self->framePresentationTime.epoch + 1)];
}

- (id)copyEncodedDictionary
{
  CMTime v16 = (void *)MEMORY[0x1E4E589F0](self, a2);
  v15 = NSStringFromSize(self->ratio);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:self->orientation];
  uint64_t v4 = [NSNumber numberWithUnsignedInt:self->camera];
  uint64_t v5 = [NSNumber numberWithBool:self->cameraSwitching];
  objc_super v6 = NSStringFromRect(self->contentsRect);
  uint64_t v7 = [NSNumber numberWithBool:self->videoSourceScreen];
  uint64_t v8 = [NSNumber numberWithBool:self->videoMirrored];
  uint64_t v9 = [NSNumber numberWithLongLong:*(void *)(&self->videoMirrored + 3)];
  uint64_t v10 = [NSNumber numberWithInt:HIDWORD(self->framePresentationTime.value)];
  LODWORD(v11) = HIDWORD(self->framePresentationTime.epoch);
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  int v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v15, @"ratio", v3, @"orientation", v4, @"camera", v5, @"cameraSwitching", v6, @"contentsRect", v7, @"isVideoSourceScreen", v8, @"videoMirrored", v9, @"framePresentationTimeValue", v10,
                  @"framePresentationTimeTimeScale",
                  v12,
                  @"scaleFactor",
                  0);
  return v13;
}

+ (VideoAttributes)videoAttributesWithVideoAttributes:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v4 = objc_alloc_init(VideoAttributes);
  [a3 ratio];
  -[VideoAttributes setRatio:](v4, "setRatio:");
  -[VideoAttributes setOrientation:](v4, "setOrientation:", [a3 orientation]);
  -[VideoAttributes setCamera:](v4, "setCamera:", [a3 camera]);
  -[VideoAttributes setCameraSwitching:](v4, "setCameraSwitching:", [a3 cameraSwitching]);
  [a3 contentsRect];
  -[VideoAttributes setContentsRect:](v4, "setContentsRect:");
  -[VideoAttributes setVideoSourceScreen:](v4, "setVideoSourceScreen:", [a3 videoSourceScreen]);
  -[VideoAttributes setVideoMirrored:](v4, "setVideoMirrored:", [a3 videoMirrored]);
  [a3 framePresentationTime];
  long long v6 = v8;
  uint64_t v7 = v9;
  [(VideoAttributes *)v4 setFramePresentationTime:&v6];
  [a3 scaleFactor];
  -[VideoAttributes setScaleFactor:](v4, "setScaleFactor:");
  return v4;
}

- (void)setOrientation:(int)a3
{
  self->uint64_t orientation = a3;
}

- (void)setCameraSwitching:(BOOL)a3
{
  self->cameraSwitching = a3;
}

- (void)setCamera:(int)a3
{
  self->int camera = a3;
}

- (int)camera
{
  return self->camera;
}

- (int)orientation
{
  return self->orientation;
}

- (BOOL)videoSourceScreen
{
  return self->videoSourceScreen;
}

- (BOOL)videoMirrored
{
  return self->videoMirrored;
}

- (BOOL)cameraSwitching
{
  return self->cameraSwitching;
}

- (void)setScaleFactor:(float)a3
{
  *((float *)&self->framePresentationTime.epoch + 1) = a3;
}

- (void)setRatio:(CGSize)a3
{
  self->ratio = a3;
}

- (VideoAttributes)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VideoAttributes;
  v2 = [(VideoAttributes *)&v11 init];
  uint64_t v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = *MEMORY[0x1E4F1DB30];
    *((void *)v2 + 3) = 0;
    *((void *)v2 + 5) = 0;
    *((void *)v2 + 6) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v2 + 56) = _Q0;
    CMTimeMake(&v10, 0, 1);
    *(CMTime *)(v3 + 76) = v10;
    *((_DWORD *)v3 + 25) = 1065353216;
  }
  return (VideoAttributes *)v3;
}

- (CGRect)contentsRect
{
  double x = self->contentsRect.origin.x;
  double y = self->contentsRect.origin.y;
  double width = self->contentsRect.size.width;
  double height = self->contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVideoSourceScreen:(BOOL)a3
{
  self->videoSourceScreen = a3;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->videoMirrored = a3;
}

- (void)setFramePresentationTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->framePresentationTime.flags = a3->var3;
  *(_OWORD *)(&self->videoMirrored + 3) = v3;
}

- (void)setContentsRect:(CGRect)a3
{
  self->contentsRect = a3;
}

- (float)scaleFactor
{
  return *((float *)&self->framePresentationTime.epoch + 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)framePresentationTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[3].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[3].var3 + 4);
  return self;
}

- (CGSize)ratio
{
  double width = self->ratio.width;
  double height = self->ratio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (VideoAttributes)initWithCameraStatusBits:(unsigned __int8)a3 aspectRatio:(CGSize)a4 contentsRect:(CGRect)a5 scaleFactor:(float)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v11 = a4.height;
  CGFloat v12 = a4.width;
  unsigned int v13 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VideoAttributes;
  v14 = [(VideoAttributes *)&v19 init];
  CMTime v16 = v14;
  if (v14)
  {
    v14->ratio.CGFloat width = v12;
    v14->ratio.CGFloat height = v11;
    v14->uint64_t orientation = v13 & 3;
    v14->int camera = (v13 >> 3) & 1;
    v14->cameraSwitching = (v13 & 0x40) != 0;
    v14->videoMirrored = (v13 & 4) != 0;
    v14->contentsRect.origin.CGFloat x = x;
    v14->contentsRect.origin.CGFloat y = y;
    v14->contentsRect.size.CGFloat width = width;
    v14->contentsRect.size.CGFloat height = height;
    *(float *)&double v15 = a6;
    [(VideoAttributes *)v14 setScaleFactor:v15];
    CMTimeMake(&v18, 0, 1);
    *(CMTime *)(&v16->videoMirrored + 3) = v18;
    v16->videoSourceScreen = (v13 & 0x30) == 16;
  }
  return v16;
}

+ (int)videoAttributeCameraForCameraUID:(id)a3
{
  if ([a3 isEqualToString:@"com.apple.avfoundation.avcapturedevice.built-in_video:0"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"com.apple.avfoundation.avcapturedevice.built-in_video:2"])return 2; {
  return 0;
  }
}

+ (id)cameraUIDForVideoAttributeCamera:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return (id)*((void *)&off_1E6DB7BC0 + a3);
  }
}

- (void)encodeWithCoder:(id)a3
{
  double x = self->contentsRect.origin.x;
  double y = self->contentsRect.origin.y;
  double width = self->contentsRect.size.width;
  double height = self->contentsRect.size.height;
  objc_msgSend(a3, "encodeSize:forKey:", @"ratio", self->ratio.width, self->ratio.height);
  [a3 encodeInt:self->orientation forKey:@"orientation"];
  [a3 encodeInt:self->camera forKey:@"camera"];
  [a3 encodeBool:self->cameraSwitching forKey:@"cameraSwitching"];
  objc_msgSend(a3, "encodeRect:forKey:", @"contentsRect", x, y, width, height);
  [a3 encodeBool:self->videoSourceScreen forKey:@"isVideoSourceScreen"];
  [a3 encodeBool:self->videoMirrored forKey:@"videoMirrored"];
  [a3 encodeInt64:*(void *)(&self->videoMirrored + 3) forKey:@"framePresentationTimeValue"];
  [a3 encodeInt32:HIDWORD(self->framePresentationTime.value) forKey:@"framePresentationTimeTimeScale"];
  LODWORD(v9) = HIDWORD(self->framePresentationTime.epoch);

  [a3 encodeFloat:@"scaleFactor" forKey:v9];
}

- (VideoAttributes)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [a3 decodeSizeForKey:@"ratio"];
  self->ratio.double width = v5;
  self->ratio.double height = v6;
  self->uint64_t orientation = [a3 decodeIntForKey:@"orientation"];
  self->int camera = [a3 decodeIntForKey:@"camera"];
  self->cameraSwitching = [a3 decodeBoolForKey:@"cameraSwitching"];
  [a3 decodeRectForKey:@"contentsRect"];
  self->contentsRect.origin.double x = v7;
  self->contentsRect.origin.double y = v8;
  self->contentsRect.size.double width = v9;
  self->contentsRect.size.double height = v10;
  self->videoSourceScreen = [a3 decodeBoolForKey:@"isVideoSourceScreen"];
  self->videoMirrored = [a3 decodeBoolForKey:@"videoMirrored"];
  CMTimeMake(&v13, [a3 decodeInt64ForKey:@"framePresentationTimeValue"], objc_msgSend(a3, "decodeInt32ForKey:", @"framePresentationTimeTimeScale"));
  *(_OWORD *)(&self->videoMirrored + 3) = *(_OWORD *)&v13.value;
  *(void *)&self->framePresentationTime.flags = v13.epoch;
  [a3 decodeFloatForKey:@"scaleFactor"];
  HIDWORD(self->framePresentationTime.epoch) = v11;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[VideoAttributes allocWithZone:a3] init];
  if (result)
  {
    *(CGSize *)((char *)result + 8) = self->ratio;
    *((_DWORD *)result + 6) = self->orientation;
    *((_DWORD *)result + 7) = self->camera;
    *((unsigned char *)result + 32) = self->cameraSwitching;
    CGPoint origin = self->contentsRect.origin;
    *(CGSize *)((char *)result + 56) = self->contentsRect.size;
    *(CGPoint *)((char *)result + 40) = origin;
    *((unsigned char *)result + 72) = self->videoSourceScreen;
    *((unsigned char *)result + 73) = self->videoMirrored;
    long long v6 = *(_OWORD *)(&self->videoMirrored + 3);
    *(void *)((char *)result + 92) = *(void *)&self->framePresentationTime.flags;
    *(_OWORD *)((char *)result + 76) = v6;
    *((_DWORD *)result + 25) = HIDWORD(self->framePresentationTime.epoch);
  }
  return result;
}

- (void)updateCameraStatusBits:(unsigned __int8)a3
{
  self->uint64_t orientation = a3 & 3;
  self->int camera = (a3 >> 3) & 1;
  self->cameraSwitching = (a3 & 0x40) != 0;
  self->videoMirrored = (a3 & 4) != 0;
  self->videoSourceScreen = (a3 & 0x30) == 16;
}

@end