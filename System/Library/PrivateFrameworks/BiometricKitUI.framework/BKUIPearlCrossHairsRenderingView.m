@interface BKUIPearlCrossHairsRenderingView
- (BKUIPearlCrossHairsManager)crosshairsInstanceManager;
- (BKUIPearlCrossHairsRenderingView)initWithFrame:(CGRect)a3 device:(id)a4;
- (BOOL)grayscale;
- (MTLSAnimatablePathCollection)checkMarkPathCollection;
- (MTLSAnimatablePathCollection)crosshairsPathCollection;
- (MTLSPathBufferData)checkMarkData;
- (MTLSPathBufferData)crosshairsData;
- (MTLSplineRenderer)renderer;
- (double)axis;
- (unint64_t)getState;
- (unint64_t)state;
- (void)drawRect:(CGRect)a3;
- (void)setAxis:(BKUIPearlCrossHairsRenderingView *)self;
- (void)setAxis:(BOOL)a3 animated:;
- (void)setCheckMarkData:(id)a3;
- (void)setCheckMarkPathCollection:(id)a3;
- (void)setCrosshairsData:(id)a3;
- (void)setCrosshairsInstanceManager:(id)a3;
- (void)setCrosshairsPathCollection:(id)a3;
- (void)setGrayscale:(BOOL)a3;
- (void)setRenderer:(id)a3;
- (void)setSampleCount:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation BKUIPearlCrossHairsRenderingView

