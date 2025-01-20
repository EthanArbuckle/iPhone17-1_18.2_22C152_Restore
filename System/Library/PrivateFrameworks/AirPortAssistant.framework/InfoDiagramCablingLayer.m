@interface InfoDiagramCablingLayer
- (BOOL)isCompactWidth;
- (BOOL)swapCabling;
- (CAGradientLayer)internetGradientLayer;
- (CAShapeLayer)broadbandToWANInnerLineLayer;
- (CAShapeLayer)broadbandToWANOuterLineLayer;
- (CAShapeLayer)internetInnerLineLayer;
- (CAShapeLayer)internetOuterLineLayer;
- (CAShapeLayer)swapArcArrowLayer;
- (CAShapeLayer)swapArcLineLayer;
- (InfoDiagramCablingAnchorDelegate)diagramAnchorPointDelegate;
- (id)initNoWANLinkFirstFrame;
- (id)initNoWANLinkLastFrame;
- (void)commonInit;
- (void)createPathForSublayer:(id)a3;
- (void)dealloc;
- (void)layoutSublayers;
- (void)setBroadbandToWANInnerLineLayer:(id)a3;
- (void)setBroadbandToWANOuterLineLayer:(id)a3;
- (void)setDiagramAnchorPointDelegate:(id)a3;
- (void)setInternetGradientLayer:(id)a3;
- (void)setInternetInnerLineLayer:(id)a3;
- (void)setInternetOuterLineLayer:(id)a3;
- (void)setIsCompactWidth:(BOOL)a3;
- (void)setSwapArcArrowLayer:(id)a3;
- (void)setSwapArcLineLayer:(id)a3;
- (void)setSwapCabling:(BOOL)a3;
@end

@implementation InfoDiagramCablingLayer

