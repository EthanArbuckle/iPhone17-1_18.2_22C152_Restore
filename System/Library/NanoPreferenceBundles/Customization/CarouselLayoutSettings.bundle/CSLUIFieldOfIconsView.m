@interface CSLUIFieldOfIconsView
- ($153C3A5BC4E016D58A1B9CA554FFC462)originalLayoutAttributesForHex:(Hex)a3;
- (BOOL)isDragging;
- (BOOL)isEditing;
- (BOOL)isPressing;
- (BOOL)scrollEnabled;
- (CGPoint)contentOffset;
- (CGPoint)contentOffsetToCenterHex:(Hex)a3;
- (CGPoint)inertialUpdater:(id)a3 willDecelerateWithTarget:(CGPoint)a4;
- (CSLHexAppNode)draggingNode;
- (CSLHexAppNode)lastTouchedNode;
- (CSLHexLayout)layout;
- (CSLLauncherViewModeDelegate)launcherDelegate;
- (CSLUIFieldOfIconsView)initWithFrame:(CGRect)a3;
- (CSLUIFieldOfIconsView)initWithFrame:(CGRect)a3 iconGraph:(id)a4 viewFactory:(id)a5 options:(unint64_t)a6;
- (CSLUIFieldOfIconsViewScrollDelegate)scrollDelegate;
- (CSLUIHexIconActionDelegate)actionDelegate;
- (Hex)centeredHex;
- (Hex)closestIconHexToHex:(Hex)a3;
- (Hex)targetHex;
- (NSString)targetBundleIdentifier;
- (double)defaultPixelDiameter;
- (id).cxx_construct;
- (id)createApplierToAnimateToContentOffset:(CGPoint)a3;
- (id)iconViewForBundleIdentifier:(id)a3;
- (id)scrolledCenterBundleIdentifier;
- (void)PPTPanAround:(id)a3 panDistance:(double)a4 panCount:(int64_t)a5;
- (void)autoScroll;
- (void)dealloc;
- (void)enableGestureRecognizers:(BOOL)a3;
- (void)endDragging;
- (void)endPressing;
- (void)enumerateIconViewsWithBlock:(id)a3;
- (void)forceIconAttributesAndSubviewForView:(id)a3;
- (void)handleIconTap:(id)a3;
- (void)handlePanGesture:(id)a3;
- (void)handlePinch:(id)a3;
- (void)hexAppGraph:(id)a3 addedNodes:(id)a4 removedNodes:(id)a5 movedNodes:(id)a6;
- (void)inertialUpdaterFinishedScrolling:(id)a3;
- (void)layoutAnimated:(BOOL)a3;
- (void)layoutIconView:(id)a3 forcedApply:(BOOL)a4 forcedSubview:(BOOL)a5;
- (void)layoutIconsForcedApply:(BOOL)a3 forcedSubview:(BOOL)a4;
- (void)layoutSubviews;
- (void)pressStateApplierDidUpdate;
- (void)setActionDelegate:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setLauncherDelegate:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLayout:(id)a3 animated:(BOOL)a4;
- (void)setLayout:(id)a3 percentComplete:(double)a4 animated:(BOOL)a5 options:(unint64_t)a6;
- (void)setScrollDelegate:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setTargetBundleIdentifier:(id)a3;
- (void)setTargetHexToScrolledCenterForReason:(id)a3;
- (void)updatePPT:(id)a3;
@end

@implementation CSLUIFieldOfIconsView

