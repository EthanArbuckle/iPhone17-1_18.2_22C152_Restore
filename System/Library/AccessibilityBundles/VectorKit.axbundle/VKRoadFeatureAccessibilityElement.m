@interface VKRoadFeatureAccessibilityElement
- (AXVKFeaturePointIndices)featureAndPointIndicesForPoint:(CGPoint)a3;
- (BOOL)_accessibilityLastHitTestNearBorder;
- (BOOL)_accessibilityRoadContainsTrackingPoint:(CGPoint)a3;
- (BOOL)pointInside:(CGPoint)a3;
- (CGRect)accessibilityFrame;
- (NSArray)consolidatedAndOrderedFeatures;
- (NSArray)intersectingRoads;
- (NSArray)originalPaths;
- (NSString)roadDirection;
- (_NSRange)_roadSuffixRangeForCommonRoadAbbreviations:(id)a3 replacement:(id *)a4;
- (float)_accessibilityDistance:(CGPoint)a3 forAngle:(float)a4 toRoad:(id)a5;
- (float)_accessibilityDistanceFromEndOfRoad:(CGPoint)a3 forAngle:(float)a4;
- (id)_accessibilityUpcomingRoadsForPoint:(CGPoint)a3 forAngle:(float)a4;
- (id)_axRoadPrefix;
- (id)_axRoadSuffix;
- (id)_nearestIntersectionForPoint:(CGPoint)a3;
- (id)_nearestPOIsForPoint:(CGPoint)a3;
- (id)_roadDirectionDescription;
- (id)_roadLength;
- (id)accessibilityLabel;
- (id)accessibilityPaths;
- (id)accessibilitySortedIntersectorsForPoint:(CGPoint)a3;
- (id)accessibilityViableIntersectorsForPoint:(CGPoint)a3 fromSortedArray:(id)a4 isStart:(BOOL)a5;
- (id)adjacentIntersectorsForPoint:(CGPoint)a3 isStart:(BOOL)a4;
- (id)consolidatedAndOrderedFeaturesFromAllFeaturePoints:(id)a3;
- (id)detailedFeatureElementInfoAtPoint:(CGPoint)a3;
- (id)trueLabel;
- (int)travelDirection;
- (int64_t)_accessibilityMapFeatureType;
- (int64_t)_accessibilityMapRoadType;
- (void)_accessibilityMapsExplorationBeginFromCurrentElement;
- (void)_combineRoadPaths:(id)a3;
- (void)_updatePath;
- (void)setConsolidatedAndOrderedFeatures:(id)a3;
- (void)setIntersectingRoads:(id)a3;
- (void)setRoadDirection:(id)a3;
- (void)setTravelDirection:(int)a3;
@end

@implementation VKRoadFeatureAccessibilityElement

- (int64_t)_accessibilityMapFeatureType
{
  return 1;
}

- (id)_axRoadPrefix
{
  unint64_t v2 = [(VKRoadFeatureAccessibilityElement *)self _accessibilityMapRoadType] - 1;
  if (v2 > 4)
  {
    v3 = 0;
  }
  else
  {
    v3 = AXVectorKitLocString(off_265162B20[v2]);
  }

  return v3;
}

- (id)trueLabel
{
  v4.receiver = self;
  v4.super_class = (Class)VKRoadFeatureAccessibilityElement;
  unint64_t v2 = [(VKFeatureAccessibilityElement *)&v4 accessibilityLabel];

  return v2;
}

- (id)_axRoadSuffix
{
  if ([(VKRoadFeatureAccessibilityElement *)self travelDirection] - 1 > 1)
  {
    unint64_t v2 = 0;
  }
  else
  {
    unint64_t v2 = AXVectorKitLocString(@"ROAD_ONE_WAY");
  }

  return v2;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(VKRoadFeatureAccessibilityElement *)self _axRoadPrefix];
  if (v3)
  {
    id v4 = (id)v3;
    v5 = [(VKFeatureAccessibilityElement *)self shieldText];

    if (v5)
    {
      v6 = NSString;
      v7 = [(VKFeatureAccessibilityElement *)self shieldText];
      uint64_t v8 = [v6 stringWithFormat:@"%@ %@", v4, v7];

      id v4 = (id)v8;
    }
    v21.receiver = self;
    v21.super_class = (Class)VKRoadFeatureAccessibilityElement;
    v9 = [(VKFeatureAccessibilityElement *)&v21 accessibilityLabel];
    uint64_t v10 = __UIAXStringForVariables();
    goto LABEL_5;
  }
  v20.receiver = self;
  v20.super_class = (Class)VKRoadFeatureAccessibilityElement;
  v12 = [(VKFeatureAccessibilityElement *)&v20 accessibilityLabel];
  if (!v12)
  {
    v12 = [(VKFeatureAccessibilityElement *)self shieldText];
  }
  v13 = [(VKRoadFeatureAccessibilityElement *)self _axRoadSuffix];
  v18 = [(VKRoadFeatureAccessibilityElement *)self _roadDirectionDescription];
  v9 = __UIAXStringForVariables();

  if (!AXDoesRequestingClientDeserveAutomation())
  {
    id v19 = 0;
    uint64_t v15 = [(VKRoadFeatureAccessibilityElement *)self _roadSuffixRangeForCommonRoadAbbreviations:v9, &v19, v13, v18, @"__AXStringForVariablesSentinel" replacement];
    uint64_t v17 = v16;
    id v4 = v19;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    uint64_t v10 = objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", v15, v17, v4);
LABEL_5:
    v11 = (void *)v10;

    v9 = v11;
LABEL_6:
  }

  return v9;
}

- (_NSRange)_roadSuffixRangeForCommonRoadAbbreviations:(id)a3 replacement:(id *)a4
{
  id v5 = a3;
  if (-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::onceToken != -1) {
    dispatch_once(&-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::onceToken, &__block_literal_global_2);
  }
  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x4012000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = &unk_2426D40D2;
  long long v25 = xmmword_2426CBCB0;
  v6 = [MEMORY[0x263F228D0] sharedInstance];
  v7 = [v6 dialectForSystemLanguage];
  uint64_t v8 = [v7 specificLanguageID];
  v9 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  if ([(id)-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::SupportedLangs containsObject:v9])
  {
    uint64_t v10 = [v5 length];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __92__VKRoadFeatureAccessibilityElement__roadSuffixRangeForCommonRoadAbbreviations_replacement___block_invoke_570;
    v15[3] = &unk_265162A10;
    id v16 = v9;
    uint64_t v17 = &v19;
    v18 = a4;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v15);
    NSUInteger v11 = v20[6];
    NSUInteger v12 = v20[7];
  }
  else
  {
    NSUInteger v11 = v20[6];
    NSUInteger v12 = v20[7];
  }

  _Block_object_dispose(&v19, 8);
  NSUInteger v13 = v11;
  NSUInteger v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

