@interface CARScreenViewArea
+ (NSEdgeInsets)insetsForOEMUIWithDisplaySize:(CGSize)a3 safeFrame:(CGRect)a4 viewAreaFrame:(CGRect)a5;
+ (void)insetsForOEMUIWithDisplaySize:(double)a3 originInDisplay:(double)a4 safeFrame:(CGFloat)a5 viewAreaFrame:(CGFloat)a6;
- (BOOL)displaysTransitionControl;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToViewArea:(id)a3;
- (BOOL)shouldApplyDisplayInsets;
- (BOOL)supportsFocusTransfer;
- (BOOL)supportsUIOutsideSafeArea;
- (CARDisplayInfoProviding)displayInfoProvider;
- (CARScreenViewArea)initWithPropertySupplier:(id)a3 additionalInsets:(NSEdgeInsets)a4 displayInfoProvider:(id)a5;
- (CARScreenViewArea)initWithPropertySupplier:(id)a3 additionalInsets:(NSEdgeInsets)a4 viewAreaDictionary:(id)a5 wantsCornerMasks:(BOOL)a6 displayInfoProvider:(id)a7;
- (CARScreenViewArea)initWithPropertySupplier:(id)a3 displayInfoProvider:(id)a4;
- (CGRect)safeFrame;
- (CGRect)unadjustedSafeFrame;
- (CGRect)visibleFrame;
- (NSEdgeInsets)additionalInsets;
- (id)description;
- (unint64_t)statusBarEdge;
- (void)_updateEffectiveSafeFrame;
- (void)setAdditionalInsets:(NSEdgeInsets)a3;
- (void)setDisplayInfoProvider:(id)a3;
- (void)setDisplaysTransitionControl:(BOOL)a3;
- (void)setShouldApplyDisplayInsets:(BOOL)a3;
- (void)setStatusBarEdge:(unint64_t)a3;
- (void)setSupportsFocusTransfer:(BOOL)a3;
- (void)setSupportsUIOutsideSafeArea:(BOOL)a3;
- (void)setUnadjustedSafeFrame:(CGRect)a3;
@end

@implementation CARScreenViewArea

- (CARScreenViewArea)initWithPropertySupplier:(id)a3 displayInfoProvider:(id)a4
{
  return -[CARScreenViewArea initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:](self, "initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:", a3, 0, 0, a4, *MEMORY[0x1E4F28250], *(double *)(MEMORY[0x1E4F28250] + 8), *(double *)(MEMORY[0x1E4F28250] + 16), *(double *)(MEMORY[0x1E4F28250] + 24));
}

- (CARScreenViewArea)initWithPropertySupplier:(id)a3 additionalInsets:(NSEdgeInsets)a4 displayInfoProvider:(id)a5
{
  return -[CARScreenViewArea initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:](self, "initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:", a3, 0, 0, a5, a4.top, a4.left, a4.bottom, a4.right);
}

