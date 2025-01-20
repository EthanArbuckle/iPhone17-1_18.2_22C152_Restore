@interface CPUIMessageCell
+ (double)minimumHeight;
+ (double)rowHeight;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)constraints;
- (UIImage)leadingGlyph;
- (UIImage)trailingGlyph;
- (UIImage)unreadIndicatorImage;
- (UIImageView)leadingGlyphView;
- (UIImageView)primaryImageView;
- (UIImageView)trailingGlyphView;
- (UIImageView)trailingImageView;
- (UIImageView)unreadImageView;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UILabel)trailingLabel;
- (void)_updateTintColors;
- (void)applyConfiguration:(id)a3;
- (void)configureCell;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setConstraints:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLeadingGlyph:(id)a3;
- (void)setLeadingGlyphView:(id)a3;
- (void)setPrimaryImageView:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setTrailingGlyph:(id)a3;
- (void)setTrailingGlyphView:(id)a3;
- (void)setTrailingImageView:(id)a3;
- (void)setTrailingLabel:(id)a3;
- (void)setUnread:(BOOL)a3;
- (void)setUnreadImageView:(id)a3;
- (void)setUnreadIndicatorImage:(id)a3;
@end

@implementation CPUIMessageCell

+ (double)minimumHeight
{
  return 44.0;
}

+ (double)rowHeight
{
  return 56.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(id)objc_opt_class() minimumHeight];
  double v6 = v5;
  v7 = [(CPUIMessageCell *)self secondaryLabel];
  v8 = [v7 text];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    [(id)objc_opt_class() rowHeight];
    double v6 = v10;
  }
  double v11 = width;
  double v12 = v6;
  result.height = v12;
  result.CGFloat width = v11;
  return result;
}

- (void)_updateTintColors
{
  v35.receiver = self;
  v35.super_class = (Class)CPUIMessageCell;
  [(_CPUIBaseTableCell *)&v35 _updateTintColors];
  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] _carSystemFocusColor];
  }
  else {
  v3 = +[_CPUIBaseTableCell disabledColor];
  }
  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  }
  else {
  v4 = +[_CPUIBaseTableCell disabledHighlightedColor];
  }
  BOOL v5 = [(_CPUIBaseTableCell *)self itemEnabled];
  double v6 = v3;
  if (v5)
  {
    double v6 = [MEMORY[0x263F825C8] labelColor];
  }
  v7 = [(CPUIMessageCell *)self primaryLabel];
  [v7 setTextColor:v6];

  if (v5) {
  v8 = [(CPUIMessageCell *)self primaryLabel];
  }
  [v8 setHighlightedTextColor:v4];

  BOOL v9 = [(_CPUIBaseTableCell *)self itemEnabled];
  double v10 = v3;
  if (v9)
  {
    double v10 = [MEMORY[0x263F825C8] labelColor];
  }
  double v11 = [(CPUIMessageCell *)self secondaryLabel];
  [v11 setTextColor:v10];

  if (v9) {
  double v12 = [(CPUIMessageCell *)self secondaryLabel];
  }
  [v12 setHighlightedTextColor:v4];

  v13 = [(CPUIMessageCell *)self leadingGlyph];

  if (v13)
  {
    v14 = [(CPUIMessageCell *)self leadingGlyphView];
    v15 = [(CPUIMessageCell *)self leadingGlyph];
    v16 = [v15 imageWithTintColor:v3];
    [v14 setImage:v16];

    v17 = [(CPUIMessageCell *)self leadingGlyphView];
    v18 = [(CPUIMessageCell *)self leadingGlyph];
    v19 = [v18 imageWithTintColor:v4];
    [v17 setHighlightedImage:v19];
  }
  v20 = [(CPUIMessageCell *)self trailingGlyph];

  if (v20)
  {
    v21 = [(CPUIMessageCell *)self trailingGlyphView];
    v22 = [(CPUIMessageCell *)self trailingGlyph];
    v23 = [v22 imageWithTintColor:v3];
    [v21 setImage:v23];

    v24 = [(CPUIMessageCell *)self trailingGlyphView];
    v25 = [(CPUIMessageCell *)self trailingGlyph];
    v26 = [v25 imageWithTintColor:v4];
    [v24 setHighlightedImage:v26];
  }
  v27 = [(CPUIMessageCell *)self accessoryView];

  if (v27)
  {
    v28 = [(CPUIMessageCell *)self accessoryView];
    if ([(CPUIMessageCell *)self isHighlighted]) {
      v29 = v4;
    }
    else {
      v29 = v3;
    }
    [v28 setTintColor:v29];
  }
  v30 = [(CPUIMessageCell *)self unreadImageView];

  if (v30)
  {
    v31 = [(CPUIMessageCell *)self unreadImageView];
    v32 = [(UIImage *)self->_unreadIndicatorImage _flatImageWithColor:v3];
    [v31 setImage:v32];

    v33 = [(CPUIMessageCell *)self unreadImageView];
    v34 = [(UIImage *)self->_unreadIndicatorImage _flatImageWithColor:v4];
    [v33 setHighlightedImage:v34];
  }
}

