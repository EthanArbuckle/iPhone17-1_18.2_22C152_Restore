@interface FigAlternateObjCVideoAttributes
- (CGSize)presentationSize;
- (FigAlternateObjCVideoAttributes)initWithFigAlternate:(OpaqueFigAlternate *)a3;
- (NSArray)codecTypes;
- (NSArray)immersiveAttributes;
- (NSArray)videoLayoutAttributes;
- (NSString)videoRange;
- (double)nominalFrameRate;
- (double)presentationHeight;
- (double)presentationWidth;
- (void)dealloc;
@end

@implementation FigAlternateObjCVideoAttributes

- (FigAlternateObjCVideoAttributes)initWithFigAlternate:(OpaqueFigAlternate *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FigAlternateObjCVideoAttributes;
  v4 = [(FigAlternateObjCVideoAttributes *)&v9 init];
  if (v4)
  {
    if (a3) {
      v5 = (OpaqueFigAlternate *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_alternate = v5;
    v4->_presentationSize.width = FigAlternateGetResolution((uint64_t)a3);
    v4->_presentationSize.height = v6;
    if (FigAlternateIsFrameRateDeclared((BOOL)a3)) {
      double FrameRate = FigAlternateGetFrameRate((uint64_t)a3);
    }
    else {
      double FrameRate = -1.0;
    }
    v4->_nominaldouble FrameRate = FrameRate;
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

- (NSString)videoRange
{
  int VideoRange = FigAlternateGetVideoRange((uint64_t)self->_alternate);
  v3 = @"AVVideoRangeSDR";
  if (VideoRange == 2) {
    v3 = @"AVVideoRangeHLG";
  }
  if (VideoRange == 3) {
    return (NSString *)@"AVVideoRangePQ";
  }
  else {
    return &v3->isa;
  }
}

- (double)presentationWidth
{
  return self->_presentationSize.width;
}

- (double)presentationHeight
{
  return self->_presentationSize.height;
}

- (NSArray)codecTypes
{
  MEMORY[0x19970E910](self->_mutex, a2);
  if (!self->_videoCodecTypes)
  {
    VideoCodecs = (NSArray *)FigAlternateGetVideoCodecs((uint64_t)self->_alternate);
    self->_videoCodecTypes = VideoCodecs;
    if (!VideoCodecs)
    {
      VideoCodecs = (NSArray *)[MEMORY[0x1E4F1C978] array];
      self->_videoCodecTypes = VideoCodecs;
    }
    v4 = VideoCodecs;
  }
  MEMORY[0x19970E930](self->_mutex);
  v5 = self->_videoCodecTypes;

  return v5;
}

- (NSArray)immersiveAttributes
{
  MEMORY[0x19970E910](self->_mutex, a2);
  if (!self->_allImmersiveAttributes)
  {
    VideoLayoutTags = FigAlternateGetVideoLayoutTags((__CFArray *)self->_alternate);
    v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    CFIndex v5 = 0;
    if (!VideoLayoutTags) {
      goto LABEL_4;
    }
LABEL_3:
    for (CFIndex i = CFArrayGetCount(VideoLayoutTags); v5 < i; CFIndex i = 0)
    {
      v7 = [[FigAlternateObjCVideoImmersiveAttributes alloc] initWithTagCollection:CFArrayGetValueAtIndex(VideoLayoutTags, v5)];
      [v4 addObject:v7];

      ++v5;
      if (VideoLayoutTags) {
        goto LABEL_3;
      }
LABEL_4:
      ;
    }
    self->_allImmersiveAttributes = (NSArray *)[v4 copy];
  }
  MEMORY[0x19970E930](self->_mutex);
  v8 = self->_allImmersiveAttributes;

  return v8;
}

- (NSArray)videoLayoutAttributes
{
  MEMORY[0x19970E910](self->_mutex, a2);
  if (!self->_videoLayoutAttributes)
  {
    VideoLayoutTags = FigAlternateGetVideoLayoutTags((__CFArray *)self->_alternate);
    v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    CFIndex v5 = 0;
    if (!VideoLayoutTags) {
      goto LABEL_4;
    }
LABEL_3:
    for (CFIndex i = CFArrayGetCount(VideoLayoutTags); v5 < i; CFIndex i = 0)
    {
      v7 = [[FigAlternateObjCVideoLayoutAttributes alloc] initWithTagCollection:CFArrayGetValueAtIndex(VideoLayoutTags, v5)];
      [v4 addObject:v7];

      ++v5;
      if (VideoLayoutTags) {
        goto LABEL_3;
      }
LABEL_4:
      ;
    }
    self->_videoLayoutAttributes = (NSArray *)v4;
  }
  MEMORY[0x19970E930](self->_mutex);
  v8 = self->_videoLayoutAttributes;

  return v8;
}

- (void)dealloc
{
  alternate = self->_alternate;
  if (alternate) {
    CFRelease(alternate);
  }

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)FigAlternateObjCVideoAttributes;
  [(FigAlternateObjCVideoAttributes *)&v4 dealloc];
}

- (CGSize)presentationSize
{
  double width = self->_presentationSize.width;
  double height = self->_presentationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)nominalFrameRate
{
  return self->_nominalFrameRate;
}

@end