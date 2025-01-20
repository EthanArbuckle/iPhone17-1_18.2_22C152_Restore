@interface _AEDurationLabelTile
- (double)duration;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)setDuration:(double)a3;
@end

@implementation _AEDurationLabelTile

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    if (a3 <= 0.0)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = PXLocalizedVideoDuration();
    }
    id v5 = (id)v4;
    [(_AEDurationLabelTile *)self setText:v4];
  }
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_AEDurationLabelTile;
  long long v7 = *(_OWORD *)&a3->var7.height;
  v14[8] = *(_OWORD *)&a3->var6;
  v14[9] = v7;
  long long v8 = *(_OWORD *)&a3->var8.size.height;
  v14[10] = *(_OWORD *)&a3->var8.origin.y;
  v14[11] = v8;
  long long v9 = *(_OWORD *)&a3->var3.c;
  v14[4] = *(_OWORD *)&a3->var3.a;
  v14[5] = v9;
  long long v10 = *(_OWORD *)&a3->var4;
  v14[6] = *(_OWORD *)&a3->var3.tx;
  v14[7] = v10;
  CGSize size = a3->var0.size;
  v14[0] = a3->var0.origin;
  v14[1] = size;
  CGSize var2 = a3->var2;
  v14[2] = a3->var1;
  v14[3] = var2;
  [(UIView *)&v15 didApplyGeometry:v14 withUserData:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v6 || (isKindOfClass & 1) != 0)
  {
    [v6 doubleValue];
    -[_AEDurationLabelTile setDuration:](self, "setDuration:");
  }
}

@end