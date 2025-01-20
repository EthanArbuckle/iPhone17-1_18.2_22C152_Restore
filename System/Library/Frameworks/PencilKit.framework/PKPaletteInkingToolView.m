@interface PKPaletteInkingToolView
- (BOOL)_shouldHaveAttributeViewController;
- (BOOL)_shouldInstallOpacityLabel;
- (CGRect)_colorIndicatorImageViewFrame;
- (NSLayoutConstraint)opacityLabelCenterXConstraint;
- (NSLayoutConstraint)opacityLabelCenterYConstraint;
- (NSLayoutConstraint)opacityLabelLeftConstraint;
- (NSLayoutConstraint)opacityLabelRightConstraint;
- (NSLayoutConstraint)opacityLabelTopConstraint;
- (PKInk)ink;
- (PKPaletteInkingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5;
- (PKPaletteInkingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5 toolProperties:(id)a6;
- (UIImage)colorIndicatorContourImageLeft;
- (UIImage)colorIndicatorContourImageRight;
- (UIImage)colorIndicatorContourImageUp;
- (UIImage)colorIndicatorImageLeft;
- (UIImage)colorIndicatorImageRight;
- (UIImage)colorIndicatorImageUp;
- (UIImage)toolTipContourImageLeft;
- (UIImage)toolTipContourImageRight;
- (UIImage)toolTipContourImageUp;
- (UIImage)toolTipImageLeft;
- (UIImage)toolTipImageRight;
- (UIImage)toolTipImageUp;
- (UIImageView)colorIndicatorContourImageView;
- (UIImageView)colorIndicatorImageView;
- (UIImageView)tipIndicatorContourImageView;
- (UIImageView)tipIndicatorImageView;
- (UILabel)opacityLabel;
- (id)_opacityLabelFont;
- (id)_opacityLabelTextColor;
- (id)_toolColorIndicatorContourImageForCurrentEdgeLocation;
- (id)_toolColorIndicatorImageForCurrentEdgeLocation;
- (id)_toolTipContourImageForCurrentEdgeLocation;
- (id)_toolTipImageForCurrentEdgeLocation;
- (id)_uiColor;
- (id)attributeViewController;
- (id)toolProperties;
- (int64_t)_uiColorUserInterfaceStyle;
- (unint64_t)_displayModeForAttributeViewController;
- (void)_reloadToolImage;
- (void)_setToolProperties:(id)a3 toolIdentifier:(id)a4;
- (void)_updateOpacityLabel;
- (void)_updateToolColorBandAndTipImageViews;
- (void)inkAttributesPickerDidChangeInkOpacity:(id)a3;
- (void)inkAttributesPickerDidChangeInkThickness:(id)a3;
- (void)layoutSubviews;
- (void)setColorIndicatorContourImageLeft:(id)a3;
- (void)setColorIndicatorContourImageRight:(id)a3;
- (void)setColorIndicatorContourImageUp:(id)a3;
- (void)setColorIndicatorContourImageView:(id)a3;
- (void)setColorIndicatorImageLeft:(id)a3;
- (void)setColorIndicatorImageRight:(id)a3;
- (void)setColorIndicatorImageUp:(id)a3;
- (void)setColorIndicatorImageView:(id)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setInk:(id)a3;
- (void)setInkColor:(id)a3;
- (void)setInkWeight:(double)a3;
- (void)setOpacityLabel:(id)a3;
- (void)setOpacityLabelCenterXConstraint:(id)a3;
- (void)setOpacityLabelCenterYConstraint:(id)a3;
- (void)setOpacityLabelLeftConstraint:(id)a3;
- (void)setOpacityLabelRightConstraint:(id)a3;
- (void)setOpacityLabelTopConstraint:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setTipIndicatorContourImageView:(id)a3;
- (void)setTipIndicatorImageView:(id)a3;
- (void)setToolProperties:(id)a3;
- (void)setToolTipContourImageLeft:(id)a3;
- (void)setToolTipContourImageRight:(id)a3;
- (void)setToolTipContourImageUp:(id)a3;
- (void)setToolTipImageLeft:(id)a3;
- (void)setToolTipImageRight:(id)a3;
- (void)setToolTipImageUp:(id)a3;
- (void)updateConstraints;
@end

@implementation PKPaletteInkingToolView

- (PKPaletteInkingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 defaultColor];
  if (!v10)
  {
    v10 = [MEMORY[0x1E4FB1618] blackColor];
  }
  long long v26 = xmmword_1C4829D70;
  *(_OWORD *)v27 = unk_1C4829D80;
  id v11 = v10;
  DKUColorGetRGBAComponents((CGColor *)[v11 CGColor], &v26);
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v24[0] = @"PKInkRedComponentProperty";
  v13 = [NSNumber numberWithDouble:*(double *)&v26];
  v25[0] = v13;
  v24[1] = @"PKInkGreenComponentProperty";
  v14 = [NSNumber numberWithDouble:*((double *)&v26 + 1)];
  v25[1] = v14;
  v24[2] = @"PKInkBlueComponentProperty";
  v15 = [NSNumber numberWithDouble:v27[0]];
  v25[2] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  [v12 setObject:v16 forKeyedSubscript:@"PKInkColorProperty"];

  v17 = NSNumber;
  +[PKInk defaultWeightForIdentifier:v9];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  [v12 setObject:v18 forKeyedSubscript:@"PKInkWeightProperty"];

  v19 = [NSNumber numberWithDouble:v27[1]];
  [v12 setObject:v19 forKeyedSubscript:@"PKInkOpacityProperty"];

  [v12 setObject:v8 forKeyedSubscript:@"PKInkVariantProperty"];
  v20 = (void *)[v12 copy];
  v21 = [(PKPaletteInkingToolView *)self initWithToolIdentifier:v9 variant:v8 configuration:v7 toolProperties:v20];

  return v21;
}

- (PKPaletteInkingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5 toolProperties:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v114.receiver = self;
  v114.super_class = (Class)PKPaletteInkingToolView;
  v12 = [(PKPaletteToolView *)&v114 initWithToolIdentifier:v10 variant:a4 configuration:a5];
  v13 = v12;
  if (v12)
  {
    [(PKPaletteInkingToolView *)v12 _setToolProperties:v11 toolIdentifier:v10];
    if (([v10 isEqual:@"com.apple.ink.lasso"] & 1) == 0
      && ([v10 isEqual:@"com.apple.ink.generationtool"] & 1) == 0)
    {
      v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      colorIndicatorImageView = v13->_colorIndicatorImageView;
      v13->_colorIndicatorImageView = v14;

      v16 = [MEMORY[0x1E4FB1E20] traitCollectionWithLegibilityWeight:0];
      [(UIImageView *)v13->_colorIndicatorImageView _setLocalOverrideTraitCollection:v16];

      [(PKPaletteInkingToolView *)v13 addSubview:v13->_colorIndicatorImageView];
      v17 = [(PKPaletteToolView *)v13 configuration];
      v18 = [v17 bandMaskImage];
      v19 = [v18 imageWithRenderingMode:2];
      [(PKPaletteInkingToolView *)v13 setColorIndicatorImageUp:v19];

      v20 = (void *)MEMORY[0x1E4FB1818];
      id v21 = [(PKPaletteInkingToolView *)v13 colorIndicatorImageUp];
      uint64_t v22 = [v21 CGImage];
      v23 = [(PKPaletteInkingToolView *)v13 colorIndicatorImageUp];
      [v23 scale];
      v24 = objc_msgSend(v20, "imageWithCGImage:scale:orientation:", v22, 3);
      v25 = [v24 imageWithRenderingMode:2];
      [(PKPaletteInkingToolView *)v13 setColorIndicatorImageRight:v25];

      long long v26 = (void *)MEMORY[0x1E4FB1818];
      id v27 = [(PKPaletteInkingToolView *)v13 colorIndicatorImageUp];
      uint64_t v28 = [v27 CGImage];
      v29 = [(PKPaletteInkingToolView *)v13 colorIndicatorImageUp];
      [v29 scale];
      v30 = objc_msgSend(v26, "imageWithCGImage:scale:orientation:", v28, 2);
      v31 = [v30 imageWithRenderingMode:2];
      [(PKPaletteInkingToolView *)v13 setColorIndicatorImageLeft:v31];

      v32 = [(PKPaletteInkingToolView *)v13 colorIndicatorImageUp];
      [(UIImageView *)v13->_colorIndicatorImageView setImage:v32];

      v33 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      colorIndicatorContourImageView = v13->_colorIndicatorContourImageView;
      v13->_colorIndicatorContourImageView = v33;

      v35 = [MEMORY[0x1E4FB1E20] traitCollectionWithLegibilityWeight:0];
      [(UIImageView *)v13->_colorIndicatorContourImageView _setLocalOverrideTraitCollection:v35];

      [(PKPaletteInkingToolView *)v13 addSubview:v13->_colorIndicatorContourImageView];
      v36 = [(PKPaletteToolView *)v13 configuration];
      v37 = [v36 bandContourImage];
      uint64_t v38 = [v37 imageWithRenderingMode:1];
      colorIndicatorContourImageUp = v13->_colorIndicatorContourImageUp;
      v13->_colorIndicatorContourImageUp = (UIImage *)v38;

      v40 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v41 = [(UIImage *)v13->_colorIndicatorContourImageUp CGImage];
      [(UIImage *)v13->_colorIndicatorContourImageUp scale];
      v42 = objc_msgSend(v40, "imageWithCGImage:scale:orientation:", v41, 2);
      uint64_t v43 = [v42 imageWithRenderingMode:1];
      colorIndicatorContourImageLeft = v13->_colorIndicatorContourImageLeft;
      v13->_colorIndicatorContourImageLeft = (UIImage *)v43;

      v45 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v46 = [(UIImage *)v13->_colorIndicatorContourImageUp CGImage];
      [(UIImage *)v13->_colorIndicatorContourImageUp scale];
      v47 = objc_msgSend(v45, "imageWithCGImage:scale:orientation:", v46, 3);
      uint64_t v48 = [v47 imageWithRenderingMode:1];
      colorIndicatorContourImageRight = v13->_colorIndicatorContourImageRight;
      v13->_colorIndicatorContourImageRight = (UIImage *)v48;

      [(UIImageView *)v13->_colorIndicatorContourImageView setImage:v13->_colorIndicatorContourImageUp];
      v50 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      tipIndicatorImageView = v13->_tipIndicatorImageView;
      v13->_tipIndicatorImageView = v50;

      v52 = [MEMORY[0x1E4FB1E20] traitCollectionWithLegibilityWeight:0];
      [(UIImageView *)v13->_tipIndicatorImageView _setLocalOverrideTraitCollection:v52];

      v53 = [(PKPaletteToolView *)v13 imageContentView];
      [v53 addSubview:v13->_tipIndicatorImageView];

      v54 = [(PKPaletteToolView *)v13 configuration];
      v55 = [v54 tipMaskImage];
      v56 = [v55 imageWithRenderingMode:2];
      [(PKPaletteInkingToolView *)v13 setToolTipImageUp:v56];

      v57 = (void *)MEMORY[0x1E4FB1818];
      id v58 = [(PKPaletteInkingToolView *)v13 toolTipImageUp];
      uint64_t v59 = [v58 CGImage];
      v60 = [(PKPaletteInkingToolView *)v13 toolTipImageUp];
      [v60 scale];
      v61 = objc_msgSend(v57, "imageWithCGImage:scale:orientation:", v59, 3);
      v62 = [v61 imageWithRenderingMode:2];
      [(PKPaletteInkingToolView *)v13 setToolTipImageRight:v62];

      v63 = (void *)MEMORY[0x1E4FB1818];
      id v64 = [(PKPaletteInkingToolView *)v13 toolTipImageUp];
      uint64_t v65 = [v64 CGImage];
      v66 = [(PKPaletteInkingToolView *)v13 toolTipImageUp];
      [v66 scale];
      v67 = objc_msgSend(v63, "imageWithCGImage:scale:orientation:", v65, 2);
      v68 = [v67 imageWithRenderingMode:2];
      [(PKPaletteInkingToolView *)v13 setToolTipImageLeft:v68];

      v69 = [(PKPaletteInkingToolView *)v13 toolTipImageUp];
      v70 = [(PKPaletteInkingToolView *)v13 tipIndicatorImageView];
      [v70 setImage:v69];

      v71 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      tipIndicatorContourImageView = v13->_tipIndicatorContourImageView;
      v13->_tipIndicatorContourImageView = v71;

      v73 = [MEMORY[0x1E4FB1E20] traitCollectionWithLegibilityWeight:0];
      [(UIImageView *)v13->_tipIndicatorContourImageView _setLocalOverrideTraitCollection:v73];

      v74 = [(PKPaletteToolView *)v13 imageContentView];
      [v74 addSubview:v13->_tipIndicatorContourImageView];

      v75 = [(PKPaletteToolView *)v13 configuration];
      v76 = [v75 tipContourImage];
      uint64_t v77 = [v76 imageWithRenderingMode:1];
      toolTipContourImageUp = v13->_toolTipContourImageUp;
      v13->_toolTipContourImageUp = (UIImage *)v77;

      v79 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v80 = [(UIImage *)v13->_toolTipContourImageUp CGImage];
      [(UIImage *)v13->_toolTipContourImageUp scale];
      v81 = objc_msgSend(v79, "imageWithCGImage:scale:orientation:", v80, 2);
      uint64_t v82 = [v81 imageWithRenderingMode:1];
      toolTipContourImageLeft = v13->_toolTipContourImageLeft;
      v13->_toolTipContourImageLeft = (UIImage *)v82;

      v84 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v85 = [(UIImage *)v13->_toolTipContourImageUp CGImage];
      [(UIImage *)v13->_toolTipContourImageUp scale];
      v86 = objc_msgSend(v84, "imageWithCGImage:scale:orientation:", v85, 3);
      uint64_t v87 = [v86 imageWithRenderingMode:1];
      toolTipContourImageRight = v13->_toolTipContourImageRight;
      v13->_toolTipContourImageRight = (UIImage *)v87;

      [(UIImageView *)v13->_tipIndicatorContourImageView setImage:v13->_toolTipContourImageUp];
      if ([(PKPaletteInkingToolView *)v13 _shouldInstallOpacityLabel])
      {
        v89 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        opacityLabel = v13->_opacityLabel;
        v13->_opacityLabel = v89;

        v91 = [(PKPaletteInkingToolView *)v13 _opacityLabelFont];
        [(UILabel *)v13->_opacityLabel setFont:v91];

        [(UILabel *)v13->_opacityLabel setTextAlignment:1];
        [(UILabel *)v13->_opacityLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        v92 = [(PKPaletteInkingToolView *)v13 _opacityLabelTextColor];
        [(UILabel *)v13->_opacityLabel setTextColor:v92];
        [(PKPaletteInkingToolView *)v13 addSubview:v13->_opacityLabel];
        [(PKPaletteInkingToolView *)v13 _updateOpacityLabel];
        v93 = [(UILabel *)v13->_opacityLabel topAnchor];
        v94 = [(PKPaletteInkingToolView *)v13 topAnchor];
        uint64_t v95 = [v93 constraintEqualToAnchor:v94];
        opacityLabelTopConstraint = v13->_opacityLabelTopConstraint;
        v13->_opacityLabelTopConstraint = (NSLayoutConstraint *)v95;

        v97 = [(UILabel *)v13->_opacityLabel leftAnchor];
        v98 = [(PKPaletteInkingToolView *)v13 leftAnchor];
        uint64_t v99 = [v97 constraintEqualToAnchor:v98];
        opacityLabelLeftConstraint = v13->_opacityLabelLeftConstraint;
        v13->_opacityLabelLeftConstraint = (NSLayoutConstraint *)v99;

        v101 = [(PKPaletteInkingToolView *)v13 rightAnchor];
        v102 = [(UILabel *)v13->_opacityLabel rightAnchor];
        uint64_t v103 = [v101 constraintEqualToAnchor:v102];
        opacityLabelRightConstraint = v13->_opacityLabelRightConstraint;
        v13->_opacityLabelRightConstraint = (NSLayoutConstraint *)v103;

        v105 = [(UILabel *)v13->_opacityLabel centerXAnchor];
        v106 = [(PKPaletteInkingToolView *)v13 centerXAnchor];
        uint64_t v107 = [v105 constraintEqualToAnchor:v106];
        opacityLabelCenterXConstraint = v13->_opacityLabelCenterXConstraint;
        v13->_opacityLabelCenterXConstraint = (NSLayoutConstraint *)v107;

        v109 = [(UILabel *)v13->_opacityLabel centerYAnchor];
        v110 = [(PKPaletteInkingToolView *)v13 centerYAnchor];
        uint64_t v111 = [v109 constraintEqualToAnchor:v110];
        opacityLabelCenterYConstraint = v13->_opacityLabelCenterYConstraint;
        v13->_opacityLabelCenterYConstraint = (NSLayoutConstraint *)v111;
      }
      [(PKPaletteInkingToolView *)v13 setEdgeLocation:4];
    }
  }

  return v13;
}

- (BOOL)_shouldInstallOpacityLabel
{
  v3 = [(PKPaletteToolView *)self configuration];
  if ([v3 supportsOpacity])
  {
    uint64_t v4 = [(PKPaletteToolView *)self configuration];
    v5 = (void *)v4;
    if (v4) {
      v6 = *(void **)(v4 + 160);
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_opacityLabelTextColor
{
  if (PKIsVisionDevice()) {
    [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_31];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }

  return v2;
}

id __49__PKPaletteInkingToolView__opacityLabelTextColor__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__9;
  id v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  v3 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PKPaletteInkingToolView__opacityLabelTextColor__block_invoke_9;
  v6[3] = &unk_1E64C5478;
  v6[4] = &v7;
  [v3 performAsCurrentTraitCollection:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__PKPaletteInkingToolView__opacityLabelTextColor__block_invoke_9(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_setToolProperties:(id)a3 toolIdentifier:(id)a4
{
  v5 = +[PKInk inkWithIdentifier:a4 properties:a3];
  [(PKPaletteInkingToolView *)self setInk:v5];

  [(PKPaletteInkingToolView *)self _updateOpacityLabel];
  uint64_t v6 = [(PKPaletteToolView *)self configuration];
  uint64_t v7 = (void *)v6;
  if (v6) {
    BOOL v8 = *(void **)(v6 + 160);
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    [(PKPaletteToolView *)self _setToolImageNeedsReload];
  }
}

- (void)setToolProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaletteToolView *)self toolIdentifier];
  [(PKPaletteInkingToolView *)self _setToolProperties:v4 toolIdentifier:v5];
}

- (id)toolProperties
{
  uint64_t v2 = [(PKPaletteInkingToolView *)self ink];
  uint64_t v3 = [v2 properties];

  return v3;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)PKPaletteInkingToolView;
  [(PKPaletteToolView *)&v33 layoutSubviews];
  [(PKPaletteInkingToolView *)self _colorIndicatorImageViewFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(PKPaletteInkingToolView *)self colorIndicatorImageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v12 = [(PKPaletteInkingToolView *)self colorIndicatorContourImageView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  v13 = [(PKPaletteToolView *)self imageContentView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  uint64_t v22 = [(PKPaletteInkingToolView *)self tipIndicatorImageView];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = [(PKPaletteToolView *)self imageContentView];
  [v23 bounds];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  v32 = [(PKPaletteInkingToolView *)self tipIndicatorContourImageView];
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);
}

- (id)_toolColorIndicatorImageForCurrentEdgeLocation
{
  if ([(PKPaletteToolView *)self edgeLocation] == 2)
  {
    double v3 = [(PKPaletteInkingToolView *)self colorIndicatorImageRight];
  }
  else
  {
    if ([(PKPaletteToolView *)self edgeLocation] == 8) {
      [(PKPaletteInkingToolView *)self colorIndicatorImageLeft];
    }
    else {
    double v3 = [(PKPaletteInkingToolView *)self colorIndicatorImageUp];
    }
  }

  return v3;
}

- (id)_toolColorIndicatorContourImageForCurrentEdgeLocation
{
  if ([(PKPaletteToolView *)self edgeLocation] == 2)
  {
    double v3 = [(PKPaletteInkingToolView *)self colorIndicatorContourImageRight];
  }
  else
  {
    if ([(PKPaletteToolView *)self edgeLocation] == 8) {
      [(PKPaletteInkingToolView *)self colorIndicatorContourImageLeft];
    }
    else {
    double v3 = [(PKPaletteInkingToolView *)self colorIndicatorContourImageUp];
    }
  }

  return v3;
}

- (id)_toolTipImageForCurrentEdgeLocation
{
  if ([(PKPaletteToolView *)self edgeLocation] == 2)
  {
    double v3 = [(PKPaletteInkingToolView *)self toolTipImageRight];
  }
  else
  {
    if ([(PKPaletteToolView *)self edgeLocation] == 8) {
      [(PKPaletteInkingToolView *)self toolTipImageLeft];
    }
    else {
    double v3 = [(PKPaletteInkingToolView *)self toolTipImageUp];
    }
  }

  return v3;
}

- (id)_toolTipContourImageForCurrentEdgeLocation
{
  if ([(PKPaletteToolView *)self edgeLocation] == 2)
  {
    double v3 = [(PKPaletteInkingToolView *)self toolTipContourImageRight];
  }
  else
  {
    if ([(PKPaletteToolView *)self edgeLocation] == 8) {
      [(PKPaletteInkingToolView *)self toolTipContourImageLeft];
    }
    else {
    double v3 = [(PKPaletteInkingToolView *)self toolTipContourImageUp];
    }
  }

  return v3;
}

- (CGRect)_colorIndicatorImageViewFrame
{
  double v3 = [(PKPaletteToolView *)self configuration];
  if ([v3 supportsStrokeWeight])
  {
    double v4 = [(PKPaletteInkingToolView *)self ink];
    [v4 weight];
    -[PKToolConfiguration bandThicknessForStrokeWeight:](v3, v5);
  }
  else
  {
    double v4 = [(PKPaletteInkingToolView *)self colorIndicatorImageUp];
    [v4 size];
  }

  [(PKPaletteToolView *)self scalingFactor];
  [(PKPaletteToolView *)self _toolSelectedOffset];
  [v3 bandVerticalOffset];
  [(PKPaletteToolView *)self scalingFactor];
  [(PKPaletteToolView *)self edgeLocation];
  double v6 = [(PKPaletteToolView *)self imageContentView];
  [v6 bounds];

  if ([(PKPaletteToolView *)self edgeLocation] == 2)
  {
    [(PKPaletteInkingToolView *)self bounds];
    CGRectGetWidth(v19);
  }
  else
  {
    [(PKPaletteToolView *)self edgeLocation];
  }
  UIRectIntegralWithScale();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)updateConstraints
{
  double v3 = [(PKPaletteInkingToolView *)self opacityLabelTopConstraint];
  [v3 setConstant:0.0];

  double v4 = [(PKPaletteInkingToolView *)self opacityLabelLeftConstraint];
  [v4 setConstant:0.0];

  double v5 = [(PKPaletteInkingToolView *)self opacityLabelRightConstraint];
  [v5 setConstant:0.0];

  double v6 = [(PKPaletteToolView *)self configuration];
  [v6 opacityLabelVerticalOffset];
  double v8 = v7;
  [(PKPaletteToolView *)self scalingFactor];
  double v10 = v8 * v9;

  double v11 = [(PKPaletteInkingToolView *)self traitCollection];
  double v12 = [(PKPaletteInkingToolView *)self window];
  double v13 = [v12 windowScene];
  BOOL v14 = PKUseCompactSize(v11, v13);

  char v15 = [(PKPaletteInkingToolView *)self isSelected];
  if (v14)
  {
    if ((v15 & 1) == 0)
    {
      int v16 = [(PKPaletteInkingToolView *)self isHighlighted];
      double v17 = 10.0;
      if (v16) {
        double v17 = 11.0;
      }
      double v10 = v10 + v17;
    }
    goto LABEL_14;
  }
  if ((v15 & 1) == 0)
  {
    int v18 = [(PKPaletteInkingToolView *)self isHighlighted];
    [(PKPaletteToolView *)self scalingFactor];
    double v20 = 20.0;
    if (v18) {
      double v20 = 22.0;
    }
    double v10 = v10 + v19 * v20;
  }
  if ([(PKPaletteToolView *)self edgeLocation] == 2)
  {
    double v21 = [(PKPaletteInkingToolView *)self opacityLabelRightConstraint];
  }
  else
  {
    if ([(PKPaletteToolView *)self edgeLocation] != 8)
    {
LABEL_14:
      double v21 = [(PKPaletteInkingToolView *)self opacityLabelTopConstraint];
      goto LABEL_15;
    }
    double v21 = [(PKPaletteInkingToolView *)self opacityLabelLeftConstraint];
  }
LABEL_15:
  uint64_t v22 = v21;
  [v21 setConstant:v10];

  v23.receiver = self;
  v23.super_class = (Class)PKPaletteInkingToolView;
  [(PKPaletteToolView *)&v23 updateConstraints];
}

- (void)setEdgeLocation:(unint64_t)a3
{
  v46[4] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(PKPaletteToolView *)self edgeLocation];
  v40.receiver = self;
  v40.super_class = (Class)PKPaletteInkingToolView;
  [(PKPaletteToolView *)&v40 setEdgeLocation:a3];
  if (v5 != [(PKPaletteToolView *)self edgeLocation])
  {
    if ([(PKPaletteToolView *)self edgeLocation] == 2)
    {
      if ([(PKPaletteInkingToolView *)self _shouldInstallOpacityLabel])
      {
        CGAffineTransformMakeRotation(&v39, 1.57079633);
        double v6 = [(PKPaletteInkingToolView *)self opacityLabel];
        CGAffineTransform v38 = v39;
        [v6 setTransform:&v38];

        double v7 = (void *)MEMORY[0x1E4F28DC8];
        double v8 = [(PKPaletteInkingToolView *)self opacityLabelLeftConstraint];
        v46[0] = v8;
        double v9 = [(PKPaletteInkingToolView *)self opacityLabelTopConstraint];
        v46[1] = v9;
        double v10 = [(PKPaletteInkingToolView *)self opacityLabelRightConstraint];
        v46[2] = v10;
        double v11 = [(PKPaletteInkingToolView *)self opacityLabelCenterXConstraint];
        v46[3] = v11;
        double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
        [v7 deactivateConstraints:v12];

        double v13 = (void *)MEMORY[0x1E4F28DC8];
        BOOL v14 = [(PKPaletteInkingToolView *)self opacityLabelRightConstraint];
        v45[0] = v14;
        char v15 = [(PKPaletteInkingToolView *)self opacityLabelCenterYConstraint];
        v45[1] = v15;
        int v16 = (void *)MEMORY[0x1E4F1C978];
        double v17 = v45;
LABEL_10:
        v34 = [v16 arrayWithObjects:v17 count:2];
        [v13 activateConstraints:v34];
      }
    }
    else
    {
      unint64_t v18 = [(PKPaletteToolView *)self edgeLocation];
      BOOL v19 = [(PKPaletteInkingToolView *)self _shouldInstallOpacityLabel];
      if (v18 == 8)
      {
        if (v19)
        {
          CGAffineTransformMakeRotation(&v37, -1.57079633);
          double v20 = [(PKPaletteInkingToolView *)self opacityLabel];
          CGAffineTransform v36 = v37;
          [v20 setTransform:&v36];

          double v21 = (void *)MEMORY[0x1E4F28DC8];
          uint64_t v22 = [(PKPaletteInkingToolView *)self opacityLabelRightConstraint];
          v44[0] = v22;
          objc_super v23 = [(PKPaletteInkingToolView *)self opacityLabelTopConstraint];
          v44[1] = v23;
          double v24 = [(PKPaletteInkingToolView *)self opacityLabelRightConstraint];
          v44[2] = v24;
          double v25 = [(PKPaletteInkingToolView *)self opacityLabelCenterXConstraint];
          v44[3] = v25;
          double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
          [v21 deactivateConstraints:v26];

          double v13 = (void *)MEMORY[0x1E4F28DC8];
          BOOL v14 = [(PKPaletteInkingToolView *)self opacityLabelLeftConstraint];
          v43[0] = v14;
          char v15 = [(PKPaletteInkingToolView *)self opacityLabelCenterYConstraint];
          v43[1] = v15;
          int v16 = (void *)MEMORY[0x1E4F1C978];
          double v17 = v43;
          goto LABEL_10;
        }
      }
      else if (v19)
      {
        double v27 = [(PKPaletteInkingToolView *)self opacityLabel];
        long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v35[0] = *MEMORY[0x1E4F1DAB8];
        v35[1] = v28;
        v35[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        [v27 setTransform:v35];

        double v29 = (void *)MEMORY[0x1E4F28DC8];
        double v30 = [(PKPaletteInkingToolView *)self opacityLabelRightConstraint];
        v42[0] = v30;
        double v31 = [(PKPaletteInkingToolView *)self opacityLabelLeftConstraint];
        v42[1] = v31;
        v32 = [(PKPaletteInkingToolView *)self opacityLabelCenterYConstraint];
        v42[2] = v32;
        objc_super v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
        [v29 deactivateConstraints:v33];

        double v13 = (void *)MEMORY[0x1E4F28DC8];
        BOOL v14 = [(PKPaletteInkingToolView *)self opacityLabelCenterXConstraint];
        v41[0] = v14;
        char v15 = [(PKPaletteInkingToolView *)self opacityLabelTopConstraint];
        v41[1] = v15;
        int v16 = (void *)MEMORY[0x1E4F1C978];
        double v17 = v41;
        goto LABEL_10;
      }
    }
    [(PKPaletteInkingToolView *)self _updateToolColorBandAndTipImageViews];
    [(PKPaletteInkingToolView *)self setNeedsUpdateConstraints];
  }
}

- (int64_t)_uiColorUserInterfaceStyle
{
  if ([(PKPaletteToolView *)self colorUserInterfaceStyle])
  {
    return [(PKPaletteToolView *)self colorUserInterfaceStyle];
  }
  else
  {
    double v4 = [(PKPaletteInkingToolView *)self traitCollection];
    int64_t v5 = [v4 userInterfaceStyle];

    return v5;
  }
}

- (id)_uiColor
{
  double v3 = [(PKPaletteInkingToolView *)self ink];
  double v4 = [v3 color];
  int64_t v5 = +[PKInkingTool convertColor:v4 fromUserInterfaceStyle:1 to:[(PKPaletteInkingToolView *)self _uiColorUserInterfaceStyle]];

  return v5;
}

- (void)_updateToolColorBandAndTipImageViews
{
  double v3 = [(PKPaletteInkingToolView *)self _toolColorIndicatorImageForCurrentEdgeLocation];
  double v4 = [(PKPaletteInkingToolView *)self colorIndicatorImageView];
  [v4 setImage:v3];

  int64_t v5 = [(PKPaletteInkingToolView *)self _uiColor];
  double v6 = [v5 colorWithAlphaComponent:1.0];
  double v7 = [(PKPaletteInkingToolView *)self colorIndicatorImageView];
  [v7 setTintColor:v6];

  double v8 = [(PKPaletteInkingToolView *)self _toolColorIndicatorContourImageForCurrentEdgeLocation];
  double v9 = [(PKPaletteInkingToolView *)self colorIndicatorContourImageView];
  [v9 setImage:v8];

  double v10 = [(PKPaletteInkingToolView *)self _toolTipImageForCurrentEdgeLocation];
  double v11 = [(PKPaletteInkingToolView *)self tipIndicatorImageView];
  [v11 setImage:v10];

  double v12 = [(PKPaletteInkingToolView *)self _uiColor];
  double v13 = [v12 colorWithAlphaComponent:1.0];
  BOOL v14 = [(PKPaletteInkingToolView *)self tipIndicatorImageView];
  [v14 setTintColor:v13];

  id v16 = [(PKPaletteInkingToolView *)self _toolTipContourImageForCurrentEdgeLocation];
  char v15 = [(PKPaletteInkingToolView *)self tipIndicatorContourImageView];
  [v15 setImage:v16];
}

- (void)_reloadToolImage
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteInkingToolView;
  [(PKPaletteToolView *)&v3 _reloadToolImage];
  [(PKPaletteInkingToolView *)self _updateToolColorBandAndTipImageViews];
}

- (void)setInk:(id)a3
{
  id v9 = a3;
  if (!-[PKInk isEqual:](self->_ink, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_ink, a3);
    uint64_t v5 = [(PKPaletteToolView *)self configuration];
    double v6 = (void *)v5;
    if (v5) {
      double v7 = *(void **)(v5 + 160);
    }
    else {
      double v7 = 0;
    }
    id v8 = v7;

    if (v8) {
      [(PKPaletteToolView *)self _setToolImageNeedsReload];
    }
    [(PKPaletteInkingToolView *)self _updateToolColorBandAndTipImageViews];
    [(PKPaletteInkingToolView *)self setNeedsLayout];
  }
}

- (void)setInkColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaletteInkingToolView *)self ink];
  id v6 = [v5 color];
  id v7 = v4;
  ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB([v6 CGColor]);
  id v18 = v7;
  uint64_t v9 = [v18 CGColor];

  double v10 = DKUCGColorCreateConvertedToSRGB(v9);
  BOOL IsEqualToColorIgnoringOpacity = DKUColorIsEqualToColorIgnoringOpacity(ConvertedToSRGB, v10, 0);
  CGColorRelease(ConvertedToSRGB);
  CGColorRelease(v10);

  if (!IsEqualToColorIgnoringOpacity)
  {
    double v12 = [(PKPaletteInkingToolView *)self ink];
    double v13 = +[PKInk inkFromInk:v12 color:v18];
    [(PKPaletteInkingToolView *)self setInk:v13];

    uint64_t v14 = [(PKPaletteToolView *)self configuration];
    char v15 = (void *)v14;
    if (v14) {
      id v16 = *(void **)(v14 + 160);
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    if (v17) {
      [(PKPaletteToolView *)self _setToolImageNeedsReload];
    }
    [(PKPaletteInkingToolView *)self _updateOpacityLabel];
  }
}

- (void)_updateOpacityLabel
{
  if ([(PKPaletteInkingToolView *)self _shouldInstallOpacityLabel])
  {
    objc_super v3 = [(PKPaletteInkingToolView *)self ink];
    id v4 = [v3 color];
    [v4 alphaComponent];
    double v6 = v5;

    unint64_t v7 = llround(v6 * 100.0);
    if (v7 > 0x63)
    {
      id v9 = [(PKPaletteInkingToolView *)self opacityLabel];
      [v9 setText:0];
    }
    else
    {
      objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", v7);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = [(PKPaletteInkingToolView *)self opacityLabel];
      [v8 setText:v9];
    }
  }
}

- (void)setInkWeight:(double)a3
{
  double v5 = [(PKPaletteInkingToolView *)self ink];
  [v5 weight];
  double v7 = vabdd_f64(v6, a3);

  if (v7 >= 0.1)
  {
    id v8 = [(PKPaletteInkingToolView *)self ink];
    id v9 = +[PKInk inkFromInk:v8 weight:a3];
    [(PKPaletteInkingToolView *)self setInk:v9];

    uint64_t v10 = [(PKPaletteToolView *)self configuration];
    double v11 = (void *)v10;
    double v12 = v10 ? *(void **)(v10 + 160) : 0;
    id v13 = v12;

    if (v13)
    {
      [(PKPaletteToolView *)self _setToolImageNeedsReload];
    }
  }
}

- (id)attributeViewController
{
  if (!self->_attributeViewController
    && [(PKPaletteInkingToolView *)self _shouldHaveAttributeViewController])
  {
    objc_super v3 = [PKInkAttributesPicker alloc];
    id v4 = [(PKPaletteInkingToolView *)self ink];
    double v5 = [(PKPaletteToolView *)self configuration];
    double v6 = [(PKInkAttributesPicker *)v3 initWithInk:v4 toolConfiguration:v5];

    [(PKPaletteAttributeViewController *)v6 setDisplayMode:[(PKPaletteInkingToolView *)self _displayModeForAttributeViewController]];
    [(PKPaletteAttributeViewController *)v6 setMinimumOpacityValue:0.0];
    [(PKPaletteAttributeViewController *)v6 setDelegate:self];
    attributeViewController = self->_attributeViewController;
    self->_attributeViewController = v6;
  }
  id v8 = self->_attributeViewController;
  id v9 = [(PKPaletteInkingToolView *)self ink];
  [(PKPaletteAttributeViewController *)v8 setSelectedInk:v9];

  [(PKPaletteAttributeViewController *)v8 setColorUserInterfaceStyle:[(PKPaletteToolView *)self colorUserInterfaceStyle]];
  uint64_t v10 = [(PKPaletteToolView *)self configuration];
  double v11 = [v10 viewControllerProvider];

  if (v11)
  {
    double v12 = [(PKPaletteToolView *)self configuration];
    id v13 = [v12 viewControllerProvider];
    uint64_t v14 = v13[2]();

    if (!v14)
    {
      id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"view controller from configuration must not be nil." userInfo:0];
      objc_exception_throw(v15);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  [(PKPaletteAttributeViewController *)v8 setTopViewController:v14];
  id v16 = self->_attributeViewController;
  if (v16) {
    goto LABEL_9;
  }
  v19.receiver = self;
  v19.super_class = (Class)PKPaletteInkingToolView;
  id v17 = [(PKPaletteToolView *)&v19 attributeViewController];
  if (!v17)
  {
    id v16 = self->_attributeViewController;
LABEL_9:
    id v17 = v16;
  }

  return v17;
}

- (BOOL)_shouldHaveAttributeViewController
{
  objc_super v3 = [(PKPaletteToolView *)self configuration];
  id v4 = v3;
  if (v3 && [v3 supportsStrokeWeight] && v4[16])
  {
    BOOL v5 = 1;
  }
  else
  {
    double v6 = [(PKPaletteToolView *)self configuration];
    double v7 = v6;
    BOOL v5 = v6 && [v6 supportsOpacity] && v7[17] != 0;
  }
  return v5;
}

- (unint64_t)_displayModeForAttributeViewController
{
  objc_super v3 = [(PKPaletteToolView *)self configuration];
  id v4 = v3;
  BOOL v5 = v3 && [v3 supportsStrokeWeight] && v4[16] != 0;

  double v6 = [(PKPaletteToolView *)self configuration];
  double v7 = v6;
  BOOL v8 = v6 && [v6 supportsOpacity] && v7[17] != 0;

  if (v5) {
    unint64_t result = !v5 || !v8;
  }
  else {
    unint64_t result = 2;
  }
  if (!v5 && !v8)
  {
    uint64_t v10 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v11 = 0;
      _os_log_fault_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_FAULT, "Should not ask for display mode if tool supports neither stroke weight or opacity.", v11, 2u);
    }

    return 2;
  }
  return result;
}

- (void)inkAttributesPickerDidChangeInkOpacity:(id)a3
{
  id v4 = a3;
  id v6 = [v4 selectedInk];
  uint64_t v5 = [v6 color];
  [(PKPaletteInkingToolView *)self setInkColor:v5];

  LOBYTE(v5) = [v4 isUpdatingOpacityValue];
  if ((v5 & 1) == 0) {
    [(PKPaletteInkingToolView *)self sendActionsForControlEvents:4096];
  }
}

- (void)inkAttributesPickerDidChangeInkThickness:(id)a3
{
  id v4 = [a3 selectedInk];
  [v4 weight];
  -[PKPaletteInkingToolView setInkWeight:](self, "setInkWeight:");
  [(PKPaletteInkingToolView *)self sendActionsForControlEvents:4096];
}

- (void)setScalingFactor:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteInkingToolView;
  [(PKPaletteToolView *)&v6 setScalingFactor:a3];
  id v4 = [(PKPaletteInkingToolView *)self _opacityLabelFont];
  uint64_t v5 = [(PKPaletteInkingToolView *)self opacityLabel];
  [v5 setFont:v4];

  [(PKPaletteInkingToolView *)self setNeedsUpdateConstraints];
}