- (CSLUIFieldOfIconsView)initWithFrame:(CGRect)a3 iconGraph:(id)a4 viewFactory:(id)a5 options:(unint64_t)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  v74.receiver = self;
  v74.super_class = (Class)CSLUIFieldOfIconsView;
  v15 = -[CSLUIFieldOfIconsView initWithFrame:](&v74, "initWithFrame:", x, y, width, height);
  v16 = v15;
  uint64_t v17 = (uint64_t)v15;
  if (v15)
  {
    v15->_options = 0;
    id v18 = objc_storeWeak((id *)&v15->_iconGraph, v13);
    [v13 setDelegate:v17];

    id v19 = objc_storeWeak((id *)&v16->_viewFactory, v14);
    [v14 defaultPixelDiameter];
    *(void *)(v17 + 64) = v20;

    v21 = [CSLUniformHexLayout alloc];
    __asm { FMOV            V8.2S, #1.0 }
    v67[0] = 0;
    v67[1] = _D8;
    v67[2] = 0;
    v67[3] = _D8;
    float v27 = *(double *)(v17 + 64);
    float v68 = v27;
    int v69 = 0x40000000;
    int32x2_t v70 = vdup_n_s32(0x43960000u);
    int v28 = (int)v27;
    float v29 = (float)(v27 * 0.5) + 2.5;
    if (v28 < 35) {
      int v30 = 1;
    }
    else {
      int v30 = v28 / 35;
    }
    float v71 = v29 + (float)((float)v30 * 5.0);
    float32x2_t v72 = vmul_f32(vrndm_f32((float32x2_t)vdup_lane_s32((int32x2_t)COERCE_UNSIGNED_INT((float)(v71 * 0.0) + (float)(v71 * 0.0)), 0)), (float32x2_t)0x3F0000003F000000);
    float32x2_t v73 = v72;
    v31 = [(CSLUniformHexLayout *)v21 initWithConfiguration:v67];
    v32 = *(void **)(v17 + 72);
    *(void *)(v17 + 72) = v31;

    id WeakRetained = objc_loadWeakRetained((id *)&v16->_iconGraph);
    v34 = [WeakRetained nodeAtHex:0];
    uint64_t v35 = [v34 bundleIdentifier];
    v36 = *(void **)(v17 + 368);
    *(void *)(v17 + 368) = v35;

    uint64_t v37 = +[NSMutableDictionary dictionary];
    v38 = *(void **)(v17 + 32);
    *(void *)(v17 + 32) = v37;

    *(unsigned char *)(v17 + 168) = 0;
    *(void *)(v17 + 176) = 0;
    [(id)v17 setAutoresizingMask:18];
    id v39 = objc_alloc_init((Class)UIView);
    v40 = *(void **)(v17 + 16);
    *(void *)(v17 + 16) = v39;

    objc_msgSend((id)v17, "addSubview:", *(void *)(v17 + 16), sub_5E98(v17));
    *(CGPoint *)(v17 + 112) = CGPointZero;
    *(CGPoint *)(v17 + 96) = CGPointZero;
    sub_6090(v17);
    v41 = objc_alloc_init(CSLUIInertialUpdater);
    v42 = *(void **)(v17 + 88);
    *(void *)(v17 + 88) = v41;

    [*(id *)(v17 + 88) setDelegate:v17];
    v43 = [[CSLIconTapGestureRecognizer alloc] initWithTarget:v17 action:"handleIconTap:"];
    v44 = *(void **)(v17 + 192);
    *(void *)(v17 + 192) = v43;

    [*(id *)(v17 + 192) setEnabled:0];
    [(id)v17 addGestureRecognizer:*(void *)(v17 + 192)];
    v45 = [[CSLPanGestureRecognizer alloc] initWithTarget:v17 action:"handlePanGesture:"];
    v46 = *(void **)(v17 + 80);
    *(void *)(v17 + 80) = v45;

    [(id)v17 addGestureRecognizer:*(void *)(v17 + 80)];
    id v47 = [objc_alloc((Class)UIPinchGestureRecognizer) initWithTarget:v17 action:"handlePinch:"];
    v48 = *(void **)(v17 + 264);
    *(void *)(v17 + 264) = v47;

    [*(id *)(v17 + 264) setEnabled:0];
    [(id)v17 addGestureRecognizer:*(void *)(v17 + 264)];
    *(unsigned char *)(v17 + 56) = 0;
    v49 = [CSLScrollableUniformHexLayout alloc];
    uint64_t v58 = 0;
    uint64_t v59 = _D8;
    uint64_t v60 = 0;
    uint64_t v61 = _D8;
    *(float *)&unsigned int v50 = *(double *)(v17 + 64);
    uint64_t v62 = v50 | 0x4000000000000000;
    int32x2_t v63 = vdup_n_s32(0x43960000u);
    float v51 = (float)(*(float *)&v50 * 0.5) + 2.5;
    int v52 = (int)*(float *)&v50;
    float v53 = 1.0;
    if (v52 >= 35) {
      float v53 = (float)(v52 / 0x23u);
    }
    float v64 = v51 + (float)(v53 * 5.0);
    float32x2_t v65 = vmul_f32(vrndm_f32((float32x2_t)vdup_lane_s32((int32x2_t)COERCE_UNSIGNED_INT((float)(v64 * 0.0) + (float)(v64 * 0.0)), 0)), (float32x2_t)0x3F0000003F000000);
    float32x2_t v66 = v65;
    v54 = [(CSLUniformHexLayout *)v49 initWithConfiguration:&v58];
    objc_msgSend((id)v17, "setLayout:percentComplete:animated:options:", v54, 0, a6, 0.0, v58, v59, v60, v61, v62, *(void *)&v63);

    uint64_t v55 = objc_opt_new();
    v56 = *(void **)(v17 + 216);
    *(void *)(v17 + 216) = v55;

    [*(id *)(v17 + 216) setDelegate:v17];
  }

  return (CSLUIFieldOfIconsView *)v17;
}

- (CSLUIFieldOfIconsView)initWithFrame:(CGRect)a3
{
  return -[CSLUIFieldOfIconsView initWithFrame:iconGraph:viewFactory:options:](self, "initWithFrame:iconGraph:viewFactory:options:", 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  [(CSLUIInertialUpdater *)self->_inertialUpdater setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CSLUIFieldOfIconsView;
  [(CSLUIFieldOfIconsView *)&v3 dealloc];
}

- (void)setTargetBundleIdentifier:(id)a3
{
  id v5 = a3;
  v6 = cslprf_ui_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_iconGraph);
    v8 = [WeakRetained nodeWithBundleIdentifier:self->_targetBundleIdentifier];
    id v9 = objc_loadWeakRetained((id *)&self->_iconGraph);
    v10 = [v9 nodeWithBundleIdentifier:v5];
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&def_1A578, v6, OS_LOG_TYPE_INFO, "changing locked target %@ to %@", (uint8_t *)&v13, 0x16u);
  }
  Hex v11 = [(CSLUIFieldOfIconsView *)self targetHex];
  objc_storeStrong((id *)&self->_targetBundleIdentifier, a3);
  Hex v12 = [(CSLUIFieldOfIconsView *)self targetHex];
  [(CSLHexLayout *)self->_layout setTargetHex:v12];
  if (v11 != v12) {
    [(CSLUIFieldOfIconsView *)self setNeedsLayout];
  }
}

- (Hex)targetHex
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconGraph);
  v4 = [WeakRetained nodeWithBundleIdentifier:self->_targetBundleIdentifier];
  id v5 = [v4 hex];

  return (Hex)v5;
}

- (Hex)centeredHex
{
  return (Hex)sub_64C0(self, CGPointZero.x, CGPointZero.y);
}

- (void)setScrollEnabled:(BOOL)a3
{
  self->_scrollEnabled = a3;
  -[CSLPanGestureRecognizer setEnabled:](self->_panRecognizer, "setEnabled:");
}

