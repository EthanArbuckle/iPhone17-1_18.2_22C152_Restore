@interface CAMLivePhotoBloomView
- (BOOL)isOff;
- (CALayer)_centerRing;
- (CALayer)_innerRing;
- (CALayer)_ringContainer;
- (CAMLivePhotoBloomView)initWithFrame:(CGRect)a3;
- (CAShapeLayer)_middleRing;
- (CAShapeLayer)_outerRing;
- (CGPath)_pathForDiameter:(double)a3 center:(CGPoint)a4;
- (CGPath)_pathForRing:(int64_t)a3 center:(CGPoint)a4;
- (CGSize)intrinsicContentSize;
- (NSDictionary)_layersByRing;
- (NSDictionary)_shapeLayersByRing;
- (UIImageView)_defaultImageView;
- (double)_diameterForRing:(int64_t)a3;
- (double)_strokeWidthForRing:(int64_t)a3;
- (void)_updateDefaultImage;
- (void)_updateRingColors;
- (void)animateBloom;
- (void)layoutSubviews;
- (void)setIsOff:(BOOL)a3;
- (void)stopAnimating;
- (void)tintColorDidChange;
@end

@implementation CAMLivePhotoBloomView

- (CAMLivePhotoBloomView)initWithFrame:(CGRect)a3
{
  v35[2] = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)CAMLivePhotoBloomView;
  v3 = -[CAMLivePhotoBloomView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    outerRing = v3->__outerRing;
    v3->__outerRing = v4;

    v6 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    middleRing = v3->__middleRing;
    v3->__middleRing = v6;

    v8 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    innerRing = v3->__innerRing;
    v3->__innerRing = v8;

    v10 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    centerRing = v3->__centerRing;
    v3->__centerRing = v10;

    uint64_t v12 = [MEMORY[0x263F157E8] layer];
    ringContainer = v3->__ringContainer;
    v3->__ringContainer = (CALayer *)v12;

    v14 = [(CAMLivePhotoBloomView *)v3 layer];
    [v14 addSublayer:v3->__ringContainer];

    v34[0] = &unk_26BDDE340;
    v35[0] = v3->__innerRing;
    v34[1] = &unk_26BDDE358;
    v35[1] = v3->__centerRing;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    layersByRing = v3->__layersByRing;
    v3->__layersByRing = (NSDictionary *)v15;

    v32[0] = &unk_26BDDE370;
    v17 = v3->__outerRing;
    v32[1] = &unk_26BDDE388;
    v33[0] = v17;
    v33[1] = v3->__middleRing;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    shapeLayersByRing = v3->__shapeLayersByRing;
    v3->__shapeLayersByRing = (NSDictionary *)v18;

    v20 = v3->__layersByRing;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __39__CAMLivePhotoBloomView_initWithFrame___block_invoke;
    v29[3] = &unk_263FA3660;
    v21 = v3;
    v30 = v21;
    [(NSDictionary *)v20 enumerateKeysAndObjectsUsingBlock:v29];
    v22 = v3->__shapeLayersByRing;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __39__CAMLivePhotoBloomView_initWithFrame___block_invoke_2;
    v27[3] = &unk_263FA3688;
    v23 = v21;
    v28 = v23;
    [(NSDictionary *)v22 enumerateKeysAndObjectsUsingBlock:v27];
    [(CAMLivePhotoBloomView *)v23 _updateRingColors];
    [(CAShapeLayer *)v3->__outerRing setLineDashPattern:&unk_26BDDFEC0];
    [(CALayer *)v3->__centerRing setOpacity:0.0];
    [(CALayer *)v3->__ringContainer setOpacity:0.0];
    v24 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    defaultImageView = v23->__defaultImageView;
    v23->__defaultImageView = v24;

    [(CAMLivePhotoBloomView *)v23 addSubview:v23->__defaultImageView];
    [(CAMLivePhotoBloomView *)v23 _updateDefaultImage];
    [(CAMLivePhotoBloomView *)v23 setUserInteractionEnabled:0];
    [MEMORY[0x263F158F8] commit];
  }
  return v3;
}

void __39__CAMLivePhotoBloomView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [a2 integerValue];
  [*(id *)(a1 + 32) _diameterForRing:v5];
  double v7 = v6;
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v7, v7);
  [v8 setCornerRadius:v7 * 0.5];
  [v8 setBackgroundColor:0];
  [*(id *)(a1 + 32) _strokeWidthForRing:v5];
  objc_msgSend(v8, "setBorderWidth:");
  [*(id *)(*(void *)(a1 + 32) + 424) addSublayer:v8];
}

