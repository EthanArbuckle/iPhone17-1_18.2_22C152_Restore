@interface AVTSplashScreenLayout
+ (BOOL)isSmallScreen;
+ (CGRect)buttonFrameForString:(id)a3 containerSize:(CGSize)a4 edgeInsets:(UIEdgeInsets)a5;
+ (CGRect)primaryVideoFrameForContentFrame:(CGRect)a3 wantsSecondaryVideo:(BOOL)a4;
+ (CGRect)secondaryVideoFrameForContentFrame:(CGRect)a3;
+ (CGRect)subTitleFrameForString:(id)a3 titleFrame:(CGRect)a4 buttonFrame:(CGRect)a5 wantsSecondaryVideo:(BOOL)a6 containerSize:(CGSize)a7 labelEdgePadding:(double)a8;
+ (CGRect)titleFrameForString:(id)a3 yOrigin:(double)a4 containerSize:(CGSize)a5 labelEdgePadding:(double)a6;
+ (CGSize)primaryVideoSize;
+ (CGSize)secondaryVideoSize;
+ (UIButton)blueButton;
+ (UIButton)cancelButton;
+ (UIFont)buttonFont;
+ (UIFont)subTitleFont;
+ (UIFont)titleFont;
+ (double)defaultLabelEdgePaddingForLabelEdgePaddingStyle:(unint64_t)a3 contentSizeCategory:(id)a4 numberOfLines:(int64_t)a5;
+ (unint64_t)appropriateLabelEdgePaddingStyleForViewSize:(CGSize)a3;
- (AVTSplashScreenLayout)initWithContainerSize:(CGSize)a3 edgeInsets:(UIEdgeInsets)a4 wantsSecondaryVideo:(BOOL)a5 labelEdgePaddingStyle:(unint64_t)a6;
- (AVTSplashScreenLayout)initWithContainerSize:(CGSize)a3 edgeInsets:(UIEdgeInsets)a4 wantsSecondaryVideo:(BOOL)a5 labelEdgePaddingStyle:(unint64_t)a6 currentContentSizeCategory:(id)a7;
- (AVTSplashScreenLayoutDelegate)delegate;
- (BOOL)constrainToContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsLayout;
- (BOOL)wantsSecondaryVideo;
- (CGRect)buttonFrame;
- (CGRect)primaryVideoFrame;
- (CGRect)secondaryVideoFrame;
- (CGRect)subTitleFrame;
- (CGRect)titleFrame;
- (CGSize)containerSize;
- (CGSize)unconstrainedContentSize;
- (NSString)currentContentSizeCategory;
- (UIEdgeInsets)edgeInsets;
- (unint64_t)hash;
- (unint64_t)labelEdgePaddingStyle;
- (void)calculateLayoutWithTitleString:(id)a3 subTitleString:(id)a4 buttonTitle:(id)a5;
- (void)dealloc;
- (void)didChangeContentSizeCategory:(id)a3;
- (void)setButtonFrame:(CGRect)a3;
- (void)setConstrainToContainer:(BOOL)a3;
- (void)setCurrentContentSizeCategory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsLayout:(BOOL)a3;
- (void)setPrimaryVideoFrame:(CGRect)a3;
- (void)setSecondaryVideoFrame:(CGRect)a3;
- (void)setSubTitleFrame:(CGRect)a3;
- (void)setTitleFrame:(CGRect)a3;
- (void)setWantsSecondaryVideo:(BOOL)a3;
@end

@implementation AVTSplashScreenLayout

+ (BOOL)isSmallScreen
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;

  return v4 <= 568.0;
}

