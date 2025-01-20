@interface SSUISlateView
- (BOOL)liveUpdate;
- (CGPoint)hotspotAdjustmentForCursorFrame:(CGRect)a3;
- (NSMutableArray)allDrawingPoints;
- (NSMutableArray)drawingPoints;
- (NSMutableArray)finalDrawingPoints;
- (NSTimer)updateTimer;
- (SSUISlateView)initWithFrame:(CGRect)a3;
- (double)lineWidth;
- (int)currentColor;
- (int64_t)currentOrientation;
- (unint64_t)rawBitmapByteCount;
- (void)addPoint:(CGPoint)a3;
- (void)createCGBitmapContextWithSize:(CGSize)a3;
- (void)dealloc;
- (void)drawCompletedPath;
- (void)drawFromCollectedPoints;
- (void)drawRect:(CGRect)a3;
- (void)drawSampleAnnotations;
- (void)setAllDrawingPoints:(id)a3;
- (void)setCurrentColor:(int)a3;
- (void)setCurrentOrientation:(int64_t)a3;
- (void)setDrawingPoints:(id)a3;
- (void)setEventFlags:(unsigned int)a3;
- (void)setFinalDrawingPoints:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setLiveUpdate:(BOOL)a3;
- (void)setRawBitmapByteCount:(unint64_t)a3;
- (void)setUpdateTimer:(id)a3;
- (void)startPeriodicUpdate;
- (void)stopPeriodicUpdate;
- (void)wipeSlate;
- (void)wipeSlateCore;
@end

@implementation SSUISlateView

- (SSUISlateView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v11.receiver = self;
  v11.super_class = (Class)SSUISlateView;
  v5 = -[SSUISlateView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = +[UIColor clearColor];
    [(SSUISlateView *)v5 setBackgroundColor:v6];

    [(SSUISlateView *)v5 setLineWidth:4.0];
    v7 = +[NSMutableArray array];
    [(SSUISlateView *)v5 setDrawingPoints:v7];

    v8 = +[NSMutableArray array];
    [(SSUISlateView *)v5 setFinalDrawingPoints:v8];

    v9 = +[NSMutableArray array];
    [(SSUISlateView *)v5 setAllDrawingPoints:v9];

    -[SSUISlateView createCGBitmapContextWithSize:](v5, "createCGBitmapContextWithSize:", width, height);
    [(SSUISlateView *)v5 setEventFlags:0];
  }
  return v5;
}

- (void)dealloc
{
  [(SSUISlateView *)self setDrawingPoints:0];
  [(SSUISlateView *)self setFinalDrawingPoints:0];
  [(SSUISlateView *)self setAllDrawingPoints:0];
  mBitmapContextPortrait = self->mBitmapContextPortrait;
  if (mBitmapContextPortrait)
  {
    CGContextRelease(mBitmapContextPortrait);
    self->mBitmapContextPortrait = 0;
  }
  mBitmapContextLandscape = self->mBitmapContextLandscape;
  if (mBitmapContextLandscape)
  {
    CGContextRelease(mBitmapContextLandscape);
    self->mBitmapContextLandscape = 0;
  }
  mRawBitmapData = self->mRawBitmapData;
  if (mRawBitmapData)
  {
    free(mRawBitmapData);
    self->mRawBitmapData = 0;
    [(SSUISlateView *)self setRawBitmapByteCount:0];
  }
  mDrawColor = self->mDrawColor;
  if (mDrawColor)
  {
    CGColorRelease(mDrawColor);
    self->mDrawColor = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)SSUISlateView;
  [(SSUISlateView *)&v7 dealloc];
}