- (CARScreenViewArea)initWithPropertySupplier:(id)a3 additionalInsets:(NSEdgeInsets)a4 viewAreaDictionary:(id)a5 wantsCornerMasks:(BOOL)a6 displayInfoProvider:(id)a7
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  v15 = (uint64_t (**)(id, void))a3;
  id v16 = a5;
  id v17 = a7;
  v61.receiver = self;
  v61.super_class = (Class)CARScreenViewArea;
  v18 = [(CARScreenViewArea *)&v61 init];
  v19 = v18;
  if (v15 && v18)
  {
    id v60 = v17;
    objc_storeWeak((id *)&v18->_displayInfoProvider, v17);
    CFDictionaryRef v20 = (const __CFDictionary *)v15[2](v15, *MEMORY[0x1E4F211E0]);
    p_origin = &v19->_visibleFrame.origin;
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v20, &rect))
    {
      CGSize size = rect.size;
      CGPoint *p_origin = rect.origin;
      v19->_visibleFrame.CGSize size = size;
    }
    else
    {
      CGPoint *p_origin = 0u;
      v19->_visibleFrame.CGSize size = 0u;
    }
    CFDictionaryRef v23 = (const __CFDictionary *)v15[2](v15, *MEMORY[0x1E4F211D0]);
    v24 = &v19->_safeFrame.origin;
    memset(&rect, 0, sizeof(rect));
    BOOL v59 = a6;
    if (CGRectMakeWithDictionaryRepresentation(v23, &rect))
    {
      CGSize v25 = rect.size;
      CGPoint *v24 = rect.origin;
      v19->_safeFrame.CGSize size = v25;
    }
    else
    {
      CGPoint *v24 = 0u;
      v19->_safeFrame.CGSize size = 0u;
    }
    v15[2](v15, *MEMORY[0x1E4F211F0]);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_opt_class();
      id v27 = v26;
      if (objc_opt_isKindOfClass()) {
        char v28 = [v27 BOOLValue];
      }
      else {
        char v28 = 0;
      }
    }
    else
    {
      char v28 = 0;
    }

    v19->_displaysTransitionControl = v28;
    v29 = v15[2](v15, *MEMORY[0x1E4F211D8]);
    id v30 = [v16 objectForKey:@"viewAreaSupportsFocusTransfer"];
    if (v30)
    {
      objc_opt_class();
      id v31 = v30;
      if (objc_opt_isKindOfClass()) {
        char v32 = [v31 BOOLValue];
      }
      else {
        char v32 = 0;
      }
    }
    else
    {
      char v32 = 0;
    }

    v19->_supportsFocusTransfer = v32;
    v33 = [v16 objectForKey:@"safeArea"];
    id v34 = [v33 objectForKey:@"drawUIOutsideSafeArea"];
    if (v34)
    {
      objc_opt_class();
      id v35 = v34;
      if (objc_opt_isKindOfClass()) {
        char v36 = [v35 BOOLValue];
      }
      else {
        char v36 = 0;
      }
    }
    else
    {
      char v36 = 0;
    }

    v19->_supportsUIOutsideSafeArea = v36;
    CGSize v37 = v19->_safeFrame.size;
    v19->_unadjustedSafeFrame.origin = *v24;
    v19->_unadjustedSafeFrame.CGSize size = v37;
    if (CRIsInternalInstall())
    {
      v38 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v39 = [v38 valueForKey:@"CARCapabilitesInsets"];

      if (v39)
      {
        v40 = [v39 objectForKeyedSubscript:@"Top"];
        [v40 floatValue];
        double top = v41;
        v42 = [v39 objectForKeyedSubscript:@"Left"];
        [v42 floatValue];
        double left = v43;
        v44 = [v39 objectForKeyedSubscript:@"Bottom"];
        [v44 floatValue];
        double bottom = v45;
        v46 = [v39 objectForKeyedSubscript:@"Right"];
        [v46 floatValue];
        double right = v47;
      }
    }
    v19->_additionalInsets.double top = top;
    v19->_additionalInsets.double left = left;
    v19->_additionalInsets.double bottom = bottom;
    v19->_additionalInsets.double right = right;
    BOOL v48 = !v59;
    if (!v16) {
      BOOL v48 = 0;
    }
    v19->_shouldApplyDisplayInsets = v48;
    [(CARScreenViewArea *)v19 _updateEffectiveSafeFrame];
    unint64_t v49 = [v29 unsignedIntegerValue];
    id v17 = v60;
    if (!v29 || v49 >= 3)
    {
      v50 = CarGeneralLogging();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[CARScreenViewArea initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:](v50, v51, v52, v53, v54, v55, v56, v57);
      }

      unint64_t v49 = 0;
    }
    v19->_statusBarEdge = v49;
  }
  return v19;
}

