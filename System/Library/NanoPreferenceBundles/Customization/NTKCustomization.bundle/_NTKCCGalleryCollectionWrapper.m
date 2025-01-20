@interface _NTKCCGalleryCollectionWrapper
- (CGPoint)scrollOffset;
- (NTKGalleryCollection)collection;
- (_NTKCCGalleryCollectionWrapper)initWithCollection:(id)a3;
- (void)setScrollOffset:(CGPoint)a3;
@end

@implementation _NTKCCGalleryCollectionWrapper

- (_NTKCCGalleryCollectionWrapper)initWithCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_NTKCCGalleryCollectionWrapper;
  v6 = [(_NTKCCGalleryCollectionWrapper *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    v7->_scrollOffset = CGPointZero;
  }

  return v7;
}

- (NTKGalleryCollection)collection
{
  return self->_collection;
}

- (CGPoint)scrollOffset
{
  double x = self->_scrollOffset.x;
  double y = self->_scrollOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScrollOffset:(CGPoint)a3
{
  self->_scrollOffset = a3;
}

- (void).cxx_destruct
{
}

@end