void __39__CAMLivePhotoBloomView_initWithFrame___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_strokeWidthForRing:", objc_msgSend(a2, "integerValue"));
  objc_msgSend(v5, "setLineWidth:");
  [v5 setFillColor:0];
  [v5 setLineCap:*MEMORY[0x263F15E70]];
  [v5 setLineDashPhase:0.166666667];
  [*(id *)(*(void *)(a1 + 32) + 424) addSublayer:v5];
}

- (void)layoutSubviews
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(CAMLivePhotoBloomView *)self bounds];
  uint64_t v24 = v4;
  uint64_t v25 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  UIRectGetCenter();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  v13 = [(CAMLivePhotoBloomView *)self _defaultImageView];
  double v14 = *MEMORY[0x263F00148];
  double v15 = *(double *)(MEMORY[0x263F00148] + 8);
  [v13 intrinsicContentSize];
  objc_msgSend(v13, "frameForAlignmentRect:", v14, v15, v16, v17);
  objc_msgSend(v13, "setBounds:", v14, v15);
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  objc_msgSend(v13, "setCenter:");
  v22 = [(CAMLivePhotoBloomView *)self _shapeLayersByRing];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __39__CAMLivePhotoBloomView_layoutSubviews__block_invoke;
  v27[3] = &unk_263FA36B0;
  void v27[4] = self;
  v27[5] = v10;
  v27[6] = v12;
  v27[7] = v25;
  v27[8] = v24;
  v27[9] = v6;
  v27[10] = v8;
  v27[11] = v19;
  v27[12] = v21;
  [v22 enumerateKeysAndObjectsUsingBlock:v27];

  v23 = [(CAMLivePhotoBloomView *)self _layersByRing];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __39__CAMLivePhotoBloomView_layoutSubviews__block_invoke_2;
  v26[3] = &__block_descriptor_48_e34_v32__0__NSNumber_8__CALayer_16_B24l;
  v26[4] = v19;
  v26[5] = v21;
  [v23 enumerateKeysAndObjectsUsingBlock:v26];

  [MEMORY[0x263F158F8] commit];
}

void __39__CAMLivePhotoBloomView_layoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(v5, "setPath:", objc_msgSend(*(id *)(a1 + 32), "_pathForRing:center:", objc_msgSend(a2, "integerValue"), *(double *)(a1 + 40), *(double *)(a1 + 48)));
  objc_msgSend(v5, "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(v5, "setPosition:", *(double *)(a1 + 88), *(double *)(a1 + 96));
}

uint64_t __39__CAMLivePhotoBloomView_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setPosition:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)tintColorDidChange
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(CAMLivePhotoBloomView *)self _updateRingColors];
  uint64_t v3 = (void *)MEMORY[0x263F158F8];
  [v3 commit];
}