- (void)configureCell
{
  v83[1] = *MEMORY[0x263EF8340];
  v77.receiver = self;
  v77.super_class = (Class)CPUIMessageCell;
  [(_CPUIBaseTableCell *)&v77 configureCell];
  v3 = [(CPUIMessageCell *)self traitCollection];
  v4 = CPUIChevronRightGlyph();
  v76 = [v4 imageWithRenderingMode:2];

  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v76];
  [(CPUIMessageCell *)self setAccessoryView:v5];

  uint64_t v82 = *MEMORY[0x263F81850];
  double v6 = [NSNumber numberWithDouble:*MEMORY[0x263F81838]];
  v83[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v83 forKeys:&v82 count:1];

  id v8 = objc_alloc(MEMORY[0x263F828E0]);
  double v9 = *MEMORY[0x263F001A8];
  double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  v13 = (UILabel *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], v10, v11, v12);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v13;

  v15 = (void *)MEMORY[0x263F81720];
  uint64_t v16 = *MEMORY[0x263F83580];
  v17 = [(CPUIMessageCell *)self traitCollection];
  v18 = [v15 preferredFontDescriptorWithTextStyle:v16 compatibleWithTraitCollection:v17];

  uint64_t v80 = *MEMORY[0x263F817A0];
  uint64_t v19 = v80;
  v81 = v7;
  v20 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
  v21 = [v18 fontDescriptorByAddingAttributes:v20];

  v22 = self->_primaryLabel;
  v23 = [MEMORY[0x263F81708] fontWithDescriptor:v21 size:0.0];
  [(UILabel *)v22 setFont:v23];

  [(UILabel *)self->_primaryLabel setAdjustsFontForContentSizeCategory:0];
  [(UILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = self->_primaryLabel;
  v25 = [MEMORY[0x263F825C8] labelColor];
  [(UILabel *)v24 setTextColor:v25];

  v26 = self->_primaryLabel;
  v27 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  [(UILabel *)v26 setHighlightedTextColor:v27];

  v28 = [(CPUIMessageCell *)self primaryLabel];
  [(CPUIMessageCell *)self addSubview:v28];

  v29 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v9, v10, v11, v12);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v29;

  v31 = (void *)MEMORY[0x263F81720];
  uint64_t v32 = *MEMORY[0x263F83588];
  v33 = [(CPUIMessageCell *)self traitCollection];
  v34 = [v31 preferredFontDescriptorWithTextStyle:v32 compatibleWithTraitCollection:v33];

  uint64_t v78 = v19;
  v79 = v7;
  objc_super v35 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
  v36 = [v34 fontDescriptorByAddingAttributes:v35];

  v37 = self->_secondaryLabel;
  v38 = [MEMORY[0x263F81708] fontWithDescriptor:v36 size:0.0];
  [(UILabel *)v37 setFont:v38];

  [(UILabel *)self->_secondaryLabel setAdjustsFontForContentSizeCategory:0];
  v39 = self->_secondaryLabel;
  v40 = [MEMORY[0x263F825C8] _carSystemSecondaryColor];
  [(UILabel *)v39 setTextColor:v40];

  v41 = self->_secondaryLabel;
  v42 = [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
  [(UILabel *)v41 setHighlightedTextColor:v42];

  [(UILabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v43 = [(CPUIMessageCell *)self secondaryLabel];
  [(CPUIMessageCell *)self addSubview:v43];

  v44 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v9, v10, v11, v12);
  trailingLabel = self->_trailingLabel;
  self->_trailingLabel = v44;

  v46 = self->_trailingLabel;
  v47 = [MEMORY[0x263F825C8] _carSystemSecondaryColor];
  [(UILabel *)v46 setTextColor:v47];

  v48 = self->_trailingLabel;
  v49 = [MEMORY[0x263F81708] fontWithDescriptor:v36 size:0.0];
  [(UILabel *)v48 setFont:v49];

  [(UILabel *)self->_trailingLabel setAdjustsFontForContentSizeCategory:0];
  v50 = self->_trailingLabel;
  v51 = [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
  [(UILabel *)v50 setHighlightedTextColor:v51];

  [(UILabel *)self->_trailingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_trailingLabel setTextAlignment:2 * ([(CPUIMessageCell *)self effectiveUserInterfaceLayoutDirection] != 1)];
  LODWORD(v52) = 1148846080;
  [(UILabel *)self->_trailingLabel setContentCompressionResistancePriority:0 forAxis:v52];
  LODWORD(v53) = 1148846080;
  [(UILabel *)self->_trailingLabel setContentHuggingPriority:0 forAxis:v53];
  v54 = [(CPUIMessageCell *)self trailingLabel];
  [(CPUIMessageCell *)self addSubview:v54];

  v55 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v9, v10, v11, v12);
  primaryImageView = self->_primaryImageView;
  self->_primaryImageView = v55;

  [(UIImageView *)self->_primaryImageView setContentMode:1];
  [(UIImageView *)self->_primaryImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v57) = 1144750080;
  [(UIImageView *)self->_primaryImageView setContentHuggingPriority:0 forAxis:v57];
  LODWORD(v58) = 1144750080;
  [(UIImageView *)self->_primaryImageView setContentCompressionResistancePriority:0 forAxis:v58];
  v59 = [(CPUIMessageCell *)self primaryImageView];
  [(CPUIMessageCell *)self addSubview:v59];

  v60 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v9, v10, v11, v12);
  trailingImageView = self->_trailingImageView;
  self->_trailingImageView = v60;

  [(UIImageView *)self->_trailingImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v62) = 1144750080;
  [(UIImageView *)self->_trailingImageView setContentCompressionResistancePriority:0 forAxis:v62];
  LODWORD(v63) = 1144750080;
  [(UIImageView *)self->_trailingImageView setContentHuggingPriority:0 forAxis:v63];
  v64 = [(CPUIMessageCell *)self trailingImageView];
  [(CPUIMessageCell *)self addSubview:v64];

  v65 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v9, v10, v11, v12);
  trailingGlyphView = self->_trailingGlyphView;
  self->_trailingGlyphView = v65;

  LODWORD(v67) = 1144750080;
  [(UIImageView *)self->_trailingGlyphView setContentCompressionResistancePriority:0 forAxis:v67];
  LODWORD(v68) = 1144750080;
  [(UIImageView *)self->_trailingGlyphView setContentHuggingPriority:0 forAxis:v68];
  [(UIImageView *)self->_trailingGlyphView setTranslatesAutoresizingMaskIntoConstraints:0];
  v69 = [(CPUIMessageCell *)self trailingGlyphView];
  [(CPUIMessageCell *)self addSubview:v69];

  v70 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v9, v10, v11, v12);
  leadingGlyphView = self->_leadingGlyphView;
  self->_leadingGlyphView = v70;

  [(UIImageView *)self->_leadingGlyphView setTranslatesAutoresizingMaskIntoConstraints:0];
  v72 = [(CPUIMessageCell *)self leadingGlyphView];
  [(CPUIMessageCell *)self addSubview:v72];

  [(CPUIMessageCell *)self setAccessibilityIdentifier:@"CPMessageListItem"];
  v73 = [(CPUIMessageCell *)self primaryLabel];
  [v73 setAccessibilityIdentifier:@"CPListItemTitle"];

  v74 = [(CPUIMessageCell *)self secondaryLabel];
  [v74 setAccessibilityIdentifier:@"CPListItemSubtitle"];

  v75 = [(CPUIMessageCell *)self trailingLabel];
  [v75 setAccessibilityIdentifier:@"CPListItemTrailingLabel"];
}

