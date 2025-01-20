@interface UICollectionReusableView(GKReusableView)
+ (id)_gkSetupThreeLineLayoutWithSuperview:()GKReusableView icon:upperLine:middleLine:lowerLine:metricOverrides:;
+ (id)_gkSetupTwoLineLayoutWithSuperview:()GKReusableView icon:upperLabel:lowerLabel:leadingBetween:fontTextStyle:metricOverrides:;
+ (id)_gkStandardConstraintMetricsForIdiom:()GKReusableView;
+ (id)_gkStandardConstraintMetricsForIdiom:()GKReusableView withOverrides:;
+ (void)_gkAdjustConstraintMargins:()GKReusableView leading:trailing:;
+ (void)_gkSetupSelectableThreeLineLayoutWithCell:()GKReusableView icon:selectionView:upperLine:middleLine:lowerLine:metricOverrides:;
+ (void)_gkSetupSelectableTwoLineLayoutWithCell:()GKReusableView icon:selectionView:upperLine:lowerLine:metricOverrides:;
+ (void)registerSupplementaryViewClassesForKind:()GKReusableView withCollectionView:;
- (GKFixedSizeImageView)_gkNewStandardImageView;
- (GKLabel)_gkNewStandardInfoLabel;
- (GKLabel)_gkNewStandardTitleLabel;
- (void)_gkSetLeadingGuideConstraint:()GKReusableView trailingGuideConstraint:;
@end

@implementation UICollectionReusableView(GKReusableView)

+ (void)registerSupplementaryViewClassesForKind:()GKReusableView withCollectionView:
{
  id v5 = a4;
  id v6 = a3;
  [v5 _gkRegisterClass:objc_opt_class() forSupplementaryViewOfKind:v6];
}

+ (id)_gkStandardConstraintMetricsForIdiom:()GKReusableView
{
  if (a3 == 1)
  {
    if (_gkStandardConstraintMetricsForIdiom__onceToken_380 != -1) {
      dispatch_once(&_gkStandardConstraintMetricsForIdiom__onceToken_380, &__block_literal_global_383);
    }
    v3 = (void *)_gkStandardConstraintMetricsForIdiom__sPadMetrics;
    goto LABEL_9;
  }
  if (!a3)
  {
    if (_gkStandardConstraintMetricsForIdiom__onceToken != -1) {
      dispatch_once(&_gkStandardConstraintMetricsForIdiom__onceToken, &__block_literal_global);
    }
    v3 = (void *)_gkStandardConstraintMetricsForIdiom__sPhoneMetrics;
LABEL_9:
    id v4 = v3;
    goto LABEL_11;
  }
  id v5 = NSString;
  id v6 = [NSString stringWithFormat:@"Assertion failed"];
  v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewCell.m"];
  id v8 = [v7 lastPathComponent];
  v9 = [v5 stringWithFormat:@"%@ (__objc_no)\n[%s (%s:%d)]", v6, "+[UICollectionReusableView(GKReusableView) _gkStandardConstraintMetricsForIdiom:]", objc_msgSend(v8, "UTF8String"), 900];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  id v4 = 0;
LABEL_11:

  return v4;
}

+ (id)_gkStandardConstraintMetricsForIdiom:()GKReusableView withOverrides:
{
  id v6 = a4;
  uint64_t v7 = [v6 count];
  id v8 = [a1 _gkStandardConstraintMetricsForIdiom:a3];
  v9 = v8;
  if (v7)
  {
    v10 = (void *)[v8 mutableCopy];

    [v10 addEntriesFromDictionary:v6];
    v9 = v10;
  }

  return v9;
}

- (void)_gkSetLeadingGuideConstraint:()GKReusableView trailingGuideConstraint:
{
  id v9 = a4;
  id v6 = a3;
  [a1 _contentMargin];
  double v8 = v7;
  objc_msgSend(v6, "setConstant:");
  [v9 setConstant:v8];
  [v6 setIdentifier:@"leadingMargin"];

  [v9 setIdentifier:@"trailingMargin"];
}