- (void)commonInit
{
  v129[2] = *MEMORY[0x263EF8340];
  objc_msgSend_setFrame_(self, a2, v2, 0.0, 0.0, 10.0, 10.0);
  uint64_t v6 = objc_msgSend_layer(MEMORY[0x263F15880], v4, v5);
  objc_msgSend_setInternetOuterLineLayer_(self, v7, v6);
  objc_msgSend_frame(self, v8, v9);
  objc_msgSend_setFrame_(self->internetOuterLineLayer, v10, v11);
  CGColorRef v12 = sub_2268EF290(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->internetOuterLineLayer, v13, (uint64_t)v12);
  objc_msgSend_setName_(self->internetOuterLineLayer, v14, @"Internet");
  objc_msgSend_setDelegate_(self->internetOuterLineLayer, v15, (uint64_t)self);
  uint64_t v16 = *MEMORY[0x263F15E70];
  objc_msgSend_setLineCap_(self->internetOuterLineLayer, v17, *MEMORY[0x263F15E70]);
  objc_msgSend_setFillColor_(self->internetOuterLineLayer, v18, 0);
  objc_msgSend_addSublayer_(self, v19, (uint64_t)self->internetOuterLineLayer);
  uint64_t v22 = objc_msgSend_layer(MEMORY[0x263F15880], v20, v21);
  objc_msgSend_setInternetInnerLineLayer_(self, v23, v22);
  objc_msgSend_frame(self, v24, v25);
  objc_msgSend_setFrame_(self->internetInnerLineLayer, v26, v27);
  CGColorRef v28 = sub_2268EF290(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->internetInnerLineLayer, v29, (uint64_t)v28);
  objc_msgSend_setName_(self->internetInnerLineLayer, v30, @"Internet");
  objc_msgSend_setDelegate_(self->internetInnerLineLayer, v31, (uint64_t)self);
  objc_msgSend_setLineCap_(self->internetInnerLineLayer, v32, v16);
  objc_msgSend_setFillColor_(self->internetInnerLineLayer, v33, 0);
  objc_msgSend_addSublayer_(self, v34, (uint64_t)self->internetInnerLineLayer);
  uint64_t v37 = objc_msgSend_layer(MEMORY[0x263F157D0], v35, v36);
  objc_msgSend_setInternetGradientLayer_(self, v38, v37);
  objc_msgSend_frame(self, v39, v40);
  objc_msgSend_setFrame_(self->internetGradientLayer, v41, v42);
  objc_msgSend_setName_(self->internetGradientLayer, v43, @"Gradient");
  v46 = objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v44, v45, 0.0, 0.0);
  uint64_t v49 = objc_msgSend_CGColor(v46, v47, v48);
  v52 = objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v50, v51, 0.0, 1.0);
  v129[0] = v49;
  v129[1] = objc_msgSend_CGColor(v52, v53, v54);
  uint64_t v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v55, (uint64_t)v129, 2);
  objc_msgSend_setColors_(self->internetGradientLayer, v57, v56);
  objc_msgSend_setStartPoint_(self->internetGradientLayer, v58, v59, 0.0, 0.5);
  objc_msgSend_setEndPoint_(self->internetGradientLayer, v60, v61, 0.5, 0.5);
  objc_msgSend_setLocations_(self->internetGradientLayer, v62, (uint64_t)&unk_26DA7DB58);
  objc_msgSend_frame(self, v63, v64);
  objc_msgSend_setBounds_(self->internetGradientLayer, v65, v66);
  uint64_t v69 = objc_msgSend_layer(MEMORY[0x263F15880], v67, v68);
  objc_msgSend_setBroadbandToWANOuterLineLayer_(self, v70, v69);
  objc_msgSend_frame(self, v71, v72);
  objc_msgSend_setFrame_(self->broadbandToWANOuterLineLayer, v73, v74);
  CGColorRef v75 = sub_2268EF290(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->broadbandToWANOuterLineLayer, v76, (uint64_t)v75);
  objc_msgSend_setName_(self->broadbandToWANOuterLineLayer, v77, @"BroadbandToWAN");
  objc_msgSend_setDelegate_(self->broadbandToWANOuterLineLayer, v78, (uint64_t)self);
  objc_msgSend_setLineCap_(self->broadbandToWANOuterLineLayer, v79, v16);
  objc_msgSend_setFillColor_(self->broadbandToWANOuterLineLayer, v80, 0);
  objc_msgSend_addSublayer_(self, v81, (uint64_t)self->broadbandToWANOuterLineLayer);
  uint64_t v84 = objc_msgSend_layer(MEMORY[0x263F15880], v82, v83);
  objc_msgSend_setBroadbandToWANInnerLineLayer_(self, v85, v84);
  objc_msgSend_frame(self, v86, v87);
  objc_msgSend_setFrame_(self->broadbandToWANInnerLineLayer, v88, v89);
  CGColorRef v90 = sub_2268EF290(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->broadbandToWANInnerLineLayer, v91, (uint64_t)v90);
  objc_msgSend_setName_(self->broadbandToWANInnerLineLayer, v92, @"BroadbandToWAN");
  objc_msgSend_setDelegate_(self->broadbandToWANInnerLineLayer, v93, (uint64_t)self);
  objc_msgSend_setLineCap_(self->broadbandToWANInnerLineLayer, v94, v16);
  objc_msgSend_setFillColor_(self->broadbandToWANInnerLineLayer, v95, 0);
  objc_msgSend_addSublayer_(self, v96, (uint64_t)self->broadbandToWANInnerLineLayer);
  uint64_t v99 = objc_msgSend_layer(MEMORY[0x263F15880], v97, v98);
  objc_msgSend_setSwapArcLineLayer_(self, v100, v99);
  objc_msgSend_frame(self, v101, v102);
  objc_msgSend_setFrame_(self->swapArcLineLayer, v103, v104);
  CGColorRef v105 = sub_2268EF290(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->swapArcLineLayer, v106, (uint64_t)v105);
  objc_msgSend_setName_(self->swapArcLineLayer, v107, @"SwapArcLine");
  objc_msgSend_setDelegate_(self->swapArcLineLayer, v108, (uint64_t)self);
  uint64_t v109 = *MEMORY[0x263F15E78];
  objc_msgSend_setLineCap_(self->swapArcLineLayer, v110, *MEMORY[0x263F15E78]);
  objc_msgSend_setFillColor_(self->swapArcLineLayer, v111, 0);
  objc_msgSend_addSublayer_(self, v112, (uint64_t)self->swapArcLineLayer);
  uint64_t v115 = objc_msgSend_layer(MEMORY[0x263F15880], v113, v114);
  objc_msgSend_setSwapArcArrowLayer_(self, v116, v115);
  objc_msgSend_frame(self, v117, v118);
  objc_msgSend_setFrame_(self->swapArcArrowLayer, v119, v120);
  CGColorRef v121 = sub_2268EF290(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->swapArcArrowLayer, v122, (uint64_t)v121);
  objc_msgSend_setName_(self->swapArcArrowLayer, v123, @"SwapArcArrow");
  objc_msgSend_setDelegate_(self->swapArcArrowLayer, v124, (uint64_t)self);
  objc_msgSend_setLineCap_(self->swapArcArrowLayer, v125, v109);
  objc_msgSend_setLineJoin_(self->swapArcArrowLayer, v126, *MEMORY[0x263F15E88]);
  objc_msgSend_setFillColor_(self->swapArcArrowLayer, v127, 0);
  objc_msgSend_addSublayer_(self, v128, (uint64_t)self->swapArcArrowLayer);
}