- (id)_opacityLabelFont
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB08E0];
  [(PKPaletteToolView *)self scalingFactor];
  double v4 = v3 * 8.0;

  return (id)[v2 boldSystemFontOfSize:v4];
}

- (PKInk)ink
{
  return self->_ink;
}

- (UIImageView)colorIndicatorImageView
{
  return self->_colorIndicatorImageView;
}

- (void)setColorIndicatorImageView:(id)a3
{
}

- (UIImage)colorIndicatorImageUp
{
  return self->_colorIndicatorImageUp;
}

- (void)setColorIndicatorImageUp:(id)a3
{
}

- (UIImage)colorIndicatorImageRight
{
  return self->_colorIndicatorImageRight;
}

- (void)setColorIndicatorImageRight:(id)a3
{
}

- (UIImage)colorIndicatorImageLeft
{
  return self->_colorIndicatorImageLeft;
}

- (void)setColorIndicatorImageLeft:(id)a3
{
}

- (UIImageView)colorIndicatorContourImageView
{
  return self->_colorIndicatorContourImageView;
}

- (void)setColorIndicatorContourImageView:(id)a3
{
}

- (UIImage)colorIndicatorContourImageUp
{
  return self->_colorIndicatorContourImageUp;
}

- (void)setColorIndicatorContourImageUp:(id)a3
{
}

