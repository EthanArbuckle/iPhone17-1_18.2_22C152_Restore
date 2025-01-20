@interface NTKSiderealDialBackgroundView
- (CLKUIQuadView)quadView;
- (NTKAltitudeColorCurveView)backgroundDialView;
- (NTKSiderealBackgroundQuad)quad;
- (NTKSiderealDialBackgroundView)initWithFrame:(CGRect)a3 orbitDiameter:(double)a4 timeOrbitRadius:(double)a5 timeRadius:(double)a6 dialImage:(id)a7 waypointImage:(id)a8 gnomonImage:(id)a9 dayGnomonImage:(id)a10 dayDiskBloomImage:(id)a11 dayDiscImage:(id)a12 nightGnomonImage:(id)a13 nightDiscImage:(id)a14 nightRingImage:(id)a15 initialData:(id)a16 useXR:(BOOL)a17;
- (void)layoutSubviews;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setBackgroundDialView:(id)a3;
- (void)setQuadView:(id)a3;
- (void)setSectors:(id)a3;
- (void)setSolarDayProgress:(double)a3;
- (void)updateDayMask;
@end

@implementation NTKSiderealDialBackgroundView

- (NTKSiderealDialBackgroundView)initWithFrame:(CGRect)a3 orbitDiameter:(double)a4 timeOrbitRadius:(double)a5 timeRadius:(double)a6 dialImage:(id)a7 waypointImage:(id)a8 gnomonImage:(id)a9 dayGnomonImage:(id)a10 dayDiskBloomImage:(id)a11 dayDiscImage:(id)a12 nightGnomonImage:(id)a13 nightDiscImage:(id)a14 nightRingImage:(id)a15 initialData:(id)a16 useXR:(BOOL)a17
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v50 = a7;
  id v49 = a8;
  id v48 = a9;
  id v30 = a10;
  id v31 = a11;
  id v47 = a12;
  id v32 = a13;
  id v33 = a14;
  id v34 = a15;
  id v35 = a16;
  v51.receiver = self;
  v51.super_class = (Class)NTKSiderealDialBackgroundView;
  v36 = -[NTKSiderealDialBackgroundView initWithFrame:](&v51, "initWithFrame:", x, y, width, height);
  if (v36)
  {
    v37 = [NTKSiderealBackgroundQuad alloc];
    v38 = +[CLKDevice currentDevice];
    LOBYTE(v46) = a17;
    v39 = [(NTKSiderealBackgroundQuad *)v37 initWithDevice:v38 orbitDiameter:v50 timeOrbitRadius:v49 timeRadius:v48 dialImage:v30 waypointImage:v31 gnomonImage:a4 dayGnomonImage:a5 dayDiskBloomImage:a6 dayDiscImage:v47 nightGnomonImage:v32 nightDiscImage:v33 nightRingImage:v34 initialData:v35 useXR:v46];
    backgroundQuad = v36->_backgroundQuad;
    v36->_backgroundQuad = v39;

    [(NTKSiderealDialBackgroundView *)v36 bounds];
    if (a17) {
      uint64_t v41 = 2;
    }
    else {
      uint64_t v41 = 0;
    }
    uint64_t v42 = +[CLKUIQuadView quadViewWithFrame:identifier:options:colorSpace:](CLKUIQuadView, "quadViewWithFrame:identifier:options:colorSpace:", @"Sdrl", 0, v41);
    quadView = v36->_quadView;
    v36->_quadView = (CLKUIQuadView *)v42;

    [(CLKUIQuadView *)v36->_quadView setPaused:1];
    [(CLKUIQuadView *)v36->_quadView setPreferredFramesPerSecond:0];
    [(CLKUIQuadView *)v36->_quadView addQuad:v36->_backgroundQuad];
    v44 = [(CLKUIQuadView *)v36->_quadView layer];
    [v44 setAllowsEdgeAntialiasing:0];

    objc_storeStrong((id *)&v36->_quad, v36->_backgroundQuad);
    [(NTKSiderealDialBackgroundView *)v36 addSubview:v36->_quadView];
  }

  return v36;
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
}

- (void)updateDayMask
{
  [(NTKSiderealBackgroundQuad *)self->_backgroundQuad setRenderingMode:1];
  quadView = self->_quadView;
  [(NTKSiderealDialBackgroundView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = +[CLKDevice currentDevice];
  [v12 screenScale];
  v14 = -[CLKUIQuadView snapshotTextureInRect:scale:time:](quadView, "snapshotTextureInRect:scale:time:", v5, v7, v9, v11, v13, 0.0);
  [(NTKSiderealBackgroundQuad *)self->_quad setDayMask:v14];

  [(NTKSiderealBackgroundQuad *)self->_backgroundQuad setRenderingMode:2];
  v15 = self->_quadView;
  [(NTKSiderealDialBackgroundView *)self bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = +[CLKDevice currentDevice];
  [v24 screenScale];
  v26 = -[CLKUIQuadView snapshotTextureInRect:scale:time:](v15, "snapshotTextureInRect:scale:time:", v17, v19, v21, v23, v25, 0.0);
  [(NTKSiderealBackgroundQuad *)self->_quad setNightMask:v26];

  backgroundQuad = self->_backgroundQuad;

  [(NTKSiderealBackgroundQuad *)backgroundQuad setRenderingMode:0];
}

- (void)setSolarDayProgress:(double)a3
{
}

- (void)setSectors:(id)a3
{
  [(NTKSiderealBackgroundQuad *)self->_backgroundQuad setSectors:a3];

  [(NTKSiderealDialBackgroundView *)self updateDayMask];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSiderealDialBackgroundView;
  [(NTKSiderealDialBackgroundView *)&v3 layoutSubviews];
  [(NTKSiderealDialBackgroundView *)self bounds];
  -[CLKUIQuadView setFrame:](self->_quadView, "setFrame:");
}

- (CLKUIQuadView)quadView
{
  return self->_quadView;
}

- (void)setQuadView:(id)a3
{
}

- (NTKSiderealBackgroundQuad)quad
{
  return self->_quad;
}

- (NTKAltitudeColorCurveView)backgroundDialView
{
  return self->_backgroundDialView;
}

- (void)setBackgroundDialView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundDialView, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_quadView, 0);

  objc_storeStrong((id *)&self->_backgroundQuad, 0);
}

@end