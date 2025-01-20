@interface _BCUCoverEffectsPDF
- (BOOL)supportsOptions;
- (NSString)identifier;
- (UIEdgeInsets)_roundedInsetsWithSize:(CGSize)a3;
- (UIEdgeInsets)insetsForSize:(CGSize)a3 contentsScale:(double)a4 options:(id)a5;
- (_BCUCoverEffectsPDF)initWithIdentifier:(id)a3 renderer:(id)a4 image:(BOOL)a5 shadow:(BOOL)a6 night:(BOOL)a7;
- (id)_layerWithImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5 minificationFilter:(id)a6;
- (id)coverLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5;
- (id)newOperationWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 priority:(float)a6 options:(id)a7 waitForCPUSynchronization:(BOOL)a8 logKey:(id)a9 completion:(id)a10;
- (id)shadowLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 kind:(unint64_t)a6;
@end

@implementation _BCUCoverEffectsPDF

- (_BCUCoverEffectsPDF)initWithIdentifier:(id)a3 renderer:(id)a4 image:(BOOL)a5 shadow:(BOOL)a6 night:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_BCUCoverEffectsPDF;
  v15 = [(_BCUCoverEffectsPDF *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_renderer, a4);
    v16->_image = a5;
    v16->_shadow = a6;
    v16->_night = a7;
  }

  return v16;
}

- (id)coverLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5
{
  return 0;
}

- (id)shadowLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 kind:(unint64_t)a6
{
  return 0;
}

- (UIEdgeInsets)_roundedInsetsWithSize:(CGSize)a3
{
  double v3 = 618.0 / a3.width;
  BOOL v4 = a3.width <= 0.0;
  double v5 = 1.0;
  if (!v4) {
    double v5 = v3;
  }
  double v6 = 46.0 / v5;
  double v7 = floor(40.0 / v5);
  double v8 = floor(v6);
  double v9 = v7;
  double v10 = v7;
  result.right = v10;
  result.bottom = v8;
  result.left = v9;
  result.top = v7;
  return result;
}