uint64_t __92__VKRoadFeatureAccessibilityElement__roadSuffixRangeForCommonRoadAbbreviations_replacement___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26F825270];
  v1 = (void *)-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::SupportedLangs;
  -[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::SupportedLangs = v0;

  unint64_t v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = AXAccessibilityBundlesDirectory();
  id v4 = [v3 stringByAppendingPathComponent:@"MapsStreetNames.axbundle"];
  uint64_t v5 = [v2 bundleWithPath:v4];
  v6 = (void *)-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::Bundle;
  -[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::Bundle = v5;

  v7 = (void *)-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::Bundle;

  return [v7 load];
}

void __92__VKRoadFeatureAccessibilityElement__roadSuffixRangeForCommonRoadAbbreviations_replacement___block_invoke_570(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v11 = a2;
  NSUInteger v12 = NSString;
  id v19 = v11;
  NSUInteger v13 = [v11 lowercaseString];
  NSUInteger v14 = [v12 stringWithFormat:@"ROAD.SUFFIX.%@", v13];

  uint64_t v15 = (void *)-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::Bundle;
  id v16 = [NSString stringWithFormat:@"StreetNames-%@", *(void *)(a1 + 32)];
  uint64_t v17 = [v15 localizedStringForKey:v14 value:&stru_26F81E868 table:v16];

  if ([v17 length] && (objc_msgSend(v17, "isEqualToString:", v14) & 1) == 0)
  {
    **(void **)(a1 + 48) = (id)[v17 copy];
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v18 + 48) = a3;
    *(void *)(v18 + 56) = a4;
    *a7 = 1;
  }
}

- (BOOL)_accessibilityLastHitTestNearBorder
{
  return self->_lastHitTestNearBorder;
}

- (int64_t)_accessibilityMapRoadType
{
  uint64_t v2 = [(VKFeatureAccessibilityElement *)self shieldType];
  if (v2 <= 5449)
  {
    if (v2 == 1045) {
      return 3;
    }
    if (v2 == 5400) {
      return 1;
    }
  }
  else
  {
    switch(v2)
    {
      case 5450:
        return 2;
      case 6650:
        return 5;
      case 5700:
        return 4;
    }
  }
  return 0;
}

- (NSArray)originalPaths
{
  originalPaths = self->_originalPaths;
  if (!originalPaths)
  {
    [(VKRoadFeatureAccessibilityElement *)self _updatePath];
    originalPaths = self->_originalPaths;
  }

  return (NSArray *)originalPaths;
}

- (void)_combineRoadPaths:(id)a3
{
  id v65 = a3;
  objc_storeStrong((id *)&self->_allPoints, a3);
  if ((unint64_t)[v65 count] >= 2)
  {
    for (unint64_t i = 0; i < [v65 count]; ++i)
    {
      v6 = [v65 objectAtIndex:i];
      v7 = [(NSArray *)v6 objectAtIndex:0];
      [v7 CGPointValue];
      double v9 = v8;
      double v11 = v10;

      NSUInteger v12 = [(NSArray *)v6 lastObject];
      CGFloat v63 = v11;
      CGFloat v64 = v9;
      [v12 CGPointValue];
      double v14 = v13;
      double v16 = v15;

      uint64_t v17 = 0;
      uint64_t v18 = 0;
      unint64_t v19 = i + 1;
      uint64_t v20 = -1;
      float v66 = 3.4028e38;
      float v67 = 3.4028e38;
      uint64_t v21 = -1;
      CGFloat v62 = v16;
      while (v19 < [v65 count])
      {
        v22 = [v65 objectAtIndex:v19];
        v23 = [v22 objectAtIndex:0];
        [v23 CGPointValue];
        CGFloat v25 = v24;
        CGFloat v27 = v26;

        v28 = [v22 lastObject];
        [v28 CGPointValue];
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        CGFloat v33 = v14;

        v69.x = v64;
        v69.y = v63;
        v73.x = v25;
        v73.y = v27;
        double DistanceBetweenPoints = AXVKMathGetDistanceBetweenPoints(v69, v73);
        v70.x = v64;
        v70.y = v63;
        v74.x = v30;
        v74.y = v32;
        double v37 = AXVKMathGetDistanceBetweenPoints(v70, v74);
        double v35 = v37;
        float v36 = DistanceBetweenPoints;
        *(float *)&double v37 = v67;
        if (v67 <= v36)
        {
          float v36 = v67;
        }
        else
        {
          v38 = objc_msgSend(v22, "reverseObjectEnumerator", v37);
          uint64_t v39 = [v38 allObjects];

          uint64_t v18 = (NSArray *)v39;
          uint64_t v21 = v19;
        }
        float v40 = v35;
        float v67 = v40;
        if (v36 <= v40)
        {
          float v67 = v36;
        }
        else
        {
          v41 = v22;

          uint64_t v18 = v41;
          uint64_t v21 = v19;
        }
        v71.x = v33;
        v71.y = v62;
        v75.x = v25;
        v75.y = v27;
        double v42 = AXVKMathGetDistanceBetweenPoints(v71, v75);
        v72.x = v33;
        v72.y = v62;
        v76.x = v30;
        v76.y = v32;
        double v43 = AXVKMathGetDistanceBetweenPoints(v72, v76);
        float v44 = v42;
        if (v66 <= v44)
        {
          float v44 = v66;
        }
        else
        {
          v45 = v22;

          uint64_t v17 = v45;
          uint64_t v20 = v19;
        }
        float v46 = v43;
        float v66 = v46;
        if (v44 <= v46)
        {
          float v66 = v44;
          double v14 = v33;
        }
        else
        {
          v47 = [v22 reverseObjectEnumerator];
          double v14 = v33;
          uint64_t v48 = [v47 allObjects];

          uint64_t v17 = (NSArray *)v48;
          uint64_t v20 = v19;
        }

        ++v19;
      }
      BOOL v49 = v67 >= 1.0 || v21 < 1;
      int v50 = v49;
      if (v49)
      {
        v51 = 0;
        float v52 = v66;
      }
      else
      {
        char v53 = _areSetsBasicallyDuplicates(v6, v18);
        float v52 = v66;
        if (v53)
        {
          v51 = 0;
        }
        else
        {
          v54 = [(NSArray *)v18 arrayByAddingObjectsFromArray:v6];
          [v65 replaceObjectAtIndex:i withObject:v54];
          v51 = v54;

          v6 = v51;
        }
        [v65 removeObjectAtIndex:v21];
        v20 -= v21 < v20;
        --i;
      }
      if (v20 == v21) {
        int v55 = v50;
      }
      else {
        int v55 = 1;
      }
      if (v52 >= 1.0 || v20 < 1 || v55 == 0)
      {
        v58 = v51;
      }
      else
      {
        char v59 = _areSetsBasicallyDuplicates(v17, v6);
        if (v59)
        {
          v60 = v6;
        }
        else
        {
          v60 = [(NSArray *)v6 arrayByAddingObjectsFromArray:v17];
        }
        v58 = v60;

        unint64_t v61 = i + (v50 ^ 1u);
        [v65 replaceObjectAtIndex:v61 withObject:v58];
        [v65 removeObjectAtIndex:v20];
        unint64_t i = v61 - 1;
      }
    }
  }
}

