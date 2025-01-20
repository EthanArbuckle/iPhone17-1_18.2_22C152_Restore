@interface CUIRenditionSliceInformation
- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets;
- (CGRect)destinationRect;
- (CGSize)_bottomRightCapSize;
- (CGSize)_topLeftCapSize;
- (CUIRenditionSliceInformation)initWithRenditionType:(int64_t)a3 destinationRect:(CGRect)a4 topLeftInset:(CGSize)a5 bottomRightInset:(CGSize)a6;
- (CUIRenditionSliceInformation)initWithSliceInformation:(id)a3 destinationRect:(CGRect)a4;
- (double)positionOfSliceBoundary:(unint64_t)a3;
- (id)description;
- (int64_t)renditionType;
@end

@implementation CUIRenditionSliceInformation

- (CUIRenditionSliceInformation)initWithRenditionType:(int64_t)a3 destinationRect:(CGRect)a4 topLeftInset:(CGSize)a5 bottomRightInset:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat v8 = a5.height;
  CGFloat v9 = a5.width;
  double v10 = a4.size.height;
  double v11 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CUIRenditionSliceInformation;
  result = [(CUIRenditionSliceInformation *)&v16 init];
  if (result)
  {
    result->_destinationRect.origin.double x = x;
    result->_destinationRect.origin.double y = y;
    result->_destinationRect.size.CGFloat width = v11;
    result->_destinationRect.size.CGFloat height = v10;
    result->_renditionType = a3;
    if ((unint64_t)(a3 - 1000) > 0x12 || a3 == 1003)
    {
      switch(a3)
      {
        case -1:
        case 0:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_5;
        case 1:
          CGFloat height = 0.0;
          CGFloat v8 = 0.0;
          break;
        case 2:
          CGFloat width = 0.0;
          CGFloat v9 = 0.0;
          break;
        default:
          break;
      }
    }
    else
    {
LABEL_5:
      CGFloat width = NSZeroSize.width;
      CGFloat height = NSZeroSize.height;
      CGFloat v9 = NSZeroSize.width;
      CGFloat v8 = height;
    }
    result->_boundaries[0] = x + v9;
    result->_boundaries[1] = y + height;
    result->_boundaries[2] = x + v11 - width;
    result->_boundaries[3] = y + v10 - v8;
    result->_edgeInsets.top = v8;
    result->_edgeInsets.left = v9;
    result->_edgeInsets.bottom = height;
    result->_edgeInsets.right = width;
  }
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (CUIRenditionSliceInformation)initWithSliceInformation:(id)a3 destinationRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [a3 destinationRect];
  double v11 = v10;
  double v13 = v12;
  [a3 _topLeftCapSize];
  double v15 = v14;
  double v17 = v16;
  [a3 _bottomRightCapSize];
  double v20 = v18;
  double v21 = v19;
  if (v15 + v18 > width)
  {
    double v15 = width * v15 / v11;
    double v20 = width * v18 / v11;
  }
  if (v17 + v19 > height)
  {
    double v17 = height * v17 / v13;
    double v21 = height * v19 / v13;
  }
  uint64_t v22 = *((void *)a3 + 1);
  return -[CUIRenditionSliceInformation initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:](self, "initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:", v22, x, y, width, height, v15, v17, v20, v21);
}

- (CGSize)_topLeftCapSize
{
  double v2 = self->_boundaries[0] - self->_destinationRect.origin.x;
  double v3 = self->_destinationRect.origin.y + self->_destinationRect.size.height - self->_boundaries[3];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)_bottomRightCapSize
{
  double v2 = self->_destinationRect.origin.x + self->_destinationRect.size.width - self->_boundaries[2];
  double v3 = self->_boundaries[1] - self->_destinationRect.origin.y;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)positionOfSliceBoundary:(unint64_t)a3
{
  double result = 0.0;
  if (a3 <= 3) {
    return self->_boundaries[a3];
  }
  return result;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)CUIRenditionSliceInformation;
  id v3 = [(CUIRenditionSliceInformation *)&v5 description];
  return [v3 stringByAppendingFormat:@" %@, destination: %@, min x: %f, min y: %f, max x: %f, max y: %f", +[CUIThemeRendition displayNameForRenditionType:](CUIThemeRendition, "displayNameForRenditionType:", self->_renditionType), NSStringFromRect(self->_destinationRect), *(void *)&self->_boundaries[0], *(void *)&self->_boundaries[1], *(void *)&self->_boundaries[2], *(void *)&self->_boundaries[3]];
}

- (int64_t)renditionType
{
  return self->_renditionType;
}

- (CGRect)destinationRect
{
  double x = self->_destinationRect.origin.x;
  double y = self->_destinationRect.origin.y;
  double width = self->_destinationRect.size.width;
  double height = self->_destinationRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end