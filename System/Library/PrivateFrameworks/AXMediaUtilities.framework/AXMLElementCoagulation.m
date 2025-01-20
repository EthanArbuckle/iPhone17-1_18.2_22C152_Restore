@interface AXMLElementCoagulation
+ (id)sharedInstance;
- (AXMLElementCoagulation)init;
- (BOOL)_allTabGroupsHaveSingleSubfeature:(id)a3;
- (BOOL)_hasXOverlap:(CGRect)a3 obj2:(CGRect)a4;
- (BOOL)_hasYOverlap:(CGRect)a3 obj2:(CGRect)a4;
- (BOOL)_isInTopBar:(id)a3;
- (BOOL)_shouldBeTabBar:(BOOL)a3 groupedTabButtons:(id)a4;
- (BOOL)isRTL;
- (BOOL)isiPad;
- (CGRect)appFrame;
- (CGSize)canvasSize;
- (NSArray)clickableTextKeywords;
- (NSRegularExpression)nonAlphaCharactersRegex;
- (double)_getXOverlap:(CGRect)a3 obj2:(CGRect)a4;
- (double)_getYOverlap:(CGRect)a3 obj2:(CGRect)a4;
- (double)screenScale;
- (id)_applyCrossUITypeNMS:(id)a3;
- (id)_applyHorizontalMirrorToFeatures:(id)a3;
- (id)_compareArea:(id)a3;
- (id)_compareForX:(id)a3;
- (id)_compareForY:(id)a3;
- (id)_createToggleGroup:(id)a3 toGroup:(id)a4;
- (id)_featuresByReorderingTwoRows:(id)a3 minY:(double)a4 maxY:(double)a5;
- (id)_flattenFeatures:(id)a3;
- (id)_getAXMLElementGroupsForFeatures:(id)a3;
- (id)_getCandidateTabBarFeatures:(id)a3 screenSize:(CGSize)a4;
- (id)_getClickableTextButtons:(id)a3;
- (id)_getClosestDetectionBelow:(id)a3 target:(id)a4 maxDistance:(int64_t)a5;
- (id)_getFeaturesForAXMLTabButtonGroups:(id)a3;
- (id)_getFlattenedChildFeatures:(id)a3;
- (id)_getGroupedPictureAndSubtitleFeature:(id)a3;
- (id)_getGroupedSegmentedControlFeatures:(id)a3;
- (id)_getGroupedTabBarFeatures:(id)a3;
- (id)_getGroupedTextButtonFeatures:(id)a3;
- (id)_getGroupedTextFeatures:(id)a3;
- (id)_getGroupedTextFields:(id)a3;
- (id)_getGroupedToggleCheckboxWithText:(id)a3;
- (id)_getHorizontalSegmentationPointDict:(id)a3;
- (id)_getTabGroupSubfeatureUIClassTypes:(id)a3;
- (id)_getTopLevelFeatureGroups:(id)a3;
- (id)_groupFeatures:(id)a3;
- (id)_groupFeaturesByContainment:(id)a3;
- (id)_groupSingleContainerAsButton:(id)a3 featureToGroup:(id)a4;
- (id)_mergeTopLeftButton:(id)a3;
- (id)_removeExtraOCRAndIconFromTextField:(id)a3;
- (id)_removeTextContainingOnlyToggles:(id)a3 toggleCheckboxTypes:(id)a4;
- (id)_reorderByXCut:(id)a3;
- (id)_reorderByYCut:(id)a3;
- (id)_reorderSimilarTopNeighbors:(id)a3;
- (id)_reorderedTabsForSortedFeatures:(id)a3 screenSize:(CGSize)a4;
- (id)_repairTextInTabItems:(id)a3;
- (id)_sortFeaturesReadingOrder:(id)a3;
- (id)coagulateElements:(id)a3;
- (int64_t)_compareX:(CGRect)a3 frame2:(CGRect)a4;
- (int64_t)_compareY:(CGRect)a3 frame2:(CGRect)a4;
- (int64_t)appOrientation;
- (void)_improveFeatureFrames:(id)a3;
- (void)_mergeFeatureIntoGroup:(id)a3 feature:(id)a4;
- (void)_removeFeatureFromGroup:(id)a3 feature:(id)a4;
- (void)setAppFrame:(CGRect)a3;
- (void)setAppOrientation:(int64_t)a3;
- (void)setCanvasSize:(CGSize)a3;
- (void)setClickableTextKeywords:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setIsiPad:(BOOL)a3;
- (void)setNonAlphaCharactersRegex:(id)a3;
- (void)setScreenScale:(double)a3;
@end

@implementation AXMLElementCoagulation

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_97);
  }
  v2 = (void *)sharedInstance_Coagulator;

  return v2;
}

void __40__AXMLElementCoagulation_sharedInstance__block_invoke()
{
  v0 = [[AXMLElementCoagulation alloc] init];
  v1 = (void *)sharedInstance_Coagulator;
  sharedInstance_Coagulator = (uint64_t)v0;
}

- (AXMLElementCoagulation)init
{
  v12.receiver = self;
  v12.super_class = (Class)AXMLElementCoagulation;
  v2 = [(AXMLElementCoagulation *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    v5 = [v3 pathForResource:@"AXMLElementProperties" ofType:@"plist"];
    v6 = [v4 dictionaryWithContentsOfFile:v5];

    uint64_t v7 = [v6 objectForKeyedSubscript:@"clickable_text_keywords"];
    clickableTextKeywords = v2->_clickableTextKeywords;
    v2->_clickableTextKeywords = (NSArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[^[a-z]]" options:1 error:0];
    nonAlphaCharactersRegex = v2->_nonAlphaCharactersRegex;
    v2->_nonAlphaCharactersRegex = (NSRegularExpression *)v9;

    v2->_isiPad = AXDeviceIsPad();
  }
  return v2;
}

- (BOOL)_hasXOverlap:(CGRect)a3 obj2:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v17.origin.CGFloat x = v11;
  v17.origin.CGFloat y = v10;
  v17.size.CGFloat width = v9;
  v17.size.CGFloat height = v8;
  double MaxX = CGRectGetMaxX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v13 = CGRectGetMinX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  BOOL v14 = MinX < CGRectGetMaxX(v19);
  return MaxX > v13 && v14;
}

- (double)_getXOverlap:(CGRect)a3 obj2:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v14 = CGRectGetMinX(v16);
  v17.origin.CGFloat x = v11;
  v17.origin.CGFloat y = v10;
  v17.size.CGFloat width = v9;
  v17.size.CGFloat height = v8;
  double MaxX = CGRectGetMaxX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  return fmax(fmin(MaxX, CGRectGetMaxX(v18)) - fmax(MinX, v14) + 1.0, 0.0);
}

- (BOOL)_hasYOverlap:(CGRect)a3 obj2:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  double MinY = CGRectGetMinY(a3);
  v17.origin.CGFloat x = v11;
  v17.origin.CGFloat y = v10;
  v17.size.CGFloat width = v9;
  v17.size.CGFloat height = v8;
  double MaxY = CGRectGetMaxY(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v13 = CGRectGetMinY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  BOOL v14 = MinY < CGRectGetMaxY(v19);
  return MaxY > v13 && v14;
}

- (double)_getYOverlap:(CGRect)a3 obj2:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  double MinY = CGRectGetMinY(a3);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v14 = CGRectGetMinY(v16);
  v17.origin.CGFloat x = v11;
  v17.origin.CGFloat y = v10;
  v17.size.CGFloat width = v9;
  v17.size.CGFloat height = v8;
  double MaxY = CGRectGetMaxY(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  return fmax(fmin(MaxY, CGRectGetMaxY(v18)) - fmax(MinY, v14) + 1.0, 0.0);
}

- (id)coagulateElements:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AXMLElementCoagulation *)self screenScale];
  double v6 = v5;
  [(AXMLElementCoagulation *)self appFrame];
  double v8 = v6 * v7;
  [(AXMLElementCoagulation *)self screenScale];
  double v10 = v9;
  [(AXMLElementCoagulation *)self appFrame];
  -[AXMLElementCoagulation setCanvasSize:](self, "setCanvasSize:", v8, v10 * v11);
  if ((unint64_t)([(AXMLElementCoagulation *)self appOrientation] - 3) <= 1)
  {
    [(AXMLElementCoagulation *)self canvasSize];
    double v13 = v12;
    [(AXMLElementCoagulation *)self canvasSize];
    -[AXMLElementCoagulation setCanvasSize:](self, "setCanvasSize:", v13, v14);
  }
  v15 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_117);
  if ([v15 count])
  {
    id v71 = v4;
    CGRect v16 = [(AXMLElementCoagulation *)self _applyCrossUITypeNMS:v15];

    [(AXMLElementCoagulation *)self screenScale];
    double v18 = v17;
    [(AXMLElementCoagulation *)self appFrame];
    double v20 = v18 * v19;
    [(AXMLElementCoagulation *)self screenScale];
    double v22 = v21;
    [(AXMLElementCoagulation *)self appFrame];
    v24 = -[AXMLElementCoagulation _getCandidateTabBarFeatures:screenSize:](self, "_getCandidateTabBarFeatures:screenSize:", v16, v20, v22 * v23);
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __44__AXMLElementCoagulation_coagulateElements___block_invoke_2;
    v82[3] = &unk_1E6117F58;
    id v83 = v24;
    id v25 = v24;
    v69 = v16;
    v26 = objc_msgSend(v16, "ax_filteredArrayUsingBlock:", v82);
    uint64_t v27 = [v26 mutableCopy];

    uint64_t v28 = [(AXMLElementCoagulation *)self _repairTextInTabItems:v25];

    v67 = (void *)v28;
    v29 = [(AXMLElementCoagulation *)self _getAXMLElementGroupsForFeatures:v28];
    v30 = [(AXMLElementCoagulation *)self _sortFeaturesReadingOrder:v29];

    v31 = [(AXMLElementCoagulation *)self _getGroupedTabBarFeatures:v30];
    v70 = self;
    v68 = (void *)v27;
    v32 = [(AXMLElementCoagulation *)self _getAXMLElementGroupsForFeatures:v27];
    v33 = (void *)[v32 mutableCopy];

    if ([v30 count] && !objc_msgSend(v31, "count")) {
      [v33 addObjectsFromArray:v30];
    }
    v66 = v30;
    v34 = [MEMORY[0x1E4F1CA48] array];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    obuint64_t j = v33;
    uint64_t v35 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v73 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v79 != v73) {
            objc_enumerationMutation(obj);
          }
          v38 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          v39 = v31;
          id v40 = v31;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v74 objects:v84 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v75;
            do
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v75 != v43) {
                  objc_enumerationMutation(v40);
                }
                [*(id *)(*((void *)&v74 + 1) + 8 * j) frame];
                double v46 = v45;
                double v48 = v47;
                double v50 = v49;
                double v52 = v51;
                [v38 frame];
                if (AXMIsContainedBy(v46, v48, v50, v52, v53, v54, v55, v56, 0.7)) {
                  [v34 addObject:v38];
                }
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v74 objects:v84 count:16];
            }
            while (v42);
          }

          v31 = v39;
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
      }
      while (v36);
    }

    [obj removeObjectsInArray:v34];
    v57 = [(AXMLElementCoagulation *)v70 _groupFeatures:obj];
    v58 = [(AXMLElementCoagulation *)v70 _flattenFeatures:v57];

    v59 = objc_msgSend(v58, "ax_filteredArrayUsingBlock:", &__block_literal_global_120);

    [(AXMLElementCoagulation *)v70 _improveFeatureFrames:v59];
    if ([(AXMLElementCoagulation *)v70 isRTL])
    {
      v60 = [v31 reverseObjectEnumerator];
      uint64_t v61 = [v60 allObjects];

      v31 = (void *)v61;
    }
    v62 = [v59 arrayByAddingObjectsFromArray:v31];

    v63 = objc_msgSend(v62, "ax_mappedArrayUsingBlock:", &__block_literal_global_123_0);

    id v64 = v63;
    id v4 = v71;
  }
  else
  {
    id v64 = v15;
  }

  return v64;
}

BOOL __44__AXMLElementCoagulation_coagulateElements___block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureType] == 22;
}

BOOL __44__AXMLElementCoagulation_coagulateElements___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0 && objc_msgSend(v3, "uiClass") != 10;

  return v4;
}

BOOL __44__AXMLElementCoagulation_coagulateElements___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 feature];
  if ([v3 uiClass] == 3)
  {
    BOOL v4 = [v2 feature];
    double v5 = [v4 subfeatures];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

uint64_t __44__AXMLElementCoagulation_coagulateElements___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 feature];
}

- (id)_getAXMLElementGroupsForFeatures:(id)a3
{
  return (id)objc_msgSend(a3, "ax_mappedArrayUsingBlock:", &__block_literal_global_126);
}

AXMMLElementGroup *__59__AXMLElementCoagulation__getAXMLElementGroupsForFeatures___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(AXMMLElementGroup);
  [(AXMMLElementGroup *)v3 setFeature:v2];
  [v2 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[AXMMLElementGroup setFrame:](v3, "setFrame:", v5, v7, v9, v11);

  return v3;
}

- (id)_applyCrossUITypeNMS:(id)a3
{
  v56[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v36 = [MEMORY[0x1E4F1CA48] array];
  v55[0] = &unk_1F0E93670;
  v55[1] = &unk_1F0E936B8;
  v56[0] = &unk_1F0E94200;
  v56[1] = &unk_1F0E94218;
  v55[2] = &unk_1F0E93688;
  v55[3] = &unk_1F0E936A0;
  v56[2] = &unk_1F0E94230;
  v56[3] = &unk_1F0E94248;
  v55[4] = &unk_1F0E936E8;
  v55[5] = &unk_1F0E93700;
  v56[4] = &unk_1F0E94260;
  v56[5] = &unk_1F0E94278;
  v55[6] = &unk_1F0E93718;
  v56[6] = &unk_1F0E94290;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:7];
  v33 = v3;
  [v3 sortedArrayUsingComparator:&__block_literal_global_163];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v37)
  {
    uint64_t v35 = *(void *)v50;
    unint64_t v5 = 0x1E4F28000uLL;
    uint64_t v41 = v4;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v50 != v35) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v8 = v36;
        uint64_t v44 = [v8 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (!v44)
        {

LABEL_22:
          [v8 addObject:v7];
          continue;
        }
        uint64_t v38 = i;
        uint64_t v42 = v7;
        uint64_t v43 = *(void *)v46;
        char v39 = 1;
        id v40 = v8;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v46 != v43) {
              objc_enumerationMutation(v40);
            }
            double v10 = *(void **)(*((void *)&v45 + 1) + 8 * j);
            double v11 = objc_msgSend(*(id *)(v5 + 3792), "numberWithInteger:", objc_msgSend(v10, "uiClass"));
            uint64_t v12 = [v4 objectForKeyedSubscript:v11];
            if (v12)
            {
              double v13 = (void *)v12;
              double v14 = objc_msgSend(*(id *)(v5 + 3792), "numberWithInteger:", objc_msgSend(v10, "uiClass"));
              v15 = [v4 objectForKeyedSubscript:v14];
              unint64_t v16 = v5;
              double v17 = objc_msgSend(*(id *)(v5 + 3792), "numberWithInteger:", objc_msgSend(v42, "uiClass"));
              uint64_t v18 = [v15 indexOfObject:v17];

              if (v18 == 0x7FFFFFFFFFFFFFFFLL)
              {
                double v4 = v41;
                unint64_t v5 = v16;
              }
              else
              {
                [v10 frame];
                CGFloat v20 = v19;
                CGFloat v22 = v21;
                CGFloat v24 = v23;
                CGFloat v26 = v25;
                [v42 frame];
                AXMIntersectionOverUnion(v20, v22, v24, v26, v27, v28, v29, v30);
                double v4 = v41;
                unint64_t v5 = v16;
                if (v31 > 0.7) {
                  char v39 = 0;
                }
              }
            }
            else
            {
            }
          }
          id v8 = v40;
          uint64_t v44 = [v40 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v44);

        uint64_t i = v38;
        double v7 = v42;
        if (v39) {
          goto LABEL_22;
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v37);
  }

  return v36;
}

