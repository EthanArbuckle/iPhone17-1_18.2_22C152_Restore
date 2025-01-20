@interface AVPlayerViewControllerCustomControlsView
+ (BOOL)requiresConstraintBasedLayout;
- (AVPlayerViewControllerCustomControlsView)initWithFrame:(CGRect)a3;
- (BOOL)areTransportControlsVisible;
- (BOOL)areVolumeControlsVisible;
- (UILayoutGuide)animatedUnobscuredCenterAreaLayoutGuide;
- (UILayoutGuide)displayModeControlsAreaLayoutGuide;
- (UILayoutGuide)transportControlsAreaLayoutGuide;
- (UILayoutGuide)unobscuredCenterAreaLayoutGuide;
- (UILayoutGuide)unobscuredTopAreaLayoutGuide;
- (UILayoutGuide)volumeControlsAreaLayoutGuide;
- (UIView)animatedUnobscuredCenterAreaLayoutGuideProvidingView;
- (UIView)displayModeControlsAreaLayoutGuideProvidingView;
- (UIView)transportControlsAreaLayoutGuideProvidingView;
- (UIView)unobscuredCenterAreaLayoutGuideProvidingView;
- (UIView)unobscuredTopAreaLayoutGuideProvidingView;
- (UIView)volumeControlsAreaLayoutGuideProvidingView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setAreTransportControlsVisible:(BOOL)a3;
- (void)setAreVolumeControlsVisible:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation AVPlayerViewControllerCustomControlsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedUnobscuredCenterAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_unobscuredCenterAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_unobscuredTopAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_volumeControlsAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_displayModeControlsAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_transportControlsAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_unobscuredTopAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_animatedUnobscuredCenterAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_unobscuredCenterAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_volumeControlsAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_displayModeControlsAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_transportControlsAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_volumeControlsHiddenConstraint, 0);
  objc_storeStrong((id *)&self->_volumeControlsVisibleConstraint, 0);
  objc_storeStrong((id *)&self->_transportControlsHiddenConstraint, 0);

  objc_storeStrong((id *)&self->_transportControlsVisibleConstraint, 0);
}

- (BOOL)areVolumeControlsVisible
{
  return self->_areVolumeControlsVisible;
}

- (BOOL)areTransportControlsVisible
{
  return self->_areTransportControlsVisible;
}

- (UIView)animatedUnobscuredCenterAreaLayoutGuideProvidingView
{
  return self->_animatedUnobscuredCenterAreaLayoutGuideProvidingView;
}

- (UIView)unobscuredCenterAreaLayoutGuideProvidingView
{
  return self->_unobscuredCenterAreaLayoutGuideProvidingView;
}

- (UIView)unobscuredTopAreaLayoutGuideProvidingView
{
  return self->_unobscuredTopAreaLayoutGuideProvidingView;
}

- (UIView)volumeControlsAreaLayoutGuideProvidingView
{
  return self->_volumeControlsAreaLayoutGuideProvidingView;
}

- (UIView)displayModeControlsAreaLayoutGuideProvidingView
{
  return self->_displayModeControlsAreaLayoutGuideProvidingView;
}

- (UIView)transportControlsAreaLayoutGuideProvidingView
{
  return self->_transportControlsAreaLayoutGuideProvidingView;
}

- (UILayoutGuide)unobscuredTopAreaLayoutGuide
{
  return self->_unobscuredTopAreaLayoutGuide;
}

- (UILayoutGuide)animatedUnobscuredCenterAreaLayoutGuide
{
  return self->_animatedUnobscuredCenterAreaLayoutGuide;
}

- (UILayoutGuide)unobscuredCenterAreaLayoutGuide
{
  return self->_unobscuredCenterAreaLayoutGuide;
}

- (UILayoutGuide)volumeControlsAreaLayoutGuide
{
  return self->_volumeControlsAreaLayoutGuide;
}

- (UILayoutGuide)displayModeControlsAreaLayoutGuide
{
  return self->_displayModeControlsAreaLayoutGuide;
}

- (UILayoutGuide)transportControlsAreaLayoutGuide
{
  return self->_transportControlsAreaLayoutGuide;
}

