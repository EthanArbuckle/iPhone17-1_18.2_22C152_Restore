@interface JFXOverlayEffectAnimationView
- (CALayer)additionalTransformLayer;
- (CALayer)cameraTransformLayer;
- (CALayer)trackingTransformLayer;
- (CALayer)transformLayer;
- (JFXEffectAnimationDelegate)animationDelegate;
- (JFXOverlayEffectAnimationView)initWithEffectFrame:(id)a3 toEffectFrame:(id)a4;
- (JFXOverlayEffectFrame)fromEffectFrame;
- (JFXOverlayEffectFrame)toEffectFrame;
- (JFXOverlayEffectTransforms)currentEffectTransforms;
- (double)fractionComplete;
- (void)animate:(id)a3 completion:(id)a4;
- (void)setAdditionalTransformLayer:(id)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setCameraTransformLayer:(id)a3;
- (void)setFromEffectFrame:(id)a3;
- (void)setToEffectFrame:(id)a3;
- (void)setTrackingTransformLayer:(id)a3;
- (void)setTransformLayer:(id)a3;
@end

@implementation JFXOverlayEffectAnimationView

- (JFXOverlayEffectAnimationView)initWithEffectFrame:(id)a3 toEffectFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 effectSize];
  double v9 = v8;
  [v6 effectSize];
  v117.receiver = self;
  v117.super_class = (Class)JFXOverlayEffectAnimationView;
  v11 = -[JFXOverlayEffectAnimationView initWithFrame:](&v117, sel_initWithFrame_, 0.0, 0.0, v9, v10);
  if (v11)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [(JFXOverlayEffectAnimationView *)v11 setFromEffectFrame:v6];
    [(JFXOverlayEffectAnimationView *)v11 setToEffectFrame:v7];
    v12 = [(JFXOverlayEffectAnimationView *)v11 fromEffectFrame];
    v13 = [v12 transforms];

    v14 = [(JFXOverlayEffectAnimationView *)v11 toEffectFrame];
    v15 = [v14 transforms];

    v16 = objc_opt_new();
    [(JFXOverlayEffectAnimationView *)v11 setAnimationDelegate:v16];

    v17 = [(JFXOverlayEffectAnimationView *)v11 layer];
    [v17 setOpacity:0.0];

    uint64_t v18 = [v13 transform];
    if (v18)
    {
      v19 = (void *)v18;
      v20 = [v15 transform];

      if (v20)
      {
        v21 = [(JFXOverlayEffectAnimationView *)v11 layer];
        v22 = [v13 transform];
        v23 = v22;
        if (v22)
        {
          [v22 SIMDDouble4x4];
          long long v83 = v109;
          long long v84 = v110;
          long long v86 = v111;
          long long v88 = v112;
          long long v90 = v113;
          long long v92 = v114;
          long long v96 = v116;
          long long vars0 = v115;
        }
        else
        {
          long long v92 = 0u;
          long long v96 = 0u;
          long long v88 = 0u;
          long long v90 = 0u;
          long long v84 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long vars0 = 0u;
        }
        v24 = (void *)MEMORY[0x263F157E8];
        id v25 = v21;
        v26 = [v24 layer];
        [v25 bounds];
        objc_msgSend(v26, "setFrame:");
        *(_OWORD *)v133 = v83;
        *(_OWORD *)&v133[16] = v84;
        *(_OWORD *)v134 = v86;
        *(_OWORD *)&v134[16] = v88;
        *(_OWORD *)&STACK[0x580] = v90;
        *(_OWORD *)&STACK[0x590] = v92;
        *(_OWORD *)&STACK[0x5A0] = vars0;
        *(_OWORD *)&STACK[0x5B0] = v96;
        [v26 setTransform:v133];
        [v25 addSublayer:v26];

        [(JFXOverlayEffectAnimationView *)v11 setTransformLayer:v26];
      }
    }
    uint64_t v27 = [v13 transformAnimation];
    if (v27)
    {
      v28 = (void *)v27;
      v29 = [v15 transformAnimation];

      if (v29)
      {
        v30 = [v13 transformAnimation];
        if (v6)
        {
          [v6 time];
        }
        else
        {
          long long v107 = 0uLL;
          uint64_t v108 = 0;
        }
        uint64_t v130 = 0;
        *(_OWORD *)v129 = 0u;
        *(_OWORD *)&v129[16] = 0u;
        long long v128 = 0u;
        if (v30)
        {
          *(_OWORD *)v133 = v107;
          *(void *)&v133[16] = v108;
          [v30 transformInfoAtTime:v133];
          unint64_t v31 = *(void *)&v129[24];
        }
        else
        {
          unint64_t v31 = 0;
        }
        *(void *)&long long v32 = 0;
        *((void *)&v32 + 1) = v31;
        long long v120 = v31;
        long long v121 = 0u;
        long long v122 = v32;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = xmmword_234D61140;
        long long v126 = 0u;
        long long v127 = xmmword_234D61130;
        __asm { FMOV            V1.2D, #1.0 }
        long long v118 = 0u;
        long long v119 = _Q1;
        pv_simd_matrix_rotate();
        long long v38 = *(_OWORD *)&STACK[0x590];
        long long v39 = *(_OWORD *)&STACK[0x5A0];
        long long v40 = *(_OWORD *)&STACK[0x5B0];
        long long v41 = *(_OWORD *)&v129[8];
        *(_OWORD *)&STACK[0x580] = *(_OWORD *)&STACK[0x580];
        *(_OWORD *)&STACK[0x590] = v38;
        *(_OWORD *)&STACK[0x5A0] = v39;
        *(_OWORD *)&STACK[0x5B0] = v40;
        long long v131 = v41;
        long long v132 = 0u;
        pv_simd_matrix_translate();
        long long v104 = v121;
        long long v91 = v120;
        long long vars0a = v123;
        long long v89 = v122;
        long long v97 = v125;
        long long v87 = v124;
        long long v93 = v127;
        long long v85 = v126;

        v42 = [(JFXOverlayEffectAnimationView *)v11 layer];
        v43 = [MEMORY[0x263F157E8] layer];
        [v42 bounds];
        objc_msgSend(v43, "setFrame:");
        *(_OWORD *)v133 = v91;
        *(_OWORD *)&v133[16] = v104;
        *(_OWORD *)v134 = v89;
        *(_OWORD *)&v134[16] = vars0a;
        *(_OWORD *)&STACK[0x580] = v87;
        *(_OWORD *)&STACK[0x590] = v97;
        *(_OWORD *)&STACK[0x5A0] = v85;
        *(_OWORD *)&STACK[0x5B0] = v93;
        [v43 setTransform:v133];
        [v42 addSublayer:v43];
        [(JFXOverlayEffectAnimationView *)v11 setAdditionalTransformLayer:v43];
      }
    }
    uint64_t v44 = [v13 faceTrackingTransform];
    if (v44)
    {
      v45 = (void *)v44;
      v46 = [v15 faceTrackingTransform];

      if (v46)
      {
        v47 = [(JFXOverlayEffectAnimationView *)v11 layer];
        v48 = [v13 faceTrackingTransform];
        v49 = [(JFXOverlayEffectAnimationView *)v11 fromEffectFrame];
        objc_msgSend(v48, "transformForTrackingType:", objc_msgSend(v49, "trackingType"));
        int8x16_t v94 = v50;
        int8x16_t v98 = v51;
        int8x16_t vars0b = v52;
        int8x16_t v105 = v53;
        double v54 = *(float *)v50.i32;
        double v55 = *(float *)&v50.i32[3];
        double v56 = *(float *)v51.i32;
        double v57 = *(float *)&v51.i32[3];
        *(double *)&unint64_t v58 = *(float *)v52.i32;
        *(double *)&unint64_t v59 = *(float *)&v52.i32[3];
        *(double *)&unint64_t v60 = *(float *)v53.i32;
        *(double *)&unint64_t v61 = *(float *)&v53.i32[3];
        v62 = (void *)MEMORY[0x263F157E8];
        id v63 = v47;
        v64 = [v62 layer];
        [v63 bounds];
        objc_msgSend(v64, "setFrame:");
        *(float64x2_t *)&v133[8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v94.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v94, v94, 8uLL), 4uLL));
        *(double *)v133 = v54;
        *(double *)&v133[24] = v55;
        *(float64x2_t *)&v134[8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v98.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v98, v98, 8uLL), 4uLL));
        *(double *)v134 = v56;
        *(double *)&v134[24] = v57;
        *(float64x2_t *)&STACK[0x588] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)vars0b.i8, (int8x8_t)*(_OWORD *)&vextq_s8(vars0b, vars0b, 8uLL), 4uLL));
        STACK[0x580] = v58;
        STACK[0x598] = v59;
        *(float64x2_t *)&STACK[0x5A8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v105.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v105, v105, 8uLL), 4uLL));
        STACK[0x5A0] = v60;
        STACK[0x5B8] = v61;
        [v64 setTransform:v133];
        [v63 addSublayer:v64];

        [(JFXOverlayEffectAnimationView *)v11 setTrackingTransformLayer:v64];
        v65 = [(JFXOverlayEffectAnimationView *)v11 layer];
        v66 = [v13 faceTrackingTransform];
        [v66 cameraTransform];
        int8x16_t v95 = v67;
        int8x16_t v99 = v68;
        int8x16_t vars0c = v69;
        int8x16_t v106 = v70;
        double v71 = *(float *)v67.i32;
        double v72 = *(float *)&v67.i32[3];
        double v73 = *(float *)v68.i32;
        double v74 = *(float *)&v68.i32[3];
        *(double *)&unint64_t v75 = *(float *)v69.i32;
        *(double *)&unint64_t v76 = *(float *)&v69.i32[3];
        *(double *)&unint64_t v77 = *(float *)v70.i32;
        *(double *)&unint64_t v78 = *(float *)&v70.i32[3];
        v79 = (void *)MEMORY[0x263F157E8];
        id v80 = v65;
        v81 = [v79 layer];
        [v80 bounds];
        objc_msgSend(v81, "setFrame:");
        *(float64x2_t *)&v133[8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v95.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v95, v95, 8uLL), 4uLL));
        *(double *)v133 = v71;
        *(double *)&v133[24] = v72;
        *(float64x2_t *)&v134[8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v99.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v99, v99, 8uLL), 4uLL));
        *(double *)v134 = v73;
        *(double *)&v134[24] = v74;
        *(float64x2_t *)&STACK[0x588] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)vars0c.i8, (int8x8_t)*(_OWORD *)&vextq_s8(vars0c, vars0c, 8uLL), 4uLL));
        STACK[0x580] = v75;
        STACK[0x598] = v76;
        *(float64x2_t *)&STACK[0x5A8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v106.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v106, v106, 8uLL), 4uLL));
        STACK[0x5A0] = v77;
        STACK[0x5B8] = v78;
        [v81 setTransform:v133];
        [v80 addSublayer:v81];

        [(JFXOverlayEffectAnimationView *)v11 setCameraTransformLayer:v81];
      }
    }
    [MEMORY[0x263F158F8] commit];
  }
  return v11;
}