- (void)_updateEffectiveSafeFrame
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  CGSize size = self->_unadjustedSafeFrame.size;
  self->_safeFrame.origin = self->_unadjustedSafeFrame.origin;
  self->_safeFrame.CGSize size = size;
  v4 = [(CARScreenViewArea *)self displayInfoProvider];
  [v4 originInDisplay];
  double v6 = v5;
  double v8 = v7;

  if (self->_shouldApplyDisplayInsets)
  {
    v9 = [(CARScreenViewArea *)self displayInfoProvider];
    [v9 displayPixelSize];
    double v11 = v10;
    double v13 = v12;

    v14 = CarGeneralLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v60.width = v11;
      v60.height = v13;
      v15 = NSStringFromSize(v60);
      id v16 = NSStringFromRect(self->_unadjustedSafeFrame);
      id v17 = NSStringFromRect(self->_visibleFrame);
      *(_DWORD *)buf = 138412802;
      uint64_t v54 = v15;
      __int16 v55 = 2112;
      uint64_t v56 = v16;
      __int16 v57 = 2112;
      v58 = v17;
      _os_log_impl(&dword_1ABB00000, v14, OS_LOG_TYPE_DEFAULT, "Display (%@) supports view areas and does not want corner masks, applying insets to edges that need to be inset. Safe frame: (%@), viewArea frame: (%@)", buf, 0x20u);
    }
    objc_msgSend((id)objc_opt_class(), "insetsForOEMUIWithDisplaySize:originInDisplay:safeFrame:viewAreaFrame:", v11, v13, v6, v8, self->_unadjustedSafeFrame.origin.x, self->_unadjustedSafeFrame.origin.y, self->_unadjustedSafeFrame.size.width, self->_unadjustedSafeFrame.size.height, *(void *)&self->_visibleFrame.origin.x, *(void *)&self->_visibleFrame.origin.y, *(void *)&self->_visibleFrame.size.width, *(void *)&self->_visibleFrame.size.height);
    double top = v61.top;
    double left = v61.left;
    double bottom = v61.bottom;
    double right = v61.right;
    CGFloat v22 = *MEMORY[0x1E4F28250];
    CGFloat v23 = *(double *)(MEMORY[0x1E4F28250] + 8);
    CGFloat v24 = *(double *)(MEMORY[0x1E4F28250] + 16);
    CGFloat v25 = *(double *)(MEMORY[0x1E4F28250] + 24);
    v65.double top = *(CGFloat *)MEMORY[0x1E4F28250];
    v65.double left = v23;
    v65.double bottom = v24;
    v65.double right = v25;
    if (NSEdgeInsetsEqual(v61, v65))
    {
      id v26 = CarGeneralLogging();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = NSStringFromRect(self->_safeFrame);
        char v28 = NSStringFromRect(self->_visibleFrame);
        *(_DWORD *)buf = 138412546;
        uint64_t v54 = v27;
        __int16 v55 = 2112;
        uint64_t v56 = v28;
        _os_log_impl(&dword_1ABB00000, v26, OS_LOG_TYPE_DEFAULT, "No insets will be applied: Safe frame: (%@), viewArea frame: (%@)", buf, 0x16u);
      }
    }
    else
    {
      double v50 = v24;
      double v51 = v23;
      double v52 = v22;
      double v29 = left + self->_safeFrame.origin.x;
      double v49 = top + self->_safeFrame.origin.y;
      double v30 = self->_safeFrame.size.width - (left + right);
      double v31 = self->_safeFrame.size.height - (top + bottom);
      char v32 = CarGeneralLogging();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v30 < 740.0 || v31 < 456.0)
      {
        if (v33)
        {
          v63.origin.x = v29;
          v63.size.width = v30;
          v63.origin.y = v49;
          v63.size.height = v31;
          CGSize v37 = NSStringFromRect(v63);
          *(_DWORD *)buf = 138412290;
          uint64_t v54 = v37;
          _os_log_impl(&dword_1ABB00000, v32, OS_LOG_TYPE_DEFAULT, "Visible frame inset with OEM insets is too small (%@), not applying insets", buf, 0xCu);
        }
      }
      else
      {
        if (v33)
        {
          id v34 = [NSString stringWithFormat:@"Left: %.1f, right: %.1f, top: %.1f, bottom: %.1f", *(void *)&left, *(void *)&right, *(void *)&top, *(void *)&bottom];
          id v35 = NSStringFromRect(self->_safeFrame);
          v62.origin.x = v29;
          v62.size.width = v30;
          v62.origin.y = v49;
          v62.size.height = v31;
          char v36 = NSStringFromRect(v62);
          *(_DWORD *)buf = 138412802;
          uint64_t v54 = v34;
          __int16 v55 = 2112;
          uint64_t v56 = v35;
          __int16 v57 = 2112;
          v58 = v36;
          _os_log_impl(&dword_1ABB00000, v32, OS_LOG_TYPE_DEFAULT, "Applying OEM UI insets: %@ before frame: %@, after frame: %@", buf, 0x20u);
        }
        self->_safeFrame.origin.x = v29;
        self->_safeFrame.origin.y = v49;
        self->_safeFrame.size.width = v30;
        self->_safeFrame.size.height = v31;
      }
      CGFloat v23 = v51;
      CGFloat v22 = v52;
      CGFloat v24 = v50;
    }
  }
  else
  {
    CGFloat v22 = *MEMORY[0x1E4F28250];
    CGFloat v23 = *(double *)(MEMORY[0x1E4F28250] + 8);
    CGFloat v24 = *(double *)(MEMORY[0x1E4F28250] + 16);
    CGFloat v25 = *(double *)(MEMORY[0x1E4F28250] + 24);
  }
  v66.double top = v22;
  v66.double left = v23;
  v66.double bottom = v24;
  v66.double right = v25;
  if (!NSEdgeInsetsEqual(self->_additionalInsets, v66))
  {
    v38 = CarGeneralLogging();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [NSString stringWithFormat:@"Left: %.1f, right: %.1f, top: %.1f, bottom: %.1f", *(void *)&self->_additionalInsets.left, *(void *)&self->_additionalInsets.right, *(void *)&self->_additionalInsets.top, *(void *)&self->_additionalInsets.bottom];
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = v39;
      _os_log_impl(&dword_1ABB00000, v38, OS_LOG_TYPE_DEFAULT, "Additional insets provided: %@", buf, 0xCu);
    }
    double v40 = self->_additionalInsets.left;
    double v41 = self->_safeFrame.size.width - (v40 + self->_additionalInsets.right);
    if (v41 >= 740.0)
    {
      double v42 = self->_additionalInsets.top;
      double v43 = self->_safeFrame.size.height - (v42 + self->_additionalInsets.bottom);
      if (v43 >= 456.0)
      {
        double v44 = self->_safeFrame.origin.x + v40;
        double v45 = self->_safeFrame.origin.y + v42;
        v46 = CarGeneralLogging();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          float v47 = NSStringFromRect(self->_safeFrame);
          v64.origin.x = v44;
          v64.origin.y = v45;
          v64.size.width = v41;
          v64.size.height = v43;
          BOOL v48 = NSStringFromRect(v64);
          *(_DWORD *)buf = 138412546;
          uint64_t v54 = v47;
          __int16 v55 = 2112;
          uint64_t v56 = v48;
          _os_log_impl(&dword_1ABB00000, v46, OS_LOG_TYPE_DEFAULT, "Applying additional insets: before frame: %@, after frame: %@", buf, 0x16u);
        }
        self->_safeFrame.origin.x = v44;
        self->_safeFrame.origin.y = v45;
        self->_safeFrame.size.width = v41;
        self->_safeFrame.size.height = v43;
      }
    }
  }
}

