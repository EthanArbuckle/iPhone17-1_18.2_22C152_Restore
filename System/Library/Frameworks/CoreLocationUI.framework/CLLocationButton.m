@interface CLLocationButton
+ (BOOL)supportsSecureCoding;
- (BOOL)alphaInsufficient;
- (BOOL)colorsIllegible;
- (CGFloat)cornerRadius;
- (CGFloat)fontSize;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLLocationButton)init;
- (CLLocationButton)initWithCoder:(id)a3;
- (CLLocationButton)initWithFrame:(CGRect)a3;
- (CLLocationButtonIcon)icon;
- (CLLocationButtonLabel)label;
- (LocationUIProtocol)locationUIProxy;
- (id)_computeLocationButtonTag;
- (id)backgroundColor;
- (id)tintColor;
- (unint64_t)_controlEventsForActionTriggered;
- (unsigned)_secureName;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4;
- (void)_setupSlotView;
- (void)_yieldSlotViewContentForLayerContextID:(unint64_t)a3 slotStyle:(id)a4 withYieldBlock:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)markDirty;
- (void)setBackgroundColor:(id)a3;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setFontSize:(CGFloat)fontSize;
- (void)setIcon:(CLLocationButtonIcon)icon;
- (void)setLabel:(CLLocationButtonLabel)label;
- (void)setTintColor:(id)a3;
@end

@implementation CLLocationButton

- (CLLocationButton)init
{
  v15.receiver = self;
  v15.super_class = (Class)CLLocationButton;
  v2 = [(CLLocationButton *)&v15 init];
  v6 = v2;
  if (v2)
  {
    objc_msgSend_setClipsToBounds_(v2, v3, v4, v5, 1);
    objc_msgSend__setupSlotView(v6, v7, v8, v9);
    objc_msgSend_markDirty(v6, v10, v11, v12);
    v13 = v6;
  }

  return v6;
}

- (CLLocationButton)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CLLocationButton;
  v3 = -[CLLocationButton initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v3;
  if (v3)
  {
    objc_msgSend_setClipsToBounds_(v3, v4, v5, v6, 1);
    objc_msgSend__setupSlotView(v7, v8, v9, v10);
    objc_msgSend_markDirty(v7, v11, v12, v13);
    v14 = v7;
  }

  return v7;
}

- (CLLocationButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CLLocationButton;
  __n128 v6 = [(CLLocationButton *)&v58 initWithCoder:v4];
  if (v6)
  {
    uint64_t v9 = (int)objc_msgSend_decodeIntForKey_(v4, v5, v7, v8, @"kCLLocationButtonIcon");
    uint64_t v13 = (int)objc_msgSend_decodeIntForKey_(v4, v10, v11, v12, @"kCLLocationButtonLabel");
    objc_msgSend_decodeFloatForKey_(v4, v14, v15, v16, @"kCLLocationButtonCornerRadius");
    double v18 = v17.n128_f32[0];
    objc_msgSend_decodeFloatForKey_(v4, v19, v17, v20, @"kCLLocationButtonFontSize");
    double v22 = v21;
    uint64_t v23 = objc_opt_class();
    uint64_t v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v25, v26, v23, @"kCLLocationButtonBackgroundColor");
    backgroundColor = v6->_backgroundColor;
    v6->_backgroundColor = (UIColor *)v27;

    uint64_t v29 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v31, v32, v29, @"kCLLocationButtonTintColor");
    tintColor = v6->_tintColor;
    v6->_tintColor = (UIColor *)v33;

    objc_msgSend_setIcon_(v6, v35, v36, v37, v9);
    objc_msgSend_setLabel_(v6, v38, v39, v40, v13);
    v41.n128_f64[0] = v18;
    objc_msgSend_setCornerRadius_(v6, v42, v41, v43);
    v44.n128_f64[0] = v22;
    objc_msgSend_setFontSize_(v6, v45, v44, v46);
    objc_msgSend_setClipsToBounds_(v6, v47, v48, v49, 1);
    objc_msgSend__setupSlotView(v6, v50, v51, v52);
    objc_msgSend_markDirty(v6, v53, v54, v55);
    v56 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v40.receiver = self;
  v40.super_class = (Class)CLLocationButton;
  id v4 = a3;
  [(CLLocationButton *)&v40 encodeWithCoder:v4];
  objc_msgSend_encodeInt_forKey_(v4, v5, v6, v7, 1, @"kCLLocationButtonVersion", v40.receiver, v40.super_class);
  uint64_t v11 = objc_msgSend_icon(self, v8, v9, v10);
  objc_msgSend_encodeInt_forKey_(v4, v12, v13, v14, v11, @"kCLLocationButtonIcon");
  uint64_t v18 = objc_msgSend_label(self, v15, v16, v17);
  objc_msgSend_encodeInt_forKey_(v4, v19, v20, v21, v18, @"kCLLocationButtonLabel");
  objc_msgSend_cornerRadius(self, v22, v23, v24);
  v25.n128_f32[0] = v25.n128_f64[0];
  objc_msgSend_encodeFloat_forKey_(v4, v26, v25, v27, @"kCLLocationButtonCornerRadius");
  objc_msgSend_fontSize(self, v28, v29, v30);
  v31.n128_f32[0] = v31.n128_f64[0];
  objc_msgSend_encodeFloat_forKey_(v4, v32, v31, v33, @"kCLLocationButtonFontSize");
  objc_msgSend_encodeObject_forKey_(v4, v34, v35, v36, self->_backgroundColor, @"kCLLocationButtonBackgroundColor");
  objc_msgSend_encodeObject_forKey_(v4, v37, v38, v39, self->_tintColor, @"kCLLocationButtonTintColor");
}

