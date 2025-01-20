@interface PKSqueezePaletteView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)initWithBackgroundView:(void *)a3 radius:(double)a4 contentHeight:(double)a5 layoutFactory:(double)a6 azimuth:;
- (uint64_t)_canRedo;
- (uint64_t)_canSelectTool:(uint64_t)a3 atIndex:;
- (uint64_t)_canUndo;
- (uint64_t)_handleResizing;
- (uint64_t)_redoCount;
- (uint64_t)_undoCount;
- (uint64_t)_updateShadows;
- (uint64_t)setColorUserInterfaceStyle:(uint64_t)result;
- (uint64_t)updateUIStartAngle:(int)a3 endAngle:(double)a4 clockwise:(double)a5 animated:;
- (void)_didRedo;
- (void)_didSelectColor:(uint64_t)a3 isFromExtendedColorPicker:(uint64_t)a4 isContinuousColorSelection:;
- (void)_didSelectTool:(uint64_t)a3 atIndex:;
- (void)_didTapMoreOptionsButton:(uint64_t)a1;
- (void)_didTapMulticolorButton:(void *)a3 currentSelectedColor:;
- (void)_didTapRuler;
- (void)_didTapShapesButton:(uint64_t)a1;
- (void)_didTapSignatureButton:(uint64_t)a1;
- (void)_didTapStickersButton:(uint64_t)a1;
- (void)_didTapTextBoxButton:(uint64_t)a1;
- (void)_didUndo;
- (void)_updateBaseShapeLayerPathAnimated:(uint64_t)a1;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pencilInteractionDidTap:(uint64_t)a1;
- (void)setCurrentLayout:(uint64_t)a1;
- (void)setDelegate:(uint64_t)a1;
@end

@implementation PKSqueezePaletteView