- (BKUIPearlCrossHairsRenderingView)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v89.receiver = self;
  v89.super_class = (Class)BKUIPearlCrossHairsRenderingView;
  v10 = -[MTKView initWithFrame:device:](&v89, sel_initWithFrame_device_, v9, x, y, width, height);
  if (v10)
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(3);
    inFlightSemaphore = v10->_inFlightSemaphore;
    v10->_inFlightSemaphore = (OS_dispatch_semaphore *)v11;

    v10->_time = CACurrentMediaTime();
    uint64_t v13 = [v9 newCommandQueue];
    commandQueue = v10->_commandQueue;
    v10->_commandQueue = (MTLCommandQueue *)v13;

    [(MTLCommandQueue *)v10->_commandQueue setLabel:@"Crosshairs Command Queue"];
    int v107 = 0;
    uint64_t v106 = 0;
    id v15 = objc_alloc(MEMORY[0x1E4F50588]);
    __asm { FMOV            V0.4S, #1.0 }
    long long v100 = _Q0;
    double v21 = *(double *)&_Q0;
    long long v86 = _Q0;
    long long v101 = 0uLL;
    LODWORD(_Q0) = 2.5;
    LODWORD(v22) = 1126247083;
    v23 = (void *)[v15 initWithStrokeWeight:&v100 radius:*(double *)&_Q0 scale:v22 rotation:v21 translation:0.0];
    id v24 = objc_alloc(MEMORY[0x1E4F50588]);
    long long v100 = v86;
    long long v101 = 0uLL;
    LODWORD(v25) = 1112014848;
    LODWORD(v26) = 4.0;
    uint64_t v27 = objc_msgSend(v24, "initWithStrokeWeight:radius:scale:rotation:translation:", &v100, v26, v25);
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F50570]) initWithDefaultPath:v23];
    [(BKUIPearlCrossHairsRenderingView *)v10 setCrosshairsPathCollection:v28];

    v29 = [(BKUIPearlCrossHairsRenderingView *)v10 crosshairsPathCollection];
    v83 = (void *)v27;
    [v29 setPath:v27 forKey:@"small"];

    v10->_pathBlendDest = 0.0;
    v10->_pathBlend = 0.0;
    v30 = objc_alloc_init(BKUIPearlCrossHairsManager);
    [(BKUIPearlCrossHairsRenderingView *)v10 setCrosshairsInstanceManager:v30];

    v31 = [(BKUIPearlCrossHairsRenderingView *)v10 crosshairsPathCollection];
    v32 = [v31 defaultPath];
    [v32 clearInstances];

    v33 = [(BKUIPearlCrossHairsRenderingView *)v10 crosshairsPathCollection];
    v34 = [v33 defaultPath];
    v35 = [(BKUIPearlCrossHairsRenderingView *)v10 crosshairsInstanceManager];
    uint64_t v36 = [v35 instanceData];
    v37 = [(BKUIPearlCrossHairsRenderingView *)v10 crosshairsInstanceManager];
    v38 = [v37 springInstances];
    objc_msgSend(v34, "appendInstances:count:", v36, objc_msgSend(v38, "count"));

    id v39 = objc_alloc(MEMORY[0x1E4F50580]);
    v40 = [(BKUIPearlCrossHairsRenderingView *)v10 crosshairsPathCollection];
    __asm { FMOV            V9.2S, #1.0 }
    v42 = (void *)[v39 initWithCollection:v40 device:v9 viewRatio:_D9];
    [(BKUIPearlCrossHairsRenderingView *)v10 setCrosshairsData:v42];

    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = xmmword_1E4BD1880;
    long long v103 = xmmword_1E4BD1880;
    long long v104 = xmmword_1E4BD1890;
    long long v105 = xmmword_1E4BD1890;
    memset(v99, 0, 32);
    v99[2] = xmmword_1E4BD18A0;
    v99[3] = xmmword_1E4BD18A0;
    v99[4] = xmmword_1E4BD18B0;
    v99[5] = xmmword_1E4BD18B0;
    memset(v98, 0, 32);
    v98[2] = xmmword_1E4BD18B0;
    v98[3] = xmmword_1E4BD18B0;
    v98[4] = xmmword_1E4BD18C0;
    v98[5] = xmmword_1E4BD18C0;
    memset(v97, 0, 32);
    v97[2] = xmmword_1E4BD18B0;
    v97[3] = xmmword_1E4BD18B0;
    v97[4] = xmmword_1E4BD18D0;
    v97[5] = xmmword_1E4BD18D0;
    v96[0] = xmmword_1E4BD1400;
    v96[1] = xmmword_1E4BD1400;
    v96[2] = xmmword_1E4BD1400;
    v96[3] = xmmword_1E4BD1400;
    v96[4] = xmmword_1E4BD1400;
    v96[5] = xmmword_1E4BD1400;
    v95[0] = xmmword_1E4BD18E0;
    v95[1] = xmmword_1E4BD18E0;
    v95[2] = xmmword_1E4BD18E0;
    v95[3] = xmmword_1E4BD18E0;
    v95[4] = xmmword_1E4BD18E0;
    v95[5] = xmmword_1E4BD18E0;
    id v43 = objc_alloc(MEMORY[0x1E4F50578]);
    long long v91 = v86;
    long long v92 = 0uLL;
    LODWORD(v44) = 4.0;
    v45 = objc_msgSend(v43, "initWithPoints:colors:count:strokeWeight:pattern:rotation:scale:translation:", &v100, v96, 6, 0, &v91, v44);
    id v46 = objc_alloc(MEMORY[0x1E4F50578]);
    long long v91 = v86;
    LODWORD(v92) = 0;
    *(void *)((char *)&v92 + 4) = v106;
    HIDWORD(v92) = v107;
    LODWORD(v47) = 4.0;
    v48 = objc_msgSend(v46, "initWithPoints:colors:count:strokeWeight:pattern:rotation:scale:translation:", v99, v95, 6, 0, &v91, v47);
    id v49 = objc_alloc(MEMORY[0x1E4F50578]);
    long long v91 = v86;
    LODWORD(v92) = 0;
    *(void *)((char *)&v92 + 4) = v106;
    HIDWORD(v92) = v107;
    LODWORD(v50) = 4.0;
    v51 = objc_msgSend(v49, "initWithPoints:colors:count:strokeWeight:pattern:rotation:scale:translation:", v98, v95, 6, 0, &v91, v50);
    id v52 = objc_alloc(MEMORY[0x1E4F50578]);
    long long v91 = v86;
    LODWORD(v92) = 0;
    *(void *)((char *)&v92 + 4) = v106;
    HIDWORD(v92) = v107;
    LODWORD(v53) = 4.0;
    v54 = objc_msgSend(v52, "initWithPoints:colors:count:strokeWeight:pattern:rotation:scale:translation:", v97, v95, 6, 0, &v91, v53);
    v55 = (void *)[objc_alloc(MEMORY[0x1E4F50570]) initWithDefaultPath:v54];
    [(BKUIPearlCrossHairsRenderingView *)v10 setCheckMarkPathCollection:v55];

    v56 = [(BKUIPearlCrossHairsRenderingView *)v10 checkMarkPathCollection];
    [v56 setPath:v51 forKey:@"half1"];

    v57 = [(BKUIPearlCrossHairsRenderingView *)v10 checkMarkPathCollection];
    [v57 setPath:v48 forKey:@"half0"];

    v58 = [(BKUIPearlCrossHairsRenderingView *)v10 checkMarkPathCollection];
    [v58 setPath:v45 forKey:@"none"];

    id v59 = objc_alloc(MEMORY[0x1E4F50580]);
    v60 = [(BKUIPearlCrossHairsRenderingView *)v10 checkMarkPathCollection];
    v61 = (void *)[v59 initWithCollection:v60 device:v9 viewRatio:_D9];
    [(BKUIPearlCrossHairsRenderingView *)v10 setCheckMarkData:v61];

    id v62 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v63 = [(BKUIPearlCrossHairsRenderingView *)v10 checkMarkData];
    v64 = [(BKUIPearlCrossHairsRenderingView *)v10 crosshairsData];
    v65 = objc_msgSend(v62, "initWithObjects:", v63, v64, 0);

    v66 = (void *)[objc_alloc(MEMORY[0x1E4F50590]) initWithMTKView:v10 dataCollection:v65];
    [(BKUIPearlCrossHairsRenderingView *)v10 setRenderer:v66];

    matrix_ortho();
    float32x4_t v84 = v68;
    float32x4_t v87 = v67;
    float32x4_t v79 = v70;
    float32x4_t v81 = v69;
    LODWORD(v78) = 0;
    matrix_look_at();
    uint64_t v71 = 0;
    v90[0] = v72;
    v90[1] = v73;
    v90[2] = v74;
    v90[3] = v75;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    do
    {
      *(long long *)((char *)&v91 + v71 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, COERCE_FLOAT(v90[v71])), v84, *(float32x2_t *)&v90[v71], 1), v81, (float32x4_t)v90[v71], 2), v79, (float32x4_t)v90[v71], 3);
      ++v71;
    }
    while (v71 != 4);
    double v85 = *(double *)&v93;
    double v88 = *(double *)&v94;
    double v80 = *(double *)&v91;
    double v82 = *(double *)&v92;
    v76 = [(BKUIPearlCrossHairsRenderingView *)v10 renderer];
    objc_msgSend(v76, "setProjectionMatrix:", v80, v82, v85, v88);
  }
  return v10;
}