uint64_t __47__AXMLElementCoagulation__applyCrossUITypeNMS___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  if (v6 >= 1.0)
  {
    uint64_t v12 = -1;
  }
  else
  {
    [v5 confidence];
    if (v7 >= 1.0)
    {
      uint64_t v12 = 1;
    }
    else
    {
      id v8 = NSNumber;
      [v4 confidence];
      double v9 = objc_msgSend(v8, "numberWithDouble:");
      double v10 = NSNumber;
      [v5 confidence];
      double v11 = objc_msgSend(v10, "numberWithDouble:");
      uint64_t v12 = [v9 compare:v11] == 0;
    }
  }

  return v12;
}

- (BOOL)_isInTopBar:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double MinX = CGRectGetMinX(v25);
  [v4 frame];
  double v6 = MinX + CGRectGetWidth(v26) * 0.5;
  [v4 frame];
  double MinY = CGRectGetMinY(v27);
  [v4 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v28.origin.CGFloat x = v9;
  v28.origin.CGFloat y = v11;
  v28.size.CGFloat width = v13;
  v28.size.CGFloat height = v15;
  double v16 = MinY + CGRectGetHeight(v28) * 0.5;
  [(AXMLElementCoagulation *)self canvasSize];
  double v18 = vabdd_f64(v6, v17 * 0.5);
  [(AXMLElementCoagulation *)self canvasSize];
  BOOL v20 = v18 < v19 / 10.0;
  [(AXMLElementCoagulation *)self canvasSize];
  double v22 = fabs(v16 + v21 / -13.0);
  [(AXMLElementCoagulation *)self canvasSize];
  return v22 < v23 / 20.0 && v20;
}

- (id)_getClickableTextButtons:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0x1E4F1C000uLL;
    while (1)
    {
      double v7 = [v4 objectAtIndex:v5];
      double v8 = [v7 feature];
      if ([v8 uiClass] != 11 || -[AXMLElementCoagulation _isInTopBar:](self, "_isInTopBar:", v7)) {
        goto LABEL_10;
      }
      CGFloat v9 = [v7 feature];
      double v10 = [v9 value];
      CGFloat v11 = [*(id *)(v6 + 2712) null];
      char v12 = [v10 isEqual:v11];

      if ((v12 & 1) == 0) {
        break;
      }
LABEL_11:

      if (++v5 >= (unint64_t)[v4 count]) {
        goto LABEL_12;
      }
    }
    CGFloat v13 = [(AXMLElementCoagulation *)self nonAlphaCharactersRegex];
    double v14 = [v7 feature];
    CGFloat v15 = [v14 value];
    double v16 = [v7 feature];
    double v17 = [v16 value];
    double v18 = objc_msgSend(v13, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v17, "length"), &stru_1F0E72D10);

    double v8 = [v18 lowercaseString];

    if ([v8 length])
    {
      double v19 = [(AXMLElementCoagulation *)self clickableTextKeywords];
      int v20 = [v19 containsObject:v8];

      if (v20)
      {
        [v7 frame];
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        CGFloat v29 = [v7 feature];
        [v29 confidence];
        double v31 = v30;
        v32 = [v7 feature];
        v33 = [v32 value];
        [(AXMLElementCoagulation *)self canvasSize];
        double v35 = v34;
        double v37 = v36;
        uint64_t v38 = [MEMORY[0x1E4F1C978] array];
        char v39 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 17, v33, v38, v22, v24, v26, v28, v31, v35, v37);

        [v7 setFeature:v39];
      }
    }
    unint64_t v6 = 0x1E4F1C000;
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:

  return v4;
}

- (id)_flattenFeatures:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "addObject:", v11, (void)v15);
        char v12 = [v11 subfeatures];
        if ([v12 count])
        {
          int v13 = [v11 includeChildren];

          if (!v13) {
            continue;
          }
          char v12 = [(AXMLElementCoagulation *)self _getFlattenedChildFeatures:v11];
          [v5 addObjectsFromArray:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_getFlattenedChildFeatures:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v4, "subfeatures", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v5 addObject:v11];
        char v12 = [v11 subfeatures];
        if ([v12 count])
        {
          int v13 = [v11 includeChildren];

          if (!v13) {
            continue;
          }
          char v12 = [(AXMLElementCoagulation *)self _getFlattenedChildFeatures:v11];
          [v5 addObjectsFromArray:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_groupFeatures:(id)a3
{
  id v4 = [(AXMLElementCoagulation *)self _getClickableTextButtons:a3];
  uint64_t v5 = [(AXMLElementCoagulation *)self _sortFeaturesReadingOrder:v4];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(AXMLElementCoagulation *)self _getGroupedSegmentedControlFeatures:v6];

  uint64_t v8 = [(AXMLElementCoagulation *)self _getGroupedTextFields:v7];

  uint64_t v9 = [(AXMLElementCoagulation *)self _mergeTopLeftButton:v8];

  double v10 = [(AXMLElementCoagulation *)self _getGroupedToggleCheckboxWithText:v9];

  CGFloat v11 = [(AXMLElementCoagulation *)self _getGroupedTextFeatures:v10];

  char v12 = [(AXMLElementCoagulation *)self _getGroupedPictureAndSubtitleFeature:v11];

  int v13 = [(AXMLElementCoagulation *)self _groupFeaturesByContainment:v12];

  double v14 = [(AXMLElementCoagulation *)self _getTopLevelFeatureGroups:v13];

  long long v15 = [(AXMLElementCoagulation *)self _getGroupedTextButtonFeatures:v14];

  if ([(AXMLElementCoagulation *)self isRTL]) {
    id v16 = [(AXMLElementCoagulation *)self _applyHorizontalMirrorToFeatures:v15];
  }
  long long v17 = [(AXMLElementCoagulation *)self _reorderByYCut:v15];

  if ([(AXMLElementCoagulation *)self isRTL]) {
    id v18 = [(AXMLElementCoagulation *)self _applyHorizontalMirrorToFeatures:v17];
  }

  return v17;
}

- (id)_applyHorizontalMirrorToFeatures:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [(AXMLElementCoagulation *)self canvasSize];
        double v11 = v10;
        [v9 frame];
        double v12 = v11 - CGRectGetMinX(v24);
        [v9 frame];
        double v13 = v12 - CGRectGetWidth(v25);
        [v9 frame];
        double MinY = CGRectGetMinY(v26);
        [v9 frame];
        double Width = CGRectGetWidth(v27);
        [v9 frame];
        objc_msgSend(v9, "setFrame:", v13, MinY, Width, CGRectGetHeight(v28));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_getGroupedTextFeatures:(id)a3
{
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  v192 = (void *)[a3 mutableCopy];
  id v4 = objc_msgSend(v192, "ax_filteredArrayUsingBlock:", &__block_literal_global_168);
  uint64_t v5 = (void *)[v4 mutableCopy];

  v206 = self;
  uint64_t v6 = [(AXMLElementCoagulation *)self _compareForY:v5];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [v7 count];
  v205 = v7;
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  unint64_t v12 = 0;
  unint64_t v13 = 0x1E4F28000uLL;
  uint64_t v202 = v10;
  do
  {
    double v14 = [v7 objectAtIndex:v12];
    unint64_t v15 = 0;
    while (1)
    {
      id v16 = [v7 objectAtIndex:v15];
      if (v15 > v12)
      {
        [v14 frame];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        [v16 frame];
        BOOL v29 = -[AXMLElementCoagulation _hasXOverlap:obj2:](v206, "_hasXOverlap:obj2:", v18, v20, v22, v24, v25, v26, v27, v28);
        [v16 frame];
        double MinY = CGRectGetMinY(v239);
        [v14 frame];
        double v31 = CGRectGetMinY(v240);
        uint64_t v32 = [v8 indexOfObject:v16];
        if (v29 && MinY > v31 && v32 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
      }
LABEL_15:

      ++v15;
      uint64_t v7 = v205;
      if (v11 == v15) {
        goto LABEL_18;
      }
    }
    [v14 frame];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    [v16 frame];
    -[AXMLElementCoagulation _getXOverlap:obj2:](v206, "_getXOverlap:obj2:", v34, v36, v38, v40, v41, v42, v43, v44);
    double v46 = v45;
    [v14 frame];
    double Width = CGRectGetWidth(v241);
    [v16 frame];
    if ((Width + CGRectGetWidth(v242) - (double)(unint64_t)v46) / (double)(unint64_t)v46 <= 2.0) {
      double v48 = 1.0;
    }
    else {
      double v48 = 1.5;
    }
    [v16 frame];
    double v49 = CGRectGetMinY(v243);
    [v14 frame];
    double v50 = v49 - CGRectGetMaxY(v244);
    [v14 frame];
    double Height = CGRectGetHeight(v245);
    [v16 frame];
    if (v50 <= fmin(Height, CGRectGetHeight(v246)) / v48)
    {
      long long v52 = v8;
      [v8 addObject:v16];
      double v53 = [*(id *)(v13 + 3792) numberWithUnsignedInteger:v12];
      double v54 = [v9 objectForKey:v53];

      if (!v54)
      {
        double v55 = [MEMORY[0x1E4F1CA48] array];
        double v56 = [*(id *)(v13 + 3792) numberWithUnsignedInteger:v12];
        [v9 setObject:v55 forKeyedSubscript:v56];
      }
      v57 = [*(id *)(v13 + 3792) numberWithUnsignedInteger:v12];
      v58 = [v9 objectForKey:v57];
      [*(id *)(v13 + 3792) numberWithUnsignedInteger:v15];
      v60 = unint64_t v59 = v13;
      [v58 addObject:v60];

      unint64_t v13 = v59;
      uint64_t v8 = v52;
      uint64_t v11 = v202;
      goto LABEL_15;
    }

    uint64_t v7 = v205;
LABEL_18:

    ++v12;
  }
  while (v12 != v11);
LABEL_19:
  v191 = v8;
  [v9 allKeys];
  long long v227 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = [obj countByEnumeratingWithState:&v227 objects:v236 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v203 = *(void *)v228;
    do
    {
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v228 != v203) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = *(void *)(*((void *)&v227 + 1) + 8 * i);
        v65 = [v9 objectForKey:v64];
        if ([v65 count])
        {
          unint64_t v66 = 0;
          do
          {
            v67 = [v65 objectAtIndex:v66];
            uint64_t v68 = (int)[v67 intValue];

            v69 = [v7 objectAtIndex:v68];
            if (++v66 < [v65 count])
            {
              unint64_t v70 = v66;
              while (1)
              {
                id v71 = [v65 objectAtIndex:v70];
                uint64_t v72 = (int)[v71 intValue];

                uint64_t v73 = [v205 objectAtIndex:v72];
                [v69 frame];
                double v75 = v74;
                double v77 = v76;
                double v79 = v78;
                double v81 = v80;
                [v73 frame];
                if (-[AXMLElementCoagulation _hasYOverlap:obj2:](v206, "_hasYOverlap:obj2:", v75, v77, v79, v81, v82, v83, v84, v85))
                {
                  [v69 frame];
                  double v87 = v86;
                  double v89 = v88;
                  double v91 = v90;
                  double v93 = v92;
                  [v73 frame];
                  if (!-[AXMLElementCoagulation _hasXOverlap:obj2:](v206, "_hasXOverlap:obj2:", v87, v89, v91, v93, v94, v95, v96, v97))break; {
                }
                  }

                if (++v70 >= [v65 count]) {
                  goto LABEL_33;
                }
              }
              v98 = [MEMORY[0x1E4F1CA48] array];
              [v9 setObject:v98 forKeyedSubscript:v64];
            }
LABEL_33:

            uint64_t v7 = v205;
          }
          while (v66 < [v65 count]);
        }
      }
      uint64_t v62 = [obj countByEnumeratingWithState:&v227 objects:v236 count:16];
    }
    while (v62);
  }
  v204 = v9;
  long long v225 = 0u;
  long long v226 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  id v99 = obj;
  uint64_t v100 = [v99 countByEnumeratingWithState:&v223 objects:v235 count:16];
  if (v100)
  {
    uint64_t v101 = v100;
    uint64_t v102 = *(void *)v224;
    do
    {
      for (uint64_t j = 0; j != v101; ++j)
      {
        if (*(void *)v224 != v102) {
          objc_enumerationMutation(v99);
        }
        uint64_t v104 = *(void *)(*((void *)&v223 + 1) + 8 * j);
        v105 = [v204 objectForKeyedSubscript:v104];

        if (v105)
        {
          v106 = [MEMORY[0x1E4F1CA48] array];
          v107 = [v204 objectForKey:v104];
          v108 = v107;
          while ([v107 count])
          {
            v109 = [v108 objectAtIndex:0];
            v110 = [v204 objectForKeyedSubscript:v109];

            if (v110)
            {
              v111 = [v204 objectForKeyedSubscript:v109];
              [v108 addObjectsFromArray:v111];

              [v204 removeObjectForKey:v109];
            }
            [v106 addObject:v109];
            [v108 removeObjectAtIndex:0];

            v107 = v108;
          }
          [v204 setObject:v106 forKeyedSubscript:v104];

          uint64_t v7 = v205;
        }
      }
      uint64_t v101 = [v99 countByEnumeratingWithState:&v223 objects:v235 count:16];
    }
    while (v101);
  }

  v112 = [MEMORY[0x1E4F1CA48] array];
  v113 = v204;
  v114 = [v204 allKeys];

  v197 = [MEMORY[0x1E4F1CA48] array];
  long long v219 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  id v194 = v114;
  id obja = (id)[v194 countByEnumeratingWithState:&v219 objects:v234 count:16];
  if (obja)
  {
    uint64_t v195 = *(void *)v220;
    do
    {
      for (k = 0; k != obja; k = (char *)k + 1)
      {
        if (*(void *)v220 != v195) {
          objc_enumerationMutation(v194);
        }
        v116 = *(void **)(*((void *)&v219 + 1) + 8 * (void)k);
        uint64_t v117 = objc_msgSend(v7, "objectAtIndex:", (int)objc_msgSend(v116, "intValue"));
        v118 = objc_alloc_init(AXMMLElementGroup);
        [(AXMLElementCoagulation *)v206 _mergeFeatureIntoGroup:v118 feature:v117];
        v119 = (void *)v117;
        [v112 addObject:v117];
        v120 = [v113 objectForKey:v116];
        long long v215 = 0u;
        long long v216 = 0u;
        long long v217 = 0u;
        long long v218 = 0u;
        uint64_t v121 = [v120 countByEnumeratingWithState:&v215 objects:v233 count:16];
        if (v121)
        {
          uint64_t v122 = v121;
          uint64_t v123 = *(void *)v216;
          do
          {
            for (uint64_t m = 0; m != v122; ++m)
            {
              if (*(void *)v216 != v123) {
                objc_enumerationMutation(v120);
              }
              v125 = objc_msgSend(v7, "objectAtIndex:", (int)objc_msgSend(*(id *)(*((void *)&v215 + 1) + 8 * m), "intValue"));
              [(AXMLElementCoagulation *)v206 _mergeFeatureIntoGroup:v118 feature:v125];
              [v112 addObject:v125];
            }
            uint64_t v122 = [v120 countByEnumeratingWithState:&v215 objects:v233 count:16];
          }
          while (v122);
        }
        v126 = [(AXMMLElementGroup *)v118 subfeatures];
        v127 = [(AXMLElementCoagulation *)v206 _sortFeaturesReadingOrder:v126];
        v128 = (void *)[v127 mutableCopy];
        [(AXMMLElementGroup *)v118 setSubfeatures:v128];

        [(AXMMLElementGroup *)v118 frame];
        double v130 = v129;
        double v132 = v131;
        double v134 = v133;
        double v136 = v135;
        v137 = [(AXMMLElementGroup *)v118 feature];
        [v137 confidence];
        double v139 = v138;
        v140 = [(AXMMLElementGroup *)v118 textLabel];
        [(AXMLElementCoagulation *)v206 canvasSize];
        double v142 = v141;
        double v144 = v143;
        v145 = [(AXMMLElementGroup *)v118 childFeatures];
        v146 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 11, v140, v145, v130, v132, v134, v136, v139, v142, v144);

        uint64_t v7 = v205;
        [(AXMMLElementGroup *)v118 setFeature:v146];
        [(AXMMLElementGroup *)v118 setIncludeChildren:0];
        [v197 addObject:v118];

        v113 = v204;
      }
      id obja = (id)[v194 countByEnumeratingWithState:&v219 objects:v234 count:16];
    }
    while (obja);
  }

  [v7 removeObjectsInArray:v112];
  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  id v193 = v197;
  uint64_t v198 = [v193 countByEnumeratingWithState:&v211 objects:v232 count:16];
  if (v198)
  {
    uint64_t v196 = *(void *)v212;
    do
    {
      v147 = 0;
      do
      {
        if (*(void *)v212 != v196) {
          objc_enumerationMutation(v193);
        }
        objb = v147;
        v148 = *(void **)(*((void *)&v211 + 1) + 8 * (void)v147);
        long long v207 = 0u;
        long long v208 = 0u;
        long long v209 = 0u;
        long long v210 = 0u;
        id v149 = v205;
        uint64_t v150 = [v149 countByEnumeratingWithState:&v207 objects:v231 count:16];
        if (v150)
        {
          uint64_t v151 = v150;
          uint64_t v152 = *(void *)v208;
          do
          {
            for (uint64_t n = 0; n != v151; ++n)
            {
              if (*(void *)v208 != v152) {
                objc_enumerationMutation(v149);
              }
              v154 = *(void **)(*((void *)&v207 + 1) + 8 * n);
              [v148 frame];
              double v156 = v155;
              double v158 = v157;
              double v160 = v159;
              double v162 = v161;
              [v154 frame];
              if (AXMIsContainedBy(v156, v158, v160, v162, v163, v164, v165, v166, 0.7))
              {
                v167 = [v148 subfeatures];
                uint64_t v168 = [v167 indexOfObject:v154];

                if (v168 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  [(AXMLElementCoagulation *)v206 _mergeFeatureIntoGroup:v148 feature:v154];
                  [v112 addObject:v154];
                  v169 = [v148 subfeatures];
                  v170 = [(AXMLElementCoagulation *)v206 _sortFeaturesReadingOrder:v169];
                  v171 = (void *)[v170 mutableCopy];
                  [v148 setSubfeatures:v171];

                  [v148 frame];
                  double v173 = v172;
                  double v175 = v174;
                  double v177 = v176;
                  double v179 = v178;
                  v180 = [v148 feature];
                  [v180 confidence];
                  double v182 = v181;
                  v183 = [v148 textLabel];
                  [(AXMLElementCoagulation *)v206 canvasSize];
                  double v185 = v184;
                  double v187 = v186;
                  v188 = [v148 childFeatures];
                  v189 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 11, v183, v188, v173, v175, v177, v179, v182, v185, v187);

                  [v148 setFeature:v189];
                }
              }
            }
            uint64_t v151 = [v149 countByEnumeratingWithState:&v207 objects:v231 count:16];
          }
          while (v151);
        }

        v147 = objb + 1;
      }
      while (objb + 1 != (char *)v198);
      uint64_t v198 = [v193 countByEnumeratingWithState:&v211 objects:v232 count:16];
    }
    while (v198);
  }

  [v192 removeObjectsInArray:v112];
  [v192 addObjectsFromArray:v193];

  return v192;
}

