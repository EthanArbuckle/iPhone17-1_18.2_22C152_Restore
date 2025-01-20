@interface CKMessageEntryViewLayoutMetrics
+ (BOOL)supportsSecureCoding;
+ (id)cachedMetricsRecalculatingIfNecessary;
- (CKMessageEntryViewLayoutMetrics)init;
- (CKMessageEntryViewLayoutMetrics)initWithCoder:(id)a3;
- (UIEdgeInsets)entryViewContentInsets;
- (UIEdgeInsets)entryViewTextAlignmentInsets;
- (double)defaultEntryContentViewHeight;
- (double)defaultEntryViewHeight;
- (double)defaultSubjectEntryContentViewHeight;
- (double)defaultSubjectEntryViewHeight;
- (void)calculateTextMetrics;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKMessageEntryViewLayoutMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMessageEntryViewLayoutMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKMessageEntryViewLayoutMetrics;
  v5 = [(CKMessageEntryViewLayoutMetrics *)&v19 init];
  if (v5)
  {
    [v4 decodeUIEdgeInsetsForKey:@"entryViewContentInsets"];
    v5->_entryViewContentInsets.top = v6;
    v5->_entryViewContentInsets.left = v7;
    v5->_entryViewContentInsets.bottom = v8;
    v5->_entryViewContentInsets.right = v9;
    [v4 decodeUIEdgeInsetsForKey:@"entryViewTextAlignmentInsets"];
    v5->_entryViewTextAlignmentInsets.top = v10;
    v5->_entryViewTextAlignmentInsets.left = v11;
    v5->_entryViewTextAlignmentInsets.bottom = v12;
    v5->_entryViewTextAlignmentInsets.right = v13;
    [v4 decodeDoubleForKey:@"defaultEntryContentViewHeight"];
    v5->_defaultEntryContentViewHeight = v14;
    [v4 decodeDoubleForKey:@"defaultSubjectEntryContentViewHeight"];
    v5->_defaultSubjectEntryContentViewHeight = v15;
    [v4 decodeDoubleForKey:@"defaultEntryViewHeight"];
    v5->_defaultEntryViewHeight = v16;
    [v4 decodeDoubleForKey:@"defaultSubjectEntryViewHeight"];
    v5->_defaultSubjectEntryViewHeight = v17;
  }

  return v5;
}