- (id)iconViewForBundleIdentifier:(id)a3
{
  objc_super v3 = [(NSMutableDictionary *)self->_iconViewDict objectForKeyedSubscript:a3];

  return v3;
}

- (void)enumerateIconViewsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    iconViewDict = self->_iconViewDict;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_68F8;
    v7[3] = &unk_3C898;
    id v8 = v4;
    [(NSMutableDictionary *)iconViewDict enumerateKeysAndObjectsUsingBlock:v7];
  }
}

- (void)hexAppGraph:(id)a3 addedNodes:(id)a4 removedNodes:(id)a5 movedNodes:(id)a6
{
  id v32 = a4;
  id v31 = a5;
  id v9 = a6;
  layout = self->_layout;
  [(CSLUIFieldOfIconsView *)self bounds];
  -[CSLHexLayout updateWithBounds:](layout, "updateWithBounds:");
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v11 = v32;
  id v12 = [v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v52;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v11);
        }
        __int16 v15 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)v14) bundleIdentifier];
        v16 = [(CSLUIFieldOfIconsView *)self iconViewForBundleIdentifier:v15];
        [(CSLUIFieldOfIconsView *)self forceIconAttributesAndSubviewForView:v16];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v12);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v17 = v31;
  id v18 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v48;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)v20) bundleIdentifier];
        v22 = [(CSLUIFieldOfIconsView *)self iconViewForBundleIdentifier:v21];
        [(CSLUIFieldOfIconsView *)self forceIconAttributesAndSubviewForView:v22];

        uint64_t v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v18);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v23 = v9;
  id v24 = [v23 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v44;
    do
    {
      v26 = 0;
      do
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(v23);
        }
        float v27 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)v26) bundleIdentifier];
        int v28 = [(CSLUIFieldOfIconsView *)self iconViewForBundleIdentifier:v27];
        [(CSLUIFieldOfIconsView *)self forceIconAttributesAndSubviewForView:v28];

        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v23 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v24);
  }

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_6E70;
  v41[4] = sub_6E80;
  sub_6E88(self, v11);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_6E70;
  v39[4] = sub_6E80;
  id v40 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_7090;
  v34[3] = &unk_3C8C0;
  v34[4] = self;
  uint64_t v37 = v41;
  v38 = v39;
  id v29 = v17;
  id v35 = v29;
  id v30 = v23;
  id v36 = v30;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_772C;
  v33[3] = &unk_3C8E8;
  v33[4] = self;
  v33[5] = v39;
  +[UIView _animateUsingDefaultTimingWithOptions:4 animations:v34 completion:v33];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

- (void)setLayout:(id)a3 percentComplete:(double)a4 animated:(BOOL)a5 options:(unint64_t)a6
{
  BOOL v7 = a5;
  id v11 = (CSLHexLayout *)a3;
  [(CSLHexLayout *)v11 defaultPixelDiameter];
  double v13 = v12;
  if (self->_defaultPixelDiameter != v12)
  {
    self->_defaultPixelDiameter = v12;
    id v14 = [CSLUniformHexLayout alloc];
    __asm { FMOV            V1.2S, #1.0 }
    v40[0] = 0;
    v40[1] = _D1;
    v40[2] = 0;
    v40[3] = _D1;
    float v20 = v13;
    float v41 = v20;
    int v42 = 0x40000000;
    int32x2_t v43 = vdup_n_s32(0x43960000u);
    int v21 = (int)v20;
    float v22 = (float)(v20 * 0.5) + 2.5;
    if (v21 < 35) {
      int v23 = 1;
    }
    else {
      int v23 = v21 / 35;
    }
    float v44 = v22 + (float)((float)v23 * 5.0);
    float32x2_t v45 = vmul_f32(vrndm_f32((float32x2_t)vdup_lane_s32((int32x2_t)COERCE_UNSIGNED_INT((float)(v44 * 0.0) + (float)(v44 * 0.0)), 0)), (float32x2_t)0x3F0000003F000000);
    float32x2_t v46 = v45;
    id v24 = [(CSLUniformHexLayout *)v14 initWithConfiguration:v40];
    contentOffsetLayout = self->_contentOffsetLayout;
    self->_contentOffsetLayout = v24;
  }
  [(CSLUIPointAnimator *)self->_contentOffsetAnimator cancel];
  unint64_t options = self->_options;
  unsigned int v27 = [(CSLUIFieldOfIconsView *)self isEditing];
  unsigned __int8 v36 = sub_652C((uint64_t)self);
  p_layout = &self->_layout;
  layout = self->_layout;
  if (layout == v11)
  {
    self->_unint64_t options = a6;
  }
  else
  {
    if ([(CSLUIFieldOfIconsView *)self isDragging]) {
      [(CSLUIFieldOfIconsView *)self endDragging];
    }
    [(CSLHexLayout *)*p_layout setRubberbandVector:0.0];
    self->_unint64_t options = a6;
    [(CSLUIInertialUpdater *)self->_inertialUpdater endUpdating];
    objc_storeStrong((id *)&self->_layout, a3);
    [(CSLHexLayout *)*p_layout setTargetHex:sub_7D88((uint64_t)self, (unint64_t)[(CSLUIFieldOfIconsView *)self targetHex])];
    id v30 = *p_layout;
    [(CSLUIFieldOfIconsView *)self bounds];
    -[CSLHexLayout updateWithBounds:](v30, "updateWithBounds:");
    [(CSLHexLayout *)*p_layout contentOffset];
    self->_contentOffset.double x = v31;
    self->_contentOffset.double y = v32;
  }
  [(CSLUIFieldOfIconsView *)self enableGestureRecognizers:vabdd_f64(a4, (double)(int)a4) < 0.00000011920929];
  [(CSLHexLayout *)*p_layout percentComplete];
  if ((CSLPRFEqual() & 1) == 0)
  {
    [(CSLHexLayout *)*p_layout setPercentComplete:a4];
    [(CSLUIFieldOfIconsView *)self setNeedsLayout];
  }
  unint64_t v33 = self->_options;
  if (((options >> 4) & 1) != ((v33 >> 4) & 1))
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_7E38;
    v37[3] = &unk_3C930;
    unsigned __int8 v38 = v36;
    char v39 = (v33 & 0x10) >> 4;
    [(CSLUIFieldOfIconsView *)self enumerateIconViewsWithBlock:v37];
  }
  if (layout != v11) {
    [(CSLUIFieldOfIconsView *)self layoutAnimated:v7];
  }
  if (!v7) {
    [(CSLUIFieldOfIconsView *)self layoutIfNeeded];
  }
  unsigned int v34 = [(CSLUIFieldOfIconsView *)self isEditing];
  double v35 = 0.2;
  if (!v34) {
    double v35 = 0.75;
  }
  [(CSLIconTapGestureRecognizer *)self->_tapRecognizer setLongPressDuration:v35];
  if (((v27 ^ 1 | v34) & 1) == 0) {
    [(CSLUIFieldOfIconsView *)self setTargetHexToScrolledCenterForReason:@"stopped editing"];
  }
  sub_5E98((uint64_t)self);
}