- (void)_populateArchivedSubviews:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLLocationButton;
  id v4 = a3;
  [(CLLocationButton *)&v8 _populateArchivedSubviews:v4];
  objc_msgSend_removeObject_(v4, v5, v6, v7, self->_slotView, v8.receiver, v8.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)markDirty
{
  self->_intrinsicSize = (CGSize)*MEMORY[0x263F001B0];
  MEMORY[0x270F9A6D0]();
}

- (LocationUIProtocol)locationUIProxy
{
  proxy = self->_proxy;
  if (!proxy)
  {
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    objc_super v8 = objc_msgSend_initWithServiceName_(v4, v5, v6, v7, @"com.apple.corelocation.locationUI");
    __n128 v12 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v9, v10, v11, &unk_26F0CB5F8);
    objc_msgSend_setRemoteObjectInterface_(v8, v13, v14, v15, v12);

    objc_msgSend_setInterruptionHandler_(v8, v16, v17, v18, &unk_26F0BB180);
    objc_msgSend_setInvalidationHandler_(v8, v19, v20, v21, &unk_26F0BB1A0);
    objc_msgSend_resume(v8, v22, v23, v24);
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v25, v26, v27, &unk_26F0BB1C0);
    v28 = (LocationUIProtocol *)objc_claimAutoreleasedReturnValue();
    __n128 v29 = self->_proxy;
    self->_proxy = v28;

    proxy = self->_proxy;
  }

  return proxy;
}