+ (CGSize)primaryVideoSize
{
  int v2 = [a1 isSmallScreen];
  double v3 = 480.0;
  if (v2) {
    double v3 = 100.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)secondaryVideoSize
{
  int v2 = [a1 isSmallScreen];
  double v3 = 854.0;
  if (v2) {
    double v3 = 245.0;
  }
  double v4 = 238.0;
  if (v2) {
    double v4 = 50.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (unint64_t)appropriateLabelEdgePaddingStyleForViewSize:(CGSize)a3
{
  return a3.width > 400.0;
}

+ (UIButton)blueButton
{
  int v2 = [MEMORY[0x263F1C488] buttonWithType:1];
  double v3 = +[AVTUIColorRepository splashScreenButtonNormalTextColor];
  [v2 setTitleColor:v3 forState:0];

  double v4 = +[AVTUIColorRepository splashScreenButtonHighlightedTextColor];
  [v2 setTitleColor:v4 forState:1];

  v5 = +[AVTUIFontRepository splashContinueButtonFont];
  v6 = [v2 titleLabel];
  [v6 setFont:v5];

  v7 = +[AVTUIColorRepository splashScreenButtonBackgroundColor];
  [v2 setBackgroundColor:v7];

  [v2 _setContinuousCornerRadius:8.0];
  return (UIButton *)v2;
}

+ (UIButton)cancelButton
{
  int v2 = [MEMORY[0x263F1C488] buttonWithType:1];
  double v3 = +[AVTUIFontRepository splashContinueButtonFont];
  double v4 = [v2 titleLabel];
  [v4 setFont:v3];

  [v2 setRole:2];
  return (UIButton *)v2;
}

+ (UIFont)titleFont
{
  return (UIFont *)+[AVTUIFontRepository splashTitleFont];
}

+ (UIFont)subTitleFont
{
  return (UIFont *)+[AVTUIFontRepository splashSubTitleFont];
}

+ (UIFont)buttonFont
{
  return (UIFont *)+[AVTUIFontRepository splashContinueButtonFont];
}

+ (double)defaultLabelEdgePaddingForLabelEdgePaddingStyle:(unint64_t)a3 contentSizeCategory:(id)a4 numberOfLines:(int64_t)a5
{
  double result = 24.0;
  if (a3 == 1)
  {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a4);
    int v8 = a5 > 3 || IsAccessibilityCategory;
    double result = 74.0;
    if (v8) {
      return 44.0;
    }
  }
  return result;
}

+ (CGRect)buttonFrameForString:(id)a3 containerSize:(CGSize)a4 edgeInsets:(UIEdgeInsets)a5
{
  double bottom = a5.bottom;
  double height = a4.height;
  double width = a4.width;
  v21[1] = *MEMORY[0x263EF8340];
  double v9 = a4.width + -48.0;
  if (v9 <= 325.0) {
    double v10 = v9;
  }
  else {
    double v10 = 325.0;
  }
  uint64_t v20 = *MEMORY[0x263F1C238];
  id v11 = a3;
  v12 = [a1 buttonFont];
  v21[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 0, v13, 0, v10 + -32.0, 1.79769313e308);
  double v15 = v14;

  double v16 = fmax(v15 + 28.0, 50.0);
  double v17 = (width - v10) * 0.5;
  double v18 = height - fmax(bottom + 44.0, 44.0) - v16;
  double v19 = v10;
  result.size.double height = v16;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

+ (CGRect)titleFrameForString:(id)a3 yOrigin:(double)a4 containerSize:(CGSize)a5 labelEdgePadding:(double)a6
{
  v26[1] = *MEMORY[0x263EF8340];
  CGFloat v9 = a5.width - a6 * 2.0;
  id v10 = a3;
  id v11 = [a1 titleFont];
  [v11 lineHeight];
  double v13 = ceil(v12);
  double v14 = [a1 titleFont];
  [v14 leading];
  double v16 = v15 + v13 * 2.0;
  uint64_t v25 = *MEMORY[0x263F1C238];
  double v17 = [a1 titleFont];
  v26[0] = v17;
  double v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, v9, v16);
  double v20 = v19;

  double v21 = ceil(v20);
  double v22 = a6;
  double v23 = a4;
  double v24 = v9;
  result.size.double height = v21;
  result.size.double width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (CGRect)subTitleFrameForString:(id)a3 titleFrame:(CGRect)a4 buttonFrame:(CGRect)a5 wantsSecondaryVideo:(BOOL)a6 containerSize:(CGSize)a7 labelEdgePadding:(double)a8
{
  BOOL v8 = a6;
  double y = a5.origin.y;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat x = a4.origin.x;
  v40[1] = *MEMORY[0x263EF8340];
  uint64_t v39 = *MEMORY[0x263F1C238];
  id v14 = a3;
  double v15 = [a1 subTitleFont];
  v40[0] = v15;
  double v16 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
  objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, v16, 0, a8 + v41 * -2.0, 1.79769313e308);
  double v18 = v17;

  double v19 = [a1 subTitleFont];
  [v19 _scaledValueForValue:32.0];
  double v21 = v20;

  v42.origin.CGFloat x = x;
  v42.origin.double y = v11;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v42);
  double v23 = [a1 titleFont];
  [v23 descender];
  double v25 = MaxY + v24;
  v26 = [a1 subTitleFont];
  [v26 ascender];
  double v28 = v25 + v21 - v27;

  [(id)objc_opt_class() primaryVideoSize];
  double v30 = y + -40.0 + v29 * -0.3 + -40.0 - v28;
  if (v8)
  {
    [(id)objc_opt_class() secondaryVideoSize];
    double v30 = v30 + v31 * -0.3;
  }
  double v32 = ceil(v18);
  if (v30 >= 0.0) {
    double v33 = v30;
  }
  else {
    double v33 = v18;
  }
  if (v32 >= v33) {
    double v34 = v33;
  }
  else {
    double v34 = v32;
  }
  double v35 = v41;
  double v36 = v28;
  double v37 = a8 + v41 * -2.0;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v37;
  result.origin.double y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

+ (CGRect)primaryVideoFrameForContentFrame:(CGRect)a3 wantsSecondaryVideo:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = CGRectGetHeight(a3);
  if (v4) {
    double v10 = v9 * 0.7;
  }
  else {
    double v10 = v9;
  }
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v11 = CGRectGetWidth(v17);
  if (v11 >= v10) {
    double v12 = v10;
  }
  else {
    double v12 = v11;
  }
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v13 = x + (CGRectGetWidth(v18) - v12) * 0.5;
  double v14 = y + (v10 - v12) * 0.5;
  double v15 = v12;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

+ (CGRect)secondaryVideoFrameForContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = CGRectGetHeight(a3);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v8 = v7 + CGRectGetHeight(v14) * -0.7;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGFloat v9 = CGRectGetMaxY(v15) - v8;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v10 = CGRectGetWidth(v16);
  double v11 = x;
  double v12 = v9;
  double v13 = v8;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (AVTSplashScreenLayout)initWithContainerSize:(CGSize)a3 edgeInsets:(UIEdgeInsets)a4 wantsSecondaryVideo:(BOOL)a5 labelEdgePaddingStyle:(unint64_t)a6
{
  BOOL v7 = a5;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double height = a3.height;
  double width = a3.width;
  CGRect v15 = [MEMORY[0x263F1C408] sharedApplication];
  CGRect v16 = [v15 preferredContentSizeCategory];
  CGRect v17 = -[AVTSplashScreenLayout initWithContainerSize:edgeInsets:wantsSecondaryVideo:labelEdgePaddingStyle:currentContentSizeCategory:](self, "initWithContainerSize:edgeInsets:wantsSecondaryVideo:labelEdgePaddingStyle:currentContentSizeCategory:", v7, a6, v16, width, height, top, left, bottom, right);

  return v17;
}

- (AVTSplashScreenLayout)initWithContainerSize:(CGSize)a3 edgeInsets:(UIEdgeInsets)a4 wantsSecondaryVideo:(BOOL)a5 labelEdgePaddingStyle:(unint64_t)a6 currentContentSizeCategory:(id)a7
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AVTSplashScreenLayout;
  CGRect v17 = [(AVTSplashScreenLayout *)&v23 init];
  CGRect v18 = v17;
  if (v17)
  {
    v17->_containerSize.CGFloat width = width;
    v17->_containerSize.CGFloat height = height;
    v17->_labelEdgePaddingStyle = a6;
    v17->_edgeInsets.CGFloat top = top;
    v17->_edgeInsets.CGFloat left = left;
    v17->_edgeInsets.CGFloat bottom = bottom;
    v17->_edgeInsets.CGFloat right = right;
    v17->_wantsSecondaryVideo = a5;
    uint64_t v19 = [v16 copy];
    currentContentSizeCategorCGFloat y = v18->_currentContentSizeCategory;
    v18->_currentContentSizeCategorCGFloat y = (NSString *)v19;

    v18->_needsLayout = 1;
    v18->_constrainToContainer = [(id)objc_opt_class() isSmallScreen] ^ 1;
    v18->_unconstrainedContentSize = (CGSize)*MEMORY[0x263F001B0];
    double v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v18 selector:sel_didChangeContentSizeCategory_ name:*MEMORY[0x263F1D158] object:0];
  }
  return v18;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AVTSplashScreenLayout;
  [(AVTSplashScreenLayout *)&v4 dealloc];
}

