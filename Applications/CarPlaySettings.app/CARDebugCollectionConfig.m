@interface CARDebugCollectionConfig
- (CARDebugCollectionConfig)init;
- (CGSize)intrinsictContentSize;
- (CGSize)systemLayoutSize;
- (UIEdgeInsets)sectionInset;
- (double)minimumInteritemSpacing;
- (double)minimumLineSpacing;
- (unint64_t)cells;
- (unint64_t)columns;
- (unint64_t)rows;
@end

@implementation CARDebugCollectionConfig

- (CARDebugCollectionConfig)init
{
  v92.receiver = self;
  v92.super_class = (Class)CARDebugCollectionConfig;
  v2 = [(CARDebugCollectionConfig *)&v92 init];
  if (v2)
  {
    id v3 = +[NSNumber numberWithInteger:200];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v4 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_CellCount", @"com.apple.CarPlaySettings");
    v5 = (void *)v4;
    if (v4) {
      v6 = (void *)v4;
    }
    else {
      v6 = v3;
    }
    id v7 = v6;

    id v8 = [v7 integerValue];
    v2->_cells = (unint64_t)v8;
    id v9 = +[NSNumber numberWithInteger:10];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v10 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_Columns", @"com.apple.CarPlaySettings");
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = v9;
    }
    id v13 = v12;

    id v14 = [v13 integerValue];
    v2->_columns = (unint64_t)v14;
    id v15 = +[NSNumber numberWithInteger:4];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v16 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_Rows", @"com.apple.CarPlaySettings");
    v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = v15;
    }
    id v19 = v18;

    id v20 = [v19 integerValue];
    v2->_rows = (unint64_t)v20;
    id v21 = +[NSNumber numberWithDouble:0.0];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v22 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_SectionInsetTop", @"com.apple.CarPlaySettings");
    v23 = (void *)v22;
    if (v22) {
      v24 = (void *)v22;
    }
    else {
      v24 = v21;
    }
    id v25 = v24;

    [v25 doubleValue];
    CGFloat v27 = v26;

    id v28 = +[NSNumber numberWithDouble:0.0];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v29 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_SectionInsetLeft", @"com.apple.CarPlaySettings");
    v30 = (void *)v29;
    if (v29) {
      v31 = (void *)v29;
    }
    else {
      v31 = v28;
    }
    id v32 = v31;

    [v32 doubleValue];
    CGFloat v34 = v33;

    id v35 = +[NSNumber numberWithDouble:0.0];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v36 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_SectionInsetBottom", @"com.apple.CarPlaySettings");
    v37 = (void *)v36;
    if (v36) {
      v38 = (void *)v36;
    }
    else {
      v38 = v35;
    }
    id v39 = v38;

    [v39 doubleValue];
    CGFloat v41 = v40;

    id v42 = +[NSNumber numberWithDouble:0.0];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v43 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_SectionInsetRight", @"com.apple.CarPlaySettings");
    v44 = (void *)v43;
    if (v43) {
      v45 = (void *)v43;
    }
    else {
      v45 = v42;
    }
    id v46 = v45;

    [v46 doubleValue];
    CGFloat v48 = v47;

    v2->_sectionInset.top = v27;
    v2->_sectionInset.left = v34;
    v2->_sectionInset.bottom = v41;
    v2->_sectionInset.right = v48;
    id v49 = +[NSNumber numberWithDouble:0.0];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v50 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_MinimumLineSpacing", @"com.apple.CarPlaySettings");
    v51 = (void *)v50;
    if (v50) {
      v52 = (void *)v50;
    }
    else {
      v52 = v49;
    }
    id v53 = v52;

    [v53 doubleValue];
    double v55 = v54;

    v2->_minimumLineSpacing = v55;
    id v56 = +[NSNumber numberWithDouble:0.0];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v57 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_MinimumInteritemSpacing", @"com.apple.CarPlaySettings");
    v58 = (void *)v57;
    if (v57) {
      v59 = (void *)v57;
    }
    else {
      v59 = v56;
    }
    id v60 = v59;

    [v60 doubleValue];
    double v62 = v61;

    v2->_minimumInteritemSpacing = v62;
    id v63 = +[NSNumber numberWithDouble:UIViewNoIntrinsicMetric];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v64 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_IntrinsicWidth", @"com.apple.CarPlaySettings");
    v65 = (void *)v64;
    if (v64) {
      v66 = (void *)v64;
    }
    else {
      v66 = v63;
    }
    id v67 = v66;

    [v67 doubleValue];
    CGFloat v69 = v68;

    id v70 = +[NSNumber numberWithDouble:UIViewNoIntrinsicMetric];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v71 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_IntrinsicHeight", @"com.apple.CarPlaySettings");
    v72 = (void *)v71;
    if (v71) {
      v73 = (void *)v71;
    }
    else {
      v73 = v70;
    }
    id v74 = v73;

    [v74 doubleValue];
    CGFloat v76 = v75;

    v2->_intrinsictContentSize.width = v69;
    v2->_intrinsictContentSize.height = v76;
    id v77 = +[NSNumber numberWithDouble:0.0];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v78 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_SystemWidth", @"com.apple.CarPlaySettings");
    v79 = (void *)v78;
    if (v78) {
      v80 = (void *)v78;
    }
    else {
      v80 = v77;
    }
    id v81 = v80;

    [v81 doubleValue];
    CGFloat v83 = v82;

    id v84 = +[NSNumber numberWithDouble:0.0];
    CFPreferencesAppSynchronize(@"com.apple.CarPlaySettings");
    CFPropertyListRef v85 = CFPreferencesCopyAppValue(@"DebugCollectionPanel_SystemHeight", @"com.apple.CarPlaySettings");
    v86 = (void *)v85;
    if (v85) {
      v87 = (void *)v85;
    }
    else {
      v87 = v84;
    }
    id v88 = v87;

    [v88 doubleValue];
    CGFloat v90 = v89;

    v2->_systemLayoutSize.width = v83;
    v2->_systemLayoutSize.height = v90;
  }
  return v2;
}

- (unint64_t)cells
{
  return self->_cells;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (UIEdgeInsets)sectionInset
{
  double top = self->_sectionInset.top;
  double left = self->_sectionInset.left;
  double bottom = self->_sectionInset.bottom;
  double right = self->_sectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)minimumLineSpacing
{
  return self->_minimumLineSpacing;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (CGSize)intrinsictContentSize
{
  double width = self->_intrinsictContentSize.width;
  double height = self->_intrinsictContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)systemLayoutSize
{
  double width = self->_systemLayoutSize.width;
  double height = self->_systemLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end