- (void)applyConfiguration:(id)a3
{
  uint64_t v196 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263F08938];
  double v6 = [(CPUIMessageCell *)self constraints];
  [v5 deactivateConstraints:v6];

  v7 = [MEMORY[0x263EFF980] array];
  -[_CPUIBaseTableCell setItemEnabled:](self, "setItemEnabled:", [v4 enabled]);
  id v8 = [v4 text];
  double v9 = [(CPUIMessageCell *)self primaryLabel];
  [v9 setText:v8];

  double v10 = [v4 detailText];
  double v11 = [(CPUIMessageCell *)self secondaryLabel];
  [v11 setText:v10];

  double v12 = [v4 trailingText];
  v13 = [(CPUIMessageCell *)self trailingLabel];
  [v13 setText:v12];

  v14 = [v4 image];
  v15 = [(CPUIMessageCell *)self primaryImageView];
  [v15 setImage:v14];

  uint64_t v16 = [v4 trailingImage];
  v17 = [(CPUIMessageCell *)self trailingImageView];
  [v17 setImage:v16];

  -[CPUIMessageCell setUnread:](self, "setUnread:", [v4 isUnread]);
  if ([v4 showsStar])
  {
    v18 = [(CPUIMessageCell *)self traitCollection];
    uint64_t v19 = @"star.fill";
    double v20 = 11.0;
LABEL_5:
    v21 = _CPUIGlyphFactoryWithTraitCollection(v19, 4, v18, v20);
    v22 = [v21 imageWithRenderingMode:2];
    [(CPUIMessageCell *)self setLeadingGlyph:v22];

    v23 = [(CPUIMessageCell *)self leadingGlyphView];
    v24 = [(CPUIMessageCell *)self leadingGlyph];
    [v23 setImage:v24];

    goto LABEL_7;
  }
  if ([v4 showsPin])
  {
    v18 = [(CPUIMessageCell *)self traitCollection];
    uint64_t v19 = @"pin.fill";
    double v20 = 10.0;
    goto LABEL_5;
  }
  v25 = [(CPUIMessageCell *)self leadingGlyphView];
  [v25 setImage:0];

  v26 = [(CPUIMessageCell *)self leadingGlyphView];
  [v26 setHighlightedImage:0];

  [(CPUIMessageCell *)self setLeadingGlyph:0];
