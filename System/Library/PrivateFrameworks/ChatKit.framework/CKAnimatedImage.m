@interface CKAnimatedImage
+ (id)animatedImageFromOptimizedBitmapAtFileURL:(id)a3 error:(id *)a4;
- (BOOL)writeAsOptimizedBitmapToFileURL:(id)a3 error:(id *)a4;
- (CGSize)size;
- (CKAnimatedImage)initWithImages:(id)a3 durations:(id)a4;
- (CKAnimatedImage)initWithMultiFrameImage:(id)a3;
- (CKMultiFrameImage)multiFrameImage;
- (NSArray)durations;
- (NSArray)frameEndTimestamps;
- (NSArray)frameStartTimestamps;
- (NSArray)frames;
- (UIImage)cachedMultiFrameUIImage;
- (UIImage)image;
- (double)animationStartTimeOffset;
- (double)endTimestampForFrameIndex:(unint64_t)a3;
- (double)scale;
- (double)timeInLoopForTime:(double)a3;
- (id)description;
- (id)frameForAnimationTime:(double)a3;
- (int64_t)frameIndexForAnimationTime:(double)a3;
- (int64_t)previouslyReturnedFrameIndexHint;
- (void)_calculateFrameTimestamps;
- (void)setAnimationStartTimeOffset:(double)a3;
- (void)setCachedMultiFrameUIImage:(id)a3;
- (void)setMultiFrameImage:(id)a3;
- (void)setPreviouslyReturnedFrameIndexHint:(int64_t)a3;
@end

@implementation CKAnimatedImage

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)CKAnimatedImage;
  v3 = [(CKAnimatedImage *)&v14 description];
  v4 = [(CKAnimatedImage *)self image];
  v5 = [(CKAnimatedImage *)self image];
  v6 = [v5 images];
  uint64_t v7 = [v6 count];
  v8 = [(CKAnimatedImage *)self image];
  [v8 duration];
  uint64_t v10 = v9;
  v11 = [(CKAnimatedImage *)self durations];
  v12 = [v3 stringByAppendingFormat:@" (image:%@ #images:%ld duration:%f #durations:%ld)", v4, v7, v10, objc_msgSend(v11, "count")];

  return v12;
}

- (CKAnimatedImage)initWithImages:(id)a3 durations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[CKMultiFrameImage alloc] initWithFrameImages:v7 frameDurations:v6];

  if (v8)
  {
    self = [(CKAnimatedImage *)self initWithMultiFrameImage:v8];
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKAnimatedImage initWithImages:durations:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (CKAnimatedImage)initWithMultiFrameImage:(id)a3
{
  id v5 = a3;
  if (![v5 frameCount])
  {
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CKAnimatedImage initWithMultiFrameImage:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_10;
  }
  uint64_t v6 = [v5 frameCount];
  id v7 = [v5 frameDurations];
  uint64_t v8 = [v7 count];

  if (v6 != v8)
  {
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CKAnimatedImage initWithMultiFrameImage:](v12, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_10:

    uint64_t v11 = 0;
    goto LABEL_11;
  }
  v28.receiver = self;
  v28.super_class = (Class)CKAnimatedImage;
  uint64_t v9 = [(CKAnimatedImage *)&v28 init];
  uint64_t v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_multiFrameImage, a3);
  }
  self = v10;
  uint64_t v11 = self;
LABEL_11:

  return v11;
}

- (UIImage)image
{
  cachedMultiFrameUIImage = self->_cachedMultiFrameUIImage;
  if (!cachedMultiFrameUIImage)
  {
    uint64_t v10 = 0;
    uint64_t v11 = (double *)&v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v4 = [(CKMultiFrameImage *)self->_multiFrameImage frameDurations];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __24__CKAnimatedImage_image__block_invoke;
    v9[3] = &unk_1E562A3E0;
    v9[4] = &v10;
    [v4 enumerateObjectsUsingBlock:v9];

    id v5 = [(CKMultiFrameImage *)self->_multiFrameImage loadAllFrameImages];
    uint64_t v6 = [MEMORY[0x1E4F42A80] animatedImageWithImages:v5 duration:v11[3]];
    id v7 = self->_cachedMultiFrameUIImage;
    self->_cachedMultiFrameUIImage = v6;

    _Block_object_dispose(&v10, 8);
    cachedMultiFrameUIImage = self->_cachedMultiFrameUIImage;
  }

  return cachedMultiFrameUIImage;
}