- (id)initWithBackgroundView:(void *)a3 radius:(double)a4 contentHeight:(double)a5 layoutFactory:(double)a6 azimuth:
{
  v88[12] = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a3;
  if (a1)
  {
    v87.receiver = a1;
    v87.super_class = (Class)PKSqueezePaletteView;
    v14 = (id *)objc_msgSendSuper2(&v87, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    a1 = v14;
    if (v14)
    {
      id v83 = v13;
      objc_storeStrong(v14 + 67, a2);
      *((double *)a1 + 62) = a4;
      *((double *)a1 + 63) = a5;
      a1[64] = 0;
      a1[65] = 0;
      objc_storeStrong(a1 + 70, a3);
      id v15 = a1[71];
      a1[71] = 0;

      *((double *)a1 + 66) = a6;
      uint64_t v16 = [MEMORY[0x1E4F39C88] layer];
      id v17 = a1[52];
      a1[52] = (id)v16;

      [a1[52] setLineWidth:*((double *)a1 + 63)];
      id v84 = v12;
      uint64_t v18 = *MEMORY[0x1E4F3A458];
      [a1[52] setLineCap:*MEMORY[0x1E4F3A458]];
      [a1[52] setStrokeStart:0.0];
      [a1[52] setStrokeEnd:1.0];
      [a1[52] setFillColor:0];
      uint64_t v19 = [MEMORY[0x1E4F39C88] layer];
      id v20 = a1[53];
      a1[53] = (id)v19;

      [a1[53] setLineWidth:*((double *)a1 + 63)];
      [a1[53] setLineCap:v18];
      [a1[53] setStrokeStart:0.0];
      [a1[53] setStrokeEnd:1.0];
      [a1[53] setFillColor:0];
      v21 = [a1 layer];
      [v21 addSublayer:a1[52]];

      v22 = [a1 layer];
      [v22 addSublayer:a1[53]];

      [a1[67] setTranslatesAutoresizingMaskIntoConstraints:0];
      [a1 addSubview:a1[67]];
      v23 = objc_alloc_init(PKPalettePassthroughView);
      id v24 = a1[68];
      a1[68] = v23;

      [a1[68] setTranslatesAutoresizingMaskIntoConstraints:0];
      [a1[68] setAccessibilityIdentifier:@"MiniPalette-ToolPickerView"];
      [a1 addSubview:a1[68]];
      id v25 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      id v26 = a1[69];
      a1[69] = v25;

      [a1[69] setTranslatesAutoresizingMaskIntoConstraints:0];
      [a1[69] setAccessibilityIdentifier:@"MiniPalette-ContentView"];
      [a1 addSubview:a1[69]];
      id v27 = objc_alloc_init(MEMORY[0x1E4F39C88]);
      id v28 = a1[54];
      a1[54] = v27;

      [a1[54] setLineWidth:*((double *)a1 + 63)];
      [a1[54] setLineCap:v18];
      [a1[54] setStrokeStart:0.0];
      [a1[54] setStrokeEnd:1.0];
      [a1[54] setFillColor:0];
      id v29 = [MEMORY[0x1E4FB1618] blackColor];
      objc_msgSend(a1[54], "setStrokeColor:", objc_msgSend(v29, "CGColor"));

      id v30 = a1[54];
      v31 = [a1[67] layer];
      [v31 setMask:v30];

      id v32 = objc_alloc_init(MEMORY[0x1E4F39C88]);
      id v33 = a1[55];
      a1[55] = v32;

      [a1[55] setLineWidth:*((double *)a1 + 63)];
      [a1[55] setLineCap:v18];
      [a1[55] setStrokeStart:0.0];
      [a1[55] setStrokeEnd:1.0];
      [a1[55] setFillColor:0];
      id v34 = [MEMORY[0x1E4FB1618] blackColor];
      objc_msgSend(a1[55], "setStrokeColor:", objc_msgSend(v34, "CGColor"));

      id v35 = a1[55];
      v36 = [a1[69] layer];
      [v36 setMask:v35];

      id v37 = objc_alloc_init(MEMORY[0x1E4F39C88]);
      id v38 = a1[56];
      a1[56] = v37;

      [a1[56] setLineWidth:*(double *)&PKSqueezePaletteViewToolsContentClippingShapeMaskExtraLineWidth + *((double *)a1 + 63) + 16.0];
      [a1[56] setLineCap:v18];
      [a1[56] setStrokeStart:0.0];
      [a1[56] setStrokeEnd:1.0];
      [a1[56] setFillColor:0];
      id v39 = [MEMORY[0x1E4FB1618] blackColor];
      objc_msgSend(a1[56], "setStrokeColor:", objc_msgSend(v39, "CGColor"));

      id v40 = a1[56];
      v41 = [a1[68] layer];
      [v41 setMask:v40];

      v42 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __90__PKSqueezePaletteView_initWithBackgroundView_radius_contentHeight_layoutFactory_azimuth___block_invoke;
      v85[3] = &unk_1E64C8880;
      a1 = a1;
      v86 = a1;
      id v43 = (id)[a1 registerForTraitChanges:v42 withHandler:v85];

      v68 = (void *)MEMORY[0x1E4F28DC8];
      v82 = [a1[67] topAnchor];
      v81 = [a1 topAnchor];
      v80 = [v82 constraintEqualToAnchor:v81];
      v88[0] = v80;
      v79 = [a1[67] leadingAnchor];
      v78 = [a1 leadingAnchor];
      v77 = [v79 constraintEqualToAnchor:v78];
      v88[1] = v77;
      v76 = [a1[67] trailingAnchor];
      v75 = [a1 trailingAnchor];
      v74 = [v76 constraintEqualToAnchor:v75];
      v88[2] = v74;
      v73 = [a1[67] bottomAnchor];
      v72 = [a1 bottomAnchor];
      v71 = [v73 constraintEqualToAnchor:v72];
      v88[3] = v71;
      v70 = [a1[68] topAnchor];
      v69 = [a1 topAnchor];
      v67 = [v70 constraintEqualToAnchor:v69];
      v88[4] = v67;
      v66 = [a1[68] leadingAnchor];
      v65 = [a1 leadingAnchor];
      v64 = [v66 constraintEqualToAnchor:v65];
      v88[5] = v64;
      v63 = [a1[68] trailingAnchor];
      v62 = [a1 trailingAnchor];
      v61 = [v63 constraintEqualToAnchor:v62];
      v88[6] = v61;
      v60 = [a1[68] bottomAnchor];
      v59 = [a1 bottomAnchor];
      v58 = [v60 constraintEqualToAnchor:v59];
      v88[7] = v58;
      v57 = [a1[69] topAnchor];
      v56 = [a1 topAnchor];
      v55 = [v57 constraintEqualToAnchor:v56];
      v88[8] = v55;
      v54 = [a1[69] leadingAnchor];
      v44 = [a1 leadingAnchor];
      v45 = [v54 constraintEqualToAnchor:v44];
      v88[9] = v45;
      v46 = [a1[69] trailingAnchor];
      v47 = [a1 trailingAnchor];
      v48 = [v46 constraintEqualToAnchor:v47];
      v88[10] = v48;
      v49 = [a1[69] bottomAnchor];
      v50 = [a1 bottomAnchor];
      v51 = [v49 constraintEqualToAnchor:v50];
      v88[11] = v51;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:12];
      [v68 activateConstraints:v52];

      id v12 = v84;
      id v13 = v83;

      -[PKSqueezePaletteView _updateShadows]((uint64_t)a1);
      [a1 setAccessibilityIdentifier:@"Circular-MiniPalette"];
    }
  }

  return a1;
}