LABEL_7:
  v27 = [v4 detailText];
  uint64_t v176 = [v27 length];

  if ([v4 showsStar]) {
    double v28 = 11.0;
  }
  else {
    double v28 = 10.0;
  }
  int v29 = [v4 isUnread];
  v30 = [(CPUIMessageCell *)self leadingGlyphView];
  v31 = [v30 image];

  v178 = v4;
  v179 = v7;
  if (v29)
  {
    unreadImageView = self->_unreadImageView;
    if (v31)
    {
      v33 = [(UIImageView *)unreadImageView centerXAnchor];
      v174 = [(CPUIMessageCell *)self leadingGlyphView];
      uint64_t v34 = [v174 centerXAnchor];
      uint64_t v188 = [v33 constraintEqualToAnchor:v34];
      v165 = [(UIImageView *)self->_unreadImageView heightAnchor];
      uint64_t v189 = [v165 constraintEqualToConstant:8.0];
      objc_super v35 = [(UIImageView *)self->_unreadImageView widthAnchor];
      uint64_t v157 = [(UIImageView *)self->_unreadImageView heightAnchor];
      v158 = v35;
      uint64_t v156 = objc_msgSend(v35, "constraintEqualToAnchor:");
      uint64_t v190 = v156;
      v36 = self->_unreadImageView;
      v160 = (void *)v189;
      v162 = v33;
      v168 = (void *)v188;
      v171 = (void *)v34;
      if (v176)
      {
        v37 = [(UIImageView *)v36 centerYAnchor];
        uint64_t v154 = [(UILabel *)self->_primaryLabel centerYAnchor];
        v155 = v37;
        uint64_t v153 = objc_msgSend(v37, "constraintEqualToAnchor:");
        uint64_t v191 = v153;
        v38 = [(UIImageView *)self->_leadingGlyphView centerYAnchor];
        v151 = [(UILabel *)self->_secondaryLabel centerYAnchor];
        v152 = v38;
        objc_msgSend(v38, "constraintEqualToAnchor:");
      }
      else
      {
        v51 = [(UIImageView *)v36 topAnchor];
        uint64_t v154 = [(CPUIMessageCell *)self topAnchor];
        v155 = v51;
        uint64_t v153 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", 10.0);
        uint64_t v191 = v153;
        double v52 = [(UIImageView *)self->_leadingGlyphView bottomAnchor];
        v151 = [(CPUIMessageCell *)self bottomAnchor];
        v152 = v52;
        objc_msgSend(v52, "constraintEqualToAnchor:constant:", -10.0);
      uint64_t v192 = };
      double v53 = [(UIImageView *)self->_leadingGlyphView leadingAnchor];
      v54 = [(CPUIMessageCell *)self leadingAnchor];
      v55 = [v53 constraintEqualToAnchor:v54 constant:6.0];
      v193 = v55;
      v56 = [(UIImageView *)self->_leadingGlyphView heightAnchor];
      double v57 = [v56 constraintEqualToConstant:v28];
      v194 = v57;
      double v58 = [(UIImageView *)self->_leadingGlyphView widthAnchor];
      v59 = [(UIImageView *)self->_leadingGlyphView heightAnchor];
      v60 = [v58 constraintEqualToAnchor:v59];
      v195 = v60;
      v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v188 count:8];
      [v179 addObjectsFromArray:v61];

      id v4 = v178;
      v41 = v160;
      v49 = v162;
      v43 = (void *)v157;
      v42 = v158;
      v45 = v155;
      v44 = (void *)v156;
      v47 = (void *)v153;
      v46 = (void *)v154;
      goto LABEL_20;
    }
    v49 = [(UIImageView *)unreadImageView leadingAnchor];
    v174 = [(CPUIMessageCell *)self leadingAnchor];
    v171 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", 6.0);
    v187[0] = v171;
    v50 = [(UIImageView *)self->_unreadImageView centerYAnchor];
    v165 = [(CPUIMessageCell *)self centerYAnchor];
    v168 = v50;
    v41 = [v50 constraintEqualToAnchor:v165];
    v187[1] = v41;
    v42 = [(UIImageView *)self->_unreadImageView heightAnchor];
    v43 = [v42 constraintEqualToConstant:8.0];
    v187[2] = v43;
    v44 = [(UIImageView *)self->_unreadImageView widthAnchor];
    v45 = [(UIImageView *)self->_unreadImageView heightAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    v187[3] = v46;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v187 count:4];
    v48 = v179;
  }
  else
  {
    if (!v31) {
      goto LABEL_21;
    }
    v163 = [(UIImageView *)self->_leadingGlyphView leadingAnchor];
    v174 = [(CPUIMessageCell *)self leadingAnchor];
    v171 = objc_msgSend(v163, "constraintEqualToAnchor:constant:", 6.0);
    v186[0] = v171;
    v39 = [(UIImageView *)self->_leadingGlyphView centerYAnchor];
    v165 = [(CPUIMessageCell *)self centerYAnchor];
    v168 = v39;
    objc_msgSend(v39, "constraintEqualToAnchor:");
    v41 = v40 = v7;
    v186[1] = v41;
    v42 = [(UIImageView *)self->_leadingGlyphView heightAnchor];
    v43 = [v42 constraintEqualToConstant:v28];
    v186[2] = v43;
    v44 = [(UIImageView *)self->_leadingGlyphView widthAnchor];
    v45 = [(UIImageView *)self->_leadingGlyphView heightAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    v186[3] = v46;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v186 count:4];
    v48 = v40;
    v49 = v163;
  }
  [v48 addObjectsFromArray:v47];