BOOL __50__AXMLElementCoagulation__getGroupedTextFeatures___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 feature];
  if ([v3 uiClass] == 11)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [v2 feature];
    BOOL v4 = [v5 uiClass] == 17;
  }
  return v4;
}

- (id)_mergeTopLeftButton:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[v4 mutableCopy];
  [(AXMLElementCoagulation *)self canvasSize];
  double v7 = v6;
  [(AXMLElementCoagulation *)self canvasSize];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __46__AXMLElementCoagulation__mergeTopLeftButton___block_invoke;
  v71[3] = &unk_1E6117FC0;
  v60 = self;
  v71[4] = self;
  int32x2_t v9 = vdup_n_s32(v7 > v8);
  v10.i64[0] = v9.u32[0];
  v10.i64[1] = v9.u32[1];
  int8x16_t v72 = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v10, 0x3FuLL)), (int8x16_t)xmmword_1B58ACD80, (int8x16_t)xmmword_1B58ACD70);
  uint64_t v61 = v5;
  uint64_t v11 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v71);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (!v12) {
    goto LABEL_29;
  }
  uint64_t v13 = v12;
  double v14 = 0;
  uint64_t v15 = *(void *)v68;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v68 != v15) {
        objc_enumerationMutation(v11);
      }
      double v17 = *(void **)(*((void *)&v67 + 1) + 8 * i);
      double v18 = [v17 feature];
      if ([v18 uiClass] == 16)
      {
      }
      else
      {
        double v19 = [v17 feature];
        uint64_t v20 = [v19 uiClass];

        if (v20 != 5) {
          continue;
        }
      }
      id v21 = v17;

      double v14 = v21;
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v67 objects:v74 count:16];
  }
  while (v13);
  if (!v14)
  {
LABEL_29:
    id v57 = v4;
    double v56 = v61;
    goto LABEL_33;
  }
  unint64_t v59 = v4;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v22 = v11;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (!v23)
  {

    goto LABEL_31;
  }
  uint64_t v24 = v23;
  uint64_t v62 = 0;
  uint64_t v25 = *(void *)v64;
  while (2)
  {
    uint64_t v26 = 0;
    while (2)
    {
      if (*(void *)v64 != v25) {
        objc_enumerationMutation(v22);
      }
      double v27 = *(void **)(*((void *)&v63 + 1) + 8 * v26);
      double v28 = objc_msgSend(v27, "feature", v59);
      if ([v28 uiClass] == 11)
      {

        goto LABEL_21;
      }
      BOOL v29 = [v27 feature];
      uint64_t v30 = [v29 uiClass];

      if (v30 == 17)
      {
LABEL_21:
        [v27 frame];
        double MidY = CGRectGetMidY(v77);
        [v14 frame];
        if (MidY <= CGRectGetMaxY(v78))
        {
          [v27 frame];
          double v32 = CGRectGetMidY(v79);
          [v14 frame];
          if (v32 >= CGRectGetMinY(v80))
          {
            [v27 frame];
            double MinX = CGRectGetMinX(v81);
            [v14 frame];
            if (vabdd_f64(MinX, CGRectGetMaxX(v82)) < 40.0)
            {
              id v34 = v27;

              uint64_t v62 = v34;
            }
          }
        }
      }
      if (v24 != ++v26) {
        continue;
      }
      break;
    }
    uint64_t v24 = [v22 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v24) {
      continue;
    }
    break;
  }

  if (v62)
  {
    [(AXMLElementCoagulation *)v60 _mergeFeatureIntoGroup:v14 feature:v62];
    [v14 frame];
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v43 = [v14 feature];
    [v43 confidence];
    double v45 = v44;
    double v46 = [v14 textLabel];
    [(AXMLElementCoagulation *)v60 canvasSize];
    double v48 = v47;
    double v50 = v49;
    long long v51 = [v14 childFeatures];
    long long v52 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 16, v46, v51, v36, v38, v40, v42, v45, v48, v50);

    [v14 setFeature:v52];
    [v14 setIncludeChildren:0];
    [v14 frame];
    double MidX = CGRectGetMidX(v83);
    [v14 frame];
    double v54 = CGRectGetMidY(v84);
    double v55 = [v14 feature];
    objc_msgSend(v55, "setActivationPoint:", MidX, v54);

    double v56 = v61;
    [v61 removeObject:v62];
    id v57 = v61;

    id v4 = v59;
    goto LABEL_32;
  }
LABEL_31:
  id v4 = v59;
  id v57 = v59;
  double v56 = v61;
LABEL_32:

LABEL_33:

  return v57;
}

uint64_t __46__AXMLElementCoagulation__mergeTopLeftButton___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 feature];
  if ([v4 uiClass] == 5)
  {
    BOOL v5 = 1;
  }
  else
  {
    double v6 = [v3 feature];
    if ([v6 uiClass] == 16)
    {
      BOOL v5 = 1;
    }
    else
    {
      double v7 = [v3 feature];
      if ([v7 uiClass] == 11)
      {
        BOOL v5 = 1;
      }
      else
      {
        double v8 = [v3 feature];
        BOOL v5 = [v8 uiClass] == 17;
      }
    }
  }
  [v3 frame];
  double MaxY = CGRectGetMaxY(v16);
  [*(id *)(a1 + 32) canvasSize];
  if (MaxY >= v10 / *(double *)(a1 + 40))
  {
    BOOL v13 = 0;
  }
  else
  {
    [v3 frame];
    double MinX = CGRectGetMinX(v17);
    [*(id *)(a1 + 32) canvasSize];
    BOOL v13 = MinX < v12 / *(double *)(a1 + 48);
  }
  uint64_t v14 = v5 & v13;

  return v14;
}

- (id)_removeExtraOCRAndIconFromTextField:(id)a3
{
  id v70 = a3;
  id v71 = self;
  id v4 = -[AXMLElementCoagulation _compareArea:](self, "_compareArea:");
  BOOL v5 = (void *)[v4 mutableCopy];

  uint64_t v75 = [MEMORY[0x1E4F1CA48] array];
  if ([v5 count])
  {
    unint64_t v6 = 0;
    while (1)
    {
      double v7 = [v5 objectAtIndex:v6];
      if ([v5 count]) {
        break;
      }
LABEL_38:

      if (++v6 >= [v5 count]) {
        goto LABEL_39;
      }
    }
    unint64_t v8 = 0;
    while (1)
    {
      int32x2_t v9 = [v5 objectAtIndex:v8];
      double v10 = v9;
      if (v8 <= v6) {
        goto LABEL_37;
      }
      [v9 frame];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      [v7 frame];
      if (!AXMIsContainedBy(v12, v14, v16, v18, v19, v20, v21, v22, 0.7)) {
        goto LABEL_37;
      }
      [v7 frame];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      [v10 frame];
      AXMIntersectionOverUnion(v24, v26, v28, v30, v31, v32, v33, v34);
      if (v35 <= 0.7) {
        goto LABEL_12;
      }
      double v36 = [v7 feature];
      if ([v36 uiClass] != 5) {
        break;
      }
      double v37 = [v7 feature];
      double v38 = [v37 value];
      uint64_t v39 = axMLElementsUnknownIconType;

      if (v38 == (void *)v39)
      {
        int v40 = 1;
      }
      else
      {
        [v75 addObject:v10];
        int v40 = 0;
      }
LABEL_14:
      double v41 = [v7 feature];
      uint64_t v42 = [v41 uiClass];
      if (v42 != 5)
      {
        double v74 = [v7 feature];
        if ([v74 uiClass] != 16)
        {
          long long v68 = v74;
          goto LABEL_34;
        }
      }
      double v43 = [v10 feature];
      if ([v43 uiClass] != 11)
      {
        double v44 = [v10 feature];
        if ([v44 uiClass] != 17) {
          int v40 = 0;
        }
      }
      if (v42 == 5)
      {

        if (!v40) {
          goto LABEL_36;
        }
      }
      else
      {

        if ((v40 & 1) == 0) {
          goto LABEL_36;
        }
      }
      double v45 = [v10 feature];
      double v41 = [v45 value];

      uint64_t v46 = [v41 rangeOfString:@"Q " options:1];
      uint64_t v47 = [v41 rangeOfString:@"O " options:1];
      if (v46) {
        BOOL v48 = v47 == 0;
      }
      else {
        BOOL v48 = 1;
      }
      char v49 = !v48;
      if ((unint64_t)[v41 length] >= 3 && (v49 & 1) == 0)
      {
        uint64_t v72 = [v41 substringFromIndex:2];

        [v10 frame];
        double v51 = v50;
        double v53 = v52;
        double v55 = v54;
        double v57 = v56;
        uint64_t v73 = [v10 feature];
        uint64_t v58 = [v73 uiClass];
        unint64_t v59 = [v10 feature];
        [v59 confidence];
        double v61 = v60;
        [(AXMLElementCoagulation *)v71 canvasSize];
        double v63 = v62;
        double v65 = v64;
        long long v66 = [v10 feature];
        long long v67 = [v66 subfeatures];
        double v41 = (void *)v72;
        long long v68 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v58, v72, v67, v51, v53, v55, v57, v61, v63, v65);

        [v10 setFeature:v68];
LABEL_34:
      }
LABEL_36:
      [v75 addObject:v7];
LABEL_37:

      if (++v8 >= [v5 count]) {
        goto LABEL_38;
      }
    }

LABEL_12:
    int v40 = 1;
    goto LABEL_14;
  }
LABEL_39:
  [v5 removeObjectsInArray:v75];

  return v5;
}