- (void)_updatePath
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  [(VKFeatureAccessibilityElement *)self strokeWidth];
  if (v3 != 0.0)
  {
    if (!self->_expandedPaths)
    {
      id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      expandedPaths = self->_expandedPaths;
      self->_expandedPaths = v4;

      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      originalPaths = self->_originalPaths;
      self->_originalPaths = v6;

      double v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      gutterPaths = self->_gutterPaths;
      self->_gutterPaths = v8;
    }
    [(VKFeatureAccessibilityElement *)self setHitTestPaths:0];
    v77 = self;
    double v10 = [(VKFeatureAccessibilityElement *)self paths];
    [v10 removeAllObjects];

    [(NSMutableArray *)v77->_originalPaths removeAllObjects];
    [(NSMutableArray *)v77->_expandedPaths removeAllObjects];
    [(NSMutableArray *)v77->_gutterPaths removeAllObjects];
    CGPoint v69 = [MEMORY[0x263EFF980] array];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    double v11 = v77;
    NSUInteger v12 = [(VKFeatureAccessibilityElement *)v77 featureSet];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v99 objects:v104 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v100;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v100 != v14) {
            objc_enumerationMutation(v12);
          }
          double v16 = [(VKFeatureAccessibilityElement *)v11 pointsFromFeatureWrapper:*(void *)(*((void *)&v99 + 1) + 8 * i)];
          if ([v16 count]) {
            [v69 addObject:v16];
          }

          double v11 = v77;
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v99 objects:v104 count:16];
      }
      while (v13);
    }

    [(VKRoadFeatureAccessibilityElement *)v77 _combineRoadPaths:v69];
    uint64_t v17 = [(VKRoadFeatureAccessibilityElement *)v77 accessibilityContainer];
    [v17 accessibilityClearVisibleAXBoundsFrame];

    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id obj = v69;
    uint64_t v71 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
    if (v71)
    {
      uint64_t v70 = *(void *)v96;
      do
      {
        for (uint64_t j = 0; j != v71; ++j)
        {
          if (*(void *)v96 != v70) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v95 + 1) + 8 * j);
          unint64_t v19 = objc_opt_new();
          uint64_t v20 = objc_opt_new();
          CGPoint v72 = objc_opt_new();
          uint64_t v21 = objc_opt_new();
          uint64_t v22 = [v18 count];
          v23 = (const void *)AXCArrayCreate();
          double v24 = (const void *)AXCArrayCreate();
          CGFloat v25 = (const void *)AXCArrayCreate();
          v93[0] = 0;
          v93[1] = v93;
          v93[2] = 0x4012000000;
          v93[3] = __Block_byref_object_copy__581;
          v93[4] = __Block_byref_object_dispose__582;
          v93[5] = &unk_2426D40D2;
          long long v94 = *MEMORY[0x263F00148];
          [(VKFeatureAccessibilityElement *)v77 strokeWidth];
          float v27 = v26 + 4.0;
          v91[0] = 0;
          v91[1] = v91;
          v91[2] = 0x2020000000;
          char v92 = 0;
          v89[0] = 0;
          v89[1] = v89;
          v89[2] = 0x2020000000;
          char v90 = 0;
          v78[0] = MEMORY[0x263EF8330];
          v78[1] = 3221225472;
          v78[2] = __48__VKRoadFeatureAccessibilityElement__updatePath__block_invoke;
          v78[3] = &unk_265162A38;
          v80 = v93;
          v81 = v89;
          v78[4] = v77;
          v78[5] = v18;
          v82 = v91;
          uint64_t v83 = v22;
          id v28 = v72;
          float v87 = v27;
          uint64_t v88 = 0x4248000042960000;
          id v74 = v28;
          id v79 = v28;
          v84 = v23;
          v85 = v24;
          v86 = v25;
          [v18 enumerateObjectsUsingBlock:v78];
          uint64_t Count = AXCArrayGetCount();
          if (Count >= 1)
          {
            if (!AXCArrayGetCount())
            {
              uint64_t v66 = AXCArrayGetCount();
              unint64_t v67 = 0;
              id v65 = v23;
              _AXAssert();
            }
            UnderlyingArradouble y = (double *)_AXCArrayGetUnderlyingArray();
            objc_msgSend(v19, "moveToPoint:", *UnderlyingArray, UnderlyingArray[1]);
            if (!AXCArrayGetCount())
            {
              uint64_t v66 = AXCArrayGetCount();
              unint64_t v67 = 0;
              id v65 = v24;
              _AXAssert();
            }
            double v31 = (double *)_AXCArrayGetUnderlyingArray();
            objc_msgSend(v20, "moveToPoint:", *v31, v31[1]);
            if (!AXCArrayGetCount())
            {
              uint64_t v66 = AXCArrayGetCount();
              unint64_t v67 = 0;
              id v65 = v25;
              _AXAssert();
            }
            CGFloat v32 = (double *)_AXCArrayGetUnderlyingArray();
            objc_msgSend(v21, "moveToPoint:", *v32, v32[1]);
            if ((unint64_t)Count >= 2)
            {
              uint64_t v33 = 0;
              for (unint64_t k = 1; k != Count; ++k)
              {
                if (k >= AXCArrayGetCount())
                {
                  uint64_t v66 = AXCArrayGetCount();
                  unint64_t v67 = k;
                  id v65 = v23;
                  _AXAssert();
                }
                uint64_t v35 = _AXCArrayGetUnderlyingArray();
                objc_msgSend(v19, "addLineToPoint:", *(double *)(v35 + v33 + 32), *(double *)(v35 + v33 + 40));
                if (k >= AXCArrayGetCount())
                {
                  uint64_t v66 = AXCArrayGetCount();
                  unint64_t v67 = k;
                  id v65 = v24;
                  _AXAssert();
                }
                uint64_t v36 = _AXCArrayGetUnderlyingArray();
                objc_msgSend(v20, "addLineToPoint:", *(double *)(v36 + v33 + 32), *(double *)(v36 + v33 + 40));
                if (k >= AXCArrayGetCount())
                {
                  uint64_t v66 = AXCArrayGetCount();
                  unint64_t v67 = k;
                  id v65 = v25;
                  _AXAssert();
                }
                uint64_t v37 = _AXCArrayGetUnderlyingArray();
                objc_msgSend(v21, "addLineToPoint:", *(double *)(v37 + v33 + 32), *(double *)(v37 + v33 + 40));
                v33 += 32;
              }
            }
          }
          uint64_t v38 = AXCArrayGetCount();
          uint64_t v39 = 32 * v38 - 8;
          while (v38 > 0)
          {
            if (--v38 >= (unint64_t)AXCArrayGetCount())
            {
              uint64_t v66 = AXCArrayGetCount();
              unint64_t v67 = v38;
              id v65 = v23;
              _AXAssert();
            }
            uint64_t v40 = _AXCArrayGetUnderlyingArray();
            objc_msgSend(v19, "addLineToPoint:", *(double *)(v40 + v39 - 8), *(double *)(v40 + v39));
            if (v38 >= (unint64_t)AXCArrayGetCount())
            {
              uint64_t v66 = AXCArrayGetCount();
              unint64_t v67 = v38;
              id v65 = v24;
              _AXAssert();
            }
            uint64_t v41 = _AXCArrayGetUnderlyingArray();
            objc_msgSend(v20, "addLineToPoint:", *(double *)(v41 + v39 - 8), *(double *)(v41 + v39));
            if (v38 >= (unint64_t)AXCArrayGetCount())
            {
              uint64_t v66 = AXCArrayGetCount();
              unint64_t v67 = v38;
              id v65 = v25;
              _AXAssert();
            }
            uint64_t v42 = _AXCArrayGetUnderlyingArray();
            double v43 = *(double *)(v42 + v39 - 8);
            double v44 = *(double *)(v42 + v39);
            v39 -= 32;
            objc_msgSend(v21, "addLineToPoint:", v43, v44);
          }
          if (([v19 isEmpty] & 1) == 0) {
            [v19 closePath];
          }
          if ((objc_msgSend(v20, "isEmpty", v65, v66, v67) & 1) == 0) {
            [v20 closePath];
          }
          if (([v21 isEmpty] & 1) == 0) {
            [v21 closePath];
          }
          [v19 setFlatness:0.6];
          v45 = [(VKFeatureAccessibilityElement *)v77 paths];
          id v46 = v19;
          objc_msgSend(v45, "addObject:", objc_msgSend(v46, "CGPath"));

          v47 = v77->_expandedPaths;
          id v48 = v20;
          -[NSMutableArray addObject:](v47, "addObject:", [v48 CGPath]);
          BOOL v49 = v77->_originalPaths;
          id v75 = v74;
          -[NSMutableArray addObject:](v49, "addObject:", [v75 CGPath]);
          int v50 = v77->_gutterPaths;
          id v73 = v21;
          -[NSMutableArray addObject:](v50, "addObject:", [v73 CGPath]);
          id v51 = v46;
          PathBoundingBodouble x = CGPathGetPathBoundingBox((CGPathRef)[v51 CGPath]);
          double x = PathBoundingBox.origin.x;
          double y = PathBoundingBox.origin.y;
          double width = PathBoundingBox.size.width;
          double height = PathBoundingBox.size.height;
          [(VKRoadFeatureAccessibilityElement *)v77 accessibilityFrame];
          CGFloat v57 = v56;
          CGFloat v59 = v58;
          CGFloat v61 = v60;
          CGFloat v63 = v62;
          v109.origin.double x = v56;
          v109.origin.double y = v58;
          v109.size.double width = v60;
          v109.size.double height = v62;
          if (!CGRectEqualToRect(*MEMORY[0x263F001A8], v109))
          {
            v107.origin.double x = v57;
            v107.origin.double y = v59;
            v107.size.double width = v61;
            v107.size.double height = v63;
            v110.origin.double x = x;
            v110.origin.double y = y;
            v110.size.double width = width;
            v110.size.double height = height;
            CGRect v108 = CGRectUnion(v107, v110);
            double x = v108.origin.x;
            double y = v108.origin.y;
            double width = v108.size.width;
            double height = v108.size.height;
          }
          -[VKRoadFeatureAccessibilityElement setAccessibilityFrame:](v77, "setAccessibilityFrame:", x, y, width, height);
          if (v23) {
            CFRelease(v23);
          }
          if (v24) {
            CFRelease(v24);
          }
          if (v25) {
            CFRelease(v25);
          }

          _Block_object_dispose(v89, 8);
          _Block_object_dispose(v91, 8);
          _Block_object_dispose(v93, 8);
        }
        uint64_t v71 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
      }
      while (v71);
    }

    [(VKFeatureAccessibilityElement *)v77 _mergePaths];
    CGFloat v64 = [(VKRoadFeatureAccessibilityElement *)v77 accessibilityContainer];
    [v64 accessibilityClearVisibleAXBoundsFrame];
  }
}

