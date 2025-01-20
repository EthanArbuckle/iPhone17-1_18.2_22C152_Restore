@interface CKTipKitOnboardingCollectionViewCell
+ (NSString)reuseIdentifier;
- (CALayer)packageLayer;
- (CAPackage)package;
- (CAStateController)stateController;
- (CKTipKitOnboardingCollectionViewCell)initWithFrame:(CGRect)a3;
- (NSArray)layerNames;
- (NSArray)recommendedPinningConversations;
- (NSMutableArray)avatarViews;
- (UIView)micaView;
- (UIView)tipUIView;
- (id)presentingViewControllerForAvatarView:(id)a3;
- (int64_t)state;
- (void)dealloc;
- (void)didUpdateContentForAvatarView:(id)a3;
- (void)prepareForReuse;
- (void)resetViews;
- (void)setAvatarViews:(id)a3;
- (void)setLayerNames:(id)a3;
- (void)setMicaView:(id)a3;
- (void)setPackage:(id)a3;
- (void)setPackageLayer:(id)a3;
- (void)setRecommendedPinningConversations:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateController:(id)a3;
- (void)setTipUIView:(id)a3;
- (void)setTipUIView:(id)a3 withRecommendedPinningConversations:(id)a4;
- (void)startAnimations;
- (void)stepThroughOnboardingTipAnimationForLayer:(id)a3;
- (void)stopAnimations;
- (void)updateTipAnimationIfNeeded;
@end

@implementation CKTipKitOnboardingCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"CKTipKitOnboardingCollectionViewCellIdentifier";
}

- (CKTipKitOnboardingCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKTipKitOnboardingCollectionViewCell;
  v3 = -[CKTipKitOnboardingCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    layerNames = v3->_layerNames;
    v3->_layerNames = (NSArray *)&unk_1EDF155F0;
  }
  return v4;
}

- (void)dealloc
{
  [(CKTipKitOnboardingCollectionViewCell *)self stopAnimations];
  [self->_tipUIView removeFromSuperview];
  tipUIView = self->_tipUIView;
  self->_tipUIView = 0;

  v4.receiver = self;
  v4.super_class = (Class)CKTipKitOnboardingCollectionViewCell;
  [(CKTipKitOnboardingCollectionViewCell *)&v4 dealloc];
}

- (UIView)micaView
{
  micaView = self->_micaView;
  if (!micaView)
  {
    objc_super v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v5 = self->_micaView;
    self->_micaView = v4;

    [(UIView *)self->_micaView setAutoresizingMask:18];
    micaView = self->_micaView;
  }

  return micaView;
}

- (NSMutableArray)avatarViews
{
  avatarViews = self->_avatarViews;
  if (!avatarViews)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_layerNames, "count"));
    objc_super v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_avatarViews;
    self->_avatarViews = v4;

    avatarViews = self->_avatarViews;
  }

  return avatarViews;
}

- (CAStateController)stateController
{
  stateController = self->_stateController;
  if (!stateController)
  {
    objc_super v4 = (CAStateController *)[objc_alloc(MEMORY[0x1E4F39CB0]) initWithLayer:self->_packageLayer];
    v5 = self->_stateController;
    self->_stateController = v4;

    LODWORD(v6) = 1.0;
    [(CAStateController *)self->_stateController setInitialStatesOfLayer:self->_packageLayer transitionSpeed:v6];
    stateController = self->_stateController;
  }

  return stateController;
}

- (CAPackage)package
{
  package = self->_package;
  if (!package)
  {
    objc_super v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 URLForResource:@"PinningTipAnimation" withExtension:@"ca"];

    double v6 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v5 type:*MEMORY[0x1E4F3A4C0] options:0 error:0];
    objc_super v7 = self->_package;
    self->_package = v6;

    package = self->_package;
  }

  return package;
}

- (void)prepareForReuse
{
  [(CKTipKitOnboardingCollectionViewCell *)self stopAnimations];
  v3.receiver = self;
  v3.super_class = (Class)CKTipKitOnboardingCollectionViewCell;
  [(CKTipKitOnboardingCollectionViewCell *)&v3 prepareForReuse];
}

