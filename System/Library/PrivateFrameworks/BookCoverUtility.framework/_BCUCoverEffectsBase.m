@interface _BCUCoverEffectsBase
- (BCULayerRenderer)renderer;
- (BOOL)includeBinding;
- (BOOL)supportsOptions;
- (NSString)identifier;
- (UIEdgeInsets)insetsForSize:(CGSize)a3 contentsScale:(double)a4 options:(id)a5;
- (_BCUCoverEffectsBase)initWithIdentifier:(id)a3 renderer:(id)a4 assets:(id)a5 shadow:(id)a6 seriesShadow:(id)a7 shadowOnly:(BOOL)a8;
- (_BCUCoverEffectsBase)initWithIdentifier:(id)a3 renderer:(id)a4 assets:(id)a5 shadow:(id)a6 seriesShadow:(id)a7 shadowOnly:(BOOL)a8 restricted:(BOOL)a9;
- (double)_assetsScale;
- (double)cornerRadius;
- (double)tintBlurRadius;
- (id)_coverLayerWithImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5;
- (id)_layerWithImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5 shadow:(id)a6;
- (id)_shadowLayerWithImage:(CGImage *)a3 size:(CGSize)a4 tint:(BOOL)a5 shadow:(id)a6;
- (id)coverLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5;
- (id)newOperationWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 priority:(float)a6 options:(id)a7 waitForCPUSynchronization:(BOOL)a8 logKey:(id)a9 completion:(id)a10;
- (id)shadowLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 kind:(unint64_t)a6;
- (void)setRenderer:(id)a3;
@end

@implementation _BCUCoverEffectsBase

- (_BCUCoverEffectsBase)initWithIdentifier:(id)a3 renderer:(id)a4 assets:(id)a5 shadow:(id)a6 seriesShadow:(id)a7 shadowOnly:(BOOL)a8
{
  char v9 = 0;
  return (_BCUCoverEffectsBase *)objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(self, a2, (uint64_t)a3, a4, a5, a6, a7, a8, v9);
}

- (_BCUCoverEffectsBase)initWithIdentifier:(id)a3 renderer:(id)a4 assets:(id)a5 shadow:(id)a6 seriesShadow:(id)a7 shadowOnly:(BOOL)a8 restricted:(BOOL)a9
{
  BOOL v9 = a8;
  id v16 = a3;
  id v17 = a4;
  id v23 = a5;
  id v18 = a6;
  id v22 = a7;
  if (!v18 && v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    sub_236A49208();
  }
  v24.receiver = self;
  v24.super_class = (Class)_BCUCoverEffectsBase;
  v19 = [(_BCUCoverEffectsBase *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_renderer, a4);
    objc_storeStrong((id *)&v20->_assets, a5);
    objc_storeStrong((id *)&v20->_shadow, a6);
    objc_storeStrong((id *)&v20->_seriesShadow, a7);
    v20->_shadowOnly = v9;
    v20->_restricted = a9;
  }

  return v20;
}

- (BOOL)includeBinding
{
  return 0;
}

- (double)cornerRadius
{
  return 0.0;
}

- (double)tintBlurRadius
{
  return 0.0;
}

- (double)_assetsScale
{
  return 3.0;
}

- (id)shadowLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 kind:(unint64_t)a6
{
  shadow = self->_shadow;
  if (!shadow) {
    goto LABEL_6;
  }
  if (a6 == 2)
  {
    objc_msgSend__shadowLayerWithImage_size_tint_shadow_(self, a2, (uint64_t)a3, 0, shadow, a4.width, a4.height, a5);
    goto LABEL_9;
  }
  if (a6 == 1)
  {
    objc_msgSend__shadowLayerWithImage_size_tint_shadow_(self, a2, (uint64_t)a3, 1, self->_seriesShadow, a4.width, a4.height, a5);
    goto LABEL_9;
  }
  if (a6)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_10;
  }
  objc_msgSend__shadowLayerWithImage_size_tint_shadow_(self, a2, (uint64_t)a3, 1, shadow, a4.width, a4.height, a5);
  v7 = LABEL_9:;
LABEL_10:
  return v7;
}

- (id)coverLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5
{
  if (self->_shadowOnly)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend__coverLayerWithImage_size_scale_(self, a2, (uint64_t)a3, a4.width, a4.height, a5);
  }
  return v5;
}