void __48__VKRoadFeatureAccessibilityElement__updatePath__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 CGPointValue];
  double v8 = v7;
  double v9 = v6;
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(double *)(v10 + 48) == v7 && *(double *)(v10 + 56) == v6) {
    goto LABEL_43;
  }
  NSUInteger v12 = [*(id *)(a1 + 32) accessibilityContainer];
  char v13 = objc_msgSend(v12, "accessibilityViewBoundsContainsPathPoint:", v8, v9);

  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  if (v13)
  {
    *(unsigned char *)(v14 + 24) = 0;
LABEL_7:
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) || *(uint64_t *)(a1 + 80) < 2)
    {
      objc_msgSend(*(id *)(a1 + 48), "addLineToPoint:", v8, v9);
    }
    else
    {
      double v15 = [*(id *)(a1 + 40) objectAtIndex:1];
      [v15 CGPointValue];
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
      *(void *)(v16 + 48) = v17;
      *(void *)(v16 + 56) = v18;

      objc_msgSend(*(id *)(a1 + 48), "moveToPoint:", v8, v9);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
    double v73 = 0.0;
    double v74 = 0.0;
    v75.double x = v8;
    v75.double y = v9;
    AXVKMathGetVectorAndDistanceForPoints(&v74, &v73, *(CGPoint *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), v75);
    BOOL v19 = a3 == 0;
    double v20 = dbl_2426CBCC0[v19] + v74;
    if (v20 <= 360.0) {
      double v21 = dbl_2426CBCC0[v19] + v74;
    }
    else {
      double v21 = v20 + -360.0;
    }
    float v22 = v21 * 0.0174532924;
    __float2 v23 = __sincosf_stret(v22);
    float v24 = *(float *)(a1 + 112);
    float v25 = *(float *)(a1 + 116);
    v72[0] = v8 + (float)(v24 * v23.__cosval);
    v72[1] = v9 + (float)(v24 * v23.__sinval);
    double v60 = v9;
    v71[0] = v8 + (float)(v23.__cosval * v25);
    v71[1] = v9 + (float)(v23.__sinval * v25);
    double v26 = v8;
    float v27 = *(float *)(a1 + 120);
    v70[0] = v26 + (float)(v23.__cosval * v27);
    v70[1] = v60 + (float)(v23.__sinval * v27);
    double v28 = dbl_2426CBCD0[v19] + v21;
    if (v28 < 0.0) {
      double v28 = v28 + 360.0;
    }
    double v74 = v28;
    float v29 = v28 * 0.0174532924;
    __float2 v30 = __sincosf_stret(v29);
    v69[0] = v26 + (float)(v24 * v30.__cosval);
    v69[1] = v60 + (float)(v24 * v30.__sinval);
    v68[0] = v26 + (float)(v25 * v30.__cosval);
    v68[1] = v60 + (float)(v25 * v30.__sinval);
    v67[0] = v26 + (float)(v30.__cosval * v27);
    v67[1] = v60 + (float)(v30.__sinval * v27);
    if CGFloatIsValid() && (CGFloatIsValid()) {
      double v31 = v72;
    }
    else {
      double v31 = (double *)MEMORY[0x263F00148];
    }
    long long v65 = *(_OWORD *)v31;
    if CGFloatIsValid() && (CGFloatIsValid()) {
      CGFloat v32 = v69;
    }
    else {
      CGFloat v32 = (double *)MEMORY[0x263F00148];
    }
    long long v66 = *(_OWORD *)v32;
    if CGFloatIsValid() && (CGFloatIsValid()) {
      uint64_t v33 = v71;
    }
    else {
      uint64_t v33 = (double *)MEMORY[0x263F00148];
    }
    long long v63 = *(_OWORD *)v33;
    if CGFloatIsValid() && (CGFloatIsValid()) {
      v34 = v68;
    }
    else {
      v34 = (double *)MEMORY[0x263F00148];
    }
    long long v64 = *(_OWORD *)v34;
    if CGFloatIsValid() && (CGFloatIsValid()) {
      uint64_t v35 = v70;
    }
    else {
      uint64_t v35 = (double *)MEMORY[0x263F00148];
    }
    long long v61 = *(_OWORD *)v35;
    if CGFloatIsValid() && (CGFloatIsValid()) {
      uint64_t v36 = v67;
    }
    else {
      uint64_t v36 = (double *)MEMORY[0x263F00148];
    }
    long long v62 = *(_OWORD *)v36;
    uint64_t Count = AXCArrayGetCount();
    _AXCArrayPrepareForInsertingElementAtIndex();
    uint64_t v38 = (_OWORD *)(_AXCArrayGetUnderlyingArray() + 32 * Count);
    _OWORD *v38 = v65;
    v38[1] = v66;
    uint64_t v39 = AXCArrayGetCount();
    _AXCArrayPrepareForInsertingElementAtIndex();
    uint64_t v40 = (_OWORD *)(_AXCArrayGetUnderlyingArray() + 32 * v39);
    *uint64_t v40 = v63;
    v40[1] = v64;
    uint64_t v41 = AXCArrayGetCount();
    _AXCArrayPrepareForInsertingElementAtIndex();
    uint64_t v42 = (_OWORD *)(_AXCArrayGetUnderlyingArray() + 32 * v41);
    *uint64_t v42 = v61;
    v42[1] = v62;
    uint64_t v43 = *(void *)(*(void *)(a1 + 56) + 8);
    *(double *)(v43 + 48) = v26;
    *(double *)(v43 + 56) = v60;
    goto LABEL_43;
  }
  if (*(unsigned char *)(v14 + 24))
  {
    *(unsigned char *)(v14 + 24) = 1;
    goto LABEL_43;
  }
  double v44 = [*(id *)(a1 + 32) accessibilityContainer];
  [v44 accessibilityVisibleAXViewBounds];

  uint64_t v45 = *(void *)(*(void *)(a1 + 56) + 8);
  double v46 = *(double *)(v45 + 48);
  double v47 = *(double *)(v45 + 56);
  id v48 = (double *)MEMORY[0x263F00148];
  double v49 = *MEMORY[0x263F00148];
  double v50 = *(double *)(MEMORY[0x263F00148] + 8);
  BOOL v51 = *MEMORY[0x263F00148] == v46 && v50 == v47;
  if (v51 && objc_msgSend(*(id *)(a1 + 40), "count", v49, v50) - 1 > a3)
  {
    float v52 = [*(id *)(a1 + 40) objectAtIndex:a3 + 1];
    [v52 CGPointValue];
    double v46 = v53;
    double v47 = v54;
  }
  int v55 = objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer", v49, v50);
  char v56 = objc_msgSend(v55, "accessibilityViewBoundsContainsPathPoint:", v46, v47);

  if (v56)
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, v46, v47);
    CGPathAddLineToPoint(Mutable, 0, v8, v9);
    AX_CGPathGetIntersectionPointWithRect();
    if (v58 != 3.40282347e38 && (*v48 != v58 || v48[1] != v59))
    {
      double v9 = v59;
      double v8 = v58;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    CGPathRelease(Mutable);
    goto LABEL_7;
  }
