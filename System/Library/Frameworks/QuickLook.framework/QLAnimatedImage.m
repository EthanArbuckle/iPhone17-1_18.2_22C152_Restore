@interface QLAnimatedImage
- (BOOL)time:(double)a3 belongsToIndex:(unint64_t)a4;
- (QLAnimatedImage)initWithImageSource:(CGImageSource *)a3;
- (double)duration;
- (id)frameAtTime:(double)a3;
- (int64_t)indexForTime:(double)a3;
- (unint64_t)frameCount;
- (void)dealloc;
- (void)generateDurations;
@end

@implementation QLAnimatedImage

- (void)dealloc
{
  free(self->_durations);
  v3.receiver = self;
  v3.super_class = (Class)QLAnimatedImage;
  [(QLAnimatedImage *)&v3 dealloc];
}

- (QLAnimatedImage)initWithImageSource:(CGImageSource *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)QLAnimatedImage;
  v4 = [(QLAnimatedImage *)&v11 init];
  if (v4)
  {
    v5 = [[QLImageData alloc] initWithImageSource:a3];
    imageData = v4->_imageData;
    v4->_imageData = v5;

    v4->_lastImageIndex = 0;
    uint64_t v7 = [(QLImageData *)v4->_imageData imageAtIndex:0];
    lastImage = v4->_lastImage;
    v4->_lastImage = (UIImage *)v7;

    [(QLAnimatedImage *)v4 generateDurations];
    v9 = v4;
  }

  return v4;
}

- (void)generateDurations
{
  if (!self->_durations)
  {
    id v13 = [(QLImageData *)self->_imageData durations];
    unint64_t v3 = [v13 count];
    self->_unint64_t durationsCount = v3;
    if (v3)
    {
      durations = (QLFrameDurationInformation *)malloc_type_malloc(16 * v3, 0x1000040451B5BE8uLL);
      self->_durations = durations;
      if (self->_durationsCount)
      {
        uint64_t v5 = 0;
        unint64_t v6 = 0;
        do
        {
          uint64_t v7 = [v13 objectAtIndexedSubscript:v6];
          [v7 floatValue];
          self->_durations[v5].var0 = v8;

          durations = self->_durations;
          if (v6) {
            double var1 = durations[(v6 - 1)].var1;
          }
          else {
            double var1 = 0.0;
          }
          durations[v5].double var1 = var1 + durations[v5].var0;
          ++v6;
          unint64_t durationsCount = self->_durationsCount;
          ++v5;
        }
        while (durationsCount > v6);
        uint64_t v11 = durationsCount - 1;
      }
      else
      {
        uint64_t v11 = -1;
      }
      double v12 = durations[v11].var1;
    }
    else
    {
      double v12 = 0.0;
    }
    self->_duration = v12;
  }
}

- (unint64_t)frameCount
{
  return self->_durationsCount;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)indexForTime:(double)a3
{
  unint64_t durationsCount = self->_durationsCount;
  if (!durationsCount) {
    return durationsCount - 1;
  }
  int64_t result = 0;
  for (i = &self->_durations->var1; *i <= a3; i += 2)
  {
    if (durationsCount == ++result) {
      return durationsCount - 1;
    }
  }
  return result;
}

- (BOOL)time:(double)a3 belongsToIndex:(unint64_t)a4
{
  BOOL result = self->_durationsCount > a4
        && (durations = self->_durations, double var1 = durations[a4].var1, var1 > a3)
        && var1 - durations[a4].var0 < a3;
  return result;
}

- (id)frameAtTime:(double)a3
{
  if (-[QLAnimatedImage time:belongsToIndex:](self, "time:belongsToIndex:", self->_lastImageIndex))
  {
    p_lastImage = &self->_lastImage;
  }
  else
  {
    unint64_t lastImageIndex = self->_lastImageIndex;
    if (lastImageIndex < self->_durationsCount - 1
      && [(QLAnimatedImage *)self time:lastImageIndex + 1 belongsToIndex:a3])
    {
      unint64_t v7 = self->_lastImageIndex + 1;
    }
    else
    {
      unint64_t v7 = [(QLAnimatedImage *)self indexForTime:a3];
    }
    self->_unint64_t lastImageIndex = v7;
    uint64_t v8 = -[QLImageData imageAtIndex:](self->_imageData, "imageAtIndex:");
    lastImage = self->_lastImage;
    p_lastImage = &self->_lastImage;
    *p_lastImage = (UIImage *)v8;
  }
  v10 = *p_lastImage;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastImage, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

@end