- (void)updateConstraints
{
  if (self->_needsInitialConstraints)
  {
    self->_needsInitialConstraints = 0;
    v3 = [MEMORY[0x1E4F1CA48] array];
    v4 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredTopAreaLayoutGuideProvidingView];
    v5 = [v4 leadingAnchor];
    v6 = [(AVPlayerViewControllerCustomControlsView *)self displayModeControlsAreaLayoutGuideProvidingView];
    v7 = [v6 trailingAnchor];
    v8 = [v5 constraintEqualToAnchor:v7 constant:6.0];
    [v3 addObject:v8];

    v9 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredTopAreaLayoutGuideProvidingView];
    v10 = [v9 trailingAnchor];
    v11 = [(AVPlayerViewControllerCustomControlsView *)self volumeControlsAreaLayoutGuideProvidingView];
    v12 = [v11 leadingAnchor];
    v13 = [v10 constraintEqualToAnchor:v12 constant:-6.0];
    [v3 addObject:v13];

    v14 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredTopAreaLayoutGuideProvidingView];
    v15 = [v14 topAnchor];
    v16 = [(AVPlayerViewControllerCustomControlsView *)self volumeControlsAreaLayoutGuideProvidingView];
    v17 = [v16 topAnchor];
    v18 = [v15 constraintEqualToAnchor:v17 constant:0.0];
    [v3 addObject:v18];

    v19 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredTopAreaLayoutGuideProvidingView];
    v20 = [v19 bottomAnchor];
    v21 = [(AVPlayerViewControllerCustomControlsView *)self volumeControlsAreaLayoutGuideProvidingView];
    v22 = [v21 bottomAnchor];
    v23 = [v20 constraintEqualToAnchor:v22 constant:0.0];
    [v3 addObject:v23];

    v24 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredCenterAreaLayoutGuideProvidingView];
    v25 = [v24 leadingAnchor];
    v26 = [(AVPlayerViewControllerCustomControlsView *)self displayModeControlsAreaLayoutGuideProvidingView];
    v27 = [v26 leadingAnchor];
    LODWORD(v28) = 1148846080;
    v29 = objc_msgSend(v25, "avkit_constraintGreaterThanOrEqualToAnchor:constant:priority:", v27, 0.0, v28);
    [v3 addObject:v29];

    v30 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredCenterAreaLayoutGuideProvidingView];
    v31 = [v30 trailingAnchor];
    v32 = [(AVPlayerViewControllerCustomControlsView *)self volumeControlsAreaLayoutGuideProvidingView];
    v33 = [v32 trailingAnchor];
    LODWORD(v34) = 1148846080;
    v35 = objc_msgSend(v31, "avkit_constraintLessThanOrEqualToAnchor:constant:priority:", v33, 0.0, v34);
    [v3 addObject:v35];

    v36 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredCenterAreaLayoutGuideProvidingView];
    v37 = [v36 leadingAnchor];
    v38 = [(AVPlayerViewControllerCustomControlsView *)self safeAreaLayoutGuide];
    v39 = [v38 leadingAnchor];
    v40 = [v37 constraintGreaterThanOrEqualToAnchor:v39 constant:0.0];
    [v3 addObject:v40];

    v41 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredCenterAreaLayoutGuideProvidingView];
    v42 = [v41 trailingAnchor];
    v43 = [(AVPlayerViewControllerCustomControlsView *)self safeAreaLayoutGuide];
    v44 = [v43 trailingAnchor];
    v45 = [v42 constraintLessThanOrEqualToAnchor:v44 constant:0.0];
    [v3 addObject:v45];

    v46 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredCenterAreaLayoutGuideProvidingView];
    v47 = [v46 topAnchor];
    v48 = [(AVPlayerViewControllerCustomControlsView *)self volumeControlsAreaLayoutGuideProvidingView];
    v49 = [v48 bottomAnchor];
    v50 = [v47 constraintEqualToAnchor:v49 constant:6.0];
    [v3 addObject:v50];

    v51 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredCenterAreaLayoutGuideProvidingView];
    v52 = [v51 bottomAnchor];
    v53 = [(AVPlayerViewControllerCustomControlsView *)self transportControlsAreaLayoutGuideProvidingView];
    v54 = [v53 topAnchor];
    v55 = [v52 constraintEqualToAnchor:v54 constant:-6.0];
    [v3 addObject:v55];

    v56 = [(AVPlayerViewControllerCustomControlsView *)self animatedUnobscuredCenterAreaLayoutGuideProvidingView];
    v57 = [v56 leadingAnchor];
    v58 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredCenterAreaLayoutGuideProvidingView];
    v59 = [v58 leadingAnchor];
    v60 = [v57 constraintEqualToAnchor:v59 constant:0.0];
    [v3 addObject:v60];

    v61 = [(AVPlayerViewControllerCustomControlsView *)self animatedUnobscuredCenterAreaLayoutGuideProvidingView];
    v62 = [v61 trailingAnchor];
    v63 = [(AVPlayerViewControllerCustomControlsView *)self unobscuredCenterAreaLayoutGuideProvidingView];
    v64 = [v63 trailingAnchor];
    v65 = [v62 constraintEqualToAnchor:v64 constant:0.0];
    [v3 addObject:v65];

    [MEMORY[0x1E4F28DC8] activateConstraints:v3];
    v66 = [(AVPlayerViewControllerCustomControlsView *)self animatedUnobscuredCenterAreaLayoutGuideProvidingView];
    v67 = [v66 topAnchor];
    v68 = [(AVPlayerViewControllerCustomControlsView *)self volumeControlsAreaLayoutGuideProvidingView];
    v69 = [v68 topAnchor];
    v70 = [v67 constraintEqualToAnchor:v69 constant:0.0];
    volumeControlsHiddenConstraint = self->_volumeControlsHiddenConstraint;
    self->_volumeControlsHiddenConstraint = v70;

    v72 = [(AVPlayerViewControllerCustomControlsView *)self animatedUnobscuredCenterAreaLayoutGuideProvidingView];
    v73 = [v72 topAnchor];
    v74 = [(AVPlayerViewControllerCustomControlsView *)self volumeControlsAreaLayoutGuideProvidingView];
    v75 = [v74 bottomAnchor];
    v76 = [v73 constraintEqualToAnchor:v75 constant:6.0];
    volumeControlsVisibleConstraint = self->_volumeControlsVisibleConstraint;
    self->_volumeControlsVisibleConstraint = v76;

    v78 = [(AVPlayerViewControllerCustomControlsView *)self animatedUnobscuredCenterAreaLayoutGuideProvidingView];
    v79 = [v78 bottomAnchor];
    v80 = [(AVPlayerViewControllerCustomControlsView *)self transportControlsAreaLayoutGuideProvidingView];
    v81 = [v80 bottomAnchor];
    v82 = [v79 constraintEqualToAnchor:v81];
    transportControlsHiddenConstraint = self->_transportControlsHiddenConstraint;
    self->_transportControlsHiddenConstraint = v82;

    v84 = [(AVPlayerViewControllerCustomControlsView *)self animatedUnobscuredCenterAreaLayoutGuideProvidingView];
    v85 = [v84 bottomAnchor];
    v86 = [(AVPlayerViewControllerCustomControlsView *)self transportControlsAreaLayoutGuideProvidingView];
    v87 = [v86 topAnchor];
    v88 = [v85 constraintEqualToAnchor:v87 constant:-6.0];
    transportControlsVisibleConstraint = self->_transportControlsVisibleConstraint;
    self->_transportControlsVisibleConstraint = v88;
  }
  [(NSLayoutConstraint *)self->_volumeControlsHiddenConstraint setActive:[(AVPlayerViewControllerCustomControlsView *)self areVolumeControlsVisible] ^ 1];
  [(NSLayoutConstraint *)self->_volumeControlsVisibleConstraint setActive:[(AVPlayerViewControllerCustomControlsView *)self areVolumeControlsVisible]];
  [(NSLayoutConstraint *)self->_transportControlsHiddenConstraint setActive:[(AVPlayerViewControllerCustomControlsView *)self areTransportControlsVisible] ^ 1];
  [(NSLayoutConstraint *)self->_transportControlsVisibleConstraint setActive:[(AVPlayerViewControllerCustomControlsView *)self areTransportControlsVisible]];
  v90.receiver = self;
  v90.super_class = (Class)AVPlayerViewControllerCustomControlsView;
  [(AVPlayerViewControllerCustomControlsView *)&v90 updateConstraints];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerViewControllerCustomControlsView;
  -[AVPlayerViewControllerCustomControlsView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (AVPlayerViewControllerCustomControlsView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (void)setAreTransportControlsVisible:(BOOL)a3
{
  if (self->_areTransportControlsVisible != a3)
  {
    self->_areTransportControlsVisible = a3;
    [(AVPlayerViewControllerCustomControlsView *)self setNeedsUpdateConstraints];
  }
}

- (void)setAreVolumeControlsVisible:(BOOL)a3
{
  if (self->_areVolumeControlsVisible != a3)
  {
    self->_areVolumeControlsVisible = a3;
    [(AVPlayerViewControllerCustomControlsView *)self setNeedsUpdateConstraints];
  }
}

- (AVPlayerViewControllerCustomControlsView)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)AVPlayerViewControllerCustomControlsView;
  v3 = -[AVPlayerViewControllerCustomControlsView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_needsInitialConstraints = 1;
    v5 = [AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    transportControlsAreaLayoutGuideProvidingView = v4->_transportControlsAreaLayoutGuideProvidingView;
    v4->_transportControlsAreaLayoutGuideProvidingView = (UIView *)v10;

    uint64_t v12 = [(UIView *)v4->_transportControlsAreaLayoutGuideProvidingView layoutMarginsGuide];
    transportControlsAreaLayoutGuide = v4->_transportControlsAreaLayoutGuide;
    v4->_transportControlsAreaLayoutGuide = (UILayoutGuide *)v12;

    [(AVPlayerViewControllerCustomControlsView *)v4 addSubview:v4->_transportControlsAreaLayoutGuideProvidingView];
    v14 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:]([AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc], "initWithFrame:", v6, v7, v8, v9);
    displayModeControlsAreaLayoutGuideProvidingView = v4->_displayModeControlsAreaLayoutGuideProvidingView;
    v4->_displayModeControlsAreaLayoutGuideProvidingView = &v14->super;

    uint64_t v16 = [(UIView *)v4->_displayModeControlsAreaLayoutGuideProvidingView layoutMarginsGuide];
    displayModeControlsAreaLayoutGuide = v4->_displayModeControlsAreaLayoutGuide;
    v4->_displayModeControlsAreaLayoutGuide = (UILayoutGuide *)v16;

    [(AVPlayerViewControllerCustomControlsView *)v4 addSubview:v4->_displayModeControlsAreaLayoutGuideProvidingView];
    v18 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:]([AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc], "initWithFrame:", v6, v7, v8, v9);
    volumeControlsAreaLayoutGuideProvidingView = v4->_volumeControlsAreaLayoutGuideProvidingView;
    v4->_volumeControlsAreaLayoutGuideProvidingView = &v18->super;

    uint64_t v20 = [(UIView *)v4->_volumeControlsAreaLayoutGuideProvidingView layoutMarginsGuide];
    volumeControlsAreaLayoutGuide = v4->_volumeControlsAreaLayoutGuide;
    v4->_volumeControlsAreaLayoutGuide = (UILayoutGuide *)v20;

    [(AVPlayerViewControllerCustomControlsView *)v4 addSubview:v4->_volumeControlsAreaLayoutGuideProvidingView];
    v22 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:]([AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc], "initWithFrame:", v6, v7, v8, v9);
    unobscuredCenterAreaLayoutGuideProvidingView = v4->_unobscuredCenterAreaLayoutGuideProvidingView;
    v4->_unobscuredCenterAreaLayoutGuideProvidingView = &v22->super;

    uint64_t v24 = [(UIView *)v4->_unobscuredCenterAreaLayoutGuideProvidingView layoutMarginsGuide];
    unobscuredCenterAreaLayoutGuide = v4->_unobscuredCenterAreaLayoutGuide;
    v4->_unobscuredCenterAreaLayoutGuide = (UILayoutGuide *)v24;

    [(AVPlayerViewControllerCustomControlsView *)v4 addSubview:v4->_unobscuredCenterAreaLayoutGuideProvidingView];
    v26 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:]([AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc], "initWithFrame:", v6, v7, v8, v9);
    animatedUnobscuredCenterAreaLayoutGuideProvidingView = v4->_animatedUnobscuredCenterAreaLayoutGuideProvidingView;
    v4->_animatedUnobscuredCenterAreaLayoutGuideProvidingView = &v26->super;

    uint64_t v28 = [(UIView *)v4->_animatedUnobscuredCenterAreaLayoutGuideProvidingView layoutMarginsGuide];
    animatedUnobscuredCenterAreaLayoutGuide = v4->_animatedUnobscuredCenterAreaLayoutGuide;
    v4->_animatedUnobscuredCenterAreaLayoutGuide = (UILayoutGuide *)v28;

    [(AVPlayerViewControllerCustomControlsView *)v4 addSubview:v4->_animatedUnobscuredCenterAreaLayoutGuideProvidingView];
    v30 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:]([AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc], "initWithFrame:", v6, v7, v8, v9);
    unobscuredTopAreaLayoutGuideProvidingView = v4->_unobscuredTopAreaLayoutGuideProvidingView;
    v4->_unobscuredTopAreaLayoutGuideProvidingView = &v30->super;

    uint64_t v32 = [(UIView *)v4->_unobscuredTopAreaLayoutGuideProvidingView layoutMarginsGuide];
    unobscuredTopAreaLayoutGuide = v4->_unobscuredTopAreaLayoutGuide;
    v4->_unobscuredTopAreaLayoutGuide = (UILayoutGuide *)v32;

    [(AVPlayerViewControllerCustomControlsView *)v4 addSubview:v4->_unobscuredTopAreaLayoutGuideProvidingView];
  }
  return v4;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end