- (void)setLayout:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = (CSLHexLayout *)a3;
  if (self) {
    [(CSLUIPointAnimator *)self->_contentOffsetAnimator cancel];
  }
  p_layout = (id *)&self->_layout;
  if (self->_layout != v11)
  {
    if ([(CSLUIFieldOfIconsView *)self isDragging]) {
      [(CSLUIFieldOfIconsView *)self endDragging];
    }
    [(CSLUIInertialUpdater *)self->_inertialUpdater endUpdating];
    objc_storeStrong((id *)&self->_layout, a3);
    id v8 = *p_layout;
    [(CSLUIFieldOfIconsView *)self bounds];
    objc_msgSend(v8, "updateWithBounds:");
    [*p_layout contentOffset];
    self->_contentOffset.double x = v9;
    self->_contentOffset.double y = v10;
    [(CSLUIFieldOfIconsView *)self layoutAnimated:v4];
  }
  if (!v4) {
    [(CSLUIFieldOfIconsView *)self layoutIfNeeded];
  }
}

- (void)layoutAnimated:(BOOL)a3
{
  if (a3)
  {
    sub_793C(self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_80BC;
    v4[3] = &unk_3C870;
    v4[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:4 animations:v4 completion:0];
  }
  else
  {
    [(CSLUIFieldOfIconsView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSLUIFieldOfIconsView;
  [(CSLUIFieldOfIconsView *)&v3 layoutSubviews];
  -[CSLUIFieldOfIconsView layoutIconsForcedApply:forcedSubview:](self, "layoutIconsForcedApply:forcedSubview:", 0, 0, sub_5E98((uint64_t)self));
}

- (void)layoutIconsForcedApply:(BOOL)a3 forcedSubview:(BOOL)a4
{
  layout = self->_layout;
  [(CSLUIFieldOfIconsView *)self bounds];
  -[CSLHexLayout updateWithBounds:](layout, "updateWithBounds:");
  [(CSLPressStateApplier *)self->_pressApplier prepareForLayout];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8284;
  v8[3] = &unk_3C958;
  v8[4] = self;
  BOOL v9 = a3;
  BOOL v10 = a4;
  [(CSLUIFieldOfIconsView *)self enumerateIconViewsWithBlock:v8];
  [(CSLPressStateApplier *)self->_pressApplier cleanupAfterLayout];
}

- (void)forceIconAttributesAndSubviewForView:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    [v4 layoutAttributes];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  [v5 applyLayoutAttributes:v8];
  v6 = [v5 superview];

  if (!v6)
  {
    BOOL v7 = [v5 node];
    [v7 hex];
    sub_66A4((uint64_t)self, v5);
  }
}

- (void)layoutIconView:(id)a3 forcedApply:(BOOL)a4 forcedSubview:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = [v8 node];
  id v10 = [v9 hex];
  if (![(CSLPressStateApplier *)self->_pressApplier isEnabledForHex:v10])
  {
    [(CSLUIFieldOfIconsView *)self originalLayoutAttributesForHex:v10];
    goto LABEL_5;
  }
  pressApplier = self->_pressApplier;
  if (pressApplier)
  {
    [(CSLPressStateApplier *)pressApplier layoutAttributesForHex:v10];
LABEL_5:
    long long v12 = v27[0];
    goto LABEL_6;
  }
  long long v12 = 0uLL;
  memset(v27, 0, sizeof(v27));
LABEL_6:
  long long v28 = *(_OWORD *)((char *)v27 + 12);
  int v29 = HIDWORD(v27[1]);
  int v24 = DWORD2(v12);
  uint64_t v23 = v12;
  long long v25 = *(_OWORD *)((char *)v27 + 12);
  int v26 = HIDWORD(v27[1]);
  objc_msgSend(v8, "setLayoutAttributes:", &v23, v12);
  if (*(float *)&v18.i32[2] < 0.2)
  {
    BOOL v13 = 0;
    goto LABEL_9;
  }
  uint32x2_t v14 = (uint32x2_t)vcgt_f32(vabs_f32(*(float32x2_t *)v18.i8), vadd_f32((float32x2_t)vdup_laneq_s32(v18, 2), (float32x2_t)qword_45E40));
  v14.i32[0] = vpmax_u32(v14, v14).u32[0];
  BOOL v13 = v14.i32[0] >= 0;
  if (v14.i32[0] < 0)
  {
LABEL_9:
    if (!v6) {
      goto LABEL_11;
    }
  }
  __int32 v20 = v18.i32[2];
  uint64_t v19 = v18.i64[0];
  long long v21 = v28;
  int v22 = v29;
  [v8 applyLayoutAttributes:&v19];
LABEL_11:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragView);
  BOOL v16 = WeakRetained == v8;

  if (!v16)
  {
    id v17 = [v8 superview];

    if (v13 != (v17 != 0))
    {
      if (!v13)
      {
        sub_8608((uint64_t)self, v8);
        goto LABEL_18;
      }
LABEL_17:
      sub_66A4((uint64_t)self, v8);
      goto LABEL_18;
    }
    if (v5 && !v17) {
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void)enableGestureRecognizers:(BOOL)a3
{
  self->_recognizersEnabled = a3;
  BOOL v5 = cslprf_fluidui_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_272BC(a3, v5);
  }

  sub_86E4((id *)&self->super.super.super.isa);
}

- (void)handlePanGesture:(id)a3
{
  id v4 = a3;
  if ([(CSLUIFieldOfIconsView *)self isDragging]) {
    sub_88CC((uint64_t)self, v4);
  }
  else {
    sub_8B6C((uint64_t)self, v4);
  }
}

- (void)pressStateApplierDidUpdate
{
}

- (BOOL)isPressing
{
  return [(CSLPressStateApplier *)self->_pressApplier isEnabled];
}

- (void)endPressing
{
  pressedIcon = self->_pressedIcon;
  self->_pressedIcon = 0;

  [(CSLPressStateApplier *)self->_pressApplier clearAllPresses];

  [(CSLUIFieldOfIconsView *)self setNeedsLayout];
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)originalLayoutAttributesForHex:(Hex)a3
{
  layout = self->_layout;
  if (layout)
  {
    [(CSLHexLayout *)layout layoutAttributesForItemAtHex:a3];
  }
  else
  {
    *($153C3A5BC4E016D58A1B9CA554FFC462 *)&v5.var0 = 0;
    *objc_super v3 = 0u;
    v3[1] = 0u;
  }
  return v5;
}

- (void)handleIconTap:(id)a3
{
  id v4 = a3;
  if (self) {
    [(CSLUIPointAnimator *)self->_contentOffsetAnimator cancel];
  }
  switch((unint64_t)[v4 state])
  {
    case 1uLL:
      [(CSLUIInertialUpdater *)self->_inertialUpdater endUpdating];
      [v4 locationInView:self->_contentView];
      id v7 = sub_64C0(self, v5, v6);
      self->_touchedHedouble x = (Hex)v7;
      *(_OWORD *)buf = 0u;
      long long v36 = 0u;
      [(CSLUIFieldOfIconsView *)self originalLayoutAttributesForHex:v7];
      if (0.0 >= 0.2)
      {
        uint32x2_t v26 = (uint32x2_t)vcgt_f32(vabs_f32(*(float32x2_t *)buf), vadd_f32((float32x2_t)vdup_laneq_s32(*(int32x4_t *)buf, 2), (float32x2_t)qword_45E40));
        BOOL v8 = vpmax_u32(v26, v26).i32[0] >= 0;
      }
      else
      {
        BOOL v8 = 0;
      }
      unsigned int v27 = cslprf_icon_field_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v32[0] = 67109376;
        v32[1] = [(CSLUIFieldOfIconsView *)self isEditing];
        __int16 v33 = 1024;
        BOOL v34 = v8;
        _os_log_impl(&def_1A578, v27, OS_LOG_TYPE_DEFAULT, "handleIconTap:stateBegan isEditing:%{BOOL}u isOnScreen:%{BOOL}u", (uint8_t *)v32, 0xEu);
      }

      if (v8)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_iconGraph);
        int v29 = [WeakRetained nodeAtHex:*(void *)&self->_touchedHex];

        sub_8C5C((uint64_t)self, v29);
      }
      goto LABEL_38;
    case 2uLL:
      unsigned int v9 = [v4 isLongPress];
      id v10 = [(CSLUIIconView *)self->_pressedIcon node];
      id v11 = cslprf_icon_field_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = [(CSLUIFieldOfIconsView *)self isEditing];
        id v13 = objc_loadWeakRetained((id *)&self->_dragView);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v12;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v9;
        *(_WORD *)&buf[14] = 1024;
        LODWORD(v36) = v13 == 0;
        WORD2(v36) = 2114;
        *(void *)((char *)&v36 + 6) = v10;
        _os_log_impl(&def_1A578, v11, OS_LOG_TYPE_DEFAULT, "handleIconTap:stateChanged isEditing:%{BOOL}u isLongPress:%{BOOL}u _dragView nil:%{BOOL}u, node:%{public}@", buf, 0x1Eu);
      }
      if (v9)
      {
        id v14 = objc_loadWeakRetained((id *)&self->_dragView);
        BOOL v15 = v14 == 0;

        if (v15)
        {
          sub_8F78((uint64_t)self, @"long press");
          id v16 = objc_loadWeakRetained((id *)&self->_actionDelegate);
          [v16 handleLongPress];

          [v4 locationInView:self];
          sub_9850(self, v10, v17, v18);
        }
      }
      goto LABEL_37;
    case 3uLL:
      id v10 = [(CSLUIIconView *)self->_pressedIcon node];
      unsigned int v19 = [v4 isLongPress];
      __int32 v20 = cslprf_icon_field_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = [(CSLUIFieldOfIconsView *)self isEditing];
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v19;
        *(_WORD *)&buf[14] = 2114;
        *(void *)&long long v36 = v10;
        _os_log_impl(&def_1A578, v20, OS_LOG_TYPE_DEFAULT, "handleIconTap:stateEnded isEditing:%{BOOL}u isLongPress:%{BOOL}u node:%{public}@", buf, 0x18u);
      }

      sub_8F78((uint64_t)self, @"touch up");
      if ([v4 isLongPress])
      {
        if (!self->_didPanDrag && [(CSLUIFieldOfIconsView *)self isDragging]) {
          [(CSLUIFieldOfIconsView *)self endDragging];
        }
      }
      else
      {
        if (v10)
        {
          id v30 = [v10 bundleIdentifier];
          if (v30)
          {
            [(CSLUIFieldOfIconsView *)self setTargetBundleIdentifier:v30];
            id v31 = objc_loadWeakRetained((id *)&self->_actionDelegate);
            [v31 tappedIconWithBundleIdentifier:v30];
          }
        }
        else
        {
          if ((self->_options & 0x40) == 0) {
            goto LABEL_37;
          }
          id v30 = objc_loadWeakRetained((id *)&self->_actionDelegate);
          [v30 tappedEmptyHex:*(void *)&self->_touchedHex];
        }
      }
