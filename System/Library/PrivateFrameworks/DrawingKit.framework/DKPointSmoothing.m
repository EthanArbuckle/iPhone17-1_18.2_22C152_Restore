@interface DKPointSmoothing
+ (uint64_t)interpolateFromPoint:toPoint:controlPoint:time:;
+ (void)_interpolateFromPoint:(float)a3 toPoint:(id)a4 withControlPoint:atUnitScale:emissionHandler:;
- (BOOL)emitInterpolatedPoints;
- (DKPointSmoothing)init;
- (DKPointSmoothing)initWithWidth:(unint64_t)a3 spacing:(float)a4;
- (UIBoxcarFilterPointFIFO)boxcarFIFO;
- (UIPointFIFO)strokeFIFO;
- (UIQuadCurvePointFIFO)interpolatingFIFO;
- (float)spacing;
- (float)unitScale;
- (id)emissionHandler;
- (unint64_t)width;
- (void)addPoint:(DKPointSmoothing *)self;
- (void)clear;
- (void)emitPoint:(DKPointSmoothing *)self;
- (void)flush;
- (void)setBoxcarFIFO:(id)a3;
- (void)setEmissionHandler:(id)a3;
- (void)setEmitInterpolatedPoints:(BOOL)a3;
- (void)setInterpolatingFIFO:(id)a3;
- (void)setSpacing:(float)a3;
- (void)setStrokeFIFO:(id)a3;
- (void)setUnitScale:(float)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation DKPointSmoothing

- (DKPointSmoothing)initWithWidth:(unint64_t)a3 spacing:(float)a4
{
  v17.receiver = self;
  v17.super_class = (Class)DKPointSmoothing;
  v6 = [(DKPointSmoothing *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_width = a3;
    v6->_spacing = a4;
    uint64_t v8 = [objc_alloc(MEMORY[0x263F81730]) initWithFIFO:0];
    interpolatingFIFO = v7->_interpolatingFIFO;
    v7->_interpolatingFIFO = (UIQuadCurvePointFIFO *)v8;

    [(UIQuadCurvePointFIFO *)v7->_interpolatingFIFO setEmitInterpolatedPoints:1];
    id v10 = objc_alloc(MEMORY[0x263F81700]);
    *(float *)&double v11 = v7->_spacing;
    uint64_t v12 = [v10 initWithFIFO:v7->_interpolatingFIFO width:v7->_width spacing:v11];
    boxcarFIFO = v7->_boxcarFIFO;
    v7->_boxcarFIFO = (UIBoxcarFilterPointFIFO *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263F81728]) initWithFIFO:v7->_boxcarFIFO];
    strokeFIFO = v7->_strokeFIFO;
    v7->_strokeFIFO = (UIPointFIFO *)v14;
  }
  return v7;
}

- (DKPointSmoothing)init
{
  LODWORD(v2) = 1.0;
  return [(DKPointSmoothing *)self initWithWidth:1 spacing:v2];
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
  -[UIBoxcarFilterPointFIFO setWidth:](self->_boxcarFIFO, "setWidth:");
}

- (void)setSpacing:(float)a3
{
  self->_spacing = a3;
  -[UIBoxcarFilterPointFIFO setSpacing:](self->_boxcarFIFO, "setSpacing:");
}

- (void)setUnitScale:(float)a3
{
  self->_unitScale = a3;
  -[UIQuadCurvePointFIFO setUnitScale:](self->_interpolatingFIFO, "setUnitScale:");
}

- (void)setEmitInterpolatedPoints:(BOOL)a3
{
  self->_emitInterpolatedPoints = a3;
  -[UIQuadCurvePointFIFO setEmitInterpolatedPoints:](self->_interpolatingFIFO, "setEmitInterpolatedPoints:");
}

- (void)setEmissionHandler:(id)a3
{
}

- (id)emissionHandler
{
  return (id)[(UIQuadCurvePointFIFO *)self->_interpolatingFIFO emissionHandler];
}

- (void)addPoint:(DKPointSmoothing *)self
{
}

- (void)emitPoint:(DKPointSmoothing *)self
{
}

- (void)flush
{
}

- (void)clear
{
}

+ (uint64_t)interpolateFromPoint:toPoint:controlPoint:time:
{
  return objc_msgSend(MEMORY[0x263F81730], "interpolateFromPoint:toPoint:controlPoint:time:");
}

+ (void)_interpolateFromPoint:(float)a3 toPoint:(id)a4 withControlPoint:atUnitScale:emissionHandler:
{
  float v7 = v6;
  float32x4_t v23 = v5;
  float32x4_t v24 = v4;
  float32x4_t v25 = *(float32x4_t *)&a3;
  uint64_t v8 = (void (**)(void))a4;
  float32x4_t v9 = vsubq_f32(v25, v23);
  float32x4_t v10 = vsubq_f32(v23, v24);
  float v11 = (float)(sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v9, v9)))
              + sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v10, v10))))
      / v7;
  unint64_t v12 = vcvtps_u32_f32(v11);
  v22 = v8;
  if (!v12)
  {
    v16 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    uint64_t v8 = v22;
    if (!v16) {
      goto LABEL_14;
    }
    _OWORD *v16 = v25;
    if (!v22) {
      goto LABEL_13;
    }
    v21 = v22[2];
    goto LABEL_12;
  }
  if (!(v12 >> 60))
  {
    v13 = malloc_type_malloc(16 * v12, 0x55B83351uLL);
    double v15 = *(double *)v24.i64;
    v16 = v13;
    uint64_t v8 = v22;
    if (v16)
    {
      double v17 = *(double *)v25.i64;
      double v18 = *(double *)v23.i64;
      if ((int)v12 >= 1)
      {
        uint64_t v19 = 0;
        do
        {
          *(float *)&double v14 = (float)(int)v19 / v11;
          +[DKPointSmoothing interpolateFromPoint:v17 toPoint:v15 controlPoint:v18 time:v14];
          double v18 = *(double *)v23.i64;
          double v15 = *(double *)v24.i64;
          double v17 = *(double *)v25.i64;
          v16[v19++] = v20;
        }
        while (v12 != v19);
      }
      if (!v22) {
        goto LABEL_13;
      }
      v21 = v22[2];
LABEL_12:
      v21();
LABEL_13:
      free(v16);
      uint64_t v8 = v22;
    }
  }
LABEL_14:
}

- (unint64_t)width
{
  return self->_width;
}

- (float)spacing
{
  return self->_spacing;
}

- (float)unitScale
{
  return self->_unitScale;
}

- (BOOL)emitInterpolatedPoints
{
  return self->_emitInterpolatedPoints;
}

- (UIPointFIFO)strokeFIFO
{
  return self->_strokeFIFO;
}

- (void)setStrokeFIFO:(id)a3
{
}

- (UIBoxcarFilterPointFIFO)boxcarFIFO
{
  return self->_boxcarFIFO;
}

- (void)setBoxcarFIFO:(id)a3
{
}

- (UIQuadCurvePointFIFO)interpolatingFIFO
{
  return self->_interpolatingFIFO;
}

- (void)setInterpolatingFIFO:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_boxcarFIFO, 0);
  objc_storeStrong((id *)&self->_strokeFIFO, 0);
}

@end