@interface MKTransitDepartureContainerHeaderView
- (MKTransitDepartureContainerHeaderView)initWithFrame:(CGRect)a3;
- (MKTransitDepartureContainerHeaderViewModel)viewModel;
- (void)_commonInit;
- (void)_updateAppearance;
- (void)setViewModel:(id)a3;
@end

@implementation MKTransitDepartureContainerHeaderView

- (MKTransitDepartureContainerHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKTransitDepartureContainerHeaderView;
  v3 = -[MKViewWithHairline initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MKTransitDepartureContainerHeaderView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v79[15] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F428B8] separatorColor];
  [(MKViewWithHairline *)self setHairlineColor:v3];

  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(MKTransitDepartureContainerHeaderView *)self setAccessibilityIdentifier:v5];

  objc_super v6 = [[MKTransitInfoLabelView alloc] initWithMapItem:0];
  containerArtworkView = self->_containerArtworkView;
  self->_containerArtworkView = v6;

  [(MKTransitInfoLabelView *)self->_containerArtworkView setAccessibilityIdentifier:@"ContainerArtworkView"];
  [(MKTransitInfoLabelView *)self->_containerArtworkView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKTransitInfoLabelView *)self->_containerArtworkView setIconSize:6];
  [(MKTransitInfoLabelView *)self->_containerArtworkView setShieldSize:6];
  [(MKTransitInfoLabelView *)self->_containerArtworkView setMaxShieldHeight:24.0];
  LODWORD(v8) = 1148846080;
  [(MKTransitInfoLabelView *)self->_containerArtworkView setContentCompressionResistancePriority:0 forAxis:v8];
  [(MKTransitDepartureContainerHeaderView *)self addSubview:self->_containerArtworkView];
  v9 = [_MKUILabel alloc];
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14 = -[_MKUILabel initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
  containerTitleLabel = self->_containerTitleLabel;
  self->_containerTitleLabel = v14;

  [(_MKUILabel *)self->_containerTitleLabel setAccessibilityIdentifier:@"ContainerTitleLabel"];
  [(_MKUILabel *)self->_containerTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)self->_containerTitleLabel setAdjustsFontForContentSizeCategory:1];
  v16 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F43870]);
  uint64_t v17 = objc_msgSend(v16, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43930]);

  v78 = (void *)v17;
  [(_MKUILabel *)self->_containerTitleLabel setFont:v17];
  [(_MKUILabel *)self->_containerTitleLabel setNumberOfLines:0];
  [(MKTransitDepartureContainerHeaderView *)self addSubview:self->_containerTitleLabel];
  v18 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v10, v11, v12, v13);
  incidentImageView = self->_incidentImageView;
  self->_incidentImageView = v18;

  [(UIImageView *)self->_incidentImageView setAccessibilityIdentifier:@"IncidentImageView"];
  [(UIImageView *)self->_incidentImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_incidentImageView setHidden:1];
  [(UIImageView *)self->_incidentImageView setContentMode:1];
  [(MKTransitDepartureContainerHeaderView *)self addSubview:self->_incidentImageView];
  v20 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = v20;

  [(MKTransitDepartureContainerHeaderView *)self addLayoutGuide:self->_contentLayoutGuide];
  v22 = [(MKTransitInfoLabelView *)self->_containerArtworkView trailingAnchor];
  v23 = [(_MKUILabel *)self->_containerTitleLabel leadingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  artworkToTitleLabelHorizontalSpacingConstraint = self->_artworkToTitleLabelHorizontalSpacingConstraint;
  self->_artworkToTitleLabelHorizontalSpacingConstraint = v24;

  v26 = [(UIImageView *)self->_incidentImageView image];
  [v26 size];
  double v28 = v27;

  double v29 = 10.0;
  if (v28 > 0.0)
  {
    v30 = [(UIImageView *)self->_incidentImageView image];
    [v30 size];
    double v32 = v31;
    v33 = [(UIImageView *)self->_incidentImageView image];
    [v33 size];
    double v29 = v32 / v34 * 10.0;
  }
  v62 = (void *)MEMORY[0x1E4F28DC8];
  v77 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
  v76 = [(MKTransitDepartureContainerHeaderView *)self leadingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:16.0];
  v79[0] = v75;
  v74 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
  v73 = [(MKTransitDepartureContainerHeaderView *)self topAnchor];
  v72 = [v74 constraintEqualToAnchor:v73 constant:12.0];
  v79[1] = v72;
  v71 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
  v70 = [(MKTransitDepartureContainerHeaderView *)self bottomAnchor];
  v69 = [v71 constraintEqualToAnchor:v70 constant:-12.0];
  v79[2] = v69;
  v68 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
  v67 = [(MKTransitDepartureContainerHeaderView *)self trailingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67 constant:-16.0];
  v79[3] = v66;
  v65 = [(MKTransitInfoLabelView *)self->_containerArtworkView leadingAnchor];
  v64 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v79[4] = v63;
  v61 = [(MKTransitInfoLabelView *)self->_containerArtworkView topAnchor];
  v60 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v79[5] = v59;
  v58 = [(MKTransitInfoLabelView *)self->_containerArtworkView bottomAnchor];
  v57 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v35 = self->_artworkToTitleLabelHorizontalSpacingConstraint;
  v79[6] = v56;
  v79[7] = v35;
  v55 = [(UIImageView *)self->_incidentImageView bottomAnchor];
  v54 = [(MKTransitInfoLabelView *)self->_containerArtworkView bottomAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v79[8] = v53;
  v52 = [(UIImageView *)self->_incidentImageView leadingAnchor];
  v51 = [(_MKUILabel *)self->_containerTitleLabel leadingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:-15.0];
  v79[9] = v50;
  v49 = [(UIImageView *)self->_incidentImageView widthAnchor];
  v48 = [v49 constraintEqualToConstant:10.0];
  v79[10] = v48;
  v47 = [(UIImageView *)self->_incidentImageView heightAnchor];
  v46 = [v47 constraintEqualToConstant:v29];
  v79[11] = v46;
  v36 = [(_MKUILabel *)self->_containerTitleLabel trailingAnchor];
  v37 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
  v38 = [v36 constraintLessThanOrEqualToAnchor:v37];
  v79[12] = v38;
  v39 = [(_MKUILabel *)self->_containerTitleLabel topAnchor];
  v40 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v79[13] = v41;
  v42 = [(_MKUILabel *)self->_containerTitleLabel bottomAnchor];
  v43 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v79[14] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:15];
  [v62 activateConstraints:v45];
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MKTransitDepartureContainerHeaderViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MKTransitDepartureContainerHeaderView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  v3 = [(MKTransitDepartureContainerHeaderViewModel *)self->_viewModel titleText];
  [(_MKUILabel *)self->_containerTitleLabel setText:v3];

  v4 = [(MKTransitDepartureContainerHeaderViewModel *)self->_viewModel labelItems];
  [(MKTransitInfoLabelView *)self->_containerArtworkView setLabelItems:v4];

  [(UIImageView *)self->_incidentImageView setHidden:[(MKTransitDepartureContainerHeaderViewModel *)self->_viewModel showIncidentsIcon] ^ 1];
  BOOL v5 = [(MKTransitDepartureContainerHeaderViewModel *)self->_viewModel showIncidentsIcon];
  incidentImageView = self->_incidentImageView;
  if (v5)
  {
    [(UIImageView *)incidentImageView setHidden:0];
    v7 = [(UIImageView *)self->_incidentImageView image];

    if (!v7)
    {
      double v8 = [(MKTransitDepartureContainerHeaderView *)self window];
      v9 = [v8 screen];
      double v10 = v9;
      if (v9)
      {
        [v9 scale];
      }
      else
      {
        double v11 = [MEMORY[0x1E4F42D90] mainScreen];
        [v11 scale];
      }
      double v12 = MKTransitIncidentIcon();
      [(UIImageView *)self->_incidentImageView setImage:v12];
    }
  }
  else
  {
    [(UIImageView *)incidentImageView setHidden:1];
  }
  double v13 = [(MKTransitDepartureContainerHeaderViewModel *)self->_viewModel labelItems];
  uint64_t v14 = [v13 count];

  if (v14) {
    double v15 = -10.0;
  }
  else {
    double v15 = 0.0;
  }
  [(MKTransitInfoLabelView *)self->_containerArtworkView setHidden:v14 == 0];
  artworkToTitleLabelHorizontalSpacingConstraint = self->_artworkToTitleLabelHorizontalSpacingConstraint;

  [(NSLayoutConstraint *)artworkToTitleLabelHorizontalSpacingConstraint setConstant:v15];
}

- (MKTransitDepartureContainerHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_artworkToTitleLabelHorizontalSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_incidentImageView, 0);
  objc_storeStrong((id *)&self->_containerTitleLabel, 0);

  objc_storeStrong((id *)&self->_containerArtworkView, 0);
}

@end