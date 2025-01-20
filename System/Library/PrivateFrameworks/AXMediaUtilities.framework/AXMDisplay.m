@interface AXMDisplay
- (BOOL)supportsDeepColor;
- (CGPoint)convertPointToDisplay:(CGPoint)a3;
- (CGRect)convertRectToDisplay:(CGRect)a3;
- (CGRect)referenceBounds;
- (CGSize)size;
- (NSString)name;
- (double)orientation;
- (double)scale;
- (id)_initWithBackingType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)backingType;
- (int64_t)physicalOrientation;
- (void)setBackingType:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setOrientation:(double)a3;
- (void)setPhysicalOrientation:(int64_t)a3;
- (void)setReferenceBounds:(CGRect)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setSupportsDeepColor:(BOOL)a3;
@end

@implementation AXMDisplay

- (id)_initWithBackingType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AXMDisplay;
  v4 = [(AXMDisplay *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_backingType = a3;
    name = v4->_name;
    v4->_name = (NSString *)@"Default";

    v5->_size = (CGSize)*MEMORY[0x1E4F1DB30];
    *(_OWORD *)&v5->_scale = xmmword_1B58ACFA0;
    v7 = (CGPoint *)MEMORY[0x1E4F1DB28];
    v5->_physicalOrientation = 1;
    CGSize v8 = (CGSize)v7[1];
    v5->_referenceBounds.origin = *v7;
    v5->_referenceBounds.size = v8;
    v5->_supportsDeepColor = 0;
  }
  return v5;
}

- (id)description
{
  unint64_t backingType = self->_backingType;
  if (backingType > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *((void *)&off_1E6118448 + backingType);
  }
  v5 = NSString;
  v6 = [(AXMDisplay *)self name];
  v7 = NSNumber;
  [(AXMDisplay *)self scale];
  CGSize v8 = objc_msgSend(v7, "numberWithDouble:");
  [(AXMDisplay *)self size];
  uint64_t v10 = v9;
  [(AXMDisplay *)self size];
  uint64_t v12 = v11;
  v13 = NSNumber;
  [(AXMDisplay *)self orientation];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  unint64_t physicalOrientation = self->_physicalOrientation;
  if (physicalOrientation > 4) {
    v16 = "unknown";
  }
  else {
    v16 = off_1E6118460[physicalOrientation];
  }
  [(AXMDisplay *)self referenceBounds];
  uint64_t v18 = v17;
  [(AXMDisplay *)self referenceBounds];
  uint64_t v20 = v19;
  [(AXMDisplay *)self referenceBounds];
  uint64_t v22 = v21;
  [(AXMDisplay *)self referenceBounds];
  v24 = [v5 stringWithFormat:@"AXMDisplay<%p>: Backing:%@ Name:%@ scale:%@ size:[%.2f %.2f] orientation:%@ (%s) refBounds:[%.2f %.2f %.2f %.2f] deepColor:%d", self, v4, v6, v8, v10, v12, v14, v16, v18, v20, v22, v23, -[AXMDisplay supportsDeepColor](self, "supportsDeepColor")];

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[AXMDisplay alloc] _initWithBackingType:self->_backingType];
  objc_storeStrong((id *)v4 + 2, self->_name);
  *((void *)v4 + 3) = *(void *)&self->_scale;
  *(CGSize *)(v4 + 56) = self->_size;
  *((void *)v4 + 4) = *(void *)&self->_orientation;
  *((void *)v4 + 5) = self->_physicalOrientation;
  CGPoint origin = self->_referenceBounds.origin;
  *(CGSize *)(v4 + 88) = self->_referenceBounds.size;
  *(CGPoint *)(v4 + 72) = origin;
  v4[8] = self->_supportsDeepColor;
  return v4;
}

- (CGPoint)convertPointToDisplay:(CGPoint)a3
{
  double scale = self->_scale;
  double v5 = a3.x * scale;
  double v6 = a3.y * scale;
  [(AXMDisplay *)self referenceBounds];
  double v8 = v7;
  double v10 = v9;
  double v11 = self->_scale;
  if (AXMFloatApproxEqual(self->_orientation, 1.57079633))
  {
    double v5 = v11 * v8 + -1.0 - v5;
    double v12 = v6;
  }
  else if (AXMFloatApproxEqual(self->_orientation, 4.71238898))
  {
    double v12 = v11 * v10 + -1.0 - v6;
  }
  else
  {
    double v12 = v5;
    double v5 = v6;
  }
  double v13 = v5;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGRect)convertRectToDisplay:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(AXMDisplay *)self referenceBounds];
  if (AXMFloatApproxEqual(self->_orientation, 1.57079633))
  {
    v15.origin.CGFloat x = x;
    v15.origin.double y = y;
    v15.size.double width = width;
    v15.size.CGFloat height = height;
    double MinX = CGRectGetMaxX(v15) + -1.0 / self->_scale;
    v16.origin.CGFloat x = x;
    v16.origin.double y = y;
    v16.size.double width = width;
    v16.size.CGFloat height = height;
    double y = CGRectGetMinY(v16);
  }
  else
  {
    if (!AXMFloatApproxEqual(self->_orientation, 4.71238898))
    {
      double MinX = x;
      double v9 = width;
      double width = height;
      goto LABEL_7;
    }
    v17.origin.CGFloat x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v17);
    v18.origin.CGFloat x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.CGFloat height = height;
    double y = CGRectGetMaxY(v18) + -1.0 / self->_scale;
  }
  double v9 = height;
LABEL_7:
  -[AXMDisplay convertPointToDisplay:](self, "convertPointToDisplay:", MinX, y);
  double scale = self->_scale;
  double v13 = v9 * scale;
  double v14 = width * scale;
  result.size.CGFloat height = v14;
  result.size.double width = v13;
  result.origin.double y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(double)a3
{
  self->_orientation = a3;
}

- (int64_t)physicalOrientation
{
  return self->_physicalOrientation;
}

- (void)setPhysicalOrientation:(int64_t)a3
{
  self->_unint64_t physicalOrientation = a3;
}

- (CGRect)referenceBounds
{
  double x = self->_referenceBounds.origin.x;
  double y = self->_referenceBounds.origin.y;
  double width = self->_referenceBounds.size.width;
  double height = self->_referenceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setReferenceBounds:(CGRect)a3
{
  self->_referenceBounds = a3;
}

- (BOOL)supportsDeepColor
{
  return self->_supportsDeepColor;
}

- (void)setSupportsDeepColor:(BOOL)a3
{
  self->_supportsDeepColor = a3;
}

- (int64_t)backingType
{
  return self->_backingType;
}

- (void)setBackingType:(int64_t)a3
{
  self->_unint64_t backingType = a3;
}

- (void).cxx_destruct
{
}

@end