- (id)_getGroupedTextFields:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  double v90 = (void *)[v93 mutableCopy];
  id v4 = objc_msgSend(v90, "ax_filteredArrayUsingBlock:", &__block_literal_global_177);
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  obuint64_t j = v4;
  uint64_t v94 = [obj countByEnumeratingWithState:&v110 objects:v116 count:16];
  if (v94)
  {
    uint64_t v92 = *(void *)v111;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v111 != v92) {
          objc_enumerationMutation(obj);
        }
        uint64_t v95 = v6;
        double v7 = *(void **)(*((void *)&v110 + 1) + 8 * v6);
        uint64_t v100 = [MEMORY[0x1E4F1CA48] array];
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        id v101 = v93;
        uint64_t v8 = [v101 countByEnumeratingWithState:&v106 objects:v115 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v107;
          uint64_t v96 = *(void *)v107;
          double v97 = v7;
          do
          {
            uint64_t v11 = 0;
            uint64_t v98 = v9;
            do
            {
              if (*(void *)v107 != v10) {
                objc_enumerationMutation(v101);
              }
              double v12 = *(void **)(*((void *)&v106 + 1) + 8 * v11);
              [v7 frame];
              double v14 = v13;
              double v16 = v15;
              double v18 = v17;
              double v20 = v19;
              [v12 frame];
              if (AXMIsContainedBy(v14, v16, v18, v20, v21, v22, v23, v24, 0.8))
              {
                double v25 = [v12 feature];
                if ([v25 uiClass] == 11) {
                  goto LABEL_17;
                }
                CGFloat v26 = [v12 feature];
                if ([v26 uiClass] == 17) {
                  goto LABEL_16;
                }
                double v27 = [v12 feature];
                if ([v27 uiClass] == 5)
                {

                  uint64_t v9 = v98;
LABEL_16:

LABEL_17:
                }
                else
                {
                  double v55 = [v12 feature];
                  uint64_t v56 = [v55 uiClass];

                  uint64_t v10 = v96;
                  BOOL v57 = v56 == 16;
                  double v7 = v97;
                  uint64_t v9 = v98;
                  if (!v57) {
                    goto LABEL_23;
                  }
                }
                [v12 frame];
                double MinX = CGRectGetMinX(v119);
                [v7 frame];
                double v29 = CGRectGetMinX(v120);
                [v7 frame];
                if (MinX >= v29 + CGRectGetMaxX(v121) * 0.5)
                {
                  CGFloat v30 = [v12 feature];
                  uint64_t v31 = [v30 uiClass];
                  uint64_t v32 = 16;
                  if (v31 != 5) {
                    uint64_t v32 = 17;
                  }
                  uint64_t v99 = v32;

                  [v12 frame];
                  double v34 = v33;
                  double v36 = v35;
                  double v38 = v37;
                  double v40 = v39;
                  double v41 = [v12 feature];
                  [v41 confidence];
                  double v43 = v42;
                  double v44 = [v12 feature];
                  double v45 = [v44 value];
                  [(AXMLElementCoagulation *)self canvasSize];
                  double v47 = v46;
                  double v49 = v48;
                  [v12 feature];
                  double v50 = v5;
                  v52 = double v51 = self;
                  double v53 = [v52 subfeatures];
                  double v54 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v99, v45, v53, v34, v36, v38, v40, v43, v47, v49);

                  self = v51;
                  BOOL v5 = v50;
                  uint64_t v10 = v96;

                  double v7 = v97;
                  uint64_t v9 = v98;

                  [v12 setFeature:v54];
                }
                [v100 addObject:v12];
                [v5 addObject:v12];
              }
LABEL_23:
              ++v11;
            }
            while (v9 != v11);
            uint64_t v58 = [v101 countByEnumeratingWithState:&v106 objects:v115 count:16];
            uint64_t v9 = v58;
          }
          while (v58);
        }

        unint64_t v59 = [(AXMLElementCoagulation *)self _removeExtraOCRAndIconFromTextField:v100];
        double v60 = (void *)[v59 mutableCopy];

        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v61 = v60;
        uint64_t v62 = [v61 countByEnumeratingWithState:&v102 objects:v114 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v103;
          do
          {
            for (uint64_t i = 0; i != v63; ++i)
            {
              if (*(void *)v103 != v64) {
                objc_enumerationMutation(v61);
              }
              [(AXMLElementCoagulation *)self _mergeFeatureIntoGroup:v7 feature:*(void *)(*((void *)&v102 + 1) + 8 * i)];
            }
            uint64_t v63 = [v61 countByEnumeratingWithState:&v102 objects:v114 count:16];
          }
          while (v63);
        }

        long long v66 = [v7 subfeatures];
        uint64_t v67 = [v66 count];

        if (v67)
        {
          long long v68 = [v7 subfeatures];
          long long v69 = [(AXMLElementCoagulation *)self _compareForX:v68];
          id v70 = (void *)[v69 mutableCopy];
          [v7 setSubfeatures:v70];

          [v7 frame];
          double v72 = v71;
          double v74 = v73;
          double v76 = v75;
          double v78 = v77;
          CGRect v79 = [v7 feature];
          [v79 confidence];
          double v81 = v80;
          CGRect v82 = [v7 textLabel];
          [(AXMLElementCoagulation *)self canvasSize];
          double v84 = v83;
          double v86 = v85;
          double v87 = [v7 childFeatures];
          double v88 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 12, v82, v87, v72, v74, v76, v78, v81, v84, v86);

          [v7 setFeature:v88];
          [v7 setIncludeChildren:0];
        }
        uint64_t v6 = v95 + 1;
      }
      while (v95 + 1 != v94);
      uint64_t v94 = [obj countByEnumeratingWithState:&v110 objects:v116 count:16];
    }
    while (v94);
  }

  [v90 removeObjectsInArray:v5];

  return v90;
}

BOOL __48__AXMLElementCoagulation__getGroupedTextFields___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 feature];
  BOOL v3 = [v2 uiClass] == 12;

  return v3;
}

- (id)_getGroupedSegmentedControlFeatures:(id)a3
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_179);
  double v7 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_181);
  if ([v6 count])
  {
    id v112 = v4;
    uint64_t v8 = [(AXMLElementCoagulation *)self _compareForY:v6];

    v114 = [(AXMLElementCoagulation *)self _compareForY:v7];

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v139 objects:v147 count:16];
    long long v111 = v5;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v140;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v140 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v139 + 1) + 8 * i);
          if ([v10 count])
          {
            double v17 = [v10 lastObject];
            [v16 frame];
            double v19 = v18;
            double v21 = v20;
            double v23 = v22;
            double v25 = v24;
            [v17 frame];
            -[AXMLElementCoagulation _getYOverlap:obj2:](self, "_getYOverlap:obj2:", v19, v21, v23, v25, v26, v27, v28, v29);
            if (v30 <= 0.0)
            {
              [v9 addObject:v10];
              uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
              uint64_t v32 = v10;
              uint64_t v10 = (void *)v31;
            }
            [v10 addObject:v16];
          }
          else
          {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v139 objects:v147 count:16];
      }
      while (v13);
    }
    id v110 = v11;

    long long v109 = v10;
    [v9 addObject:v10];
    double v33 = [MEMORY[0x1E4F1CA48] array];
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v34 = v9;
    uint64_t v115 = [v34 countByEnumeratingWithState:&v135 objects:v146 count:16];
    v116 = v34;
    if (v115)
    {
      uint64_t v113 = *(void *)v136;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v136 != v113) {
            objc_enumerationMutation(v34);
          }
          uint64_t v117 = v35;
          double v36 = *(void **)(*((void *)&v135 + 1) + 8 * v35);
          long long v131 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          obuint64_t j = v114;
          uint64_t v37 = [obj countByEnumeratingWithState:&v131 objects:v145 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v132;
            uint64_t v118 = *(void *)v132;
            CGRect v119 = v36;
            do
            {
              uint64_t v40 = 0;
              uint64_t v120 = v38;
              do
              {
                if (*(void *)v132 != v39) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v122 = v40;
                double v41 = *(void **)(*((void *)&v131 + 1) + 8 * v40);
                [v41 frame];
                double v43 = v42;
                double v45 = v44;
                double v47 = v46;
                double v49 = v48;
                double v50 = [v36 objectAtIndexedSubscript:0];
                [v50 frame];
                -[AXMLElementCoagulation _getYOverlap:obj2:](self, "_getYOverlap:obj2:", v43, v45, v47, v49, v51, v52, v53, v54);
                double v56 = v55;

                [v41 frame];
                if (v56 >= CGRectGetHeight(v150))
                {
                  long long v129 = 0u;
                  long long v130 = 0u;
                  long long v127 = 0u;
                  long long v128 = 0u;
                  id v57 = v36;
                  uint64_t v58 = [v57 countByEnumeratingWithState:&v127 objects:v144 count:16];
                  if (!v58)
                  {

LABEL_37:
                    [v57 addObject:v41];
                    goto LABEL_38;
                  }
                  uint64_t v59 = v58;
                  char v60 = 0;
                  uint64_t v61 = *(void *)v128;
                  do
                  {
                    for (uint64_t j = 0; j != v59; ++j)
                    {
                      if (*(void *)v128 != v61) {
                        objc_enumerationMutation(v57);
                      }
                      uint64_t v63 = *(void **)(*((void *)&v127 + 1) + 8 * j);
                      [v63 frame];
                      double v65 = v64;
                      double v67 = v66;
                      double v69 = v68;
                      double v71 = v70;
                      [v41 frame];
                      if (AXMIsContainedBy(v65, v67, v69, v71, v72, v73, v74, v75, 1.0))
                      {
                        [v63 setIncludeChildren:0];
                        [(AXMLElementCoagulation *)self _mergeFeatureIntoGroup:v63 feature:v41];
                        [v33 addObject:v41];
                        char v60 = 1;
                      }
                    }
                    uint64_t v59 = [v57 countByEnumeratingWithState:&v127 objects:v144 count:16];
                  }
                  while (v59);

                  uint64_t v39 = v118;
                  double v36 = v119;
                  uint64_t v38 = v120;
                  if ((v60 & 1) == 0) {
                    goto LABEL_37;
                  }
                }
LABEL_38:
                uint64_t v40 = v122 + 1;
              }
              while (v122 + 1 != v38);
              uint64_t v38 = [obj countByEnumeratingWithState:&v131 objects:v145 count:16];
            }
            while (v38);
          }

          id v34 = v116;
          uint64_t v35 = v117 + 1;
        }
        while (v117 + 1 != v115);
        uint64_t v115 = [v116 countByEnumeratingWithState:&v135 objects:v146 count:16];
      }
      while (v115);
    }

    if ([v34 count])
    {
      unint64_t v76 = 0;
      do
      {
        double v77 = [v34 objectAtIndex:v76];
        double v78 = [(AXMLElementCoagulation *)self _compareForX:v77];

        [(AXMLElementCoagulation *)self canvasSize];
        double v80 = v79 + 1.0;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        id v81 = v78;
        uint64_t v82 = [v81 countByEnumeratingWithState:&v123 objects:v143 count:16];
        if (v82)
        {
          uint64_t v83 = v82;
          uint64_t v84 = *(void *)v124;
          double v85 = 0.0;
          do
          {
            for (uint64_t k = 0; k != v83; ++k)
            {
              if (*(void *)v124 != v84) {
                objc_enumerationMutation(v81);
              }
              double v87 = *(void **)(*((void *)&v123 + 1) + 8 * k);
              [v87 frame];
              double v80 = fmin(v80, CGRectGetMinY(v151));
              [v87 frame];
              double v85 = fmax(v85, CGRectGetMaxY(v152));
            }
            uint64_t v83 = [v81 countByEnumeratingWithState:&v123 objects:v143 count:16];
          }
          while (v83);
        }
        else
        {
          double v85 = 0.0;
        }

        if ([v81 count])
        {
          unint64_t v88 = 0;
          double v89 = v85 - v80;
          do
          {
            double v90 = [v81 objectAtIndex:v88];
            [v90 frame];
            double MinX = CGRectGetMinX(v153);
            [v90 frame];
            double Width = CGRectGetWidth(v154);
            id v93 = [v90 textLabel];
            uint64_t v94 = [v90 feature];
            uint64_t v95 = [v94 uiClass];

            if (v95 == 11)
            {
              uint64_t v96 = [v90 feature];
              uint64_t v97 = [v96 value];

              id v93 = (void *)v97;
            }
            uint64_t v98 = [v90 feature];
            [v98 confidence];
            double v100 = v99;
            [(AXMLElementCoagulation *)self canvasSize];
            double v102 = v101;
            double v104 = v103;
            long long v105 = [v90 childFeatures];
            long long v106 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 8, v93, v105, MinX, v80, Width, v89, v100, v102, v104);

            [v90 setFeature:v106];
            [v90 setIncludeChildren:0];

            ++v88;
          }
          while (v88 < [v81 count]);
        }

        ++v76;
        id v34 = v116;
      }
      while (v76 < [v116 count]);
    }
    BOOL v5 = v111;
    [v111 removeObjectsInArray:v33];
    id v107 = v111;

    uint64_t v6 = v110;
    double v7 = v114;
    id v4 = v112;
  }
  else
  {
    id v107 = v4;
  }

  return v107;
}

BOOL __62__AXMLElementCoagulation__getGroupedSegmentedControlFeatures___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 feature];
  BOOL v3 = [v2 uiClass] == 8;

  return v3;
}

BOOL __62__AXMLElementCoagulation__getGroupedSegmentedControlFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 feature];
  if ([v3 uiClass] == 11)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [v2 feature];
    BOOL v4 = [v5 uiClass] == 17;
  }
  return v4;
}

- (id)_createToggleGroup:(id)a3 toGroup:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 frame];
  double MidX = CGRectGetMidX(v43);
  [v6 frame];
  double MidY = CGRectGetMidY(v44);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        [(AXMLElementCoagulation *)self _mergeFeatureIntoGroup:v6 feature:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }

  [v6 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = [v6 feature];
  uint64_t v23 = [v22 uiClass];
  double v24 = [v6 feature];
  [v24 confidence];
  double v26 = v25;
  double v27 = [v6 textLabel];
  [(AXMLElementCoagulation *)self canvasSize];
  double v29 = v28;
  double v31 = v30;
  uint64_t v32 = [v6 childFeatures];
  double v33 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v23, v27, v32, v15, v17, v19, v21, v26, v29, v31);

  objc_msgSend(v33, "setActivationPoint:", MidX, MidY);
  [v6 setFeature:v33];
  [v6 setIncludeChildren:0];

  return v6;
}

- (id)_removeTextContainingOnlyToggles:(id)a3 toggleCheckboxTypes:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  id v7 = objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &__block_literal_global_183);
  id v34 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v7;
  uint64_t v38 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v38)
  {
    long long v36 = v6;
    uint64_t v37 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v10 = v6;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v39 = i;
          char v13 = 0;
          uint64_t v14 = *(void *)v41;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v41 != v14) {
                objc_enumerationMutation(v10);
              }
              double v16 = *(void **)(*((void *)&v40 + 1) + 8 * j);
              if (v16 != v9)
              {
                [v9 frame];
                double v18 = v17;
                double v20 = v19;
                double v22 = v21;
                double v24 = v23;
                [v16 frame];
                if (AXMIsContainedBy(v18, v20, v22, v24, v25, v26, v27, v28, 1.0))
                {
                  double v29 = NSNumber;
                  double v30 = [v16 feature];
                  double v31 = objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v30, "uiClass"));
                  uint64_t v32 = [v5 indexOfObject:v31];

                  if (v32 == 0x7FFFFFFFFFFFFFFFLL)
                  {

                    id v6 = v36;
                    uint64_t i = v39;
                    goto LABEL_21;
                  }
                  char v13 = 1;
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v12) {
              continue;
            }
            break;
          }

          id v6 = v36;
          uint64_t i = v39;
          if (v13) {
            [v34 addObject:v9];
          }
        }
        else
        {
        }
LABEL_21:
        ;
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v38);
  }

  [v6 removeObjectsInArray:v34];

  return v6;
}

BOOL __79__AXMLElementCoagulation__removeTextContainingOnlyToggles_toggleCheckboxTypes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 feature];
  BOOL v3 = [v2 uiClass] == 11;

  return v3;
}