+ (NSEdgeInsets)insetsForOEMUIWithDisplaySize:(CGSize)a3 safeFrame:(CGRect)a4 viewAreaFrame:(CGRect)a5
{
  objc_msgSend(a1, "insetsForOEMUIWithDisplaySize:originInDisplay:safeFrame:viewAreaFrame:", a3.width, a3.height, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.double right = v8;
  result.double bottom = v7;
  result.double left = v6;
  result.double top = v5;
  return result;
}

+ (void)insetsForOEMUIWithDisplaySize:(double)a3 originInDisplay:(double)a4 safeFrame:(CGFloat)a5 viewAreaFrame:(CGFloat)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  double v36 = a3 + a9;
  double aRect = a4 + a10;
  double v22 = a3 + a5;
  double v23 = a4 + a6;
  CGFloat v24 = CarGeneralLogging();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v25 = BSNSStringFromCGSize();
    id v26 = BSNSStringFromCGPoint();
    v53.origin.x = a9;
    v53.origin.y = a10;
    v53.size.width = a11;
    v53.size.height = a12;
    id v27 = NSStringFromRect(v53);
    v54.origin.x = a5;
    v54.origin.y = a6;
    v54.size.width = a7;
    v54.size.height = a8;
    char v28 = NSStringFromRect(v54);
    v55.origin.x = v36;
    v55.origin.y = aRect;
    v55.size.width = a11;
    v55.size.height = a12;
    double v29 = NSStringFromRect(v55);
    v56.origin.x = v22;
    v56.origin.y = v23;
    v56.size.width = a7;
    v56.size.height = a8;
    double v30 = NSStringFromRect(v56);
    *(_DWORD *)buf = 138413570;
    double v41 = v25;
    __int16 v42 = 2112;
    double v43 = v26;
    __int16 v44 = 2112;
    double v45 = v27;
    __int16 v46 = 2112;
    float v47 = v28;
    __int16 v48 = 2112;
    double v49 = v29;
    __int16 v50 = 2112;
    double v51 = v30;
    _os_log_impl(&dword_1ABB00000, v24, OS_LOG_TYPE_DEFAULT, "Display pixel size: %@, origin in display: %@, incoming view area frame: %@, safe frame: %@, adjusted view area frame: %@, safe frame: %@", buf, 0x3Eu);
  }
  BSFloatEqualToFloat();
  BSFloatEqualToFloat();
  BSFloatEqualToFloat();
  BSFloatEqualToFloat();
  double v31 = CarGeneralLogging();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    char v32 = NSStringFromBOOL();
    BOOL v33 = NSStringFromBOOL();
    id v34 = NSStringFromBOOL();
    id v35 = NSStringFromBOOL();
    *(_DWORD *)buf = 138413058;
    double v41 = v32;
    __int16 v42 = 2112;
    double v43 = v33;
    __int16 v44 = 2112;
    double v45 = v34;
    __int16 v46 = 2112;
    float v47 = v35;
    _os_log_impl(&dword_1ABB00000, v31, OS_LOG_TYPE_DEFAULT, "Display supports view area, should inset: left: %@, right: %@, top: %@, bottom: %@", buf, 0x2Au);
  }
}