- (id)_layerWithImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5 minificationFilter:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  objc_msgSend__roundedInsetsWithSize_(self, v12, v13, width, height);
  double v17 = width + v15 + v16;
  double v19 = height + v14 + v18;
  if (self->_shadow) {
    double v20 = v19;
  }
  else {
    double v20 = height;
  }
  if (self->_shadow) {
    double v21 = v17;
  }
  else {
    double v21 = width;
  }
  if (self->_shadow) {
    double v22 = v14;
  }
  else {
    double v22 = 0.0;
  }
  if (self->_shadow) {
    double v23 = v15;
  }
  else {
    double v23 = 0.0;
  }
  v24 = objc_opt_new();
  objc_msgSend_setRasterizationScale_(v24, v25, v26, a5);
  objc_msgSend_setFrame_(v24, v27, v28, 0.0, 0.0, v21, v20);
  if (self->_shadow)
  {
    double v83 = v23;
    double v84 = v22;
    if (qword_2688A7338 != -1) {
      dispatch_once(&qword_2688A7338, &unk_26E9DCCC8);
    }
    v29 = objc_opt_new();
    v30 = objc_opt_new();
    Mutable = CGPathCreateMutable();
    v86.origin.x = 0.0;
    v86.origin.y = 0.0;
    v86.size.double width = width;
    v86.size.double height = height;
    double MinX = CGRectGetMinX(v86);
    v87.origin.x = 0.0;
    v87.origin.y = 0.0;
    v87.size.double width = width;
    v87.size.double height = height;
    double MaxY = CGRectGetMaxY(v87);
    v88.origin.x = 0.0;
    v88.origin.y = 0.0;
    v88.size.double width = width;
    v88.size.double height = height;
    double x1 = CGRectGetMaxX(v88);
    v89.origin.x = 0.0;
    v89.origin.y = 0.0;
    v89.size.double width = width;
    v89.size.double height = height;
    CGFloat v33 = CGRectGetMaxY(v89);
    v90.origin.x = 0.0;
    v90.origin.y = 0.0;
    v90.size.double width = width;
    v90.size.double height = height;
    CGFloat MaxX = CGRectGetMaxX(v90);
    v91.origin.x = 0.0;
    v91.origin.y = 0.0;
    v91.size.double width = width;
    v91.size.double height = height;
    double MinY = CGRectGetMinY(v91);
    CGPathMoveToPoint(Mutable, 0, MinX + 0.0, MaxY + -2.0);
    CGPathAddArcToPoint(Mutable, 0, 0.0, 0.0, 2.0, 0.0, 2.0);
    CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MinY + 2.0, 2.0);
    CGPathAddArcToPoint(Mutable, 0, x1, v33, x1 + -2.0, v33, 2.0);
    CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX + 0.0, MaxY + -2.0, 2.0);
    CGPathCloseSubpath(Mutable);
    objc_msgSend_setShadowPath_(v29, v36, (uint64_t)Mutable);
    objc_msgSend_setShadowPath_(v30, v37, (uint64_t)Mutable);
    CGPathRelease(Mutable);
    objc_msgSend_setShadowColor_(v29, v38, qword_2688A7328);
    LODWORD(v39) = 1.0;
    objc_msgSend_setShadowOpacity_(v29, v40, v41, v39);
    objc_msgSend_setShadowRadius_(v29, v42, v43, width / 618.0 * 20.0);
    objc_msgSend_setShadowOffset_(v29, v44, v45, 0.0, width / 618.0 * 6.0);
    objc_msgSend_setShadowColor_(v30, v46, qword_2688A7330);
    LODWORD(v47) = 1.0;
    objc_msgSend_setShadowOpacity_(v30, v48, v49, v47);
    objc_msgSend_setShadowRadius_(v30, v50, v51, width / 618.0 * 4.0);
    objc_msgSend_setShadowOffset_(v30, v52, v53, 0.0, width / 618.0);
    double v23 = v83;
    double v22 = v84;
    objc_msgSend_setFrame_(v29, v54, v55, v83, v84, width, height);
    objc_msgSend_setFrame_(v30, v56, v57, v83, v84, width, height);
    objc_msgSend_addSublayer_(v24, v58, (uint64_t)v29);
    objc_msgSend_addSublayer_(v24, v59, (uint64_t)v30);
  }
  if (self->_image)
  {
    v60 = objc_opt_new();
    objc_msgSend_setContents_(v60, v61, (uint64_t)a3);
    objc_msgSend_setCornerRadius_(v60, v62, v63, 2.0);
    objc_msgSend_setMasksToBounds_(v60, v64, 1);
    objc_msgSend_setFrame_(v60, v65, v66, v23, v22, width, height);
    if (v11) {
      objc_msgSend_setMinificationFilter_(v60, v67, (uint64_t)v11);
    }
    objc_msgSend_addSublayer_(v24, v67, (uint64_t)v60);
    if (self->_night)
    {
      v70 = objc_msgSend_layer(MEMORY[0x263F157E8], v68, v69);
      uint64_t v73 = objc_msgSend_overlayColor((void *)qword_26AF401F0, v71, v72);
      objc_msgSend_setBackgroundColor_(v70, v74, v73);
      objc_msgSend_setCornerRadius_(v70, v75, v76, 2.0);
      objc_msgSend_setFrame_(v70, v77, v78, v23, v22, width, height);
      objc_msgSend_addSublayer_(v24, v79, (uint64_t)v70);
    }
  }

  return v24;
}

- (BOOL)supportsOptions
{
  return 0;
}

- (UIEdgeInsets)insetsForSize:(CGSize)a3 contentsScale:(double)a4 options:(id)a5
{
  if (self->_shadow)
  {
    objc_msgSend__roundedInsetsWithSize_(self, a2, (uint64_t)a5, a3.width, a3.height, a4);
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (id)newOperationWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 priority:(float)a6 options:(id)a7 waitForCPUSynchronization:(BOOL)a8 logKey:(id)a9 completion:(id)a10
{
  BOOL v12 = a8;
  double height = a4.height;
  double width = a4.width;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  double v22 = v21;
  if (a3)
  {
    double v23 = sub_236A43F04(a3, width, height, a5);
    uint64_t v25 = v24;
    v27 = objc_msgSend_objectForKeyedSubscript_(v19, v26, @"BCUCoverEffectsFilterOptionMinificationFilter");
    CGImageRetain(a3);
    renderer = self->_renderer;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = sub_236A449A8;
    v39[3] = &unk_264CBAD10;
    id v40 = v27;
    uint64_t v41 = a3;
    double v42 = v23;
    uint64_t v43 = v25;
    double v44 = a5;
    v39[4] = self;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_236A449C0;
    v34[3] = &unk_264CBACE8;
    v34[4] = self;
    double v36 = v23;
    uint64_t v37 = v25;
    id v35 = v22;
    v38 = a3;
    id v29 = v27;
    *(float *)&double v30 = a6;
    v32 = objc_msgSend_newOperationWithPriority_waitForCPUSynchronization_logKey_renderLayer_completion_(renderer, v31, v12, v20, v39, v34, v30);
  }
  else
  {
    (*((void (**)(id, void, void, void, double, double, double, double))v21 + 2))(v21, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
    v32 = 0;
  }

  return v32;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end