+ (void)_gkAdjustConstraintMargins:()GKReusableView leading:trailing:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v12 identifier];
        char v14 = [v13 isEqualToString:@"trailingMargin"];

        double v15 = a2;
        if ((v14 & 1) == 0)
        {
          v16 = objc_msgSend(v12, "identifier", a2);
          int v17 = [v16 isEqualToString:@"leadingMargin"];

          double v15 = a1;
          if (!v17) {
            continue;
          }
        }
        [v12 setConstant:v15];
      }
      uint64_t v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v15);
    }
    while (v9);
  }
}

- (GKLabel)_gkNewStandardTitleLabel
{
  v0 = [GKLabel alloc];
  v1 = -[GKLabel initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v2 = [MEMORY[0x1E4F639F8] textStyle];
  v3 = [v2 tableCellTitle];
  [(GKLabel *)v1 applyTextStyle:v3];

  [(GKLabel *)v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [MEMORY[0x1E4F639B0] sharedPalette];
  id v5 = [v4 selectedTextColor];
  [(GKLabel *)v1 setHighlightedTextColor:v5];

  [(GKLabel *)v1 setOpaque:0];
  [(GKLabel *)v1 setBackgroundColor:0];

  return v1;
}

- (GKLabel)_gkNewStandardInfoLabel
{
  v0 = [GKLabel alloc];
  v1 = -[GKLabel initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v2 = [MEMORY[0x1E4F639F8] textStyle];
  v3 = [v2 tableCellSubtitle];
  [(GKLabel *)v1 applyTextStyle:v3];

  [(GKLabel *)v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [MEMORY[0x1E4F639B0] sharedPalette];
  id v5 = [v4 selectedTextColor];
  [(GKLabel *)v1 setHighlightedTextColor:v5];

  [(GKLabel *)v1 setOpaque:0];
  [(GKLabel *)v1 setBackgroundColor:0];

  return v1;
}

- (GKFixedSizeImageView)_gkNewStandardImageView
{
  v0 = [GKFixedSizeImageView alloc];
  v1 = -[GKFixedSizeImageView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(GKFixedSizeImageView *)v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GKFixedSizeImageView *)v1 setOpaque:0];
  [(GKFixedSizeImageView *)v1 setBackgroundColor:0];
  return v1;
}

+ (id)_gkSetupTwoLineLayoutWithSuperview:()GKReusableView icon:upperLabel:lowerLabel:leadingBetween:fontTextStyle:metricOverrides:
{
  v49[4] = *MEMORY[0x1E4F143B8];
  v16 = (void *)MEMORY[0x1E4FB16C8];
  id v17 = a9;
  id v48 = a8;
  id v47 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  long long v21 = [v16 currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  if (v22 == 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      BOOL v23 = *MEMORY[0x1E4F63A38] == 0;
    }
    else {
      BOOL v23 = 0;
    }
    uint64_t v24 = !v23;
  }
  else
  {
    uint64_t v24 = 0;
  }
  v25 = [a1 _gkStandardConstraintMetricsForIdiom:v24 withOverrides:v17];

  v26 = [MEMORY[0x1E4F1CA48] array];
  v27 = (void *)MEMORY[0x1E4F28DC8];
  v28 = _NSDictionaryOfVariableBindings(&cfstr_Iconview.isa, v19, 0);
  v43 = [v27 constraintsWithVisualFormat:@"|-(imageLeadingMargin)-[iconView(iconSize)]" options:0 metrics:v25 views:v28];

  v46 = [v43 firstObject];
  [v46 setIdentifier:@"leadingMargin"];
  [v26 addObjectsFromArray:v43];
  v29 = [v43 firstObject];
  [v29 setIdentifier:@"leadingMargin"];

  v45 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:v19 centeredYInView:v20];
  [v26 addObject:v45];
  v30 = (void *)MEMORY[0x1E4F28DC8];
  v31 = [v25 objectForKeyedSubscript:@"iconSize"];
  [v31 floatValue];
  v44 = [v30 _gkConstraintForView:v19 withConstantHeight:v32];

  [v26 addObject:v44];
  v49[0] = v18;
  [NSNumber numberWithDouble:a2];
  v33 = v42 = v18;
  v49[1] = v33;
  v49[2] = v48;
  v49[3] = v47;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  v35 = +[GKContiguousContainerView containerForViewsFontsLeadings:v34 options:2];

  [v20 addSubview:v35];
  v36 = (void *)MEMORY[0x1E4F28DC8];
  v37 = _NSDictionaryOfVariableBindings(&cfstr_IconviewLabelc.isa, v19, v35, 0);

  v38 = [v36 constraintsWithVisualFormat:@"[iconView]-(spaceBetweenImageAndLabels)-[labelContainer]-(textTrailingMargin)-|" options:0 metrics:v25 views:v37];

  v39 = [v38 lastObject];
  [v39 setIdentifier:@"trailingMargin"];
  [v26 addObjectsFromArray:v38];
  v40 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:v35 centeredYInView:v20];

  [v26 addObject:v40];
  [v20 addConstraints:v26];

  return v26;
}

+ (id)_gkSetupThreeLineLayoutWithSuperview:()GKReusableView icon:upperLine:middleLine:lowerLine:metricOverrides:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  v39[0] = @"icon";
  v39[1] = @"line1";
  id v36 = a5;
  v37 = v14;
  v40[0] = v14;
  v40[1] = v36;
  v39[2] = @"line2";
  v39[3] = @"line3";
  id v15 = a6;
  v40[2] = v15;
  id v41 = a7;
  v35 = v41;
  v16 = (void *)MEMORY[0x1E4F1C9E8];
  id v17 = a8;
  id v18 = a3;
  id v19 = [v16 dictionaryWithObjects:v40 forKeys:v39 count:4];
  id v20 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v21 = [v20 userInterfaceIdiom];

  if (v21 == 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      BOOL v22 = *MEMORY[0x1E4F63A38] == 0;
    }
    else {
      BOOL v22 = 0;
    }
    uint64_t v23 = !v22;
  }
  else
  {
    uint64_t v23 = 0;
  }
  v34 = [a1 _gkStandardConstraintMetricsForIdiom:v23 withOverrides:v17];

  uint64_t v24 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[line1][line2][line3]" options:2 metrics:0 views:v19];
  v25 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-hMargin-[icon(iconSize)]-betweenMargin-[line2]-textRightMargin-|" options:0 metrics:v34 views:v19];
  v26 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-hMargin-[icon]-betweenMargin-[line1]-textRightMargin-|" options:0 metrics:v34 views:v19];
  v27 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-hMargin-[icon]-betweenMargin-[line3]-textRightMargin-|" options:0 metrics:v34 views:v19];
  v28 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[icon(iconSize)]" options:1024 metrics:v34 views:v19];
  v33 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:v15 centeredYInView:v18];
  float v32 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:v37 centeredYInView:v18];
  [v32 setConstant:-1.0];
  v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v24, "count")+ objc_msgSend(v25, "count")+ objc_msgSend(v26, "count")+ objc_msgSend(v27, "count")+ objc_msgSend(v28, "count")+ 2);
  [v29 addObjectsFromArray:v24];
  [v29 addObjectsFromArray:v25];
  [v29 addObjectsFromArray:v26];
  [v29 addObjectsFromArray:v27];
  [v29 addObjectsFromArray:v28];
  v38[0] = v33;
  v38[1] = v32;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  [v29 addObjectsFromArray:v30];

  [v18 addConstraints:v29];

  return v29;
}

