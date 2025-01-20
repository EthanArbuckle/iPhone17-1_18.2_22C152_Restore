@interface DRItemViewModel
- (BOOL)applyOriginalRotation;
- (BOOL)constrainSize;
- (BOOL)precisionMode;
- (CGPoint)anchorPoint;
- (CGPoint)center;
- (CGPoint)stackOffset;
- (CGRect)bounds;
- (DRClientItemViewModel)currentClientItemViewModel;
- (DRClientModel)currentClient;
- (DRItemViewModel)initWithIndex:(unint64_t)a3;
- (_DUIImageComponent)imageComponent;
- (_DUIPreview)preview;
- (double)displayScale;
- (double)stackRotation;
- (id)clientItemViewModelForClient:(id)a3;
- (int64_t)preferredStackOrder;
- (unint64_t)itemIndex;
- (void)setApplyOriginalRotation:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setConstrainSize:(BOOL)a3;
- (void)setCurrentClient:(id)a3;
- (void)setDisplayScale:(double)a3;
- (void)setPrecisionMode:(BOOL)a3;
- (void)setPreferredStackOrder:(int64_t)a3;
@end

@implementation DRItemViewModel

- (DRItemViewModel)initWithIndex:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)DRItemViewModel;
  v4 = [(DRItemViewModel *)&v19 init];
  v5 = v4;
  if (v4)
  {
    v4->_itemIndex = a3;
    v4->_applyOriginalRotation = 1;
    if (a3)
    {
      if (qword_1000646A0 != -1) {
        dispatch_once(&qword_1000646A0, &stru_100055070);
      }
      double v6 = 6.0;
      if (byte_1000646A8) {
        double v6 = sub_100012F50();
      }
      double v7 = (double)arc4random_uniform(0x64u) / 50.0 + -1.0;
      if (qword_1000646A0 != -1) {
        dispatch_once(&qword_1000646A0, &stru_100055070);
      }
      double v8 = v6 * v7;
      double v9 = 6.0;
      if (byte_1000646A8) {
        double v9 = sub_100012F50();
      }
      uint32_t v10 = arc4random_uniform(0x64u);
      v5->_stackOffset.x = v8;
      v5->_stackOffset.y = v9 * ((double)v10 / 50.0 + -1.0);
      if (qword_1000646A0 != -1) {
        dispatch_once(&qword_1000646A0, &stru_1000550D0);
      }
      if (byte_1000646A8)
      {
        if (qword_1000646C8 != -1) {
          dispatch_once(&qword_1000646C8, &stru_1000550F0);
        }
        if ((byte_1000646D0 & 1) == 0)
        {
          v15 = sub_100028320();
          v16 = [v15 objectForKey:@"RandomStackRotation"];
          if (v16)
          {
            v17 = v16;
            [v16 doubleValue];
          }
          else
          {
            v17 = 0;
            uint64_t v18 = 0x3FB1EB851EB851ECLL;
          }
          qword_1000646D8 = v18;
          byte_1000646D0 = 1;
        }
        double v11 = *(double *)&qword_1000646D8;
      }
      else
      {
        double v11 = 0.07;
      }
      v5->_stackRotation = v11 * ((double)arc4random_uniform(0x64u) / 50.0 + -1.0);
    }
    uint64_t v12 = +[NSMapTable weakToStrongObjectsMapTable];
    clientItemViewModels = v5->_clientItemViewModels;
    v5->_clientItemViewModels = (NSMapTable *)v12;
  }
  return v5;
}

- (id)clientItemViewModelForClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMapTable *)self->_clientItemViewModels objectForKey:v4];
    if (!v5)
    {
      v5 = [[DRClientItemViewModel alloc] initWithClient:v4];
      [(NSMapTable *)self->_clientItemViewModels setObject:v5 forKey:v4];
      double v6 = [(DRItemViewModel *)self currentClient];

      if (!v6) {
        [(DRItemViewModel *)self setCurrentClient:v4];
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (DRClientItemViewModel)currentClientItemViewModel
{
  v3 = [(DRItemViewModel *)self currentClient];
  id v4 = [(DRItemViewModel *)self clientItemViewModelForClient:v3];

  return (DRClientItemViewModel *)v4;
}

- (_DUIImageComponent)imageComponent
{
  v2 = [(DRItemViewModel *)self currentClientItemViewModel];
  v3 = [v2 imageComponent];

  return (_DUIImageComponent *)v3;
}

- (_DUIPreview)preview
{
  v3 = [(DRItemViewModel *)self currentClientItemViewModel];
  id v4 = [v3 preview];

  v5 = [(DRItemViewModel *)self currentClient];
  unsigned int v6 = [v5 isSource];

  if (!v6)
  {
LABEL_5:
    self->_everReturnedDifferentPreviewThanFirstSourcePreview = 1;
    goto LABEL_8;
  }
  firstSourcePreview = self->_firstSourcePreview;
  if (!firstSourcePreview)
  {
    objc_storeStrong((id *)&self->_firstSourcePreview, v4);
    goto LABEL_8;
  }
  if (!self->_everReturnedDifferentPreviewThanFirstSourcePreview)
  {
    if (v4 == firstSourcePreview)
    {
      double v8 = [(DRItemViewModel *)self imageComponent];
      self->_everReturnedDifferentPreviewThanFirstSourcePreview = [v8 hidesImage];

      goto LABEL_8;
    }
    goto LABEL_5;
  }
LABEL_8:
  if (self->_everReturnedDifferentPreviewThanFirstSourcePreview
    && [(_DUIPreview *)v4 previewMode] != (id)4)
  {
    -[_DUIPreview setLiftAnchorPoint:](v4, "setLiftAnchorPoint:", CGPointZero.x, CGPointZero.y);
  }
  return v4;
}

- (CGPoint)anchorPoint
{
  v2 = [(DRItemViewModel *)self currentClientItemViewModel];
  [v2 anchorPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGRect)bounds
{
  double v3 = [(DRItemViewModel *)self imageComponent];

  if (v3)
  {
    double v4 = [(DRItemViewModel *)self imageComponent];
    [v4 frame];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGPoint)stackOffset
{
  double x = self->_stackOffset.x;
  double y = self->_stackOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)stackRotation
{
  return self->_stackRotation;
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (DRClientModel)currentClient
{
  return self->_currentClient;
}

- (void)setCurrentClient:(id)a3
{
}

- (BOOL)applyOriginalRotation
{
  return self->_applyOriginalRotation;
}

- (void)setApplyOriginalRotation:(BOOL)a3
{
  self->_applyOriginalRotation = a3;
}

- (BOOL)constrainSize
{
  return self->_constrainSize;
}

- (void)setConstrainSize:(BOOL)a3
{
  self->_constrainSize = a3;
}

- (BOOL)precisionMode
{
  return self->_precisionMode;
}

- (void)setPrecisionMode:(BOOL)a3
{
  self->_precisionMode = a3;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (int64_t)preferredStackOrder
{
  return self->_preferredStackOrder;
}

- (void)setPreferredStackOrder:(int64_t)a3
{
  self->_preferredStackOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentClient, 0);
  objc_storeStrong((id *)&self->_firstSourcePreview, 0);
  objc_storeStrong((id *)&self->_clientItemViewModels, 0);
}

@end