LABEL_37:

LABEL_38:
      return;
    case 4uLL:
      unsigned int v21 = [(CSLUIFieldOfIconsView *)self isDragging];
      int v22 = cslprf_icon_field_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v23 = [(CSLUIFieldOfIconsView *)self isEditing];
        BOOL didPanDrag = self->_didPanDrag;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v23;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v21;
        *(_WORD *)&buf[14] = 1024;
        LODWORD(v36) = didPanDrag;
        _os_log_impl(&def_1A578, v22, OS_LOG_TYPE_DEFAULT, "handleIconTap:stateCancelled isEditing:%{BOOL}u isDragging:%{BOOL}u didPanDrag:%{BOOL}u", buf, 0x14u);
      }

      if (self->_didPanDrag) {
        unsigned int v25 = 0;
      }
      else {
        unsigned int v25 = v21;
      }
      if (v25 == 1) {
        [(CSLUIFieldOfIconsView *)self endDragging];
      }
      sub_8F78((uint64_t)self, @"gesture cancelled");
      goto LABEL_38;
    default:
      goto LABEL_38;
  }
}

- (void)handlePinch:(id)a3
{
  id v4 = a3;
  double v5 = (char *)[v4 state];
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == (unsigned char *)&def_1A578 + 1)
    {
      sub_793C(self);
    }
    else if (v5 != (unsigned char *)&def_1A578 + 2)
    {
      goto LABEL_8;
    }
    [v4 scale];
    CGFloat v7 = v6;
    BOOL v8 = [(CSLUIFieldOfIconsView *)self layer];
    CATransform3DMakeScale(&v10, v7, v7, 1.0);
    [v8 setTransform:&v10];
  }
  else
  {
    sub_793C(self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_9A88;
    v9[3] = &unk_3C870;
    v9[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:4 animations:v9 completion:0];
  }
LABEL_8:
}