- (id)description
{
  v3 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)CARScreenViewArea;
  v4 = [(CARScreenViewArea *)&v21 description];
  [(CARScreenViewArea *)self visibleFrame];
  v9 = [NSString stringWithFormat:@"{x: %f, y: %f, w: %f, h: %f}", v5, v6, v7, v8];
  [(CARScreenViewArea *)self safeFrame];
  v14 = [NSString stringWithFormat:@"{x: %f, y: %f, w: %f, h: %f}", v10, v11, v12, v13];
  BOOL v15 = [(CARScreenViewArea *)self displaysTransitionControl];
  unint64_t v16 = [(CARScreenViewArea *)self statusBarEdge];
  BOOL v17 = [(CARScreenViewArea *)self supportsFocusTransfer];
  v18 = "no";
  if (v17) {
    v18 = "yes";
  }
  v19 = [v3 stringWithFormat:@"%@ {visibleFrame: %@ safeFrame: %@ displaysTransitionControl: %d statusBarEdge: %lu supportsFocusTransfer: %s}", v4, v9, v14, v15, v16, v18];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CARScreenViewArea *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CARScreenViewArea *)self isEqualToViewArea:v4];
  }

  return v5;
}

- (BOOL)isEqualToViewArea:(id)a3
{
  id v4 = a3;
  [(CARScreenViewArea *)self visibleFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 visibleFrame];
  v36.origin.x = v13;
  v36.origin.y = v14;
  v36.size.width = v15;
  v36.size.height = v16;
  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = v12;
  if (!CGRectEqualToRect(v34, v36)) {
    goto LABEL_6;
  }
  [(CARScreenViewArea *)self safeFrame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [v4 safeFrame];
  v37.origin.x = v25;
  v37.origin.y = v26;
  v37.size.width = v27;
  v37.size.height = v28;
  v35.origin.x = v18;
  v35.origin.y = v20;
  v35.size.width = v22;
  v35.size.height = v24;
  if (!CGRectEqualToRect(v35, v37)) {
    goto LABEL_6;
  }
  int v29 = [(CARScreenViewArea *)self displaysTransitionControl];
  if (v29 == [v4 displaysTransitionControl]
    && (unint64_t v30 = -[CARScreenViewArea statusBarEdge](self, "statusBarEdge"), v30 == [v4 statusBarEdge]))
  {
    BOOL v31 = [(CARScreenViewArea *)self supportsFocusTransfer];
    int v32 = v31 ^ [v4 supportsFocusTransfer] ^ 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v32) = 0;
  }

  return v32;
}