- (id)_getGroupedToggleCheckboxWithText:(id)a3
{
  uint64_t v213 = *MEMORY[0x1E4F143B8];
  BOOL v4 = &unk_1F0E942A8;
  id v157 = a3;
  id v5 = -[AXMLElementCoagulation _removeTextContainingOnlyToggles:toggleCheckboxTypes:](self, "_removeTextContainingOnlyToggles:toggleCheckboxTypes:");
  v205[0] = MEMORY[0x1E4F143A8];
  v205[1] = 3221225472;
  v205[2] = __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke;
  v205[3] = &unk_1E6117FE8;
  id v206 = &unk_1F0E942A8;
  id v6 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v205);
  id v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = v7;
  double v158 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_196);
  id v9 = [MEMORY[0x1E4F1CA48] array];
  double v163 = [MEMORY[0x1E4F1CA48] array];
  double v159 = v5;
  double v166 = v7;
  double v161 = v9;
  if ([v7 count])
  {
    unint64_t v10 = 0;
    unint64_t v11 = 0x1E4F28000uLL;
    v167 = self;
    do
    {
      uint64_t v12 = [v8 objectAtIndex:v10];
      if (([v9 containsObject:v12] & 1) == 0)
      {
        unint64_t v160 = v10;
        v169 = v12;
        [v9 addObject:v12];
        long long v203 = 0u;
        long long v204 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        id v13 = v158;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v201 objects:v212 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          double v16 = 0;
          uint64_t v17 = *(void *)v202;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v202 != v17) {
                objc_enumerationMutation(v13);
              }
              double v19 = *(void **)(*((void *)&v201 + 1) + 8 * i);
              [v19 frame];
              double v21 = v20;
              double v23 = v22;
              double v25 = v24;
              double v27 = v26;
              [v169 frame];
              if (AXMIsContainedBy(v21, v23, v25, v27, v28, v29, v30, v31, 1.0))
              {
                id v32 = v19;

                double v16 = v32;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v201 objects:v212 count:16];
          }
          while (v15);
        }
        else
        {
          double v16 = 0;
        }

        double v33 = [MEMORY[0x1E4F1CA48] array];
        long long v197 = 0u;
        long long v198 = 0u;
        long long v199 = 0u;
        long long v200 = 0u;
        obuint64_t j = v5;
        uint64_t v34 = [obj countByEnumeratingWithState:&v197 objects:v211 count:16];
        uint64_t v35 = v169;
        double v165 = v16;
        if (v34)
        {
          uint64_t v36 = v34;
          uint64_t v37 = *(void *)v198;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v198 != v37) {
                objc_enumerationMutation(obj);
              }
              uint64_t v39 = *(void **)(*((void *)&v197 + 1) + 8 * j);
              if (([v39 isEqual:v35] & 1) == 0 && (objc_msgSend(v9, "containsObject:", v39) & 1) == 0)
              {
                if (v16)
                {
                  [v16 frame];
                  double v41 = v40;
                  double v43 = v42;
                  double v45 = v44;
                  double v47 = v46;
                  [v39 frame];
                  if (AXMIsContainedBy(v41, v43, v45, v47, v48, v49, v50, v51, 0.8)) {
                    goto LABEL_30;
                  }
                }
                else
                {
                  double v52 = [v39 feature];
                  if ([v52 uiClass] != 3)
                  {

                    uint64_t v35 = v169;
LABEL_29:
                    [v39 frame];
                    double v68 = v67;
                    double v70 = v69;
                    double v72 = v71;
                    double v74 = v73;
                    [v35 frame];
                    if (!-[AXMLElementCoagulation _hasYOverlap:obj2:](v167, "_hasYOverlap:obj2:", v68, v70, v72, v74, v75, v76, v77, v78))continue; {
LABEL_30:
                    }
                    [v33 addObject:v39];
                    continue;
                  }
                  [v39 frame];
                  CGFloat v54 = v53;
                  CGFloat v56 = v55;
                  CGFloat v58 = v57;
                  CGFloat v60 = v59;
                  [v169 frame];
                  AXMIntersectionOverUnion(v54, v56, v58, v60, v61, v62, v63, v64);
                  double v66 = v65;

                  uint64_t v35 = v169;
                  double v16 = v165;
                  if (v66 <= 0.0) {
                    goto LABEL_29;
                  }
                }
              }
            }
            uint64_t v36 = [obj countByEnumeratingWithState:&v197 objects:v211 count:16];
          }
          while (v36);
        }

        v195[0] = MEMORY[0x1E4F143A8];
        v195[1] = 3221225472;
        v195[2] = __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke_3;
        v195[3] = &unk_1E6117FE8;
        id v79 = v35;
        id v196 = v79;
        double v80 = objc_msgSend(v33, "ax_filteredArrayUsingBlock:", v195);
        id v81 = (void *)[v80 mutableCopy];

        v193[0] = MEMORY[0x1E4F143A8];
        v193[1] = 3221225472;
        v193[2] = __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke_4;
        v193[3] = &unk_1E6117FE8;
        id v194 = v4;
        uint64_t v82 = objc_msgSend(v81, "ax_filteredArrayUsingBlock:", v193);
        uint64_t v83 = (void *)[v82 mutableCopy];

        if ([v83 count])
        {
          [v83 addObject:v79];
          if ([v83 count])
          {
            uint64_t v84 = 0;
            double v162 = v81;
            double v172 = v83;
            do
            {
              uint64_t v164 = v84;
              double v173 = [v83 objectAtIndex:v84];
              objc_msgSend(v9, "addObject:");
              v170 = [MEMORY[0x1E4F1CA48] array];
              long long v189 = 0u;
              long long v190 = 0u;
              long long v191 = 0u;
              long long v192 = 0u;
              id v175 = v81;
              uint64_t v85 = [v175 countByEnumeratingWithState:&v189 objects:v210 count:16];
              if (v85)
              {
                uint64_t v86 = v85;
                uint64_t v87 = *(void *)v190;
                uint64_t v171 = *(void *)v190;
                do
                {
                  uint64_t v88 = 0;
                  uint64_t v174 = v86;
                  do
                  {
                    if (*(void *)v190 != v87) {
                      objc_enumerationMutation(v175);
                    }
                    double v89 = *(void **)(*((void *)&v189 + 1) + 8 * v88);
                    double v90 = *(void **)(v11 + 3792);
                    double v91 = [v89 feature];
                    uint64_t v92 = objc_msgSend(v90, "numberWithInteger:", objc_msgSend(v91, "uiClass"));
                    uint64_t v93 = [v4 indexOfObject:v92];

                    if (v93 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      uint64_t v94 = v4;
                      id v95 = v173;
                      long long v185 = 0u;
                      long long v186 = 0u;
                      long long v187 = 0u;
                      long long v188 = 0u;
                      id v96 = v172;
                      uint64_t v97 = [v96 countByEnumeratingWithState:&v185 objects:v209 count:16];
                      uint64_t v98 = v95;
                      if (v97)
                      {
                        uint64_t v99 = v97;
                        uint64_t v100 = *(void *)v186;
                        uint64_t v98 = v95;
                        do
                        {
                          for (uint64_t k = 0; k != v99; ++k)
                          {
                            if (*(void *)v186 != v100) {
                              objc_enumerationMutation(v96);
                            }
                            double v102 = *(void **)(*((void *)&v185 + 1) + 8 * k);
                            [v89 frame];
                            CGFloat v104 = v103;
                            CGFloat v106 = v105;
                            CGFloat v108 = v107;
                            CGFloat v110 = v109;
                            [v102 frame];
                            double v115 = AXMDistanceBetweenCenters(v104, v106, v108, v110, v111, v112, v113, v114);
                            [v89 frame];
                            CGFloat v117 = v116;
                            CGFloat v119 = v118;
                            CGFloat v121 = v120;
                            CGFloat v123 = v122;
                            [v98 frame];
                            if (v115 < AXMDistanceBetweenCenters(v117, v119, v121, v123, v124, v125, v126, v127))
                            {
                              id v128 = v102;

                              uint64_t v98 = v128;
                            }
                          }
                          uint64_t v99 = [v96 countByEnumeratingWithState:&v185 objects:v209 count:16];
                        }
                        while (v99);
                      }

                      if ([v98 isEqual:v95]) {
                        [v170 addObject:v89];
                      }

                      BOOL v4 = v94;
                      unint64_t v11 = 0x1E4F28000;
                      uint64_t v87 = v171;
                      uint64_t v86 = v174;
                    }
                    ++v88;
                  }
                  while (v88 != v86);
                  uint64_t v86 = [v175 countByEnumeratingWithState:&v189 objects:v210 count:16];
                }
                while (v86);
              }

              id v129 = [(AXMLElementCoagulation *)v167 _createToggleGroup:v173 toGroup:v170];
              [obj removeObjectsInArray:v170];

              uint64_t v84 = v164 + 1;
              uint64_t v83 = v172;
              id v9 = v161;
              id v81 = v162;
            }
            while (v164 + 1 < (unint64_t)[v172 count]);
          }
        }
        else
        {
          id v130 = [(AXMLElementCoagulation *)v167 _createToggleGroup:v79 toGroup:v81];
          [obj removeObjectsInArray:v81];
        }

        id v5 = v159;
        unint64_t v10 = v160;
        uint64_t v8 = v166;
        uint64_t v12 = v169;
      }

      ++v10;
    }
    while (v10 < [v8 count]);
  }
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id v176 = v158;
  uint64_t v131 = [v176 countByEnumeratingWithState:&v181 objects:v208 count:16];
  if (v131)
  {
    uint64_t v132 = v131;
    uint64_t v133 = *(void *)v182;
    do
    {
      for (uint64_t m = 0; m != v132; ++m)
      {
        if (*(void *)v182 != v133) {
          objc_enumerationMutation(v176);
        }
        long long v135 = *(void **)(*((void *)&v181 + 1) + 8 * m);
        long long v177 = 0u;
        long long v178 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        id v136 = v8;
        uint64_t v137 = [v136 countByEnumeratingWithState:&v177 objects:v207 count:16];
        if (v137)
        {
          uint64_t v138 = v137;
          unint64_t v139 = 0;
          uint64_t v140 = *(void *)v178;
          do
          {
            for (uint64_t n = 0; n != v138; ++n)
            {
              if (*(void *)v178 != v140) {
                objc_enumerationMutation(v136);
              }
              long long v142 = *(void **)(*((void *)&v177 + 1) + 8 * n);
              [v135 frame];
              CGFloat v144 = v143;
              CGFloat v146 = v145;
              CGFloat v148 = v147;
              CGFloat v150 = v149;
              [v142 frame];
              AXMIntersectionOverUnion(v144, v146, v148, v150, v151, v152, v153, v154);
              if (v155 > 0.0) {
                ++v139;
              }
            }
            uint64_t v138 = [v136 countByEnumeratingWithState:&v177 objects:v207 count:16];
          }
          while (v138);

          uint64_t v8 = v166;
          if (v139 >= 2) {
            [v163 addObject:v135];
          }
        }
        else
        {
        }
      }
      uint64_t v132 = [v176 countByEnumeratingWithState:&v181 objects:v208 count:16];
    }
    while (v132);
  }

  [v159 removeObjectsInArray:v163];

  return v159;
}

BOOL __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = NSNumber;
  BOOL v4 = [a2 feature];
  id v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "uiClass"));
  BOOL v6 = [v2 indexOfObject:v5] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

BOOL __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 feature];
  BOOL v3 = [v2 uiClass] == 3;

  return v3;
}

BOOL __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 frame];
  double Height = CGRectGetHeight(v6);
  [*(id *)(a1 + 32) frame];
  double v4 = CGRectGetHeight(v7);
  [*(id *)(a1 + 32) frame];
  return Height < fmax(v4, CGRectGetWidth(v8)) * 4.0;
}

BOOL __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = NSNumber;
  double v4 = [a2 feature];
  id v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "uiClass"));
  BOOL v6 = [v2 indexOfObject:v5] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (id)_groupFeaturesByContainment:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  double v53 = [(AXMLElementCoagulation *)self _compareArea:v5];

  id v52 = v4;
  uint64_t v54 = [v4 count];
  if (!v54) {
    goto LABEL_27;
  }
  for (unint64_t i = 0; i != v54; ++i)
  {
    BOOL v6 = [v53 objectAtIndex:i];
    unint64_t v7 = 0;
    while (v7 <= i)
    {
LABEL_19:
      if (++v7 == v54) {
        goto LABEL_26;
      }
    }
    CGRect v8 = [v53 objectAtIndex:v7];
    id v9 = [v8 feature];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v18 = [v6 feature];
    [v18 frame];
    BOOL v23 = AXMIsContainedBy(v11, v13, v15, v17, v19, v20, v21, v22, 0.7);

    if (!v23) {
      goto LABEL_18;
    }
    double v24 = [v6 feature];
    [v24 frame];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    double v33 = [v8 feature];
    [v33 frame];
    AXMIntersectionOverUnion(v26, v28, v30, v32, v34, v35, v36, v37);
    if (v38 <= 0.7) {
      goto LABEL_22;
    }
    uint64_t v39 = [v6 feature];
    if ([v39 uiClass] == 7)
    {
      double v40 = [v8 feature];
      double v41 = v8;
      uint64_t v42 = [v40 uiClass];

      BOOL v43 = v42 == 3;
      CGRect v8 = v41;
      if (!v43) {
        goto LABEL_23;
      }
      [v41 setTopLevel:0];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      double v44 = [v41 subfeatures];
      uint64_t v45 = [v44 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v46; ++j)
          {
            if (*(void *)v57 != v47) {
              objc_enumerationMutation(v44);
            }
            [(AXMLElementCoagulation *)self _mergeFeatureIntoGroup:v6 feature:*(void *)(*((void *)&v56 + 1) + 8 * j)];
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v56 objects:v60 count:16];
        }
        while (v46);
      }

      CGRect v8 = v41;
LABEL_18:

      goto LABEL_19;
    }

LABEL_22:
LABEL_23:
    [v6 setTopLevel:0];
    double v49 = [v8 feature];
    uint64_t v50 = [v49 uiClass];

    if (v50 != 11) {
      [(AXMLElementCoagulation *)self _mergeFeatureIntoGroup:v8 feature:v6];
    }

LABEL_26:
  }
LABEL_27:

  return v52;
}