- (void)calculateLayoutWithTitleString:(id)a3 subTitleString:(id)a4 buttonTitle:(id)a5
{
  v180[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(AVTSplashScreenLayout *)self labelEdgePaddingStyle] == 1)
  {
    [(AVTSplashScreenLayout *)self containerSize];
    double v12 = v11 + -148.0;
    uint64_t v179 = *MEMORY[0x263F1C238];
    double v13 = [(id)objc_opt_class() subTitleFont];
    v180[0] = v13;
    CGRect v14 = [NSDictionary dictionaryWithObjects:v180 forKeys:&v179 count:1];
    objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v14, 0, v12, 1.79769313e308);
    double v16 = v15;

    CGRect v17 = [(id)objc_opt_class() subTitleFont];
    [v17 lineHeight];
    unint64_t v19 = vcvtmd_s64_f64(ceil(v16) / v18);
  }
  else
  {
    unint64_t v19 = 0;
  }
  if (![(AVTSplashScreenLayout *)self needsLayout]) {
    goto LABEL_39;
  }
  double v20 = objc_opt_class();
  [(AVTSplashScreenLayout *)self containerSize];
  double v22 = v21;
  double v24 = v23;
  [(AVTSplashScreenLayout *)self edgeInsets];
  objc_msgSend(v20, "buttonFrameForString:containerSize:edgeInsets:", v10, v22, v24, v25, v26, v27, v28);
  double v170 = v30;
  double v171 = v29;
  double v176 = v31;
  double v33 = v32;
  [(AVTSplashScreenLayout *)self containerSize];
  double v35 = v34;
  [(AVTSplashScreenLayout *)self edgeInsets];
  double v37 = v36;
  [(AVTSplashScreenLayout *)self edgeInsets];
  double v39 = v35 - (v37 + v38);
  [(id)objc_opt_class() primaryVideoSize];
  double v41 = v40 + 80.0;
  if (v39 < v40 + 80.0) {
    double v41 = v39;
  }
  double v177 = v41;
  CGFloat v169 = v33;
  if (self->_wantsSecondaryVideo)
  {
    [(id)objc_opt_class() secondaryVideoSize];
    double v43 = v42;
    double v45 = v44;
    [(AVTSplashScreenLayout *)self containerSize];
    double v47 = v46;
    [(AVTSplashScreenLayout *)self edgeInsets];
    double v49 = v48;
    [(AVTSplashScreenLayout *)self edgeInsets];
    double v51 = v47 - (v49 + v50 + 80.0);
    if (v43 < v51) {
      double v51 = v43;
    }
    double v177 = v177 + v45 * v51 / v43;
  }
  v52 = objc_opt_class();
  unint64_t v53 = [(AVTSplashScreenLayout *)self labelEdgePaddingStyle];
  v54 = [(AVTSplashScreenLayout *)self currentContentSizeCategory];
  [v52 defaultLabelEdgePaddingForLabelEdgePaddingStyle:v53 contentSizeCategory:v54 numberOfLines:v19];
  double v56 = v55;

  [(AVTSplashScreenLayout *)self edgeInsets];
  double v58 = v57 + 96.0;
  v59 = [(id)objc_opt_class() titleFont];
  [v59 ascender];
  double v61 = v58 - v60;

  v62 = objc_opt_class();
  [(AVTSplashScreenLayout *)self containerSize];
  objc_msgSend(v62, "titleFrameForString:yOrigin:containerSize:labelEdgePadding:", v8, v61, v63, v64, v56);
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  v73 = objc_opt_class();
  BOOL v74 = [(AVTSplashScreenLayout *)self wantsSecondaryVideo];
  [(AVTSplashScreenLayout *)self containerSize];
  double v163 = v56;
  double v165 = v72;
  double v167 = v68;
  double v168 = v66;
  double v166 = v70;
  objc_msgSend(v73, "subTitleFrameForString:titleFrame:buttonFrame:wantsSecondaryVideo:containerSize:labelEdgePadding:", v9, v74, v66, v68, v70, v72, v171, v176, v170, v33, v75, v76, *(void *)&v56);
  CGFloat v78 = v77;
  CGFloat v80 = v79;
  CGFloat v82 = v81;
  CGFloat v84 = v83;
  v181.origin.CGFloat x = v171;
  v181.origin.CGFloat y = v176;
  v181.size.CGFloat width = v170;
  v181.size.CGFloat height = v33;
  double MinY = CGRectGetMinY(v181);
  v182.origin.CGFloat x = v78;
  double v174 = v82;
  double v175 = v80;
  v182.origin.CGFloat y = v80;
  v182.size.CGFloat width = v82;
  double rect = v84;
  v182.size.CGFloat height = v84;
  double v86 = MinY - CGRectGetMaxY(v182);
  if (v86 < v177)
  {
    v87 = [(id)objc_opt_class() titleFont];
    [v87 _scaledValueForValue:v86 - v177 + 96.0];
    double v89 = v88;

    CGFloat v90 = self->_edgeInsets.top + fmax(v89, 58.0);
    v91 = [(id)objc_opt_class() titleFont];
    [v91 ascender];
    CGFloat v93 = v90 - v92;

    v94 = objc_opt_class();
    [(AVTSplashScreenLayout *)self containerSize];
    objc_msgSend(v94, "titleFrameForString:yOrigin:containerSize:labelEdgePadding:", v8, v93, v95, v96, v163);
    double v98 = v97;
    double v100 = v99;
    double v102 = v101;
    double v103 = v33;
    double v105 = v104;
    v106 = objc_opt_class();
    BOOL v107 = [(AVTSplashScreenLayout *)self wantsSecondaryVideo];
    [(AVTSplashScreenLayout *)self containerSize];
    double v167 = v100;
    double v168 = v98;
    double v165 = v105;
    double v166 = v102;
    objc_msgSend(v106, "subTitleFrameForString:titleFrame:buttonFrame:wantsSecondaryVideo:containerSize:labelEdgePadding:", v9, v107, v98, v100, v102, v105, v171, v176, v170, v103, v108, v109, *(void *)&v163);
    double v111 = v110;
    CGFloat v113 = v112;
    CGFloat v115 = v114;
    CGFloat v117 = v116;
    v183.origin.CGFloat x = v171;
    v183.origin.CGFloat y = v176;
    v183.size.CGFloat width = v170;
    v183.size.CGFloat height = v103;
    CGFloat v78 = v111;
    double v118 = CGRectGetMinY(v183);
    v184.origin.CGFloat x = v78;
    double v174 = v115;
    double v175 = v113;
    v184.origin.CGFloat y = v113;
    v184.size.CGFloat width = v115;
    double rect = v117;
    v184.size.CGFloat height = v117;
    double v86 = v118 - CGRectGetMaxY(v184);
  }
  if (v86 >= v177)
  {
    double v119 = v171;
    int v121 = 0;
  }
  else
  {
    double v119 = v171;
    BOOL v120 = [(AVTSplashScreenLayout *)self constrainToContainer];
    int v121 = !v120;
    if (!v120) {
      double v86 = v177;
    }
  }
  [(AVTSplashScreenLayout *)self edgeInsets];
  double v123 = v122 + 40.0;
  v185.origin.CGFloat x = v78;
  v185.size.CGFloat width = v174;
  v185.origin.CGFloat y = v175;
  v185.size.CGFloat height = rect;
  double v124 = CGRectGetMaxY(v185) + 40.0;
  [(AVTSplashScreenLayout *)self containerSize];
  double v126 = v125;
  [(AVTSplashScreenLayout *)self edgeInsets];
  double v128 = v127;
  [(AVTSplashScreenLayout *)self edgeInsets];
  double v130 = v126 - (v128 + v129 + 80.0);
  double v131 = v86 + -80.0;
  objc_msgSend((id)objc_opt_class(), "primaryVideoFrameForContentFrame:wantsSecondaryVideo:", -[AVTSplashScreenLayout wantsSecondaryVideo](self, "wantsSecondaryVideo"), v123, v124, v130, v86 + -80.0);
  double v133 = v132;
  double v135 = v134;
  double v178 = v136;
  double v172 = v137;
  if ([(AVTSplashScreenLayout *)self wantsSecondaryVideo])
  {
    objc_msgSend((id)objc_opt_class(), "secondaryVideoFrameForContentFrame:", v123, v124, v130, v131);
    double v139 = v138;
    double v141 = v140;
    double v143 = v142;
    double v145 = v144;
    if (!v121) {
      goto LABEL_35;
    }
LABEL_22:
    BOOL v146 = [(AVTSplashScreenLayout *)self wantsSecondaryVideo];
    if (v146) {
      double v147 = v145;
    }
    else {
      double v147 = v172;
    }
    if (v146) {
      double v148 = v143;
    }
    else {
      double v148 = v178;
    }
    if (v146) {
      double v149 = v141;
    }
    else {
      double v149 = v135;
    }
    if (v146) {
      double v150 = v139;
    }
    else {
      double v150 = v133;
    }
    double v176 = CGRectGetMaxY(*(CGRect *)(&v147 - 3)) + 40.0;
    goto LABEL_35;
  }
  double v139 = *MEMORY[0x263F001A8];
  double v141 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v143 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v145 = *(double *)(MEMORY[0x263F001A8] + 24);
  if (v121) {
    goto LABEL_22;
  }