double __24__CKAnimatedImage_image__block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (NSArray)frames
{
  v2 = [(CKAnimatedImage *)self image];
  uint64_t v3 = [v2 images];

  return (NSArray *)v3;
}

- (NSArray)durations
{
  return [(CKMultiFrameImage *)self->_multiFrameImage frameDurations];
}

- (CGSize)size
{
  v2 = [(CKAnimatedImage *)self image];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)scale
{
  v2 = [(CKAnimatedImage *)self image];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (BOOL)writeAsOptimizedBitmapToFileURL:(id)a3 error:(id *)a4
{
  return [(CKMultiFrameImage *)self->_multiFrameImage writeAsOptimizedBitmapToFileURL:a3 error:a4];
}

+ (id)animatedImageFromOptimizedBitmapAtFileURL:(id)a3 error:(id *)a4
{
  id v10 = 0;
  double v5 = +[CKMultiFrameImage multiFrameImageFromOptimizedBitmapAtFileURL:a3 error:&v10];
  id v6 = v10;
  if (v5)
  {
    double v7 = [[CKAnimatedImage alloc] initWithMultiFrameImage:v5];
  }
  else
  {
    double v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CKAnimatedImage animatedImageFromOptimizedBitmapAtFileURL:error:]((uint64_t)v6, v8);
    }

    double v7 = 0;
    if (a4) {
      *a4 = v6;
    }
  }

  return v7;
}

- (NSArray)frameStartTimestamps
{
  frameStartTimestamps = self->_frameStartTimestamps;
  if (!frameStartTimestamps)
  {
    [(CKAnimatedImage *)self _calculateFrameTimestamps];
    frameStartTimestamps = self->_frameStartTimestamps;
  }

  return frameStartTimestamps;
}

- (NSArray)frameEndTimestamps
{
  frameEndTimestamps = self->_frameEndTimestamps;
  if (!frameEndTimestamps)
  {
    [(CKAnimatedImage *)self _calculateFrameTimestamps];
    frameEndTimestamps = self->_frameEndTimestamps;
  }

  return frameEndTimestamps;
}

- (void)_calculateFrameTimestamps
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKAnimatedImage *)self durations];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    double v10 = 0.0;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithDouble:", v10, (void)v20);
        [v4 addObject:v13];

        [v12 doubleValue];
        double v10 = v10 + v14;
        uint64_t v15 = [NSNumber numberWithDouble:v10];
        [v5 addObject:v15];

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  uint64_t v16 = (NSArray *)[v4 copy];
  frameStartTimestamps = self->_frameStartTimestamps;
  self->_frameStartTimestamps = v16;

  uint64_t v18 = (NSArray *)[v5 copy];
  frameEndTimestamps = self->_frameEndTimestamps;
  self->_frameEndTimestamps = v18;
}

- (double)timeInLoopForTime:(double)a3
{
  id v5 = [(CKAnimatedImage *)self frameEndTimestamps];
  id v6 = [v5 lastObject];
  [v6 doubleValue];
  long double v8 = v7;

  [(CKAnimatedImage *)self animationStartTimeOffset];
  double v10 = a3 - fmax(fmin(v9, a3), 0.0);

  return fmod(v10, v8);
}

- (double)endTimestampForFrameIndex:(unint64_t)a3
{
  id v5 = [(CKAnimatedImage *)self frameEndTimestamps];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return 0.0;
  }
  double v7 = [(CKAnimatedImage *)self frameEndTimestamps];
  long double v8 = [v7 objectAtIndex:a3];

  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

