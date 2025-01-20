@interface CAMVideoThumbnailOutputConfiguration
- (CAMVideoThumbnailOutputConfiguration)initWithThumbnailSize:(CGSize)a3 filters:(id)a4;
- (CGSize)thumbnailSize;
- (NSArray)filters;
@end

@implementation CAMVideoThumbnailOutputConfiguration

- (CAMVideoThumbnailOutputConfiguration)initWithThumbnailSize:(CGSize)a3 filters:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMVideoThumbnailOutputConfiguration;
  uint64_t v9 = [(CAMVideoThumbnailOutputConfiguration *)&v12 self];

  if (v9)
  {
    *(CGFloat *)(v9 + 16) = width;
    *(CGFloat *)(v9 + 24) = height;
    objc_storeStrong((id *)(v9 + 8), a4);
    id v10 = (id)v9;
  }

  return (CAMVideoThumbnailOutputConfiguration *)v9;
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)filters
{
  return self->_filters;
}

- (void).cxx_destruct
{
}

@end