- (id)initNoWANLinkFirstFrame
{
  NSLog(&cfstr_S.isa, a2, "-[InfoDiagramCablingLayer initNoWANLinkFirstFrame]");
  v14.receiver = self;
  v14.super_class = (Class)InfoDiagramCablingLayer;
  v3 = [(InfoDiagramCablingLayer *)&v14 init];
  p_isa = (void **)&v3->super.super.isa;
  if (v3)
  {
    objc_msgSend_commonInit(v3, v4, v5);
    v7 = sub_2268EF290(0.556862745, 0.556862745, 0.576470588, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[7], v8, (uint64_t)v7);
    objc_msgSend_setStrokeColor_(p_isa[10], v9, (uint64_t)v7);
    CGColorRelease(v7);
    v10 = sub_2268EF290(1.0, 1.0, 1.0, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[6], v11, (uint64_t)v10);
    objc_msgSend_setStrokeColor_(p_isa[9], v12, (uint64_t)v10);
    CGColorRelease(v10);
  }
  return p_isa;
}

- (id)initNoWANLinkLastFrame
{
  NSLog(&cfstr_S.isa, a2, "-[InfoDiagramCablingLayer initNoWANLinkLastFrame]");
  v20.receiver = self;
  v20.super_class = (Class)InfoDiagramCablingLayer;
  v3 = [(InfoDiagramCablingLayer *)&v20 init];
  p_isa = (void **)&v3->super.super.isa;
  if (v3)
  {
    objc_msgSend_commonInit(v3, v4, v5);
    v7 = sub_2268EF290(0.556862745, 0.556862745, 0.576470588, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[7], v8, (uint64_t)v7);
    CGColorRelease(v7);
    uint64_t v9 = sub_2268EF290(0.0, 0.501960784, 0.992156863, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[10], v10, (uint64_t)v9);
    CGColorRelease(v9);
    uint64_t v11 = sub_2268EF290(1.0, 1.0, 1.0, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[6], v12, (uint64_t)v11);
    CGColorRelease(v11);
    v13 = sub_2268EF290(0.549019608, 0.77254902, 0.992156863, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[9], v14, (uint64_t)v13);
    CGColorRelease(v13);
    v15 = sub_2268EF290(0.992156863, 0.223529412, 0.207843137, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[11], v16, (uint64_t)v15);
    objc_msgSend_setStrokeColor_(p_isa[12], v17, (uint64_t)v15);
    objc_msgSend_setFillColor_(p_isa[12], v18, (uint64_t)v15);
    CGColorRelease(v15);
  }
  return p_isa;
}

