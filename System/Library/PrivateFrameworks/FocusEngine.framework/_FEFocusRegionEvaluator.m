@interface _FEFocusRegionEvaluator
+ (CGRect)frameForRegion:(id)a3 inCoordinateSpace:(id)a4;
+ (id)__regionsByEvaluatingOcclusionsForBaseRegions:(id)a3 occludingRegions:(id)a4 baseRegionsCanOccludeEachOther:(BOOL)a5 inSnapshot:(id)a6;
+ (id)_visibleSubregionsWhenRegion:(id)a3 occludedByRegion:(id)a4 inSnapshot:(id)a5;
+ (id)regionsByEvaluatingOcclusionsForRegions:(id)a3 inSnapshot:(id)a4;
+ (id)regionsByOccludingRegions:(id)a3 beneathRegions:(id)a4 inSnapshot:(id)a5;
+ (id)subregionFromRegion:(id)a3 withSnapshotFrame:(CGRect)a4 inSnapshot:(id)a5;
@end

@implementation _FEFocusRegionEvaluator

+ (id)subregionFromRegion:(id)a3 withSnapshotFrame:(CGRect)a4 inSnapshot:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  id v13 = a5;
  v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 22, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 23, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];

LABEL_3:
  v15 = [v14 coordinateSpace];
  v16 = objc_msgSend(v12, "_focusRegionWithAdjustedFrame:coordinateSpace:", v15, x, y, width, height);

  [v14 _trackSubregion:v16 forRegion:v12];
  return v16;
}

+ (CGRect)frameForRegion:(id)a3 inCoordinateSpace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 32, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 33, @"Invalid parameter not satisfying: %@", @"coordinateSpace" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_8;
  }
LABEL_3:
  v10 = [v7 regionCoordinateSpace];
  [v7 regionFrame];
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  if (v10 && v10 != v9)
  {
    objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v10, v11, v12, v13, v14);
    double v15 = v19;
    double v16 = v20;
    double v17 = v21;
    double v18 = v22;
  }

  double v23 = v15;
  double v24 = v16;
  double v25 = v17;
  double v26 = v18;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