- (CGRect)visibleFrame
{
  double x = self->_visibleFrame.origin.x;
  double y = self->_visibleFrame.origin.y;
  double width = self->_visibleFrame.size.width;
  double height = self->_visibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)safeFrame
{
  double x = self->_safeFrame.origin.x;
  double y = self->_safeFrame.origin.y;
  double width = self->_safeFrame.size.width;
  double height = self->_safeFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)displaysTransitionControl
{
  return self->_displaysTransitionControl;
}

- (void)setDisplaysTransitionControl:(BOOL)a3
{
  self->_displaysTransitionControl = a3;
}

- (unint64_t)statusBarEdge
{
  return self->_statusBarEdge;
}

- (void)setStatusBarEdge:(unint64_t)a3
{
  self->_statusBarEdge = a3;
}

- (CGRect)unadjustedSafeFrame
{
  double x = self->_unadjustedSafeFrame.origin.x;
  double y = self->_unadjustedSafeFrame.origin.y;
  double width = self->_unadjustedSafeFrame.size.width;
  double height = self->_unadjustedSafeFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUnadjustedSafeFrame:(CGRect)a3
{
  self->_unadjustedSafeFrame = a3;
}

- (BOOL)supportsFocusTransfer
{
  return self->_supportsFocusTransfer;
}

- (void)setSupportsFocusTransfer:(BOOL)a3
{
  self->_supportsFocusTransfer = a3;
}

- (BOOL)supportsUIOutsideSafeArea
{
  return self->_supportsUIOutsideSafeArea;
}

- (void)setSupportsUIOutsideSafeArea:(BOOL)a3
{
  self->_supportsUIOutsideSafeArea = a3;
}

- (BOOL)shouldApplyDisplayInsets
{
  return self->_shouldApplyDisplayInsets;
}

- (void)setShouldApplyDisplayInsets:(BOOL)a3
{
  self->_shouldApplyDisplayInsets = a3;
}

- (NSEdgeInsets)additionalInsets
{
  double top = self->_additionalInsets.top;
  double left = self->_additionalInsets.left;
  double bottom = self->_additionalInsets.bottom;
  double right = self->_additionalInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAdditionalInsets:(NSEdgeInsets)a3
{
  self->_additionalInsets = a3;
}

- (CARDisplayInfoProviding)displayInfoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayInfoProvider);
  return (CARDisplayInfoProviding *)WeakRetained;
}

- (void)setDisplayInfoProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithPropertySupplier:(uint64_t)a3 additionalInsets:(uint64_t)a4 viewAreaDictionary:(uint64_t)a5 wantsCornerMasks:(uint64_t)a6 displayInfoProvider:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end