- (void)setIsCompactWidth:(BOOL)a3
{
  internetOuterLineLayer = self->internetOuterLineLayer;
  if (a3) {
    double v6 = 4.0;
  }
  else {
    double v6 = 5.0;
  }
  if (a3) {
    double v7 = 2.0;
  }
  else {
    double v7 = 3.0;
  }
  objc_msgSend_setLineWidth_(internetOuterLineLayer, a2, a3, v6);
  objc_msgSend_setLineWidth_(self->internetInnerLineLayer, v8, v9, v7);
  objc_msgSend_setLineWidth_(self->broadbandToWANOuterLineLayer, v10, v11, v6);
  objc_msgSend_setLineWidth_(self->broadbandToWANInnerLineLayer, v12, v13, v7);
  objc_msgSend_setLineWidth_(self->swapArcLineLayer, v14, v15, v6);
  objc_msgSend_setLineWidth_(self->swapArcArrowLayer, v16, v17, 4.0);
  self->isCompactWidth = a3;
}

- (void)dealloc
{
  objc_msgSend_setDelegate_(self->internetInnerLineLayer, a2, 0);
  objc_msgSend_setInternetInnerLineLayer_(self, v3, 0);
  objc_msgSend_setDelegate_(self->internetOuterLineLayer, v4, 0);
  objc_msgSend_setInternetOuterLineLayer_(self, v5, 0);
  objc_msgSend_setDelegate_(self->internetGradientLayer, v6, 0);
  objc_msgSend_setInternetGradientLayer_(self, v7, 0);
  objc_msgSend_setDelegate_(self->broadbandToWANInnerLineLayer, v8, 0);
  objc_msgSend_setBroadbandToWANInnerLineLayer_(self, v9, 0);
  objc_msgSend_setDelegate_(self->broadbandToWANOuterLineLayer, v10, 0);
  objc_msgSend_setBroadbandToWANOuterLineLayer_(self, v11, 0);
  objc_msgSend_setDelegate_(self->swapArcLineLayer, v12, 0);
  objc_msgSend_setSwapArcLineLayer_(self, v13, 0);
  objc_msgSend_setDelegate_(self->swapArcArrowLayer, v14, 0);
  objc_msgSend_setSwapArcArrowLayer_(self, v15, 0);
  v16.receiver = self;
  v16.super_class = (Class)InfoDiagramCablingLayer;
  [(InfoDiagramCablingLayer *)&v16 dealloc];
}