- (CGSize)intrinsicContentSize
{
  [(CAMLivePhotoBloomView *)self _diameterForRing:3];
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)animateBloom
{
  v142[3] = *MEMORY[0x263EF8340];
  [(CAMLivePhotoBloomView *)self layoutIfNeeded];
  v126 = [(CAMLivePhotoBloomView *)self _outerRing];
  v124 = [(CAMLivePhotoBloomView *)self _middleRing];
  v121 = [(CAMLivePhotoBloomView *)self _innerRing];
  double v3 = [(CAMLivePhotoBloomView *)self _centerRing];
  v120 = self;
  [(CAMLivePhotoBloomView *)self bounds];
  UIRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  LODWORD(v8) = 0.5;
  LODWORD(v9) = 1.0;
  v125 = [MEMORY[0x263F15808] functionWithControlPoints:0.0 :0.0 :v8 :v9];
  v123 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
  [v123 setValues:&unk_26BDDFED8];
  v142[0] = &unk_26BDDE3A0;
  uint64_t v10 = [NSNumber numberWithDouble:0.166666667];
  v142[1] = v10;
  v142[2] = &unk_26BDDE3B8;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v142 count:3];
  [v123 setKeyTimes:v11];

  uint64_t v117 = *MEMORY[0x263F15968];
  objc_msgSend(v123, "setCalculationMode:");
  uint64_t v12 = [MEMORY[0x263F157D8] animationWithKeyPath:@"bounds.size"];
  LODWORD(v13) = 1.0;
  LODWORD(v14) = 1058642330;
  v118 = [MEMORY[0x263F15808] functionWithControlPoints:0.0 :0.0 :v14 :v13];
  double v15 = CAMPixelWidthForView(self) + 9.0;
  [v12 setBeginTime:0.233333333];
  [v12 setDuration:1.26666667];
  v141[0] = &unk_26BDDE3A0;
  double v16 = [NSNumber numberWithDouble:0.342105263];
  v141[1] = v16;
  double v17 = [NSNumber numberWithDouble:0.666666667];
  v141[2] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:3];
  [v12 setKeyTimes:v18];

  uint64_t v19 = (void *)MEMORY[0x263F08D40];
  uint64_t v20 = v3;
  v122 = v3;
  [v3 bounds];
  v23 = objc_msgSend(v19, "valueWithCGSize:", v21, v22);
  v140[0] = v23;
  uint64_t v24 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v15, v15);
  v140[1] = v24;
  uint64_t v25 = (void *)MEMORY[0x263F08D40];
  [v121 bounds];
  v28 = objc_msgSend(v25, "valueWithCGSize:", v26, v27);
  v140[2] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v140 count:3];
  [v12 setValues:v29];

  v139[0] = v118;
  v139[1] = v125;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:2];
  [v12 setTimingFunctions:v30];

  v116 = v12;
  objc_super v31 = (void *)[v12 copy];
  [v31 setKeyPath:@"cornerRadius"];
  v32 = NSNumber;
  [v20 cornerRadius];
  v33 = objc_msgSend(v32, "numberWithDouble:");
  v138[0] = v33;
  v34 = [NSNumber numberWithDouble:v15 * 0.5];
  v138[1] = v34;
  v35 = NSNumber;
  [v121 bounds];
  v37 = [v35 numberWithDouble:v36 * 0.5];
  v138[2] = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:3];
  v115 = v31;
  [v31 setValues:v38];

  v114 = [MEMORY[0x263F15750] animation];
  [v114 setDuration:1.5];
  v137[0] = v12;
  v137[1] = v123;
  v137[2] = v31;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v137 count:3];
  [v114 setAnimations:v39];

  v40 = [MEMORY[0x263F157D8] animationWithKeyPath:@"bounds.size"];
  LODWORD(v41) = 0.5;
  LODWORD(v42) = 1.0;
  LODWORD(v43) = 1058642330;
  v113 = [MEMORY[0x263F15808] functionWithControlPoints:v41 :0.0 :v43 :v42];
  [(CAMLivePhotoBloomView *)v120 _diameterForRing:2];
  double v45 = v44;
  v136[0] = &unk_26BDDE3A0;
  v46 = [NSNumber numberWithDouble:0.611111111];
  v136[1] = v46;
  v47 = [NSNumber numberWithDouble:0.8];
  v136[2] = v47;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:3];
  [v40 setKeyTimes:v48];

  v49 = (void *)MEMORY[0x263F08D40];
  [v121 bounds];
  v52 = objc_msgSend(v49, "valueWithCGSize:", v50, v51);
  v135[0] = v52;
  v53 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 18.0, 18.0);
  v135[1] = v53;
  v54 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v45, v45);
  v135[2] = v54;
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:3];
  [v40 setValues:v55];

  v134[0] = v113;
  v134[1] = v125;
  v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v134 count:2];
  [v40 setTimingFunctions:v56];

  v57 = v40;
  v112 = v40;
  v58 = (void *)[v40 copy];
  [v58 setKeyPath:@"cornerRadius"];
  v59 = NSNumber;
  [v121 cornerRadius];
  v60 = objc_msgSend(v59, "numberWithDouble:");
  v133[0] = v60;
  v61 = [NSNumber numberWithDouble:9.0];
  v133[1] = v61;
  v62 = [NSNumber numberWithDouble:v45 * 0.5];
  v133[2] = v62;
  v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v133 count:3];
  [v58 setValues:v63];

  v64 = [MEMORY[0x263F15760] animationWithKeyPath:@"borderWidth"];
  v65 = NSNumber;
  [(CAMLivePhotoBloomView *)v120 _strokeWidthForRing:2];
  v66 = objc_msgSend(v65, "numberWithDouble:");
  [v64 setToValue:v66];

  [v64 setDuration:0.916666667];
  v111 = v64;
  [v64 setFillMode:*MEMORY[0x263F15AB0]];
  v110 = [MEMORY[0x263F15750] animation];
  [v110 setDuration:1.5];
  v132[0] = v64;
  v132[1] = v57;
  v132[2] = v58;
  v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:3];
  [v110 setAnimations:v67];

  LODWORD(v68) = 1059984507;
  LODWORD(v69) = 1.0;
  LODWORD(v70) = 1058642330;
  uint64_t v71 = [MEMORY[0x263F15808] functionWithControlPoints:v68 :0.0 :v70 :v69];
  v109 = [MEMORY[0x263F15750] animation];
  uint64_t v72 = [MEMORY[0x263F157D8] animationWithKeyPath:@"path"];
  uint64_t v73 = [MEMORY[0x263F15760] animationWithKeyPath:@"lineWidth"];
  v74 = [MEMORY[0x263F15760] animationWithKeyPath:@"lineDashPattern"];
  v119 = [MEMORY[0x263F15760] animationWithKeyPath:@"lineDashPattern"];
  v131[0] = v72;
  v131[1] = v73;
  v75 = (void *)v72;
  v76 = (void *)v73;
  v107 = (void *)v73;
  v131[2] = v74;
  v131[3] = v119;
  v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v131 count:4];
  [v109 setAnimations:v77];

  [v109 setDuration:1.5];
  v130[0] = &unk_26BDDE3A0;
  v78 = [NSNumber numberWithDouble:0.722222222];
  v130[1] = v78;
  v130[2] = &unk_26BDDE3B8;
  v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:v130 count:3];
  [v75 setKeyTimes:v79];

  v129[0] = [v124 path];
  v129[1] = -[CAMLivePhotoBloomView _pathForDiameter:center:](v120, "_pathForDiameter:center:", 25.6666667, v5, v7);
  v129[2] = [v126 path];
  v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:3];
  v108 = v75;
  [v75 setValues:v80];

  v106 = (void *)v71;
  v128[0] = v71;
  v128[1] = v125;
  v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:2];
  [v75 setTimingFunctions:v81];

  v82 = NSNumber;
  [(CAMLivePhotoBloomView *)v120 _strokeWidthForRing:3];
  v83 = objc_msgSend(v82, "numberWithDouble:");
  [v76 setToValue:v83];

  [v74 setDuration:1.08333333];
  [v74 setFromValue:&unk_26BDDFEF0];
  [v74 setToValue:&unk_26BDDFF08];
  v105 = v74;
  [v74 setTimingFunction:v71];
  [v119 setDuration:0.416666667];
  [v119 setBeginTime:1.08333333];
  v84 = [v74 toValue];
  [v119 setFromValue:v84];

  v85 = [v126 lineDashPattern];
  [v119 setToValue:v85];

  [v119 setTimingFunction:v125];
  v86 = [MEMORY[0x263F15750] animation];
  v87 = [MEMORY[0x263F15760] animationWithKeyPath:@"path"];
  v88 = [MEMORY[0x263F15760] animationWithKeyPath:@"lineDashPattern"];
  v89 = [MEMORY[0x263F15760] animationWithKeyPath:@"lineWidth"];
  v127[0] = v87;
  v127[1] = v88;
  v127[2] = v89;
  v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v127 count:3];
  [v86 setAnimations:v90];

  [v86 setDuration:1.32];
  [v126 convertTime:0 fromLayer:CACurrentMediaTime()];
  [v86 setBeginTime:v91 + 0.2];
  objc_msgSend(v87, "setToValue:", -[CAMLivePhotoBloomView _pathForRing:center:](v120, "_pathForRing:center:", 4, v5, v7));
  LODWORD(v92) = 1061997773;
  LODWORD(v93) = 1059145646;
  LODWORD(v94) = *(_DWORD *)"=\nW>";
  LODWORD(v95) = 1036831949;
  v96 = [MEMORY[0x263F15808] functionWithControlPoints:v92 :v93 :v94 :v95];
  [v87 setTimingFunction:v96];

  v104 = v88;
  [v88 setToValue:&unk_26BDDFF20];
  v97 = [v87 timingFunction];
  [v88 setTimingFunction:v97];

  [v89 setToValue:&unk_26BDDE3A0];
  [v89 setBeginTime:1.0];
  [v86 duration];
  [v89 setDuration:v98 + -1.0];
  v99 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
  [v99 setCalculationMode:v117];
  [v99 setKeyTimes:&unk_26BDDFF38];
  [v99 setValues:&unk_26BDDFF50];
  [v99 setDuration:1.5];
  v100 = (void *)[v99 copy];
  [v100 setValues:&unk_26BDDFF68];
  v101 = [(CAMLivePhotoBloomView *)v120 _defaultImageView];
  v102 = [v101 layer];
  [v102 addAnimation:v100 forKey:@"bloom"];

  v103 = [(CAMLivePhotoBloomView *)v120 _ringContainer];
  [v103 addAnimation:v99 forKey:@"bloom"];

  [v122 addAnimation:v114 forKey:@"bloom"];
  [v121 addAnimation:v110 forKey:@"bloom"];
  [v124 addAnimation:v109 forKey:@"bloom"];
  [v126 addAnimation:v86 forKey:@"bloom"];
}

