@interface NTKActivityDialView
- (CALayer)_ringLayer;
- (CLKDevice)device;
- (NSArray)segments;
- (NTKActivityDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (NTKFaceColorScheme)colorScheme;
- (double)_handAlphaForEditMode:(int64_t)a3;
- (double)_segmentAlphaForEditMode:(int64_t)a3;
- (void)applyTransitionFromScheme:(id)a3 toScheme:(id)a4 fraction:(double)a5;
- (void)setColorScheme:(id)a3;
@end

@implementation NTKActivityDialView

- (NTKActivityDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)NTKActivityDialView;
  v11 = -[NTKActivityDialView initWithFrame:](&v31, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    uint64_t v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    sub_1330C(v12->_device, (uint64_t)&v28);
    [(NTKActivityDialView *)v12 bounds];
    double v14 = v13;
    uint64_t v15 = v29;
    v16 = +[NSMutableArray arrayWithCapacity:(void)v29];
    v17 = [(NTKActivityDialView *)v12 layer];
    if (v15 >= 1)
    {
      uint64_t v18 = 0;
      double v19 = v14 * 0.5;
      do
      {
        v20 = [[NTKActivityDialSegment alloc] initWithHourIndex:v18 LayoutConstants:&v28 dialRadius:v10 device:v19];
        v21 = [(NTKActivityDialSegment *)v20 tickLayer];
        [v17 addSublayer:v21];

        v22 = [(NTKActivityDialSegment *)v20 arcLayer];
        [v17 addSublayer:v22];

        [v16 addObject:v20];
        ++v18;
      }
      while ((uint64_t)v29 > v18);
    }
    v23 = [v16 objectAtIndexedSubscript:0];
    v24 = [v23 tickLayer];

    [v24 removeFromSuperlayer];
    [v17 addSublayer:v24];
    v25 = (NSArray *)[v16 copy];
    segments = v12->_segments;
    v12->_segments = v25;
  }
  return v12;
}

- (void)applyTransitionFromScheme:(id)a3 toScheme:(id)a4 fraction:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  sub_1330C(self->_device, (uint64_t)&v24);
  uint64_t v9 = v26;
  double v10 = (double)(uint64_t)v25;
  CLKInterpolateBetweenFloatsUnclipped();
  segments = self->_segments;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_13560;
  v15[3] = &unk_20D08;
  double v18 = v10;
  uint64_t v19 = v9;
  uint64_t v20 = v12;
  long long v21 = v24;
  long long v22 = v25;
  uint64_t v23 = v26;
  id v16 = v7;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  [(NSArray *)segments enumerateObjectsUsingBlock:v15];
}

- (void)setColorScheme:(id)a3
{
  v5 = (NTKFaceColorScheme *)a3;
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    segments = self->_segments;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_13738;
    v7[3] = &unk_20D30;
    id v8 = v5;
    [(NSArray *)segments enumerateObjectsUsingBlock:v7];
  }
}

- (double)_handAlphaForEditMode:(int64_t)a3
{
  double result = 0.0;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (double)_segmentAlphaForEditMode:(int64_t)a3
{
  BOOL v3 = a3 == 10 || a3 == 0;
  double result = NTKEditModeDimmedAlpha;
  if (v3) {
    return 1.0;
  }
  return result;
}

- (NTKFaceColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NSArray)segments
{
  return self->_segments;
}

- (CALayer)_ringLayer
{
  return self->__ringLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__ringLayer, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end