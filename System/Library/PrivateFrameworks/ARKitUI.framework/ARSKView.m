@interface ARSKView
- (ARAnchor)anchorForNode:(SKNode *)node;
- (ARSKView)initWithCoder:(id)a3;
- (ARSKView)initWithFrame:(CGRect)a3;
- (ARSession)session;
- (NSArray)hitTest:(CGPoint)point types:(ARHitTestResultType)types;
- (SKNode)nodeForAnchor:(ARAnchor *)anchor;
- (id)_anchorForNode:(id)a3 inFrame:(id)a4;
- (void)_updateAnchors:(id)a3 camera:(id)a4;
- (void)_updateNode:(float32x4_t)a3 forAnchor:(float32x4_t)a4 projectionMatrix:(float32x4_t)a5 camera:(uint64_t)a6 orientation:(void *)a7;
- (void)commonInit;
- (void)dealloc;
- (void)layoutSubviews;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4;
- (void)sessionWasInterrupted:(id)a3;
- (void)setSession:(ARSession *)session;
@end

@implementation ARSKView

- (ARSKView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARSKView;
  v3 = [(SKView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ARSKView *)v3 commonInit];
  }
  return v4;
}

- (ARSKView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARSKView;
  v3 = -[SKView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ARSKView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = (NSMutableDictionary *)objc_opt_new();
  nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
  self->_nodesByAnchorIdentifier = v3;

  v5 = (NSSet *)objc_opt_new();
  lastFrameAnchors = self->_lastFrameAnchors;
  self->_lastFrameAnchors = v5;

  [(ARSKView *)self bounds];
  self->_viewportSize.width = v7;
  self->_viewportSize.height = v8;
  [(SKView *)self setAllowsTransparency:1];
  [(SKView *)self setIgnoresSiblingOrder:1];
  v9 = (void *)MEMORY[0x263F20F38];

  [v9 setRenderType:3];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ARSKView;
  [(SKView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  kdebug_trace();
  v13.receiver = self;
  v13.super_class = (Class)ARSKView;
  [(SKView *)&v13 layoutSubviews];
  kdebug_trace();
  v3 = [(ARSKView *)self window];
  objc_super v4 = [v3 windowScene];
  self->_interfaceOrientation = [v4 interfaceOrientation];

  [(ARSKView *)self bounds];
  self->_viewportSize.width = v5;
  self->_viewportSize.height = v6;
  if (_ARLogGeneral_onceToken_2 != -1) {
    dispatch_once(&_ARLogGeneral_onceToken_2, &__block_literal_global_9);
  }
  CGFloat v7 = (void *)_ARLogGeneral_logObj_2;
  if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_2, OS_LOG_TYPE_DEBUG))
  {
    CGFloat v8 = v7;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [(ARSKView *)self bounds];
    v11 = NSStringFromCGRect(v23);
    v12 = NSStringFromUIInterfaceOrientation(self->_interfaceOrientation);
    *(_DWORD *)buf = 138544130;
    v15 = v10;
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2114;
    v19 = v11;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_20B202000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: [ARSKView] Layout changed to %{public}@, %{public}@", buf, 0x2Au);
  }
}

- (ARSession)session
{
  v2 = self;
  objc_sync_enter(v2);
  session = v2->_session;
  if (!session)
  {
    uint64_t v4 = objc_opt_new();
    CGFloat v5 = v2->_session;
    v2->_session = (ARSession *)v4;

    [(ARSession *)v2->_session _addObserver:v2];
    session = v2->_session;
  }
  CGFloat v6 = session;
  objc_sync_exit(v2);

  return v6;
}

- (void)setSession:(ARSession *)session
{
  CGFloat v7 = session;
  CGFloat v5 = self;
  objc_sync_enter(v5);
  CGFloat v6 = v5->_session;
  if (v6 != v7)
  {
    [(ARSession *)v6 _removeObserver:v5];
    objc_storeStrong((id *)&v5->_session, session);
    [(ARSession *)v5->_session _addObserver:v5];
  }
  objc_sync_exit(v5);
}

- (NSArray)hitTest:(CGPoint)point types:(ARHitTestResultType)types
{
  double y = point.y;
  double x = point.x;
  CGFloat v8 = [(ARSession *)self->_session currentFrame];
  v9 = v8;
  if (v8)
  {
    p_viewportSize = &self->_viewportSize;
    double height = self->_viewportSize.height;
    double v19 = x / self->_viewportSize.width;
    float64x2_t v21 = 0u;
    float64x2_t v22 = 0u;
    float64x2_t v20 = 0u;
    int64_t interfaceOrientation = self->_interfaceOrientation;
    double v18 = y / height;
    objc_super v13 = [v8 camera];
    [v13 imageResolution];
    ARViewToCameraImageTransform(interfaceOrientation, 0, (uint64_t)&v20, p_viewportSize->width, p_viewportSize->height, v14, v15);

    __int16 v16 = objc_msgSend(v9, "hitTest:types:", types, vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, v18), v20, v19)));
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v16;
}