- (void)startAnimations
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  id v3 = [(CKTipKitOnboardingCollectionViewCell *)self packageLayer];
  [(CKTipKitOnboardingCollectionViewCell *)self stepThroughOnboardingTipAnimationForLayer:v3];
}

- (void)stopAnimations
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  id v3 = [(CKTipKitOnboardingCollectionViewCell *)self stateController];
  [v3 cancelTimers];
}

- (void)resetViews
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_micaView)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = self->_avatarViews;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7++), "removeFromSuperview", (void)v12);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    v8 = [(CKTipKitOnboardingCollectionViewCell *)self packageLayer];
    [v8 removeFromSuperlayer];

    [(UIView *)self->_micaView removeFromSuperview];
    stateController = self->_stateController;
    self->_stateController = 0;

    avatarViews = self->_avatarViews;
    self->_avatarViews = 0;

    micaView = self->_micaView;
    self->_micaView = 0;
  }
}

- (void)setTipUIView:(id)a3 withRecommendedPinningConversations:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CKTipKitOnboardingCollectionViewCell *)self tipUIView];

  if (v7 != v8)
  {
    [(CKTipKitOnboardingCollectionViewCell *)self resetViews];
    [(CKTipKitOnboardingCollectionViewCell *)self setTipUIView:v8];
    [(CKTipKitOnboardingCollectionViewCell *)self setRecommendedPinningConversations:v6];
    [(CKTipKitOnboardingCollectionViewCell *)self stopAnimations];
    [(CKTipKitOnboardingCollectionViewCell *)self updateTipAnimationIfNeeded];
  }
}