+ (void)_gkSetupSelectableTwoLineLayoutWithCell:()GKReusableView icon:selectionView:upperLine:lowerLine:metricOverrides:
{
  v65[5] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v19 = a8;
  id v20 = a3;
  id v21 = [v18 alloc];
  BOOL v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v22 setHidden:1];
  v64[0] = @"selection";
  v64[1] = @"icon";
  v62 = v17;
  v63 = v15;
  v65[0] = v15;
  v65[1] = v14;
  id v23 = v14;
  v64[2] = @"line1";
  v64[3] = @"line2";
  v65[2] = v16;
  v65[3] = v17;
  v64[4] = @"leftSpacer";
  uint64_t v24 = v22;
  v65[4] = v22;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:5];
  v26 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v27 = [v26 userInterfaceIdiom];

  if (v27 == 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      BOOL v28 = *MEMORY[0x1E4F63A38] == 0;
    }
    else {
      BOOL v28 = 0;
    }
    uint64_t v29 = !v28;
  }
  else
  {
    uint64_t v29 = 0;
  }
  v30 = [a1 _gkStandardConstraintMetricsForIdiom:v29 withOverrides:v19];

  v31 = [MEMORY[0x1E4F1CA48] array];
  v60 = [v20 interactiveContentView];
  float v32 = [v20 staticContentView];

  [v32 addSubview:v24];
  v61 = v23;
  v33 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:v23 centeredYInView:v32];
  [v31 addObject:v33];

  v34 = (void *)MEMORY[0x1E4F28DC8];
  v35 = [v30 objectForKeyedSubscript:@"iconSize"];
  [v35 floatValue];
  v37 = [v34 _gkConstraintForView:v23 withConstantHeight:v36];
  [v31 addObject:v37];

  v38 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-imageLeadingMargin-[leftSpacer(selectionSize)]-imageLeadingMargin-[icon(iconSize)]-betweenMargin@999-[line1]-textRightMargin-|" options:0 metrics:v30 views:v25];
  v39 = [v38 firstObject];
  [v39 setIdentifier:@"leadingMargin"];

  v59 = v38;
  v40 = [v38 lastObject];
  [v40 setIdentifier:@"trailingMargin"];

  [v31 addObjectsFromArray:v38];
  id v41 = [MEMORY[0x1E4F28DC8] constraintWithItem:v62 attribute:1 relatedBy:0 toItem:v16 attribute:1 multiplier:1.0 constant:0.0];
  [v31 addObject:v41];

  uint64_t v42 = [MEMORY[0x1E4F28DC8] constraintWithItem:v62 attribute:2 relatedBy:0 toItem:v16 attribute:2 multiplier:1.0 constant:0.0];
  [v31 addObject:v42];

  v43 = (void *)MEMORY[0x1E4F28DC8];
  v44 = [v30 objectForKeyedSubscript:@"twoLineTopToFirstTop"];
  [v44 floatValue];
  v46 = [v43 constraintWithItem:v16 attribute:3 relatedBy:0 toItem:v32 attribute:3 multiplier:1.0 constant:v45];
  [v31 addObject:v46];

  id v47 = (void *)MEMORY[0x1E4F28DC8];
  id v48 = [v30 objectForKeyedSubscript:@"twoLineTopToSecondTop"];
  [v48 floatValue];
  v50 = [v47 constraintWithItem:v62 attribute:3 relatedBy:0 toItem:v32 attribute:3 multiplier:1.0 constant:v49];
  [v31 addObject:v50];

  [v32 addConstraints:v31];
  v51 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-hMargin-[selection(selectionSize)]" options:0 metrics:v30 views:v25];
  [v60 addConstraints:v51];
  v52 = (void *)MEMORY[0x1E4F28DC8];
  [v30 objectForKeyedSubscript:@"selectionSize"];
  v53 = v58 = v16;
  [v53 floatValue];
  v55 = [v52 _gkConstraintForView:v63 withConstantHeight:v54];
  [v60 addConstraint:v55];

  v56 = [MEMORY[0x1E4F28DC8] constraintWithItem:v63 attribute:10 relatedBy:0 toItem:v60 attribute:10 multiplier:1.0 constant:0.0];
  [v60 addConstraint:v56];

  v57 = [v51 firstObject];
  [v57 setIdentifier:@"leadingMargin"];
}