uint64_t __90__PKSqueezePaletteView_initWithBackgroundView_radius_contentHeight_layoutFactory_azimuth___block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "System trait color appearance did change", v4, 2u);
  }

  return -[PKSqueezePaletteView _updateShadows](*(void *)(a1 + 32));
}

- (uint64_t)_updateShadows
{
  if (result)
  {
    uint64_t v1 = result;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    PKSqueezePaletteViewConfigureShadow(*(void **)(v1 + 416), 1);
    PKSqueezePaletteViewConfigureShadow(*(void **)(v1 + 424), 0);
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(v1 + 480), *(double *)(v1 + 464), *(double *)(v1 + 472), *(double *)(v1 + 496), -3.14159265, 9.42477796);
    id v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 416), "setPath:", objc_msgSend(v2, "CGPath"));

    id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    objc_msgSend(*(id *)(v1 + 416), "setStrokeColor:", objc_msgSend(v3, "CGColor"));

    id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    objc_msgSend(*(id *)(v1 + 424), "setStrokeColor:", objc_msgSend(v4, "CGColor"));

    v5 = (void *)MEMORY[0x1E4F39CF8];
    return [v5 commit];
  }
  return result;
}

- (void)dealloc
{
  baseShapeLayerPathForHitTesting = self->_baseShapeLayerPathForHitTesting;
  if (baseShapeLayerPathForHitTesting)
  {
    CGPathRelease(baseShapeLayerPathForHitTesting);
    self->_baseShapeLayerPathForHitTesting = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKSqueezePaletteView;
  [(PKSqueezePaletteView *)&v4 dealloc];
}

- (uint64_t)setColorUserInterfaceStyle:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 584) != a2)
    {
      *(void *)(result + 584) = a2;
      result = objc_opt_respondsToSelector();
      if (result)
      {
        id v3 = *(void **)(v2 + 568);
        return [v3 colorUserInterfaceStyleDidChange];
      }
    }
  }
  return result;
}

- (void)setDelegate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id obj = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));

    id v3 = obj;
    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)(a1 + 488), obj);
      [*(id *)(a1 + 568) updateUI];
      id v3 = obj;
    }
  }
}

- (void)setCurrentLayout:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = v4;
  if (a1 && *(id *)(a1 + 568) != v4)
  {
    v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 568);
      int v9 = 138478083;
      v10 = v5;
      __int16 v11 = 2113;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Update layout to: %{private}@, from: %{private}@", (uint8_t *)&v9, 0x16u);
    }

    v8 = *(void **)(a1 + 568);
    if (v8) {
      [v8 willTransitionToLayout:v5];
    }
    objc_storeStrong((id *)(a1 + 568), a2);
    [*(id *)(a1 + 568) setPaletteView:a1];
    [*(id *)(a1 + 568) setupUI];
  }
}

