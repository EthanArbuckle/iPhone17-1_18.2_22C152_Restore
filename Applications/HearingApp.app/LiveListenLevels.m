@interface LiveListenLevels
- (LiveListenLevels)initWithFrame:(CGRect)a3 inCompact:(BOOL)a4;
- (NSMutableArray)levels;
- (double)dotSize;
- (double)dotSpacing;
- (int)meterDots;
- (void)layoutSubviews;
- (void)setDotSize:(double)a3;
- (void)setDotSpacing:(double)a3;
- (void)setLevels:(id)a3;
- (void)setMeterDots:(int)a3;
- (void)updateLevel:(double)a3;
@end

@implementation LiveListenLevels

- (LiveListenLevels)initWithFrame:(CGRect)a3 inCompact:(BOOL)a4
{
  if (a4) {
    int v4 = 4;
  }
  else {
    int v4 = 5;
  }
  double v5 = 8.0;
  double v6 = 4.0;
  if (a4)
  {
    double v5 = 4.0;
    double v6 = 2.0;
  }
  self->_meterDots = v4;
  self->_dotSize = v5;
  self->_dotSpacing = v6;
  v19.receiver = self;
  v19.super_class = (Class)LiveListenLevels;
  v7 = -[LiveListenLevels initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    v8 = +[NSMutableArray array];
    if (v7->_meterDots >= 1)
    {
      int v9 = 0;
      do
      {
        id v10 = objc_alloc_init((Class)CAShapeLayer);
        v11 = +[UIColor systemOrangeColor];
        id v12 = [v11 colorWithAlphaComponent:0.25];
        [v10 setFillColor:[v12 CGColor]];

        v13 = [(LiveListenLevels *)v7 layer];
        [v13 addSublayer:v10];

        [v8 addObject:v10];
        ++v9;
      }
      while (v9 < v7->_meterDots);
    }
    [(LiveListenLevels *)v7 setLevels:v8];
  }
  objc_initWeak(&location, v7);
  v14 = +[AXHAServer sharedInstance];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000573C;
  v16[3] = &unk_100010680;
  objc_copyWeak(&v17, &location);
  [v14 registerListener:v7 forLiveListenLevelsHandler:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v7;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)LiveListenLevels;
  [(LiveListenLevels *)&v13 layoutSubviews];
  [(LiveListenLevels *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  v11 = [(LiveListenLevels *)self levels];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005910;
  v12[3] = &unk_1000106A8;
  v12[4] = self;
  v12[5] = v4;
  v12[6] = v6;
  v12[7] = v8;
  v12[8] = v10;
  [v11 enumerateObjectsUsingBlock:v12];
}

- (void)updateLevel:(double)a3
{
  uint64_t v5 = [(LiveListenLevels *)self levels];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005AFC;
  v6[3] = &unk_1000106D0;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

- (NSMutableArray)levels
{
  return self->_levels;
}

- (void)setLevels:(id)a3
{
}

- (int)meterDots
{
  return self->_meterDots;
}

- (void)setMeterDots:(int)a3
{
  self->_meterDots = a3;
}

- (double)dotSize
{
  return self->_dotSize;
}

- (void)setDotSize:(double)a3
{
  self->_dotSize = a3;
}

- (double)dotSpacing
{
  return self->_dotSpacing;
}

- (void)setDotSpacing:(double)a3
{
  self->_dotSpacing = a3;
}

- (void).cxx_destruct
{
}

@end