- (void)animate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(JFXOverlayEffectAnimationView *)self fromEffectFrame];
  double v9 = [v8 transforms];

  double v10 = [(JFXOverlayEffectAnimationView *)self toEffectFrame];
  v11 = [v10 transforms];

  v12 = [(JFXOverlayEffectAnimationView *)self animationDelegate];
  [v12 animateWithCompletion:v7];

  v13 = [(JFXOverlayEffectAnimationView *)self layer];
  v14 = (void *)[v6 copy];
  v15 = [(JFXOverlayEffectAnimationView *)self animationDelegate];
  id v16 = v13;
  id v17 = v14;
  [v17 setKeyPath:@"opacity"];
  [v17 setDelegate:v15];
  uint64_t v262 = *MEMORY[0x263F15AA8];
  objc_msgSend(v17, "setFillMode:");
  [v17 setRemovedOnCompletion:0];
  [v17 setFromValue:&unk_26E801AB8];
  [v17 setToValue:&unk_26E801AD0];
  [v16 addAnimation:v17 forKey:@"opacityAnimation"];

  uint64_t v18 = [v9 transform];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [v11 transform];

    if (v20)
    {
      v21 = [(JFXOverlayEffectAnimationView *)self transformLayer];
      v22 = (void *)[v6 copy];
      v23 = [v9 transform];
      v24 = v23;
      if (v23)
      {
        [v23 SIMDDouble4x4];
        long long v233 = v275;
        long long v237 = v276;
        long long v241 = v277;
        long long v245 = v278;
        long long v249 = v279;
        long long v253 = v280;
        long long v257 = v282;
        long long v260 = v281;
      }
      else
      {
        long long v253 = 0u;
        long long v257 = 0u;
        long long v245 = 0u;
        long long v249 = 0u;
        long long v237 = 0u;
        long long v241 = 0u;
        long long v233 = 0u;
        long long v260 = 0u;
      }
      id v25 = [v11 transform];
      v26 = v25;
      if (v25)
      {
        [v25 SIMDDouble4x4];
        long long v200 = v267;
        long long v204 = v268;
        long long v208 = v269;
        long long vars0 = v270;
        long long v216 = v271;
        long long v220 = v272;
        long long v225 = v274;
        long long v229 = v273;
      }
      else
      {
        long long v220 = 0u;
        long long v225 = 0u;
        long long vars0 = 0u;
        long long v216 = 0u;
        long long v204 = 0u;
        long long v208 = 0u;
        long long v200 = 0u;
        long long v229 = 0u;
      }
      id v27 = v21;
      id v28 = v22;
      [v28 setKeyPath:@"transform"];
      [v28 setFillMode:v262];
      [v28 setRemovedOnCompletion:0];
      v29 = (void *)MEMORY[0x263F08D40];
      *(_OWORD *)&STACK[0x7C0] = v233;
      *(_OWORD *)&STACK[0x7D0] = v237;
      *(_OWORD *)&STACK[0x7E0] = v241;
      *(_OWORD *)&STACK[0x7F0] = v245;
      *(_OWORD *)&STACK[0x800] = v249;
      *(_OWORD *)&STACK[0x810] = v253;
      *(_OWORD *)&STACK[0x820] = v260;
      *(_OWORD *)&STACK[0x830] = v257;
      v30 = [v29 valueWithCATransform3D:&STACK[0x7C0]];
      [v28 setFromValue:v30];

      unint64_t v31 = (void *)MEMORY[0x263F08D40];
      *(_OWORD *)&STACK[0x7C0] = v200;
      *(_OWORD *)&STACK[0x7D0] = v204;
      *(_OWORD *)&STACK[0x7E0] = v208;
      *(_OWORD *)&STACK[0x7F0] = vars0;
      *(_OWORD *)&STACK[0x800] = v216;
      *(_OWORD *)&STACK[0x810] = v220;
      *(_OWORD *)&STACK[0x820] = v229;
      *(_OWORD *)&STACK[0x830] = v225;
      long long v32 = [v31 valueWithCATransform3D:&STACK[0x7C0]];
      [v28 setToValue:v32];

      [v27 addAnimation:v28 forKey:@"transformAnimation"];
    }
  }
  uint64_t v33 = [v9 transformAnimation];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [v11 transformAnimation];

    if (v35)
    {
      v36 = [v9 transformAnimation];
      v37 = [(JFXOverlayEffectAnimationView *)self fromEffectFrame];
      long long v38 = v37;
      if (v37)
      {
        [v37 time];
      }
      else
      {
        long long v265 = 0uLL;
        unint64_t v266 = 0;
      }
      STACK[0x790] = 0;
      *(_OWORD *)&STACK[0x770] = 0u;
      *(_OWORD *)&STACK[0x780] = 0u;
      *(_OWORD *)&STACK[0x760] = 0u;
      if (v36)
      {
        *(_OWORD *)&STACK[0x7C0] = v265;
        STACK[0x7D0] = v266;
        [v36 transformInfoAtTime:&STACK[0x7C0]];
        unint64_t v39 = STACK[0x788];
      }
      else
      {
        unint64_t v39 = 0;
      }
      *(void *)&long long v40 = 0;
      *((void *)&v40 + 1) = v39;
      *(_OWORD *)&STACK[0x6E0] = v39;
      *(_OWORD *)&STACK[0x6F0] = 0u;
      *(_OWORD *)&STACK[0x700] = v40;
      *(_OWORD *)&STACK[0x710] = 0u;
      *(_OWORD *)&STACK[0x720] = 0u;
      *(_OWORD *)&STACK[0x730] = xmmword_234D61140;
      *(_OWORD *)&STACK[0x740] = 0u;
      *(_OWORD *)&STACK[0x750] = xmmword_234D61130;
      __asm { FMOV            V1.2D, #1.0 }
      long long v221 = _Q1;
      *(_OWORD *)&STACK[0x6C0] = 0u;
      *(_OWORD *)&STACK[0x6D0] = _Q1;
      pv_simd_matrix_rotate();
      long long v46 = *(_OWORD *)&STACK[0x7D0];
      long long v47 = *(_OWORD *)&STACK[0x7E0];
      long long v48 = *(_OWORD *)&STACK[0x7F0];
      long long v49 = *(_OWORD *)&STACK[0x800];
      long long v50 = *(_OWORD *)&STACK[0x810];
      long long v51 = *(_OWORD *)&STACK[0x820];
      long long v52 = *(_OWORD *)&STACK[0x830];
      long long v53 = *(_OWORD *)&STACK[0x778];
      *(_OWORD *)&STACK[0x7C0] = *(_OWORD *)&STACK[0x7C0];
      *(_OWORD *)&STACK[0x7D0] = v46;
      *(_OWORD *)&STACK[0x7E0] = v47;
      *(_OWORD *)&STACK[0x7F0] = v48;
      *(_OWORD *)&STACK[0x800] = v49;
      *(_OWORD *)&STACK[0x810] = v50;
      *(_OWORD *)&STACK[0x830] = v52;
      *(_OWORD *)&STACK[0x820] = v51;
      *(_OWORD *)&STACK[0x7A0] = v53;
      *(_OWORD *)&STACK[0x7B0] = 0u;
      pv_simd_matrix_translate();
      long long v258 = *(_OWORD *)&STACK[0x710];
      long long v261 = *(_OWORD *)&STACK[0x6F0];
      long long v242 = *(_OWORD *)&STACK[0x700];
      long long v246 = *(_OWORD *)&STACK[0x6E0];
      long long v250 = *(_OWORD *)&STACK[0x750];
      long long v254 = *(_OWORD *)&STACK[0x730];
      long long v234 = *(_OWORD *)&STACK[0x740];
      long long v238 = *(_OWORD *)&STACK[0x720];

      double v54 = [v11 transformAnimation];
      double v55 = [(JFXOverlayEffectAnimationView *)self fromEffectFrame];
      double v56 = v55;
      if (v55)
      {
        [v55 time];
      }
      else
      {
        long long v263 = 0uLL;
        unint64_t v264 = 0;
      }
      STACK[0x790] = 0;
      *(_OWORD *)&STACK[0x770] = 0u;
      *(_OWORD *)&STACK[0x780] = 0u;
      *(_OWORD *)&STACK[0x760] = 0u;
      if (v54)
      {
        *(_OWORD *)&STACK[0x7C0] = v263;
        STACK[0x7D0] = v264;
        [v54 transformInfoAtTime:&STACK[0x7C0]];
        unint64_t v57 = STACK[0x788];
      }
      else
      {
        unint64_t v57 = 0;
      }
      *(void *)&long long v58 = 0;
      *((void *)&v58 + 1) = v57;
      *(_OWORD *)&STACK[0x6E0] = v57;
      *(_OWORD *)&STACK[0x6F0] = 0u;
      *(_OWORD *)&STACK[0x700] = v58;
      *(_OWORD *)&STACK[0x710] = 0u;
      *(_OWORD *)&STACK[0x720] = 0u;
      *(_OWORD *)&STACK[0x730] = xmmword_234D61140;
      *(_OWORD *)&STACK[0x740] = 0u;
      *(_OWORD *)&STACK[0x750] = xmmword_234D61130;
      *(_OWORD *)&STACK[0x6C0] = 0u;
      *(_OWORD *)&STACK[0x6D0] = v221;
      pv_simd_matrix_rotate();
      long long v59 = *(_OWORD *)&STACK[0x7D0];
      long long v60 = *(_OWORD *)&STACK[0x7E0];
      long long v61 = *(_OWORD *)&STACK[0x7F0];
      long long v62 = *(_OWORD *)&STACK[0x800];
      long long v63 = *(_OWORD *)&STACK[0x810];
      long long v64 = *(_OWORD *)&STACK[0x820];
      long long v65 = *(_OWORD *)&STACK[0x830];
      long long v66 = *(_OWORD *)&STACK[0x778];
      *(_OWORD *)&STACK[0x7C0] = *(_OWORD *)&STACK[0x7C0];
      *(_OWORD *)&STACK[0x7D0] = v59;
      *(_OWORD *)&STACK[0x7E0] = v60;
      *(_OWORD *)&STACK[0x7F0] = v61;
      *(_OWORD *)&STACK[0x800] = v62;
      *(_OWORD *)&STACK[0x810] = v63;
      *(_OWORD *)&STACK[0x830] = v65;
      *(_OWORD *)&STACK[0x820] = v64;
      *(_OWORD *)&STACK[0x7A0] = v66;
      *(_OWORD *)&STACK[0x7B0] = 0u;
      pv_simd_matrix_translate();
      long long v226 = *(_OWORD *)&STACK[0x710];
      long long v230 = *(_OWORD *)&STACK[0x6F0];
      long long v209 = *(_OWORD *)&STACK[0x700];
      long long vars0a = *(_OWORD *)&STACK[0x6E0];
      long long v217 = *(_OWORD *)&STACK[0x750];
      long long v222 = *(_OWORD *)&STACK[0x730];
      long long v201 = *(_OWORD *)&STACK[0x740];
      long long v205 = *(_OWORD *)&STACK[0x720];

      int8x16_t v67 = [(JFXOverlayEffectAnimationView *)self additionalTransformLayer];
      int8x16_t v68 = (void *)[v6 copy];
      id v69 = v67;
      id v70 = v68;
      [v70 setKeyPath:@"transform"];
      [v70 setFillMode:v262];
      [v70 setRemovedOnCompletion:0];
      double v71 = (void *)MEMORY[0x263F08D40];
      *(_OWORD *)&STACK[0x7C0] = v246;
      *(_OWORD *)&STACK[0x7D0] = v261;
      *(_OWORD *)&STACK[0x7E0] = v242;
      *(_OWORD *)&STACK[0x7F0] = v258;
      *(_OWORD *)&STACK[0x800] = v238;
      *(_OWORD *)&STACK[0x810] = v254;
      *(_OWORD *)&STACK[0x820] = v234;
      *(_OWORD *)&STACK[0x830] = v250;
      double v72 = [v71 valueWithCATransform3D:&STACK[0x7C0]];
      [v70 setFromValue:v72];

      double v73 = (void *)MEMORY[0x263F08D40];
      *(_OWORD *)&STACK[0x7C0] = vars0a;
      *(_OWORD *)&STACK[0x7D0] = v230;
      *(_OWORD *)&STACK[0x7E0] = v209;
      *(_OWORD *)&STACK[0x7F0] = v226;
      *(_OWORD *)&STACK[0x800] = v205;
      *(_OWORD *)&STACK[0x810] = v222;
      *(_OWORD *)&STACK[0x820] = v201;
      *(_OWORD *)&STACK[0x830] = v217;
      double v74 = [v73 valueWithCATransform3D:&STACK[0x7C0]];
      [v70 setToValue:v74];

      [v69 addAnimation:v70 forKey:@"transformAnimation"];
    }
  }
  uint64_t v75 = [v9 faceTrackingTransform];
  if (v75)
  {
    unint64_t v76 = (void *)v75;
    unint64_t v77 = [v11 faceTrackingTransform];

    if (v77)
    {
      unint64_t v78 = [(JFXOverlayEffectAnimationView *)self trackingTransformLayer];
      v79 = (void *)[v6 copy];
      v255 = [v9 faceTrackingTransform];
      id v80 = [(JFXOverlayEffectAnimationView *)self fromEffectFrame];
      objc_msgSend(v255, "transformForTrackingType:", objc_msgSend(v80, "trackingType"));
      *(double *)&unint64_t v251 = v81;
      *(double *)&unint64_t v247 = v82;
      *(double *)&unint64_t v243 = v83;
      *(double *)&unint64_t v239 = v84;
      *(double *)&unint64_t v235 = v85;
      *(double *)&unint64_t v231 = v86;
      *(double *)&unint64_t v227 = v87;
      *(double *)&unint64_t v223 = v88;
      *(double *)&unint64_t v218 = v89;
      *(double *)&unint64_t vars0b = v90;
      *(double *)&unint64_t v210 = v91;
      *(double *)&unint64_t v206 = v92;
      *(double *)&unint64_t v198 = v94;
      *(double *)&unint64_t v202 = v93;
      *(double *)&unint64_t v194 = v96;
      *(double *)&unint64_t v196 = v95;
      [v11 faceTrackingTransform];
      long long v97 = v259 = v6;
      int8x16_t v98 = [(JFXOverlayEffectAnimationView *)self toEffectFrame];
      objc_msgSend(v97, "transformForTrackingType:", objc_msgSend(v98, "trackingType"));
      *(double *)&unint64_t v190 = v100;
      *(double *)&unint64_t v192 = v99;
      *(double *)&unint64_t v186 = v102;
      *(double *)&unint64_t v188 = v101;
      *(double *)&unint64_t v182 = v104;
      *(double *)&unint64_t v184 = v103;
      *(double *)&unint64_t v179 = v106;
      *(double *)&unint64_t v180 = v105;
      *(double *)&unint64_t v108 = v107;
      *(double *)&unint64_t v110 = v109;
      *(double *)&unint64_t v112 = v111;
      *(double *)&unint64_t v114 = v113;
      *(double *)&unint64_t v116 = v115;
      *(double *)&unint64_t v118 = v117;
      *(double *)&unint64_t v120 = v119;
      *(double *)&unint64_t v122 = v121;
      id v123 = v78;
      id v124 = v79;
      [v124 setKeyPath:@"transform"];
      [v124 setFillMode:v262];
      [v124 setRemovedOnCompletion:0];
      long long v125 = (void *)MEMORY[0x263F08D40];
      STACK[0x7C0] = v251;
      STACK[0x7C8] = v247;
      STACK[0x7D0] = v243;
      STACK[0x7D8] = v239;
      STACK[0x7E0] = v235;
      STACK[0x7E8] = v231;
      STACK[0x7F0] = v227;
      STACK[0x7F8] = v223;
      STACK[0x800] = v218;
      STACK[0x808] = vars0b;
      STACK[0x810] = v210;
      STACK[0x818] = v206;
      STACK[0x820] = v202;
      STACK[0x828] = v198;
      STACK[0x830] = v196;
      STACK[0x838] = v194;
      long long v126 = [v125 valueWithCATransform3D:&STACK[0x7C0]];
      [v124 setFromValue:v126];

      long long v127 = (void *)MEMORY[0x263F08D40];
      STACK[0x7C0] = v192;
      STACK[0x7C8] = v190;
      STACK[0x7D0] = v188;
      STACK[0x7D8] = v186;
      STACK[0x7E0] = v184;
      STACK[0x7E8] = v182;
      STACK[0x7F0] = v180;
      STACK[0x7F8] = v179;
      STACK[0x800] = v108;
      STACK[0x808] = v110;
      STACK[0x810] = v112;
      STACK[0x818] = v114;
      STACK[0x820] = v116;
      STACK[0x828] = v118;
      STACK[0x830] = v120;
      STACK[0x838] = v122;
      long long v128 = [v127 valueWithCATransform3D:&STACK[0x7C0]];
      [v124 setToValue:v128];

      [v123 addAnimation:v124 forKey:@"transformAnimation"];
      id v6 = v259;

      v129 = [(JFXOverlayEffectAnimationView *)self cameraTransformLayer];
      uint64_t v130 = (void *)[v259 copy];
      long long v131 = [v9 faceTrackingTransform];
      [v131 cameraTransform];
      *(double *)&unint64_t v256 = v132;
      *(double *)&unint64_t v252 = v133;
      *(double *)&unint64_t v248 = v134;
      *(double *)&unint64_t v244 = v135;
      *(double *)&unint64_t v240 = v136;
      *(double *)&unint64_t v236 = v137;
      *(double *)&unint64_t v232 = v138;
      *(double *)&unint64_t v228 = v139;
      *(double *)&unint64_t v224 = v140;
      *(double *)&unint64_t v219 = v141;
      *(double *)&unint64_t vars0c = v142;
      *(double *)&unint64_t v211 = v143;
      *(double *)&unint64_t v207 = v144;
      *(double *)&unint64_t v199 = v145;
      *(double *)&unint64_t v195 = v146;
      *(double *)&unint64_t v191 = v147;
      v148 = [v11 faceTrackingTransform];
      [v148 cameraTransform];
      *(double *)&unint64_t v203 = v149;
      *(double *)&unint64_t v197 = v150;
      *(double *)&unint64_t v193 = v151;
      *(double *)&unint64_t v187 = v153;
      *(double *)&unint64_t v189 = v152;
      *(double *)&unint64_t v183 = v155;
      *(double *)&unint64_t v185 = v154;
      *(double *)&unint64_t v181 = v156;
      *(double *)&unint64_t v158 = v157;
      *(double *)&unint64_t v160 = v159;
      *(double *)&unint64_t v162 = v161;
      *(double *)&unint64_t v164 = v163;
      *(double *)&unint64_t v166 = v165;
      *(double *)&unint64_t v168 = v167;
      *(double *)&unint64_t v170 = v169;
      *(double *)&unint64_t v172 = v171;
      id v173 = v129;
      id v174 = v130;
      [v174 setKeyPath:@"transform"];
      [v174 setFillMode:v262];
      [v174 setRemovedOnCompletion:0];
      v175 = (void *)MEMORY[0x263F08D40];
      STACK[0x7C0] = v256;
      STACK[0x7C8] = v252;
      STACK[0x7D0] = v248;
      STACK[0x7D8] = v244;
      STACK[0x7E0] = v240;
      STACK[0x7E8] = v236;
      STACK[0x7F0] = v232;
      STACK[0x7F8] = v228;
      STACK[0x800] = v224;
      STACK[0x808] = v219;
      STACK[0x810] = vars0c;
      STACK[0x818] = v211;
      STACK[0x820] = v207;
      STACK[0x828] = v199;
      STACK[0x830] = v195;
      STACK[0x838] = v191;
      v176 = [v175 valueWithCATransform3D:&STACK[0x7C0]];
      [v174 setFromValue:v176];

      v177 = (void *)MEMORY[0x263F08D40];
      STACK[0x7C0] = v203;
      STACK[0x7C8] = v197;
      STACK[0x7D0] = v193;
      STACK[0x7D8] = v189;
      STACK[0x7E0] = v187;
      STACK[0x7E8] = v185;
      STACK[0x7F0] = v183;
      STACK[0x7F8] = v181;
      STACK[0x800] = v158;
      STACK[0x808] = v160;
      STACK[0x810] = v162;
      STACK[0x818] = v164;
      STACK[0x820] = v166;
      STACK[0x828] = v168;
      STACK[0x830] = v170;
      STACK[0x838] = v172;
      v178 = [v177 valueWithCATransform3D:&STACK[0x7C0]];
      [v174 setToValue:v178];

      [v173 addAnimation:v174 forKey:@"transformAnimation"];
    }
  }
}

