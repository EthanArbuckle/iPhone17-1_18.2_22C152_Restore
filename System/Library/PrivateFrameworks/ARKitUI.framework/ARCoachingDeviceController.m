@interface ARCoachingDeviceController
- (ARCoachingDeviceController)initWithDeviceMaskImage:(id)a3 geoTrackingMode:(BOOL)a4;
- (ARCoachingDeviceController)initWithDeviceMaskImage:(id)a3 solidColor:(id)a4 geoTrackingMode:(BOOL)a5;
- (CATransform3D)transform;
- (CGPoint)position;
- (CGRect)bounds;
- (float)opacity;
- (void)setBounds:(CGRect)a3;
- (void)setLayerParent:(id)a3;
- (void)setOpacity:(float)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setTransform:(CATransform3D *)a3;
- (void)update:(double)a3 visibility:(double)a4 layer:(id)a5 renderParams:(id *)a6;
@end

@implementation ARCoachingDeviceController

- (CGRect)bounds
{
  [(CALayer *)self->_deviceLayer bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[CALayer setBounds:](self->_deviceLayer, "setBounds:");
  -[CALayer setBounds:](self->_holeLayer, "setBounds:", x, y, width, height);
  deviceMaskLayer = self->_deviceMaskLayer;
  if (deviceMaskLayer)
  {
    -[CALayer setBounds:](deviceMaskLayer, "setBounds:", x, y, width, height);
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    double MidX = CGRectGetMidX(v13);
    v14.origin.double x = x;
    v14.origin.double y = y;
    v14.size.double width = width;
    v14.size.double height = height;
    double MidY = CGRectGetMidY(v14);
    v11 = self->_deviceMaskLayer;
    -[CALayer setPosition:](v11, "setPosition:", MidX, MidY);
  }
}

- (CGPoint)position
{
  [(CALayer *)self->_deviceLayer position];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[CALayer setPosition:](self->_deviceLayer, "setPosition:");
  holeLayer = self->_holeLayer;

  -[CALayer setPosition:](holeLayer, "setPosition:", x, y);
}

- (CATransform3D)transform
{
  CGPoint result = (CATransform3D *)self->_deviceLayer;
  if (result) {
    return (CATransform3D *)[(CATransform3D *)result transform];
  }
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  return result;
}

- (void)setTransform:(CATransform3D *)a3
{
  long long v5 = *(_OWORD *)&a3->m33;
  v14[4] = *(_OWORD *)&a3->m31;
  v14[5] = v5;
  long long v6 = *(_OWORD *)&a3->m43;
  v14[6] = *(_OWORD *)&a3->m41;
  v14[7] = v6;
  long long v7 = *(_OWORD *)&a3->m13;
  v14[0] = *(_OWORD *)&a3->m11;
  v14[1] = v7;
  long long v8 = *(_OWORD *)&a3->m23;
  v14[2] = *(_OWORD *)&a3->m21;
  v14[3] = v8;
  [(CALayer *)self->_deviceLayer setTransform:v14];
  long long v9 = *(_OWORD *)&a3->m33;
  v13[4] = *(_OWORD *)&a3->m31;
  v13[5] = v9;
  long long v10 = *(_OWORD *)&a3->m43;
  v13[6] = *(_OWORD *)&a3->m41;
  v13[7] = v10;
  long long v11 = *(_OWORD *)&a3->m13;
  v13[0] = *(_OWORD *)&a3->m11;
  v13[1] = v11;
  long long v12 = *(_OWORD *)&a3->m23;
  v13[2] = *(_OWORD *)&a3->m21;
  v13[3] = v12;
  [(CALayer *)self->_holeLayer setTransform:v13];
}

- (float)opacity
{
  [(CALayer *)self->_deviceLayer opacity];
  return result;
}

- (void)setOpacity:(float)a3
{
  -[CALayer setOpacity:](self->_deviceLayer, "setOpacity:");
  holeLayer = self->_holeLayer;
  if (self->_geoTrackingMode)
  {
    LODWORD(v5) = 1.0;
    [(CALayer *)holeLayer setOpacity:v5];
    holeLayer = self->_holeLayer;
  }
  *(float *)&double v5 = a3;

  [(CALayer *)holeLayer setOpacity:v5];
}

- (ARCoachingDeviceController)initWithDeviceMaskImage:(id)a3 solidColor:(id)a4 geoTrackingMode:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)ARCoachingDeviceController;
  long long v10 = [(ARCoachingDeviceController *)&v26 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263F157E8] layer];
    holeLayer = v10->_holeLayer;
    v10->_holeLayer = (CALayer *)v11;

    [(CALayer *)v10->_holeLayer setCompositingFilter:*MEMORY[0x263F15D08]];
    -[CALayer setBackgroundColor:](v10->_holeLayer, "setBackgroundColor:", [v9 CGColor]);
    [(CALayer *)v10->_holeLayer setCornerRadius:8.0];
    uint64_t v13 = *MEMORY[0x263F15A20];
    [(CALayer *)v10->_holeLayer setCornerCurve:*MEMORY[0x263F15A20]];
    uint64_t v14 = [MEMORY[0x263F157E8] layer];
    deviceLayer = v10->_deviceLayer;
    v10->_deviceLayer = (CALayer *)v14;

    v10->_geoTrackingMode = a5;
    if (v8)
    {
      uint64_t v16 = [MEMORY[0x263F157E8] layer];
      deviceMaskLayer = v10->_deviceMaskLayer;
      v10->_deviceMaskLayer = (CALayer *)v16;

      id v18 = v8;
      -[CALayer setContents:](v10->_deviceMaskLayer, "setContents:", [v18 CGImage]);
      [(CALayer *)v10->_deviceMaskLayer setAllowsEdgeAntialiasing:1];
      [(CALayer *)v10->_deviceLayer setMask:v10->_deviceMaskLayer];
      id v19 = [MEMORY[0x263F1C550] whiteColor];
      -[CALayer setBackgroundColor:](v10->_deviceLayer, "setBackgroundColor:", [v19 CGColor]);

      [v18 size];
      double v21 = v20;
      [v18 size];
      double v23 = v21 / v22;
    }
    else
    {
      id v24 = [MEMORY[0x263F1C550] whiteColor];
      -[CALayer setBorderColor:](v10->_deviceLayer, "setBorderColor:", [v24 CGColor]);

      [(CALayer *)v10->_deviceLayer setBorderWidth:2.0];
      [(CALayer *)v10->_deviceLayer setCornerRadius:8.0];
      [(CALayer *)v10->_deviceLayer setCornerCurve:v13];
      double v23 = 0.5;
    }
    v10->_aspectRatio = v23;
  }

  return v10;
}