- (void)layoutSublayers
{
  objc_msgSend_bounds(self, a2, v2);
  NSLog(&cfstr_S.isa, "-[InfoDiagramCablingLayer layoutSublayers]");
  objc_msgSend_frame(self->internetInnerLineLayer, v4, v5);
  objc_msgSend_createPathForSublayer_(self, v6, (uint64_t)self->internetInnerLineLayer);
  objc_msgSend_setNeedsDisplay(self->internetInnerLineLayer, v7, v8);
  objc_msgSend_frame(self->internetOuterLineLayer, v9, v10);
  objc_msgSend_createPathForSublayer_(self, v11, (uint64_t)self->internetOuterLineLayer);
  objc_msgSend_setNeedsDisplay(self->internetOuterLineLayer, v12, v13);
  objc_msgSend_frame(self->internetGradientLayer, v14, v15);
  objc_msgSend_frame(self->broadbandToWANInnerLineLayer, v16, v17);
  objc_msgSend_createPathForSublayer_(self, v18, (uint64_t)self->broadbandToWANInnerLineLayer);
  objc_msgSend_setNeedsDisplay(self->broadbandToWANInnerLineLayer, v19, v20);
  objc_msgSend_frame(self->broadbandToWANOuterLineLayer, v21, v22);
  objc_msgSend_createPathForSublayer_(self, v23, (uint64_t)self->broadbandToWANOuterLineLayer);
  objc_msgSend_setNeedsDisplay(self->broadbandToWANOuterLineLayer, v24, v25);
  if (self->swapCabling)
  {
    objc_msgSend_frame(self->swapArcLineLayer, v26, v27);
    objc_msgSend_createPathForSublayer_(self, v28, (uint64_t)self->swapArcLineLayer);
    objc_msgSend_frame(self->swapArcArrowLayer, v29, v30);
    objc_msgSend_createPathForSublayer_(self, v31, (uint64_t)self->swapArcArrowLayer);
    objc_msgSend_setNeedsDisplay(self->swapArcLineLayer, v32, v33);
    swapArcArrowLayer = self->swapArcArrowLayer;
    objc_msgSend_setNeedsDisplay(swapArcArrowLayer, v34, v35);
  }
}

- (void)createPathForSublayer:(id)a3
{
  if (objc_msgSend_path(a3, a2, (uint64_t)a3)) {
    return;
  }
  uint64_t v7 = objc_msgSend_name(a3, v5, v6);
  NSLog(&cfstr_SLayerNameIs.isa, "-[InfoDiagramCablingLayer createPathForSublayer:]", v7);
  Mutable = CGPathCreateMutable();
  uint64_t v11 = objc_msgSend_name(a3, v9, v10);
  if (objc_msgSend_isEqualToString_(v11, v12, @"Internet"))
  {
    uint64_t v15 = objc_msgSend_internetPoint(self->diagramAnchorPointDelegate, v13, v14);
    double v19 = sub_22686CA2C(v18, v15, v16, v17);
    CGFloat v21 = v20;
    uint64_t v24 = objc_msgSend_broadbandInPoint(self->diagramAnchorPointDelegate, v22, v23);
    double v28 = sub_22686CA2C(v27, v24, v25, v26);
    double v30 = v29;
    CGPathMoveToPoint(Mutable, 0, v19, v21);
    CGPathAddLineToPoint(Mutable, 0, v28, v21);
    v31 = Mutable;
    CGFloat v32 = v28;
    CGFloat v33 = v30;
  }
  else
  {
    v34 = objc_msgSend_name(a3, v13, v14);
    if (!objc_msgSend_isEqualToString_(v34, v35, @"BroadbandToWAN"))
    {
      if (self->swapCabling)
      {
        v63 = objc_msgSend_name(a3, v36, v37);
        if (objc_msgSend_isEqualToString_(v63, v64, @"SwapArcArrow"))
        {
          objc_msgSend_swapArcLineEndPoint(self->diagramAnchorPointDelegate, v36, v65);
          double v67 = v66;
          double v69 = v68;
          v70 = CGPathCreateMutable();
          CGPathMoveToPoint(v70, 0, v67 + -3.0, v69 + -3.0);
          CGPathAddLineToPoint(v70, 0, v67 + 2.5, v69 + 4.0);
          CGPathAddLineToPoint(v70, 0, v67 + 5.5, v69 + -3.0);
          CGPathCloseSubpath(v70);
          CGPathAddPath(Mutable, 0, v70);
          CGPathRelease(v70);
        }
        else if (self->swapCabling)
        {
          v71 = objc_msgSend_name(a3, v36, v65);
          if (objc_msgSend_isEqualToString_(v71, v72, @"SwapArcLine"))
          {
            objc_msgSend_swapArcLineStartPoint(self->diagramAnchorPointDelegate, v36, v73);
            CGFloat v75 = v74;
            CGFloat v77 = v76;
            objc_msgSend_swapArcLineEndPoint(self->diagramAnchorPointDelegate, v78, v79);
            double v81 = v80;
            CGFloat v83 = v82;
            objc_msgSend_swapArcControlPoint1(self->diagramAnchorPointDelegate, v84, v85);
            CGFloat v87 = v86;
            CGFloat v89 = v88;
            objc_msgSend_swapArcControlPoint2(self->diagramAnchorPointDelegate, v90, v91);
            CGFloat v93 = v92;
            CGFloat v95 = v94;
            if (v75 != v81 || v77 != v83)
            {
              CGPathMoveToPoint(Mutable, 0, v75, v77);
              CGPathAddCurveToPoint(Mutable, 0, v87, v89, v93, v95, v81 + 4.0, v83);
            }
          }
        }
      }
      goto LABEL_7;
    }
    uint64_t v38 = objc_msgSend_internetPoint(self->diagramAnchorPointDelegate, v36, v37);
    double v42 = sub_22686CA2C(v41, v38, v39, v40);
    CGFloat v44 = v43;
    uint64_t v47 = objc_msgSend_broadbandOutPoint(self->diagramAnchorPointDelegate, v45, v46, v42);
    double v51 = sub_22686CA2C(v50, v47, v48, v49);
    CGFloat v53 = v52;
    uint64_t v56 = objc_msgSend_wanConnectedBaseWANPoint(self->diagramAnchorPointDelegate, v54, v55);
    double v60 = sub_22686CA2C(v59, v56, v57, v58);
    double v62 = v61;
    CGPathMoveToPoint(Mutable, 0, v51, v53);
    CGPathAddLineToPoint(Mutable, 0, v51, v44);
    CGPathAddLineToPoint(Mutable, 0, v60, v44);
    v31 = Mutable;
    CGFloat v32 = v60;
    CGFloat v33 = v62;
  }
  CGPathAddLineToPoint(v31, 0, v32, v33);
LABEL_7:
  objc_msgSend_setPath_(a3, v36, (uint64_t)Mutable);

  CGPathRelease(Mutable);
}