LABEL_43:
}

- (id)accessibilityPaths
{
  float v3 = [(VKFeatureAccessibilityElement *)self paths];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [(VKRoadFeatureAccessibilityElement *)self _updatePath];
  }

  return [(VKFeatureAccessibilityElement *)self paths];
}

- (CGRect)accessibilityFrame
{
  float v3 = [(VKFeatureAccessibilityElement *)self paths];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [(VKRoadFeatureAccessibilityElement *)self _updatePath];
  }
  v18.receiver = self;
  v18.super_class = (Class)VKRoadFeatureAccessibilityElement;
  id v5 = [(VKRoadFeatureAccessibilityElement *)&v18 accessibilityUserDefinedFrame];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (float)_accessibilityDistance:(CGPoint)a3 forAngle:(float)a4 toRoad:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  double v10 = [(VKRoadFeatureAccessibilityElement *)self accessibilityContainer];
  *(float *)&double v11 = a4;
  objc_msgSend(v10, "accessibilityDistance:forAngle:toRoad:withElement:", v9, self, x, y, v11);
  float v13 = v12;

  return v13;
}

- (id)_accessibilityUpcomingRoadsForPoint:(CGPoint)a3 forAngle:(float)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [(VKRoadFeatureAccessibilityElement *)self accessibilityContainer];
  *(float *)&double v9 = a4;
  double v10 = objc_msgSend(v8, "accessibilityUpcomingRoadsForPoint:forAngle:withElement:", self, x, y, v9);

  return v10;
}

- (void)_accessibilityMapsExplorationBeginFromCurrentElement
{
  id v4 = [(VKRoadFeatureAccessibilityElement *)self accessibilityContainer];
  float v3 = [v4 accessibilityElementManager];
  [v3 accessibilityMapsExplorationBeginFromRoad:self];
}

- (NSArray)consolidatedAndOrderedFeatures
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  consolidatedAndOrderedFeatures = self->_consolidatedAndOrderedFeatures;
  if (consolidatedAndOrderedFeatures)
  {
    float v3 = consolidatedAndOrderedFeatures;
  }
  else
  {
    double v21 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = [(VKFeatureAccessibilityElement *)self featureSet];
    id obj = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v22 = *(void *)v29;
      do
      {
        uint64_t v23 = v6;
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          double v9 = [(VKFeatureAccessibilityElement *)self pointsFromFeatureWrapper:v8];
          double v10 = (void *)[v9 mutableCopy];

          if ([v10 count])
          {
            [v21 addObject:v10];
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v11 = v10;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v25;
              do
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v25 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * j);
                  double v16 = [(VKFeatureAccessibilityElement *)self pointToFeatureDict];
                  [v16 setObject:v8 forKey:v15];
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
              }
              while (v12);
            }
          }
        }
        id v5 = obj;
        uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v6);
    }

    double v17 = [(VKRoadFeatureAccessibilityElement *)self consolidatedAndOrderedFeaturesFromAllFeaturePoints:v21];
    objc_super v18 = self->_consolidatedAndOrderedFeatures;
    self->_consolidatedAndOrderedFeatures = v17;

    float v3 = self->_consolidatedAndOrderedFeatures;
  }

  return v3;
}

