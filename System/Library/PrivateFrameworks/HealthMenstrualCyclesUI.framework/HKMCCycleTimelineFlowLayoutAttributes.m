@interface HKMCCycleTimelineFlowLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (CGRect)pillFrame;
- (double)shrinkFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setPillFrame:(CGRect)a3;
- (void)setShrinkFactor:(double)a3;
@end

@implementation HKMCCycleTimelineFlowLayoutAttributes

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v13.receiver = self,
        v13.super_class = (Class)HKMCCycleTimelineFlowLayoutAttributes,
        [(UICollectionViewLayoutAttributes *)&v13 isEqual:v4])
    && (double shrinkFactor = self->_shrinkFactor,
        [v4 shrinkFactor],
        vabdd_f64(shrinkFactor, v6) < 2.22044605e-16))
  {
    [v4 pillFrame];
    v14.origin.x = v7;
    v14.origin.y = v8;
    v14.size.width = v9;
    v14.size.height = v10;
    BOOL v11 = CGRectEqualToRect(self->_pillFrame, v14);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)HKMCCycleTimelineFlowLayoutAttributes;
  unint64_t v3 = [(UICollectionViewLayoutAttributes *)&v9 hash];
  id v4 = [NSNumber numberWithDouble:self->_shrinkFactor];
  uint64_t v5 = [v4 hash] ^ v3;
  double v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", self->_pillFrame.origin.x, self->_pillFrame.origin.y, self->_pillFrame.size.width, self->_pillFrame.size.height);
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKMCCycleTimelineFlowLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  [(HKMCCycleTimelineFlowLayoutAttributes *)self shrinkFactor];
  objc_msgSend(v4, "setShrinkFactor:");
  [(HKMCCycleTimelineFlowLayoutAttributes *)self pillFrame];
  objc_msgSend(v4, "setPillFrame:");
  return v4;
}

- (double)shrinkFactor
{
  return self->_shrinkFactor;
}

- (void)setShrinkFactor:(double)a3
{
  self->_double shrinkFactor = a3;
}

- (CGRect)pillFrame
{
  double x = self->_pillFrame.origin.x;
  double y = self->_pillFrame.origin.y;
  double width = self->_pillFrame.size.width;
  double height = self->_pillFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPillFrame:(CGRect)a3
{
  self->_pillFrame = a3;
}

@end