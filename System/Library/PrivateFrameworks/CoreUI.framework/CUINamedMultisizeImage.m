@interface CUINamedMultisizeImage
- (CGSize)nextSizeSmaller;
- (id)debugDescription;
- (void)setNextSizeSmaller:(CGSize)a3;
@end

@implementation CUINamedMultisizeImage

- (id)debugDescription
{
  int64_t v3 = [(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] themeDimension2];
  v6.receiver = self;
  v6.super_class = (Class)CUINamedMultisizeImage;
  id v4 = [(CUINamedMultisizeImage *)&v6 debugDescription];
  [(CUINamedMultisizeImage *)self nextSizeSmaller];
  return [v4 stringByAppendingString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\ndimension2 (size index): %d\nnextSizeSmaller: %@", v3, NSStringFromSize(v7))];
}

- (CGSize)nextSizeSmaller
{
  double width = self->_nextSizeSmaller.width;
  double height = self->_nextSizeSmaller.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNextSizeSmaller:(CGSize)a3
{
  self->_nextSizeSmaller = a3;
}

@end