- (CGPoint)inertialUpdater:(id)a3 willDecelerateWithTarget:(CGPoint)a4
{
  if ((self->_options & 0x20) != 0)
  {
    double v14 = -self->_rawTouchContentOffset.x;
    double v15 = -self->_rawTouchContentOffset.y;
  }
  else
  {
    CGFloat y = a4.y;
    CGFloat x = a4.x;
    unint64_t v24 = sub_9DCC(self, a4.x, a4.y);
    [(CSLUIFieldOfIconsView *)self contentOffsetToCenterHex:v24];
    double v8 = v7;
    double v10 = v9;
    double v11 = self->_rawTouchContentOffset.x;
    double v12 = self->_rawTouchContentOffset.y;
    id v13 = cslprf_ui_log();
    double v14 = v8 - v11;
    double v15 = v10 - v12;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      sub_A010((int *)&v24, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      CGFloat v19 = self->_rawTouchContentOffset.x;
      CGFloat v20 = self->_rawTouchContentOffset.y;
      CGFloat v22 = self->_contentOffset.x;
      CGFloat v21 = self->_contentOffset.y;
      *(_DWORD *)buf = 134220546;
      CGFloat v26 = x;
      __int16 v27 = 2048;
      CGFloat v28 = y;
      __int16 v29 = 2048;
      double v30 = v8;
      __int16 v31 = 2048;
      double v32 = v10;
      __int16 v33 = 2082;
      BOOL v34 = p_p;
      __int16 v35 = 2048;
      double v36 = v14;
      __int16 v37 = 2048;
      double v38 = v15;
      __int16 v39 = 2048;
      CGFloat v40 = v19;
      __int16 v41 = 2048;
      CGFloat v42 = v20;
      __int16 v43 = 2048;
      CGFloat v44 = v22;
      __int16 v45 = 2048;
      CGFloat v46 = v21;
      _os_log_debug_impl(&def_1A578, v13, OS_LOG_TYPE_DEBUG, "inertial updater: willDecelerateWithTarget:{%.4f, %.4f} to bestTargetPoint:{%.4f, %.4f} for hex:%{public}s resulting in clientTarget delta:{%.4f, %.4f} for current rawContentOffset:{%.4f, %.4f} contentOffset:{%.4f, %.4f}", buf, 0x70u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
  double v16 = v14;
  double v17 = v15;
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

- (void)inertialUpdaterFinishedScrolling:(id)a3
{
  if ((self->_options & 0x20) == 0) {
    [(CSLUIFieldOfIconsView *)self setTargetHexToScrolledCenterForReason:@"finishedScrolling"];
  }
}

- (void)setContentOffset:(CGPoint)a3
{
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
}

- (id)createApplierToAnimateToContentOffset:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  [(CSLUIInertialUpdater *)self->_inertialUpdater endUpdating];
  float32x2_t v4 = vcvt_f32_f64((float64x2_t)self->_contentOffset);
  v5.f64[0] = x;
  v5.f64[1] = y;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_A9D0;
  v10[3] = &unk_3C9D0;
  v10[5] = v4;
  v10[6] = vcvt_f32_f64(v5);
  v10[4] = self;
  double v6 = objc_retainBlock(v10);

  return v6;
}

- (id)scrolledCenterBundleIdentifier
{
  v2 = sub_AAA0((id *)&self->super.super.super.isa, (uint64_t)[(CSLUIFieldOfIconsView *)self centeredHex]);
  objc_super v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)setTargetHexToScrolledCenterForReason:(id)a3
{
  id v4 = a3;
  Hex v5 = [(CSLUIFieldOfIconsView *)self centeredHex];
  double v6 = sub_AAA0((id *)&self->super.super.super.isa, *(void *)&v5);
  if (v6)
  {
    double v7 = cslprf_icon_field_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138544130;
      id v10 = v4;
      __int16 v11 = 1024;
      int q = v5.q;
      __int16 v13 = 1024;
      int r = v5.r;
      __int16 v15 = 2114;
      double v16 = v6;
      _os_log_impl(&def_1A578, v7, OS_LOG_TYPE_DEFAULT, "Setting target hex to scrolled center reason:%{public}@ centeredHex:{%d,%d} node:%{public}@", (uint8_t *)&v9, 0x22u);
    }

    double v8 = [v6 bundleIdentifier];
    [(CSLUIFieldOfIconsView *)self setTargetBundleIdentifier:v8];
  }
  else
  {
    double v8 = cslprf_icon_field_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138544130;
      id v10 = v4;
      __int16 v11 = 1024;
      int q = v5.q;
      __int16 v13 = 1024;
      int r = v5.r;
      __int16 v15 = 2114;
      double v16 = 0;
      _os_log_error_impl(&def_1A578, v8, OS_LOG_TYPE_ERROR, "Cannot set target hex to scrolled center reason:%{public}@ centeredHex:{%d,%d} node:%{public}@", (uint8_t *)&v9, 0x22u);
    }
  }
}

- (void)autoScroll
{
  double y = CGPointZero.y;
  unint64_t autoScrollDirection = self->_autoScrollDirection;
  if (autoScrollDirection)
  {
    if (sub_B090((uint64_t)self, 1))
    {
      double v5 = -4.0;
      goto LABEL_8;
    }
    unint64_t autoScrollDirection = self->_autoScrollDirection;
  }
  if ((autoScrollDirection & 2) == 0 || !sub_B090((uint64_t)self, 2)) {
    return;
  }
  double v5 = 4.0;
LABEL_8:
  double v6 = y + v5;
  double v7 = CGPointZero.x + self->_contentOffset.x;
  double v8 = v6 + self->_contentOffset.y;

  -[CSLUIFieldOfIconsView setContentOffset:](self, "setContentOffset:", v7, v8);
}

- (CGPoint)contentOffsetToCenterHex:(Hex)a3
{
  unint64_t v4 = sub_7D88((uint64_t)self, *(void *)&a3);
  contentOffsetLayout = self->_contentOffsetLayout;
  if (contentOffsetLayout) {
    [(CSLUniformHexLayout *)contentOffsetLayout layoutAttributesForItemAtHex:v4];
  }
  unsigned int v6 = sub_652C((uint64_t)self);
  double v7 = 0.0;
  if (!v6) {
    double v7 = 0.0;
  }
  double v8 = 0.0;
  result.double y = v8;
  result.CGFloat x = v7;
  return result;
}

- (BOOL)isEditing
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (void)endDragging
{
  self->_BOOL didPanDrag = 0;
  sub_B028((uint64_t)self);
  p_dragView = &self->_dragView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragView);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_dragView);
    unsigned int v6 = [v5 node];

    id v7 = [v6 hex];
    id v8 = objc_loadWeakRetained((id *)&self->_iconGraph);
    [v8 moveNode:v6 toHex:v7 final:1];

    id v9 = objc_loadWeakRetained((id *)&self->_iconGraph);
    [v9 commitMovedNode:v6 withReason:2];

    id v10 = objc_loadWeakRetained((id *)&self->_dragView);
    [v10 center];
    -[CSLUIFieldOfIconsView convertPoint:toView:](self, "convertPoint:toView:", self->_contentView);
    double v12 = v11;
    double v14 = v13;

    contentView = self->_contentView;
    id v16 = objc_loadWeakRetained((id *)&self->_dragView);
    [(UIView *)contentView addSubview:v16];

    id v17 = objc_loadWeakRetained((id *)&self->_dragView);
    objc_msgSend(v17, "setCenter:", v12, v14);

    long long v21 = 0u;
    long long v22 = 0u;
    layout = self->_layout;
    if (layout) {
      [(CSLHexLayout *)layout layoutAttributesForItemAtHex:v7];
    }
    id v19 = objc_loadWeakRetained((id *)&self->_dragView);
    v20[0] = v21;
    v20[1] = v22;
    [v19 endDraggingToLayoutAttributes:v20];
  }
  objc_storeWeak((id *)p_dragView, 0);
}