LABEL_35:
  double v161 = v145;
  double v162 = v78;
  double v164 = v135;
  if ([(AVTSplashScreenLayout *)self constrainToContainer])
  {
    double v152 = v169;
    double v151 = v170;
    double v153 = v176;
  }
  else
  {
    [(AVTSplashScreenLayout *)self containerSize];
    double v160 = v143;
    double v154 = v141;
    double v155 = v139;
    double v156 = v133;
    CGFloat v158 = v157;
    v186.origin.CGFloat x = v119;
    double v153 = v176;
    v186.origin.CGFloat y = v176;
    double v152 = v169;
    double v151 = v170;
    v186.size.CGFloat width = v170;
    v186.size.CGFloat height = v169;
    CGFloat MaxY = CGRectGetMaxY(v186);
    self->_unconstrainedContentSize.CGFloat width = v158;
    self->_unconstrainedContentSize.CGFloat height = MaxY + 44.0;
    double v133 = v156;
    double v139 = v155;
    double v141 = v154;
    double v143 = v160;
  }
  -[AVTSplashScreenLayout setTitleFrame:](self, "setTitleFrame:", v168, v167, v166, v165);
  -[AVTSplashScreenLayout setSubTitleFrame:](self, "setSubTitleFrame:", v162, v175, v174, rect);
  -[AVTSplashScreenLayout setPrimaryVideoFrame:](self, "setPrimaryVideoFrame:", v133, v164, v178, v172);
  -[AVTSplashScreenLayout setSecondaryVideoFrame:](self, "setSecondaryVideoFrame:", v139, v141, v143, v161);
  -[AVTSplashScreenLayout setButtonFrame:](self, "setButtonFrame:", v119, v153, v151, v152);
  [(AVTSplashScreenLayout *)self setNeedsLayout:0];