- (void)setEventFlags:(unsigned int)a3
{
  char v3 = a3;
  if ((a3 & 0x20000000) != 0) {
    [(SSUISlateView *)self wipeSlate];
  }
  uint64_t v5 = v3 & 0x70;
  if (self->mDrawColor)
  {
    if (v5 == [(SSUISlateView *)self currentColor]) {
      return;
    }
    mDrawColor = self->mDrawColor;
    if (mDrawColor)
    {
      CGColorRelease(mDrawColor);
      self->mDrawColor = 0;
    }
  }
  switch(v5 >> 4)
  {
    case 1u:
      objc_super v7 = +[UIColor blackColor];
      break;
    case 2u:
      objc_super v7 = +[UIColor systemGreenColor];
      break;
    case 3u:
      objc_super v7 = +[UIColor whiteColor];
      break;
    case 4u:
      objc_super v7 = +[UIColor systemBlueColor];
      break;
    case 5u:
      objc_super v7 = +[UIColor systemYellowColor];
      break;
    default:
      objc_super v7 = +[UIColor systemRedColor];
      break;
  }
  id v8 = v7;
  self->mDrawColor = CGColorCreateCopy((CGColorRef)[v8 CGColor]);

  [(SSUISlateView *)self setCurrentColor:v5];
}

- (CGPoint)hotspotAdjustmentForCursorFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(SSUISlateView *)self lineWidth];
  double v6 = width - trunc(v5) + -1.0;
  double v7 = height * 0.5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)createCGBitmapContextWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    double v7 = DeviceRGB;
    double v8 = floor(width);
    size_t v9 = vcvtd_n_u64_f64(v8, 2uLL);
    double v10 = floor(height);
    [(SSUISlateView *)self setRawBitmapByteCount:(unint64_t)(v10 * (double)(unint64_t)(v8 * 4.0))];
    objc_super v11 = (char *)malloc_type_calloc([(SSUISlateView *)self rawBitmapByteCount], 1uLL, 0x100004077774924uLL);
    self->mRawBitmapData = v11;
    size_t v12 = vcvtmd_u64_f64(width);
    size_t v13 = vcvtmd_u64_f64(height);
    v14 = CGBitmapContextCreate(v11, v12, v13, 8uLL, v9, v7, 1u);
    self->mBitmapContextPortrait = v14;
    self->mBitmapContext = v14;
    self->mBitmapContextLandscape = CGBitmapContextCreate(self->mRawBitmapData, v13, v12, 8uLL, vcvtd_n_u64_f64(v10, 2uLL), v7, 1u);
    CGColorSpaceRelease(v7);
  }
}

- (void)wipeSlate
{
  char v3 = [(SSUISlateView *)self allDrawingPoints];
  [v3 removeAllObjects];

  [(SSUISlateView *)self wipeSlateCore];
}

- (void)wipeSlateCore
{
  char v3 = [(SSUISlateView *)self finalDrawingPoints];
  [v3 removeAllObjects];

  v4 = [(SSUISlateView *)self drawingPoints];
  [v4 removeAllObjects];

  bzero(self->mRawBitmapData, [(SSUISlateView *)self rawBitmapByteCount]);

  [(SSUISlateView *)self setNeedsDisplay];
}

- (void)drawSampleAnnotations
{
  int v3 = 3;
  v4 = +[NSMutableArray arrayWithCapacity:3];
  do
  {
    uint64_t v5 = random();
    [(SSUISlateView *)self frame];
    uint64_t v7 = ((unsigned __int16)v5 % (int)v6);
    [(SSUISlateView *)self frame];
    uint64_t v9 = ((v5 >> 16) % (int)v8);
    double v10 = +[NSNumber numberWithInt:v7];
    v31[0] = v10;
    objc_super v11 = +[NSNumber numberWithInt:v9];
    v31[1] = v11;
    size_t v12 = +[NSArray arrayWithObjects:v31 count:2];
    [v4 addObject:v12];

    --v3;
  }
  while (v3);
  CGContextSetStrokeColorWithColor(self->mBitmapContext, self->mDrawColor);
  mBitmapContext = self->mBitmapContext;
  [(SSUISlateView *)self lineWidth];
  CGContextSetLineWidth(mBitmapContext, v14);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v4;
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "objectAtIndexedSubscript:", 0, (void)v26);
        v22 = [v20 objectAtIndexedSubscript:1];
        [v21 floatValue];
        CGFloat v24 = v23;
        [v22 floatValue];
        v32.origin.y = v25;
        v32.size.double width = 64.0;
        v32.origin.x = v24;
        v32.size.double height = 64.0;
        CGContextStrokeEllipseInRect(self->mBitmapContext, v32);
      }
      id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }

  [(SSUISlateView *)self setNeedsDisplay];
}