- (id)consolidatedAndOrderedFeaturesFromAllFeaturePoints:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v42 = (id)objc_opt_new();
LABEL_2:
  if (objc_msgSend(v43, "count", v42))
  {
    float v3 = [v43 firstObject];
    [v43 removeObject:v3];
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v5 = v43;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v7 = *(void *)v45;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v44 + 1) + 8 * v8);
        double v10 = [v3 firstObject];
        [v10 CGPointValue];
        double v12 = v11;
        double v14 = v13;

        uint64_t v15 = [v3 lastObject];
        [v15 CGPointValue];
        double v17 = v16;
        double v19 = v18;

        double v20 = [v9 firstObject];
        [v20 CGPointValue];
        double v22 = v21;
        double v24 = v23;

        long long v25 = [v9 lastObject];
        [v25 CGPointValue];
        double v27 = v26;
        double v29 = v28;

        if (v12 == v22 && v14 == v24)
        {
          long long v30 = [v3 reverseObjectEnumerator];
          long long v31 = [v30 allObjects];
          uint64_t v32 = [v31 mutableCopy];

          id v33 = v9;
          goto LABEL_14;
        }
        if (v12 == v27 && v14 == v29)
        {
          uint64_t v34 = [v3 reverseObjectEnumerator];
          uint64_t v35 = [v34 allObjects];
          uint64_t v32 = [v35 mutableCopy];

          uint64_t v36 = [v9 reverseObjectEnumerator];
          uint64_t v37 = [v36 allObjects];
          id v33 = (id)[v37 mutableCopy];

LABEL_14:
          float v3 = (void *)v32;
LABEL_15:
          [v33 removeObjectAtIndex:0];
          [v3 addObjectsFromArray:v33];
          [v4 addObject:v9];
          goto LABEL_16;
        }
        if (v17 == v22 && v19 == v24)
        {
          id v33 = v9;
          goto LABEL_15;
        }
        id v33 = 0;
        if (v17 == v27 && v19 == v29)
        {
          uint64_t v38 = [v9 reverseObjectEnumerator];
          uint64_t v39 = [v38 allObjects];
          id v33 = (id)[v39 mutableCopy];

          goto LABEL_15;
        }
LABEL_16:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v40 = [v5 countByEnumeratingWithState:&v44 objects:v48 count:16];
      uint64_t v6 = v40;
      if (!v40)
      {
LABEL_25:

        [v5 removeObjectsInArray:v4];
        [v42 addObject:v3];

        goto LABEL_2;
      }
    }
  }

  return v42;
}

- (AXVKFeaturePointIndices)featureAndPointIndicesForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(VKRoadFeatureAccessibilityElement *)self consolidatedAndOrderedFeatures];
  uint64_t v7 = [v6 count];
  if (v7 < 1)
  {
    uint64_t v9 = -1;
    uint64_t v11 = -1;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = -1;
    double v10 = 1.79769313e308;
    uint64_t v11 = -1;
    while (1)
    {
      double v12 = [v6 objectAtIndex:v8];
      uint64_t v13 = [v12 count];
      if (v13 >= 1) {
        break;
      }
LABEL_10:

      if (++v8 == v7) {
        goto LABEL_14;
      }
    }
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = [v12 objectAtIndex:v14];
      [v15 CGPointValue];
      double v17 = v16;
      double v19 = v18;

      if (vabdd_f64(x, v17) < 0.001 && vabdd_f64(y, v19) < 0.001) {
        break;
      }
      double v20 = [(VKRoadFeatureAccessibilityElement *)self accessibilityContainer];
      objc_msgSend(v20, "accessibilityRealDistanceBetweenPoint:screenPoint2:", x, y, v17, v19);
      double v22 = v21;

      if (v10 > v22)
      {
        uint64_t v11 = v8;
        uint64_t v9 = v14;
        double v10 = v22;
      }
      if (v13 == ++v14) {
        goto LABEL_10;
      }
    }

    uint64_t v9 = v14;
    uint64_t v11 = v8;
  }
LABEL_14:

  int64_t v23 = v11;
  int64_t v24 = v9;
  result.var1 = v24;
  result.var0 = v23;
  return result;
}

- (id)adjacentIntersectorsForPoint:(CGPoint)a3 isStart:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = -[VKRoadFeatureAccessibilityElement accessibilitySortedIntersectorsForPoint:](self, "accessibilitySortedIntersectorsForPoint:");
  uint64_t v9 = -[VKRoadFeatureAccessibilityElement accessibilityViableIntersectorsForPoint:fromSortedArray:isStart:](self, "accessibilityViableIntersectorsForPoint:fromSortedArray:isStart:", v8, v4, x, y);

  return v9;
}

- (id)accessibilitySortedIntersectorsForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(VKRoadFeatureAccessibilityElement *)self accessibilityContainer];
  uint64_t v7 = objc_msgSend(v6, "accessibilityIntersectorsForRoad:withPoint:", self, x, y);

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__VKRoadFeatureAccessibilityElement_accessibilitySortedIntersectorsForPoint___block_invoke;
  v10[3] = &unk_265162A60;
  v10[4] = self;
  *(double *)&v10[5] = x;
  *(double *)&v10[6] = y;
  uint64_t v8 = [v7 sortedArrayUsingComparator:v10];

  return v8;
}

uint64_t __77__VKRoadFeatureAccessibilityElement_accessibilitySortedIntersectorsForPoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isDeadEnd])
  {
    uint64_t v7 = 1;
  }
  else if ([v6 isDeadEnd])
  {
    uint64_t v7 = -1;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) accessibilityContainer];
    [v5 coordinates];
    objc_msgSend(v8, "accessibilityConvertCoordinateToWindow:");
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v6 coordinates];
    objc_msgSend(v8, "accessibilityConvertCoordinateToWindow:");
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    v19.double x = v10;
    v19.double y = v12;
    double DistanceBetweenPoints = AXVKMathGetDistanceBetweenPoints(*(CGPoint *)(a1 + 40), v19);
    v20.double x = v14;
    v20.double y = v16;
    if (DistanceBetweenPoints >= AXVKMathGetDistanceBetweenPoints(*(CGPoint *)(a1 + 40), v20)) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  return v7;
}