- (id)_getClosestDetectionBelow:(id)a3 target:(id)a4 maxDistance:(int64_t)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v8 frame];
  double MaxY = CGRectGetMaxY(v47);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    double v13 = 0;
    uint64_t v14 = (uint64_t)MaxY;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v10);
        }
        double v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        [v17 frame];
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        [v8 frame];
        -[AXMLElementCoagulation _getXOverlap:obj2:](self, "_getXOverlap:obj2:", v19, v21, v23, v25, v26, v27, v28, v29);
        double v31 = (double)(unint64_t)v30;
        [v17 frame];
        double Width = CGRectGetWidth(v48);
        [v8 frame];
        if (fmin(Width, CGRectGetWidth(v49)) * 0.5 < v31)
        {
          [v17 frame];
          uint64_t v33 = (uint64_t)CGRectGetMaxY(v50);
          [v17 frame];
          double MinY = CGRectGetMinY(v51);
          if (v33 > v14)
          {
            uint64_t v35 = (uint64_t)MinY;
            if ((uint64_t)MinY - v14 < a5)
            {
              [v13 frame];
              double v36 = CGRectGetMinY(v52);
              if (!v13 || v35 < (uint64_t)v36)
              {
                id v37 = v17;

                double v13 = v37;
              }
            }
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v12);
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (id)_getGroupedPictureAndSubtitleFeature:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v65 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v61 = v4;
  id v5 = (void *)[v4 mutableCopy];
  BOOL v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  CGFloat v64 = [MEMORY[0x1E4F1CA48] array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v76 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        double v13 = [v12 feature];
        if ([v13 uiClass] == 11)
        {

          uint64_t v14 = v7;
        }
        else
        {
          uint64_t v15 = [v12 feature];
          uint64_t v16 = [v15 uiClass];

          if (v16 == 17) {
            uint64_t v14 = v7;
          }
          else {
            uint64_t v14 = v64;
          }
        }
        [v14 addObject:v12];
        double v17 = [v12 feature];
        if ([v17 uiClass] == 7)
        {
        }
        else
        {
          double v18 = [v12 feature];
          uint64_t v19 = [v18 uiClass];

          if (v19 != 15) {
            continue;
          }
        }
        [v6 addObject:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
    }
    while (v9);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v62 = v6;
  uint64_t v67 = [v62 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (!v67) {
    goto LABEL_37;
  }
  uint64_t v66 = *(void *)v72;
  do
  {
    for (uint64_t j = 0; j != v67; ++j)
    {
      if (*(void *)v72 != v66) {
        objc_enumerationMutation(v62);
      }
      double v21 = *(void **)(*((void *)&v71 + 1) + 8 * j);
      [(AXMLElementCoagulation *)self canvasSize];
      double v23 = [(AXMLElementCoagulation *)self _getClosestDetectionBelow:v7 target:v21 maxDistance:(uint64_t)(v22 * 0.03)];
      if (v23 && [v65 indexOfObject:v23] == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v23 frame];
        double MinY = CGRectGetMinY(v83);
        [v21 frame];
        double v25 = [(AXMLElementCoagulation *)self _getClosestDetectionBelow:v64 target:v23 maxDistance:(uint64_t)(MinY - CGRectGetMaxY(v84))];
        if (!v25)
        {
          [v65 addObject:v23];
          [(AXMLElementCoagulation *)self _mergeFeatureIntoGroup:v21 feature:v23];
          [(AXMLElementCoagulation *)self canvasSize];
          double v27 = [(AXMLElementCoagulation *)self _getClosestDetectionBelow:v7 target:v23 maxDistance:(uint64_t)(v26 * 0.03)];
          if (v27)
          {
            if ([v65 indexOfObject:v27] != 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_34;
            }
            [v27 frame];
            double v28 = CGRectGetMinY(v85);
            [v23 frame];
            double v29 = [(AXMLElementCoagulation *)self _getClosestDetectionBelow:v61 target:v27 maxDistance:(uint64_t)(v28 - CGRectGetMaxY(v86))];
            if (!v29)
            {
              [v65 addObject:v27];
              [(AXMLElementCoagulation *)self _mergeFeatureIntoGroup:v21 feature:v27];
            }
          }
        }
      }
      double v30 = [v21 subfeatures];
      uint64_t v31 = [v30 count];

      if (!v31) {
        goto LABEL_35;
      }
      CGFloat v32 = [v21 subfeatures];
      uint64_t v33 = [(AXMLElementCoagulation *)self _reorderByYCut:v32];
      CGFloat v34 = (void *)[v33 mutableCopy];
      [v21 setSubfeatures:v34];

      [v21 frame];
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
      long long v43 = [v21 feature];
      uint64_t v44 = [v43 uiClass];
      [v21 feature];
      v46 = uint64_t v45 = v7;
      [v46 confidence];
      double v48 = v47;
      [v21 textLabel];
      CGRect v49 = v68 = v23;
      [(AXMLElementCoagulation *)self canvasSize];
      double v51 = v50;
      double v53 = v52;
      uint64_t v54 = [v21 childFeatures];
      double v27 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v44, v49, v54, v36, v38, v40, v42, v48, v51, v53);

      id v7 = v45;
      [v21 setFeature:v27];
      [v21 setIncludeChildren:0];
      [v21 frame];
      double MidX = CGRectGetMidX(v87);
      [v21 frame];
      double MidY = CGRectGetMidY(v88);
      long long v57 = [v21 feature];
      objc_msgSend(v57, "setActivationPoint:", MidX, MidY);

      double v23 = v68;
LABEL_34:

LABEL_35:
    }
    uint64_t v67 = [v62 countByEnumeratingWithState:&v71 objects:v79 count:16];
  }
  while (v67);
LABEL_37:

  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __63__AXMLElementCoagulation__getGroupedPictureAndSubtitleFeature___block_invoke;
  v69[3] = &unk_1E6117FE8;
  id v70 = v65;
  id v58 = v65;
  long long v59 = objc_msgSend(v61, "ax_filteredArrayUsingBlock:", v69);

  return v59;
}

BOOL __63__AXMLElementCoagulation__getGroupedPictureAndSubtitleFeature___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) indexOfObject:a2] == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_getTopLevelFeatureGroups:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v11, "topLevel", (void)v21))
        {
          uint64_t v12 = [v11 subfeatures];
          uint64_t v13 = [v12 count];

          if (v13)
          {
            uint64_t v14 = [v11 subfeatures];
            uint64_t v15 = [(AXMLElementCoagulation *)self _reorderByXCut:v14];
            uint64_t v16 = (void *)[v15 mutableCopy];
            [v11 setSubfeatures:v16];
          }
          [v5 addObject:v11];
          double v17 = [v11 feature];
          uint64_t v18 = [v17 uiClass];

          if (v18 == 4)
          {
            [v11 setIncludeChildren:0];
            uint64_t v19 = [v11 subfeatures];
            [v5 addObjectsFromArray:v19];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_groupSingleContainerAsButton:(id)a3 featureToGroup:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = (void *)[v6 mutableCopy];
  uint64_t v10 = [v7 feature];
  if ([v10 uiClass] == 3) {
    goto LABEL_4;
  }
  uint64_t v11 = [v7 feature];
  if ([v11 uiClass] == 7)
  {

LABEL_4:
LABEL_5:
    uint64_t v12 = [v7 feature];
    if ([v12 uiClass] == 3)
    {
      uint64_t v13 = [v7 subfeatures];
      uint64_t v14 = [v13 count];

      if (!v14)
      {
        [v8 addObject:v7];
        goto LABEL_20;
      }
    }
    else
    {
    }
    uint64_t v15 = [v7 feature];
    uint64_t v16 = [v15 uiClass];

    double v17 = [v7 feature];
    uint64_t v18 = [v17 uiClass];

    if (v18 == 3) {
      uint64_t v19 = 17;
    }
    else {
      uint64_t v19 = v16;
    }
    if ([(AXMLElementCoagulation *)self isRTL])
    {
      double v20 = [v7 subfeatures];
      unint64_t v21 = [v20 count];

      if (v21 >= 2)
      {
        long long v22 = [v7 subfeatures];
        id v23 = [(AXMLElementCoagulation *)self _applyHorizontalMirrorToFeatures:v22];
      }
    }
    long long v24 = [v7 subfeatures];
    double v25 = [(AXMLElementCoagulation *)self _reorderByYCut:v24];
    uint64_t v26 = (void *)[v25 mutableCopy];
    [v7 setSubfeatures:v26];

    if ([(AXMLElementCoagulation *)self isRTL])
    {
      double v27 = [v7 subfeatures];
      unint64_t v28 = [v27 count];

      if (v28 >= 2)
      {
        double v29 = [v7 subfeatures];
        id v30 = [(AXMLElementCoagulation *)self _applyHorizontalMirrorToFeatures:v29];
      }
    }
    [v7 frame];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v39 = [v7 feature];
    [v39 confidence];
    double v41 = v40;
    double v42 = [v7 textLabel];
    [(AXMLElementCoagulation *)self canvasSize];
    double v44 = v43;
    double v46 = v45;
    double v47 = [v7 childFeatures];
    double v48 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v19, v42, v47, v32, v34, v36, v38, v41, v44, v46);

    CGRect v49 = [v7 subfeatures];
    [v8 addObjectsFromArray:v49];

    [v7 setFeature:v48];
    [v7 setIncludeChildren:0];
    goto LABEL_19;
  }
  long long v56 = [v7 feature];
  uint64_t v57 = [v56 uiClass];

  if (v57 == 15) {
    goto LABEL_5;
  }
  id v58 = [v7 feature];
  if ([v58 uiClass] == 5)
  {
  }
  else
  {
    long long v59 = [v7 feature];
    uint64_t v60 = [v59 uiClass];

    if (v60 != 16) {
      goto LABEL_20;
    }
  }
  uint64_t v61 = [v7 subfeatures];
  uint64_t v62 = [v61 count];

  if (v62 == 1)
  {
    CGFloat v63 = [v7 subfeatures];
    double v48 = [v63 objectAtIndex:0];

    CGFloat v64 = [v48 feature];
    if ([v64 uiClass] == 11)
    {
    }
    else
    {
      double v65 = [v48 feature];
      uint64_t v66 = [v65 uiClass];

      if (v66 != 17)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    [v7 setIncludeChildren:0];
    [(AXMLElementCoagulation *)self _removeFeatureFromGroup:v7 feature:v48];
    [v8 addObject:v48];
    goto LABEL_19;
  }
LABEL_20:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v50 = v8;
  uint64_t v51 = [v50 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v68 != v53) {
          objc_enumerationMutation(v50);
        }
        objc_msgSend(v9, "removeObject:", *(void *)(*((void *)&v67 + 1) + 8 * i), (void)v67);
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v52);
  }

  return v9;
}

- (id)_getGroupedTextButtonFeatures:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  uint64_t v6 = [v4 copy];
  id v7 = (void *)v6;
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v9 = [v4 objectAtIndex:i];
      uint64_t v10 = [(AXMLElementCoagulation *)self _groupSingleContainerAsButton:v4 featureToGroup:v9];

      id v7 = v10;
    }
  }
  else
  {
    uint64_t v10 = (void *)v6;
  }

  return v10;
}

- (void)_mergeFeatureIntoGroup:(id)a3 feature:(id)a4
{
  id v23 = a3;
  id v5 = a4;
  [v5 setTopLevel:0];
  [v23 frame];
  if (CGRectIsEmpty(v25))
  {
    [v5 frame];
  }
  else
  {
    [v23 frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v5 frame];
    v27.origin.CGFloat x = v18;
    v27.origin.CGFloat y = v19;
    v27.size.CGFloat width = v20;
    v27.size.CGFloat height = v21;
    v26.origin.CGFloat x = v11;
    v26.origin.CGFloat y = v13;
    v26.size.CGFloat width = v15;
    v26.size.CGFloat height = v17;
    *(CGRect *)&double v6 = CGRectUnion(v26, v27);
  }
  objc_msgSend(v23, "setFrame:", v6, v7, v8, v9);
  long long v22 = [v23 subfeatures];
  [v22 addObject:v5];
}

- (void)_removeFeatureFromGroup:(id)a3 feature:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_msgSend(v6, "setTopLevel:", objc_msgSend(v5, "topLevel"));
  double v7 = [v5 subfeatures];
  [v7 removeObject:v6];

  double v8 = [v5 subfeatures];
  if ([v8 count])
  {
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    CGFloat v13 = [v5 feature];
    [v13 frame];
    double v9 = v14;
    double v10 = v15;
    double v11 = v16;
    double v12 = v17;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  CGFloat v18 = objc_msgSend(v5, "subfeatures", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v33 + 1) + 8 * v22);
        v39.origin.CGFloat x = v9;
        v39.origin.CGFloat y = v10;
        v39.size.CGFloat width = v11;
        v39.size.CGFloat height = v12;
        IsEmptCGFloat y = CGRectIsEmpty(v39);
        [v23 frame];
        double v29 = v25;
        double v30 = v26;
        double v31 = v27;
        double v32 = v28;
        if (!IsEmpty)
        {
          v40.origin.CGFloat x = v9;
          v40.origin.CGFloat y = v10;
          v40.size.CGFloat width = v11;
          v40.size.CGFloat height = v12;
          *(CGRect *)&double v25 = CGRectUnion(v40, *(CGRect *)&v29);
        }
        double v9 = v25;
        double v10 = v26;
        double v11 = v27;
        double v12 = v28;
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v20);
  }

  objc_msgSend(v5, "setFrame:", v9, v10, v11, v12);
}

- (BOOL)_allTabGroupsHaveSingleSubfeature:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "subfeatures", (void)v12);
        unint64_t v9 = [v8 count];

        if (v9 > 1)
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)_getTabGroupSubfeatureUIClassTypes:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        unint64_t v9 = [v8 subfeatures];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = NSNumber;
              long long v15 = [*(id *)(*((void *)&v20 + 1) + 8 * j) feature];
              double v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "uiClass"));
              [v4 addObject:v16];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)_shouldBeTabBar:(BOOL)a3 groupedTabButtons:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(AXMLElementCoagulation *)self _getTabGroupSubfeatureUIClassTypes:v6];
  double v8 = v7;
  BOOL v11 = (!v4
      || [v7 count] == 1
      && ([v8 anyObject],
          unint64_t v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 longValue],
          v9,
          v10 != 11))
     && (unint64_t)[v6 count] < 6;

  return v11;
}