LABEL_20:

  v7 = v179;
LABEL_21:
  double v62 = [v4 image];

  if (!v62)
  {
    v64 = [(UILabel *)self->_primaryLabel leadingAnchor];
    v65 = [(CPUIMessageCell *)self leadingAnchor];
    v66 = [v64 constraintEqualToAnchor:v65 constant:30.0];
    v184 = v66;
    double v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v184 count:1];
    [v7 addObjectsFromArray:v67];
    goto LABEL_29;
  }
  if ([v4 isUnread])
  {
    leadingGlyphView = self->_unreadImageView;
  }
  else
  {
    double v68 = [(UIImageView *)self->_leadingGlyphView image];

    if (!v68)
    {
      uint64_t v69 = [(CPUIMessageCell *)self leadingAnchor];
      double v70 = 20.0;
      goto LABEL_28;
    }
    leadingGlyphView = self->_leadingGlyphView;
  }
  uint64_t v69 = [(UIImageView *)leadingGlyphView trailingAnchor];
  double v70 = 6.0;
LABEL_28:
  v175 = (void *)v69;
  v169 = [(UIImageView *)self->_primaryImageView centerYAnchor];
  uint64_t v164 = [(CPUIMessageCell *)self centerYAnchor];
  double v67 = [v169 constraintEqualToAnchor:v164];
  v185[0] = v67;
  v172 = [(UIImageView *)self->_primaryImageView leadingAnchor];
  v166 = [v172 constraintEqualToAnchor:v69 constant:v70];
  v185[1] = v166;
  v161 = [(UIImageView *)self->_primaryImageView widthAnchor];
  v159 = [v161 constraintEqualToConstant:30.0];
  v185[2] = v159;
  v71 = [(UIImageView *)self->_primaryImageView heightAnchor];
  v72 = [(UIImageView *)self->_primaryImageView widthAnchor];
  v73 = [v71 constraintEqualToAnchor:v72];
  v185[3] = v73;
  v74 = [(UILabel *)self->_primaryLabel leadingAnchor];
  v75 = [(UIImageView *)self->_primaryImageView trailingAnchor];
  v76 = [v74 constraintEqualToAnchor:v75 constant:8.0];
  v185[4] = v76;
  objc_super v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v185 count:5];
  [v179 addObjectsFromArray:v77];

  v66 = (void *)v164;
  v65 = v169;

  v64 = v175;