- (BOOL)swapCabling
{
  return self->swapCabling;
}

- (void)setSwapCabling:(BOOL)a3
{
  self->swapCabling = a3;
}

- (InfoDiagramCablingAnchorDelegate)diagramAnchorPointDelegate
{
  return self->diagramAnchorPointDelegate;
}

- (void)setDiagramAnchorPointDelegate:(id)a3
{
  self->diagramAnchorPointDelegate = (InfoDiagramCablingAnchorDelegate *)a3;
}

- (CAShapeLayer)internetOuterLineLayer
{
  return self->internetOuterLineLayer;
}

- (void)setInternetOuterLineLayer:(id)a3
{
}

- (CAShapeLayer)internetInnerLineLayer
{
  return self->internetInnerLineLayer;
}

- (void)setInternetInnerLineLayer:(id)a3
{
}

- (CAGradientLayer)internetGradientLayer
{
  return self->internetGradientLayer;
}

- (void)setInternetGradientLayer:(id)a3
{
}

- (CAShapeLayer)broadbandToWANInnerLineLayer
{
  return self->broadbandToWANInnerLineLayer;
}

- (void)setBroadbandToWANInnerLineLayer:(id)a3
{
}

- (CAShapeLayer)broadbandToWANOuterLineLayer
{
  return self->broadbandToWANOuterLineLayer;
}

- (void)setBroadbandToWANOuterLineLayer:(id)a3
{
}

- (CAShapeLayer)swapArcLineLayer
{
  return self->swapArcLineLayer;
}

- (void)setSwapArcLineLayer:(id)a3
{
}

- (CAShapeLayer)swapArcArrowLayer
{
  return self->swapArcArrowLayer;
}

- (void)setSwapArcArrowLayer:(id)a3
{
}

- (BOOL)isCompactWidth
{
  return self->isCompactWidth;
}

@end