+ (id)cachedMetricsRecalculatingIfNecessary
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"CKEntryViewLayoutMetricsInfo"];
  id v4 = (id)[v3 mutableCopy];

  if (!v4) {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v5 = +[CKUIBehavior sharedBehaviors];
  CGFloat v6 = [v5 balloonTextFont];

  [v6 pointSize];
  double v8 = v7;
  uint64_t v9 = [v6 fontName];
  CGFloat v10 = [v6 fontDescriptor];
  unsigned int v50 = [v10 symbolicTraits];

  CGFloat v11 = objc_msgSend(v4, "objectForKey:");
  CGFloat v12 = objc_msgSend(v4, "objectForKey:");
  CGFloat v13 = objc_msgSend(v4, "objectForKey:");
  objc_msgSend(v4, "doubleValueForKey:withDefault:", v8);
  double v15 = v14;
  v51 = objc_msgSend(v4, "objectForKey:");
  int v42 = objc_msgSend(v4, "BOOLValueForKey:withDefault:");
  int v41 = objc_msgSend(v4, "unsignedIntegerValueForKey:withDefault:");
  double v16 = [MEMORY[0x1E4F42948] currentDevice];
  v54 = [v16 buildVersion];

  double v17 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v53 = [v17 componentsJoinedByString:@"-"];

  v52 = CKPreferredContentSizeCategory();
  objc_msgSend(v4, "objectForKey:");
  v44 = v56[0] = 0;
  uint64_t v18 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v44 error:v56];
  id v19 = v56[0];
  v49 = v6;
  v43 = (void *)v18;
  if (v19)
  {
    char v20 = 1;
  }
  else
  {
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass() ^ 1;
  }
  v47 = v11;
  int v21 = [v11 isEqualToIgnoringCase:v54];
  v46 = v12;
  int v22 = [v12 isEqualToIgnoringCase:v53];
  v45 = v13;
  int v23 = [v13 isEqualToIgnoringCase:v52];
  v48 = (void *)v9;
  int v24 = [v51 isEqualToString:v9];
  v25 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v26 = [v25 isTextKit2Enabled];

  if (!CKIsRunningInCKTester()
    && (v20 & 1) == 0
    && v21
    && v22
    && v23
    && v15 == v8
    && v24
    && v42 == v26
    && v50 == v41)
  {
    v27 = v43;
    v28 = v43;
    id v29 = v19;
    v30 = v48;
    v31 = v45;
LABEL_18:
    v32 = v28;
    v28 = v32;
    v39 = v49;
    goto LABEL_20;
  }
  v28 = objc_alloc_init(CKMessageEntryViewLayoutMetrics);
  id v55 = v19;
  v32 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v28 requiringSecureCoding:1 error:&v55];
  id v29 = v55;

  if (v32)
  {
    [v4 setObject:v54 forKey:@"CKEntryViewLayoutMetricsInfoLastCachedBuildVersion"];
    [v4 setObject:v32 forKey:@"CKEntryViewLayoutMetricsInfoData"];
    [v4 setObject:v53 forKey:@"CKEntryViewLayoutMetricsInfoLastCachedLocale"];
    [v4 setObject:v52 forKey:@"CKEntryViewLayoutMetricsInfoLastCachedSizeCategory"];
    v33 = [NSNumber numberWithDouble:v8];
    [v4 setObject:v33 forKey:@"CKEntryViewLayoutMetricsInfoLastCachedBalloonTextFontSize"];

    v30 = v48;
    [v4 setObject:v48 forKey:@"CKEntryViewLayoutMetricsInfoLastCachedBalloonTextFontName"];
    v34 = [NSNumber numberWithUnsignedInt:v50];
    [v4 setObject:v34 forKeyedSubscript:@"CKEntryViewLayoutMetricsInfoLastCachedBalloonTextFontSymbolicTraits"];

    v35 = NSNumber;
    v36 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    v37 = objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "isTextKit2Enabled"));
    [v4 setObject:v37 forKeyedSubscript:@"CKEntryViewLayoutMetricsInfoUseTextLayoutManager"];

    v38 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v38 setObject:v4 forKey:@"CKEntryViewLayoutMetricsInfo"];

    v31 = v45;
    v27 = v43;
    goto LABEL_18;
  }
  _IMWarn();
  v30 = v48;
  v39 = v49;
  v31 = v45;
  v27 = v43;
LABEL_20:

  return v32;
}

- (CKMessageEntryViewLayoutMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryViewLayoutMetrics;
  v2 = [(CKMessageEntryViewLayoutMetrics *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CKMessageEntryViewLayoutMetrics *)v2 calculateTextMetrics];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  double top = self->_entryViewContentInsets.top;
  double left = self->_entryViewContentInsets.left;
  double bottom = self->_entryViewContentInsets.bottom;
  double right = self->_entryViewContentInsets.right;
  id v12 = a3;
  objc_msgSend(v12, "encodeUIEdgeInsets:forKey:", @"entryViewContentInsets", top, left, bottom, right);
  objc_msgSend(v12, "encodeUIEdgeInsets:forKey:", @"entryViewTextAlignmentInsets", self->_entryViewTextAlignmentInsets.top, self->_entryViewTextAlignmentInsets.left, self->_entryViewTextAlignmentInsets.bottom, self->_entryViewTextAlignmentInsets.right);
  double defaultEntryContentViewHeight = self->_defaultEntryContentViewHeight;
  *(float *)&double defaultEntryContentViewHeight = defaultEntryContentViewHeight;
  [v12 encodeFloat:@"defaultEntryContentViewHeight" forKey:defaultEntryContentViewHeight];
  double defaultSubjectEntryContentViewHeight = self->_defaultSubjectEntryContentViewHeight;
  *(float *)&double defaultSubjectEntryContentViewHeight = defaultSubjectEntryContentViewHeight;
  [v12 encodeFloat:@"defaultSubjectEntryContentViewHeight" forKey:defaultSubjectEntryContentViewHeight];
  double defaultEntryViewHeight = self->_defaultEntryViewHeight;
  *(float *)&double defaultEntryViewHeight = defaultEntryViewHeight;
  [v12 encodeFloat:@"defaultEntryViewHeight" forKey:defaultEntryViewHeight];
  double defaultSubjectEntryViewHeight = self->_defaultSubjectEntryViewHeight;
  *(float *)&double defaultSubjectEntryViewHeight = defaultSubjectEntryViewHeight;
  [v12 encodeFloat:@"defaultSubjectEntryViewHeight" forKey:defaultSubjectEntryViewHeight];
}