LABEL_29:

  primaryLabel = self->_primaryLabel;
  if (v176)
  {
    v177 = [(UILabel *)primaryLabel firstBaselineAnchor];
    uint64_t v167 = [(CPUIMessageCell *)self topAnchor];
    v79 = [v177 constraintEqualToAnchor:v167 constant:20.0];
    v183[0] = v79;
    v173 = [(UILabel *)self->_secondaryLabel leadingAnchor];
    v170 = [(UILabel *)self->_primaryLabel leadingAnchor];
    uint64_t v80 = [v173 constraintEqualToAnchor:v170];
    v183[1] = v80;
    v81 = [(UILabel *)self->_secondaryLabel trailingAnchor];
    uint64_t v82 = [(UILabel *)self->_primaryLabel trailingAnchor];
    v83 = [v81 constraintEqualToAnchor:v82];
    v183[2] = v83;
    v84 = [(UILabel *)self->_secondaryLabel topAnchor];
    v85 = [(UILabel *)self->_primaryLabel bottomAnchor];
    v86 = [v84 constraintEqualToAnchor:v85];
    v183[3] = v86;
    v87 = [MEMORY[0x263EFF8C0] arrayWithObjects:v183 count:4];
    [v179 addObjectsFromArray:v87];

    v88 = (void *)v167;
    v89 = v177;
  }
  else
  {
    v89 = [(UILabel *)primaryLabel centerYAnchor];
    v88 = [(CPUIMessageCell *)self centerYAnchor];
    v79 = [v89 constraintEqualToAnchor:v88];
    [v179 addObject:v79];
  }

  v90 = [MEMORY[0x263EFF980] array];
  v91 = [v178 trailingText];
  uint64_t v92 = [v91 length];

  if (v92)
  {
    v93 = [(UILabel *)self->_trailingLabel centerYAnchor];
    v94 = [(CPUIMessageCell *)self centerYAnchor];
    v95 = [v93 constraintEqualToAnchor:v94];
    v182[0] = v95;
    v96 = [(UILabel *)self->_trailingLabel trailingAnchor];
    v97 = [(CPUIMessageCell *)self trailingAnchor];
    v98 = [v96 constraintEqualToAnchor:v97 constant:-28.0];
    v182[1] = v98;
    v99 = [MEMORY[0x263EFF8C0] arrayWithObjects:v182 count:2];
    [v179 addObjectsFromArray:v99];

    v100 = [(CPUIMessageCell *)self trailingLabel];
    [v90 insertObject:v100 atIndex:0];
  }
  v101 = [v178 trailingImage];

  if (v101)
  {
    v102 = [(UIImageView *)self->_trailingImageView centerYAnchor];
    v103 = [(CPUIMessageCell *)self centerYAnchor];
    v104 = [v102 constraintEqualToAnchor:v103];
    v181 = v104;
    v105 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v181 count:1];
    v106 = v179;
    [v179 addObjectsFromArray:v105];

    uint64_t v107 = [v90 count];
    v108 = [(UIImageView *)self->_trailingImageView trailingAnchor];
    if (v107)
    {
      v109 = [v90 objectAtIndexedSubscript:0];
      v110 = [v109 leadingAnchor];
      v111 = [v108 constraintEqualToAnchor:v110 constant:-8.0];
      [v179 addObject:v111];
    }
    else
    {
      v109 = [(CPUIMessageCell *)self trailingAnchor];
      v110 = [v108 constraintEqualToAnchor:v109 constant:-28.0];
      [v179 addObject:v110];
    }

    v112 = [(CPUIMessageCell *)self trailingImageView];
    [v90 insertObject:v112 atIndex:0];
  }
  else
  {
    v112 = [(CPUIMessageCell *)self trailingImageView];
    [v112 setImage:0];
    v106 = v179;
  }

  if ([v178 showsMute])
  {
    v113 = [(CPUIMessageCell *)self traitCollection];
    v114 = _CPUIGlyphFactoryWithTraitCollection(@"speaker.slash.fill", 4, v113, 20.0);
    [(CPUIMessageCell *)self setTrailingGlyph:v114];

    v115 = [(UIImageView *)self->_trailingGlyphView centerYAnchor];
    v116 = [(CPUIMessageCell *)self centerYAnchor];
    v117 = [v115 constraintEqualToAnchor:v116];
    v180 = v117;
    v118 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v180 count:1];
    [v106 addObjectsFromArray:v118];

    uint64_t v119 = [v90 count];
    v120 = [(UIImageView *)self->_trailingGlyphView trailingAnchor];
    if (v119)
    {
      v121 = [v90 objectAtIndexedSubscript:0];
      v122 = [v121 leadingAnchor];
      v123 = [v120 constraintEqualToAnchor:v122 constant:-8.0];
      [v106 addObject:v123];
    }
    else
    {
      v121 = [(CPUIMessageCell *)self trailingAnchor];
      v122 = [v120 constraintEqualToAnchor:v121 constant:-28.0];
      [v106 addObject:v122];
    }

    v126 = [(CPUIMessageCell *)self trailingGlyphView];
    [v90 insertObject:v126 atIndex:0];
  }
  else
  {
    v124 = [(CPUIMessageCell *)self trailingGlyphView];
    [v124 setImage:0];

    v125 = [(CPUIMessageCell *)self trailingGlyphView];
    [v125 setHighlightedImage:0];

    [(CPUIMessageCell *)self setTrailingGlyph:0];
  }
  uint64_t v127 = [v90 count];
  v128 = [(UILabel *)self->_primaryLabel trailingAnchor];
  if (v127)
  {
    v129 = [v90 objectAtIndexedSubscript:0];
    v130 = [v129 leadingAnchor];
    v131 = [v128 constraintEqualToAnchor:v130 constant:-8.0];
    [v106 addObject:v131];
  }
  else
  {
    v129 = [(CPUIMessageCell *)self trailingAnchor];
    v130 = [v128 constraintEqualToAnchor:v129 constant:-28.0];
    [v106 addObject:v130];
  }

  id v132 = objc_alloc_init(MEMORY[0x263EFF980]);
  v133 = [(CPUIMessageCell *)self primaryLabel];
  v134 = [v133 text];

  if (v134)
  {
    v135 = [(CPUIMessageCell *)self primaryLabel];
    v136 = [v135 text];
    [v132 addObject:v136];
  }
  v137 = [(CPUIMessageCell *)self secondaryLabel];
  v138 = [v137 text];

  if (v138)
  {
    v139 = [(CPUIMessageCell *)self secondaryLabel];
    v140 = [v139 text];
    [v132 addObject:v140];
  }
  v141 = [(CPUIMessageCell *)self trailingLabel];
  v142 = [v141 text];

  if (v142)
  {
    v143 = [(CPUIMessageCell *)self trailingLabel];
    v144 = [v143 text];
    [v132 addObject:v144];
  }
  v145 = (void *)[v132 copy];
  [(CPUIMessageCell *)self setAccessibilityUserInputLabels:v145];

  [(CPUIMessageCell *)self _updateTintColors];
  v146 = [MEMORY[0x263EFF8C0] arrayWithArray:v106];
  constraints = self->_constraints;
  self->_constraints = v146;

  v148 = (void *)MEMORY[0x263F08938];
  v149 = [(CPUIMessageCell *)self constraints];
  [v148 activateConstraints:v149];

  [(CPUIMessageCell *)self setNeedsLayout];
}

