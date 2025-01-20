@interface PHFetchResultMediaTypeCounts
+ (PHFetchResultMediaTypeCounts)mediaTypeCountsWithPhotosCount:(unint64_t)a3 videosCount:(unint64_t)a4 audiosCount:(unint64_t)a5;
- (PHFetchResultMediaTypeCounts)initWithPhotosCount:(unint64_t)a3 videosCount:(unint64_t)a4 audiosCount:(unint64_t)a5;
- (unint64_t)audiosCount;
- (unint64_t)photosCount;
- (unint64_t)videosCount;
@end

@implementation PHFetchResultMediaTypeCounts

+ (PHFetchResultMediaTypeCounts)mediaTypeCountsWithPhotosCount:(unint64_t)a3 videosCount:(unint64_t)a4 audiosCount:(unint64_t)a5
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL && a4 == 0x7FFFFFFFFFFFFFFFLL && a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithPhotosCount:a3 videosCount:a4 audiosCount:a5];
  }
  return (PHFetchResultMediaTypeCounts *)v8;
}

- (unint64_t)audiosCount
{
  return self->_audiosCount;
}

- (unint64_t)videosCount
{
  return self->_videosCount;
}

- (unint64_t)photosCount
{
  return self->_photosCount;
}

- (PHFetchResultMediaTypeCounts)initWithPhotosCount:(unint64_t)a3 videosCount:(unint64_t)a4 audiosCount:(unint64_t)a5
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHFetchResultMediaTypeCounts.m", 22, @"Invalid parameter not satisfying: %@", @"photosCount != NSNotFound" object file lineNumber description];
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PHFetchResultMediaTypeCounts.m", 23, @"Invalid parameter not satisfying: %@", @"videosCount != NSNotFound" object file lineNumber description];
  }
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PHFetchResultMediaTypeCounts.m", 24, @"Invalid parameter not satisfying: %@", @"audiosCount != NSNotFound" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PHFetchResultMediaTypeCounts;
  v10 = [(PHFetchResultMediaTypeCounts *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_photosCount = a3;
    v10->_videosCount = a4;
    v10->_audiosCount = a5;
    v12 = v10;
  }

  return v11;
}

@end