- (BOOL)isDragging
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragView);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (CSLHexAppNode)draggingNode
{
  p_dragView = &self->_dragView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragView);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_dragView);
    id v5 = [v4 node];
  }
  else
  {
    id v5 = 0;
  }

  return (CSLHexAppNode *)v5;
}

- (Hex)closestIconHexToHex:(Hex)a3
{
  id v5 = [(CSLUIFieldOfIconsView *)self layout];
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 layoutAttributesForItemAtHex:a3];
    uint64_t v7 = v15;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = [(CSLUIFieldOfIconsView *)self layout];
  id v9 = v8;
  if (v8)
  {
    [v8 layoutAttributesForItemAtHex:a3];
    double v10 = v14;
  }
  else
  {
    double v10 = 0.0;
  }
  unint64_t v11 = sub_9DCC(self, v13, v10);

  return (Hex)v11;
}

- (void)updatePPT:(id)a3
{
  id v4 = a3;
  id v21 = v4;
  if (self->_pptPanStartTime == 0.0)
  {
    [v4 timestamp];
    self->_pptPanStartTime = v5;
    unsigned int v6 = +[UIApplication sharedApplication];
    [v6 startedTest:self->_pptPanTestName];

    id v4 = v21;
  }
  [v4 timestamp];
  double v8 = v7 - self->_pptPanStartTime;
  if (v8 >= (double)self->_pptPanCount)
  {
    id v16 = +[UIApplication sharedApplication];
    [v16 finishedTest:self->_pptPanTestName];

    pptPanDisplayLink = self->_pptPanDisplayLink;
    double v18 = +[NSRunLoop mainRunLoop];
    [(CADisplayLink *)pptPanDisplayLink removeFromRunLoop:v18 forMode:NSRunLoopCommonModes];

    id v19 = self->_pptPanDisplayLink;
    self->_pptPanDisplayLink = 0;

    pptPanTestName = self->_pptPanTestName;
    self->_pptPanTestName = 0;

    -[CSLUIFieldOfIconsView setContentOffset:](self, "setContentOffset:", self->_pptPanStartContentOffset.x, self->_pptPanStartContentOffset.y);
  }
  else
  {
    __double2 v9 = __sincos_stret(v8 * 3.14159265);
    double pptPanDistance = self->_pptPanDistance;
    double x = self->_pptPanStartContentOffset.x;
    double y = self->_pptPanStartContentOffset.y;
    unsigned int v13 = sub_652C((uint64_t)self);
    double v14 = x + v9.__sinval * pptPanDistance;
    double v15 = y + v9.__cosval * pptPanDistance;
    if (v13) {
      sub_A2C8((uint64_t)self, COERCE_FLOAT32X2_T(v14 - self->_rawTouchContentOffset.x), COERCE_FLOAT32X2_T(v15 - self->_rawTouchContentOffset.y));
    }
    else {
      -[CSLUIFieldOfIconsView setContentOffset:](self, "setContentOffset:", v14, v15);
    }
  }
}