- (id)_shadowLayerWithImage:(CGImage *)a3 size:(CGSize)a4 tint:(BOOL)a5 shadow:(id)a6
{
  BOOL v6 = a5;
  double height = a4.height;
  double width = a4.width;
  v126[1] = *MEMORY[0x263EF8340];
  id v11 = a6;
  objc_msgSend_roundedInsetsWithSize_(v11, v12, v13, width, height);
  v14 = objc_opt_new();
  uint64_t v17 = objc_msgSend_image(v11, v15, v16);
  objc_msgSend_setContents_(v14, v18, v17);
  objc_msgSend_contentsCenter(v11, v19, v20);
  objc_msgSend_setContentsCenter_(v14, v21, v22);
  objc_msgSend_setContentsGravity_(v14, v23, *MEMORY[0x263F15E10]);
  v26 = objc_msgSend_blendMode(v11, v24, v25);

  if (v26)
  {
    v29 = (void *)MEMORY[0x263F157C8];
    v30 = objc_msgSend_blendMode(v11, v27, v28);
    v32 = objc_msgSend_filterWithType_(v29, v31, (uint64_t)v30);
    objc_msgSend_setCompositingFilter_(v14, v33, (uint64_t)v32);
  }
  v34 = objc_opt_new();
  objc_msgSend_setHidden_(v34, v35, 1);
  v126[0] = v34;
  v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v36, (uint64_t)v126, 1);
  objc_msgSend_setSublayers_(v14, v38, (uint64_t)v37);

  objc_msgSend_tintBlurRadius(self, v39, v40);
  if (v6)
  {
    double v44 = v43;
    if (v43 > 0.0)
    {
      objc_msgSend_setHidden_(v34, v41, 0);
      objc_msgSend_setContents_(v34, v45, (uint64_t)a3);
      objc_msgSend_setShouldRasterize_(v34, v46, 1);
      objc_msgSend_setRasterizationScale_(v34, v47, v48, 1.0);
      id v49 = objc_alloc(MEMORY[0x263F157C8]);
      v51 = objc_msgSend_initWithType_(v49, v50, *MEMORY[0x263F15BC8]);
      v54 = objc_msgSend_numberWithDouble_(NSNumber, v52, v53, v44 / (width / 15.0));
      objc_msgSend_setValue_forKey_(v51, v55, (uint64_t)v54, *MEMORY[0x263F00980]);

      v125 = v51;
      v57 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v56, (uint64_t)&v125, 1);
      objc_msgSend_setFilters_(v34, v58, (uint64_t)v57);

      objc_msgSend_setCompositingFilter_(v34, v59, *MEMORY[0x263F15D80]);
    }
  }
  objc_msgSend_insets(v11, v41, v42);
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  double v67 = v66;
  objc_msgSend_size(v11, v68, v69);
  double v73 = v72 - v63 - v67;
  double v74 = 1.0;
  double v75 = 1.0;
  if (width > 0.0) {
    double v75 = v65 + v61 + height * v73 / width;
  }
  objc_msgSend_setBounds_(v14, v70, v71, 0.0, 0.0, v72, v75);
  memset(&v123, 0, sizeof(v123));
  CGAffineTransformMakeScale(&v123, width / v73, width / v73);
  CGAffineTransform v122 = v123;
  objc_msgSend_setAffineTransform_(v14, v76, (uint64_t)&v122);
  LODWORD(v77) = *(_DWORD *)"333?";
  objc_msgSend_setOpacity_(v14, v78, v79, v77);
  if (height > 0.0) {
    double v74 = (v75 - v61 - v65) / height;
  }
  double v82 = 1.0;
  double v83 = 15.0;
  if (width > 0.0)
  {
    double v82 = v73 / width;
    double v83 = height / width * 15.0;
  }
  objc_msgSend_setBounds_(v34, v80, v81, 0.0, 0.0, 15.0, v83);
  CGAffineTransformMakeScale(&v121, width / 15.0 * v82, width / 15.0 * v74);
  CGAffineTransform v120 = v121;
  objc_msgSend_setAffineTransform_(v34, v84, (uint64_t)&v120);
  objc_msgSend_setPosition_(v34, v85, v86, v63 + width * v82 * 0.5, v61 + height * v74 * 0.5);
  objc_msgSend_bounds(v34, v87, v88);
  double MidX = CGRectGetMidX(v128);
  objc_msgSend_bounds(v34, v90, v91);
  CGFloat MidY = CGRectGetMidY(v129);
  objc_msgSend_convertPoint_toLayer_(v34, v93, (uint64_t)v14, MidX, MidY);
  double v95 = v94;
  double v97 = v96;
  objc_msgSend_bounds(v14, v98, v99);
  double v101 = v95 / v100;
  objc_msgSend_bounds(v14, v102, v103);
  objc_msgSend_setAnchorPoint_(v14, v105, v106, v101, v97 / v104);
  v109 = objc_msgSend_layer(MEMORY[0x263F157E8], v107, v108);
  v124 = v14;
  v111 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v110, (uint64_t)&v124, 1);
  objc_msgSend_setSublayers_(v109, v112, (uint64_t)v111);

  objc_msgSend_setBounds_(v109, v113, v114, 0.0, 0.0, width, height);
  v130.origin.x = 0.0;
  v130.origin.y = 0.0;
  v130.size.double width = width;
  v130.size.double height = height;
  double v115 = CGRectGetMidX(v130);
  v131.origin.x = 0.0;
  v131.origin.y = 0.0;
  v131.size.double width = width;
  v131.size.double height = height;
  CGFloat v116 = CGRectGetMidY(v131);
  objc_msgSend_setPosition_(v14, v117, v118, v115, v116);

  return v109;
}