- (UIImage)colorIndicatorContourImageRight
{
  return self->_colorIndicatorContourImageRight;
}

- (void)setColorIndicatorContourImageRight:(id)a3
{
}

- (UIImage)colorIndicatorContourImageLeft
{
  return self->_colorIndicatorContourImageLeft;
}

- (void)setColorIndicatorContourImageLeft:(id)a3
{
}

- (UIImageView)tipIndicatorImageView
{
  return self->_tipIndicatorImageView;
}

- (void)setTipIndicatorImageView:(id)a3
{
}

- (UIImage)toolTipImageUp
{
  return self->_toolTipImageUp;
}

- (void)setToolTipImageUp:(id)a3
{
}

- (UIImage)toolTipImageRight
{
  return self->_toolTipImageRight;
}

- (void)setToolTipImageRight:(id)a3
{
}

- (UIImage)toolTipImageLeft
{
  return self->_toolTipImageLeft;
}

- (void)setToolTipImageLeft:(id)a3
{
}

- (UIImageView)tipIndicatorContourImageView
{
  return self->_tipIndicatorContourImageView;
}

- (void)setTipIndicatorContourImageView:(id)a3
{
}

- (UIImage)toolTipContourImageUp
{
  return self->_toolTipContourImageUp;
}

- (void)setToolTipContourImageUp:(id)a3
{
}