- (void)setGrayscale:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsInstanceManager];
  [v4 setGrayscale:v3];
}

- (BOOL)grayscale
{
  v2 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsInstanceManager];
  char v3 = [v2 grayscale];

  return v3;
}

- (void)setSampleCount:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlCrossHairsRenderingView;
  [(MTKView *)&v5 setSampleCount:a3];
  id v4 = [(BKUIPearlCrossHairsRenderingView *)self renderer];
  [v4 createPipelineStates];
}

- (void)setAxis:(BOOL)a3 animated:
{
  BOOL v4 = a3;
  *(_OWORD *)self->_axis = v3;
  v6 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsInstanceManager];
  long long v7 = *(_OWORD *)self->_axis;
  id v8 = v6;
  if (v4) {
    [v6 setTarget:*(double *)&v7];
  }
  else {
    [v6 setValue:*(double *)&v7];
  }
}

- (void)setState:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_super v5 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsInstanceManager];
    [v5 setSpringsStates:1];
    float v6 = 1.0;
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_super v5 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsInstanceManager];
    [v5 setSpringsStates:0];
    float v6 = 0.0;
LABEL_5:

    self->_pathBlendDest = v6;
  }
  self->_state = a3;
}

- (unint64_t)getState
{
  return self->_state;
}

- (void)drawRect:(CGRect)a3
{
  v51.receiver = self;
  v51.super_class = (Class)BKUIPearlCrossHairsRenderingView;
  -[BKUIPearlCrossHairsRenderingView drawRect:](&v51, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  inFlightSemaphore = self->_inFlightSemaphore;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(inFlightSemaphore, v5)) {
    return;
  }
  float v6 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v6 setLabel:@"Crosshairs Command Buffer"];
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy_;
  v49[4] = __Block_byref_object_dispose_;
  double v50 = self->_inFlightSemaphore;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __45__BKUIPearlCrossHairsRenderingView_drawRect___block_invoke;
  v48[3] = &unk_1E6EA2B48;
  v48[4] = v49;
  double v47 = v6;
  [v6 addCompletedHandler:v48];
  float pathBlend = self->_pathBlend;
  float pathBlendDest = self->_pathBlendDest;
  float v9 = pathBlend
     + (float)(pathBlendDest - pathBlend)
     * (6.0
      / (double)[(MTKView *)self preferredFramesPerSecond]);
  self->_float pathBlend = v9;
  v10 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsInstanceManager];
  [v10 setTarget:*(double *)self->_axis];

  dispatch_semaphore_t v11 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsInstanceManager];
  [v11 update:CACurrentMediaTime() - self->_time];

  self->_time = CACurrentMediaTime();
  v12 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsData];
  uint64_t v13 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsInstanceManager];
  uint64_t v14 = [v13 instanceData];
  id v15 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsInstanceManager];
  v16 = [v15 springInstances];
  objc_msgSend(v12, "updateInstanceBufferWithData:count:", v14, objc_msgSend(v16, "count"));

  id v46 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsData];
  v17 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsPathCollection];
  v18 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsPathCollection];
  v19 = [v18 defaultPath];
  v20 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsPathCollection];
  double v21 = [v20 paths];
  double v22 = [v21 objectForKeyedSubscript:@"small"];
  *(float *)&double v23 = self->_pathBlend;
  uint64_t v24 = [v17 blendPath:v19 withPath:v22 byAmount:v23];
  double v25 = [(BKUIPearlCrossHairsRenderingView *)self crosshairsPathCollection];
  double v26 = [v25 defaultPath];
  objc_msgSend(v46, "updateControlPointBufferWithData:count:", v24, objc_msgSend(v26, "controlPointsCount"));

  float v27 = self->_pathBlend * self->_pathBlend;
  if (v27 >= 0.3)
  {
    if (v27 >= 0.35)
    {
      v28 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
      v29 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
      v30 = [v29 paths];
      v31 = [v30 objectForKeyedSubscript:@"half1"];
      v32 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
      v33 = [v32 defaultPath];
      *(float *)&double v37 = fminf(fmaxf((float)(v27 + -0.35) / 0.65, 0.0), 1.0);
      [v28 blendPath:v31 withPath:v33 byAmount:v37];
      goto LABEL_8;
    }
    v28 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
    v29 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
    v30 = [v29 paths];
    v31 = [v30 objectForKeyedSubscript:@"half0"];
    v32 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
    v33 = [v32 paths];
    v34 = [v33 objectForKeyedSubscript:@"half1"];
    *(float *)&double v36 = fminf(fmaxf((float)(v27 + -0.3) / 0.05, 0.0), 1.0);
    [v28 blendPath:v31 withPath:v34 byAmount:v36];
  }
  else
  {
    v28 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
    v29 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
    v30 = [v29 paths];
    v31 = [v30 objectForKeyedSubscript:@"none"];
    v32 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
    v33 = [v32 paths];
    v34 = [v33 objectForKeyedSubscript:@"half0"];
    *(float *)&double v35 = fminf(fmaxf(v27 / 0.3, 0.0), 1.0);
    [v28 blendPath:v31 withPath:v34 byAmount:v35];
  }