- (void)setUnread:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CPUIMessageCell *)self unreadImageView];
  double v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      v7 = UIImageGetUnreadIndicator();
      [(CPUIMessageCell *)self setUnreadIndicatorImage:v7];

      id v8 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:self->_unreadIndicatorImage];
      [(CPUIMessageCell *)self setUnreadImageView:v8];

      double v9 = [(CPUIMessageCell *)self unreadImageView];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v10 = [(CPUIMessageCell *)self unreadImageView];
      [(CPUIMessageCell *)self addSubview:v10];
    }
  }
  else
  {
    [v5 removeFromSuperview];

    [(CPUIMessageCell *)self setUnreadImageView:0];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  BOOL v5 = [a3 nextFocusedItem];
  [(CPUIMessageCell *)self setHighlighted:v5 == self animated:0];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CPUIMessageCell;
  [(CPUIMessageCell *)&v11 setHighlighted:a3 animated:a4];
  [(CPUIMessageCell *)self _updateTintColors];
  if ([(_CPUIBaseTableCell *)self itemEnabled])
  {
    if (a3)
    {
      double v6 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
      v7 = [(CPUIMessageCell *)self accessoryView];
      [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
    }
    else
    {
      double v6 = [MEMORY[0x263F825C8] _carSystemFocusColor];
      v7 = [(CPUIMessageCell *)self accessoryView];
      [MEMORY[0x263F825C8] _carSystemSecondaryColor];
    id v8 = };
    [v7 setTintColor:v8];
  }
  else
  {
    if (a3) {
      +[_CPUIBaseTableCell disabledHighlightedColor];
    }
    else {
    double v6 = +[_CPUIBaseTableCell disabledColor];
    }
    v7 = [(CPUIMessageCell *)self accessoryView];
    [v7 setTintColor:v6];
  }

  double v9 = [(CPUIMessageCell *)self leadingGlyphView];
  [v9 setTintColor:v6];

  id v10 = [(CPUIMessageCell *)self trailingGlyphView];
  [v10 setTintColor:v6];
}

- (UIImageView)unreadImageView
{
  return self->_unreadImageView;
}

- (void)setUnreadImageView:(id)a3
{
}

- (UIImageView)leadingGlyphView
{
  return self->_leadingGlyphView;
}

- (void)setLeadingGlyphView:(id)a3
{
}

- (UIImageView)primaryImageView
{
  return self->_primaryImageView;
}

- (void)setPrimaryImageView:(id)a3
{
}

- (UIImage)leadingGlyph
{
  return self->_leadingGlyph;
}

- (void)setLeadingGlyph:(id)a3
{
}

- (UIImage)unreadIndicatorImage
{
  return self->_unreadIndicatorImage;
}

- (void)setUnreadIndicatorImage:(id)a3
{
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UILabel)trailingLabel
{
  return self->_trailingLabel;
}

- (void)setTrailingLabel:(id)a3
{
}

- (UIImageView)trailingImageView
{
  return self->_trailingImageView;
}

- (void)setTrailingImageView:(id)a3
{
}

- (UIImageView)trailingGlyphView
{
  return self->_trailingGlyphView;
}

- (void)setTrailingGlyphView:(id)a3
{
}

- (UIImage)trailingGlyph
{
  return self->_trailingGlyph;
}

- (void)setTrailingGlyph:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_trailingGlyph, 0);
  objc_storeStrong((id *)&self->_trailingGlyphView, 0);
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_unreadIndicatorImage, 0);
  objc_storeStrong((id *)&self->_leadingGlyph, 0);
  objc_storeStrong((id *)&self->_primaryImageView, 0);
  objc_storeStrong((id *)&self->_leadingGlyphView, 0);
  objc_storeStrong((id *)&self->_unreadImageView, 0);
}

@end