- (ARCoachingDeviceController)initWithDeviceMaskImage:(id)a3 geoTrackingMode:(BOOL)a4
{
  BOOL v4 = a4;
  long long v6 = (void *)MEMORY[0x263F1C550];
  id v7 = a3;
  id v8 = [v6 blackColor];
  id v9 = [(ARCoachingDeviceController *)self initWithDeviceMaskImage:v7 solidColor:v8 geoTrackingMode:v4];

  if (v9)
  {
    [(CALayer *)v9->_holeLayer setCompositingFilter:*MEMORY[0x263F15B90]];
    uint64_t v10 = [MEMORY[0x263F157E8] layer];
    shineLayer = v9->_shineLayer;
    v9->_shineLayer = (CALayer *)v10;

    [(CALayer *)v9->_shineLayer setCornerRadius:8.0];
    [(CALayer *)v9->_shineLayer setCornerCurve:*MEMORY[0x263F15A20]];
    [(CALayer *)v9->_shineLayer setMasksToBounds:1];
    uint64_t v12 = [MEMORY[0x263F157E8] layer];
    shineInnerLayer = v9->_shineInnerLayer;
    v9->_shineInnerLayer = (CALayer *)v12;

    id v14 = [MEMORY[0x263F1C550] whiteColor];
    -[CALayer setBackgroundColor:](v9->_shineInnerLayer, "setBackgroundColor:", [v14 CGColor]);

    [(CALayer *)v9->_shineInnerLayer setAllowsEdgeAntialiasing:1];
    v15 = v9->_shineInnerLayer;
    CGAffineTransformMakeRotation(&v17, 1.09955743);
    [(CALayer *)v15 setAffineTransform:&v17];
    [(CALayer *)v9->_shineLayer addSublayer:v9->_shineInnerLayer];
  }
  return v9;
}