- (void)_improveFeatureFrames:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v103 objects:v108 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v104;
    do
    {
      uint64_t v8 = 0;
      uint64_t v98 = v6;
      do
      {
        if (*(void *)v104 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v103 + 1) + 8 * v8);
        [(AXMLElementCoagulation *)self canvasSize];
        double v11 = v10;
        [(AXMLElementCoagulation *)self canvasSize];
        double v13 = v12;
        long long v14 = [v9 feature];
        uint64_t v15 = [v14 uiClass];

        if (v15 != 8)
        {
          [(AXMLElementCoagulation *)self canvasSize];
          double v17 = v16 * 0.125;
          [v9 frame];
          if (CGRectGetWidth(v110) <= v17 || ([v9 frame], CGRectGetHeight(v111) <= v17))
          {
            long long v101 = 0u;
            long long v102 = 0u;
            long long v99 = 0u;
            long long v100 = 0u;
            id v18 = v4;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v99 objects:v107 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v100;
              double v22 = 0.0;
              double v23 = 0.0;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v100 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  long long v25 = *(void **)(*((void *)&v99 + 1) + 8 * i);
                  if (([v9 isEqual:v25] & 1) == 0)
                  {
                    [v9 frame];
                    CGFloat v27 = v26;
                    CGFloat v29 = v28;
                    CGFloat v31 = v30;
                    CGFloat v33 = v32;
                    [v25 frame];
                    AXMIntersectionOverUnion(v27, v29, v31, v33, v34, v35, v36, v37);
                    if (v38 != 0.0) {
                      goto LABEL_31;
                    }
                    [v9 frame];
                    double v40 = v39;
                    double v42 = v41;
                    double v44 = v43;
                    double v46 = v45;
                    [v25 frame];
                    if (-[AXMLElementCoagulation _hasYOverlap:obj2:](self, "_hasYOverlap:obj2:", v40, v42, v44, v46, v47, v48, v49, v50))
                    {
                      [v25 frame];
                      double MaxX = CGRectGetMaxX(v112);
                      [v9 frame];
                      CGFloat MinX = CGRectGetMinX(v113);
                      double v53 = fmax(v23, MaxX);
                      if (MaxX <= MinX) {
                        double v23 = v53;
                      }
                      [v25 frame];
                      double v54 = CGRectGetMinX(v114);
                      [v9 frame];
                      BOOL v55 = v54 < CGRectGetMaxX(v115);
                      double v56 = fmin(v11, v54);
                      if (!v55) {
                        double v11 = v56;
                      }
                    }
                    [v9 frame];
                    double v58 = v57;
                    double v60 = v59;
                    double v62 = v61;
                    double v64 = v63;
                    [v25 frame];
                    if (-[AXMLElementCoagulation _hasXOverlap:obj2:](self, "_hasXOverlap:obj2:", v58, v60, v62, v64, v65, v66, v67, v68))
                    {
                      [v25 frame];
                      double MaxY = CGRectGetMaxY(v116);
                      [v9 frame];
                      CGFloat MinY = CGRectGetMinY(v117);
                      double v71 = fmax(v22, MaxY);
                      if (MaxY <= MinY) {
                        double v22 = v71;
                      }
                      [v25 frame];
                      double v72 = CGRectGetMinY(v118);
                      [v9 frame];
                      if (v72 >= CGRectGetMaxY(v119)) {
                        double v13 = fmin(v13, v72);
                      }
                    }
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v99 objects:v107 count:16];
              }
              while (v20);
            }
            else
            {
              double v22 = 0.0;
              double v23 = 0.0;
            }

            [v9 frame];
            double v73 = fmax(v23, CGRectGetMinX(v120) + -20.0);
            [v9 frame];
            double v74 = fmax(v22, CGRectGetMinY(v121) + -20.0);
            [v9 frame];
            double v75 = fmin(v11, CGRectGetMaxX(v122) + 20.0);
            [v9 frame];
            double v76 = fmin(v13, CGRectGetMaxY(v123) + 20.0);
            double v77 = fmax(v73, 0.0);
            double v78 = fmax(v74, 0.0);
            [(AXMLElementCoagulation *)self canvasSize];
            double v80 = fmin(v75, v79);
            [(AXMLElementCoagulation *)self canvasSize];
            double v82 = v80 - v77;
            double v83 = fmin(v76, v81) - v78;
            objc_msgSend(v9, "setFrame:", v77, v78, v82, v83);
            uint64_t v97 = [v9 feature];
            uint64_t v84 = [v97 uiClass];
            [v9 confidence];
            double v86 = v85;
            CGRect v87 = [v9 feature];
            CGRect v88 = [v87 value];
            [(AXMLElementCoagulation *)self canvasSize];
            double v90 = v89;
            double v92 = v91;
            [v9 childFeatures];
            uint64_t v93 = v7;
            v95 = id v94 = v4;
            +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v84, v88, v95, v77, v78, v82, v83, v86, v90, v92);
            id v18 = (id)objc_claimAutoreleasedReturnValue();

            id v4 = v94;
            uint64_t v7 = v93;

            id v96 = [v9 feature];
            [v96 activationPoint];
            objc_msgSend(v18, "setActivationPoint:");

            [v9 setFeature:v18];
LABEL_31:

            uint64_t v6 = v98;
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v103 objects:v108 count:16];
    }
    while (v6);
  }
}

- (id)_getFeaturesForAXMLTabButtonGroups:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 count];
  [(AXMLElementCoagulation *)self canvasSize];
  unint64_t v7 = (unint64_t)v6;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v96 objects:v101 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v89 = v5;
    char v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v97 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        objc_msgSend(v15, "frame", v89);
        unint64_t v7 = (unint64_t)fmin((double)v7, CGRectGetMinY(v104));
        [v15 frame];
        unint64_t v12 = (unint64_t)fmax((double)v12, CGRectGetMaxY(v105));
        double v16 = [v15 subfeatures];
        BOOL v17 = [v16 count] == 1;

        v11 |= v17;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v96 objects:v101 count:16];
    }
    while (v10);

    if (v11)
    {
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v18 = v8;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v92 objects:v100 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v93;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v93 != v21) {
              objc_enumerationMutation(v18);
            }
            double v23 = *(void **)(*((void *)&v92 + 1) + 8 * j);
            long long v24 = [v23 subfeatures];
            uint64_t v25 = [v24 count];

            if (v25 == 1)
            {
              [v23 frame];
              uint64_t v26 = (uint64_t)fmax(CGRectGetMinX(v106) + -20.0, 0.0);
              [v23 frame];
              double v27 = fmax(CGRectGetMinY(v107) + -20.0, 0.0);
              [(AXMLElementCoagulation *)self canvasSize];
              double v29 = v28;
              [v23 frame];
              uint64_t v30 = (uint64_t)fmin(v29, CGRectGetMaxX(v108) + 20.0);
              [(AXMLElementCoagulation *)self canvasSize];
              double v32 = v31;
              [v23 frame];
              objc_msgSend(v23, "setFrame:", (double)v26, (double)(uint64_t)v27, (double)(v30 - v26), (double)((uint64_t)fmin(v32, CGRectGetMaxY(v109) + 20.0) - (uint64_t)v27));
            }
            CGFloat v33 = [v23 subfeatures];
            CGFloat v34 = [(AXMLElementCoagulation *)self _compareForY:v33];
            CGFloat v35 = (void *)[v34 mutableCopy];
            [v23 setSubfeatures:v35];

            [v23 setIncludeChildren:0];
            [v23 frame];
            double v37 = v36;
            double v39 = v38;
            double v41 = v40;
            double v43 = v42;
            [v23 confidence];
            double v45 = v44;
            double v46 = [v23 textLabel];
            [(AXMLElementCoagulation *)self canvasSize];
            double v48 = v47;
            double v50 = v49;
            uint64_t v51 = [v23 childFeatures];
            uint64_t v52 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 18, v46, v51, v37, v39, v41, v43, v45, v48, v50);

            [v23 setFeature:v52];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v92 objects:v100 count:16];
        }
        while (v20);
      }

      goto LABEL_31;
    }
    double v91 = (double)v12 + 20.0;
    unint64_t v5 = v89;
  }
  else
  {

    double v91 = 20.0;
  }
  if ([v8 count])
  {
    unint64_t v53 = 0;
    double v54 = fmax((double)v7, 0.0);
    unint64_t v90 = v5 - 2;
    do
    {
      BOOL v55 = objc_msgSend(v8, "objectAtIndex:", v53, v90);
      if (v5 >= 2)
      {
        if (v53)
        {
          if (v5 - 1 == v53)
          {
            double v56 = [v8 objectAtIndex:v90];
            [v56 frame];
            double MaxX = CGRectGetMaxX(v110);
            [v55 frame];
            double v58 = CGRectGetMaxX(v111);
            [v55 frame];
            double v59 = v58 + CGRectGetMinX(v112) - MaxX;
          }
          else
          {
            double v56 = [v8 objectAtIndex:v53 - 1];
            double v62 = [v8 objectAtIndex:v53 + 1];
            [v56 frame];
            double MaxX = CGRectGetMaxX(v117);
            [v55 frame];
            double v63 = CGRectGetMaxX(v118);
            [v62 frame];
            double v59 = (v63 + CGRectGetMinX(v119)) * 0.5;
          }
        }
        else
        {
          double v56 = [v8 objectAtIndex:1];
          [v55 frame];
          double v60 = CGRectGetMaxX(v113);
          [v56 frame];
          double v59 = (v60 + CGRectGetMinX(v114)) * 0.5;
          [v55 frame];
          double MinX = CGRectGetMinX(v115);
          [v55 frame];
          double MaxX = MinX - (v59 - CGRectGetMaxX(v116));
        }

        double v64 = fmax(floor(MaxX), 0.0);
        [(AXMLElementCoagulation *)self canvasSize];
        double v66 = fmin(v65, floor(v59));
        [(AXMLElementCoagulation *)self canvasSize];
        objc_msgSend(v55, "setFrame:", v64, v54, v66 - v64, fmin(v67, v91) - v54);
      }
      double v68 = [v55 subfeatures];
      long long v69 = [(AXMLElementCoagulation *)self _compareForY:v68];
      long long v70 = (void *)[v69 mutableCopy];
      [v55 setSubfeatures:v70];

      [v55 setIncludeChildren:0];
      [v55 frame];
      double v72 = v71;
      double v74 = v73;
      double v76 = v75;
      double v78 = v77;
      [v55 confidence];
      double v80 = v79;
      double v81 = [v55 textLabel];
      [(AXMLElementCoagulation *)self canvasSize];
      double v83 = v82;
      double v85 = v84;
      double v86 = [v55 childFeatures];
      CGRect v87 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 18, v81, v86, v72, v74, v76, v78, v80, v83, v85);

      [v55 setFeature:v87];
      ++v53;
    }
    while (v53 < [v8 count]);
  }
LABEL_31:

  return v8;
}

- (id)_getGroupedTabBarFeatures:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 count])
  {
    id v6 = [(AXMLElementCoagulation *)self _compareForX:v4];

    if ([(AXMLElementCoagulation *)self isiPad])
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v46 != v10) {
              objc_enumerationMutation(v7);
            }
            unint64_t v12 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            [v12 frame];
            CGFloat v13 = CGRectGetHeight(v54) * 0.5;
            [v12 frame];
            CGFloat v14 = CGRectGetMinX(v55) - v13;
            [v12 frame];
            CGFloat v15 = CGRectGetWidth(v56) + v13 * 2.0;
            [v12 frame];
            double MinY = CGRectGetMinY(v57);
            [v12 frame];
            objc_msgSend(v12, "setFrame:", v14, MinY, v15, CGRectGetHeight(v58));
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v9);
      }
    }
    BOOL v17 = [(AXMLElementCoagulation *)self _getHorizontalSegmentationPointDict:v6];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __52__AXMLElementCoagulation__getGroupedTabBarFeatures___block_invoke;
    v43[3] = &unk_1E6118010;
    v43[4] = self;
    id v5 = v5;
    id v44 = v5;
    [v17 enumerateKeysAndObjectsUsingBlock:v43];
    if ((unint64_t)[v5 count] > 1)
    {
      id v34 = v6;
      CGFloat v33 = self;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v5 = v5;
      uint64_t v24 = [v5 countByEnumeratingWithState:&v35 objects:v49 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v36;
        int v27 = 1;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v5);
            }
            double v29 = [*(id *)(*((void *)&v35 + 1) + 8 * j) subfeatures];
            uint64_t v30 = objc_msgSend(v29, "ax_mappedArrayUsingBlock:", &__block_literal_global_201);

            if (([v30 containsObject:&unk_1F0E936D0] & 1) == 0) {
              v27 &= [v30 containsObject:&unk_1F0E93790];
            }
          }
          uint64_t v25 = [v5 countByEnumeratingWithState:&v35 objects:v49 count:16];
        }
        while (v25);
      }
      else
      {
        LOBYTE(v27) = 1;
      }

      if (unint64_t)[v5 count] < 6 || (v27)
      {
        uint64_t v31 = [(AXMLElementCoagulation *)v33 _reorderByXCut:v5];

        double v23 = [(AXMLElementCoagulation *)v33 _getFeaturesForAXMLTabButtonGroups:v31];
        id v5 = (id)v31;
      }
      else
      {
        double v23 = [MEMORY[0x1E4F1CA48] array];
      }
      id v6 = v34;
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v18 = v6;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v50 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v40;
        do
        {
          for (uint64_t k = 0; k != v20; ++k)
          {
            if (*(void *)v40 != v21) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v39 + 1) + 8 * k) setTopLevel:1];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v50 count:16];
        }
        while (v20);
      }

      double v23 = [MEMORY[0x1E4F1CA48] array];
    }
  }
  else
  {
    id v6 = v4;
    double v23 = v6;
  }

  return v23;
}

void __52__AXMLElementCoagulation__getGroupedTabBarFeatures___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(AXMLTabButtonGroup);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(a1 + 32), "_mergeFeatureIntoGroup:feature:", v5, *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [*(id *)(a1 + 40) addObject:v5];
  }
}

id __52__AXMLElementCoagulation__getGroupedTabBarFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  id v3 = [a2 feature];
  id v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "uiClass"));

  return v4;
}

- (id)_compareForY:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AXMLElementCoagulation__compareForY___block_invoke;
  v5[3] = &unk_1E6118038;
  v5[4] = self;
  id v3 = [a3 sortedArrayUsingComparator:v5];

  return v3;
}

uint64_t __39__AXMLElementCoagulation__compareForY___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [a2 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v5 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  return objc_msgSend(v4, "_compareY:frame2:", v7, v9, v11, v13, v15, v17, v19, v21);
}

- (id)_compareForX:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AXMLElementCoagulation__compareForX___block_invoke;
  v5[3] = &unk_1E6118038;
  v5[4] = self;
  id v3 = [a3 sortedArrayUsingComparator:v5];

  return v3;
}

uint64_t __39__AXMLElementCoagulation__compareForX___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [a2 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v5 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  return objc_msgSend(v4, "_compareX:frame2:", v7, v9, v11, v13, v15, v17, v19, v21);
}

- (id)_compareArea:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_206];
}

uint64_t __39__AXMLElementCoagulation__compareArea___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  [v5 frame];
  double v7 = v6;
  [v5 frame];
  double v9 = v8;

  double v10 = v7 * v9;
  [v4 frame];
  double v12 = v11;
  [v4 frame];
  double v14 = v13;

  if (v10 >= v12 * v14) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)_sortFeaturesReadingOrder:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_208];
}

uint64_t __52__AXMLElementCoagulation__sortFeaturesReadingOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  [v5 frame];
  double v7 = v6;
  [v4 frame];
  double v9 = vabdd_f64(v7, v8);
  [v5 frame];
  double v11 = v10;
  double v13 = v12;

  [v4 frame];
  BOOL v16 = v13 < v15;
  if (v9 < 20.0) {
    BOOL v16 = v11 < v14;
  }
  if (v16) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = 1;
  }

  return v17;
}