- (ARAnchor)anchorForNode:(SKNode *)node
{
  session = self->_session;
  CGFloat v5 = node;
  CGFloat v6 = [(ARSession *)session currentFrame];
  CGFloat v7 = [(ARSKView *)self _anchorForNode:v5 inFrame:v6];

  return (ARAnchor *)v7;
}

- (SKNode)nodeForAnchor:(ARAnchor *)anchor
{
  nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
  uint64_t v4 = [(ARAnchor *)anchor identifier];
  CGFloat v5 = [(NSMutableDictionary *)nodesByAnchorIdentifier objectForKeyedSubscript:v4];

  return (SKNode *)v5;
}

- (id)_anchorForNode:(id)a3 inFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = (void *)MEMORY[0x263EFFA08];
  v9 = [(NSMutableDictionary *)self->_nodesByAnchorIdentifier allValues];
  v10 = [v8 setWithArray:v9];

  id v11 = [v6 scene];
  id v12 = v6;
  objc_super v13 = v12;
  double v14 = 0;
  id v15 = v12;
  if (v12 && v11 != v12)
  {
    __int16 v16 = v12;
    while (([v10 containsObject:v16] & 1) == 0)
    {
      id v15 = [v16 parent];

      double v14 = 0;
      if (v15)
      {
        __int16 v16 = v15;
        if (v15 != v11) {
          continue;
        }
      }
      goto LABEL_12;
    }
    v17 = [(NSMutableDictionary *)self->_nodesByAnchorIdentifier allKeysForObject:v16];
    double v18 = [v17 firstObject];

    double v19 = [v7 anchors];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __35__ARSKView__anchorForNode_inFrame___block_invoke;
    v24[3] = &unk_264000BA8;
    id v20 = v18;
    id v25 = v20;
    uint64_t v21 = [v19 indexOfObjectPassingTest:v24];

    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v14 = 0;
    }
    else
    {
      float64x2_t v22 = [v7 anchors];
      double v14 = [v22 objectAtIndexedSubscript:v21];
    }
    id v15 = v16;
  }
LABEL_12:

  return v14;
}