- (UIImage)toolTipContourImageRight
{
  return self->_toolTipContourImageRight;
}

- (void)setToolTipContourImageRight:(id)a3
{
}

- (UIImage)toolTipContourImageLeft
{
  return self->_toolTipContourImageLeft;
}

- (void)setToolTipContourImageLeft:(id)a3
{
}

- (UILabel)opacityLabel
{
  return self->_opacityLabel;
}

- (void)setOpacityLabel:(id)a3
{
}

- (NSLayoutConstraint)opacityLabelTopConstraint
{
  return self->_opacityLabelTopConstraint;
}

- (void)setOpacityLabelTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)opacityLabelLeftConstraint
{
  return self->_opacityLabelLeftConstraint;
}

- (void)setOpacityLabelLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)opacityLabelRightConstraint
{
  return self->_opacityLabelRightConstraint;
}

- (void)setOpacityLabelRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)opacityLabelCenterXConstraint
{
  return self->_opacityLabelCenterXConstraint;
}

- (void)setOpacityLabelCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)opacityLabelCenterYConstraint
{
  return self->_opacityLabelCenterYConstraint;
}

- (void)setOpacityLabelCenterYConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacityLabelCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_opacityLabelCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_opacityLabelRightConstraint, 0);
  objc_storeStrong((id *)&self->_opacityLabelLeftConstraint, 0);
  objc_storeStrong((id *)&self->_opacityLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_opacityLabel, 0);
  objc_storeStrong((id *)&self->_toolTipContourImageLeft, 0);
  objc_storeStrong((id *)&self->_toolTipContourImageRight, 0);
  objc_storeStrong((id *)&self->_toolTipContourImageUp, 0);
  objc_storeStrong((id *)&self->_tipIndicatorContourImageView, 0);
  objc_storeStrong((id *)&self->_toolTipImageLeft, 0);
  objc_storeStrong((id *)&self->_toolTipImageRight, 0);
  objc_storeStrong((id *)&self->_toolTipImageUp, 0);
  objc_storeStrong((id *)&self->_tipIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_colorIndicatorContourImageLeft, 0);
  objc_storeStrong((id *)&self->_colorIndicatorContourImageRight, 0);
  objc_storeStrong((id *)&self->_colorIndicatorContourImageUp, 0);
  objc_storeStrong((id *)&self->_colorIndicatorContourImageView, 0);
  objc_storeStrong((id *)&self->_colorIndicatorImageLeft, 0);
  objc_storeStrong((id *)&self->_colorIndicatorImageRight, 0);
  objc_storeStrong((id *)&self->_colorIndicatorImageUp, 0);
  objc_storeStrong((id *)&self->_colorIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_ink, 0);

  objc_storeStrong((id *)&self->_attributeViewController, 0);
}

@end