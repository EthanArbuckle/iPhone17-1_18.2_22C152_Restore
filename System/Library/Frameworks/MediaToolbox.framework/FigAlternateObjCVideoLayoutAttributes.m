@interface FigAlternateObjCVideoLayoutAttributes
- (FigAlternateObjCVideoLayoutAttributes)initWithTagCollection:(OpaqueCMTagCollection *)a3;
- (unint64_t)packingType;
- (unint64_t)projectionType;
- (unint64_t)stereoViewComponents;
- (void)dealloc;
@end

@implementation FigAlternateObjCVideoLayoutAttributes

- (FigAlternateObjCVideoLayoutAttributes)initWithTagCollection:(OpaqueCMTagCollection *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigAlternateObjCVideoLayoutAttributes;
  v4 = [(FigAlternateObjCVideoLayoutAttributes *)&v7 init];
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
  v4.super_class = (Class)FigAlternateObjCVideoLayoutAttributes;
  [(FigAlternateObjCVideoLayoutAttributes *)&v4 dealloc];
}

- (unint64_t)stereoViewComponents
{
  CMTag tagBuffer = (CMTag)*MEMORY[0x1E4F21DE8];
  CMItemCount numberOfTagsCopied = 0;
  unint64_t result = (unint64_t)self->_tagCollection;
  if (result)
  {
    if (CMTagCollectionGetTagsWithCategory((CMTagCollectionRef)result, kCMTagCategory_StereoView, &tagBuffer, 1, &numberOfTagsCopied))
    {
      BOOL v3 = 0;
    }
    else
    {
      BOOL v3 = numberOfTagsCopied == 1;
    }
    if (v3) {
      return CMTagGetFlagsValue(tagBuffer);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (unint64_t)projectionType
{
  unint64_t v2 = 1919247220;
  CMTag tagBuffer = (CMTag)*MEMORY[0x1E4F21DE8];
  CMItemCount numberOfTagsCopied = 0;
  tagCollection = self->_tagCollection;
  if (tagCollection)
  {
    if (CMTagCollectionGetTagsWithCategory(tagCollection, kCMTagCategory_ProjectionType, &tagBuffer, 1, &numberOfTagsCopied))
    {
      BOOL v4 = 0;
    }
    else
    {
      BOOL v4 = numberOfTagsCopied == 1;
    }
    if (v4) {
      return CMTagGetFlagsValue(tagBuffer);
    }
  }
  return v2;
}

- (unint64_t)packingType
{
  unint64_t v2 = 1852796517;
  CMTag tagBuffer = (CMTag)*MEMORY[0x1E4F21DE8];
  CMItemCount numberOfTagsCopied = 0;
  tagCollection = self->_tagCollection;
  if (tagCollection)
  {
    if (CMTagCollectionGetTagsWithCategory(tagCollection, kCMTagCategory_PackingType, &tagBuffer, 1, &numberOfTagsCopied))
    {
      BOOL v4 = 0;
    }
    else
    {
      BOOL v4 = numberOfTagsCopied == 1;
    }
    if (v4) {
      return CMTagGetFlagsValue(tagBuffer);
    }
  }
  return v2;
}

@end