- (id)accessibilityViableIntersectorsForPoint:(CGPoint)a3 fromSortedArray:(id)a4 isStart:(BOOL)a5
{
  BOOL v33 = a5;
  double y = a3.y;
  double x = a3.x;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id obj = a4;
  uint64_t v8 = objc_opt_new();
  if ([obj count])
  {
    double v9 = objc_msgSend(obj, "subarrayWithRange:", !v33, objc_msgSend(obj, "count") - !v33);

    uint64_t v10 = -[VKRoadFeatureAccessibilityElement featureAndPointIndicesForPoint:](self, "featureAndPointIndicesForPoint:", x, y);
    uint64_t v12 = v11;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v9;
    uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v36;
      uint64_t v15 = -1;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(obj);
          }
          double v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          double v18 = [(VKRoadFeatureAccessibilityElement *)self accessibilityContainer];
          [v17 coordinates];
          objc_msgSend(v18, "accessibilityConvertCoordinateToWindow:");
          double v20 = v19;
          double v22 = v21;

          if ((vabdd_f64(x, v20) >= 0.001 || vabdd_f64(y, v22) >= 0.001)
            && -[VKRoadFeatureAccessibilityElement featureAndPointIndicesForPoint:](self, "featureAndPointIndicesForPoint:", v20, v22) == v10)
          {
            uint64_t v24 = v23;
            if ([v8 count] != 1 || (v15 <= v12 || v24 <= v12) && (v15 >= v12 || v24 >= v12))
            {
              [v8 addObject:v17];
              if (v33 && [v8 count] || objc_msgSend(v8, "count") == 2) {
                goto LABEL_22;
              }
              if ([v8 count] == 1)
              {
                long long v25 = [v8 firstObject];
                double v26 = [(VKRoadFeatureAccessibilityElement *)self accessibilityContainer];
                [v25 coordinates];
                objc_msgSend(v26, "accessibilityConvertCoordinateToWindow:");
                double v28 = v27;
                double v30 = v29;

                -[VKRoadFeatureAccessibilityElement featureAndPointIndicesForPoint:](self, "featureAndPointIndicesForPoint:", v28, v30);
                uint64_t v15 = v31;
              }
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v13);
    }
LABEL_22:
  }

  return v8;
}

- (float)_accessibilityDistanceFromEndOfRoad:(CGPoint)a3 forAngle:(float)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = [(VKRoadFeatureAccessibilityElement *)self accessibilityContainer];
  *(float *)&double v9 = a4;
  objc_msgSend(v8, "accessibilityDistanceToEndOfRoad:forAngle:withElement:", self, x, y, v9);
  float v11 = v10;

  return v11;
}

- (BOOL)_accessibilityRoadContainsTrackingPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v24 = *MEMORY[0x263EF8340];
  self->_lastHitTestNearBorder = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = self->_gutterPaths;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        v25.CGFloat x = x;
        v25.CGFloat y = y;
        if (CGPathContainsPoint(*(CGPathRef *)(*((void *)&v18 + 1) + 8 * i), 0, v25, 0))
        {
          LOBYTE(v10) = 1;
          goto LABEL_20;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_expandedPaths;
  uint64_t v10 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v6);
        }
        v26.CGFloat x = x;
        v26.CGFloat y = y;
        if (CGPathContainsPoint(*(CGPathRef *)(*((void *)&v14 + 1) + 8 * j), 0, v26, 0))
        {
          LOBYTE(v10) = 1;
          self->_lastHitTestNearBorder = 1;
          goto LABEL_20;
        }
      }
      uint64_t v10 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  return v10;
}

- (id)_nearestPOIsForPoint:(CGPoint)a3
{
  return 0;
}

- (id)_roadLength
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  float v3 = [(VKFeatureAccessibilityElement *)self featureSet];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    float v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(VKFeatureAccessibilityElement *)self pointsFromFeatureWrapper:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        double v9 = [(VKRoadFeatureAccessibilityElement *)self accessibilityContainer];
        uint64_t v10 = [v8 objectAtIndex:0];
        [v10 CGPointValue];
        double v12 = v11;
        double v14 = v13;
        long long v15 = [v8 lastObject];
        [v15 CGPointValue];
        objc_msgSend(v9, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v12, v14, v16, v17);
        LODWORD(v12) = v18;

        float v6 = v6 + *(float *)&v12;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }
  else
  {
    float v6 = 0.0;
  }

  long long v19 = [MEMORY[0x263EFF960] currentLocale];
  char v20 = objc_msgSend(v19, "_navigation_distanceUsesMetricSystem");

  if (v20)
  {
    long long v21 = AXVectorKitLocString(@"ROAD_DISTANCE_KM");
    float v22 = v6 / 1000.0;
  }
  else
  {
    long long v21 = AXVectorKitLocString(@"ROAD_DISTANCE_M");
    float v22 = v6 / 1609.344;
  }
  uint64_t v23 = objc_msgSend(NSString, "localizedStringWithFormat:", v21, v22);

  return v23;
}

- (id)detailedFeatureElementInfoAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  float v6 = -[VKRoadFeatureAccessibilityElement _nearestIntersectionForPoint:](self, "_nearestIntersectionForPoint:");
  uint64_t v7 = [(VKRoadFeatureAccessibilityElement *)self _roadLength];
  uint64_t v10 = -[VKRoadFeatureAccessibilityElement _nearestPOIsForPoint:](self, "_nearestPOIsForPoint:", x, y);
  uint64_t v8 = __UIAXStringForVariables();

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(VKRoadFeatureAccessibilityElement *)self accessibilityFrame];
  CGRect v20 = CGRectInset(v19, -40.0, -40.0);
  v20.origin.CGFloat x = v20.origin.x + -20.0;
  v20.origin.CGFloat y = v20.origin.y + -20.0;
  v18.CGFloat x = x;
  v18.CGFloat y = y;
  if (CGRectContainsPoint(v20, v18))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    float v6 = [(VKFeatureAccessibilityElement *)self paths];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          v17.CGFloat x = x;
          v17.CGFloat y = y;
          if (CGPathContainsPoint(*(CGPathRef *)(*((void *)&v11 + 1) + 8 * i), 0, v17, 0))
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)_nearestIntersectionForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v28 = *MEMORY[0x263EF8340];
  [(VKRoadFeatureAccessibilityElement *)self intersectingRoads];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  float v6 = (void *)[v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {
    uint64_t v7 = v5;
    goto LABEL_13;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v24;
  float v9 = 3.4028e38;
  do
  {
    for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      long long v12 = [v11 objectAtIndex:1];
      [v12 CGPointValue];
      CGFloat v14 = v13;
      CGFloat v16 = v15;

      v30.CGFloat x = x;
      v30.CGFloat y = y;
      v31.CGFloat x = v14;
      v31.CGFloat y = v16;
      double DistanceBetweenPoints = AXVKMathGetDistanceBetweenPoints(v30, v31);
      if (DistanceBetweenPoints < v9)
      {
        uint64_t v18 = [v11 objectAtIndex:0];

        float v9 = DistanceBetweenPoints;
        uint64_t v7 = (void *)v18;
      }
    }
    float v6 = (void *)[v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v6);

  if (v7)
  {
    CGRect v19 = NSString;
    CGRect v20 = AXVectorKitLocString(@"NEAREST_INTERSECTION");
    long long v21 = [v7 accessibilityLabel];
    float v6 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v21);

LABEL_13:
    goto LABEL_15;
  }
  float v6 = 0;
LABEL_15:

  return v6;
}