- (void)stopAnimating
{
  double v3 = [(CAMLivePhotoBloomView *)self _defaultImageView];
  double v4 = [v3 layer];
  [v4 removeAllAnimations];

  double v5 = [(CAMLivePhotoBloomView *)self _ringContainer];
  [v5 removeAllAnimations];

  double v6 = [(CAMLivePhotoBloomView *)self _centerRing];
  [v6 removeAllAnimations];

  double v7 = [(CAMLivePhotoBloomView *)self _innerRing];
  [v7 removeAllAnimations];

  double v8 = [(CAMLivePhotoBloomView *)self _middleRing];
  [v8 removeAllAnimations];

  id v9 = [(CAMLivePhotoBloomView *)self _outerRing];
  [v9 removeAllAnimations];
}

- (void)setIsOff:(BOOL)a3
{
  if (self->_isOff != a3)
  {
    self->_isOff = a3;
    [(CAMLivePhotoBloomView *)self _updateDefaultImage];
  }
}

- (void)_updateRingColors
{
  double v3 = [(CAMLivePhotoBloomView *)self _shapeLayersByRing];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__CAMLivePhotoBloomView__updateRingColors__block_invoke;
  v6[3] = &unk_263FA3688;
  v6[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  double v4 = [(CAMLivePhotoBloomView *)self _layersByRing];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__CAMLivePhotoBloomView__updateRingColors__block_invoke_2;
  v5[3] = &unk_263FA3660;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __42__CAMLivePhotoBloomView__updateRingColors__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = [v3 tintColor];
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));
}