- (void)calculateTextMetrics
{
  v85[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v6 = fmin(v4, v5);

  double v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  uint64_t v8 = [v7 isTextKit2Enabled];

  uint64_t v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v10 = [v9 isTextKit2Enabled];

  CGFloat v11 = +[CKUIBehavior sharedBehaviors];
  id v12 = v11;
  if (v10)
  {
    CGFloat v13 = CKFrameworkBundle();
    double v14 = [v13 localizedStringForKey:@"MADRID" value:&stru_1EDE4CA38 table:@"ChatKit"];

    uint64_t v84 = *MEMORY[0x1E4FB06F8];
    double v15 = [v12 balloonTextFont];
    v85[0] = v15;
    double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];

    double v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14 attributes:v16];
    uint64_t v18 = +[CKUIBehavior sharedBehaviors];
    [v18 entryViewVerticalTextFieldInsets];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    v27 = [[CKTextMetricsRequest alloc] initWithAttributedString:v17];
    [v12 balloonLineFragmentPadding];
    -[CKTextMetricsRequest setLineFragmentPadding:](v27, "setLineFragmentPadding:");
    [(CKTextMetricsRequest *)v27 setMaximumNumberOfLines:1];
    [(CKTextMetricsRequest *)v27 setMaximumHeight:10000.0];
    [(CKTextMetricsRequest *)v27 setMaximumWidth:v6];
    double v28 = v22;
    double v29 = v22;
    double v30 = v26;
    -[CKTextMetricsRequest setContainerInset:](v27, "setContainerInset:", v20, v29, v24, v26);
    v31 = objc_alloc_init(CKTextMetricsProvider);
    v32 = [(CKTextMetricsProvider *)v31 metricsForRequest:v27];
    [v32 size];
    double v34 = v33 - (v20 + v24);
    [v32 alignmentInset];
    double v80 = v36;
    double v81 = v35;
    double v79 = v37;
    double v39 = v38;
    double v40 = v24 + v20 + v34;
    [v12 entryViewCoverMinHeight];
    if (v40 < v41)
    {
      double v42 = (v41 - v40) * 0.5;
      double v20 = v20 + v42;
      double v24 = v24 + v42;
      double v30 = 0.0;
      double v40 = v41;
      double v28 = 0.0;
    }
    [v12 entryViewVerticalCoverInsets];
    double v44 = v43;
    double v46 = v45;
    self->_entryViewTextAlignmentInsets.double top = v81 + v20;
    self->_entryViewTextAlignmentInsets.double left = v80 + v28;
    self->_entryViewTextAlignmentInsets.double bottom = v79 + v24;
    self->_entryViewTextAlignmentInsets.double right = v39 + v30;
    self->_double defaultEntryContentViewHeight = v40;
    if (CKPixelWidth_once_6 != -1) {
      dispatch_once(&CKPixelWidth_once_6, &__block_literal_global_89);
    }
    double v47 = *(double *)&CKPixelWidth_sPixel_6 + v40 * 2.0;
    double v48 = v46 + v44 + self->_defaultEntryContentViewHeight;
    self->_double defaultSubjectEntryContentViewHeight = v47;
    self->_double defaultEntryViewHeight = v48;
    self->_double defaultSubjectEntryViewHeight = v46 + v44 + v47;
    self->_entryViewContentInsets.double top = v20;
    self->_entryViewContentInsets.double left = v28;
    self->_entryViewContentInsets.double bottom = v24;
    self->_entryViewContentInsets.double right = v30;
  }
  else
  {
    [v11 entryViewVerticalTextFieldInsets];
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;

    id v12 = [MEMORY[0x1E4F42F58] textViewUsingTextLayoutManager:v8];
    v57 = CKFrameworkBundle();
    v58 = [v57 localizedStringForKey:@"MADRID" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v12 setText:v58];

    v59 = +[CKUIBehavior sharedBehaviors];
    v60 = [v59 balloonTextFont];
    [v12 setFont:v60];

    objc_msgSend(v12, "setTextContainerInset:", v50, v52, v54, v56);
    long long v61 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    long long v82 = *MEMORY[0x1E4F437F8];
    long long v83 = v61;
    double v14 = [v12 textContainer];
    v62 = +[CKUIBehavior sharedBehaviors];
    [v62 balloonLineFragmentPadding];
    objc_msgSend(v14, "setLineFragmentPadding:");

    [v14 setMaximumNumberOfLines:1];
    objc_msgSend(v14, "sizeThatFits:textAlignmentInsets:isSingleLine:", &v82, 0, v6, 1.79769313e308);
    double v64 = v54 + v50 + v63;
    v65 = +[CKUIBehavior sharedBehaviors];
    [v65 entryViewCoverMinHeight];
    double v67 = v66;

    if (v64 < v67)
    {
      double v68 = (v67 - v64) * 0.5;
      double v50 = v50 + v68;
      double v54 = v54 + v68;
      double v52 = 0.0;
      double v56 = 0.0;
      double v64 = v67;
    }
    v69 = +[CKUIBehavior sharedBehaviors];
    [v69 entryViewVerticalCoverInsets];
    double v71 = v70;
    double v73 = v72;

    CGFloat v74 = v52 + *((double *)&v82 + 1);
    CGFloat v75 = v54 + *(double *)&v83;
    CGFloat v76 = v56 + *((double *)&v83 + 1);
    self->_entryViewTextAlignmentInsets.double top = v50 + *(double *)&v82;
    self->_entryViewTextAlignmentInsets.double left = v74;
    self->_entryViewTextAlignmentInsets.double bottom = v75;
    self->_entryViewTextAlignmentInsets.double right = v76;
    self->_double defaultEntryContentViewHeight = v64;
    if (CKPixelWidth_once_6 != -1) {
      dispatch_once(&CKPixelWidth_once_6, &__block_literal_global_89);
    }
    double v77 = *(double *)&CKPixelWidth_sPixel_6 + v64 * 2.0;
    double v78 = v73 + v71 + self->_defaultEntryContentViewHeight;
    self->_double defaultSubjectEntryContentViewHeight = v77;
    self->_double defaultEntryViewHeight = v78;
    self->_double defaultSubjectEntryViewHeight = v73 + v71 + v77;
    self->_entryViewContentInsets.double top = v50;
    self->_entryViewContentInsets.double left = v52;
    self->_entryViewContentInsets.double bottom = v54;
    self->_entryViewContentInsets.double right = v56;
  }
}

- (UIEdgeInsets)entryViewContentInsets
{
  double top = self->_entryViewContentInsets.top;
  double left = self->_entryViewContentInsets.left;
  double bottom = self->_entryViewContentInsets.bottom;
  double right = self->_entryViewContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)entryViewTextAlignmentInsets
{
  double top = self->_entryViewTextAlignmentInsets.top;
  double left = self->_entryViewTextAlignmentInsets.left;
  double bottom = self->_entryViewTextAlignmentInsets.bottom;
  double right = self->_entryViewTextAlignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)defaultEntryContentViewHeight
{
  return self->_defaultEntryContentViewHeight;
}

- (double)defaultSubjectEntryContentViewHeight
{
  return self->_defaultSubjectEntryContentViewHeight;
}

- (double)defaultEntryViewHeight
{
  return self->_defaultEntryViewHeight;
}

- (double)defaultSubjectEntryViewHeight
{
  return self->_defaultSubjectEntryViewHeight;
}

@end