LABEL_39:
}

- (void)didChangeContentSizeCategory:(id)a3
{
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  -[AVTSplashScreenLayout setTitleFrame:](self, "setTitleFrame:", a3, *MEMORY[0x263F001A8], v5, v6, v7);
  -[AVTSplashScreenLayout setSubTitleFrame:](self, "setSubTitleFrame:", v4, v5, v6, v7);
  -[AVTSplashScreenLayout setPrimaryVideoFrame:](self, "setPrimaryVideoFrame:", v4, v5, v6, v7);
  -[AVTSplashScreenLayout setSecondaryVideoFrame:](self, "setSecondaryVideoFrame:", v4, v5, v6, v7);
  -[AVTSplashScreenLayout setButtonFrame:](self, "setButtonFrame:", v4, v5, v6, v7);
  id v8 = [MEMORY[0x263F1C408] sharedApplication];
  id v9 = [v8 preferredContentSizeCategory];
  id v10 = (void *)[v9 copy];
  [(AVTSplashScreenLayout *)self setCurrentContentSizeCategory:v10];

  [(AVTSplashScreenLayout *)self setNeedsLayout:1];
  id v11 = [(AVTSplashScreenLayout *)self delegate];
  [v11 splashScreenLayoutDidChange:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v13 = 0;
    goto LABEL_9;
  }
  id v5 = v4;
  [(AVTSplashScreenLayout *)self containerSize];
  double v7 = v6;
  double v9 = v8;
  [v5 containerSize];
  if (v7 != v11 || v9 != v10) {
    goto LABEL_6;
  }
  [(AVTSplashScreenLayout *)self edgeInsets];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [v5 edgeInsets];
  char v13 = 0;
  if (v18 != v26 || v16 != v23 || v22 != v25 || v20 != v24) {
    goto LABEL_7;
  }
  int v27 = [(AVTSplashScreenLayout *)self wantsSecondaryVideo];
  if (v27 == [v5 wantsSecondaryVideo])
  {
    double v28 = [(AVTSplashScreenLayout *)self currentContentSizeCategory];
    double v29 = [v5 currentContentSizeCategory];
    char v13 = [v28 isEqualToString:v29];
  }
  else
  {
LABEL_6:
    char v13 = 0;
  }
LABEL_7:

LABEL_9:
  return v13;
}