- (JFXOverlayEffectTransforms)currentEffectTransforms
{
  v3 = [(JFXOverlayEffectAnimationView *)self fromEffectFrame];
  v4 = [v3 transforms];

  v5 = [(JFXOverlayEffectAnimationView *)self toEffectFrame];
  id v6 = [v5 transforms];

  id v7 = [(JFXOverlayEffectAnimationView *)self animationDelegate];
  char v8 = [v7 animationDidBegin];

  if ((v8 & 1) == 0) {
    goto LABEL_9;
  }
  double v9 = [(JFXOverlayEffectAnimationView *)self animationDelegate];
  int v10 = [v9 animationDidEnd];

  if (v10)
  {
    id v11 = v6;
LABEL_10:
    id v28 = v11;
    goto LABEL_11;
  }
  v12 = [(JFXOverlayEffectAnimationView *)self layer];
  v13 = [v12 presentationLayer];

  if (!v13)
  {
LABEL_9:
    id v11 = v4;
    goto LABEL_10;
  }
  v14 = [v4 transform];
  if (v14)
  {
    v15 = [v6 transform];

    if (v15)
    {
      id v16 = (void *)MEMORY[0x263F612E0];
      id v17 = [(JFXOverlayEffectAnimationView *)self transformLayer];
      uint64_t v18 = [v17 presentationLayer];
      v19 = v18;
      if (v18)
      {
        [v18 transform];
        long long v21 = v132;
        long long v20 = v133;
        long long v23 = v130;
        long long v22 = v131;
        long long v25 = v128;
        long long v24 = v129;
        long long v26 = v126;
        long long v27 = v127;
      }
      else
      {
        long long v26 = 0uLL;
        long long v27 = 0uLL;
        long long v25 = 0uLL;
        long long v24 = 0uLL;
        long long v23 = 0uLL;
        long long v22 = 0uLL;
        long long v21 = 0uLL;
        long long v20 = 0uLL;
      }
      v134[0] = v26;
      v134[1] = v27;
      v134[2] = v25;
      v134[3] = v24;
      v134[4] = v23;
      v134[5] = v22;
      v134[6] = v21;
      v134[7] = v20;
      v14 = [v16 matrixWithSIMDDouble4x4:v134];
    }
    else
    {
      v14 = 0;
    }
  }
  v30 = [v4 transformAnimation];
  if (v30)
  {
    unint64_t v31 = [v6 transformAnimation];

    if (v31)
    {
      long long v32 = [(JFXOverlayEffectAnimationView *)self additionalTransformLayer];
      uint64_t v33 = [v32 presentationLayer];
      v34 = v33;
      if (v33)
      {
        [v33 transform];
        uint64_t v36 = v115;
        *(void *)&long long v35 = v114;
        long long v37 = v116;
        uint64_t v39 = v118;
        *(void *)&long long v38 = v117;
        long long v40 = v119;
        uint64_t v42 = v121;
        *(void *)&long long v41 = v120;
        long long v43 = v122;
        uint64_t v45 = v124;
        *(void *)&long long v44 = v123;
        long long v46 = v125;
      }
      else
      {
        long long v46 = 0uLL;
        *(void *)&long long v44 = 0;
        uint64_t v45 = 0;
        uint64_t v42 = 0;
        *(void *)&long long v41 = 0;
        uint64_t v39 = 0;
        *(void *)&long long v38 = 0;
        uint64_t v36 = 0;
        *(void *)&long long v35 = 0;
        long long v43 = 0uLL;
        long long v40 = 0uLL;
        long long v37 = 0uLL;
      }
      *((void *)&v35 + 1) = v36;
      *((void *)&v38 + 1) = v39;
      *((void *)&v41 + 1) = v42;
      *((void *)&v44 + 1) = v45;
      long long v47 = *(_OWORD *)(MEMORY[0x263F617E0] + 80);
      long long v148 = *(_OWORD *)(MEMORY[0x263F617E0] + 64);
      long long v149 = v47;
      long long v48 = *(_OWORD *)(MEMORY[0x263F617E0] + 112);
      long long v150 = *(_OWORD *)(MEMORY[0x263F617E0] + 96);
      long long v151 = v48;
      long long v49 = *(_OWORD *)(MEMORY[0x263F617E0] + 16);
      long long v144 = *MEMORY[0x263F617E0];
      long long v145 = v49;
      long long v50 = *(_OWORD *)(MEMORY[0x263F617E0] + 48);
      long long v146 = *(_OWORD *)(MEMORY[0x263F617E0] + 32);
      long long v147 = v50;
      *(_OWORD *)float v139 = v37;
      long long v138 = v35;
      *(_OWORD *)&v139[32] = v40;
      *(_OWORD *)&v139[16] = v38;
      long long v141 = v43;
      long long v140 = v41;
      long long v143 = v46;
      long long v142 = v44;
      pv_transform_info_make();
      uint64_t v137 = 0;
      uint64_t v136 = 0;
      uint64_t v135 = 0;
      long long v138 = v146;
      *(_OWORD *)float v139 = v147;
      pv_simd_quaternion_get_euler_angles();
      long long v138 = 0u;
      memset(v139, 0, 40);
      PVTransformAnimationInfoIdentity();
      long long v138 = *MEMORY[0x263F010E0];
      *(void *)float v139 = *(void *)(MEMORY[0x263F010E0] + 16);
      *(void *)&long long v51 = v148;
      *(_OWORD *)&v139[8] = v144;
      *((void *)&v51 + 1) = v137;
      *(_OWORD *)&v139[24] = v51;

      id v52 = objc_alloc(MEMORY[0x263F61300]);
      long long v144 = v138;
      long long v145 = *(_OWORD *)v139;
      long long v146 = *(_OWORD *)&v139[16];
      *(void *)&long long v147 = *(void *)&v139[32];
      v30 = (void *)[v52 initWithAnimationInfo:&v144];
      long long v53 = [v6 transformAnimation];
      [v53 aspectRatio];
      objc_msgSend(v30, "setAspectRatio:");
    }
    else
    {
      v30 = 0;
    }
  }
  double v54 = [v4 faceTrackingTransform];
  if (v54)
  {
    double v55 = [v6 faceTrackingTransform];

    if (v55)
    {
      double v56 = [v4 faceTrackingTransform];
      [v56 cameraProjection];
      double v88 = v58;
      double v89 = v57;
      double v86 = v60;
      double v87 = v59;

      long long v61 = [(JFXOverlayEffectAnimationView *)self cameraTransformLayer];
      long long v62 = [v61 presentationLayer];
      long long v63 = v62;
      if (v62)
      {
        [v62 transform];
        *(void *)&double v90 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v108), v109).u64[0];
        *(void *)&double v91 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v110), v111).u64[0];
        *(void *)&double v92 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v106), v107).u64[0];
        *(void *)&double v93 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v112), v113).u64[0];
      }
      else
      {
        double v90 = 0.0;
        double v91 = 0.0;
        double v92 = 0.0;
        double v93 = 0.0;
      }

      long long v64 = [(JFXOverlayEffectAnimationView *)self trackingTransformLayer];
      long long v65 = [v64 presentationLayer];
      long long v66 = v65;
      if (v65)
      {
        [v65 transform];
        int8x16_t v95 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v102), v103);
        int8x16_t v96 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v104), v105);
        int8x16_t v94 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v100), v101);
        int8x16_t v97 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v98), v99);
      }
      else
      {
        int8x16_t v94 = 0u;
        int8x16_t v95 = 0u;
        int8x16_t v96 = 0u;
        int8x16_t v97 = 0u;
      }

      int8x16_t v67 = [(JFXOverlayEffectAnimationView *)self toEffectFrame];
      uint64_t v68 = [v67 trackingType];

      if (v68 == 1) {
        uint64_t v71 = 2;
      }
      else {
        uint64_t v71 = 1;
      }
      v69.i64[0] = 1;
      v70.i64[0] = v68;
      int8x16_t v81 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v70, v69).i64[0], 0);
      double v72 = [v6 faceTrackingTransform];
      [v72 transformForTrackingType:v71];
      int8x16_t v77 = v74;
      int8x16_t v78 = v73;
      int8x16_t v85 = vbslq_s8(v81, v96, v74);
      int8x16_t v84 = vbslq_s8(v81, v95, v73);
      int8x16_t v79 = v76;
      int8x16_t v80 = v75;
      int8x16_t v83 = vbslq_s8(v81, v94, v76);
      int8x16_t v82 = vbslq_s8(v81, v97, v75);

      if (v68 != 2)
      {
        int8x16_t v95 = v78;
        int8x16_t v96 = v77;
        int8x16_t v94 = v79;
        int8x16_t v97 = v80;
      }
      double v54 = -[JFXFaceTrackedEffectTransform initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:]([JFXFaceTrackedEffectTransform alloc], "initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:", v89, v88, v87, v86, v92, v90, v91, v93, *(_OWORD *)&v82, *(_OWORD *)&v83, *(_OWORD *)&v84, *(_OWORD *)&v85, *(_OWORD *)&v97, *(_OWORD *)&v94, *(_OWORD *)&v95, *(_OWORD *)&v96);
    }
    else
    {
      double v54 = 0;
    }
  }
  id v28 = +[JFXOverlayEffectTransforms transformsWithTransform:v14 transformAnimation:v30 faceTrackingTransform:v54];