void __42__CAMLivePhotoBloomView__updateRingColors__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = [v3 tintColor];
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));
}

- (void)_updateDefaultImage
{
  BOOL v3 = [(CAMLivePhotoBloomView *)self isOff];
  id v4 = @"CAMIrisButton-0-PhotoIris";
  if (v3) {
    id v4 = @"CAMIrisButtonInactive";
  }
  id v5 = (void *)MEMORY[0x263F827E8];
  double v6 = v4;
  double v7 = CAMCameraUIFrameworkBundle();
  double v8 = [v5 imageNamed:v6 inBundle:v7];

  id v10 = [v8 imageWithRenderingMode:2];

  id v9 = [(CAMLivePhotoBloomView *)self _defaultImageView];
  [v9 setImage:v10];
}

- (double)_strokeWidthForRing:(int64_t)a3
{
  double result = 2.0;
  if ((unint64_t)(a3 - 2) <= 2) {
    return dbl_209C7AC48[a3 - 2];
  }
  return result;
}

- (double)_diameterForRing:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)a3 <= 4) {
    return dbl_209C7AC60[a3];
  }
  return result;
}

- (CGPath)_pathForRing:(int64_t)a3 center:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[CAMLivePhotoBloomView _diameterForRing:](self, "_diameterForRing:");
  double v9 = v8;
  [(CAMLivePhotoBloomView *)self _strokeWidthForRing:a3];
  double v11 = v9 - v10;
  return -[CAMLivePhotoBloomView _pathForDiameter:center:](self, "_pathForDiameter:center:", v11, x, y);
}

- (CGPath)_pathForDiameter:(double)a3 center:(CGPoint)a4
{
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a4.x, a4.y, a3 * 0.5, 0.0, 6.28318531);
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (CGPath *)[v4 CGPath];

  return v5;
}

- (BOOL)isOff
{
  return self->_isOff;
}

- (UIImageView)_defaultImageView
{
  return self->__defaultImageView;
}

- (CALayer)_ringContainer
{
  return self->__ringContainer;
}

- (CAShapeLayer)_outerRing
{
  return self->__outerRing;
}

- (CAShapeLayer)_middleRing
{
  return self->__middleRing;
}

- (CALayer)_innerRing
{
  return self->__innerRing;
}

- (CALayer)_centerRing
{
  return self->__centerRing;
}

- (NSDictionary)_layersByRing
{
  return self->__layersByRing;
}

- (NSDictionary)_shapeLayersByRing
{
  return self->__shapeLayersByRing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shapeLayersByRing, 0);
  objc_storeStrong((id *)&self->__layersByRing, 0);
  objc_storeStrong((id *)&self->__centerRing, 0);
  objc_storeStrong((id *)&self->__innerRing, 0);
  objc_storeStrong((id *)&self->__middleRing, 0);
  objc_storeStrong((id *)&self->__outerRing, 0);
  objc_storeStrong((id *)&self->__ringContainer, 0);
  objc_storeStrong((id *)&self->__defaultImageView, 0);
}

@end