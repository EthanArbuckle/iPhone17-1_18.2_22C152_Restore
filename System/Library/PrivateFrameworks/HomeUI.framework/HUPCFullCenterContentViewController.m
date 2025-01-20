@interface HUPCFullCenterContentViewController
- (NSArray)floatingConstraintGroup;
- (NSArray)pinnedConstraintGroup;
- (NSLayoutConstraint)contentViewOptionalHeightAnchor;
- (UIView)centerContentView;
- (double)contentViewMaxHeight;
- (void)insertCenterContentView;
- (void)setCenterContentView:(id)a3;
- (void)setCenteredContentView:(id)a3;
- (void)setContentViewMaxHeight:(double)a3;
- (void)setContentViewOptionalHeightAnchor:(id)a3;
- (void)setFloatingConstraintGroup:(id)a3;
- (void)setPinnedConstraintGroup:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HUPCFullCenterContentViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUPCFullCenterContentViewController;
  [(HUPCFullCenterContentViewController *)&v3 viewDidLoad];
  [(HUPCFullCenterContentViewController *)self insertCenterContentView];
}

- (void)setCenteredContentView:(id)a3
{
  id v5 = a3;
  id v4 = [(HUPCFullCenterContentViewController *)self centerContentView];

  if (v4 != v5)
  {
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUPCFullCenterContentViewController *)self setCenterContentView:v5];
  }
  if ([(HUPCFullCenterContentViewController *)self isViewLoaded]) {
    [(HUPCFullCenterContentViewController *)self insertCenterContentView];
  }
}

- (void)insertCenterContentView
{
  v38[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(HUPCFullCenterContentViewController *)self centerContentView];
  id v4 = [v3 superview];
  id v5 = [(HUPCFullCenterContentViewController *)self contentView];

  if (v4 != v5)
  {
    v6 = [(HUPCFullCenterContentViewController *)self centerContentView];
    [v6 removeFromSuperview];

    v7 = [(HUPCFullCenterContentViewController *)self contentView];
    v8 = [(HUPCFullCenterContentViewController *)self centerContentView];
    [v7 addSubview:v8];

    v9 = [(HUPCFullCenterContentViewController *)self contentView];
    v10 = [v9 mainContentGuide];

    v37 = [(HUPCFullCenterContentViewController *)self centerContentView];
    v36 = [v37 centerXAnchor];
    v35 = [v10 centerXAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v38[0] = v34;
    v32 = [(HUPCFullCenterContentViewController *)self centerContentView];
    v31 = [v32 centerYAnchor];
    v30 = [v10 centerYAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v38[1] = v29;
    v33 = v10;
    v11 = [v10 bottomAnchor];
    v12 = [(HUPCFullCenterContentViewController *)self centerContentView];
    v13 = [v12 bottomAnchor];
    v14 = [v11 constraintGreaterThanOrEqualToAnchor:v13];
    v38[2] = v14;
    v15 = [v10 topAnchor];
    v16 = [(HUPCFullCenterContentViewController *)self centerContentView];
    v17 = [v16 topAnchor];
    v18 = [v15 constraintLessThanOrEqualToAnchor:v17];
    v38[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
    [(HUPCFullCenterContentViewController *)self setFloatingConstraintGroup:v19];

    v20 = (void *)MEMORY[0x1E4F28DC8];
    v21 = [(HUPCFullCenterContentViewController *)self floatingConstraintGroup];
    [v20 activateConstraints:v21];

    v22 = [(HUPCFullCenterContentViewController *)self centerContentView];
    v23 = [v22 widthAnchor];
    v24 = [v33 widthAnchor];
    v25 = [v23 constraintLessThanOrEqualToAnchor:v24];
    [v25 setActive:1];

    v26 = [(HUPCFullCenterContentViewController *)self centerContentView];
    v27 = [(HUPCFullCenterContentViewController *)self contentView];
    v28 = [v26 pinToEdgesConstraints:v27];
    [(HUPCFullCenterContentViewController *)self setPinnedConstraintGroup:v28];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUPCFullCenterContentViewController;
  [(HUPCFullCenterContentViewController *)&v3 viewDidLayoutSubviews];
  [(HUPCFullCenterContentViewController *)self recalculateLayoutForTraitCollectionChange];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUPCFullCenterContentViewController;
  [(HUPCFullCenterContentViewController *)&v4 traitCollectionDidChange:a3];
  [(HUPCFullCenterContentViewController *)self recalculateLayoutForTraitCollectionChange];
}

- (UIView)centerContentView
{
  return self->_centerContentView;
}

- (void)setCenterContentView:(id)a3
{
}

- (NSLayoutConstraint)contentViewOptionalHeightAnchor
{
  return self->_contentViewOptionalHeightAnchor;
}

- (void)setContentViewOptionalHeightAnchor:(id)a3
{
}

- (double)contentViewMaxHeight
{
  return self->_contentViewMaxHeight;
}

- (void)setContentViewMaxHeight:(double)a3
{
  self->_contentViewMaxHeight = a3;
}

- (NSArray)floatingConstraintGroup
{
  return self->_floatingConstraintGroup;
}

- (void)setFloatingConstraintGroup:(id)a3
{
}

- (NSArray)pinnedConstraintGroup
{
  return self->_pinnedConstraintGroup;
}

- (void)setPinnedConstraintGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedConstraintGroup, 0);
  objc_storeStrong((id *)&self->_floatingConstraintGroup, 0);
  objc_storeStrong((id *)&self->_contentViewOptionalHeightAnchor, 0);

  objc_storeStrong((id *)&self->_centerContentView, 0);
}

@end