LABEL_8:
  v38 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkData];
  id v39 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
  uint64_t v40 = [v39 controlPointState];
  v41 = [(BKUIPearlCrossHairsRenderingView *)self checkMarkPathCollection];
  v42 = [v41 defaultPath];
  objc_msgSend(v38, "updateControlPointBufferWithData:count:", v40, objc_msgSend(v42, "controlPointsCount"));

  id v43 = [(MTKView *)self currentRenderPassDescriptor];
  if (v43)
  {
    double v44 = [(BKUIPearlCrossHairsRenderingView *)self renderer];
    [v44 renderWithCommandBuffer:v47];

    v45 = [(MTKView *)self currentDrawable];
    [v47 presentDrawable:v45];
  }
  [v47 commit];

  _Block_object_dispose(v49, 8);
}

intptr_t __45__BKUIPearlCrossHairsRenderingView_drawRect___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (unint64_t)state
{
  return self->_state;
}

- (double)axis
{
  objc_copyStruct(&v2, (const void *)(a1 + 1088), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setAxis:(BKUIPearlCrossHairsRenderingView *)self
{
  long long v3 = v2;
  objc_copyStruct(self->_axis, &v3, 16, 1, 0);
}

- (MTLSAnimatablePathCollection)crosshairsPathCollection
{
  return (MTLSAnimatablePathCollection *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setCrosshairsPathCollection:(id)a3
{
}

- (BKUIPearlCrossHairsManager)crosshairsInstanceManager
{
  return (BKUIPearlCrossHairsManager *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setCrosshairsInstanceManager:(id)a3
{
}

- (MTLSPathBufferData)crosshairsData
{
  return (MTLSPathBufferData *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setCrosshairsData:(id)a3
{
}

- (MTLSAnimatablePathCollection)checkMarkPathCollection
{
  return (MTLSAnimatablePathCollection *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setCheckMarkPathCollection:(id)a3
{
}

- (MTLSPathBufferData)checkMarkData
{
  return (MTLSPathBufferData *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setCheckMarkData:(id)a3
{
}

- (MTLSplineRenderer)renderer
{
  return (MTLSplineRenderer *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_checkMarkData, 0);
  objc_storeStrong((id *)&self->_checkMarkPathCollection, 0);
  objc_storeStrong((id *)&self->_crosshairsData, 0);
  objc_storeStrong((id *)&self->_crosshairsInstanceManager, 0);
  objc_storeStrong((id *)&self->_crosshairsPathCollection, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_inFlightSemaphore, 0);
}

@end