- (id)_layerWithImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5 shadow:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  objc_msgSend_roundedInsetsWithSize_(v11, v12, v13, width, height);
  shadow = self->_shadow;
  double v18 = width + v15 + v17;
  double v20 = height + v14 + v19;
  if (shadow) {
    double v21 = v20;
  }
  else {
    double v21 = height;
  }
  if (shadow) {
    double v22 = v18;
  }
  else {
    double v22 = width;
  }
  if (shadow) {
    double v23 = v14;
  }
  else {
    double v23 = 0.0;
  }
  if (shadow) {
    double v24 = v15;
  }
  else {
    double v24 = 0.0;
  }
  uint64_t v25 = objc_opt_new();
  objc_msgSend_setRasterizationScale_(v25, v26, v27, a5);
  objc_msgSend_setFrame_(v25, v28, v29, 0.0, 0.0, v22, v21);
  if (self->_shadow)
  {
    v31 = objc_msgSend__shadowLayerWithImage_size_tint_shadow_(self, v30, (uint64_t)a3, !self->_shadowOnly, v11, width, height);
    v43.origin.x = v24;
    v43.origin.y = v23;
    v43.size.double width = width;
    v43.size.double height = height;
    double MidX = CGRectGetMidX(v43);
    v44.origin.x = v24;
    v44.origin.y = v23;
    v44.size.double width = width;
    v44.size.double height = height;
    CGFloat MidY = CGRectGetMidY(v44);
    objc_msgSend_setPosition_(v31, v34, v35, MidX, MidY);
    objc_msgSend_addSublayer_(v25, v36, (uint64_t)v31);
  }
  if (!self->_shadowOnly)
  {
    v37 = objc_msgSend__coverLayerWithImage_size_scale_(self, v30, (uint64_t)a3, width, height, a5);
    objc_msgSend_setFrame_(v37, v38, v39, v24, v23, width, height);
    objc_msgSend_addSublayer_(v25, v40, (uint64_t)v37);
  }
  return v25;
}