uint64_t __35__ARSKView__anchorForNode_inFrame___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_updateAnchors:(id)a3 camera:(id)a4
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v70 = a4;
  id v60 = v6;
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
  CGFloat v8 = (void *)[(NSSet *)self->_lastFrameAnchors mutableCopy];
  [v8 minusSet:v7];
  v68 = (void *)[v7 mutableCopy];
  [v68 minusSet:self->_lastFrameAnchors];
  v59 = v7;
  objc_storeStrong((id *)&self->_lastFrameAnchors, v7);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v80 != v11) {
          objc_enumerationMutation(obj);
        }
        objc_super v13 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
        id v15 = [v13 identifier];
        __int16 v16 = [(NSMutableDictionary *)nodesByAnchorIdentifier objectForKeyedSubscript:v15];

        if (v16)
        {
          [v16 removeFromParent];
          v17 = self->_nodesByAnchorIdentifier;
          uint64_t v18 = [v13 identifier];
          [(NSMutableDictionary *)v17 removeObjectForKey:v18];

          double v19 = [(SKView *)self delegate];
          LOBYTE(v18) = objc_opt_respondsToSelector();

          if (v18)
          {
            id v20 = [(SKView *)self delegate];
            [v20 view:self didRemoveNode:v16 forAnchor:v13];
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
    }
    while (v10);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v62 = v68;
  uint64_t v21 = [v62 countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v76 != v23) {
          objc_enumerationMutation(v62);
        }
        id v25 = *(void **)(*((void *)&v75 + 1) + 8 * j);
        v26 = self->_nodesByAnchorIdentifier;
        v27 = [v25 identifier];
        v28 = [(NSMutableDictionary *)v26 objectForKeyedSubscript:v27];

        if (!v28)
        {
          v29 = [(SKView *)self delegate];
          char v30 = objc_opt_respondsToSelector();

          if (v30)
          {
            v31 = [(SKView *)self delegate];
            v28 = [v31 view:self nodeForAnchor:v25];

            if (!v28) {
              goto LABEL_24;
            }
          }
          else
          {
            v28 = [MEMORY[0x263F17BF8] node];
          }
          v32 = [(SKView *)self scene];
          [v32 addChild:v28];

          v33 = self->_nodesByAnchorIdentifier;
          v34 = [v25 identifier];
          [(NSMutableDictionary *)v33 setObject:v28 forKeyedSubscript:v34];
        }
        v35 = [(SKView *)self delegate];
        char v36 = objc_opt_respondsToSelector();

        if (v36)
        {
          v37 = [(SKView *)self delegate];
          [v37 view:self didAddNode:v28 forAnchor:v25];
        }
LABEL_24:
      }
      uint64_t v22 = [v62 countByEnumeratingWithState:&v75 objects:v84 count:16];
    }
    while (v22);
  }

  int64_t interfaceOrientation = self->_interfaceOrientation;
  [v70 projectionMatrix];
  double v67 = v40;
  double v69 = v39;
  double v65 = v42;
  double v66 = v41;
  uint64_t v43 = [v70 trackingState];
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v44 = 3;
  if (v43) {
    uint64_t v44 = interfaceOrientation;
  }
  uint64_t v64 = v44;
  long long v73 = 0uLL;
  long long v74 = 0uLL;
  id v61 = v60;
  uint64_t v45 = [v61 countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v72;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v72 != v47) {
          objc_enumerationMutation(v61);
        }
        v49 = *(void **)(*((void *)&v71 + 1) + 8 * k);
        v50 = self->_nodesByAnchorIdentifier;
        v51 = [v49 identifier];
        v52 = [(NSMutableDictionary *)v50 objectForKeyedSubscript:v51];

        if (v52)
        {
          v53 = [(SKView *)self delegate];
          char v54 = objc_opt_respondsToSelector();

          if (v54)
          {
            v55 = [(SKView *)self delegate];
            [v55 view:self willUpdateNode:v52 forAnchor:v49];
          }
          -[ARSKView _updateNode:forAnchor:projectionMatrix:camera:orientation:](self, "_updateNode:forAnchor:projectionMatrix:camera:orientation:", v52, v49, v70, v64, v69, v67, v66, v65);
          v56 = [(SKView *)self delegate];
          char v57 = objc_opt_respondsToSelector();

          if (v57)
          {
            v58 = [(SKView *)self delegate];
            [v58 view:self didUpdateNode:v52 forAnchor:v49];
          }
        }
      }
      uint64_t v46 = [v61 countByEnumeratingWithState:&v71 objects:v83 count:16];
    }
    while (v46);
  }
}