- (unint64_t)hash
{
  double v3 = (void *)MEMORY[0x263F08D40];
  [(AVTSplashScreenLayout *)self containerSize];
  id v4 = objc_msgSend(v3, "valueWithCGSize:");
  uint64_t v5 = [v4 hash];
  double v6 = (void *)MEMORY[0x263F08D40];
  [(AVTSplashScreenLayout *)self containerSize];
  double v7 = objc_msgSend(v6, "valueWithCGSize:");
  *((void *)&v9 + 1) = v5;
  *(void *)&long long v9 = [v7 hash];
  uint64_t v8 = v9 >> 48;
  double v10 = (void *)MEMORY[0x263F08D40];
  [(AVTSplashScreenLayout *)self edgeInsets];
  double v11 = objc_msgSend(v10, "valueWithUIEdgeInsets:");
  uint64_t v12 = [v11 hash];
  char v13 = (void *)MEMORY[0x263F08D40];
  [(AVTSplashScreenLayout *)self edgeInsets];
  CGRect v14 = objc_msgSend(v13, "valueWithUIEdgeInsets:");
  *((void *)&v9 + 1) = v12;
  *(void *)&long long v9 = [v14 hash];
  uint64_t v15 = (v9 >> 43) ^ v8;
  if ([(AVTSplashScreenLayout *)self wantsSecondaryVideo]) {
    uint64_t v16 = 0x100000000;
  }
  else {
    uint64_t v16 = 0;
  }
  [(AVTSplashScreenLayout *)self wantsSecondaryVideo];
  double v17 = [(AVTSplashScreenLayout *)self currentContentSizeCategory];
  unint64_t v18 = v15 ^ v16 ^ [v17 hash];

  return v18;
}