LABEL_11:
  return (JFXOverlayEffectTransforms *)v28;
}

- (double)fractionComplete
{
  v3 = [(JFXOverlayEffectAnimationView *)self animationDelegate];
  int v4 = [v3 animationDidBegin];

  double v5 = 0.0;
  if (v4)
  {
    id v6 = [(JFXOverlayEffectAnimationView *)self animationDelegate];
    char v7 = [v6 animationDidEnd];

    double v5 = 1.0;
    if ((v7 & 1) == 0)
    {
      char v8 = [(JFXOverlayEffectAnimationView *)self layer];
      double v9 = [v8 presentationLayer];

      double v5 = 0.0;
      if (v9)
      {
        int v10 = [(JFXOverlayEffectAnimationView *)self layer];
        id v11 = [v10 presentationLayer];
        [v11 opacity];
        double v5 = v12;
      }
    }
  }
  return v5;
}

- (JFXOverlayEffectFrame)fromEffectFrame
{
  return self->_fromEffectFrame;
}

- (void)setFromEffectFrame:(id)a3
{
}

- (JFXOverlayEffectFrame)toEffectFrame
{
  return self->_toEffectFrame;
}

- (void)setToEffectFrame:(id)a3
{
}

- (JFXEffectAnimationDelegate)animationDelegate
{
  return self->_animationDelegate;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (CALayer)transformLayer
{
  return self->_transformLayer;
}

- (void)setTransformLayer:(id)a3
{
}

- (CALayer)additionalTransformLayer
{
  return self->_additionalTransformLayer;
}

- (void)setAdditionalTransformLayer:(id)a3
{
}

- (CALayer)trackingTransformLayer
{
  return self->_trackingTransformLayer;
}

- (void)setTrackingTransformLayer:(id)a3
{
}

- (CALayer)cameraTransformLayer
{
  return self->_cameraTransformLayer;
}

- (void)setCameraTransformLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraTransformLayer, 0);
  objc_storeStrong((id *)&self->_trackingTransformLayer, 0);
  objc_storeStrong((id *)&self->_additionalTransformLayer, 0);
  objc_storeStrong((id *)&self->_transformLayer, 0);
  objc_storeStrong((id *)&self->_animationDelegate, 0);
  objc_storeStrong((id *)&self->_toEffectFrame, 0);
  objc_storeStrong((id *)&self->_fromEffectFrame, 0);
}

@end