- (id)_getCandidateTabBarFeatures:(id)a3 screenSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F0E936D0, &unk_1F0E93790, &unk_1F0E93688, &unk_1F0E936A0, 0);
  if (![v7 count]) {
    goto LABEL_41;
  }
  if ([(AXMLElementCoagulation *)self isiPad]) {
    double v9 = 0.9;
  }
  else {
    double v9 = 0.85;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v7 = v7;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (!v10)
  {

LABEL_41:
    id v44 = v8;
    goto LABEL_45;
  }
  uint64_t v11 = v10;
  double v12 = 0;
  double v13 = height * v9;
  uint64_t v14 = *(void *)v56;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v56 != v14) {
        objc_enumerationMutation(v7);
      }
      BOOL v16 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      if ([v16 uiClass] == 10)
      {
        [v16 frame];
        if (CGRectGetMinY(v64) >= v13)
        {
          if (!v12 || ([v12 confidence], double v18 = v17, objc_msgSend(v16, "confidence"), v18 < v19))
          {
            id v20 = v16;

            double v12 = v20;
          }
        }
      }
    }
    uint64_t v11 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
  }
  while (v11);

  if (!v12) {
    goto LABEL_41;
  }
  [v12 frame];
  double MinY = CGRectGetMinY(v65);
  double v22 = [v7 sortedArrayUsingComparator:&__block_literal_global_210];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v7 = v22;
  uint64_t v23 = [v7 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    double v25 = height - MinY;
    uint64_t v26 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v52 != v26) {
          objc_enumerationMutation(v7);
        }
        double v28 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        double v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v28, "uiClass"));
        uint64_t v30 = [v46 indexOfObject:v29];

        if (v30 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v28 frame];
          if (CGRectGetMinY(v66) >= v13)
          {
            [v28 frame];
            if (AXMIsContainedBy(0.0, MinY, width, v25, v31, v32, v33, v34, 0.5)) {
              [v8 addObject:v28];
            }
          }
        }
      }
      uint64_t v24 = [v7 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v24);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v35 = v8;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (!v36)
  {

    unint64_t v40 = 0x1E4F1C000uLL;
LABEL_43:
    id v43 = [*(id *)(v40 + 2632) array];
    goto LABEL_44;
  }
  uint64_t v37 = v36;
  uint64_t v38 = *(void *)v48;
  char v39 = 1;
  unint64_t v40 = 0x1E4F1C000;
  do
  {
    for (uint64_t k = 0; k != v37; ++k)
    {
      if (*(void *)v48 != v38) {
        objc_enumerationMutation(v35);
      }
      long long v42 = *(void **)(*((void *)&v47 + 1) + 8 * k);
      if ([v42 uiClass] != 11) {
        v39 &= [v42 uiClass] == 17;
      }
    }
    uint64_t v37 = [v35 countByEnumeratingWithState:&v47 objects:v59 count:16];
  }
  while (v37);

  if (v39) {
    goto LABEL_43;
  }
  id v43 = v35;
LABEL_44:
  id v44 = v43;

LABEL_45:

  return v44;
}

uint64_t __65__AXMLElementCoagulation__getCandidateTabBarFeatures_screenSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  if (v6 >= 1.0)
  {
    uint64_t v12 = -1;
  }
  else
  {
    [v5 confidence];
    if (v7 >= 1.0)
    {
      uint64_t v12 = 1;
    }
    else
    {
      double v8 = NSNumber;
      [v4 confidence];
      double v9 = objc_msgSend(v8, "numberWithDouble:");
      uint64_t v10 = NSNumber;
      [v5 confidence];
      uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
      uint64_t v12 = [v9 compare:v11] == 0;
    }
  }

  return v12;
}

- (id)_repairTextInTabItems:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 mutableCopy];
  id v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_212);
  double v60 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_214);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obuint64_t j = v4;
  uint64_t v61 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v69;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v69 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = v5;
        double v6 = *(void **)(*((void *)&v68 + 1) + 8 * v5);
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v7 = v60;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v65;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v65 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              [v6 frame];
              CGFloat v14 = v13;
              CGFloat v16 = v15;
              CGFloat v18 = v17;
              CGFloat v20 = v19;
              [v12 frame];
              AXMIntersectionOverUnion(v14, v16, v18, v20, v21, v22, v23, v24);
              if (v25 != 0.0)
              {
                [v12 frame];
                double v27 = v26;
                double v29 = v28;
                double v31 = v30;
                double v33 = v32;
                [v6 frame];
                if (AXMIsContainedBy(v27, v29, v31, v33, v34, v35, v36, v37, 0.8))
                {
                  [v3 removeObject:v6];
                  goto LABEL_22;
                }
                [v6 frame];
                double MaxX = CGRectGetMaxX(v76);
                [v12 frame];
                if (MaxX > CGRectGetMaxX(v77))
                {
                  [v12 frame];
                  double v39 = CGRectGetMaxX(v78);
                  [v6 frame];
                  double MinY = CGRectGetMinY(v79);
                  [v6 frame];
                  double v41 = CGRectGetMaxX(v80);
                  [v12 frame];
                  double v42 = CGRectGetMaxX(v81);
                  [v6 frame];
                  double Height = CGRectGetHeight(v82);
                  id v44 = [v6 value];
                  uint64_t v45 = [v44 rangeOfString:@" "];
                  if (v45 != 0x7FFFFFFFFFFFFFFFLL && [v44 length] > (unint64_t)(v45 + 1))
                  {
                    uint64_t v46 = objc_msgSend(v44, "substringFromIndex:");

                    id v44 = (void *)v46;
                  }
                  double v47 = v41 - v42;
                  uint64_t v48 = [v6 uiClass];
                  [v6 confidence];
                  double v50 = v49;
                  [(AXMLElementCoagulation *)self canvasSize];
                  double v52 = v51;
                  double v54 = v53;
                  long long v55 = [v6 subfeatures];
                  long long v56 = +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v48, v44, v55, v39, MinY, v47, Height, v50, v52, v54);

                  [v3 removeObject:v6];
                  [v3 addObject:v56];
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v64 objects:v72 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_22:

        uint64_t v5 = v62 + 1;
      }
      while (v62 + 1 != v61);
      uint64_t v61 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
    }
    while (v61);
  }

  return v3;
}

BOOL __48__AXMLElementCoagulation__repairTextInTabItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 uiClass] == 11 || objc_msgSend(v2, "uiClass") == 17;

  return v3;
}

BOOL __48__AXMLElementCoagulation__repairTextInTabItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 uiClass] == 5 || objc_msgSend(v2, "uiClass") == 16;

  return v3;
}

- (id)_reorderedTabsForSortedFeatures:(id)a3 screenSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = -[AXMLElementCoagulation _getCandidateTabBarFeatures:screenSize:](self, "_getCandidateTabBarFeatures:screenSize:", v7, width, height);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    double v12 = 0.0;
    double v13 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        double v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v15 frame];
        double v13 = fmin(v13, CGRectGetMinY(v27));
        [v15 frame];
        double v12 = fmax(v12, CGRectGetMaxY(v28));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
    double v16 = v13 + -1.0;
    double v17 = v12 + 1.0;
  }
  else
  {
    double v17 = 1.0;
    double v16 = 1.79769313e308;
  }
  CGFloat v18 = [(AXMLElementCoagulation *)self _featuresByReorderingTwoRows:v7 minY:v16 maxY:v17];

  return v18;
}

- (id)_featuresByReorderingTwoRows:(id)a3 minY:(double)a4 maxY:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "frame", (void)v22);
        double MinY = CGRectGetMinY(v29);
        double v19 = v9;
        if (MinY >= a4)
        {
          [v17 frame];
          if (CGRectGetMaxY(v30) <= a5) {
            double v19 = v10;
          }
          else {
            double v19 = v11;
          }
        }
        [v19 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  long long v20 = [(AXMLElementCoagulation *)self _reorderByXCut:v10];
  [v9 addObjectsFromArray:v20];

  [v9 addObjectsFromArray:v11];

  return v9;
}

- (id)_reorderSimilarTopNeighbors:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = (void *)[v3 mutableCopy];
  if ([v5 count] != 1)
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [v5 objectAtIndexedSubscript:v8];
      uint64_t v10 = [v5 objectAtIndexedSubscript:++v8];
      [v9 frame];
      double MinY = CGRectGetMinY(v21);
      [v10 frame];
      if (MinY > CGRectGetMinY(v22)) {
        goto LABEL_9;
      }
      [v9 frame];
      double MaxY = CGRectGetMaxY(v23);
      [v9 frame];
      double v13 = fmin(MaxY, CGRectGetMaxY(v24));
      [v9 frame];
      double v14 = CGRectGetMinY(v25);
      [v10 frame];
      double v15 = v13 - fmax(v14, CGRectGetMinY(v26));
      [v9 frame];
      double v17 = v16;
      [v10 frame];
      if (v15 < fmin(v17, v18) * 0.9) {
        goto LABEL_9;
      }
      [v9 frame];
      double MinX = CGRectGetMinX(v27);
      [v10 frame];
      if (MinX >= CGRectGetMaxX(v28))
      {
        [v4 addObject:v10];
        [v5 setObject:v9 atIndexedSubscript:v8];
      }
      else
      {
LABEL_9:
        [v4 addObject:v9];
      }
    }
    while (v8 < [v5 count] - 1);
  }
  double v6 = [v5 lastObject];
  [v4 addObject:v6];

  return v4;
}

- (id)_reorderByYCut:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  double v50 = [v4 array];
  double v49 = [MEMORY[0x1E4F1CA60] dictionary];
  double v6 = [MEMORY[0x1E4F1CA48] array];
  double v47 = self;
  id v7 = [(AXMLElementCoagulation *)self _compareForY:v5];

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v64;
    double MaxY = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v64 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        [v14 frame];
        if (CGRectGetMinY(v73) <= MaxY)
        {
          [v14 frame];
          if (CGRectGetMaxY(v75) <= MaxY) {
            continue;
          }
        }
        else
        {
          double v15 = NSNumber;
          [v14 frame];
          double v16 = [v15 numberWithDouble:(MaxY + CGRectGetMinY(v74)) * 0.5];
          [v50 addObject:v16];
        }
        [v14 frame];
        double MaxY = CGRectGetMaxY(v76);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v10);
  }

  id v17 = (id)[v50 sortedArrayUsingComparator:&__block_literal_global_220];
  double v18 = NSNumber;
  [(AXMLElementCoagulation *)v47 canvasSize];
  long long v20 = [v18 numberWithDouble:v19 + 1.0];
  [v50 addObject:v20];

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v8;
  uint64_t v21 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v60 != v23) {
          objc_enumerationMutation(obj);
        }
        CGRect v25 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v26 = v50;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v68 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v56;
          while (2)
          {
            for (uint64_t k = 0; k != v28; ++k)
            {
              if (*(void *)v56 != v29) {
                objc_enumerationMutation(v26);
              }
              double v31 = *(void **)(*((void *)&v55 + 1) + 8 * k);
              [v31 floatValue];
              CGFloat v33 = v32;
              [v25 frame];
              if (CGRectGetMinY(v77) < v33)
              {
                double v34 = [v49 objectForKey:v31];

                if (!v34)
                {
                  double v35 = [MEMORY[0x1E4F1CA48] array];
                  [v49 setObject:v35 forKeyedSubscript:v31];
                }
                double v36 = [v49 objectForKey:v31];
                [v36 addObject:v25];

                goto LABEL_29;
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v68 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }
LABEL_29:
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v22);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v37 = v50;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v51 objects:v67 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v52;
    double v41 = v49;
    do
    {
      uint64_t v42 = 0;
      id v43 = v6;
      do
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(v37);
        }
        id v44 = [v49 objectForKey:*(void *)(*((void *)&v51 + 1) + 8 * v42)];
        uint64_t v45 = [(AXMLElementCoagulation *)v47 _reorderByXCut:v44];
        double v6 = [v43 arrayByAddingObjectsFromArray:v45];

        ++v42;
        id v43 = v6;
      }
      while (v39 != v42);
      uint64_t v39 = [v37 countByEnumeratingWithState:&v51 objects:v67 count:16];
    }
    while (v39);
  }
  else
  {
    double v41 = v49;
  }

  return v6;
}

uint64_t __41__AXMLElementCoagulation__reorderByYCut___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int64_t)_compareY:(CGRect)a3 frame2:(CGRect)a4
{
  if (a3.origin.y < a4.origin.y) {
    return -1;
  }
  else {
    return a3.origin.y > a4.origin.y;
  }
}

- (int64_t)_compareX:(CGRect)a3 frame2:(CGRect)a4
{
  if (a3.origin.x < a4.origin.x) {
    return -1;
  }
  else {
    return a3.origin.x > a4.origin.x;
  }
}

- (id)_getHorizontalSegmentationPointDict:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  double v6 = [v4 array];
  id v45 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [(AXMLElementCoagulation *)self _compareForX:v5];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v55;
    double MaxX = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v55 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        [v14 frame];
        double MinX = CGRectGetMinX(v63);
        [v14 frame];
        if (MinX <= MaxX)
        {
          if (CGRectGetMaxX(*(CGRect *)&v16) > MaxX)
          {
            [v14 frame];
            double MaxX = CGRectGetMaxX(v65);
          }
        }
        else
        {
          double v20 = (MaxX + CGRectGetMinX(*(CGRect *)&v16)) * 0.5;
          *(float *)&double v20 = v20;
          uint64_t v21 = [NSNumber numberWithFloat:v20];
          [v6 addObject:v21];
          [v14 frame];
          double MaxX = CGRectGetMaxX(v64);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v10);
  }

  id v22 = (id)[v6 sortedArrayUsingComparator:&__block_literal_global_222];
  uint64_t v23 = NSNumber;
  [(AXMLElementCoagulation *)self canvasSize];
  double v25 = v24 + 1.0;
  *(float *)&double v25 = v25;
  id v43 = [v23 numberWithFloat:v25];
  objc_msgSend(v6, "addObject:");
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v8;
  uint64_t v26 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(obj);
        }
        CGRect v30 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v31 = v6;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v47;
          while (2)
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v47 != v34) {
                objc_enumerationMutation(v31);
              }
              double v36 = *(void **)(*((void *)&v46 + 1) + 8 * k);
              [v36 floatValue];
              float v38 = v37;
              [v30 frame];
              if (CGRectGetMinX(v66) < v38)
              {
                uint64_t v39 = [v45 objectForKey:v36];

                if (!v39)
                {
                  uint64_t v40 = [MEMORY[0x1E4F1CA48] array];
                  [v45 setObject:v40 forKeyedSubscript:v36];
                }
                double v41 = [v45 objectForKey:v36];
                [v41 addObject:v30];

                goto LABEL_29;
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (v33) {
              continue;
            }
            break;
          }
        }
LABEL_29:
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v27);
  }

  return v45;
}

uint64_t __62__AXMLElementCoagulation__getHorizontalSegmentationPointDict___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_reorderByXCut:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [(AXMLElementCoagulation *)self _getHorizontalSegmentationPointDict:a3];
  id v5 = [v4 allKeys];
  double v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_225];

  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      double v13 = v7;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * v12), (void)v17);
        double v15 = [(AXMLElementCoagulation *)self _sortFeaturesReadingOrder:v14];
        id v7 = [v13 arrayByAddingObjectsFromArray:v15];

        ++v12;
        double v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

uint64_t __41__AXMLElementCoagulation__reorderByXCut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 floatValue];
  float v6 = v5;
  [v4 floatValue];
  float v8 = v7;

  if (v6 > v8) {
    return 1;
  }
  else {
    return -1;
  }
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (CGRect)appFrame
{
  double x = self->_appFrame.origin.x;
  double y = self->_appFrame.origin.y;
  double width = self->_appFrame.size.width;
  double height = self->_appFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAppFrame:(CGRect)a3
{
  self->_appFrame = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (int64_t)appOrientation
{
  return self->_appOrientation;
}

- (void)setAppOrientation:(int64_t)a3
{
  self->_appOrientatiouint64_t n = a3;
}

- (NSArray)clickableTextKeywords
{
  return self->_clickableTextKeywords;
}

- (void)setClickableTextKeywords:(id)a3
{
}

- (NSRegularExpression)nonAlphaCharactersRegex
{
  return self->_nonAlphaCharactersRegex;
}

- (void)setNonAlphaCharactersRegex:(id)a3
{
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonAlphaCharactersRegex, 0);

  objc_storeStrong((id *)&self->_clickableTextKeywords, 0);
}

@end