+ (void)_gkSetupSelectableThreeLineLayoutWithCell:()GKReusableView icon:selectionView:upperLine:middleLine:lowerLine:metricOverrides:
{
  v64[6] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v20 = a9;
  id v21 = a3;
  id v22 = [v19 alloc];
  id v23 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v23 setHidden:1];
  v63[0] = @"selection";
  v63[1] = @"icon";
  v59 = v14;
  v60 = v15;
  v64[0] = v15;
  v64[1] = v14;
  v63[2] = @"line1";
  v63[3] = @"line2";
  v58 = v18;
  v64[2] = v16;
  v64[3] = v17;
  uint64_t v24 = v17;
  v63[4] = @"line3";
  v63[5] = @"leftSpacer";
  v64[4] = v18;
  void v64[5] = v23;
  v25 = v23;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:6];
  uint64_t v27 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v28 = [v27 userInterfaceIdiom];

  if (v28 == 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      BOOL v29 = *MEMORY[0x1E4F63A38] == 0;
    }
    else {
      BOOL v29 = 0;
    }
    uint64_t v30 = !v29;
  }
  else
  {
    uint64_t v30 = 0;
  }
  uint64_t v31 = [a1 _gkStandardConstraintMetricsForIdiom:v30 withOverrides:v20];

  id v47 = [v21 interactiveContentView];
  float v32 = [v21 staticContentView];

  v53 = v25;
  [v32 addSubview:v25];
  v33 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[line1][line2][line3]" options:2 metrics:0 views:v26];
  v50 = (void *)v31;
  float v54 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-imageLeadingMargin-[leftSpacer(selectionSize)]-imageLeadingMargin-[icon(iconSize)]-betweenMargin@999-[line1]-textRightMargin-|" options:0 metrics:v31 views:v26];
  v34 = [v54 firstObject];
  [v34 setIdentifier:@"leadingMargin"];

  v35 = [v54 lastObject];
  [v35 setIdentifier:@"trailingMargin"];

  v51 = [MEMORY[0x1E4F28DC8] constraintWithItem:v24 attribute:1 relatedBy:0 toItem:v16 attribute:1 multiplier:1.0 constant:0.0];
  v57 = [MEMORY[0x1E4F28DC8] constraintWithItem:v24 attribute:2 relatedBy:0 toItem:v16 attribute:2 multiplier:1.0 constant:0.0];
  v55 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:1 relatedBy:0 toItem:v16 attribute:1 multiplier:1.0 constant:0.0];
  float v49 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:2 relatedBy:0 toItem:v16 attribute:2 multiplier:1.0 constant:0.0];
  float v36 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[icon(iconSize)]" options:1024 metrics:v31 views:v26];
  v46 = v32;
  v44 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:v24 centeredYInView:v32];
  float v45 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:v60 centeredYInView:v47];
  id v48 = (void *)v26;
  v37 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:v59 centeredYInView:v32];
  [v37 setConstant:-1.0];
  [v45 setConstant:-1.0];
  v52 = v33;
  v38 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v33, "count") + objc_msgSend(v54, "count") + objc_msgSend(v36, "count") + 5);
  [v38 addObjectsFromArray:v33];
  [v38 addObjectsFromArray:v54];
  v62[0] = v51;
  v62[1] = v57;
  v62[2] = v55;
  v62[3] = v49;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
  [v38 addObjectsFromArray:v39];

  [v38 addObjectsFromArray:v36];
  v61[0] = v44;
  v61[1] = v37;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  [v38 addObjectsFromArray:v40];

  [v46 addConstraints:v38];
  [v47 addConstraint:v45];
  id v41 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[selection(selectionSize)]" options:1024 metrics:v50 views:v48];
  [v47 addConstraints:v41];

  uint64_t v42 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-hMargin-[selection(selectionSize)]" options:0 metrics:v50 views:v48];
  v43 = [v42 firstObject];
  [v43 setIdentifier:@"leadingMargin"];

  [v47 addConstraints:v42];
}

@end