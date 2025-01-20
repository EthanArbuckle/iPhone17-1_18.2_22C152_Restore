@interface MKExploreGuidesReusableView
+ (id)reuseIdentifier;
- (MKExploreGuidesView)exploreGuidesView;
- (void)configureWithExploreGuides:(id)a3 tapHandler:(id)a4;
- (void)setExploreGuidesView:(id)a3;
@end

@implementation MKExploreGuidesReusableView

- (void)configureWithExploreGuides:(id)a3 tapHandler:(id)a4
{
  v37[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MKExploreGuidesReusableView *)self exploreGuidesView];

  if (v8)
  {
    v9 = [(MKExploreGuidesReusableView *)self exploreGuidesView];
    v10 = [v9 exploreGuide];
    char v11 = [v10 isEqual:v6];

    if ((v11 & 1) == 0)
    {
      v12 = [(MKExploreGuidesReusableView *)self exploreGuidesView];
      [v12 updateExploreGuide:v6];
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKExploreGuidesReusableView *)self setBackgroundColor:v13];

    v14 = [[MKExploreGuidesView alloc] initWithExploreGuides:v6 tapHandler:v7];
    [(MKExploreGuidesReusableView *)self setExploreGuidesView:v14];

    v15 = [(MKExploreGuidesReusableView *)self exploreGuidesView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(MKExploreGuidesReusableView *)self exploreGuidesView];
    [(MKExploreGuidesReusableView *)self addSubview:v16];

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v36 = [(MKExploreGuidesReusableView *)self exploreGuidesView];
    v35 = [v36 leadingAnchor];
    v34 = [(MKExploreGuidesReusableView *)self leadingAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v37[0] = v33;
    v32 = [(MKExploreGuidesReusableView *)self exploreGuidesView];
    v31 = [v32 topAnchor];
    v30 = [(MKExploreGuidesReusableView *)self topAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v37[1] = v29;
    v27 = [(MKExploreGuidesReusableView *)self exploreGuidesView];
    v26 = [v27 bottomAnchor];
    v25 = [(MKExploreGuidesReusableView *)self bottomAnchor];
    v17 = [v26 constraintEqualToAnchor:v25];
    v37[2] = v17;
    v18 = [(MKExploreGuidesReusableView *)self exploreGuidesView];
    v19 = [v18 trailingAnchor];
    v20 = [(MKExploreGuidesReusableView *)self trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v37[3] = v21;
    v22 = [(MKExploreGuidesReusableView *)self heightAnchor];
    +[MKExploreGuidesView defaultHeight];
    v23 = objc_msgSend(v22, "constraintEqualToConstant:");
    v37[4] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
    [v28 activateConstraints:v24];
  }
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (MKExploreGuidesView)exploreGuidesView
{
  return self->_exploreGuidesView;
}

- (void)setExploreGuidesView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end