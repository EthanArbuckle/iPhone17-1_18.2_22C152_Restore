@interface FRCFaceHandLegBlock
+ (id)faceHandLegBlockWithRect:(CGRect)a3 numberOfBlocks:(unint64_t)a4 category:(unint64_t)a5;
- (CGRect)rect;
- (unint64_t)category;
- (unint64_t)numberOfBlocks;
- (void)setCategory:(unint64_t)a3;
- (void)setNumberOfBlocks:(unint64_t)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation FRCFaceHandLegBlock

+ (id)faceHandLegBlockWithRect:(CGRect)a3 numberOfBlocks:(unint64_t)a4 category:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___FRCFaceHandLegBlock;
  v11 = objc_msgSend(objc_msgSendSuper2(&v15, sel_alloc), "init");
  v12 = v11;
  if (v11)
  {
    [v11 setCategory:a5];
    objc_msgSend(v12, "setRect:", x, y, width, height);
    [v12 setNumberOfBlocks:a4];
    id v13 = v12;
  }

  return v12;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_categordouble y = a3;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (unint64_t)numberOfBlocks
{
  return self->_numberOfBlocks;
}

- (void)setNumberOfBlocks:(unint64_t)a3
{
  self->_numberOfBlocks = a3;
}

@end