+ (id)_visibleSubregionsWhenRegion:(id)a3 occludedByRegion:(id)a4 inSnapshot:(id)a5
{
  v88[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v58 = [MEMORY[0x263F08690] currentHandler];
    [v58 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 50, @"Invalid parameter not satisfying: %@", @"occludedRegion" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v59 = [MEMORY[0x263F08690] currentHandler];
  [v59 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 51, @"Invalid parameter not satisfying: %@", @"occludingRegion" object file lineNumber description];

LABEL_3:
  if (v9 == v10)
  {
    v60 = [MEMORY[0x263F08690] currentHandler];
    [v60 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 52, @"Invalid parameter not satisfying: %@", @"occludedRegion != occludingRegion" object file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
  }
  else if (v11)
  {
    goto LABEL_5;
  }
  v61 = [MEMORY[0x263F08690] currentHandler];
  [v61 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 53, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];

LABEL_5:
  [v11 snapshotFrameForRegion:v9];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  [v11 snapshotFrameForRegion:v10];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  v90.origin.CGFloat x = v13;
  CGFloat v86 = v17;
  double v87 = v15;
  v90.origin.CGFloat y = v15;
  v90.size.CGFloat width = v17;
  CGFloat rect = v19;
  v90.size.CGFloat height = v19;
  if (CGRectIsNull(v90)) {
    goto LABEL_29;
  }
  v91.origin.CGFloat x = v21;
  v91.origin.CGFloat y = v23;
  v91.size.CGFloat width = v25;
  v91.size.CGFloat height = v27;
  if (CGRectIsNull(v91)) {
    goto LABEL_29;
  }
  double v76 = v13;
  v92.origin.CGFloat x = v13;
  v92.size.CGFloat width = v17;
  v92.origin.CGFloat y = v15;
  v92.size.CGFloat height = v19;
  CGRect v93 = CGRectStandardize(v92);
  CGFloat x = v93.origin.x;
  CGFloat y = v93.origin.y;
  CGFloat width = v93.size.width;
  CGFloat height = v93.size.height;
  CGFloat v70 = v23;
  CGFloat v72 = v21;
  v93.origin.CGFloat x = v21;
  v93.origin.CGFloat y = v23;
  CGFloat v74 = v25;
  v93.size.CGFloat width = v25;
  v93.size.CGFloat height = v27;
  CGRect v94 = CGRectStandardize(v93);
  CGFloat v32 = v94.origin.x;
  CGFloat v33 = v94.origin.y;
  CGFloat v34 = v94.size.width;
  CGFloat v35 = v94.size.height;
  CGFloat v80 = y;
  CGFloat v82 = x;
  v94.origin.CGFloat x = x;
  v94.origin.CGFloat y = y;
  CGFloat v78 = width;
  v94.size.CGFloat width = width;
  CGFloat v36 = height;
  CGFloat v37 = v32;
  v94.size.CGFloat height = v36;
  CGFloat v38 = CGRectGetMinX(v94) + 0.0001;
  v95.origin.CGFloat x = v37;
  v95.origin.CGFloat y = v33;
  v95.size.CGFloat width = v34;
  v95.size.CGFloat height = v35;
  if (v38 <= CGRectGetMaxX(v95))
  {
    v96.origin.CGFloat y = v80;
    v96.origin.CGFloat x = x;
    v96.size.CGFloat width = v78;
    v96.size.CGFloat height = v36;
    CGFloat v40 = CGRectGetMaxX(v96) + -0.0001;
    v97.origin.CGFloat x = v37;
    v97.origin.CGFloat y = v33;
    v97.size.CGFloat width = v34;
    v97.size.CGFloat height = v35;
    BOOL v39 = v40 >= CGRectGetMinX(v97);
  }
  else
  {
    BOOL v39 = 0;
  }
  v98.origin.CGFloat y = v80;
  v98.origin.CGFloat x = x;
  v98.size.CGFloat width = v78;
  v98.size.CGFloat height = v36;
  CGFloat v41 = CGRectGetMinY(v98) + 0.0001;
  v99.origin.CGFloat x = v37;
  v99.origin.CGFloat y = v33;
  v99.size.CGFloat width = v34;
  v99.size.CGFloat height = v35;
  if (v41 > CGRectGetMaxY(v99)) {
    goto LABEL_29;
  }
  v100.origin.CGFloat y = v80;
  v100.origin.CGFloat x = v82;
  v100.size.CGFloat width = v78;
  v100.size.CGFloat height = v36;
  CGFloat v42 = CGRectGetMaxY(v100) + -0.0001;
  v101.origin.CGFloat x = v37;
  v101.origin.CGFloat y = v33;
  v101.size.CGFloat width = v34;
  v101.size.CGFloat height = v35;
  if (v42 < CGRectGetMinY(v101) || !v39)
  {
LABEL_29:
    v88[0] = v9;
    id v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:1];
  }
  else
  {
    id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
    v102.origin.CGFloat x = v76;
    v102.origin.CGFloat y = v87;
    v102.size.CGFloat width = v86;
    v102.size.CGFloat height = rect;
    v122.origin.CGFloat y = v70;
    v122.origin.CGFloat x = v72;
    v122.size.CGFloat width = v74;
    v122.size.CGFloat height = v27;
    CGRect v103 = CGRectIntersection(v102, v122);
    CGFloat v45 = v103.origin.x;
    CGFloat v46 = v103.origin.y;
    CGFloat v47 = v103.size.width;
    CGFloat v48 = v103.size.height;
    v123.origin.CGFloat x = v76;
    v123.origin.CGFloat y = v87;
    v123.size.CGFloat width = v86;
    v123.size.CGFloat height = rect;
    if (!CGRectEqualToRect(v103, v123))
    {
      v104.origin.CGFloat x = v45;
      v104.origin.CGFloat y = v46;
      v104.size.CGFloat width = v47;
      v104.size.CGFloat height = v48;
      double MinX = CGRectGetMinX(v104);
      v105.origin.CGFloat x = v76;
      v105.origin.CGFloat y = v87;
      v105.size.CGFloat width = v86;
      v105.size.CGFloat height = rect;
      double MinY = CGRectGetMinY(v105);
      v106.origin.CGFloat x = v45;
      v106.origin.CGFloat y = v46;
      v106.size.CGFloat width = v47;
      v106.size.CGFloat height = v48;
      double v77 = CGRectGetWidth(v106);
      v107.origin.CGFloat x = v45;
      v107.origin.CGFloat y = v46;
      v107.size.CGFloat width = v47;
      v107.size.CGFloat height = v48;
      double v71 = CGRectGetMinY(v107);
      v108.origin.CGFloat x = v76;
      v108.origin.CGFloat y = v87;
      v108.size.CGFloat width = v86;
      v108.size.CGFloat height = rect;
      double v68 = CGRectGetMinY(v108);
      v109.origin.CGFloat x = v45;
      v109.origin.CGFloat y = v46;
      v109.size.CGFloat width = v47;
      v109.size.CGFloat height = v48;
      CGFloat v49 = CGRectGetMinX(v109);
      v110.size.CGFloat height = rect;
      double v83 = v49;
      v110.origin.CGFloat x = v76;
      v110.origin.CGFloat y = v87;
      v110.size.CGFloat width = v86;
      double v81 = v83 - CGRectGetMinX(v110);
      v111.origin.CGFloat x = v76;
      v111.origin.CGFloat y = v87;
      v111.size.CGFloat width = v86;
      v111.size.CGFloat height = rect;
      double v79 = CGRectGetHeight(v111);
      v112.origin.CGFloat x = v45;
      v112.origin.CGFloat y = v46;
      v112.size.CGFloat width = v47;
      v112.size.CGFloat height = v48;
      double v67 = CGRectGetMinX(v112);
      v113.origin.CGFloat x = v45;
      v113.origin.CGFloat y = v46;
      v113.size.CGFloat width = v47;
      v113.size.CGFloat height = v48;
      double MaxY = CGRectGetMaxY(v113);
      v114.origin.CGFloat x = v45;
      v114.origin.CGFloat y = v46;
      v114.size.CGFloat width = v47;
      v114.size.CGFloat height = v48;
      double v84 = CGRectGetWidth(v114);
      v115.origin.CGFloat x = v76;
      v115.origin.CGFloat y = v87;
      v115.size.CGFloat width = v86;
      v115.size.CGFloat height = rect;
      double v73 = CGRectGetMaxY(v115);
      v116.origin.CGFloat x = v45;
      v116.origin.CGFloat y = v46;
      v116.size.CGFloat width = v47;
      v116.size.CGFloat height = v48;
      double v69 = CGRectGetMaxY(v116);
      v117.origin.CGFloat x = v45;
      v117.origin.CGFloat y = v46;
      v117.size.CGFloat width = v47;
      v117.size.CGFloat height = v48;
      double MaxX = CGRectGetMaxX(v117);
      v118.origin.CGFloat x = v76;
      v118.origin.CGFloat y = v87;
      v118.size.CGFloat width = v86;
      v118.size.CGFloat height = rect;
      double v62 = CGRectGetMinY(v118);
      v119.origin.CGFloat x = v76;
      v119.origin.CGFloat y = v87;
      v119.size.CGFloat width = v86;
      v119.size.CGFloat height = rect;
      double v75 = CGRectGetMaxX(v119);
      v120.origin.CGFloat x = v45;
      v120.origin.CGFloat y = v46;
      v120.size.CGFloat width = v47;
      v120.size.CGFloat height = v48;
      double v50 = CGRectGetMaxX(v120);
      v121.origin.CGFloat x = v76;
      v121.origin.CGFloat y = v87;
      v121.size.CGFloat width = v86;
      v121.size.CGFloat height = rect;
      double v51 = CGRectGetHeight(v121);
      if (v77 > 0.0 && v71 - v68 > 0.0)
      {
        v52 = objc_msgSend(a1, "subregionFromRegion:withSnapshotFrame:inSnapshot:", v9, v11, MinX, MinY, v77, v71 - v68);
        [v44 addObject:v52];
      }
      if (v81 > 0.0 && v79 > 0.0)
      {
        v53 = objc_msgSend(a1, "subregionFromRegion:withSnapshotFrame:inSnapshot:", v9, v11, v76, v87, v81, v79);
        [v44 addObject:v53];
      }
      double v54 = v75 - v50;
      if (v84 > 0.0 && v73 - v69 > 0.0)
      {
        v55 = objc_msgSend(a1, "subregionFromRegion:withSnapshotFrame:inSnapshot:", v9, v11, v67, MaxY, v84, v73 - v69);
        [v44 addObject:v55];
      }
      if (v54 > 0.0 && v51 > 0.0)
      {
        v56 = objc_msgSend(a1, "subregionFromRegion:withSnapshotFrame:inSnapshot:", v9, v11, MaxX, v62, v54, v51);
        [v44 addObject:v56];
      }
    }
    [v11 _trackOccludingRegion:v10 forRegion:v9];
  }

  return v44;
}

+ (id)__regionsByEvaluatingOcclusionsForBaseRegions:(id)a3 occludingRegions:(id)a4 baseRegionsCanOccludeEachOther:(BOOL)a5 inSnapshot:(id)a6
{
  BOOL v7 = a5;
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v11)
  {
    [MEMORY[0x263F08690] currentHandler];
    v46 = id v45 = v10;
    [v46 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 147, @"Invalid parameter not satisfying: %@", @"occludingRegions" object file lineNumber description];

    id v10 = v45;
  }
  CGFloat v47 = v10;
  if (v10)
  {
    uint64_t v13 = [v10 count];
    double v14 = v10;
    if (v13)
    {
      if ([v10 count] != 1 || (v15 = objc_msgSend(v11, "count"), double v14 = v10, v15))
      {
        uint64_t v16 = [MEMORY[0x263EFF980] array];
        CGFloat v17 = v10;
        id v18 = (id)v16;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        obuint64_t j = [v17 reverseObjectEnumerator];
        uint64_t v51 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
        if (!v51) {
          goto LABEL_42;
        }
        uint64_t v50 = *(void *)v61;
        int v49 = !v7;
        while (1)
        {
          for (uint64_t i = 0; i != v51; ++i)
          {
            if (*(void *)v61 != v50) {
              objc_enumerationMutation(obj);
            }
            double v54 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            uint64_t v20 = [v11 count];
            if (!v20)
            {
              int v36 = 0;
LABEL_36:
              [v18 insertObject:v54 atIndex:0];
              id v39 = 0;
              goto LABEL_37;
            }
            uint64_t v21 = v20;
            uint64_t v52 = i;
            double v22 = 0;
            BOOL v55 = 0;
            uint64_t v23 = 0;
            while (!v22)
            {
              id v24 = v54;
LABEL_18:
              CGFloat v25 = v24;
              double v26 = [v11 objectAtIndex:v23];
              CGFloat v27 = [v12 originalRegionForRegion:v25];
              v28 = [v12 originalRegionForRegion:v26];
              if ([v25 _canBeOccludedByRegionsAbove] && v27 != v28)
              {
                uint64_t v29 = [a1 _visibleSubregionsWhenRegion:v25 occludedByRegion:v26 inSnapshot:v12];
                v30 = v22;
                uint64_t v31 = v21;
                id v32 = v12;
                id v33 = v11;
                CGFloat v34 = (void *)v29;

                BOOL v55 = [v34 count] == 0;
                CGFloat v35 = v34;
                id v11 = v33;
                id v12 = v32;
                uint64_t v21 = v31;
                double v22 = v35;
              }
              ++v23;

              if (v21 == v23) {
                goto LABEL_27;
              }
            }
            if ([v22 count] == 1)
            {
              id v24 = [v22 firstObject];
              goto LABEL_18;
            }
            if (v55)
            {
              int v36 = 1;
              uint64_t i = v52;
              goto LABEL_28;
            }
            CGFloat v37 = (void *)[v11 mutableCopy];
            objc_msgSend(v37, "removeObjectsInRange:", 0, v23);
            uint64_t v38 = objc_msgSend(a1, "__regionsByEvaluatingOcclusionsForBaseRegions:occludingRegions:baseRegionsCanOccludeEachOther:inSnapshot:", v22, v37, 0, v12);

            BOOL v55 = 0;
            double v22 = (void *)v38;
LABEL_27:
            uint64_t i = v52;
            int v36 = v55;
            if (!v22) {
              goto LABEL_36;
            }
LABEL_28:
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v39 = v22;
            uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v64 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v57;
              do
              {
                for (uint64_t j = 0; j != v41; ++j)
                {
                  if (*(void *)v57 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  [v18 insertObject:*(void *)(*((void *)&v56 + 1) + 8 * j) atIndex:0];
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v56 objects:v64 count:16];
              }
              while (v41);
            }

LABEL_37:
            if (((v49 | v36) & 1) == 0 && [v54 _canOccludeRegionsBelow]) {
              [v11 insertObject:v54 atIndex:0];
            }
          }
          uint64_t v51 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
          if (!v51)
          {
LABEL_42:

            goto LABEL_45;
          }
        }
      }
    }
  }
  else
  {
    double v14 = (void *)MEMORY[0x263EFFA68];
  }
  id v18 = v14;
LABEL_45:

  return v18;
}

+ (id)regionsByEvaluatingOcclusionsForRegions:(id)a3 inSnapshot:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 214, @"Invalid parameter not satisfying: %@", @"regions" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  double v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 215, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];

LABEL_3:
  id v10 = [MEMORY[0x263EFF980] array];
  id v11 = objc_msgSend(a1, "__regionsByEvaluatingOcclusionsForBaseRegions:occludingRegions:baseRegionsCanOccludeEachOther:inSnapshot:", v7, v10, 1, v9);

  return v11;
}

+ (id)regionsByOccludingRegions:(id)a3 beneathRegions:(id)a4 inSnapshot:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 224, @"Invalid parameter not satisfying: %@", @"occludingRegions" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 223, @"Invalid parameter not satisfying: %@", @"regions" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  CGFloat v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"_FEFocusRegionEvaluator.m", 225, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];

LABEL_4:
  id v12 = (void *)[v10 mutableCopy];
  uint64_t v13 = objc_msgSend(a1, "__regionsByEvaluatingOcclusionsForBaseRegions:occludingRegions:baseRegionsCanOccludeEachOther:inSnapshot:", v9, v12, 0, v11);

  return v13;
}

@end