- (id)_roadDirectionDescription
{
  float v3 = [(VKRoadFeatureAccessibilityElement *)self roadDirection];

  if (v3) {
    goto LABEL_30;
  }
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = [(VKFeatureAccessibilityElement *)self featureSet];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __62__VKRoadFeatureAccessibilityElement__roadDirectionDescription__block_invoke;
  v31[3] = &unk_265162A88;
  v31[4] = self;
  id v6 = v4;
  id v32 = v6;
  [v5 enumerateObjectsUsingBlock:v31];

  uint64_t v7 = [(VKRoadFeatureAccessibilityElement *)self accessibilityContainer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    long long v21 = @"Access to the map view is required to compute road direction";
    LOBYTE(v20) = 1;
    _AXLogWithFacility();
    goto LABEL_29;
  }
  [v7 accessibilityYaw];
  if (v9 < 0.0) {
    double v9 = v9 + 360.0;
  }
  if (v9 < 0.0) {
    double v9 = v9 + 360.0;
  }
  uint64_t v23 = 0;
  long long v24 = (double *)&v23;
  uint64_t v25 = 0x5012000000;
  long long v26 = __Block_byref_object_copy__606;
  long long v27 = __Block_byref_object_dispose__607;
  uint64_t v28 = &unk_2426D40D2;
  long long v29 = 0u;
  long long v30 = 0u;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __62__VKRoadFeatureAccessibilityElement__roadDirectionDescription__block_invoke_609;
  v22[3] = &unk_265162AB0;
  *(double *)&v22[5] = v9;
  v22[4] = &v23;
  [v6 enumerateObjectsUsingBlock:v22];
  double v11 = v24[6];
  double v10 = v24[7];
  if (v11 <= v10) {
    double v12 = v24[7];
  }
  else {
    double v12 = v24[6];
  }
  double v14 = v24[8];
  double v13 = v24[9];
  if (v14 <= v13) {
    double v15 = v24[9];
  }
  else {
    double v15 = v24[8];
  }
  if (v12 <= v15) {
    double v12 = v15;
  }
  if (v12 / (v11 + v10 + v14 + v13) >= 0.75)
  {
    if (v11 == v12)
    {
      CGFloat v16 = AXVectorKitLocString(@"ROAD_DIRECTION_EW");
      [(VKRoadFeatureAccessibilityElement *)self setRoadDirection:v16];
LABEL_25:

      goto LABEL_26;
    }
    if (v10 == v12)
    {
      CGFloat v16 = AXVectorKitLocString(@"ROAD_DIRECTION_NS");
      [(VKRoadFeatureAccessibilityElement *)self setRoadDirection:v16];
      goto LABEL_25;
    }
    if (v14 == v12)
    {
      CGFloat v16 = AXVectorKitLocString(@"ROAD_DIRECTION_NE-SW");
      [(VKRoadFeatureAccessibilityElement *)self setRoadDirection:v16];
      goto LABEL_25;
    }
    if (v13 == v12)
    {
      CGFloat v16 = AXVectorKitLocString(@"ROAD_DIRECTION_NW-SE");
      [(VKRoadFeatureAccessibilityElement *)self setRoadDirection:v16];
      goto LABEL_25;
    }
  }
LABEL_26:
  CGPoint v17 = [(VKRoadFeatureAccessibilityElement *)self roadDirection];

  if (!v17) {
    [(VKRoadFeatureAccessibilityElement *)self setRoadDirection:&stru_26F81E868];
  }
  _Block_object_dispose(&v23, 8);
LABEL_29:

  if (isKindOfClass)
  {
LABEL_30:
    uint64_t v18 = [(VKRoadFeatureAccessibilityElement *)self roadDirection];
    goto LABEL_31;
  }
  uint64_t v18 = 0;
LABEL_31:

  return v18;
}

void __62__VKRoadFeatureAccessibilityElement__roadDirectionDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) pointsFromFeatureWrapper:a2];
  objc_msgSend(*(id *)(a1 + 40), "addObject:");
}

void __62__VKRoadFeatureAccessibilityElement__roadDirectionDescription__block_invoke_609(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 count] >= 2)
  {
    unint64_t v4 = [v3 count];
    if (v4)
    {
      uint64_t v5 = 0;
      double v23 = 330.0;
      do
      {
        id v6 = objc_msgSend(v3, "objectAtIndexedSubscript:", v5, *(void *)&v23);
        [v6 CGPointValue];
        CGFloat v8 = v7;
        double v10 = v9;
        uint64_t v11 = v5 + 1;

        if (v5 + 1 >= v4) {
          uint64_t v12 = v5 - 1;
        }
        else {
          uint64_t v12 = v5 + 1;
        }
        double v13 = [v3 objectAtIndexedSubscript:v12];
        [v13 CGPointValue];
        CGFloat v15 = v14;
        double v17 = v16;

        v26.CGFloat y = -v10;
        v27.CGFloat y = -v17;
        double v24 = 0.0;
        double v25 = 0.0;
        v26.CGFloat x = v8;
        v27.CGFloat x = v15;
        AXVKMathGetVectorAndDistanceForPoints(&v25, &v24, v26, v27);
        double v18 = *(double *)(a1 + 40) + 360.0 - v25 + dbl_2426CBC50[360.0 - v25 >= 270.0];
        if (v18 > 360.0) {
          double v18 = v18 + -360.0;
        }
        if (v18 <= 90.0 || v18 > 180.0)
        {
          if (v18 < 270.0 && v18 > 180.0) {
            double v18 = v18 + -180.0;
          }
        }
        else
        {
          double v18 = v18 + 180.0;
        }
        if ((v18 < 270.0 || v18 >= 300.0) && (v18 <= 60.0 || v18 > 90.0))
        {
          if (v18 > v23 && v18 <= 360.0 || (v18 >= 0.0 ? (BOOL v21 = v18 < 30.0) : (BOOL v21 = 0), v21))
          {
            uint64_t v20 = (long double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
          }
          else if (v18 < 30.0 || v18 > 60.0)
          {
            if (v18 < 300.0 || v18 > v23) {
              goto LABEL_23;
            }
            uint64_t v20 = (long double *)(*(void *)(*(void *)(a1 + 32) + 8) + 72);
          }
          else
          {
            uint64_t v20 = (long double *)(*(void *)(*(void *)(a1 + 32) + 8) + 64);
          }
        }
        else
        {
          uint64_t v20 = (long double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
        }
        *uint64_t v20 = v24 + *v20;
LABEL_23:
        uint64_t v5 = v11;
      }
      while (v4 != v11);
    }
  }
}

- (NSString)roadDirection
{
  return self->_roadDirection;
}

- (void)setRoadDirection:(id)a3
{
}

- (NSArray)intersectingRoads
{
  return self->_intersectingRoads;
}

- (void)setIntersectingRoads:(id)a3
{
}

- (int)travelDirection
{
  return self->_travelDirection;
}

- (void)setTravelDirection:(int)a3
{
  self->_travelDirection = a3;
}

- (void)setConsolidatedAndOrderedFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consolidatedAndOrderedFeatures, 0);
  objc_storeStrong((id *)&self->_intersectingRoads, 0);
  objc_storeStrong((id *)&self->_roadDirection, 0);
  objc_storeStrong((id *)&self->_allPoints, 0);
  objc_storeStrong((id *)&self->_originalPaths, 0);
  objc_storeStrong((id *)&self->_gutterPaths, 0);

  objc_storeStrong((id *)&self->_expandedPaths, 0);
}

@end