- (void)update:(double)a3 visibility:(double)a4 layer:(id)a5 renderParams:(id *)a6
{
  id v10 = a5;
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  *(float *)&CGFloat v11 = a3;
  float v19 = cosf(*(float *)&v11);
  if (self->_geoTrackingMode)
  {
    float v20 = a3 * 0.25 * 3.14159265 + a3 * 0.25 * 3.14159265;
    float v19 = sinf(v20);
  }
  float v21 = v19;
  float v22 = v18 / 600.0;
  [MEMORY[0x263F158F8] setDisableActions:1];
  -[ARCoachingDeviceController setBounds:](self, "setBounds:", 0.0, 0.0, self->_aspectRatio * 72.0 * v22, (float)(v22 * 72.0));
  v75.origin.double x = v12;
  v75.origin.double y = v14;
  v75.size.double width = v16;
  v75.size.double height = v18;
  double MidX = CGRectGetMidX(v75);
  v76.origin.double x = v12;
  v76.origin.double y = v14;
  v76.size.double width = v16;
  v76.size.double height = v18;
  -[ARCoachingDeviceController setPosition:](self, "setPosition:", MidX, CGRectGetMidY(v76));
  long long v24 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v70[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v70[3] = v24;
  v70[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  uint64_t v71 = *(void *)(MEMORY[0x263F15740] + 80);
  long long v25 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v70[0] = *MEMORY[0x263F15740];
  v70[1] = v25;
  long long v26 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v73 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v74 = v26;
  double v72 = -1.0 / (v18 * 0.615763547);
  [(ARCoachingDeviceController *)self setTransform:v70];
  [(ARCoachingDeviceController *)self transform];
  CATransform3DRotate(&v69, &v68, a6->var0 * 3.14159265 / 180.0, 0.0, 1.0, 0.0);
  CATransform3D v67 = v69;
  [(ARCoachingDeviceController *)self setTransform:&v67];
  float v27 = a4 * 0.7 + 0.3;
  [(ARCoachingDeviceController *)self transform];
  CATransform3DScale(&v66, &v65, v27, v27, 1.0);
  CATransform3D v64 = v66;
  [(ARCoachingDeviceController *)self setTransform:&v64];
  float v28 = a6->var1 + (float)(v21 * 0.25133);
  __float2 v30 = __sincosf_stret(v28);
  float v31 = (1.0 - v30.__cosval) / -0.0314168334 + 1.0;
  double var2 = a6->var2;
  float v33 = v18 * 0.04618 * v31 * var2 + v18 * 0.04618;
  double v34 = a4 * 0.4 + 0.6;
  float v35 = (float)(a6->var3 * v22) + v18 * 0.15 * v34;
  float v36 = v34 * (v18 * 0.182 * (float)(v30.__sinval / 0.24869)) * var2;
  if (self->_geoTrackingMode) {
    float v37 = v36 * 0.5;
  }
  else {
    float v37 = v36;
  }
  if (self->_geoTrackingMode) {
    float v38 = (float)(v35 + -72.0) + (float)(v30.__sinval * 5.0);
  }
  else {
    float v38 = v35;
  }
  if (self->_geoTrackingMode) {
    float v39 = (float)(v30.__sinval * -55.0) + 25.0;
  }
  else {
    float v39 = v33;
  }
  *(float *)&double v29 = (float)(v30.__sinval * -55.0) + 25.0;
  [(ARCoachingDeviceController *)self transform];
  CATransform3DTranslate(&v63, &v62, v37, v38, v39);
  CATransform3D v61 = v63;
  [(ARCoachingDeviceController *)self setTransform:&v61];
  if (self->_geoTrackingMode)
  {
    [(ARCoachingDeviceController *)self transform];
    CATransform3DRotate(&v60, &v59, (float)((float)(v28 * -0.75) + -0.3), 0.0, 1.0, 0.0);
    CATransform3D v58 = v60;
    v40 = &v58;
  }
  else
  {
    [(ARCoachingDeviceController *)self transform];
    CATransform3DRotate(&v57, &v56, v28, 0.0, 1.0, 0.0);
    CATransform3D v55 = v57;
    v40 = &v55;
  }
  [(ARCoachingDeviceController *)self setTransform:v40];
  float v41 = a4;
  *(float *)&double v42 = v41 * v41;
  [(ARCoachingDeviceController *)self setOpacity:v42];
  [v10 contentsScale];
  double v44 = v43;

  [(CALayer *)self->_deviceMaskLayer setContentsScale:v44];
  [(ARCoachingDeviceController *)self bounds];
  -[CALayer setBounds:](self->_shineLayer, "setBounds:");
  [(ARCoachingDeviceController *)self opacity];
  -[CALayer setOpacity:](self->_shineLayer, "setOpacity:");
  [(ARCoachingDeviceController *)self transform];
  shineLayer = self->_shineLayer;
  v54[4] = v54[12];
  v54[5] = v54[13];
  v54[6] = v54[14];
  v54[7] = v54[15];
  v54[0] = v54[8];
  v54[1] = v54[9];
  v54[2] = v54[10];
  v54[3] = v54[11];
  [(CALayer *)shineLayer setTransform:v54];
  [(ARCoachingDeviceController *)self position];
  -[CALayer setPosition:](self->_shineLayer, "setPosition:");
  LODWORD(v46) = 1053609165;
  [(CALayer *)self->_shineInnerLayer setOpacity:v46];
  [(CALayer *)self->_shineLayer bounds];
  *(float *)&double v44 = v47 * 6.0;
  [(CALayer *)self->_shineLayer bounds];
  float v49 = v48;
  double v50 = *(float *)&v44;
  double v51 = v49;
  -[CALayer setBounds:](self->_shineInnerLayer, "setBounds:", 0.0, 0.0, v50, v49);
  double v52 = v51 + v51 * -0.2 * v21;
  [(CALayer *)self->_shineLayer bounds];
  CGFloat v53 = CGRectGetMidX(v77) + 5.0;
  [(CALayer *)self->_shineLayer bounds];
  -[CALayer setPosition:](self->_shineInnerLayer, "setPosition:", v53, CGRectGetMidX(v78) - v52);
  [MEMORY[0x263F158F8] setDisableActions:0];
}

- (void)setLayerParent:(id)a3
{
  holeLayer = self->_holeLayer;
  id v5 = a3;
  [v5 addSublayer:holeLayer];
  [v5 addSublayer:self->_shineLayer];
  [v5 addSublayer:self->_deviceLayer];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shineInnerLayer, 0);
  objc_storeStrong((id *)&self->_deviceMaskLayer, 0);
  objc_storeStrong((id *)&self->_shineLayer, 0);
  objc_storeStrong((id *)&self->_holeLayer, 0);

  objc_storeStrong((id *)&self->_deviceLayer, 0);
}

@end