- (void)updateTipAnimationIfNeeded
{
  v86[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(CKTipKitOnboardingCollectionViewCell *)self recommendedPinningConversations];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    id v6 = +[CKUIBehavior sharedBehaviors];
    [v6 tipCellCornerRadius];
    double v8 = v7;
    v9 = [v5 layer];
    [v9 setCornerRadius:v8];

    v10 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
    [v5 setBackgroundColor:v10];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(CKTipKitOnboardingCollectionViewCell *)self contentView];
    [v11 addSubview:v5];
    v62 = (void *)MEMORY[0x1E4F28DC8];
    v78 = [v5 topAnchor];
    v77 = [v11 topAnchor];
    v74 = [v78 constraintEqualToAnchor:v77];
    v86[0] = v74;
    v71 = [v5 bottomAnchor];
    v68 = [v11 bottomAnchor];
    v65 = [v71 constraintEqualToAnchor:v68];
    v86[1] = v65;
    long long v12 = [v5 leadingAnchor];
    long long v13 = [v11 leadingAnchor];
    long long v14 = +[CKUIBehavior sharedBehaviors];
    [v14 tipCellLeadingInset];
    long long v15 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13);
    v86[2] = v15;
    v81 = v5;
    v16 = [v5 trailingAnchor];
    v80 = v11;
    uint64_t v17 = [v11 trailingAnchor];
    v18 = +[CKUIBehavior sharedBehaviors];
    [v18 tipCellTrailingInset];
    v19 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);
    v86[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:4];
    [v62 activateConstraints:v20];

    v21 = +[CKUIBehavior sharedBehaviors];
    [v21 tipCellMicaAnimationSize];
    double v23 = v22;

    id v24 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(v24, "setBounds:", 0.0, 0.0, v23, v23);
    [v24 setClipsToBounds:0];
    v25 = [(CKTipKitOnboardingCollectionViewCell *)self micaView];
    [v24 bounds];
    objc_msgSend(v25, "setFrame:");

    v26 = [(CKTipKitOnboardingCollectionViewCell *)self micaView];
    [v24 addSubview:v26];

    v27 = [(CKTipKitOnboardingCollectionViewCell *)self recommendedPinningConversations];
    unint64_t v28 = [v27 count];
    v29 = self;
    v30 = [(CKTipKitOnboardingCollectionViewCell *)self layerNames];
    unint64_t v31 = [v30 count];

    if (v28 >= v31)
    {
      v32 = [(CKTipKitOnboardingCollectionViewCell *)self package];
      v33 = [v32 rootLayer];
      [(CKTipKitOnboardingCollectionViewCell *)self setPackageLayer:v33];

      v34 = [(CKTipKitOnboardingCollectionViewCell *)self packageLayer];
      [v34 setGeometryFlipped:1];

      v35 = [(CKTipKitOnboardingCollectionViewCell *)self packageLayer];
      objc_msgSend(v35, "setPosition:", v23 * 0.5, v23 * 0.5);

      v36 = [(CKTipKitOnboardingCollectionViewCell *)self micaView];
      v37 = [v36 layer];
      v38 = [(CKTipKitOnboardingCollectionViewCell *)self packageLayer];
      [v37 addSublayer:v38];

      v39 = [(CKTipKitOnboardingCollectionViewCell *)self recommendedPinningConversations];
      v40 = [(CKTipKitOnboardingCollectionViewCell *)self layerNames];
      v41 = objc_msgSend(v39, "subarrayWithRange:", 0, objc_msgSend(v40, "count"));

      v42 = [(CKTipKitOnboardingCollectionViewCell *)self layerNames];
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __66__CKTipKitOnboardingCollectionViewCell_updateTipAnimationIfNeeded__block_invoke;
      v82[3] = &unk_1E56286F0;
      v82[4] = self;
      id v83 = v41;
      id v79 = v41;
      [v42 enumerateObjectsUsingBlock:v82];

      [v81 addSubview:self->_tipUIView];
      [v81 addSubview:v24];
      v43 = +[CKUIBehavior sharedBehaviors];
      [v43 tipCellMicaAnimationPadding];
      double v45 = v44;

      v63 = (void *)MEMORY[0x1E4F28DC8];
      v75 = [v24 leadingAnchor];
      v72 = [v81 leadingAnchor];
      v69 = [v75 constraintEqualToAnchor:v72 constant:v45];
      v85[0] = v69;
      v66 = [v24 topAnchor];
      v46 = [v81 topAnchor];
      v47 = [v66 constraintEqualToAnchor:v46 constant:v45];
      v85[1] = v47;
      v48 = [v24 widthAnchor];
      v49 = [v48 constraintEqualToConstant:v23];
      v85[2] = v49;
      v50 = [v24 heightAnchor];
      v51 = [v50 constraintEqualToConstant:v23];
      v85[3] = v51;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:4];
      [v63 activateConstraints:v52];

      v64 = (void *)MEMORY[0x1E4F28DC8];
      v76 = [v29->_tipUIView topAnchor];
      v73 = [v81 topAnchor];
      v70 = [v76 constraintEqualToAnchor:v73];
      v84[0] = v70;
      v67 = [v29->_tipUIView bottomAnchor];
      v53 = [v81 bottomAnchor];
      v54 = [v67 constraintEqualToAnchor:v53];
      v84[1] = v54;
      v55 = [v29->_tipUIView leadingAnchor];
      v56 = [v24 trailingAnchor];
      v57 = [v55 constraintEqualToAnchor:v56];
      v84[2] = v57;
      v58 = [v29->_tipUIView trailingAnchor];
      v59 = [v81 trailingAnchor];
      v60 = [v58 constraintEqualToAnchor:v59];
      v84[3] = v60;
      v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:4];
      [v64 activateConstraints:v61];
    }
  }
}