- (void)drawFromCollectedPoints
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "drawFromCollectedPoints", buf, 2u);
  }
  int v3 = [(SSUISlateView *)self drawingPoints];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 2)
  {
    CGContextSetStrokeColorWithColor(self->mBitmapContext, self->mDrawColor);
    mBitmapContext = self->mBitmapContext;
    [(SSUISlateView *)self lineWidth];
    CGContextSetLineWidth(mBitmapContext, v6);
    CGContextBeginPath(self->mBitmapContext);
    uint64_t v7 = [(SSUISlateView *)self drawingPoints];
    id v8 = [v7 firstObject];

    uint64_t v9 = [v8 objectAtIndexedSubscript:0];
    double v10 = [v8 objectAtIndexedSubscript:1];
    objc_super v11 = self->mBitmapContext;
    [v9 floatValue];
    CGFloat v13 = v12;
    [v10 floatValue];
    CGContextMoveToPoint(v11, v13, v14);
    id v15 = [(SSUISlateView *)self drawingPoints];
    [v15 removeObject:v8];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = self;
    id obj = [(SSUISlateView *)self drawingPoints];
    id v17 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        v20 = 0;
        v21 = v8;
        v22 = v9;
        float v23 = v10;
        do
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(id *)(*((void *)&v30 + 1) + 8 * (void)v20);

          uint64_t v9 = [v8 objectAtIndexedSubscript:0];

          double v10 = [v8 objectAtIndexedSubscript:1];

          CGFloat v24 = v16->mBitmapContext;
          [v9 floatValue];
          CGFloat v26 = v25;
          [v10 floatValue];
          CGContextAddLineToPoint(v24, v26, v27);
          v20 = (char *)v20 + 1;
          v21 = v8;
          v22 = v9;
          float v23 = v10;
        }
        while (v18 != v20);
        id v18 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v18);
    }

    if (![(SSUISlateView *)v16 liveUpdate])
    {
      long long v28 = [(SSUISlateView *)v16 drawingPoints];
      [v28 removeAllObjects];
    }
    CGContextStrokePath(v16->mBitmapContext);
    [(SSUISlateView *)v16 setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGImageRef Image = CGBitmapContextCreateImage(self->mBitmapContext);
  if (Image)
  {
    CGFloat v6 = Image;
    [(SSUISlateView *)self frame];
    CGContextDrawImage(CurrentContext, v8, v6);
    CGImageRelease(v6);
  }
}

- (void)addPoint:(CGPoint)a3
{
  double y = a3.y;
  uint64_t v5 = +[NSNumber numberWithDouble:a3.x];
  v10[0] = v5;
  CGFloat v6 = +[NSNumber numberWithDouble:y];
  v10[1] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v10 count:2];

  CGRect v8 = [(SSUISlateView *)self drawingPoints];
  [v8 addObject:v7];

  if ([(SSUISlateView *)self liveUpdate])
  {
    uint64_t v9 = [(SSUISlateView *)self finalDrawingPoints];
    [v9 addObject:v7];
  }
}

- (void)startPeriodicUpdate
{
  if (![(SSUISlateView *)self liveUpdate])
  {
    [(SSUISlateView *)self setLiveUpdate:1];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_8820;
    v4[3] = &unk_10580;
    v4[4] = self;
    int v3 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v4 block:0.1];
    [(SSUISlateView *)self setUpdateTimer:v3];
  }
}

- (void)stopPeriodicUpdate
{
  [(SSUISlateView *)self setLiveUpdate:0];
  int v3 = [(SSUISlateView *)self updateTimer];
  [v3 invalidate];

  [(SSUISlateView *)self setUpdateTimer:0];
}