- (id)_coverLayerWithImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  BOOL v9 = objc_opt_new();
  id v11 = objc_opt_new();
  if (self->_restricted)
  {
    uint64_t v12 = objc_msgSend_restrictedImageFrom_size_(BCUCoverEffects, v10, (uint64_t)a3, width, height);
    if (v12) {
      objc_msgSend_setContents_(v9, v13, v12);
    }
  }
  else
  {
    objc_msgSend_setContents_(v9, v10, (uint64_t)a3);
  }
  objc_msgSend_cornerRadius(self, v13, v14);
  objc_msgSend_setCornerRadius_(v9, v15, v16);
  objc_msgSend_setMasksToBounds_(v9, v17, 1);
  uint64_t v18 = *MEMORY[0x263F15DA8];
  objc_msgSend_setMinificationFilter_(v9, v19, *MEMORY[0x263F15DA8]);
  objc_msgSend_setMagnificationFilter_(v9, v20, v18);
  objc_msgSend_setBounds_(v9, v21, v22, 0.0, 0.0, width, height);
  uint64_t v25 = objc_msgSend_edges(self->_assets, v23, v24);
  objc_msgSend_setContents_(v11, v26, v25);
  objc_msgSend_setFrame_(v11, v27, v28, 0.0, 0.0, width, height);
  objc_msgSend_setContentsCenter_(v11, v29, v30, 0.25, 0.25, 0.5, 0.5);
  objc_msgSend__assetsScale(self, v31, v32);
  objc_msgSend_setContentsScale_(v11, v33, v34);
  if (objc_msgSend_overlayColor(self->_assets, v35, v36))
  {
    uint64_t v39 = objc_msgSend_layer(MEMORY[0x263F157E8], v37, v38);
    uint64_t v42 = objc_msgSend_overlayColor(self->_assets, v40, v41);
    objc_msgSend_setBackgroundColor_(v39, v43, v42);
    objc_msgSend_setFrame_(v39, v44, v45, 0.0, 0.0, width, height);
    objc_msgSend_cornerRadius(self, v46, v47);
    objc_msgSend_setCornerRadius_(v39, v48, v49);
  }
  else
  {
    uint64_t v39 = 0;
  }
  if (!objc_msgSend_includeBinding(self, v37, v38))
  {
    v76 = 0;
    double v62 = 0;
    v51 = 0;
    if (!v39) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v51 = objc_opt_new();
  uint64_t v54 = objc_msgSend_spineNormalBlend(self->_assets, v52, v53);
  objc_msgSend_setContents_(v51, v55, v54);
  objc_msgSend_setFrame_(v51, v56, v57, 0.0, 0.0, width, height);
  objc_msgSend__assetsScale(self, v58, v59);
  objc_msgSend_setContentsScale_(v51, v60, v61);
  double v62 = objc_opt_new();
  uint64_t v65 = objc_msgSend_spineSoftLightBlend(self->_assets, v63, v64);
  objc_msgSend_setContents_(v62, v66, v65);
  v68 = objc_msgSend_filterWithType_(MEMORY[0x263F157C8], v67, *MEMORY[0x263F15D78]);
  objc_msgSend_setCompositingFilter_(v62, v69, (uint64_t)v68);

  objc_msgSend_setFrame_(v62, v70, v71, 0.0, 0.0, width, height);
  objc_msgSend__assetsScale(self, v72, v73);
  objc_msgSend_setContentsScale_(v62, v74, v75);
  v76 = objc_opt_new();
  uint64_t v79 = objc_msgSend_spineLinearBurnBlend(self->_assets, v77, v78);
  objc_msgSend_setContents_(v76, v80, v79);
  double v82 = objc_msgSend_filterWithType_(MEMORY[0x263F157C8], v81, *MEMORY[0x263F15CD0]);
  objc_msgSend_setCompositingFilter_(v76, v83, (uint64_t)v82);

  objc_msgSend_setFrame_(v76, v84, v85, 0.0, 0.0, width, height);
  objc_msgSend__assetsScale(self, v86, v87);
  objc_msgSend_setContentsScale_(v76, v88, v89);
  if (v39) {
LABEL_12:
  }
    objc_msgSend_addSublayer_(v9, v50, (uint64_t)v39);
LABEL_13:
  if (v51) {
    objc_msgSend_addSublayer_(v9, v50, (uint64_t)v51);
  }
  if (v62) {
    objc_msgSend_addSublayer_(v9, v50, (uint64_t)v62);
  }
  if (v76) {
    objc_msgSend_addSublayer_(v9, v50, (uint64_t)v76);
  }
  if (v11) {
    objc_msgSend_addSublayer_(v9, v50, (uint64_t)v11);
  }

  return v9;
}

- (BOOL)supportsOptions
{
  return 0;
}

- (UIEdgeInsets)insetsForSize:(CGSize)a3 contentsScale:(double)a4 options:(id)a5
{
  shadow = self->_shadow;
  if (shadow)
  {
    objc_msgSend_roundedInsetsWithSize_(shadow, a2, (uint64_t)a5, a3.width, a3.height, a4);
  }
  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (id)newOperationWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 priority:(float)a6 options:(id)a7 waitForCPUSynchronization:(BOOL)a8 logKey:(id)a9 completion:(id)a10
{
  BOOL v11 = a8;
  double height = a4.height;
  double width = a4.width;
  id v18 = a9;
  id v19 = a10;
  double v20 = v19;
  if (a3)
  {
    double v21 = sub_236A43F04(a3, width, height, a5);
    uint64_t v23 = v22;
    CGImageRetain(a3);
    renderer = self->_renderer;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_236A43FAC;
    v34[3] = &unk_264CBACC0;
    v34[4] = self;
    v34[5] = a3;
    *(double *)&v34[6] = v21;
    v34[7] = v23;
    *(double *)&v34[8] = a5;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_236A43FC4;
    v29[3] = &unk_264CBACE8;
    v29[4] = self;
    double v31 = v21;
    uint64_t v32 = v23;
    id v30 = v20;
    v33 = a3;
    *(float *)&double v25 = a6;
    uint64_t v27 = objc_msgSend_newOperationWithPriority_waitForCPUSynchronization_logKey_renderLayer_completion_(renderer, v26, v11, v18, v34, v29, v25);
  }
  else
  {
    (*((void (**)(id, void, void, void, double, double, double, double))v19 + 2))(v19, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
    uint64_t v27 = 0;
  }

  return v27;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BCULayerRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_seriesShadow, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end