void __66__CKTipKitOnboardingCollectionViewCell_updateTipAnimationIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 package];
  id v15 = [v7 publishedObjectWithName:v6];

  double v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  uint64_t v9 = [MEMORY[0x1E4F1BB38] maxContactAvatars];
  v10 = [v8 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:v9];
  v11 = objc_alloc_init(CKAvatarView);
  id v12 = [(CNAvatarView *)v11 updateViewWithGroupIdentity:v10];
  [(CNAvatarView *)v11 setAsynchronousRendering:1];
  [(CKAvatarView *)v11 setUserInteractionEnabled:0];
  [(CNAvatarView *)v11 setShowsContactOnTap:0];
  [(CNAvatarView *)v11 setDelegate:*(void *)(a1 + 32)];
  [(CKAvatarView *)v11 sizeToFit];
  [v15 bounds];
  -[CKAvatarView setFrame:](v11, "setFrame:");
  long long v13 = [*(id *)(a1 + 32) avatarViews];
  [v13 addObject:v11];

  long long v14 = [*(id *)(a1 + 32) micaView];
  [v14 addSubview:v11];
}

- (void)setTipUIView:(id)a3
{
  id v5 = (UIView *)a3;
  p_tipUIView = &self->_tipUIView;
  if (*p_tipUIView != v5)
  {
    double v7 = v5;
    [*p_tipUIView removeFromSuperview];
    objc_storeStrong((id *)p_tipUIView, a3);
    id v5 = v7;
  }
}

- (void)stepThroughOnboardingTipAnimationForLayer:(id)a3
{
  id v4 = a3;
  if ([(CKTipKitOnboardingCollectionViewCell *)self state] == 4)
  {
    double v5 = 0.0;
    float v6 = 0.0;
    int64_t v7 = 1;
  }
  else
  {
    int64_t v7 = [(CKTipKitOnboardingCollectionViewCell *)self state] + 1;
    double v5 = 2.5;
    float v6 = 1.0;
  }
  [(CKTipKitOnboardingCollectionViewCell *)self setState:v7];
  double v8 = objc_msgSend(NSString, "stringWithFormat:", @"State %ld", -[CKTipKitOnboardingCollectionViewCell state](self, "state"));
  id v11 = [v4 stateWithName:v8];

  uint64_t v9 = [(CKTipKitOnboardingCollectionViewCell *)self stateController];
  *(float *)&double v10 = v6;
  [v9 setState:v11 ofLayer:v4 transitionSpeed:v10];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(CKTipKitOnboardingCollectionViewCell *)self performSelector:sel_stepThroughOnboardingTipAnimationForLayer_ withObject:v4 afterDelay:v5];
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return 0;
}

- (void)didUpdateContentForAvatarView:(id)a3
{
  id v13 = a3;
  id v4 = [(CKTipKitOnboardingCollectionViewCell *)self avatarViews];
  unint64_t v5 = [v4 indexOfObject:v13];

  float v6 = [(CKTipKitOnboardingCollectionViewCell *)self layerNames];
  unint64_t v7 = [v6 count];

  if (v7 > v5)
  {
    double v8 = [(CKTipKitOnboardingCollectionViewCell *)self package];
    uint64_t v9 = [(CKTipKitOnboardingCollectionViewCell *)self layerNames];
    double v10 = [v9 objectAtIndexedSubscript:v5];
    id v11 = [v8 publishedObjectWithName:v10];

    id v12 = [v13 layer];
    [v11 addSublayer:v12];
  }
}

- (UIView)tipUIView
{
  return self->_tipUIView;
}

- (NSArray)recommendedPinningConversations
{
  return self->_recommendedPinningConversations;
}

- (void)setRecommendedPinningConversations:(id)a3
{
}

- (void)setPackage:(id)a3
{
}

- (CALayer)packageLayer
{
  return self->_packageLayer;
}

- (void)setPackageLayer:(id)a3
{
}

- (void)setStateController:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setMicaView:(id)a3
{
}

- (NSArray)layerNames
{
  return self->_layerNames;
}

- (void)setLayerNames:(id)a3
{
}

- (void)setAvatarViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViews, 0);
  objc_storeStrong((id *)&self->_layerNames, 0);
  objc_storeStrong((id *)&self->_micaView, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_packageLayer, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_recommendedPinningConversations, 0);

  objc_storeStrong((id *)&self->_tipUIView, 0);
}

@end