- (void)drawCompletedPath
{
  int v3 = [(SSUISlateView *)self finalDrawingPoints];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 2)
  {
    uint64_t v5 = [(SSUISlateView *)self drawingPoints];
    [v5 removeAllObjects];

    CGFloat v6 = [(SSUISlateView *)self drawingPoints];
    uint64_t v7 = [(SSUISlateView *)self finalDrawingPoints];
    [v6 addObjectsFromArray:v7];

    CGRect v8 = [(SSUISlateView *)self allDrawingPoints];
    uint64_t v9 = [(SSUISlateView *)self finalDrawingPoints];
    id v10 = [v9 copy];
    [v8 addObject:v10];

    objc_super v11 = [(SSUISlateView *)self finalDrawingPoints];
    [v11 removeAllObjects];

    [(SSUISlateView *)self drawFromCollectedPoints];
  }
}

- (int64_t)currentOrientation
{
  return self->_currentOrientation;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  if (self->_currentOrientation != a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t currentOrientation = self->_currentOrientation;
      *(_DWORD *)buf = 134218240;
      int64_t v31 = a3;
      __int16 v32 = 2048;
      int64_t v33 = currentOrientation;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "currentOrientation: %ld, was: %ld", buf, 0x16u);
    }
    self->_int64_t currentOrientation = a3;
    mBitmapContext = self->mBitmapContext;
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (mBitmapContext == self->mBitmapContextLandscape) {
        return;
      }
      [(SSUISlateView *)self stopPeriodicUpdate];
      [(SSUISlateView *)self wipeSlateCore];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "switch to landscape context", buf, 2u);
      }
      self->mBitmapContext = self->mBitmapContextLandscape;
      [(SSUISlateView *)self frame];
      -[SSUISlateView setFrame:](self, "setFrame:");
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v7 = [(SSUISlateView *)self allDrawingPoints];
      id v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v25;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            CGFloat v13 = [(SSUISlateView *)self drawingPoints];
            [v13 addObjectsFromArray:v12];

            [(SSUISlateView *)self drawFromCollectedPoints];
          }
          id v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v9);
      }
    }
    else
    {
      if (mBitmapContext == self->mBitmapContextPortrait) {
        return;
      }
      [(SSUISlateView *)self stopPeriodicUpdate];
      [(SSUISlateView *)self wipeSlateCore];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "switch to portrait context", buf, 2u);
      }
      self->mBitmapContext = self->mBitmapContextPortrait;
      [(SSUISlateView *)self frame];
      -[SSUISlateView setFrame:](self, "setFrame:");
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v7 = [(SSUISlateView *)self allDrawingPoints];
      id v14 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v21;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v7);
            }
            uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * (void)j);
            uint64_t v19 = [(SSUISlateView *)self drawingPoints];
            [v19 addObjectsFromArray:v18];

            [(SSUISlateView *)self drawFromCollectedPoints];
          }
          id v15 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v15);
      }
    }
  }
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (unint64_t)rawBitmapByteCount
{
  return self->_rawBitmapByteCount;
}

- (void)setRawBitmapByteCount:(unint64_t)a3
{
  self->_rawBitmapByteCount = a3;
}

- (NSMutableArray)drawingPoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDrawingPoints:(id)a3
{
}

- (NSMutableArray)finalDrawingPoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFinalDrawingPoints:(id)a3
{
}

- (NSMutableArray)allDrawingPoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAllDrawingPoints:(id)a3
{
}

- (int)currentColor
{
  return self->_currentColor;
}

- (void)setCurrentColor:(int)a3
{
  self->_currentColor = a3;
}

- (NSTimer)updateTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUpdateTimer:(id)a3
{
}

- (BOOL)liveUpdate
{
  return self->_liveUpdate;
}

- (void)setLiveUpdate:(BOOL)a3
{
  self->_liveUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_allDrawingPoints, 0);
  objc_storeStrong((id *)&self->_finalDrawingPoints, 0);

  objc_storeStrong((id *)&self->_drawingPoints, 0);
}

@end