@interface FigAlternateObjCVideoImmersiveAttributes
- (FigAlternateObjCVideoImmersiveAttributes)initWithTagCollection:(OpaqueCMTagCollection *)a3;
- (int64_t)channelLayout;
- (int64_t)packing;
- (int64_t)projection;
- (void)dealloc;
@end

@implementation FigAlternateObjCVideoImmersiveAttributes

- (FigAlternateObjCVideoImmersiveAttributes)initWithTagCollection:(OpaqueCMTagCollection *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigAlternateObjCVideoImmersiveAttributes;
  v4 = [(FigAlternateObjCVideoImmersiveAttributes *)&v7 init];
  if (v4)
  {
    if (a3) {
      v5 = (OpaqueCMTagCollection *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_tagCollection = v5;
  }
  return v4;
}

- (void)dealloc
{
  tagCollection = self->_tagCollection;
  if (tagCollection) {
    CFRelease(tagCollection);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigAlternateObjCVideoImmersiveAttributes;
  [(FigAlternateObjCVideoImmersiveAttributes *)&v4 dealloc];
}

- (int64_t)channelLayout
{
  int64_t result = (int64_t)self->_tagCollection;
  if (result)
  {
    FigTagCollectionGetTagsWithCategory();
    return 0;
  }
  return result;
}

- (int64_t)projection
{
  int64_t result = (int64_t)self->_tagCollection;
  if (result)
  {
    FigTagCollectionGetTagsWithCategory();
    return 0;
  }
  return result;
}

- (int64_t)packing
{
  int64_t result = (int64_t)self->_tagCollection;
  if (result)
  {
    FigTagCollectionGetTagsWithCategory();
    return 0;
  }
  return result;
}

@end