- (void)_setupSlotView
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  if (self->_slotView)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#locationButton _slotView has been already created", buf, 2u);
    }
  }
  else
  {
    objc_msgSend_addTarget_action_forControlEvents_(self, a2, v2, v3, 0, sel__actionForPreSetTarget, 64);
    objc_super v8 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v5, v6, v7);
    objc_msgSend_bundleURL(v8, v9, v10, v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileSystemRepresentation(v12, v13, v14, v15);
    __n128 v16 = (void *)sandbox_extension_issue_file();

    if (v16)
    {
      objc_msgSend_stringWithCString_encoding_(NSString, v17, v18, v19, v16, 4);
      __n128 v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      sandboxExtension = self->_sandboxExtension;
      self->_sandboxExtension = v20;

      free(v16);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        v119 = self->_sandboxExtension;
        *(_DWORD *)buf = 138412290;
        v128 = v119;
        _os_log_debug_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#locationButton sandbox-extension: %@", buf, 0xCu);
      }
    }
    objc_msgSend_systemBlueColor(MEMORY[0x263F1C548], v17, v18, v19);
    double v22 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v22;

    objc_msgSend_systemWhiteColor(MEMORY[0x263F1C548], v24, v25, v26);
    __n128 v27 = (UIColor *)objc_claimAutoreleasedReturnValue();
    tintColor = self->_tintColor;
    self->_tintColor = v27;

    objc_msgSend_setIsAccessibilityElement_(self, v29, v30, v31, 1);
    objc_msgSend_setAccessibilityIdentifier_(self, v32, v33, v34, @"CLLocationButton");
    __n128 v35 = (_UISlotView *)objc_alloc_init(MEMORY[0x263F1CD38]);
    slotView = self->_slotView;
    self->_slotView = v35;

    objc_msgSend_setUserInteractionEnabled_(self->_slotView, v37, v38, v39, 0);
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->_slotView, v40, v41, v42, 0);
    objc_initWeak((id *)buf, self);
    __n128 v43 = self->_slotView;
    __n128 v44 = self;
    v126 = v44;
    __n128 v48 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v45, v46, v47, &v126, 1);
    v123[0] = MEMORY[0x263EF8330];
    v123[1] = 3221225472;
    v123[2] = sub_23CB14FEC;
    v123[3] = &unk_264E821F8;
    objc_copyWeak(&v124, (id *)buf);
    id v52 = (id)objc_msgSend_registerForTraitChanges_withHandler_(v43, v49, v50, v51, v48, v123);

    objc_msgSend_addSubview_(self, v53, v54, v55, self->_slotView);
    v56 = (void *)MEMORY[0x263F08938];
    v60 = objc_msgSend_centerXAnchor(self->_slotView, v57, v58, v59);
    v64 = objc_msgSend_centerXAnchor(self, v61, v62, v63);
    v68 = objc_msgSend_constraintEqualToAnchor_(v60, v65, v66, v67, v64);
    v125[0] = v68;
    v72 = objc_msgSend_centerYAnchor(self->_slotView, v69, v70, v71);
    v76 = objc_msgSend_centerYAnchor(self, v73, v74, v75);
    v80 = objc_msgSend_constraintEqualToAnchor_(v72, v77, v78, v79, v76);
    v125[1] = v80;
    v84 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v81, v82, v83, v125, 2);
    objc_msgSend_activateConstraints_(v56, v85, v86, v87, v84);

    v88.n128_u32[0] = 1144750080;
    objc_msgSend_setContentHuggingPriority_forAxis_(self, v89, v88, v90, 1);
    v91.n128_u32[0] = 1144750080;
    objc_msgSend_setContentHuggingPriority_forAxis_(self, v92, v91, v93, 0);
    v94.n128_u64[0] = *(void *)&self->_intrinsicSize.width;
    v95.n128_u64[0] = 1.0;
    objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x263F08938], v96, v95, v94, self, 7, 1, 0, 0);
    v97 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    minimumWidthConstraint = self->_minimumWidthConstraint;
    self->_minimumWidthConstraint = v97;

    v99.n128_u32[0] = 1148846080;
    objc_msgSend_setPriority_(self->_minimumWidthConstraint, v100, v99, v101);
    objc_msgSend_setActive_(self->_minimumWidthConstraint, v102, v103, v104, 1);
    v105.n128_u64[0] = *(void *)&self->_intrinsicSize.height;
    v106.n128_u64[0] = 1.0;
    objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x263F08938], v107, v106, v105, self, 8, 1, 0, 0);
    v108 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    minimumHeightConstraint = self->_minimumHeightConstraint;
    self->_minimumHeightConstraint = v108;

    v110.n128_u32[0] = 1148846080;
    objc_msgSend_setPriority_(self->_minimumHeightConstraint, v111, v110, v112);
    objc_msgSend_setActive_(self->_minimumHeightConstraint, v113, v114, v115, 1);
    objc_initWeak(&location, self);
    v120[0] = MEMORY[0x263EF8330];
    v120[1] = 3221225472;
    v120[2] = sub_23CB151B0;
    v120[3] = &unk_264E82220;
    objc_copyWeak(&v121, &location);
    objc_msgSend__setSlotAnyContentProvider_(self->_slotView, v116, v117, v118, v120);
    objc_destroyWeak(&v121);
    objc_destroyWeak(&location);
    objc_destroyWeak(&v124);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  __n128 v10 = objc_msgSend_locationUIProxy(self, v7, v8, v9);
  __n128 v14 = objc_msgSend__authenticationMessage(v6, v11, v12, v13);
  objc_msgSend_onPrimaryTouchDownEvent_(v10, v15, v16, v17, v14);

  v18.receiver = self;
  v18.super_class = (Class)CLLocationButton;
  [(CLLocationButton *)&v18 _sendActionsForEvents:a3 withEvent:v6];
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (void)setIcon:(CLLocationButtonIcon)icon
{
  self->_icon = icon;
  objc_msgSend_markDirty(self, a2, v3, v4);
}

- (void)setLabel:(CLLocationButtonLabel)label
{
  self->_label = label;
  objc_msgSend_markDirty(self, a2, v3, v4);
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  self->_cornerRadius = cornerRadius;
  objc_msgSend_markDirty(self, a2, *(__n128 *)&cornerRadius, v3);
}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);

  objc_msgSend_markDirty(self, v4, v5, v6);
}