- (int64_t)frameIndexForAnimationTime:(double)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = [(CKAnimatedImage *)self frameStartTimestamps];
  unint64_t v6 = [(CKAnimatedImage *)self frameEndTimestamps];
  uint64_t v7 = [v5 count];
  [(CKAnimatedImage *)self timeInLoopForTime:a3];
  if (v8 == 0.0)
  {
LABEL_2:
    int64_t previouslyReturnedFrameIndexHint = 0;
    self->_int64_t previouslyReturnedFrameIndexHint = 0;
    goto LABEL_3;
  }
  double v11 = v8;
  int64_t v12 = v7 - 1;
  int64_t previouslyReturnedFrameIndexHint = self->_previouslyReturnedFrameIndexHint;
  int64_t v13 = previouslyReturnedFrameIndexHint + 5;
  if (previouslyReturnedFrameIndexHint + 5 >= v12) {
    int64_t v13 = v12;
  }
  if (previouslyReturnedFrameIndexHint > v13)
  {
LABEL_13:
    if ([v6 count])
    {
      long long v22 = [v5 firstObject];
      [v22 doubleValue];
      double v24 = v23;

      uint64_t v25 = [v6 firstObject];
      [v25 doubleValue];
      double v27 = v26;

      if (v11 >= v24 && v11 < v27) {
        goto LABEL_2;
      }
    }
    objc_super v28 = [NSNumber numberWithDouble:v11];
    uint64_t v29 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v28, 0, objc_msgSend(v5, "count"), 1280, &__block_literal_global_199);

    if (v29 <= 0) {
      goto LABEL_2;
    }
    if (v29 <= (unint64_t)[v5 count])
    {
      int64_t previouslyReturnedFrameIndexHint = v29 - 1;
      self->_int64_t previouslyReturnedFrameIndexHint = v29 - 1;
      if (IMOSLoggingEnabled())
      {
        v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          int v31 = 134217984;
          uint64_t v32 = v29 - 1;
          _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "Fell back to a binary search to determine frame index: %ld", (uint8_t *)&v31, 0xCu);
        }
      }
    }
    else
    {
      self->_int64_t previouslyReturnedFrameIndexHint = v12;
      int64_t previouslyReturnedFrameIndexHint = v12;
    }
  }
  else
  {
    int64_t v14 = v13 + 1;
    while (1)
    {
      uint64_t v15 = [v5 objectAtIndexedSubscript:previouslyReturnedFrameIndexHint];
      [v15 doubleValue];
      double v17 = v16;

      uint64_t v18 = [v6 objectAtIndexedSubscript:previouslyReturnedFrameIndexHint];
      [v18 doubleValue];
      double v20 = v19;

      if (v11 >= v17 && v11 < v20) {
        break;
      }
      if (v14 == ++previouslyReturnedFrameIndexHint) {
        goto LABEL_13;
      }
    }
    self->_int64_t previouslyReturnedFrameIndexHint = previouslyReturnedFrameIndexHint;
  }
LABEL_3:

  return previouslyReturnedFrameIndexHint;
}

uint64_t __46__CKAnimatedImage_frameIndexForAnimationTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)frameForAnimationTime:(double)a3
{
  unint64_t v4 = [(CKAnimatedImage *)self frameIndexForAnimationTime:a3];
  id v5 = [(CKAnimatedImage *)self frames];
  unint64_t v6 = v5;
  if ((v4 & 0x8000000000000000) != 0 || v4 >= [v5 count])
  {
    double v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKAnimatedImage frameForAnimationTime:](v4, v8);
    }

    uint64_t v7 = [v6 firstObject];
  }
  else
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:v4];
  }
  double v9 = (void *)v7;

  return v9;
}

- (double)animationStartTimeOffset
{
  return self->_animationStartTimeOffset;
}

- (void)setAnimationStartTimeOffset:(double)a3
{
  self->_animationStartTimeOffset = a3;
}

- (CKMultiFrameImage)multiFrameImage
{
  return self->_multiFrameImage;
}

- (void)setMultiFrameImage:(id)a3
{
}

- (UIImage)cachedMultiFrameUIImage
{
  return self->_cachedMultiFrameUIImage;
}

- (void)setCachedMultiFrameUIImage:(id)a3
{
}

- (int64_t)previouslyReturnedFrameIndexHint
{
  return self->_previouslyReturnedFrameIndexHint;
}

- (void)setPreviouslyReturnedFrameIndexHint:(int64_t)a3
{
  self->_int64_t previouslyReturnedFrameIndexHint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMultiFrameUIImage, 0);
  objc_storeStrong((id *)&self->_multiFrameImage, 0);
  objc_storeStrong((id *)&self->_frameEndTimestamps, 0);

  objc_storeStrong((id *)&self->_frameStartTimestamps, 0);
}

- (void)initWithImages:(uint64_t)a3 durations:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMultiFrameImage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMultiFrameImage:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)animatedImageFromOptimizedBitmapAtFileURL:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Failed to create multi frame image from optimized bitmap file URL. Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)frameForAnimationTime:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Attempted to play an invalid frame index: %ld", (uint8_t *)&v2, 0xCu);
}

@end