- (uint64_t)updateUIStartAngle:(int)a3 endAngle:(double)a4 clockwise:(double)a5 animated:
{
  if (result)
  {
    uint64_t v5 = result;
    *(double *)(result + 512) = a4;
    *(double *)(result + 520) = a5;
    *(unsigned char *)(result + 480) = a2;
    -[PKSqueezePaletteView _updateBaseShapeLayerPathAnimated:](result, a3);
    v6 = *(void **)(v5 + 568);
    return [v6 updateUI];
  }
  return result;
}

- (void)_updateBaseShapeLayerPathAnimated:(uint64_t)a1
{
  if (a1)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(a1 + 480), *(double *)(a1 + 464), *(double *)(a1 + 472), *(double *)(a1 + 496), -3.14159265, 9.42477796);
    id v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 432), "setPath:", objc_msgSend(v3, "CGPath"));

    [MEMORY[0x1E4F39CF8] commit];
    id v4 = *(const CGPath **)(a1 + 456);
    if (v4)
    {
      CGPathRelease(v4);
      *(void *)(a1 + 456) = 0;
    }
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(a1 + 480), *(double *)(a1 + 464), *(double *)(a1 + 472), *(double *)(a1 + 496), *(double *)(a1 + 512), *(double *)(a1 + 520));
    id v5 = objc_claimAutoreleasedReturnValue();
    v6 = (const CGPath *)[v5 CGPath];
    [*(id *)(a1 + 432) lineWidth];
    CGFloat v8 = v7;
    [*(id *)(a1 + 432) miterLimit];
    *(void *)(a1 + 456) = CGPathCreateCopyByStrokingPath(v6, 0, v8, kCGLineCapRound, kCGLineJoinMiter, v9);
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(a1 + 480), *(double *)(a1 + 464), *(double *)(a1 + 472), *(double *)(a1 + 496), -3.14159265, 9.42477796);
    id v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 440), "setPath:", objc_msgSend(v10, "CGPath"));

    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(a1 + 480), *(double *)(a1 + 464), *(double *)(a1 + 472), *(double *)(a1 + 496) + (*(double *)&PKSqueezePaletteViewToolsContentClippingShapeMaskExtraLineWidth + 16.0) * 0.5, -3.14159265, 9.42477796);
    id v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 448), "setPath:", objc_msgSend(v11, "CGPath"));

    [MEMORY[0x1E4F39CF8] commit];
    -[PKSqueezePaletteView _updateShadows](a1);
    double v12 = (*(double *)(a1 + 512) + 3.14159265) / 12.5663706;
    double v13 = (*(double *)(a1 + 520) + 3.14159265) / 12.5663706;
    if (!*(void *)(a1 + 408))
    {
      v14 = -[PKSqueezePaletteViewResizeHandle initWithStrokeStartPresentationValue:strokeEndPresentationValue:]([PKSqueezePaletteViewResizeHandle alloc], v12, v13);
      id v15 = *(void **)(a1 + 408);
      *(void *)(a1 + 408) = v14;

      -[PKSqueezePaletteView _handleResizing](a1);
    }
    objc_initWeak(&location, (id)a1);
    uint64_t v16 = *(void **)(a1 + 408);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__PKSqueezePaletteView__updateBaseShapeLayerPathAnimated___block_invoke;
    v18[3] = &unk_1E64C5998;
    objc_copyWeak(&v19, &location);
    -[PKSqueezePaletteViewResizeHandle resizeToStrokeStart:strokeEnd:animated:resizeHandler:completion:](v16, a2, v18, 0, v12, v13);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)pencilInteractionDidTap:(uint64_t)a1
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        uint64_t v6 = *(void *)(a1 + 568);
        int v7 = 138477827;
        uint64_t v8 = v6;
        _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Forward Pencil tap interaction to layout: %{private}@", (uint8_t *)&v7, 0xCu);
      }

      [*(id *)(a1 + 568) handlePencilInteractionDidTap:a2];
    }
    else
    {
      if (v5)
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Ignore Pencil tap interaction.", (uint8_t *)&v7, 2u);
      }
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[PKSqueezePaletteView convertPoint:toView:](self, "convertPoint:toView:", self->_toolsContentView, x, y);
  -[UIView hitTest:withEvent:](self->_toolsContentView, "hitTest:withEvent:", v7);
  uint64_t v8 = (UIView *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (v14.receiver = self,
        v14.super_class = (Class)PKSqueezePaletteView,
        -[PKSqueezePaletteView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, y),
        (uint64_t v8 = (UIView *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (v8 == self->_toolsContentView || !-[UIView isDescendantOfView:](v8, "isDescendantOfView:"))
    {
      [(PKSqueezePaletteView *)self transform];
      v16.double x = x;
      v16.double y = y;
      if (CGPathContainsPoint(self->_baseShapeLayerPathForHitTesting, &v13, v16, 0)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = v9;

      uint64_t v8 = v10;
    }
  }
  id v11 = v8;

  return v11;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PKSqueezePaletteView;
  [(PKSqueezePaletteView *)&v8 layoutSubviews];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(PKSqueezePaletteView *)self bounds];
  -[CAShapeLayer setFrame:](self->_baseShapeLayer, "setFrame:");
  [(PKSqueezePaletteView *)self bounds];
  -[CAShapeLayer setFrame:](self->_contentClippingShapeMask, "setFrame:");
  [(PKSqueezePaletteView *)self bounds];
  -[CAShapeLayer setFrame:](self->_toolsContentClippingShapeMask, "setFrame:");
  [(PKSqueezePaletteView *)self bounds];
  -[CAShapeLayer setFrame:](self->_largeShadow, "setFrame:");
  [(PKSqueezePaletteView *)self bounds];
  -[CAShapeLayer setFrame:](self->_smallShadow, "setFrame:");
  [MEMORY[0x1E4F39CF8] commit];
  [(PKSqueezePaletteView *)self bounds];
  double v5 = v4 * 0.5;
  if (self->_viewCenter.x != v3 * 0.5 || self->_viewCenter.y != v5)
  {
    self->_viewCenter.double x = v3 * 0.5;
    self->_viewCenter.double y = v5;
    -[PKSqueezePaletteView _updateBaseShapeLayerPathAnimated:]((uint64_t)self, 0);
  }
  layoutSubviewsHandler = (void (**)(void))self->_layoutSubviewsHandler;
  if (layoutSubviewsHandler) {
    layoutSubviewsHandler[2]();
  }
}

- (uint64_t)_handleResizing
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 408);
    double v3 = 0.0;
    if (v2)
    {
      [*(id *)(v2 + 8) presentationValue];
      double v5 = v4;
      uint64_t v6 = *(void *)(v1 + 408);
      if (v6)
      {
        [*(id *)(v6 + 16) presentationValue];
        double v3 = v7;
      }
    }
    else
    {
      double v5 = 0.0;
    }
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [*(id *)(v1 + 432) setStrokeStart:v5];
    [*(id *)(v1 + 432) setStrokeEnd:v3];
    [*(id *)(v1 + 440) setStrokeStart:v5];
    [*(id *)(v1 + 440) setStrokeEnd:v3];
    [*(id *)(v1 + 448) setStrokeStart:v5];
    [*(id *)(v1 + 448) setStrokeEnd:v3];
    [*(id *)(v1 + 416) setStrokeStart:v5];
    [*(id *)(v1 + 416) setStrokeEnd:v3];
    [*(id *)(v1 + 424) setStrokeStart:v5];
    [*(id *)(v1 + 424) setStrokeEnd:v3];
    objc_super v8 = (void *)MEMORY[0x1E4F39CF8];
    return [v8 commit];
  }
  return result;
}