- (id)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);

  objc_msgSend_markDirty(self, v4, v5, v6);
}

- (void)setFontSize:(CGFloat)fontSize
{
  self->_fontSize = fontSize;
  objc_msgSend_markDirty(self, a2, *(__n128 *)&fontSize, v3);
}

- (id)_computeLocationButtonTag
{
  p_resolvedBackgroundColor = (void **)&self->_resolvedBackgroundColor;
  objc_storeStrong((id *)&self->_resolvedBackgroundColor, self->_backgroundColor);
  objc_storeStrong((id *)&self->_resolvedTintColor, self->_tintColor);
  __n128 v7 = objc_msgSend_traitCollection(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_resolvedColorWithTraitCollection_(self->_backgroundColor, v8, v9, v10, v7);
  __n128 v12 = *p_resolvedBackgroundColor;
  *p_resolvedBackgroundColor = (void *)v11;

  objc_msgSend_resolvedColorWithTraitCollection_(self->_tintColor, v13, v14, v15, v7);
  __n128 v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
  resolvedTintColor = self->_resolvedTintColor;
  self->_resolvedTintColor = v16;

  NSLog(&cfstr_Computelocatio.isa, *p_resolvedBackgroundColor, self->_resolvedTintColor);
  objc_super v18 = [CLLocationButtonTag alloc];
  uint64_t v22 = objc_msgSend_label(self, v19, v20, v21);
  uint64_t v26 = objc_msgSend_icon(self, v23, v24, v25);
  v27.n128_u64[0] = 1.0;
  __n128 v30 = objc_msgSend_colorWithAlphaComponent_(*p_resolvedBackgroundColor, v28, v27, v29);
  v31.n128_u64[0] = 1.0;
  __n128 v34 = objc_msgSend_colorWithAlphaComponent_(self->_resolvedTintColor, v32, v31, v33);
  objc_msgSend_cornerRadius(self, v35, v36, v37);
  unint64_t v39 = v38.n128_u64[0];
  objc_msgSend_frame(self, v40, v38, v41);
  unint64_t v43 = v42.n128_u64[0];
  double v45 = v44.n128_f64[0];
  double v47 = v46;
  double v49 = v48;
  objc_msgSend_fontSize(self, v50, v42, v44);
  double v52 = v51;
  v53.n128_u64[0] = v39;
  v54.n128_u64[0] = v43;
  v56 = objc_msgSend_initWithLabel_iconType_backgroundColor_tintColor_cornerRadius_frame_fontSize_(v18, v55, v53, v54, v22, v26, v30, v34, v45, v47, v49, v52);

  v57.n128_u32[0] = 1.0;
  if ((objc_msgSend_contrastValidForBgColorAndFgTextWithCumulativeOpacity_(v56, v58, v57, v59) & 1) == 0)
  {
    self->_colorsIllegible = 1;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error: #locationButton failed due to illegible colors", buf, 2u);
    }
  }
  v60 = [CLLocationButtonTag alloc];
  uint64_t v64 = objc_msgSend_label(self, v61, v62, v63);
  uint64_t v68 = objc_msgSend_icon(self, v65, v66, v67);
  v69 = *p_resolvedBackgroundColor;
  __n128 v70 = self->_resolvedTintColor;
  objc_msgSend_cornerRadius(self, v71, v72, v73);
  unint64_t v75 = v74.n128_u64[0];
  objc_msgSend_frame(self, v76, v74, v77);
  unint64_t v79 = v78.n128_u64[0];
  double v81 = v80.n128_f64[0];
  double v83 = v82;
  double v85 = v84;
  objc_msgSend_fontSize(self, v86, v78, v80);
  double v88 = v87;
  v89.n128_u64[0] = v75;
  v90.n128_u64[0] = v79;
  v92 = objc_msgSend_initWithLabel_iconType_backgroundColor_tintColor_cornerRadius_frame_fontSize_(v60, v91, v89, v90, v64, v68, v69, v70, v81, v83, v85, v88);
  v96 = objc_msgSend_layer(self, v93, v94, v95);
  objc_msgSend_opacity(v96, v97, v98, v99);
  LOBYTE(v60) = objc_msgSend_contrastValidForBgColorAndFgTextWithCumulativeOpacity_(v92, v100, v101, v102);

  if ((v60 & 1) == 0)
  {
    self->_alphaInsufficient = 1;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__n128 v104 = 0;
      _os_log_error_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error: #locationButton failed due to Insufficient Alpha", v104, 2u);
    }
  }

  return v92;
}