- (void)PPTPanAround:(id)a3 panDistance:(double)a4 panCount:(int64_t)a5
{
  id v13 = a3;
  self->_pptPanStartTime = 0.0;
  self->_rawTouchContentOffset = self->_contentOffset;
  self->_pptPanStartContentOffset = self->_contentOffset;
  self->_double pptPanDistance = a4;
  objc_storeStrong((id *)&self->_pptPanTestName, a3);
  self->_pptPanCount = a5;
  __double2 v9 = +[CADisplayLink displayLinkWithTarget:self selector:"updatePPT:"];
  pptPanDisplayLink = self->_pptPanDisplayLink;
  self->_pptPanDisplayLink = v9;

  unint64_t v11 = self->_pptPanDisplayLink;
  double v12 = +[NSRunLoop mainRunLoop];
  [(CADisplayLink *)v11 addToRunLoop:v12 forMode:NSRunLoopCommonModes];
}

- (double)defaultPixelDiameter
{
  return self->_defaultPixelDiameter;
}

- (CSLHexAppNode)lastTouchedNode
{
  return self->_lastTouchedNode;
}

- (CSLUIHexIconActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (CSLUIHexIconActionDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (CSLLauncherViewModeDelegate)launcherDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launcherDelegate);

  return (CSLLauncherViewModeDelegate *)WeakRetained;
}

- (void)setLauncherDelegate:(id)a3
{
}

- (CSLUIFieldOfIconsViewScrollDelegate)scrollDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollDelegate);

  return (CSLUIFieldOfIconsViewScrollDelegate *)WeakRetained;
}

- (void)setScrollDelegate:(id)a3
{
}

- (NSString)targetBundleIdentifier
{
  return self->_targetBundleIdentifier;
}

- (CSLHexLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_targetBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_scrollDelegate);
  objc_destroyWeak((id *)&self->_launcherDelegate);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_lastTouchedNode, 0);
  objc_storeStrong((id *)&self->_pptPanTestName, 0);
  objc_storeStrong((id *)&self->_pptPanDisplayLink, 0);
  objc_storeStrong((id *)&self->_pinchRecognizer, 0);
  objc_destroyWeak((id *)&self->_dragView);
  objc_storeStrong((id *)&self->_pressApplier, 0);
  objc_storeStrong((id *)&self->_pressedIcon, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_contentOffsetAnimator, 0);
  objc_storeStrong((id *)&self->_autoScrollLink, 0);
  objc_storeStrong((id *)&self->_inertialUpdater, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_contentOffsetLayout, 0);
  objc_destroyWeak((id *)&self->_viewFactory);
  objc_destroyWeak((id *)&self->_iconGraph);
  objc_storeStrong((id *)&self->_iconViewDict, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (id).cxx_construct
{
  *((void *)self + 25) = 0;
  return self;
}

@end