void __58__PKSqueezePaletteView__updateBaseShapeLayerPathAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteView _handleResizing]((uint64_t)WeakRetained);
}

- (uint64_t)_redoCount
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 0;
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 488));
  uint64_t v5 = [v4 paletteViewRedoCount:a1];

  return v5;
}

- (uint64_t)_undoCount
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 0;
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 488));
  uint64_t v5 = [v4 paletteViewUndoCount:a1];

  return v5;
}

- (uint64_t)_canUndo
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 0;
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 488));
  uint64_t v5 = [v4 paletteViewCanUndo:a1];

  return v5;
}

- (uint64_t)_canRedo
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 0;
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 488));
  uint64_t v5 = [v4 paletteViewCanRedo:a1];

  return v5;
}

- (void)_didUndo
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = objc_loadWeakRetained((id *)(a1 + 488));
      [v4 paletteViewDidInvokeUndo:a1];
    }
  }
}

- (void)_didRedo
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = objc_loadWeakRetained((id *)(a1 + 488));
      [v4 paletteViewDidInvokeRedo:a1];
    }
  }
}

- (void)_didTapRuler
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = objc_loadWeakRetained((id *)(a1 + 488));
      [v4 paletteViewDidTapRuler:a1];
    }
  }
}

- (uint64_t)_canSelectTool:(uint64_t)a3 atIndex:
{
  id v5 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 488));
      uint64_t v9 = [v8 paletteView:a1 canSelectTool:v5 atIndex:a3];
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_didSelectTool:(uint64_t)a3 atIndex:
{
  id v9 = a2;
  if (a1)
  {
    -[PKMathResultAttribution setString:](*(void *)(a1 + 576), v9);
    id v5 = PKDisplayColorForTool(v9);
    -[PKSqueezePaletteViewContext setSelectedColor:](*(void *)(a1 + 576), v5);

    [*(id *)(a1 + 568) updateUI];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 488));
      [v8 paletteView:a1 didSelectTool:v9 atIndex:a3];
    }
  }
}