- (void)_yieldSlotViewContentForLayerContextID:(unint64_t)a3 slotStyle:(id)a4 withYieldBlock:(id)a5
{
  id v8 = a4;
  __n128 v9 = (void (**)(id, void *))a5;
  __n128 v13 = objc_msgSend__computeLocationButtonTag(self, v10, v11, v12);
  __n128 v14 = self->_sandboxExtension;
  __n128 v15 = [CLLocationButtonDrawing alloc];
  __n128 v19 = objc_msgSend_initWithStyle_tag_remote_(v15, v16, v17, v18, v8, v13, 0);
  __n128 v23 = objc_msgSend_localizedTitle(v19, v20, v21, v22);
  objc_msgSend_setAccessibilityLabel_(self, v24, v25, v26, v23);

  objc_msgSend_neededSize(v19, v27, v28, v29);
  CGFloat v31 = v30.n128_f64[0] + 1.0;
  objc_msgSend_neededSize(v19, v32, v30, v33);
  v35.n128_f64[0] = v34.n128_f64[0] + 1.0;
  self->_intrinsicSize.width = v31;
  self->_intrinsicSize.height = v34.n128_f64[0] + 1.0;
  __n128 v36 = (void *)MEMORY[0x263F83E70];
  uint64_t v38 = objc_msgSend_displayScale(v8, v37, v35, v34);
  uint64_t v42 = objc_msgSend_displayRange(v8, v39, v40, v41);
  double v46 = objc_msgSend_contentWithDrawing_scale_range_(v36, v43, v44, v45, v19, v38, v42);
  v9[2](v9, v46);
  objc_msgSend_frame(v13, v47, v48, v49);
  if (CGRectIsEmpty(v58))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#locationButton skip remote-imaging. tag has zero-size frame", buf, 2u);
    }
  }
  else
  {
    __n128 v50 = dispatch_get_global_queue(33, 0);
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = sub_23CB15960;
    v51[3] = &unk_264E82298;
    v51[4] = self;
    id v52 = v8;
    unint64_t v56 = a3;
    id v53 = v13;
    __n128 v54 = v14;
    __n128 v55 = v9;
    dispatch_async(v50, v51);
  }
}

- (void)layoutSubviews
{
  objc_msgSend__updateContent(self->_slotView, a2, v2, v3);
  v5.n128_u64[0] = *(void *)&self->_intrinsicSize.width;
  objc_msgSend_setConstant_(self->_minimumWidthConstraint, v6, v5, v7);
  v8.n128_u64[0] = *(void *)&self->_intrinsicSize.height;
  objc_msgSend_setConstant_(self->_minimumHeightConstraint, v9, v8, v10);
  v11.receiver = self;
  v11.super_class = (Class)CLLocationButton;
  [(CLLocationButton *)&v11 layoutSubviews];
}

- (CGSize)intrinsicContentSize
{
  p_intrinsicSize = &self->_intrinsicSize;
  v2.n128_u64[0] = *(void *)&self->_intrinsicSize.width;
  if (v2.n128_f64[0] == 0.0)
  {
    v3.n128_u64[0] = *(void *)&self->_intrinsicSize.height;
    if (v3.n128_f64[0] == 0.0)
    {
      objc_msgSend__updateContent(self->_slotView, a2, v2, v3);
      v2.n128_u64[0] = *(void *)&p_intrinsicSize->width;
    }
  }
  double height = p_intrinsicSize->height;
  result.width = v2.n128_f64[0];
  result.double height = height;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  MEMORY[0x270F9A6D0](self, sel_intrinsicContentSize, (__n128)a3, *(__n128 *)&a3.height);
  result.double height = v4;
  result.width = v3;
  return result;
}

- (unsigned)_secureName
{
  uint64_t v5 = objc_msgSend_label(self, a2, v2, v3);

  return objc_msgSend_secureNameForLabel_(CLLocationButtonTag, v4, v6, v7, v5);
}

- (CLLocationButtonIcon)icon
{
  return self->_icon;
}

- (CLLocationButtonLabel)label
{
  return self->_label;
}

- (CGFloat)fontSize
{
  return self->_fontSize;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)colorsIllegible
{
  return self->_colorsIllegible;
}

- (BOOL)alphaInsufficient
{
  return self->_alphaInsufficient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_resolvedTintColor, 0);
  objc_storeStrong((id *)&self->_resolvedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_slotView, 0);
}

@end