- (void)_updateNode:(float32x4_t)a3 forAnchor:(float32x4_t)a4 projectionMatrix:(float32x4_t)a5 camera:(uint64_t)a6 orientation:(void *)a7
{
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  [v16 imageResolution];
  double v18 = v17;
  double v20 = v19;
  [v16 transform];
  simd_float4x4 v52 = __invert_f4(v51);
  float32x4_t v38 = (float32x4_t)v52.columns[1];
  float32x4_t v39 = (float32x4_t)v52.columns[0];
  float32x4_t v36 = (float32x4_t)v52.columns[3];
  float32x4_t v37 = (float32x4_t)v52.columns[2];
  [v15 transform];
  uint64_t v21 = 0;
  v48[0] = v22;
  v48[1] = v23;
  v48[2] = v24;
  v48[3] = v25;
  memset(&v49, 0, sizeof(v49));
  float32x4_t v50 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v49.a + v21 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(v48[v21])), v38, *(float32x2_t *)&v48[v21], 1), v37, (float32x4_t)v48[v21], 2), v36, (float32x4_t)v48[v21], 3);
    ++v21;
  }
  while (v21 != 4);
  float v40 = v50.f32[2];
  float32x4_t v26 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v50.f32[0] + 1.0), a3, *(float32x2_t *)v50.f32, 1), a4, v50, 2), a5, v50, 3);
  float32x4_t v27 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v50.f32[0]), a3, *(float32x2_t *)v50.f32, 1), a4, v50, 2), a5, v50, 3);
  double v28 = (float)(vdivq_f32(v26, (float32x4_t)vdupq_laneq_s32((int32x4_t)v26, 3)).f32[0] - (float)(v27.f32[0] / v27.f32[3]));
  double v46 = (float)((float)(v27.f32[0] / v27.f32[3]) + 1.0) * 0.5;
  double v44 = (float)(1.0 - (float)(v27.f32[1] / v27.f32[3])) * 0.5;
  memset(&v49, 0, sizeof(v49));
  ARCameraImageToViewTransform(a10, 0, &v49, v18, v20, a1[84].f64[0], a1[84].f64[1]);
  float64x2_t v47 = vmulq_f64(vaddq_f64(*(float64x2_t *)&v49.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v49.c, v44), *(float64x2_t *)&v49.a, v46)), a1[84]);
  v29 = [(float64x2_t *)a1 scene];
  [(float64x2_t *)a1 convertPoint:v29 toScene:*(_OWORD *)&v47];
  double v31 = v30;
  double v33 = v32;

  [v14 setHidden:v40 > 0.0];
  objc_msgSend(v14, "setPosition:", v31, v33);
  [v14 setXScale:v28];
  [v14 setYScale:v28];
  [v14 setZPosition:v40];
  uint64_t v34 = ARCameraToDisplayRotation(a10);
  [v16 eulerAngles];
  [v14 setZRotation:(double)v34 * -3.14159265 / 180.0 - v35];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v14, "setHidden:", objc_msgSend(v15, "isTracked") ^ 1);
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__ARSKView_session_didUpdateFrame___block_invoke;
  v7[3] = &unk_264000BD0;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __35__ARSKView_session_didUpdateFrame___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) timestamp];
  v2 = [*(id *)(a1 + 32) captureDate];
  [v2 timeIntervalSinceNow];
  kdebug_trace();

  kdebug_trace();
  v3 = [*(id *)(a1 + 40) scene];
  objc_msgSend(v3, "_setBackgroundContentsWithBuffer:", objc_msgSend(*(id *)(a1 + 32), "capturedImage"));

  kdebug_trace();
  kdebug_trace();
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) anchors];
  id v6 = [*(id *)(a1 + 32) camera];
  [v4 _updateAnchors:v5 camera:v6];

  kdebug_trace();
  [*(id *)(a1 + 32) timestamp];

  return kdebug_trace();
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ARSKView_session_didFailWithError___block_invoke;
  block[3] = &unk_264000BF8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __37__ARSKView_session_didFailWithError___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v6 == v3)
  {
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 session:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 48)];
  }
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ARSKView_session_cameraDidChangeTrackingState___block_invoke;
  block[3] = &unk_264000BF8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__ARSKView_session_cameraDidChangeTrackingState___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v6 == v3)
  {
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 session:*(void *)(a1 + 40) cameraDidChangeTrackingState:*(void *)(a1 + 48)];
  }
}

- (void)sessionWasInterrupted:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__ARSKView_sessionWasInterrupted___block_invoke;
  v6[3] = &unk_264000BD0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __34__ARSKView_sessionWasInterrupted___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v6 == v3)
  {
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 sessionWasInterrupted:*(void *)(a1 + 40)];
  }
}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__ARSKView_sessionInterruptionEnded___block_invoke;
  v6[3] = &unk_264000BD0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __37__ARSKView_sessionInterruptionEnded___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v6 == v3)
  {
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 sessionInterruptionEnded:*(void *)(a1 + 40)];
  }
}

- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ARSKView_sessionShouldAttemptRelocalization_completion___block_invoke;
  block[3] = &unk_264000C20;
  id v11 = v6;
  id v12 = v7;
  block[4] = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__ARSKView_sessionShouldAttemptRelocalization_completion___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v7 == v3)
  {
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) delegate];
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, [v7 sessionShouldAttemptRelocalization:*(void *)(a1 + 40)]);
  }
}

- (void)session:(id)a3 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v6 = a3;
  if (a4) {
    CFRetain(a4);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ARSKView_session_didOutputAudioSampleBuffer___block_invoke;
  block[3] = &unk_264000C48;
  block[4] = self;
  id v9 = v6;
  uint64_t v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __47__ARSKView_session_didOutputAudioSampleBuffer___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = [v3 delegate];
  if (v2 == (void *)v4)
  {
  }
  else
  {
    char v5 = (void *)v4;
    id v6 = [*(id *)(a1 + 32) delegate];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      goto LABEL_6;
    }
    v2 = [*(id *)(a1 + 32) delegate];
    [v2 session:*(void *)(a1 + 40) didOutputAudioSampleBuffer:*(void *)(a1 + 48)];
  }

LABEL_6:
  id v8 = *(const void **)(a1 + 48);
  if (v8)
  {
    CFRelease(v8);
  }
}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ARSKView_session_didChangeGeoTrackingStatus___block_invoke;
  block[3] = &unk_264000BF8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __47__ARSKView_session_didChangeGeoTrackingStatus___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v6 == v3)
  {
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 session:*(void *)(a1 + 40) didChangeGeoTrackingStatus:*(void *)(a1 + 48)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFrameAnchors, 0);
  objc_storeStrong((id *)&self->_nodesByAnchorIdentifier, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end