- (void)_didSelectColor:(uint64_t)a3 isFromExtendedColorPicker:(uint64_t)a4 isContinuousColorSelection:
{
  id v10 = a2;
  if (a1)
  {
    -[PKSqueezePaletteViewContext setSelectedColor:](*(void *)(a1 + 576), v10);
    [*(id *)(a1 + 568) updateUI];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 488));
      [v9 paletteView:a1 didSelectColor:v10 isFromExtendedColorPicker:a3 isContinuousColorSelection:a4];
    }
  }
}

- (void)_didTapMulticolorButton:(void *)a3 currentSelectedColor:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 488));
      [v8 paletteViewDidInvokeExtendedColorPicker:a1 currentSelectedColor:v5 sourceView:v9];
    }
  }
}

- (void)_didTapTextBoxButton:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 488));
      [v5 paletteViewDidInvokeAddTextBox:a1 sourceView:v6];
    }
  }
}

- (void)_didTapSignatureButton:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 488));
      [v5 paletteViewDidInvokeSignature:a1 sourceView:v6];
    }
  }
}

- (void)_didTapShapesButton:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 488));
      [v5 paletteViewDidInvokeAddShape:a1 sourceView:v6];
    }
  }
}

- (void)_didTapStickersButton:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 488));
      [v5 paletteViewDidInvokeAddSticker:a1 sourceView:v6];
    }
  }
}

- (void)_didTapMoreOptionsButton:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 488));
      [v5 paletteViewDidInvokeMoreOptions:a1 sourceView:v6];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__extendedColorPickerColorSelectionHandler, 0);
  objc_storeStrong(&self->_layoutSubviewsHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_layoutFactory, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_toolsContentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toolsContentClippingShapeMask, 0);
  objc_storeStrong((id *)&self->_contentClippingShapeMask, 0);
  objc_storeStrong((id *)&self->_baseShapeLayer, 0);
  objc_storeStrong((id *)&self->_smallShadow, 0);
  objc_storeStrong((id *)&self->_largeShadow, 0);

  objc_storeStrong((id *)&self->_resizeHandle, 0);
}

@end