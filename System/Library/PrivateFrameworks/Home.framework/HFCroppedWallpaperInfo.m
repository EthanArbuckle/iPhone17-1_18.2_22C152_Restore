@interface HFCroppedWallpaperInfo
- (BOOL)isEqual:(id)a3;
- (CGPoint)center;
- (HFCroppedWallpaperInfo)initWithDictionary:(id)a3;
- (HFCroppedWallpaperInfo)initWithSource:(int64_t)a3 center:(CGPoint)a4 scale:(double)a5;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)source;
@end

@implementation HFCroppedWallpaperInfo

- (HFCroppedWallpaperInfo)initWithSource:(int64_t)a3 center:(CGPoint)a4 scale:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)HFCroppedWallpaperInfo;
  result = [(HFCroppedWallpaperInfo *)&v10 init];
  if (result)
  {
    result->_source = a3;
    result->_center.CGFloat x = x;
    result->_center.CGFloat y = y;
    result->_scale = a5;
  }
  return result;
}

- (HFCroppedWallpaperInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"Source"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v5) {
      NSLog(&cfstr_CropSourceMiss.isa, v5);
    }
    goto LABEL_10;
  }
  unint64_t v6 = [v5 integerValue];
  if (v6 >= 2)
  {
    if (v5) {
      NSLog(&cfstr_CropSourceUnkn.isa, [v5 integerValue]);
    }
LABEL_10:
    v12 = 0;
    goto LABEL_19;
  }
  unint64_t v7 = v6;
  v8 = [v4 objectForKeyedSubscript:@"Center"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v4 objectForKeyedSubscript:@"Scale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGPoint v10 = CGPointFromString(v8);
      [v9 doubleValue];
      self = -[HFCroppedWallpaperInfo initWithSource:center:scale:](self, "initWithSource:center:scale:", v7, v10.x, v10.y, v11);
      v12 = self;
    }
    else
    {
      if (v9) {
        NSLog(&cfstr_CropScaleMissi.isa, v9);
      }
      v12 = 0;
    }
  }
  else
  {
    if (v8) {
      NSLog(&cfstr_CropCenterMiss.isa, v8);
    }
    v12 = 0;
  }

LABEL_19:
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(HFCroppedWallpaperInfo *)self source];
  [(HFCroppedWallpaperInfo *)self center];
  double v7 = v6;
  double v9 = v8;
  [(HFCroppedWallpaperInfo *)self scale];
  return (id)objc_msgSend(v4, "initWithSource:center:scale:", v5, v7, v9, v10);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    [v7 center];
    double v9 = v8;
    double v11 = v10;
    [(HFCroppedWallpaperInfo *)self center];
    if (v9 == v13 && v11 == v12)
    {
      [v7 scale];
      double v16 = v15;
      [(HFCroppedWallpaperInfo *)self scale];
      BOOL v6 = v16 == v17;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  if ([(HFCroppedWallpaperInfo *)self source]) {
    id v4 = @"extrapolated";
  }
  else {
    id v4 = @"user";
  }
  [(HFCroppedWallpaperInfo *)self center];
  uint64_t v5 = NSStringFromCGPoint(v10);
  [(HFCroppedWallpaperInfo *)self scale];
  id v7 = [v3 stringWithFormat:@"source = %@, center = %@, scale = %f", v4, v5, v6];

  return v7;
}

- (id)dictionaryRepresentation
{
  v10[3] = *MEMORY[0x263EF8340];
  v9[0] = @"Source";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[HFCroppedWallpaperInfo source](self, "source"));
  v10[0] = v3;
  v9[1] = @"Center";
  [(HFCroppedWallpaperInfo *)self center];
  id v4 = NSStringFromCGPoint(v12);
  v10[1] = v4;
  v9[2] = @"Scale";
  uint64_t v5 = NSNumber;
  [(HFCroppedWallpaperInfo *)self scale];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  v10[2] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (int64_t)source
{
  return self->_source;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

@end