- (AVTSplashScreenLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTSplashScreenLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)labelEdgePaddingStyle
{
  return self->_labelEdgePaddingStyle;
}

- (CGRect)titleFrame
{
  double x = self->_titleFrame.origin.x;
  double y = self->_titleFrame.origin.y;
  double width = self->_titleFrame.size.width;
  double height = self->_titleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTitleFrame:(CGRect)a3
{
  self->_titleFrame = a3;
}

- (CGRect)subTitleFrame
{
  double x = self->_subTitleFrame.origin.x;
  double y = self->_subTitleFrame.origin.y;
  double width = self->_subTitleFrame.size.width;
  double height = self->_subTitleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSubTitleFrame:(CGRect)a3
{
  self->_subTitleFrame = a3;
}

- (CGRect)primaryVideoFrame
{
  double x = self->_primaryVideoFrame.origin.x;
  double y = self->_primaryVideoFrame.origin.y;
  double width = self->_primaryVideoFrame.size.width;
  double height = self->_primaryVideoFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPrimaryVideoFrame:(CGRect)a3
{
  self->_primaryVideoFrame = a3;
}

- (CGRect)secondaryVideoFrame
{
  double x = self->_secondaryVideoFrame.origin.x;
  double y = self->_secondaryVideoFrame.origin.y;
  double width = self->_secondaryVideoFrame.size.width;
  double height = self->_secondaryVideoFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSecondaryVideoFrame:(CGRect)a3
{
  self->_secondaryVideoFrame = a3;
}

- (CGRect)buttonFrame
{
  double x = self->_buttonFrame.origin.x;
  double y = self->_buttonFrame.origin.y;
  double width = self->_buttonFrame.size.width;
  double height = self->_buttonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setButtonFrame:(CGRect)a3
{
  self->_buttonFrame = a3;
}

- (CGSize)unconstrainedContentSize
{
  double width = self->_unconstrainedContentSize.width;
  double height = self->_unconstrainedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)wantsSecondaryVideo
{
  return self->_wantsSecondaryVideo;
}

- (void)setWantsSecondaryVideo:(BOOL)a3
{
  self->_wantsSecondaryVideo = a3;
}

- (BOOL)constrainToContainer
{
  return self->_constrainToContainer;
}

- (void)setConstrainToContainer:(BOOL)a3
{
  self->_constrainToContainer = a3;
}

- (NSString)currentContentSizeCategory
{
  return self->_currentContentSizeCategory;
}

- (void)setCurrentContentSizeCategory:(id)a3
{
}

- (BOOL)needsLayout
{
  return self->_needsLayout;
}

- (void)setNeedsLayout:(BOOL)a3
{
  self->_needsLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContentSizeCategory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end