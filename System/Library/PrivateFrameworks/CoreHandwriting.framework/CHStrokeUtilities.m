@interface CHStrokeUtilities
+ (BOOL)isMatchingStrokeClassification:(int64_t)a3 scriptClassification:(int64_t)a4;
+ (BOOL)isPointEnumerationSupportedForStroke:(id)a3;
+ (BOOL)isScriptClassificationMath:(int64_t)a3;
+ (BOOL)isStroke:(id)a3 intersectingAnyPolygonInSet:(id)a4;
+ (BOOL)isStroke:(id)a3 intersectingPolygon:(id)a4;
+ (BOOL)isStrokeClassificationMath:(int64_t)a3;
+ (BOOL)isStrokeClassificationText:(int64_t)a3;
+ (BOOL)isStrokeClassificationTextOrMath:(int64_t)a3;
+ (BOOL)isStrokeGroup:(id)a3 inlineWithNextGroup:(id)a4;
+ (BOOL)linearScratchOutTestForPoints:(const void *)a3 direction:(const CGVector *)a4 origin:(const CGPoint *)a5 threshold:(float)a6 cutIndex:(int64_t *)a7;
+ (BOOL)linearScratchOutTestForPoints:(const void *)a3 threshold:(float)a4 cutIndex:(int64_t *)a5;
+ (CGRect)boundingBoxOfPoints:(const void *)a3 rotatedAroundPoint:(CGPoint)a4 byAngle:(double)a5;
+ (CGRect)boundsForStrokes:(id)a3;
+ (CGRect)unionStrokeBounds:(const void *)a3 aroundXPosition:(double)a4 usingOneSideStrokeCountLimit:(int64_t)a5;
+ (CGRect)unionStrokeBounds:(const void *)a3 usingStrokeCountLimit:(int64_t)a4 reverseOrder:(BOOL)a5;
+ (double)arcLengthForStroke:(id)a3;
+ (double)circumferenceRatioOfCircleFittedToPoints:(const void *)a3 circleCenter:(CGPoint *)a4 circleRadius:(double *)a5;
+ (double)distanceFromPoint:(CGPoint)a3 toRectangle:(CGRect)a4;
+ (double)distanceFromPoint:(CGPoint)a3 toSegmentFromPoint:(CGPoint)a4 toPoint:(CGPoint)a5;
+ (double)distanceFromPoint:(CGPoint)a3 toStroke:(id)a4 withStrokeProvider:(id)a5;
+ (double)distanceFromPoint:(CGPoint)a3 toStrokes:(id)a4 withStrokeProvider:(id)a5;
+ (double)distanceFromRectangle:(CGRect)a3 toRectangle:(CGRect)a4;
+ (double)durationOfStrokesInStrokeGroup:(id)a3 strokeProvider:(id)a4;
+ (double)horizontalDistanceBetweenRectangle:(CGRect)a3 rectangle:(CGRect)a4;
+ (double)horizontalOverlapOfIndividualStrokeBounds:(const void *)a3 otherStrokeBounds:(const void *)a4;
+ (double)lineOrientationForStrokePoints:(const void *)a3 error:(double *)a4;
+ (double)speedForFinalTimeRange:(double)a3 stroke:(id)a4;
+ (double)threePointsOrientationWithOrigin:(CGPoint)a3 pointA:(CGPoint)a4 pointB:(CGPoint)a5;
+ (double)vectorMeanWithoutOutliers:(void *)a3;
+ (double)verticalDistanceBetweenRectangle:(CGRect)a3 rectangle:(CGRect)a4;
+ (id)createDrawingForStrokeIdentifiers:(id)a3 strokeProvider:(id)a4 interpolationType:(int64_t)a5 resolution:(int64_t)a6 cancellationBlock:(id)a7;
+ (id)createDrawingForStrokes:(id)a3 interpolationType:(int64_t)a4 resolution:(int64_t)a5 cancellationBlock:(id)a6;
+ (id)defaultScriptClassificationDictionary;
+ (id)encodedStrokeIdentifiers:(id)a3 withStrokeProvider:(id)a4;
+ (id)encodedStrokeIdentifiersFromStrokes:(id)a3 withStrokeProvider:(id)a4 shouldCancel:(id)a5;
+ (id)polygonForStrokes:(id)a3;
+ (id)polygonSetForScratchOutStroke:(id)a3;
+ (id)scriptClassificationClasses;
+ (id)sortedStrokesForIdentifiers:(id)a3 inStrokeProvider:(id)a4;
+ (id)strokeForIdentifier:(id)a3 inStrokeProvider:(id)a4;
+ (id)strokeIdentifiersByStrokeClusterPolygonsFromStrokeBounds:(id)a3 strokes:(id)a4;
+ (id)strokeIdentifiersForData:(id)a3 withStrokeProvider:(id)a4;
+ (id)strokesForIdentifiers:(id)a3 inStrokeProvider:(id)a4;
+ (id)strokesIntersectingPolygons:(id)a3 fromStrokes:(id)a4 intersectedPolygons:(id *)a5;
+ (int64_t)minRectangleDistanceFromStrokes:(id)a3 toPolygons:(id)a4;
+ (vector<CGPoint,)convexHullForPoints:()vector<CGPoint;
+ (vector<CGPoint,)convexHullForStroke:(id)a2;
+ (vector<CGPoint,)convexHullForStrokes:(id)a2;
+ (vector<CGPoint,)convexHullForStrokes:(id)a2 inDrawing:(SEL)a3;
+ (vector<CGPoint,)enlargedConvexHull:()vector<CGPoint withMargin:(std:(SEL)a3 :(const void *)a4 allocator<CGPoint>> *)result;
+ (vector<CGPoint,)regularizedPathFromPoints:()vector<CGPoint delta:(std:(SEL)a3 :(const void *)a4 allocator<CGPoint>> *)result gamma:(double)a5 outError:(double)a6;
+ (vector<CGRect,)horizontallyOverlappedChunks:(id)a2;
+ (vector<_NSRange,)segmentationRangesForScratchOutPoints:(id)a2;
+ (vector<float,)projectionForPoints:(id)a2 direction:(SEL)a3 origin:(const void *)a4;
+ (void)enumeratePointsForStroke:(id)a3 interpolationType:(int64_t)a4 resolution:(int64_t)a5 usingBlock:(id)a6;
+ (void)getAddedStrokes:(id *)a3 removedStrokeIdentifiers:(id *)a4 inStrokeProvider:(id)a5 lastGroupingResult:(id)a6 shouldCancel:(id)a7;
+ (void)principalComponentsForPoints:(const void *)a3 outFirstComponent:(CGVector *)a4 outSecondComponent:(CGVector *)a5 outMeanPoint:(CGPoint *)a6;
@end

@implementation CHStrokeUtilities

+ (void)getAddedStrokes:(id *)a3 removedStrokeIdentifiers:(id *)a4 inStrokeProvider:(id)a5 lastGroupingResult:(id)a6 shouldCancel:(id)a7
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v131 = a6;
  v132 = (uint64_t (**)(void))a7;
  if (!v9)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v15 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v15, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
    }
  }
  v129 = v9;
  v130 = objc_msgSend_orderedStrokes(v9, v10, v11, v12, v13, v14, a4);
  v21 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v16, v17, v18, v19, v20);
  objc_msgSend_set(MEMORY[0x1E4F1CA80], v22, v23, v24, v25, v26);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  v33 = objc_msgSend_strokeGroups(v131, v28, v29, v30, v31, v32);
  uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v139, (uint64_t)v148, 16, v35);
  if (v41)
  {
    uint64_t v42 = *(void *)v140;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v140 != v42) {
          objc_enumerationMutation(v33);
        }
        v44 = objc_msgSend_strokeIdentifiers(*(void **)(*((void *)&v139 + 1) + 8 * i), v36, v37, v38, v39, v40);
        objc_msgSend_unionSet_(v27, v45, (uint64_t)v44, v46, v47, v48);
      }
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v139, (uint64_t)v148, 16, v40);
    }
    while (v41);
  }

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v49 = v130;
  uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v135, (uint64_t)v147, 16, v51);
  if (v57)
  {
    uint64_t v58 = *(void *)v136;
    if (v132)
    {
      while (2)
      {
        for (uint64_t j = 0; j != v57; ++j)
        {
          if (*(void *)v136 != v58) {
            objc_enumerationMutation(v49);
          }
          v60 = *(void **)(*((void *)&v135 + 1) + 8 * j);
          v61 = objc_msgSend_encodedStrokeIdentifier(v60, v52, v53, v54, v55, v56);
          if (objc_msgSend_containsObject_(v27, v62, (uint64_t)v61, v63, v64, v65)) {
            objc_msgSend_removeObject_(v27, v66, (uint64_t)v61, v67, v68, v69);
          }
          else {
            objc_msgSend_addObject_(v21, v66, (uint64_t)v60, v67, v68, v69);
          }
          if (__ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend_count(v21, v70, v71, v72, v73, v74), 2) <= 0x28F5C28F5C28F5CuLL
            && (v132[2]() & 1) != 0)
          {

            id v27 = 0;
            goto LABEL_52;
          }
        }
        uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v135, (uint64_t)v147, 16, v56);
        if (v57) {
          continue;
        }
        break;
      }
    }
    else
    {
      do
      {
        for (uint64_t k = 0; k != v57; ++k)
        {
          if (*(void *)v136 != v58) {
            objc_enumerationMutation(v49);
          }
          v76 = *(void **)(*((void *)&v135 + 1) + 8 * k);
          v77 = objc_msgSend_encodedStrokeIdentifier(v76, v52, v53, v54, v55, v56);
          if (objc_msgSend_containsObject_(v27, v78, (uint64_t)v77, v79, v80, v81)) {
            objc_msgSend_removeObject_(v27, v82, (uint64_t)v77, v83, v84, v85);
          }
          else {
            objc_msgSend_addObject_(v21, v82, (uint64_t)v76, v83, v84, v85);
          }
          objc_msgSend_count(v21, v86, v87, v88, v89, v90);
        }
        uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v135, (uint64_t)v147, 16, v56);
      }
      while (v57);
    }
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v91 = (id)qword_1EA3C9FA8;
  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v97 = objc_msgSend_count(v21, v92, v93, v94, v95, v96);
    uint64_t v103 = objc_msgSend_count(v27, v98, v99, v100, v101, v102);
    *(_DWORD *)buf = 134218240;
    uint64_t v144 = v97;
    __int16 v145 = 2048;
    uint64_t v146 = v103;
    _os_log_impl(&dword_1C492D000, v91, OS_LOG_TYPE_DEBUG, "  Stroke provider change added %ld strokes, removed %ld strokes.", buf, 0x16u);
  }

  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = sub_1C49ACBD8;
  v133[3] = &unk_1E64E1840;
  v104 = v132;
  v134 = v104;
  v114 = objc_msgSend_indexesOfObjectsPassingTest_(v21, v105, (uint64_t)v133, v106, v107, v108);
  if (v104 && (((uint64_t (*)(uint64_t (**)(void)))v104[2])(v104) & 1) != 0)
  {

    goto LABEL_52;
  }
  if (objc_msgSend_count(v114, v109, v110, v111, v112, v113))
  {
    objc_msgSend_removeObjectsAtIndexes_(v21, v115, (uint64_t)v114, v116, v117, v118);
    if (qword_1EA3CA000 == -1)
    {
      v119 = (id)qword_1EA3C9FA8;
      if (!os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
      {
LABEL_46:

        goto LABEL_47;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v119 = (id)qword_1EA3C9FA8;
      if (!os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_46;
      }
    }
    uint64_t v125 = objc_msgSend_count(v114, v120, v121, v122, v123, v124);
    *(_DWORD *)buf = 134217984;
    uint64_t v144 = v125;
    _os_log_impl(&dword_1C492D000, v119, OS_LOG_TYPE_DEBUG, "  Ignoring %ld added strokes that cannot enumerate their points.", buf, 0xCu);
    goto LABEL_46;
  }
LABEL_47:

  if (a3) {
    *a3 = v21;
  }
  if (v127)
  {
    id v27 = v27;
    void *v127 = v27;
  }
LABEL_52:
}

+ (id)strokeForIdentifier:(id)a3 inStrokeProvider:(id)a4
{
  id v5 = a4;
  v10 = objc_msgSend_strokeIdentifierFromData_(v5, v6, (uint64_t)a3, v7, v8, v9);
  v15 = objc_msgSend_strokeForIdentifier_(v5, v11, (uint64_t)v10, v12, v13, v14);

  return v15;
}

+ (id)strokesForIdentifiers:(id)a3 inStrokeProvider:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v13 = objc_msgSend_count(v5, v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_arrayWithCapacity_(v7, v14, v13, v15, v16, v17);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v19 = v5;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v46, (uint64_t)v54, 16, v21);
  if (v22)
  {
    uint64_t v23 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v26 = objc_opt_class();
        v34 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v26, v27, v25, (uint64_t)v6, v28, v29, (void)v46);
        if (!v34)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v38 = (id)qword_1EA3C9FA0;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v44 = objc_msgSend_strokeProviderVersion(v6, v39, v40, v41, v42, v43);
            *(_DWORD *)buf = 138412546;
            uint64_t v51 = v25;
            __int16 v52 = 2112;
            uint64_t v53 = v44;
            _os_log_impl(&dword_1C492D000, v38, OS_LOG_TYPE_ERROR, "Failed to get stroke with id: %@ from stroke provider version %@, return empty group instead.", buf, 0x16u);
          }
          id v37 = (id)MEMORY[0x1E4F1CBF0];
          goto LABEL_15;
        }
        objc_msgSend_addObject_(v18, v30, (uint64_t)v34, v31, v32, v33);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v35, (uint64_t)&v46, (uint64_t)v54, 16, v36);
      if (v22) {
        continue;
      }
      break;
    }
  }

  id v37 = v18;
LABEL_15:

  return v37;
}

+ (id)sortedStrokesForIdentifiers:(id)a3 inStrokeProvider:(id)a4
{
  id v5 = a4;
  uint64_t v11 = objc_msgSend_allObjects(a3, v6, v7, v8, v9, v10);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1C49AD0F8;
  v23[3] = &unk_1E64E1868;
  id v12 = v5;
  id v24 = v12;
  uint64_t v17 = objc_msgSend_sortedArrayUsingComparator_(v11, v13, (uint64_t)v23, v14, v15, v16);

  uint64_t v21 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v18, (uint64_t)v17, (uint64_t)v12, v19, v20);

  return v21;
}

+ (id)strokeIdentifiersForData:(id)a3 withStrokeProvider:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v12 = v6;
  uint64_t v13 = 0;
  if (v5 && v6)
  {
    uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v14 = v5;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v44, (uint64_t)v50, 16, v16);
    if (v21)
    {
      uint64_t v22 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v14);
          }
          id v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v25 = objc_msgSend_strokeIdentifierFromData_(v12, v17, (uint64_t)v24, v18, v19, v20, (void)v44);
          if (!v25
            || (objc_opt_respondsToSelector() & 1) != 0
            && !objc_msgSend_isValidStrokeIdentifier_(v12, v26, (uint64_t)v25, v27, v28, v29))
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            uint64_t v30 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = objc_msgSend_encodedStrokeIdentifier(v24, v31, v32, v33, v34, v35);
              uint64_t v42 = objc_msgSend_description(v36, v37, v38, v39, v40, v41);
              *(_DWORD *)buf = 138412290;
              long long v49 = v42;
              _os_log_impl(&dword_1C492D000, v30, OS_LOG_TYPE_ERROR, "retrieving stroke identifier gave nil or invalid result. Encoded stroke identifier: %@", buf, 0xCu);
            }
            uint64_t v13 = 0;
            goto LABEL_19;
          }
          objc_msgSend_addObject_(v13, v26, (uint64_t)v25, v27, v28, v29);
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v44, (uint64_t)v50, 16, v20);
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  return v13;
}

+ (id)encodedStrokeIdentifiers:(id)a3 withStrokeProvider:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  if (v5 && v6)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = v5;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v29, (uint64_t)v33, 16, v15);
    if (v20)
    {
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v13);
          }
          uint64_t v23 = objc_msgSend_encodedStrokeIdentifier_(v6, v16, *(void *)(*((void *)&v29 + 1) + 8 * i), v17, v18, v19, (void)v29);
          objc_msgSend_addObject_(v12, v24, (uint64_t)v23, v25, v26, v27);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v29, (uint64_t)v33, 16, v19);
      }
      while (v20);
    }
  }
  return v12;
}

+ (id)encodedStrokeIdentifiersFromStrokes:(id)a3 withStrokeProvider:(id)a4 shouldCancel:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v61 = (uint64_t (**)(void))a5;
  id v14 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12, v13);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v15 = v7;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v62, (uint64_t)v66, 16, v17);
  if (v23)
  {
    uint64_t v24 = *(void *)v63;
    if (v61)
    {
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v63 != v24) {
            objc_enumerationMutation(v15);
          }
          uint64_t v26 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          if (__ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend_count(v14, v18, v19, v20, v21, v22), 2) <= 0x28F5C28F5C28F5CuLL
            && (v61[2]() & 1) != 0)
          {

            id v59 = 0;
            goto LABEL_18;
          }
          long long v32 = objc_msgSend_strokeIdentifier(v26, v27, v28, v29, v30, v31);
          id v37 = objc_msgSend_encodedStrokeIdentifier_(v8, v33, (uint64_t)v32, v34, v35, v36);

          objc_msgSend_addObject_(v14, v38, (uint64_t)v37, v39, v40, v41);
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v62, (uint64_t)v66, 16, v22);
        if (v23) {
          continue;
        }
        break;
      }
    }
    else
    {
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v63 != v24) {
            objc_enumerationMutation(v15);
          }
          uint64_t v43 = *(void **)(*((void *)&v62 + 1) + 8 * j);
          objc_msgSend_count(v14, v18, v19, v20, v21, v22);
          long long v49 = objc_msgSend_strokeIdentifier(v43, v44, v45, v46, v47, v48);
          uint64_t v54 = objc_msgSend_encodedStrokeIdentifier_(v8, v50, (uint64_t)v49, v51, v52, v53);

          objc_msgSend_addObject_(v14, v55, (uint64_t)v54, v56, v57, v58);
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v62, (uint64_t)v66, 16, v22);
      }
      while (v23);
    }
  }

  id v59 = v14;
LABEL_18:

  return v59;
}

+ (double)distanceFromPoint:(CGPoint)a3 toStroke:(id)a4 withStrokeProvider:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a5;
  uint64_t v13 = objc_msgSend_strokeIdentifierFromData_(v8, v9, (uint64_t)a4, v10, v11, v12);
  uint64_t v18 = objc_msgSend_strokeForIdentifier_(v8, v14, (uint64_t)v13, v15, v16, v17);
  objc_msgSend_bounds(v18, v19, v20, v21, v22, v23);
  double MidX = CGRectGetMidX(v33);
  objc_msgSend_bounds(v18, v25, v26, v27, v28, v29);
  CGFloat MidY = CGRectGetMidY(v34);
  double v31 = sqrt((y - MidY) * (y - MidY) + (x - MidX) * (x - MidX));

  return v31;
}

+ (double)distanceFromPoint:(CGPoint)a3 toStrokes:(id)a4 withStrokeProvider:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v8;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v22, (uint64_t)v26, 16, v12);
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    double v18 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend_distanceFromPoint_toStroke_withStrokeProvider_(CHStrokeUtilities, v13, *(void *)(*((void *)&v22 + 1) + 8 * i), (uint64_t)v9, v14, v15, x, y, (void)v22);
        if (v20 < v18) {
          double v18 = v20;
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v22, (uint64_t)v26, 16, v15);
    }
    while (v16);
  }
  else
  {
    double v18 = 1.79769313e308;
  }

  return v18;
}

+ (void)enumeratePointsForStroke:(id)a3 interpolationType:(int64_t)a4 resolution:(int64_t)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if (!v9)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v12 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v12, OS_LOG_TYPE_ERROR, "Unexpected nil stroke passed to enumeration method. Skipping.", buf, 2u);
    }
    goto LABEL_25;
  }
  if (!a4) {
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    if (objc_opt_respondsToSelector())
    {
      if ((unint64_t)a5 >= 3)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v19 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_FAULT, "timestep must be > 0", buf, 2u);
        }

        double v11 = 0.0;
      }
      else
      {
        double v11 = dbl_1C4C3A6C8[a5];
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = sub_1C49ADE9C;
      v24[3] = &unk_1E64E1890;
      long long v25 = v10;
      objc_msgSend_enumeratePointsWithDistanceStep_usingBlock_(v9, v20, (uint64_t)v24, v21, v22, v23, v11);
      uint64_t v12 = v25;
LABEL_25:

      goto LABEL_26;
    }
LABEL_11:
    if ((unint64_t)a5 >= 3)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v14 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_FAULT, "timestep must be > 0", buf, 2u);
      }

      double v13 = 0.0;
    }
    else
    {
      double v13 = dbl_1C4C3A6B0[a5];
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1C49ADE8C;
    v26[3] = &unk_1E64E1890;
    uint64_t v27 = v10;
    objc_msgSend_enumeratePointsWithTimestep_usingBlock_(v9, v15, (uint64_t)v26, v16, v17, v18, v13);
    uint64_t v12 = v27;
    goto LABEL_25;
  }
LABEL_26:
}

+ (BOOL)isPointEnumerationSupportedForStroke:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v4 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C49ADF98;
  v8[3] = &unk_1E64E18B8;
  v8[4] = &v9;
  objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v4, v5, (uint64_t)v3, 0, 1, (uint64_t)v8);
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (double)durationOfStrokesInStrokeGroup:(id)a3 strokeProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v12 = objc_msgSend_firstStrokeIdentifier(v5, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_lastStrokeIdentifier(v5, v13, v14, v15, v16, v17);
  uint64_t v23 = (void *)v18;
  long long v24 = 0;
  double v25 = 0.0;
  if (v12 && v18)
  {
    uint64_t v26 = objc_msgSend_strokeIdentifierFromData_(v6, v19, (uint64_t)v12, v20, v21, v22);
    uint64_t v31 = objc_msgSend_strokeIdentifierFromData_(v6, v27, (uint64_t)v23, v28, v29, v30);
    uint64_t v36 = (void *)v31;
    id v37 = 0;
    long long v24 = 0;
    if (v26 && v31)
    {
      long long v24 = objc_msgSend_strokeForIdentifier_(v6, v32, (uint64_t)v26, v33, v34, v35);
      id v37 = objc_msgSend_strokeForIdentifier_(v6, v38, (uint64_t)v36, v39, v40, v41);
    }

    if (v24 && v37)
    {
      objc_msgSend_endTimestamp(v37, v42, v43, v44, v45, v46);
      double v48 = v47;
      objc_msgSend_startTimestamp(v24, v49, v50, v51, v52, v53);
      double v25 = v48 - v54;
    }
  }
  else
  {
    id v37 = 0;
  }

  return v25;
}

+ (double)speedForFinalTimeRange:(double)a3 stroke:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = vcvtpd_s64_f64(a3 * 120.0);
  uint64_t v5 = MEMORY[0x1F4188790](a4);
  id v7 = (char *)&v26 - v6;
  uint64_t v8 = (void *)MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v26 - v9;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C49AE424;
  v28[3] = &unk_1E64E18E0;
  v28[4] = &v29;
  v28[5] = v4;
  v28[6] = v7;
  v28[7] = (char *)&v26 - v9;
  objc_msgSend_enumeratePointsWithTimestep_usingBlock_(v8, v11, (uint64_t)v28, v12, v13, v14, 0.00833333333);
  uint64_t v15 = v30[3];
  double v16 = -1.0;
  if (v15 >= v4)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1C49AE460;
    v27[3] = &unk_1E64E1900;
    v27[4] = v15 % v4;
    v27[5] = v4;
    uint64_t v17 = (uint64_t (**)(void, void))MEMORY[0x1C8786E90](v27);
    double v18 = 0.0;
    if (v4 >= 2)
    {
      for (uint64_t i = 1; i != v4; uint64_t i = v20 + 2)
      {
        float64x2_t v26 = *(float64x2_t *)&v7[16 * v17[2](v17, i)];
        uint64_t v20 = i - 1;
        uint64_t v21 = v17[2](v17, v20);
        float32x2_t v22 = vsub_f32(vcvt_f32_f64(v26), vcvt_f32_f64(*(float64x2_t *)&v7[16 * v21]));
        double v18 = v18 + sqrtf(vaddv_f32(vmul_f32(v22, v22)));
      }
    }
    double v23 = *(double *)&v10[8 * v17[2](v17, 0)];
    double v24 = *(double *)&v10[8 * v17[2](v17, v4 - 1)] - v23;
    if (v24 <= 0.0) {
      double v16 = -1.0;
    }
    else {
      double v16 = v18 / v24;
    }
  }
  _Block_object_dispose(&v29, 8);
  return v16;
}

+ (double)arcLengthForStroke:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4012000000;
  v11[3] = sub_1C49AE608;
  v11[4] = nullsub_10;
  v11[5] = &unk_1C4CB5C62;
  long long v12 = *MEMORY[0x1E4F1DAD8];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C49AE618;
  v8[3] = &unk_1E64E1928;
  v8[4] = v9;
  void v8[5] = &v13;
  v8[6] = v11;
  objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v4, v5, (uint64_t)v3, 0, 1, (uint64_t)v8);
  double v6 = v14[3];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

+ (CGRect)boundsForStrokes:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v3;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, (uint64_t)v31, 16, v10);
  if (v16)
  {
    uint64_t v17 = *(void *)v28;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_bounds(*(void **)(*((void *)&v27 + 1) + 8 * v18), v11, v12, v13, v14, v15, (void)v27);
        v36.origin.CGFloat x = v19;
        v36.origin.CGFloat y = v20;
        v36.size.CGFloat width = v21;
        v36.size.CGFloat height = v22;
        v33.origin.CGFloat x = x;
        v33.origin.CGFloat y = y;
        v33.size.CGFloat width = width;
        v33.size.CGFloat height = height;
        CGRect v34 = CGRectUnion(v33, v36);
        CGFloat x = v34.origin.x;
        CGFloat y = v34.origin.y;
        CGFloat width = v34.size.width;
        CGFloat height = v34.size.height;
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v27, (uint64_t)v31, 16, v15);
    }
    while (v16);
  }

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

+ (CGRect)boundingBoxOfPoints:(const void *)a3 rotatedAroundPoint:(CGPoint)a4 byAngle:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  float v8 = a5;
  __float2 v9 = __sincosf_stret(v8);
  uint64_t v10 = *((void *)a3 + 1) - *(void *)a3;
  if (v10)
  {
    double cosval = v9.__cosval;
    double sinval = v9.__sinval;
    unint64_t v13 = v10 >> 4;
    if (v13 <= 1) {
      unint64_t v13 = 1;
    }
    uint64_t v14 = (double *)(*(void *)a3 + 8);
    double v15 = 1.79769313e308;
    double v16 = -1.79769313e308;
    double v17 = -1.79769313e308;
    double v18 = 1.79769313e308;
    do
    {
      double v19 = *(v14 - 1) - x;
      double v20 = *v14 - y;
      double v21 = x + cosval * v19 - v20 * sinval;
      double v22 = y + v20 * cosval + sinval * v19;
      if (v21 < v18) {
        double v18 = v21;
      }
      if (v21 > v17) {
        double v17 = v21;
      }
      if (v22 < v15) {
        double v15 = v22;
      }
      if (v22 > v16) {
        double v16 = v22;
      }
      v14 += 2;
      --v13;
    }
    while (v13);
    double v23 = v17 - v18;
    double v24 = v16 - v15;
  }
  else
  {
    double v18 = 1.79769313e308;
    double v15 = 1.79769313e308;
    double v23 = -1.79769313e308 - 1.79769313e308;
    double v24 = -1.79769313e308 - 1.79769313e308;
  }
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.double y = v15;
  result.origin.double x = v18;
  return result;
}

+ (vector<CGRect,)horizontallyOverlappedChunks:(id)a2
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F1DB20];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v10 = *(CGFloat **)a4;
  uint64_t v11 = (CGFloat *)*((void *)a4 + 1);
  if (*(CGFloat **)a4 != v11)
  {
    while (1)
    {
      while (1)
      {
        CGFloat v13 = *v10;
        CGFloat v14 = v10[2];
        v43.origin.CGFloat x = *v10;
        v43.origin.CGFloat y = -8.98846567e307;
        v43.size.CGFloat width = v14;
        v43.size.CGFloat height = 1.79769313e308;
        v48.origin.CGFloat x = x;
        v48.origin.CGFloat y = y;
        v48.size.CGFloat width = width;
        v48.size.CGFloat height = height;
        if (!CGRectIntersectsRect(v43, v48)) {
          break;
        }
        v44.origin.CGFloat x = v13;
        v44.origin.CGFloat y = -8.98846567e307;
        v44.size.CGFloat width = v14;
        v44.size.CGFloat height = 1.79769313e308;
        v49.origin.CGFloat x = x;
        v49.origin.CGFloat y = y;
        v49.size.CGFloat width = width;
        v49.size.CGFloat height = height;
        CGRect v45 = CGRectUnion(v44, v49);
        CGFloat x = v45.origin.x;
        CGFloat y = v45.origin.y;
        CGFloat width = v45.size.width;
        CGFloat height = v45.size.height;
        v10 += 4;
        if (v10 == v11)
        {
LABEL_26:
          uint64_t v28 = *v5;
          uint64_t v29 = v5[1];
          uint64_t v30 = v5[2];
          uint64_t v31 = v5[3];
          goto LABEL_28;
        }
      }
      v46.origin.CGFloat x = x;
      v46.origin.CGFloat y = y;
      v46.size.CGFloat width = width;
      v46.size.CGFloat height = height;
      if (!CGRectEqualToRect(v46, *(CGRect *)v5)) {
        break;
      }
LABEL_5:
      CGFloat height = 1.79769313e308;
      CGFloat y = -8.98846567e307;
      CGFloat x = v13;
      CGFloat width = v14;
      v10 += 4;
      if (v10 == v11) {
        goto LABEL_26;
      }
    }
    var1 = retstr->var1;
    var0 = retstr->var2.var0;
    if (var1 < var0)
    {
      var1->origin.CGFloat x = x;
      var1->origin.CGFloat y = y;
      uint64_t v12 = var1 + 1;
      var1->size.CGFloat width = width;
      var1->size.CGFloat height = height;
LABEL_4:
      retstr->var1 = v12;
      goto LABEL_5;
    }
    double v17 = retstr->var0;
    uint64_t v18 = var1 - retstr->var0;
    unint64_t v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 59) {
      sub_1C494A220();
    }
    uint64_t v20 = (char *)var0 - (char *)v17;
    if (v20 >> 4 > v19) {
      unint64_t v19 = v20 >> 4;
    }
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v21 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v19;
    }
    if (v21)
    {
      if (v21 >> 59) {
        sub_1C4949AA8();
      }
      double v22 = (char *)operator new(32 * v21);
      uint64_t v23 = (uint64_t)&v22[32 * v18];
      *(CGFloat *)uint64_t v23 = x;
      *(CGFloat *)(v23 + 8) = y;
      *(CGFloat *)(v23 + 16) = width;
      *(CGFloat *)(v23 + 24) = height;
      double v24 = (CGRect *)v23;
      if (var1 == v17)
      {
LABEL_20:
        double v25 = (CGRect *)&v22[32 * v21];
        uint64_t v12 = (CGRect *)(v23 + 32);
        retstr->var0 = v24;
        retstr->var1 = (CGRect *)(v23 + 32);
        retstr->var2.var0 = v25;
        if (!var1) {
          goto LABEL_4;
        }
        goto LABEL_25;
      }
    }
    else
    {
      double v22 = 0;
      uint64_t v23 = 32 * v18;
      *(CGFloat *)uint64_t v23 = x;
      *(CGFloat *)(v23 + 8) = y;
      *(CGFloat *)(v23 + 16) = width;
      *(CGFloat *)(v23 + 24) = height;
      double v24 = (CGRect *)(32 * v18);
      if (var1 == v17) {
        goto LABEL_20;
      }
    }
    do
    {
      CGSize size = var1[-1].size;
      v24[-1].origin = var1[-1].origin;
      v24[-1].CGSize size = size;
      --v24;
      --var1;
    }
    while (var1 != v17);
    var1 = v17;
    long long v27 = (CGRect *)&v22[32 * v21];
    uint64_t v12 = (CGRect *)(v23 + 32);
    retstr->var0 = v24;
    retstr->var1 = (CGRect *)(v23 + 32);
    retstr->var2.var0 = v27;
    if (!v17) {
      goto LABEL_4;
    }
LABEL_25:
    operator delete(var1);
    goto LABEL_4;
  }
  uint64_t v31 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v30 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
  uint64_t v29 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v28 = *MEMORY[0x1E4F1DB20];
LABEL_28:
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGRect result = (vector<CGRect, std::allocator<CGRect>> *)CGRectEqualToRect(v47, *(CGRect *)&v28);
  if (result)
  {
    CGRect v34 = retstr->var1;
    CGRect v33 = retstr->var2.var0;
    if (v34 >= v33)
    {
      CGRect v36 = retstr->var0;
      uint64_t v37 = v34 - retstr->var0;
      unint64_t v38 = v37 + 1;
      if ((unint64_t)(v37 + 1) >> 59) {
        sub_1C494A220();
      }
      uint64_t v39 = (char *)v33 - (char *)v36;
      if (v39 >> 4 > v38) {
        unint64_t v38 = v39 >> 4;
      }
      if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v40 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v40 = v38;
      }
      if (v40)
      {
        if (v40 >> 59) {
          sub_1C4949AA8();
        }
        CGRect result = (vector<CGRect, std::allocator<CGRect>> *)operator new(32 * v40);
      }
      else
      {
        CGRect result = 0;
      }
      uint64_t v41 = (CGRect *)((char *)result + 32 * v37);
      v41->origin.CGFloat x = x;
      v41->origin.CGFloat y = y;
      v41->size.CGFloat width = width;
      v41->size.CGFloat height = height;
      uint64_t v35 = v41 + 1;
      if (v34 != v36)
      {
        do
        {
          CGSize v42 = v34[-1].size;
          v41[-1].origin = v34[-1].origin;
          v41[-1].CGSize size = v42;
          --v41;
          --v34;
        }
        while (v34 != v36);
        CGRect v34 = v36;
      }
      retstr->var0 = v41;
      retstr->var1 = v35;
      retstr->var2.var0 = (CGRect *)((char *)result + 32 * v40);
      if (v34) {
        operator delete(v34);
      }
    }
    else
    {
      v34->origin.CGFloat x = x;
      v34->origin.CGFloat y = y;
      uint64_t v35 = v34 + 1;
      v34->size.CGFloat width = width;
      v34->size.CGFloat height = height;
    }
    retstr->var1 = v35;
  }
  return result;
}

+ (double)horizontalOverlapOfIndividualStrokeBounds:(const void *)a3 otherStrokeBounds:(const void *)a4
{
  objc_msgSend_horizontallyOverlappedChunks_(CHStrokeUtilities, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  objc_msgSend_horizontallyOverlappedChunks_(CHStrokeUtilities, v7, (uint64_t)a4, v8, v9, v10);
  uint64_t v11 = v22;
  double v12 = 0.0;
  CGFloat v13 = __p;
  if (v22 != v23 && __p != v21)
  {
    do
    {
      CGFloat v14 = __p;
      if (__p != v21)
      {
        CGFloat v16 = v11[2];
        CGFloat v15 = v11[3];
        CGFloat v18 = *v11;
        CGFloat v17 = v11[1];
        do
        {
          v24.origin.CGFloat x = v18;
          v24.origin.CGFloat y = v17;
          v24.size.CGFloat width = v16;
          v24.size.CGFloat height = v15;
          CGRect v25 = CGRectIntersection(v24, *v14);
          double v12 = v12 + v25.size.width;
          ++v14;
        }
        while (v14 != v21);
      }
      v11 += 4;
    }
    while (v11 != v23);
    CGFloat v13 = __p;
  }
  if (v13) {
    operator delete(v13);
  }
  if (v22) {
    operator delete(v22);
  }
  return v12;
}

+ (CGRect)unionStrokeBounds:(const void *)a3 usingStrokeCountLimit:(int64_t)a4 reverseOrder:(BOOL)a5
{
  CGFloat v7 = *MEMORY[0x1E4F1DB20];
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v11 = *(void *)a3;
  unint64_t v12 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5;
  if (v12 >= a4) {
    int64_t v13 = a4;
  }
  else {
    int64_t v13 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5;
  }
  if (a5)
  {
    if (v13)
    {
      unint64_t v14 = 0;
      uint64_t v15 = -1;
      do
      {
        *(CGRect *)&CGFloat v7 = CGRectUnion(*(CGRect *)&v7, *(CGRect *)(v11 + 32 * (v12 + v15)));
        ++v14;
        uint64_t v11 = *(void *)a3;
        unint64_t v12 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5;
        if (v12 >= a4) {
          unint64_t v16 = a4;
        }
        else {
          unint64_t v16 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5;
        }
        --v15;
      }
      while (v14 < v16);
    }
  }
  else if (v13)
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    do
    {
      *(CGRect *)&CGFloat v7 = CGRectUnion(*(CGRect *)&v7, *(CGRect *)(v11 + v17));
      ++v18;
      uint64_t v11 = *(void *)a3;
      unint64_t v19 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5;
      if (v19 >= a4) {
        unint64_t v19 = a4;
      }
      v17 += 32;
    }
    while (v18 < v19);
  }
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

+ (CGRect)unionStrokeBounds:(const void *)a3 aroundXPosition:(double)a4 usingOneSideStrokeCountLimit:(int64_t)a5
{
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v11 = *(void *)a3;
  uint64_t v12 = *((void *)a3 + 1) - *(void *)a3;
  unint64_t v13 = v12 >> 5;
  if (!v12)
  {
LABEL_5:
    int64_t v17 = (v13 + ~a5) & ~((uint64_t)(v13 + ~a5) >> 63);
    unint64_t v18 = v13 - v17;
    if ((uint64_t)v13 <= v17) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  while (CGRectGetMidX(*(CGRect *)(v11 + v15)) <= a4)
  {
    ++v16;
    uint64_t v11 = *(void *)a3;
    v15 += 32;
    if (v16 >= (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5) {
      goto LABEL_5;
    }
  }
  unint64_t v13 = v16;
  int64_t v17 = (v16 + ~a5) & ~((uint64_t)(v16 + ~a5) >> 63);
  unint64_t v18 = v16 - v17;
  if ((uint64_t)v16 > v17)
  {
LABEL_8:
    uint64_t v19 = 32 * v17;
    do
    {
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      CGRect v30 = CGRectUnion(v29, *(CGRect *)(*(void *)a3 + v19));
      CGFloat x = v30.origin.x;
      CGFloat y = v30.origin.y;
      CGFloat width = v30.size.width;
      CGFloat height = v30.size.height;
      v19 += 32;
      --v18;
    }
    while (v18);
  }
LABEL_10:
  unint64_t v20 = v13 + a5;
  uint64_t v21 = *(void *)a3;
  unint64_t v22 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5;
  if (v20 < v22) {
    unint64_t v22 = v20;
  }
  if (v13 < v22)
  {
    uint64_t v23 = 32 * v13;
    do
    {
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      CGRect v32 = CGRectUnion(v31, *(CGRect *)(v21 + v23));
      CGFloat x = v32.origin.x;
      CGFloat y = v32.origin.y;
      CGFloat width = v32.size.width;
      CGFloat height = v32.size.height;
      ++v13;
      uint64_t v21 = *(void *)a3;
      unint64_t v24 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5;
      if (v20 < v24) {
        unint64_t v24 = v20;
      }
      v23 += 32;
    }
    while (v13 < v24);
  }
  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

+ (id)createDrawingForStrokeIdentifiers:(id)a3 strokeProvider:(id)a4 interpolationType:(int64_t)a5 resolution:(int64_t)a6 cancellationBlock:(id)a7
{
  id v12 = a7;
  unint64_t v16 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(a1, v13, (uint64_t)a3, (uint64_t)a4, v14, v15);
  unint64_t v18 = objc_msgSend_createDrawingForStrokes_interpolationType_resolution_cancellationBlock_(a1, v17, (uint64_t)v16, a5, a6, (uint64_t)v12);

  return v18;
}

+ (id)createDrawingForStrokes:(id)a3 interpolationType:(int64_t)a4 resolution:(int64_t)a5 cancellationBlock:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v38 = (uint64_t (**)(void))a6;
  uint64_t v41 = objc_alloc_init(CHDrawing);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v8;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v47, (uint64_t)v51, 16, v10, v8);
  if (v11)
  {
    uint64_t v12 = *(void *)v48;
    if (v38)
    {
LABEL_3:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8 * v13);
        if (v38[2]()) {
          break;
        }
        uint64_t v15 = objc_opt_class();
        uint64_t v42 = MEMORY[0x1E4F143A8];
        uint64_t v43 = 3221225472;
        CGRect v44 = sub_1C49AF460;
        CGRect v45 = &unk_1E64E1950;
        unint64_t v16 = v41;
        CGRect v46 = v16;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v15, v17, v14, a4, a5, (uint64_t)&v42);
        objc_msgSend_endStroke(v16, v18, v19, v20, v21, v22);

        if (v11 == ++v13)
        {
          uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v47, (uint64_t)v51, 16, v24);
          if (v11) {
            goto LABEL_3;
          }
          break;
        }
      }
    }
    else
    {
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          double v27 = objc_opt_class();
          uint64_t v42 = MEMORY[0x1E4F143A8];
          uint64_t v43 = 3221225472;
          CGRect v44 = sub_1C49AF460;
          CGRect v45 = &unk_1E64E1950;
          double v28 = v41;
          CGRect v46 = v28;
          objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v27, v29, v26, a4, a5, (uint64_t)&v42);
          objc_msgSend_endStroke(v28, v30, v31, v32, v33, v34);
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v47, (uint64_t)v51, 16, v36);
      }
      while (v11);
    }
  }

  return v41;
}

+ (vector<CGPoint,)convexHullForStroke:(id)a2
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v15[0] = v5;
  double v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v15, 1, v7, v8);
  objc_msgSend_convexHullForStrokes_(a2, v10, (uint64_t)v9, v11, v12, v13);

  return result;
}

+ (vector<CGPoint,)convexHullForStrokes:(id)a2
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  CGRect v29 = &v28;
  uint64_t v30 = 0x4812000000;
  uint64_t v31 = sub_1C49AF7F8;
  uint64_t v32 = sub_1C49AF81C;
  uint64_t v33 = &unk_1C4CB5C62;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  __p = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = a4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, (uint64_t)v39, 16, v7);
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = sub_1C49AF834;
        v23[3] = &unk_1E64E18B8;
        void v23[4] = &v28;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v12, v13, v11, 0, 1, (uint64_t)v23);
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v14, (uint64_t)&v24, (uint64_t)v39, 16, v15);
    }
    while (v8);
  }

  if (v29[7] == v29[6])
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v20 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v5;
      _os_log_impl(&dword_1C492D000, v20, OS_LOG_TYPE_ERROR, "Strokes with no enumerable points found, recognition results may be affected. Strokes: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend_convexHullForPoints_(a2, v16, (uint64_t)(v29 + 6), v17, v18, v19);
  }
  _Block_object_dispose(&v28, 8);
  if (__p)
  {
    uint64_t v35 = __p;
    operator delete(__p);
  }

  return result;
}

+ (vector<CGPoint,)convexHullForStrokes:(id)a2 inDrawing:(SEL)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x4812000000;
  long long v26 = sub_1C49AF7F8;
  long long v27 = sub_1C49AF81C;
  uint64_t v28 = &unk_1C4CB5C62;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  __p = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C49AFB80;
  v20[3] = &unk_1E64E1978;
  id v9 = v8;
  id v21 = v9;
  uint64_t v22 = &v23;
  objc_msgSend_enumerateIndexesUsingBlock_(a4, v10, (uint64_t)v20, v11, v12, v13);
  if (v24[7] == v24[6])
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v18 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v9;
      _os_log_impl(&dword_1C492D000, v18, OS_LOG_TYPE_ERROR, "Drawing with no enumerable points found, recognition results may be affected. Drawing: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend_convexHullForPoints_(a2, v14, (uint64_t)(v24 + 6), v15, v16, v17);
  }

  _Block_object_dispose(&v23, 8);
  if (__p)
  {
    uint64_t v30 = __p;
    operator delete(__p);
  }

  return result;
}

+ (vector<CGPoint,)convexHullForPoints:()vector<CGPoint
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = *(double **)a4;
  uint64_t v7 = (double *)*((void *)a4 + 1);
  unint64_t v9 = ((uint64_t)v7 - *(void *)a4) >> 4;
  if (v7 == *(double **)a4)
  {
    id v8 = (double *)*((void *)a4 + 1);
  }
  else
  {
    uint64_t v10 = *(double **)a4;
    do
    {
      double v4 = *v10;
      v10 += 2;
    }
    while (v10 != v7);
  }
  int64_t v11 = (char *)v7 - (char *)v8;
  unint64_t v12 = ((char *)v7 - (char *)v8) >> 4;
  if (v12 < v9)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v13 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unint64_t v14 = v9 - ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4);
      int v64 = 134218240;
      unint64_t v65 = v14;
      __int16 v66 = 2048;
      unint64_t v67 = v9;
      _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_ERROR, "Removed %lu NaN-Points from %lu given points before calculating convex hull.", (uint8_t *)&v64, 0x16u);
    }

    id v8 = *(double **)a4;
    uint64_t v7 = (double *)*((void *)a4 + 1);
    int64_t v11 = (int64_t)v7 - *(void *)a4;
    unint64_t v12 = v11 >> 4;
  }
  if ((unint64_t)v11 <= 0x1F)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    if (v7 != v8)
    {
      uint64_t v15 = (CGPoint *)operator new(v11);
      p_end_cap = &retstr->__end_cap_;
      p_end = &retstr->__end_;
      retstr->__begin_ = v15;
      retstr->__end_ = v15;
      uint64_t v18 = &v15[v12];
      p_end_cap->__value_ = v18;
      CGRect result = (vector<CGPoint, std::allocator<CGPoint>> *)memcpy(v15, v8, v11);
      *p_end = v18;
    }
    return result;
  }
  unint64_t v19 = 126 - 2 * __clz(v12);
  if (v7 == v8) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = v19;
  }
  sub_1C49B6914(v8, v7, v20, 1, v4);
  uint64_t v22 = *(double **)a4;
  id v21 = (double *)*((void *)a4 + 1);
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  uint64_t v23 = (char *)v21 - (char *)v22;
  if (v21 != v22)
  {
    if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF9) {
      sub_1C494A220();
    }
    long long v24 = (CGPoint *)operator new(2 * v23);
    retstr->__begin_ = v24;
    retstr->__end_cap_.__value_ = &v24[v23 >> 3];
    bzero(v24, 2 * v23);
    retstr->__end_ = (CGPoint *)((char *)v24 + 2 * v23);
  }
  if (v23 < 1)
  {
    unint64_t v29 = -1;
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    if (v23 >> 4 <= 1) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = v23 >> 4;
    }
    do
    {
      uint64_t v28 = 16 * v25;
      do
      {
        unint64_t v29 = v25;
        uint64_t v30 = v28;
        if (v25 < 2) {
          break;
        }
        uint64_t v31 = objc_opt_class();
        CGRect result = (vector<CGPoint, std::allocator<CGPoint>> *)objc_msgSend_threePointsOrientationWithOrigin_pointA_pointB_(v31, v32, v33, v34, v35, v36, *(double *)((char *)&retstr->__begin_[-2].x + v30), *(double *)((char *)&retstr->__begin_[-1] + v30 - 8), *(double *)((char *)&retstr->__begin_[-1].x + v30), *(double *)((char *)retstr->__begin_ + v30 - 8), *(double *)(*(void *)a4 + 16 * v26), *(double *)(*(void *)a4 + 16 * v26 + 8));
        uint64_t v28 = v30 - 16;
        --v25;
      }
      while (v37 <= 0.000000001);
      uint64_t v25 = v29 + 1;
      *(CGPoint *)((char *)retstr->__begin_ + v30) = *(CGPoint *)(*(void *)a4 + 16 * v26++);
    }
    while (v26 != v27);
    if (v23 >= 17)
    {
      uint64_t v38 = (v23 >> 4) - 2;
      int64_t v39 = v29 + 1;
      do
      {
        uint64_t v41 = 16 * v39;
        do
        {
          unint64_t v29 = v39;
          uint64_t v42 = v41;
          if (v39 <= v25) {
            break;
          }
          uint64_t v43 = objc_opt_class();
          CGRect result = (vector<CGPoint, std::allocator<CGPoint>> *)objc_msgSend_threePointsOrientationWithOrigin_pointA_pointB_(v43, v44, v45, v46, v47, v48, *(double *)((char *)&retstr->__begin_[-2].x + v42), *(double *)((char *)&retstr->__begin_[-1] + v42 - 8), *(double *)((char *)&retstr->__begin_[-1].x + v42), *(double *)((char *)retstr->__begin_ + v42 - 8), *(double *)(*(void *)a4 + 16 * v38), *(double *)(*(void *)a4 + 16 * v38 + 8));
          uint64_t v41 = v42 - 16;
          int64_t v39 = v29 - 1;
        }
        while (v49 <= 0.000000001);
        int64_t v39 = v29 + 1;
        *(CGPoint *)((char *)retstr->__begin_ + v42) = *(CGPoint *)(*(void *)a4 + 16 * v38);
      }
      while (v38-- > 0);
    }
  }
  begin = retstr->__begin_;
  end = retstr->__end_;
  unint64_t v52 = end - retstr->__begin_;
  unint64_t v53 = v29 - v52;
  if (v29 <= v52)
  {
    if (v29 >= v52) {
      return result;
    }
    long long v63 = &begin[v29];
    goto LABEL_55;
  }
  value = retstr->__end_cap_.__value_;
  if (v53 <= value - end)
  {
    bzero(retstr->__end_, 16 * v53);
    long long v63 = &end[v53];
LABEL_55:
    retstr->__end_ = v63;
    return result;
  }
  if (v29 >> 60) {
    sub_1C494A220();
  }
  uint64_t v55 = (char *)value - (char *)begin;
  uint64_t v56 = v55 >> 3;
  if (v55 >> 3 <= v29) {
    uint64_t v56 = v29;
  }
  if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v57 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v57 = v56;
  }
  if (v57 >> 60) {
    sub_1C4949AA8();
  }
  uint64_t v58 = (char *)operator new(16 * v57);
  id v59 = (CGPoint *)&v58[16 * v52];
  size_t v60 = v53;
  v61 = (CGPoint *)&v58[16 * v57];
  bzero(v59, v60 * 16);
  long long v62 = &v59[v60];
  if (end != begin)
  {
    do
    {
      v59[-1] = end[-1];
      --v59;
      --end;
    }
    while (end != begin);
    end = begin;
  }
  retstr->__begin_ = v59;
  retstr->__end_ = v62;
  retstr->__end_cap_.__value_ = v61;
  if (end) {
    operator delete(end);
  }
  return result;
}

+ (vector<CGPoint,)enlargedConvexHull:()vector<CGPoint withMargin:(std:(SEL)a3 :(const void *)a4 allocator<CGPoint>> *)result
{
  double v63 = a5;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  uint64_t v11 = *((void *)a4 + 1) - *(void *)a4;
  if (v11 >= -15)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v11 >> 4;
    uint64_t v15 = (v11 >> 4) - 1;
    uint64_t v16 = (v11 >> 4) & ~(v11 >> 63);
    uint64_t v17 = -1;
    while (1)
    {
      uint64_t v19 = v17 + 1;
      uint64_t v20 = *(void *)a4;
      if (v17 == -1) {
        uint64_t v21 = v15;
      }
      else {
        uint64_t v21 = v17;
      }
      uint64_t v22 = (double *)(v20 + 16 * v21);
      double v24 = *v22;
      double v23 = v22[1];
      if (v19 == v14) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = v17 + 1;
      }
      uint64_t v26 = (double *)(v20 + 16 * v25);
      double v27 = v26[1];
      float32_t v28 = v27 - v23;
      float v29 = *v26 - v24;
      v30.f32[0] = v28;
      v30.f32[1] = -v29;
      if (v28 != 0.0 || v29 != 0.0)
      {
        float32x2_t v31 = vmul_f32(v30, v30);
        v31.i32[0] = vadd_f32(v31, (float32x2_t)vdup_lane_s32((int32x2_t)v31, 1)).u32[0];
        float32x2_t v32 = vrsqrte_f32((float32x2_t)v31.u32[0]);
        float32x2_t v33 = vmul_f32(v32, vrsqrts_f32((float32x2_t)v31.u32[0], vmul_f32(v32, v32)));
        float32x2_t v30 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(vmul_n_f32(v30, vmul_f32(v33, vrsqrts_f32((float32x2_t)v31.u32[0], vmul_f32(v33, v33))).f32[0])), v63));
      }
      double v34 = v24 + v30.f32[0];
      double v35 = v23 + v30.f32[1];
      double v36 = *v26 + v30.f32[0];
      double v37 = v27 + v30.f32[1];
      if (v17 == -1) {
        goto LABEL_5;
      }
      float v38 = v7 - v5;
      float v39 = v6 - a5;
      float v40 = (float)(v39 * v39) + (float)(v38 * v38);
      BOOL v41 = v40 <= 0.0;
      float v42 = v39 / v40;
      if (v40 > 0.0) {
        float v43 = v38 / v40;
      }
      else {
        float v43 = v38;
      }
      if (v41) {
        float v44 = v39;
      }
      else {
        float v44 = v42;
      }
      float v45 = v36 - v34;
      float v46 = v37 - v35;
      float v47 = (float)(v46 * v46) + (float)(v45 * v45);
      if (v47 > 0.0)
      {
        float v45 = v45 / v47;
        float v46 = v46 / v47;
      }
      double v48 = v43;
      double v49 = v44;
      double v50 = v45;
      double v51 = v46;
      float v52 = v48 * v51 - v50 * v49;
      if (v52 != 0.0)
      {
        float v53 = (v50 * (a5 - v35) - (v5 - v34) * v51) / v52;
        double v54 = v53;
        double v8 = v5 + v54 * v48;
        double v9 = a5 + v54 * v49;
      }
      value = retstr->__end_cap_.__value_;
      if (v13 >= value) {
        break;
      }
      v13->CGFloat x = v8;
      v13->CGFloat y = v9;
      uint64_t v18 = v13 + 1;
LABEL_4:
      retstr->__end_ = v18;
      uint64_t v13 = v18;
LABEL_5:
      a5 = v35;
      double v5 = v34;
      double v6 = v37;
      double v7 = v36;
      uint64_t v17 = v19;
      if (v19 == v16) {
        return result;
      }
    }
    begin = retstr->__begin_;
    uint64_t v57 = v13 - retstr->__begin_;
    unint64_t v58 = v57 + 1;
    if ((unint64_t)(v57 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v59 = (char *)value - (char *)begin;
    if (v59 >> 3 > v58) {
      unint64_t v58 = v59 >> 3;
    }
    if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v60 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v60 = v58;
    }
    if (v60)
    {
      if (v60 >> 60) {
        sub_1C4949AA8();
      }
      CGRect result = (vector<CGPoint, std::allocator<CGPoint>> *)operator new(16 * v60);
      v61 = (CGPoint *)((char *)result + 16 * v57);
      v61->CGFloat x = v8;
      v61->CGFloat y = v9;
      long long v62 = v61;
      if (v13 == begin)
      {
LABEL_36:
        uint64_t v18 = v61 + 1;
        retstr->__begin_ = v62;
        retstr->__end_ = v61 + 1;
        retstr->__end_cap_.__value_ = (CGPoint *)((char *)result + 16 * v60);
        if (!v13) {
          goto LABEL_4;
        }
        goto LABEL_41;
      }
    }
    else
    {
      CGRect result = 0;
      v61 = (CGPoint *)(16 * v57);
      v61->CGFloat x = v8;
      v61->CGFloat y = v9;
      long long v62 = (CGPoint *)(16 * v57);
      if (v13 == begin) {
        goto LABEL_36;
      }
    }
    do
    {
      v62[-1] = v13[-1];
      --v62;
      --v13;
    }
    while (v13 != begin);
    uint64_t v13 = retstr->__begin_;
    uint64_t v18 = v61 + 1;
    retstr->__begin_ = v62;
    retstr->__end_ = v61 + 1;
    retstr->__end_cap_.__value_ = (CGPoint *)((char *)result + 16 * v60);
    if (!v13) {
      goto LABEL_4;
    }
LABEL_41:
    operator delete(v13);
    goto LABEL_4;
  }
  return result;
}

+ (id)polygonForStrokes:(id)a3
{
  objc_msgSend_convexHullForStrokes_(a1, a2, (uint64_t)a3, v3, v4, v5);
  unint64_t v6 = (v19 - __p) >> 4;
  double v7 = malloc_type_calloc(v6, 0x10uLL, 0x1000040451B5BE8uLL);
  uint64_t v8 = (uint64_t)v7;
  if (v19 != __p)
  {
    if (v6 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = (v19 - __p) >> 4;
    }
    uint64_t v10 = 16 * v6 - 16;
    uint64_t v11 = v7;
    do
    {
      *v11++ = *(_OWORD *)&__p[v10];
      v10 -= 16;
      --v9;
    }
    while (v9);
  }
  unint64_t v12 = [CHPolygon alloc];
  uint64_t v16 = objc_msgSend_initWithVertices_vertexCount_(v12, v13, v8, v6, v14, v15);
  if (__p) {
    operator delete(__p);
  }
  return v16;
}

+ (double)circumferenceRatioOfCircleFittedToPoints:(const void *)a3 circleCenter:(CGPoint *)a4 circleRadius:(double *)a5
{
  uint64_t v5 = *((void *)a3 + 1);
  float64x2_t v6 = *(float64x2_t *)(v5 + 16);
  uint64_t v7 = *(void *)(v5 + 8);
  float64x2_t v8 = *(float64x2_t *)(v7 + 16);
  float64x2_t v9 = *(float64x2_t *)(*(void *)(v7 + 8) + 16);
  int64x2_t v10 = (int64x2_t)vsubq_f64(v8, v6);
  double result = 0.0;
  if (*(double *)v10.i64 != 0.0 || *(double *)&v10.i64[1] != 0.0)
  {
    int64x2_t v12 = (int64x2_t)vsubq_f64(v9, v8);
    BOOL v13 = *(double *)v12.i64 == 0.0 && *(double *)v10.i64 == 0.0;
    BOOL v14 = *(double *)&v12.i64[1] == 0.0 && *(double *)v12.i64 == 0.0;
    if (!v13 && !v14)
    {
      if (*(double *)v10.i64 == 0.0)
      {
        int64x2_t v15 = (int64x2_t)vsubq_f64(v8, v9);
        int64x2_t v16 = (int64x2_t)vsubq_f64(v9, v6);
        double v18 = v9.f64[1];
        double v17 = v9.f64[0];
        double v19 = v8.f64[1];
        v9.f64[0] = v8.f64[0];
        double v20 = v6.f64[1];
        v8.f64[0] = v6.f64[0];
        float64x2_t v21 = vdivq_f64((float64x2_t)vzip2q_s64(v16, v15), (float64x2_t)vzip1q_s64(v16, v15));
        double v22 = v21.f64[1];
        if (v21.f64[0] == v21.f64[1]) {
          return result;
        }
      }
      else
      {
        double v19 = v9.f64[1];
        double v20 = v8.f64[1];
        if (*(double *)v12.i64 == 0.0)
        {
          int64x2_t v23 = (int64x2_t)vsubq_f64(v9, v6);
          int64x2_t v24 = (int64x2_t)vsubq_f64(v6, v8);
          double v18 = v6.f64[1];
          double v17 = v6.f64[0];
          float64x2_t v21 = vdivq_f64((float64x2_t)vzip2q_s64(v24, v23), (float64x2_t)vzip1q_s64(v24, v23));
          double v22 = v21.f64[1];
          if (v21.f64[0] == v21.f64[1]) {
            return result;
          }
        }
        else
        {
          double v18 = v8.f64[1];
          double v17 = v8.f64[0];
          double v20 = v6.f64[1];
          v8.f64[0] = v6.f64[0];
          float64x2_t v21 = vdivq_f64((float64x2_t)vzip2q_s64(v10, v12), (float64x2_t)vzip1q_s64(v10, v12));
          double v22 = v21.f64[1];
          if (v21.f64[0] == v21.f64[1]) {
            return result;
          }
        }
      }
      double v25 = (v22 * (v17 + v8.f64[0]) + v22 * v21.f64[0] * (v20 - v19) - v21.f64[0] * (v9.f64[0] + v17))
          / (v22 - v21.f64[0] + v22 - v21.f64[0]);
      BOOL v26 = v21.f64[0] == 0.0;
      double v27 = (v19 + v18) * 0.5 + -1.0 / v22 * (v25 - (v9.f64[0] + v17) * 0.5);
      double v28 = (v18 + v20) * 0.5 + -1.0 / v21.f64[0] * (v25 - (v17 + v8.f64[0]) * 0.5);
      if (v26) {
        double v28 = v27;
      }
      v29.f64[0] = v25;
      v29.f64[1] = v28;
      v31.f32[0] = v8.f64[0];
      float32_t v30 = v20;
      v31.f32[1] = v30;
      float32x2_t v32 = vsub_f32(vcvt_f32_f64(v29), v31);
      float v33 = sqrtf(vaddv_f32(vmul_f32(v32, v32)));
      if (a4)
      {
        a4->CGFloat x = v25;
        a4->CGFloat y = v28;
      }
      double v34 = v33;
      if (a5) {
        *a5 = v34;
      }
      v35.f32[0] = v17;
      float32_t v36 = v18;
      v35.f32[1] = v36;
      float32x2_t v37 = vsub_f32(v31, v35);
      int32x2_t v38 = (int32x2_t)vmul_f32(v37, v37);
      v39.f32[0] = v9.f64[0];
      float32_t v40 = v19;
      v39.f32[1] = v40;
      float32x2_t v41 = vsub_f32(v35, v39);
      int32x2_t v42 = (int32x2_t)vmul_f32(v41, v41);
      return vaddvq_f64(vcvtq_f64_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v42, v38), (float32x2_t)vzip2_s32(v42, v38)))))
           / v34;
    }
  }
  return result;
}

+ (double)vectorMeanWithoutOutliers:(void *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)a3;
  uint64_t v5 = *((void *)a3 + 1);
  unint64_t v6 = (v5 - *(void *)a3) >> 3;
  if (v5 == *(void *)a3)
  {
    uint64_t v4 = *((void *)a3 + 1);
  }
  else
  {
    uint64_t v7 = *(void *)a3;
    do
      v7 += 8;
    while (v7 != v5);
  }
  if (v6 > (v5 - v4) >> 3)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    float64x2_t v8 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v9 = v6 - ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
      int v25 = 134218240;
      unint64_t v26 = v9;
      __int16 v27 = 2048;
      unint64_t v28 = v6;
      _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_ERROR, "Removed %lu NaNs from %lu given values before calculating vector mean without outliers.", (uint8_t *)&v25, 0x16u);
    }
  }
  std::__sort<std::__less<double,double> &,double *>();
  uint64_t v10 = *(void *)a3;
  uint64_t v11 = *((void *)a3 + 1) - *(void *)a3;
  uint64_t v12 = v11 >> 3;
  unint64_t v13 = (v11 >> 3) / 5uLL;
  double v14 = 0.0;
  if (v13 < (v11 >> 3) - v13)
  {
    unint64_t v15 = v12 - 2 * v13;
    if (v15 < 2)
    {
      unint64_t v16 = (v11 >> 3) / 5uLL;
LABEL_18:
      unint64_t v20 = v16 + v13 - v12;
      float64x2_t v21 = (double *)(v10 + 8 * v16);
      do
      {
        double v22 = *v21++;
        double v14 = v14 + v22;
      }
      while (!__CFADD__(v20++, 1));
      return v14 / (double)(uint64_t)(v12 - 2 * v13);
    }
    uint64_t v17 = ((unint64_t)v11 >> 3) & 1;
    unint64_t v18 = v15 - v17;
    unint64_t v16 = v13 + v18;
    double v19 = (double *)(v10 + 8 * v13 + 8);
    do
    {
      double v14 = v14 + *(v19 - 1) + *v19;
      v19 += 2;
      v18 -= 2;
    }
    while (v18);
    if (v17) {
      goto LABEL_18;
    }
  }
  return v14 / (double)(uint64_t)(v12 - 2 * v13);
}

+ (double)lineOrientationForStrokePoints:(const void *)a3 error:(double *)a4
{
  uint64_t v5 = *(float64x2_t **)a3;
  uint64_t v6 = *((void *)a3 + 1) - *(void *)a3;
  if ((unint64_t)v6 < 0x20)
  {
    double v7 = 0.0;
    if (a4)
    {
      double v8 = 1.79769313e308;
LABEL_47:
      *a4 = v8;
      return v7;
    }
    return v7;
  }
  unint64_t v9 = v6 >> 4;
  if (v9 <= 1) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v10 < 2)
  {
    unint64_t v11 = 0;
    float64x2_t v12 = 0uLL;
LABEL_12:
    unint64_t v15 = v10 - v11;
    unint64_t v16 = &v5[v11];
    do
    {
      float64x2_t v17 = *v16++;
      float64x2_t v12 = vaddq_f64(v12, v17);
      --v15;
    }
    while (v15);
    goto LABEL_14;
  }
  unint64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
  unint64_t v13 = v5 + 1;
  float64x2_t v12 = 0uLL;
  unint64_t v14 = v10 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    float64x2_t v12 = vaddq_f64(vaddq_f64(v12, v13[-1]), *v13);
    v13 += 2;
    v14 -= 2;
  }
  while (v14);
  if (v10 != v11) {
    goto LABEL_12;
  }
LABEL_14:
  float64x2_t v18 = vdivq_f64(v12, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v9), 0));
  if (v10 < 2)
  {
    unint64_t v19 = 0;
    float64x2_t v20 = 0uLL;
LABEL_19:
    unint64_t v26 = v10 - v19;
    __int16 v27 = &v5[v19];
    do
    {
      float64x2_t v28 = *v27++;
      _Q2 = vsubq_f64(v28, v18);
      float64x2_t v20 = vmlaq_n_f64(v20, _Q2, _Q2.f64[0]);
      _D3 = _Q2.f64[1];
      __asm { FMLA            D1, D3, V2.D[1] }
      --v26;
    }
    while (v26);
    goto LABEL_21;
  }
  unint64_t v19 = v10 & 0xFFFFFFFFFFFFFFFELL;
  float64x2_t v21 = v5 + 1;
  float64x2_t v20 = 0uLL;
  _D1 = 0.0;
  unint64_t v23 = v10 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    float64x2_t v24 = vsubq_f64(v21[-1], v18);
    float64x2_t v25 = vsubq_f64(*v21, v18);
    _D1 = _D1
        + COERCE_DOUBLE(*(void *)&vmulq_f64(v24, v24).f64[1])
        + COERCE_DOUBLE(*(void *)&vmulq_f64(v25, v25).f64[1]);
    float64x2_t v20 = vaddq_f64(vaddq_f64(v20, vmulq_n_f64(v24, v24.f64[0])), vmulq_n_f64(v25, v25.f64[0]));
    v21 += 2;
    v23 -= 2;
  }
  while (v23);
  if (v10 != v19) {
    goto LABEL_19;
  }
LABEL_21:
  if (v20.f64[0] == 0.0 || _D1 == 0.0)
  {
    BOOL v46 = _D1 == 0.0;
    BOOL v47 = v20.f64[0] == 0.0;
    double v48 = 1.79769313e308;
    if (!v47 || !v46) {
      double v48 = 0.0;
    }
    double v49 = 1.57079633;
    if (v47 && v46) {
      double v49 = 0.0;
    }
    if (v20.f64[1] == 0.0) {
      double v50 = 0.0;
    }
    else {
      double v50 = 1.79769313e308;
    }
    _ZF = v20.f64[0] == 0.0;
    if (v20.f64[0] == 0.0) {
      double v8 = v48;
    }
    else {
      double v8 = v50;
    }
    if (_ZF) {
      double v7 = v49;
    }
    else {
      double v7 = 0.0;
    }
    if (a4) {
      goto LABEL_47;
    }
  }
  else
  {
    *(void *)&long double v53 = *(_OWORD *)&vdivq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v20, 1), v20);
    float64x2_t v54 = v18;
    long double v34 = atan(v53);
    double v7 = -v34;
    if (a4)
    {
      double v35 = vmlad_n_f64(v54.f64[1], -v53, v54.f64[0]);
      double v36 = sqrt(v53 * v53 + 1.0);
      double v37 = cos(v34);
      double v38 = sin(v7);
      float32x2_t v39 = &v5->f64[1];
      double v40 = 0.0;
      double v41 = 1.79769313e308;
      double v42 = -1.79769313e308;
      do
      {
        double v43 = *(v39 - 1);
        double v44 = vabdd_f64(*v39 + -v53 * v43, v35) / v36;
        if (v40 <= v44) {
          double v40 = v44;
        }
        double v45 = v43 * v37 - *v39 * v38;
        if (v45 < v41) {
          double v41 = v45;
        }
        if (v45 > v42) {
          double v42 = v45;
        }
        v39 += 2;
        --v10;
      }
      while (v10);
      double v8 = v40 / ((v42 - v41 + 1.0) * 0.1);
      goto LABEL_47;
    }
  }
  return v7;
}

+ (double)threePointsOrientationWithOrigin:(CGPoint)a3 pointA:(CGPoint)a4 pointB:(CGPoint)a5
{
  return (a4.x - a3.x) * (a5.y - a3.y) - (a4.y - a3.y) * (a5.x - a3.x);
}

+ (double)distanceFromPoint:(CGPoint)a3 toSegmentFromPoint:(CGPoint)a4 toPoint:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGPoint v6 = a4;
  float32x2_t v7 = vcvt_f32_f64(vsubq_f64((float64x2_t)a5, (float64x2_t)a4));
  float v8 = vaddv_f32(vmul_f32(v7, v7));
  if (v8 == 0.0)
  {
    CGFloat v9 = a3.y;
    float32x2_t v10 = vcvt_f32_f64((float64x2_t)a3);
  }
  else
  {
    v11.f32[0] = a3.x - a4.x;
    float32_t v12 = a3.y - a4.y;
    v11.f32[1] = v12;
    double v13 = vaddv_f32(vmul_f32(v11, v7)) / v8;
    if (v13 > 1.0) {
      double v13 = 1.0;
    }
    if (v13 < 0.0) {
      double v13 = 0.0;
    }
    CGFloat v14 = a3.y;
    float32x2_t v10 = vcvt_f32_f64((float64x2_t)a3);
    CGPoint v6 = (CGPoint)vmlaq_n_f64((float64x2_t)v6, vcvtq_f64_f32(v7), v13);
  }
  float32x2_t v15 = vsub_f32(v10, vcvt_f32_f64((float64x2_t)v6));
  return sqrtf(vaddv_f32(vmul_f32(v15, v15)));
}

+ (double)distanceFromRectangle:(CGRect)a3 toRectangle:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.width;
  double v9 = a3.origin.y;
  double v10 = a3.origin.x;
  double v91 = a3.size.height;
  double v11 = 0.0;
  if (CGRectIntersectsRect(a3, a4)) {
    return v11;
  }
  v92.origin.double x = v10;
  v92.origin.double y = v9;
  v92.size.double width = v8;
  v92.size.double height = v91;
  double MinX = CGRectGetMinX(v92);
  v93.origin.double x = v10;
  v93.origin.double y = v9;
  v93.size.double width = v8;
  v93.size.double height = v91;
  double MinY = CGRectGetMinY(v93);
  v94.origin.double x = v10;
  v94.origin.double y = v9;
  v94.size.double width = v8;
  v94.size.double height = v91;
  double MaxX = CGRectGetMaxX(v94);
  v95.origin.double x = v10;
  v95.origin.double y = v9;
  v95.size.double width = v8;
  v95.size.double height = v91;
  double v77 = CGRectGetMinY(v95);
  v96.origin.double x = v10;
  v96.origin.double y = v9;
  v96.size.double width = v8;
  v96.size.double height = v91;
  double v87 = CGRectGetMaxX(v96);
  v97.origin.double x = v10;
  v97.origin.double y = v9;
  v97.size.double width = v8;
  v97.size.double height = v91;
  double MaxY = CGRectGetMaxY(v97);
  v98.origin.double x = v10;
  v98.origin.double y = v9;
  v98.size.double width = v8;
  v98.size.double height = v91;
  double v89 = CGRectGetMinX(v98);
  v99.origin.double x = v10;
  v99.origin.double y = v9;
  v99.size.double width = v8;
  v99.size.double height = v91;
  double v83 = CGRectGetMaxY(v99);
  float32_t v12 = objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v12, v13, v14, v15, v16, v17, MinX, MinY, x, y, width, height);
  double v19 = fmin(v18, 3.40282347e38);
  float64x2_t v20 = objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v20, v21, v22, v23, v24, v25, MaxX, v77, x, y, width, height);
  double v27 = fmin(v19, v26);
  float64x2_t v28 = objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v28, v29, v30, v31, v32, v33, v87, MaxY, x, y, width, height);
  double v35 = fmin(v27, v34);
  double v36 = objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v36, v37, v38, v39, v40, v41, v89, v83, x, y, width, height);
  double v11 = fmin(v35, v42);
  if (fabs(v11) < 0.001) {
    return v11;
  }
  v100.origin.double x = x;
  v100.origin.double y = y;
  v100.size.double width = width;
  v100.size.double height = height;
  double v84 = CGRectGetMinX(v100);
  v101.origin.double x = x;
  v101.origin.double y = y;
  v101.size.double width = width;
  v101.size.double height = height;
  double v78 = CGRectGetMinY(v101);
  v102.origin.double x = x;
  v102.origin.double y = y;
  v102.size.double width = width;
  v102.size.double height = height;
  double v86 = CGRectGetMaxX(v102);
  v103.origin.double x = x;
  v103.origin.double y = y;
  v103.size.double width = width;
  v103.size.double height = height;
  double v80 = CGRectGetMinY(v103);
  v104.origin.double x = x;
  v104.origin.double y = y;
  v104.size.double width = width;
  v104.size.double height = height;
  double v88 = CGRectGetMaxX(v104);
  v105.origin.double x = x;
  v105.origin.double y = y;
  v105.size.double width = width;
  v105.size.double height = height;
  double v82 = CGRectGetMaxY(v105);
  v106.origin.double x = x;
  v106.origin.double y = y;
  v106.size.double width = width;
  v106.size.double height = height;
  double v90 = CGRectGetMinX(v106);
  v107.origin.double x = x;
  v107.origin.double y = y;
  v107.size.double width = width;
  v107.size.double height = height;
  double v44 = CGRectGetMaxY(v107);
  double v45 = objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v45, v46, v47, v48, v49, v50, v84, v78, v10, v9, v8, v91);
  double v52 = fmin(v11, v51);
  long double v53 = objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v53, v54, v55, v56, v57, v58, v86, v80, v10, v9, v8, v91);
  double v60 = fmin(v52, v59);
  v61 = objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v61, v62, v63, v64, v65, v66, v88, v82, v10, v9, v8, v91);
  double v68 = fmin(v60, v67);
  uint64_t v69 = objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v69, v70, v71, v72, v73, v74, v90, v44, v10, v9, v8, v91);
  return fmin(v68, v75);
}

+ (double)distanceFromPoint:(CGPoint)a3 toRectangle:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v31 = a3.y;
  double v29 = a3.x;
  double MinX = CGRectGetMinX(a4);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v32);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGFloat v25 = CGRectGetMinY(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v24 = CGRectGetMaxX(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGFloat v26 = CGRectGetMinX(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double v8 = CGRectGetMaxY(v38);
  v9.f64[0] = MinX;
  v10.f64[0] = v29;
  if (v29 < MinX)
  {
    double v11 = v31;
    BOOL v12 = v31 <= v8;
    v13.f64[0] = v29;
    v13.f64[1] = v31;
    v14.f64[0] = v26;
    v14.f64[1] = v8;
    float32x2_t v15 = vsub_f32(vcvt_f32_f64(v13), vcvt_f32_f64(v14));
    double result = sqrtf(vaddv_f32(vmul_f32(v15, v15)));
    if (v12) {
      double result = MinX - v29;
    }
    v10.f64[1] = v31;
    float32x2_t v17 = vcvt_f32_f64(v10);
    double v18 = MinY;
LABEL_9:
    v9.f64[1] = v18;
    float32x2_t v21 = vsub_f32(v17, vcvt_f32_f64(v9));
    double v22 = sqrtf(vaddv_f32(vmul_f32(v21, v21)));
    if (v11 < v18) {
      return v22;
    }
    return result;
  }
  v9.f64[0] = MaxX;
  if (v29 > MaxX)
  {
    double v11 = v31;
    v19.f64[0] = v29;
    v19.f64[1] = v31;
    v20.f64[0] = v24;
    v20.f64[1] = MaxY;
    *(float32x2_t *)&v19.f64[0] = vsub_f32(vcvt_f32_f64(v19), vcvt_f32_f64(v20));
    double result = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v19.f64[0], *(float32x2_t *)&v19.f64[0])));
    if (v31 <= MaxY) {
      double result = v29 - v24;
    }
    v10.f64[1] = v31;
    float32x2_t v17 = vcvt_f32_f64(v10);
    double v18 = v25;
    goto LABEL_9;
  }
  BOOL v12 = v31 <= v8;
  double result = v31 - v8;
  if (v12) {
    double result = 0.0;
  }
  if (v31 < MinY) {
    return MinY - v31;
  }
  return result;
}

+ (double)horizontalDistanceBetweenRectangle:(CGRect)a3 rectangle:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  CGFloat v12 = CGRectGetMinX(v28);
  BOOL v13 = MinX <= v12;
  if (MinX <= v12) {
    double v14 = x;
  }
  else {
    double v14 = v11;
  }
  if (v13) {
    double v15 = y;
  }
  else {
    double v15 = v10;
  }
  if (v13) {
    double v16 = width;
  }
  else {
    double v16 = v9;
  }
  if (v13) {
    double v17 = height;
  }
  else {
    double v17 = v8;
  }
  double v27 = CGRectGetMinX(*(CGRect *)&v14);
  v29.origin.double x = v11;
  v29.origin.double y = v10;
  v29.size.double width = v9;
  v29.size.double height = v8;
  double MaxX = CGRectGetMaxX(v29);
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  CGFloat v18 = CGRectGetMaxX(v30);
  BOOL v19 = MaxX < v18;
  if (MaxX >= v18) {
    double v20 = x;
  }
  else {
    double v20 = v11;
  }
  if (v19) {
    double v21 = v10;
  }
  else {
    double v21 = y;
  }
  if (v19) {
    double v22 = v9;
  }
  else {
    double v22 = width;
  }
  if (v19) {
    double v23 = v8;
  }
  else {
    double v23 = height;
  }
  return v27 - CGRectGetMaxX(*(CGRect *)&v20);
}

+ (double)verticalDistanceBetweenRectangle:(CGRect)a3 rectangle:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  double MinY = CGRectGetMinY(a3);
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  CGFloat v12 = CGRectGetMinY(v28);
  BOOL v13 = MinY <= v12;
  if (MinY <= v12) {
    double v14 = x;
  }
  else {
    double v14 = v11;
  }
  if (v13) {
    double v15 = y;
  }
  else {
    double v15 = v10;
  }
  if (v13) {
    double v16 = width;
  }
  else {
    double v16 = v9;
  }
  if (v13) {
    double v17 = height;
  }
  else {
    double v17 = v8;
  }
  double v27 = CGRectGetMinY(*(CGRect *)&v14);
  v29.origin.double x = v11;
  v29.origin.double y = v10;
  v29.size.double width = v9;
  v29.size.double height = v8;
  double MaxY = CGRectGetMaxY(v29);
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  CGFloat v18 = CGRectGetMaxY(v30);
  BOOL v19 = MaxY < v18;
  if (MaxY >= v18) {
    double v20 = x;
  }
  else {
    double v20 = v11;
  }
  if (v19) {
    double v21 = v10;
  }
  else {
    double v21 = y;
  }
  if (v19) {
    double v22 = v9;
  }
  else {
    double v22 = width;
  }
  if (v19) {
    double v23 = v8;
  }
  else {
    double v23 = height;
  }
  return v27 - CGRectGetMaxY(*(CGRect *)&v20);
}

+ (BOOL)isStrokeGroup:(id)a3 inlineWithNextGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  float32x2_t v7 = objc_opt_class();
  objc_msgSend_bounds(v5, v8, v9, v10, v11, v12);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  objc_msgSend_bounds(v6, v21, v22, v23, v24, v25);
  objc_msgSend_horizontalDistanceBetweenRectangle_rectangle_(v7, v26, v27, v28, v29, v30, v14, v16, v18, v20, v31, v32, v33, v34);
  double v36 = v35;
  CGRect v37 = objc_opt_class();
  objc_msgSend_bounds(v5, v38, v39, v40, v41, v42);
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  objc_msgSend_bounds(v6, v51, v52, v53, v54, v55);
  objc_msgSend_verticalDistanceBetweenRectangle_rectangle_(v37, v56, v57, v58, v59, v60, v44, v46, v48, v50, v61, v62, v63, v64);
  BOOL v66 = v65 < 0.0 && v36 > 0.0;
  double v67 = objc_opt_class();
  objc_msgSend_bounds(v5, v68, v69, v70, v71, v72);
  double v74 = v73;
  double v76 = v75;
  double v78 = v77;
  double v80 = v79;
  objc_msgSend_bounds(v6, v81, v82, v83, v84, v85);
  objc_msgSend_distanceFromRectangle_toRectangle_(v67, v86, v87, v88, v89, v90, v74, v76, v78, v80, v91, v92, v93, v94);
  if (v66)
  {
    double v101 = v100;
    objc_msgSend_bounds(v5, v95, v96, v97, v98, v99);
    double v103 = v102;
    objc_msgSend_bounds(v6, v104, v105, v106, v107, v108);
    double v110 = fmax(v103, v109);
    BOOL v111 = v101 < v110 + v110;
  }
  else
  {
    BOOL v111 = 0;
  }

  return v111;
}

+ (vector<CGPoint,)regularizedPathFromPoints:()vector<CGPoint delta:(std:(SEL)a3 :(const void *)a4 allocator<CGPoint>> *)result gamma:(double)a5 outError:(double)a6
{
  if (a7) {
    *a7 = 0.0;
  }
  uint64_t v12 = *(float64x2_t **)a4;
  uint64_t v11 = (float64x2_t *)*((void *)a4 + 1);
  int64_t v13 = (int64_t)v11 - *(void *)a4;
  unint64_t v14 = v13 >> 4;
  if ((unint64_t)v13 < 0x20)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    if (v11 == v12) {
      return result;
    }
LABEL_28:
    double v35 = (CGPoint *)operator new(v13);
    retstr->__begin_ = v35;
    double v36 = &v35[v14];
    retstr->__end_cap_.__value_ = v36;
    double result = (vector<CGPoint, std::allocator<CGPoint>> *)memcpy(v35, v12, v13);
    retstr->__end_ = v36;
    return result;
  }
  if (v14 <= 1) {
    unint64_t v15 = 1;
  }
  else {
    unint64_t v15 = v13 >> 4;
  }
  if (v15 < 2)
  {
    unint64_t v16 = 0;
    float64x2_t v17 = 0uLL;
LABEL_14:
    unint64_t v20 = v15 - v16;
    double v21 = &v12[v16];
    do
    {
      float64x2_t v22 = *v21++;
      float64x2_t v17 = vaddq_f64(v17, v22);
      --v20;
    }
    while (v20);
    goto LABEL_16;
  }
  unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFFELL;
  double v18 = v12 + 1;
  float64x2_t v17 = 0uLL;
  unint64_t v19 = v15 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    float64x2_t v17 = vaddq_f64(vaddq_f64(v17, v18[-1]), *v18);
    v18 += 2;
    v19 -= 2;
  }
  while (v19);
  if (v15 != v16) {
    goto LABEL_14;
  }
LABEL_16:
  double v23 = (double)v14;
  _Q0 = vdivq_f64(v17, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v14), 0));
  if (v15 < 2)
  {
    unint64_t v25 = 0;
    double v26 = 0.0;
    v27.f64[0] = 0.0;
    goto LABEL_22;
  }
  unint64_t v25 = v15 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v28 = v12 + 1;
  float64x2_t v27 = 0uLL;
  unint64_t v29 = v15 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    float64x2_t v30 = vsubq_f64(v28[-1], _Q0);
    float64x2_t v31 = vsubq_f64(*v28, _Q0);
    float64x2_t v27 = vaddq_f64(vaddq_f64(v27, vmulq_n_f64(v30, v30.f64[0])), vmulq_n_f64(v31, v31.f64[0]));
    v28 += 2;
    v29 -= 2;
  }
  while (v29);
  if (v15 != v25)
  {
    double v26 = v27.f64[1];
LABEL_22:
    unint64_t v32 = v15 - v25;
    double v33 = &v12[v25].f64[1];
    do
    {
      double v34 = *(v33 - 1) - _Q0.f64[0];
      double v26 = v26 + v34 * (*v33 - _Q0.f64[1]);
      v27.f64[0] = v27.f64[0] + v34 * v34;
      v33 += 2;
      --v32;
    }
    while (v32);
    v27.f64[1] = v26;
  }
  if (v27.f64[0] / v23 == 0.0)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    if (v11 == v12) {
      return result;
    }
    if (v13 < 0) {
      sub_1C494A220();
    }
    goto LABEL_28;
  }
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  if (v11 != v12)
  {
    CGRect v37 = 0;
    unint64_t v38 = 0;
    _D12 = v27.f64[1] / v23 / (v27.f64[0] / v23);
    __asm { FMLS            D10, D12, V0.D[0] }
    double v45 = 0.0;
    while (1)
    {
      f64 = v12[v38].f64;
      double v48 = *f64;
      double v49 = f64[1];
      double v50 = _D10 + _D12 * *f64;
      double v51 = v50 - v49;
      double v52 = vabdd_f64(v50, v49);
      if (v51 < 0.0) {
        double v53 = -a5;
      }
      else {
        double v53 = a5;
      }
      double v54 = v49 + v53 * pow(v52, a6);
      value = retstr->__end_cap_.__value_;
      if (v37 < value)
      {
        v37->double x = v48;
        v37->double y = v54;
        double v46 = v37 + 1;
      }
      else
      {
        begin = retstr->__begin_;
        uint64_t v57 = v37 - retstr->__begin_;
        unint64_t v58 = v57 + 1;
        if ((unint64_t)(v57 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v59 = (char *)value - (char *)begin;
        if (v59 >> 3 > v58) {
          unint64_t v58 = v59 >> 3;
        }
        if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v60 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v60 = v58;
        }
        if (v60)
        {
          if (v60 >> 60) {
            sub_1C4949AA8();
          }
          double result = (vector<CGPoint, std::allocator<CGPoint>> *)operator new(16 * v60);
          double v61 = (CGPoint *)((char *)result + 16 * v57);
          v61->double x = v48;
          v61->double y = v54;
          double v62 = v61;
          if (v37 != begin)
          {
            do
            {
LABEL_49:
              v62[-1] = v37[-1];
              --v62;
              --v37;
            }
            while (v37 != begin);
            CGRect v37 = retstr->__begin_;
            double v46 = v61 + 1;
            retstr->__begin_ = v62;
            retstr->__end_ = v61 + 1;
            retstr->__end_cap_.__value_ = (CGPoint *)((char *)result + 16 * v60);
            if (!v37) {
              goto LABEL_33;
            }
LABEL_53:
            operator delete(v37);
            goto LABEL_33;
          }
        }
        else
        {
          double result = 0;
          double v61 = (CGPoint *)(16 * v57);
          v61->double x = v48;
          v61->double y = v54;
          double v62 = (CGPoint *)(16 * v57);
          if (v37 != begin) {
            goto LABEL_49;
          }
        }
        double v46 = v61 + 1;
        retstr->__begin_ = v62;
        retstr->__end_ = v61 + 1;
        retstr->__end_cap_.__value_ = (CGPoint *)((char *)result + 16 * v60);
        if (v37) {
          goto LABEL_53;
        }
      }
LABEL_33:
      retstr->__end_ = v46;
      double v45 = v45 + (v49 - v54) * (v49 - v54);
      ++v38;
      uint64_t v12 = *(float64x2_t **)a4;
      unint64_t v14 = (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4;
      CGRect v37 = v46;
      if (v14 <= v38) {
        goto LABEL_55;
      }
    }
  }
  double v45 = 0.0;
LABEL_55:
  if (a7) {
    *a7 = v45 / (double)v14;
  }
  return result;
}

+ (BOOL)isStrokeClassificationTextOrMath:(int64_t)a3
{
  uint64_t v4 = objc_opt_class();
  if (objc_msgSend_isStrokeClassificationMath_(v4, v5, a3, v6, v7, v8)) {
    return 1;
  }
  uint64_t v10 = objc_opt_class();
  return objc_msgSend_isStrokeClassificationText_(v10, v11, a3, v12, v13, v14);
}

+ (BOOL)isStrokeClassificationMath:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

+ (BOOL)isStrokeClassificationText:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

+ (BOOL)isScriptClassificationMath:(int64_t)a3
{
  return a3 == 16 || (a3 & 0xFFFFFFFFFFFFFFFCLL) == 12;
}

+ (BOOL)isMatchingStrokeClassification:(int64_t)a3 scriptClassification:(int64_t)a4
{
  BOOL result = 0;
  if ((unint64_t)a4 <= 0x10)
  {
    if (((1 << a4) & 0xEFE) != 0)
    {
      unint64_t v6 = a3 - 1;
      return v6 < 2;
    }
    if (((1 << a4) & 0x1F000) != 0)
    {
      unint64_t v6 = a3 - 3;
      return v6 < 2;
    }
    if (a4 == 8)
    {
      uint64_t v7 = objc_opt_class();
      int v12 = objc_msgSend_isStrokeClassificationTextOrMath_(v7, v8, a3, v9, v10, v11) ^ 1;
      if (a3) {
        return v12;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

+ (id)scriptClassificationClasses
{
  return &unk_1F203D980;
}

+ (id)defaultScriptClassificationDictionary
{
  if (qword_1EA3C90D8 == -1)
  {
    v2 = (void *)qword_1EA3C90D0;
  }
  else
  {
    dispatch_once(&qword_1EA3C90D8, &unk_1F2012A30);
    v2 = (void *)qword_1EA3C90D0;
  }
  return v2;
}

+ (BOOL)isStroke:(id)a3 intersectingPolygon:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v12 = objc_msgSend_polygonDrawing(v6, v7, v8, v9, v10, v11);
  objc_msgSend_bounds(v12, v13, v14, v15, v16, v17);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  objc_msgSend_bounds(v5, v26, v27, v28, v29, v30);
  v47.origin.double x = v31;
  v47.origin.double y = v32;
  v47.size.double width = v33;
  v47.size.double height = v34;
  v46.origin.double x = v19;
  v46.origin.double y = v21;
  v46.size.double width = v23;
  v46.size.double height = v25;
  BOOL v35 = CGRectIntersectsRect(v46, v47);

  if (v35)
  {
    uint64_t v42 = 0;
    double v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = sub_1C49B1FE8;
    v39[3] = &unk_1E64E19A0;
    id v40 = v6;
    uint64_t v41 = &v42;
    objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(CHStrokeUtilities, v36, (uint64_t)v5, 0, 1, (uint64_t)v39);
    BOOL v37 = *((unsigned char *)v43 + 24) != 0;

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

+ (id)strokesIntersectingPolygons:(id)a3 fromStrokes:(id)a4 intersectedPolygons:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v39 = a4;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v11, v12, v13, v14, v15);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v39;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v50, (uint64_t)v55, 16, v18);
  if (v19)
  {
    uint64_t v44 = *(void *)v51;
    do
    {
      uint64_t v20 = 0;
      uint64_t v43 = v19;
      do
      {
        if (*(void *)v51 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8 * v20);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v24 = v45;
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v46, (uint64_t)v54, 16, v26);
        if (v30)
        {
          char v31 = 0;
          uint64_t v32 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v47 != v32) {
                objc_enumerationMutation(v24);
              }
              uint64_t v34 = *(void *)(*((void *)&v46 + 1) + 8 * i);
              if (objc_msgSend_isStroke_intersectingPolygon_(CHStrokeUtilities, v27, v23, v34, v28, v29))
              {
                objc_msgSend_addObject_(v16, v27, v34, v35, v28, v29);
                char v31 = 1;
              }
            }
            uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v46, (uint64_t)v54, 16, v29);
          }
          while (v30);

          uint64_t v19 = v43;
          if (v31) {
            objc_msgSend_addObject_(v41, v21, v23, v36, v37, v22);
          }
        }
        else
        {
        }
        ++v20;
      }
      while (v20 != v19);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v50, (uint64_t)v55, 16, v22);
    }
    while (v19);
  }

  if (a5) {
    *a5 = v16;
  }

  return v41;
}

+ (int64_t)minRectangleDistanceFromStrokes:(id)a3 toPolygons:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v59 = a4;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v64, (uint64_t)v69, 16, v7);
  if (v8)
  {
    uint64_t v58 = *(void *)v65;
    double v9 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v65 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v12 = v59;
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v60, (uint64_t)v68, 16, v14);
        if (v20)
        {
          uint64_t v21 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v61 != v21) {
                objc_enumerationMutation(v12);
              }
              uint64_t v23 = *(void **)(*((void *)&v60 + 1) + 8 * j);
              objc_msgSend_bounds(v11, v15, v16, v17, v18, v19);
              double v25 = v24;
              double v27 = v26;
              double v29 = v28;
              double v31 = v30;
              uint64_t v37 = objc_msgSend_polygonDrawing(v23, v32, v33, v34, v35, v36);
              objc_msgSend_bounds(v37, v38, v39, v40, v41, v42);
              objc_msgSend_distanceFromRectangle_toRectangle_(CHStrokeUtilities, v43, v44, v45, v46, v47, v25, v27, v29, v31, v48, v49, v50, v51);
              double v53 = v52;

              if (v53 < v9) {
                double v9 = v53;
              }
            }
            uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v60, (uint64_t)v68, 16, v19);
          }
          while (v20);
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v64, (uint64_t)v69, 16, v55);
    }
    while (v8);
  }
  else
  {
    double v9 = 1.79769313e308;
  }

  return (uint64_t)v9;
}

+ (id)strokeIdentifiersByStrokeClusterPolygonsFromStrokeBounds:(id)a3 strokes:(id)a4
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v177 = a4;
  v174 = v5;
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v6, v7, v8, v9, v10);
  id v175 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v5, v11, v12, v13, v14, v15) && objc_msgSend_count(v177, v16, v17, v18, v19, v20))
  {
    uint64_t v26 = objc_msgSend_count(v5, v21, v22, v23, v24, v25);
    if (v26 != objc_msgSend_count(v177, v27, v28, v29, v30, v31))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v32 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v185 = objc_msgSend_count(v5, v33, v34, v35, v36, v37);
        __int16 v186 = 1024;
        int v187 = objc_msgSend_count(v177, v38, v39, v40, v41, v42);
        _os_log_impl(&dword_1C492D000, v32, OS_LOG_TYPE_FAULT, "strokeClusterPolygonsError: should have matching strokes and strokeBounds, but have %d strokes and %d strokeBounds", buf, 0xEu);
      }
    }
    double v48 = mergedOverlappingRectanglesFromRectangles(v5);
    if (v48)
    {
      v178 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v43, v44, v45, v46, v47);
      v176 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v49, v50, v51, v52, v53);
      for (unint64_t i = 0; i < objc_msgSend_count(v48, v54, v55, v56, v57, v58); ++i)
      {
        long long v65 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v60, v61, v62, v63, v64);
        uint64_t v71 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v66, v67, v68, v69, v70);
        long long v181 = 0u;
        long long v182 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        id v72 = v177;
        uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v179, (uint64_t)v183, 16, v74);
        if (v79)
        {
          uint64_t v80 = *(void *)v180;
          do
          {
            for (uint64_t j = 0; j != v79; ++j)
            {
              if (*(void *)v180 != v80) {
                objc_enumerationMutation(v72);
              }
              uint64_t v82 = *(void **)(*((void *)&v179 + 1) + 8 * j);
              uint64_t v83 = objc_msgSend_objectAtIndexedSubscript_(v48, v75, i, v76, v77, v78);
              objc_msgSend_ch_CGRectValue(v83, v84, v85, v86, v87, v88);
              CGFloat v90 = v89;
              CGFloat v92 = v91;
              CGFloat v94 = v93;
              CGFloat v96 = v95;

              objc_msgSend_bounds(v82, v97, v98, v99, v100, v101);
              v191.origin.double x = v102;
              v191.origin.double y = v103;
              v191.size.double width = v104;
              v191.size.double height = v105;
              v190.origin.double x = v90;
              v190.origin.double y = v92;
              v190.size.double width = v94;
              v190.size.double height = v96;
              if (CGRectContainsRect(v190, v191))
              {
                objc_msgSend_addObject_(v65, v75, (uint64_t)v82, v76, v77, v78);
                BOOL v111 = objc_msgSend_encodedStrokeIdentifier(v82, v106, v107, v108, v109, v110);
                objc_msgSend_addObject_(v71, v112, (uint64_t)v111, v113, v114, v115);
              }
            }
            uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v179, (uint64_t)v183, 16, v78);
          }
          while (v79);
        }

        if (objc_msgSend_count(v65, v116, v117, v118, v119, v120))
        {
          objc_msgSend_addObject_(v178, v121, (uint64_t)v65, v122, v123, v124);
          objc_msgSend_addObject_(v176, v125, (uint64_t)v71, v126, v127, v128);
        }
      }
      if (objc_msgSend_count(v178, v60, v61, v62, v63, v64) && objc_msgSend_count(v176, v131, v132, v133, v134, v135))
      {
        for (unint64_t k = 0; k < objc_msgSend_count(v178, v136, v137, v138, v139, v140); ++k)
        {
          uint64_t v146 = objc_msgSend_objectAtIndexedSubscript_(v178, v142, k, v143, v144, v145);
          if (objc_msgSend_count(v146, v147, v148, v149, v150, v151))
          {
            v157 = objc_msgSend_allObjects(v146, v152, v153, v154, v155, v156);
            v162 = objc_msgSend_polygonForStrokes_(CHStrokeUtilities, v158, (uint64_t)v157, v159, v160, v161);

            v167 = objc_msgSend_objectAtIndexedSubscript_(v176, v163, k, v164, v165, v166);
            objc_msgSend_setObject_forKey_(v175, v168, (uint64_t)v167, (uint64_t)v162, v169, v170);
          }
        }
      }
      id v171 = v175;
    }
    else
    {
      id v172 = v175;
    }

    v129 = v175;
  }
  else
  {
    v129 = v175;
    id v130 = v175;
  }

  return v175;
}

+ (BOOL)isStroke:(id)a3 intersectingAnyPolygonInSet:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, (uint64_t)v20, 16, v8);
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend_isStroke_intersectingPolygon_(CHStrokeUtilities, v9, (uint64_t)v5, *(void *)(*((void *)&v16 + 1) + 8 * i), v10, v11, (void)v16))
        {
          LOBYTE(v12) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, (uint64_t)v20, 16, v11);
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

+ (void)principalComponentsForPoints:(const void *)a3 outFirstComponent:(CGVector *)a4 outSecondComponent:(CGVector *)a5 outMeanPoint:(CGPoint *)a6
{
  if (a4)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    id v72 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v72, OS_LOG_TYPE_FAULT, "vector pointer for firstComponent should not be nil", buf, 2u);
    }

    if (a5)
    {
LABEL_3:
      if (a6) {
        goto LABEL_4;
      }
LABEL_75:
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v74 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v74, OS_LOG_TYPE_FAULT, "vector pointer for meanPoint should not be nil", buf, 2u);
      }

      uint64_t v10 = *(double **)a3;
      uint64_t v11 = (double *)*((void *)a3 + 1);
      if (*(double **)a3 != v11) {
        goto LABEL_5;
      }
      goto LABEL_80;
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  double v73 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v73, OS_LOG_TYPE_FAULT, "vector pointer for secondComponent should not be nil", buf, 2u);
  }

  if (!a6) {
    goto LABEL_75;
  }
LABEL_4:
  uint64_t v10 = *(double **)a3;
  uint64_t v11 = (double *)*((void *)a3 + 1);
  if (*(double **)a3 != v11)
  {
LABEL_5:
    uint64_t v87 = a4;
    uint64_t v88 = a5;
    double v89 = a6;
    *(void *)buf = 0;
    uint64_t v99 = 0;
    uint64_t v100 = 0;
    double v95 = 0;
    CGFloat v96 = 0;
    uint64_t v97 = 0;
    uint64_t v12 = (char *)v11 - (char *)v10;
    if ((char *)v11 - (char *)v10 < 0) {
      sub_1C494A220();
    }
    size_t v13 = (unint64_t)v12 >> 2;
    uint64_t v14 = (float *)operator new((unint64_t)v12 >> 2);
    uint64_t v15 = v12 >> 4;
    *(void *)buf = v14;
    uint64_t v99 = v14;
    uint64_t v100 = &v14[v15];
    long long v16 = (float *)operator new(v13);
    long long v17 = &v16[v15];
    double v95 = v16;
    CGFloat v96 = v16;
    uint64_t v97 = v17;
    long long v18 = v16;
    while (1)
    {
      float v19 = *v10;
      uint64_t v20 = v99;
      if (v99 >= v100) {
        break;
      }
      *uint64_t v99 = v19;
      uint64_t v21 = (uint64_t)(v20 + 1);
LABEL_30:
      uint64_t v99 = (float *)v21;
      float v44 = v10[1];
      if (v18 < v17)
      {
        *v18++ = v44;
        CGFloat v96 = v18;
        v10 += 2;
        if (v10 == v11) {
          goto LABEL_59;
        }
      }
      else
      {
        uint64_t v45 = v18 - v16;
        unint64_t v46 = v45 + 1;
        if ((unint64_t)(v45 + 1) >> 62) {
          sub_1C494A220();
        }
        if (((char *)v17 - (char *)v16) >> 1 > v46) {
          unint64_t v46 = ((char *)v17 - (char *)v16) >> 1;
        }
        if ((unint64_t)((char *)v17 - (char *)v16) >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v47 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v47 = v46;
        }
        if (v47)
        {
          if (v47 >> 62) {
            sub_1C4949AA8();
          }
          double v48 = operator new(4 * v47);
          double v49 = (float *)&v48[4 * v45];
          *double v49 = v44;
          uint64_t v50 = (uint64_t)(v49 + 1);
          int64_t v51 = (char *)v18 - (char *)v16;
          if (v18 == v16) {
            goto LABEL_45;
          }
        }
        else
        {
          double v48 = 0;
          double v49 = (float *)(4 * v45);
          *(float *)(4 * v45) = v44;
          uint64_t v50 = 4 * v45 + 4;
          int64_t v51 = (char *)v18 - (char *)v16;
          if (v18 == v16) {
            goto LABEL_45;
          }
        }
        unint64_t v52 = v51 - 4;
        if (v52 >= 0xBC)
        {
          unint64_t v55 = ((char *)(v18 - 1) - (char *)v16) & 0xFFFFFFFFFFFFFFFCLL;
          if (&v48[(char *)v18 - (char *)v16 - 4 - v55] > &v48[(char *)v18 - (char *)v16 - 4])
          {
            uint64_t v53 = v18;
          }
          else if ((float *)((char *)v18 - v55 - 4) > v18 - 1)
          {
            uint64_t v53 = v18;
          }
          else if ((unint64_t)((char *)v16 - v48) >= 0x20)
          {
            uint64_t v56 = (v52 >> 2) + 1;
            uint64_t v57 = 4 * (v56 & 0x7FFFFFFFFFFFFFF8);
            uint64_t v53 = &v18[v57 / 0xFFFFFFFFFFFFFFFCLL];
            double v49 = (float *)((char *)v49 - v57);
            uint64_t v58 = &v48[4 * v45 - 16];
            id v59 = v18 - 4;
            uint64_t v60 = v56 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v61 = *(_OWORD *)v59;
              *(v58 - 1) = *((_OWORD *)v59 - 1);
              *uint64_t v58 = v61;
              v58 -= 2;
              v59 -= 8;
              v60 -= 8;
            }
            while (v60);
            if (v56 == (v56 & 0x7FFFFFFFFFFFFFF8)) {
              goto LABEL_45;
            }
          }
          else
          {
            uint64_t v53 = v18;
          }
        }
        else
        {
          uint64_t v53 = v18;
        }
        do
        {
          int v54 = *((_DWORD *)v53-- - 1);
          *((_DWORD *)v49-- - 1) = v54;
        }
        while (v53 != v16);
LABEL_45:
        long long v17 = (float *)&v48[4 * v47];
        double v95 = v49;
        uint64_t v97 = v17;
        if (v16) {
          operator delete(v16);
        }
        long long v16 = v49;
        CGFloat v96 = (float *)v50;
        v10 += 2;
        long long v18 = (float *)v50;
        if (v10 == v11)
        {
LABEL_59:
          uint64_t v94 = 0;
          sub_1C49B2C38(&__p, (uint64_t)CHStrokeUtilities, (uint64_t)buf, (float *)&v94 + 1);
          sub_1C49B2C38(&__B, (uint64_t)CHStrokeUtilities, (uint64_t)&v95, (float *)&v94);
          self;
          __C[0] = 0.0;
          vDSP_dotpr((const float *)__p, 1, (const float *)__p, 1, __C, (v93 - (unsigned char *)__p) >> 2);
          uint64_t v62 = v93 - (unsigned char *)__p;
          BOOL v63 = (unint64_t)(v93 - (unsigned char *)__p) > 0x14;
          float v64 = __C[0];
          self;
          __C[0] = 0.0;
          vDSP_dotpr(__B, 1, __B, 1, __C, v91 - __B);
          uint64_t v65 = (char *)v91 - (char *)__B;
          BOOL v66 = (unint64_t)((char *)v91 - (char *)__B) > 0x14;
          float v67 = __C[0];
          self;
          __C[0] = 0.0;
          vDSP_dotpr((const float *)__p, 1, __B, 1, __C, (v93 - (unsigned char *)__p) >> 2);
          if (v87 && v88 && v89)
          {
            float v68 = v64 / (float)(unint64_t)((v62 >> 2) - v63);
            float v69 = v67 / (float)(unint64_t)((v65 >> 2) - v66);
            float v70 = __C[0]
                / (float)(((v93 - (unsigned char *)__p) >> 2) - (unint64_t)((unint64_t)(v93 - (unsigned char *)__p) > 0x14));
            if (v70 == 0.0)
            {
              *uint64_t v87 = (CGVector)xmmword_1C4C3A690;
              *uint64_t v88 = (CGVector)xmmword_1C4C3A6A0;
              if (fabsf(v68) < fabsf(v69))
              {
                CGVector v71 = *v87;
                *uint64_t v87 = *v88;
                *uint64_t v88 = v71;
              }
            }
            else
            {
              float v75 = v68 - v69;
              float v76 = sqrtf((float)(v75 * v75) + (float)((float)(v70 * 4.0) * v70));
              float v77 = v70 + v70;
              v87->ddouble x = (float)((float)(v75 + v76) / v77);
              v87->ddouble y = 1.0;
              v88->ddouble x = (float)((float)(v75 - v76) / v77);
              v88->ddouble y = 1.0;
              self;
              ddouble x = v87->dx;
              ddouble y = v87->dy;
              float v80 = sqrt(dy * dy + dx * dx);
              if (v80 > 0.0)
              {
                double v81 = v80;
                ddouble x = dx / v81;
                ddouble y = dy / v81;
              }
              v87->ddouble x = dx;
              v87->ddouble y = dy;
              self;
              double v82 = v88->dx;
              double v83 = v88->dy;
              float v84 = sqrt(v83 * v83 + v82 * v82);
              if (v84 > 0.0)
              {
                double v85 = v84;
                double v82 = v82 / v85;
                double v83 = v83 / v85;
              }
              v88->ddouble x = v82;
              v88->ddouble y = v83;
            }
            CGFloat v86 = *(float *)&v94;
            v89->double x = *((float *)&v94 + 1);
            v89->double y = v86;
          }
          if (__B)
          {
            double v91 = __B;
            operator delete(__B);
          }
          if (__p)
          {
            double v93 = __p;
            operator delete(__p);
          }
          if (v95) {
            operator delete(v95);
          }
          if (*(void *)buf)
          {
            uint64_t v99 = *(float **)buf;
            operator delete(*(void **)buf);
          }
          return;
        }
      }
    }
    uint64_t v22 = v17;
    uint64_t v23 = v11;
    uint64_t v24 = *(float **)buf;
    uint64_t v25 = (char *)v99 - *(void *)buf;
    uint64_t v26 = ((uint64_t)v99 - *(void *)buf) >> 2;
    unint64_t v27 = v26 + 1;
    if ((unint64_t)(v26 + 1) >> 62) {
      sub_1C494A220();
    }
    uint64_t v28 = (uint64_t)v100 - *(void *)buf;
    if (((uint64_t)v100 - *(void *)buf) >> 1 > v27) {
      unint64_t v27 = v28 >> 1;
    }
    if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v29 = v27;
    }
    if (v29)
    {
      if (v29 >> 62) {
        sub_1C4949AA8();
      }
      unint64_t v30 = v29;
      uint64_t v31 = (char *)operator new(4 * v29);
      unint64_t v29 = v30;
      uint64_t v32 = (float *)&v31[4 * v26];
      *uint64_t v32 = v19;
      uint64_t v21 = (uint64_t)(v32 + 1);
      int64_t v33 = (char *)v20 - (char *)v24;
      if (v20 != v24)
      {
LABEL_19:
        unint64_t v34 = v33 - 4;
        if (v34 >= 0x2C)
        {
          unint64_t v35 = (char *)v20 - v31 - (void)v25;
          uint64_t v11 = v23;
          long long v17 = v22;
          if (v35 >= 0x20)
          {
            uint64_t v36 = (v34 >> 2) + 1;
            uint64_t v37 = 4 * (v36 & 0x7FFFFFFFFFFFFFF8);
            unint64_t v38 = &v20[v37 / 0xFFFFFFFFFFFFFFFCLL];
            uint64_t v32 = (float *)((char *)v32 - v37);
            uint64_t v39 = &v31[4 * v26 - 16];
            uint64_t v40 = v20 - 4;
            uint64_t v41 = v36 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v42 = *(_OWORD *)v40;
              *((_OWORD *)v39 - 1) = *((_OWORD *)v40 - 1);
              *(_OWORD *)uint64_t v39 = v42;
              v39 -= 32;
              v40 -= 8;
              v41 -= 8;
            }
            while (v41);
            uint64_t v20 = v38;
            if (v36 == (v36 & 0x7FFFFFFFFFFFFFF8))
            {
LABEL_28:
              *(void *)buf = v32;
              uint64_t v99 = (float *)v21;
              uint64_t v100 = (float *)&v31[4 * v29];
              if (v24) {
                operator delete(v24);
              }
              goto LABEL_30;
            }
          }
        }
        else
        {
          uint64_t v11 = v23;
          long long v17 = v22;
        }
        do
        {
          int v43 = *((_DWORD *)v20-- - 1);
          *((_DWORD *)v32-- - 1) = v43;
        }
        while (v20 != v24);
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v31 = 0;
      uint64_t v32 = (float *)(4 * v26);
      *(float *)(4 * v26) = v19;
      uint64_t v21 = 4 * v26 + 4;
      int64_t v33 = (char *)v20 - (char *)v24;
      if (v20 != v24) {
        goto LABEL_19;
      }
    }
    uint64_t v11 = v23;
    long long v17 = v22;
    goto LABEL_28;
  }
LABEL_80:
  if (a4 && a5 && a6)
  {
    *a4 = (CGVector)xmmword_1C4C3A690;
    *a5 = (CGVector)xmmword_1C4C3A6A0;
    a6->double x = 0.0;
    a6->double y = 0.0;
  }
}

+ (vector<float,)projectionForPoints:(id)a2 direction:(SEL)a3 origin:(const void *)a4
{
  id v6 = retstr;
  uint64_t v8 = *(double **)a4;
  uint64_t v7 = (double *)*((void *)a4 + 1);
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  unint64_t v9 = (char *)v7 - (char *)v8;
  if (v7 != v8)
  {
    if ((v9 & 0x8000000000000000) != 0) {
      sub_1C494A220();
    }
    uint64_t v10 = (float *)operator new(v9 >> 2);
    v6->__begin_ = v10;
    size_t v11 = (uint64_t)v9 >> 4;
    uint64_t v12 = v6;
    size_t v13 = &v10[v11];
    v12->__end_cap_.__value_ = &v10[v11];
    bzero(v10, v11 * 4);
    id v59 = v12;
    v12->__end_ = v13;
    __p = 0;
    uint64_t v65 = 0;
    unint64_t v66 = 0;
    uint64_t v14 = (float *)operator new(v9 >> 1);
    uint64_t v15 = v14;
    unint64_t v16 = (unint64_t)v14 + (v9 >> 1);
    while (1)
    {
      while (1)
      {
        float v17 = *v8;
        if ((unint64_t)v14 >= v16) {
          break;
        }
        *uint64_t v14 = v17;
        long long v18 = v14 + 1;
        float v19 = v8[1];
        if ((unint64_t)(v14 + 1) >= v16) {
          goto LABEL_25;
        }
LABEL_4:
        *long long v18 = v19;
        uint64_t v14 = v18 + 1;
        v8 += 2;
        if (v8 == v7) {
          goto LABEL_63;
        }
      }
      uint64_t v20 = v14 - v15;
      unint64_t v21 = v20 + 1;
      if ((unint64_t)(v20 + 1) >> 62)
      {
        uint64_t v65 = v14;
        unint64_t v66 = v16;
        __p = v15;
        sub_1C494A220();
      }
      if ((uint64_t)(v16 - (void)v15) >> 1 > v21) {
        unint64_t v21 = (uint64_t)(v16 - (void)v15) >> 1;
      }
      if (v16 - (unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v21;
      }
      if (v22)
      {
        if (v22 >> 62)
        {
          uint64_t v65 = v14;
          unint64_t v66 = v16;
          __p = v15;
          sub_1C4949AA8();
        }
        uint64_t v23 = operator new(4 * v22);
        uint64_t v24 = (float *)&v23[4 * v20];
        *uint64_t v24 = v17;
        long long v18 = v24 + 1;
        int64_t v25 = (char *)v14 - (char *)v15;
        if (v14 == v15) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v23 = 0;
        uint64_t v24 = (float *)(4 * v20);
        *(float *)(4 * v20) = v17;
        long long v18 = (float *)(4 * v20 + 4);
        int64_t v25 = (char *)v14 - (char *)v15;
        if (v14 == v15) {
          goto LABEL_22;
        }
      }
      unint64_t v26 = v25 - 4;
      if (v26 < 0xBC)
      {
        unint64_t v27 = v14;
        goto LABEL_21;
      }
      unint64_t v38 = ((char *)(v14 - 1) - (char *)v15) & 0xFFFFFFFFFFFFFFFCLL;
      if (&v23[(char *)v14 - (char *)v15 - 4 - v38] > &v23[(char *)v14 - (char *)v15 - 4])
      {
        unint64_t v27 = v14;
        do
        {
LABEL_21:
          int v28 = *((_DWORD *)v27-- - 1);
          *((_DWORD *)v24-- - 1) = v28;
        }
        while (v27 != v15);
        goto LABEL_22;
      }
      if ((float *)((char *)v14 - v38 - 4) > v14 - 1)
      {
        unint64_t v27 = v14;
        goto LABEL_21;
      }
      if ((unint64_t)((char *)v15 - v23) < 0x20)
      {
        unint64_t v27 = v14;
        goto LABEL_21;
      }
      uint64_t v40 = (v26 >> 2) + 1;
      uint64_t v41 = 4 * (v40 & 0x7FFFFFFFFFFFFFF8);
      unint64_t v27 = &v14[v41 / 0xFFFFFFFFFFFFFFFCLL];
      uint64_t v24 = (float *)((char *)v24 - v41);
      long long v42 = &v23[4 * v20 - 16];
      int v43 = v14 - 4;
      uint64_t v44 = v40 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v45 = *(_OWORD *)v43;
        *(v42 - 1) = *((_OWORD *)v43 - 1);
        *long long v42 = v45;
        v42 -= 2;
        v43 -= 8;
        v44 -= 8;
      }
      while (v44);
      if (v40 != (v40 & 0x7FFFFFFFFFFFFFF8)) {
        goto LABEL_21;
      }
LABEL_22:
      unint64_t v16 = (unint64_t)&v23[4 * v22];
      if (v15) {
        operator delete(v15);
      }
      uint64_t v15 = v24;
      float v19 = v8[1];
      if ((unint64_t)v18 < v16) {
        goto LABEL_4;
      }
LABEL_25:
      uint64_t v29 = v18 - v15;
      unint64_t v30 = v29 + 1;
      if ((unint64_t)(v29 + 1) >> 62)
      {
        uint64_t v65 = v18;
        unint64_t v66 = v16;
        __p = v15;
        sub_1C494A220();
      }
      if ((uint64_t)(v16 - (void)v15) >> 1 > v30) {
        unint64_t v30 = (uint64_t)(v16 - (void)v15) >> 1;
      }
      if (v16 - (unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = v30;
      }
      if (v31)
      {
        if (v31 >> 62)
        {
          uint64_t v65 = v18;
          unint64_t v66 = v16;
          __p = v15;
          sub_1C4949AA8();
        }
        uint64_t v32 = operator new(4 * v31);
        int64_t v33 = (float *)&v32[4 * v29];
        float *v33 = v19;
        uint64_t v14 = v33 + 1;
        int64_t v34 = (char *)v18 - (char *)v15;
        if (v18 == v15) {
          goto LABEL_39;
        }
      }
      else
      {
        uint64_t v32 = 0;
        int64_t v33 = (float *)(4 * v29);
        *(float *)(4 * v29) = v19;
        uint64_t v14 = (float *)(4 * v29 + 4);
        int64_t v34 = (char *)v18 - (char *)v15;
        if (v18 == v15) {
          goto LABEL_39;
        }
      }
      unint64_t v35 = v34 - 4;
      if (v35 >= 0xBC)
      {
        unint64_t v39 = ((char *)(v18 - 1) - (char *)v15) & 0xFFFFFFFFFFFFFFFCLL;
        if (&v32[(char *)v18 - (char *)v15 - 4 - v39] > &v32[(char *)v18 - (char *)v15 - 4])
        {
          uint64_t v36 = v18;
        }
        else if ((float *)((char *)v18 - v39 - 4) > v18 - 1)
        {
          uint64_t v36 = v18;
        }
        else if ((unint64_t)((char *)v15 - v32) >= 0x20)
        {
          uint64_t v46 = (v35 >> 2) + 1;
          uint64_t v47 = 4 * (v46 & 0x7FFFFFFFFFFFFFF8);
          uint64_t v36 = &v18[v47 / 0xFFFFFFFFFFFFFFFCLL];
          int64_t v33 = (float *)((char *)v33 - v47);
          double v48 = &v32[4 * v29 - 16];
          double v49 = v18 - 4;
          uint64_t v50 = v46 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v51 = *(_OWORD *)v49;
            *(v48 - 1) = *((_OWORD *)v49 - 1);
            *double v48 = v51;
            v48 -= 2;
            v49 -= 8;
            v50 -= 8;
          }
          while (v50);
          if (v46 == (v46 & 0x7FFFFFFFFFFFFFF8)) {
            goto LABEL_39;
          }
        }
        else
        {
          uint64_t v36 = v18;
        }
      }
      else
      {
        uint64_t v36 = v18;
      }
      do
      {
        int v37 = *((_DWORD *)v36-- - 1);
        *((_DWORD *)v33-- - 1) = v37;
      }
      while (v36 != v15);
LABEL_39:
      unint64_t v16 = (unint64_t)&v32[4 * v31];
      if (v15) {
        operator delete(v15);
      }
      uint64_t v15 = v33;
      v8 += 2;
      if (v8 == v7)
      {
LABEL_63:
        uint64_t v65 = v14;
        id v6 = v59;
        goto LABEL_65;
      }
    }
  }
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  uint64_t v65 = 0;
  unint64_t v66 = 0;
LABEL_65:
  unint64_t v66 = v16;
  __p = v15;
  ddouble x = a5->dx;
  uint64_t v53 = operator new(4uLL);
  *(float *)&ddouble x = dx;
  *uint64_t v53 = LODWORD(dx);
  ddouble y = a5->dy;
  unint64_t v55 = (float *)operator new(8uLL);
  float v56 = dy;
  *unint64_t v55 = *(float *)&dx;
  v55[1] = v56;
  operator delete(v53);
  vDSP_mmul(v15, 1, v55, 1, v6->__begin_, 1, (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4, 1uLL, 2uLL);
  float v57 = a5->dy * a6->y + a5->dx * a6->x;
  float __B = -v57;
  vDSP_vsadd(v6->__begin_, 1, &__B, v6->__begin_, 1, v6->__end_ - v6->__begin_);
  operator delete(v55);
  BOOL result = (vector<float, std::allocator<float>> *)__p;
  if (__p)
  {
    uint64_t v65 = __p;
    operator delete(__p);
  }
  return result;
}

+ (BOOL)linearScratchOutTestForPoints:(const void *)a3 direction:(const CGVector *)a4 origin:(const CGPoint *)a5 threshold:(float)a6 cutIndex:(int64_t *)a7
{
  uint64_t v8 = a7;
  *(float *)&double v7 = a6;
  if (!a7)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v12 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v12, OS_LOG_TYPE_FAULT, "outCutIndex should be nonnull", buf, 2u);
    }
  }
  ddouble y = 0.0;
  CGFloat v116 = 0.0;
  self;
  CGFloat v13 = -a4->dx;
  ddouble y = a4->dy;
  CGFloat v116 = v13;
  objc_msgSend_projectionForPoints_direction_origin_(CHStrokeUtilities, v14, (uint64_t)a3, (uint64_t)&dy, (uint64_t)a5, v15);
  sub_1C49B3BD4(&v111, (uint64_t)CHStrokeUtilities, (uint64_t)buf);
  unint64_t v16 = *(const float **)buf;
  uint64_t v109 = 0;
  uint64_t v110 = 0;
  uint64_t v108 = 0;
  unint64_t v17 = (unint64_t)v114 - *(void *)buf;
  vDSP_Length v18 = ((uint64_t)v114 - *(void *)buf) >> 2;
  if (v114 == *(const float **)buf)
  {
    float v19 = 0;
  }
  else
  {
    if ((v17 & 0x8000000000000000) != 0) {
      sub_1C494A220();
    }
    float v19 = (char *)operator new((size_t)v114 - *(void *)buf);
    uint64_t v108 = v19;
    uint64_t v110 = &v19[4 * v18];
    bzero(v19, v17 & 0xFFFFFFFFFFFFFFFCLL);
    uint64_t v109 = v110;
  }
  vDSP_vneg(v16, 1, (float *)v19, 1, v18);
  sub_1C49B3BD4((char **)&v106, (uint64_t)CHStrokeUtilities, (uint64_t)&v108);
  CGFloat v103 = 0;
  *(void *)CGFloat v104 = 0;
  CGFloat v105 = 0;
  unint64_t v21 = v111;
  uint64_t v20 = v112;
  vDSP_Length v22 = ((v112 - v111) >> 3) + ((v107 - (unsigned char *)v106) >> 3);
  if (v22)
  {
    if (v22 >> 61) {
      sub_1C494A220();
    }
    uint64_t v23 = (char *)operator new(8 * v22);
    CGFloat v103 = v23;
    *(void *)CGFloat v104 = v23;
    CGFloat v105 = &v23[8 * v22];
  }
  else
  {
    uint64_t v23 = 0;
  }
  sub_1C49B79D0((unint64_t *)&v103, v23, v21, v20, (v20 - v21) >> 3);
  sub_1C49B79D0((unint64_t *)&v103, *(void **)v104, (char *)v106, v107, (v107 - (unsigned char *)v106) >> 3);
  std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>();
  __p = 0;
  uint64_t v101 = 0;
  CGFloat v102 = 0;
  if (v22)
  {
    uint64_t v24 = (char *)operator new(4 * v22);
    int64_t v25 = &v24[4 * v22];
    __p = v24;
    uint64_t v101 = v24;
    CGFloat v102 = v25;
    unint64_t v26 = (uint64_t *)v103;
    unint64_t v27 = *(uint64_t **)v104;
    if (v103 == *(void **)v104) {
      goto LABEL_51;
    }
    goto LABEL_19;
  }
  int64_t v25 = 0;
  uint64_t v24 = 0;
  unint64_t v26 = (uint64_t *)v103;
  unint64_t v27 = *(uint64_t **)v104;
  if (v103 != *(void **)v104)
  {
LABEL_19:
    vDSP_Length v83 = v22;
    float v84 = a3;
    CGFloat v86 = v8;
    int v28 = v24;
    while (1)
    {
      while (1)
      {
        uint64_t v29 = *v26;
        unint64_t v30 = *(const float **)buf;
        if (v28 >= v25) {
          break;
        }
        *(_DWORD *)int v28 = *(_DWORD *)(*(void *)buf + 4 * v29);
        v28 += 4;
        uint64_t v101 = v28;
        if (++v26 == v27) {
          goto LABEL_50;
        }
      }
      uint64_t v31 = (v28 - v24) >> 2;
      unint64_t v32 = v31 + 1;
      if ((unint64_t)(v31 + 1) >> 62) {
        sub_1C494A220();
      }
      if ((v25 - v24) >> 1 > v32) {
        unint64_t v32 = (v25 - v24) >> 1;
      }
      if ((unint64_t)(v25 - v24) >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v33 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v33 = v32;
      }
      if (v33)
      {
        if (v33 >> 62) {
          sub_1C4949AA8();
        }
        int64_t v34 = operator new(4 * v33);
        unint64_t v35 = &v34[4 * v31];
        *unint64_t v35 = LODWORD(v30[v29]);
        uint64_t v36 = (uint64_t)(v35 + 1);
        int64_t v37 = v28 - v24;
        if (v28 == v24) {
          goto LABEL_36;
        }
      }
      else
      {
        int64_t v34 = 0;
        unint64_t v35 = (_DWORD *)(4 * v31);
        *(_DWORD *)(4 * v31) = *(_DWORD *)(*(void *)buf + 4 * v29);
        uint64_t v36 = 4 * v31 + 4;
        int64_t v37 = v28 - v24;
        if (v28 == v24) {
          goto LABEL_36;
        }
      }
      unint64_t v38 = v37 - 4;
      if (v38 >= 0xBC)
      {
        unint64_t v41 = (v28 - 4 - v24) & 0xFFFFFFFFFFFFFFFCLL;
        if (&v34[v28 - v24 - 4 - v41] > &v34[v28 - v24 - 4])
        {
          unint64_t v39 = v28;
        }
        else if (&v28[-v41 - 4] > v28 - 4)
        {
          unint64_t v39 = v28;
        }
        else if ((unint64_t)(v24 - v34) >= 0x20)
        {
          uint64_t v42 = (v38 >> 2) + 1;
          uint64_t v43 = 4 * (v42 & 0x7FFFFFFFFFFFFFF8);
          unint64_t v39 = &v28[-v43];
          unint64_t v35 = (_DWORD *)((char *)v35 - v43);
          uint64_t v44 = &v34[4 * v31 - 16];
          long long v45 = v28 - 16;
          uint64_t v46 = v42 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v47 = *(_OWORD *)v45;
            *(v44 - 1) = *((_OWORD *)v45 - 1);
            _OWORD *v44 = v47;
            v44 -= 2;
            v45 -= 32;
            v46 -= 8;
          }
          while (v46);
          if (v42 == (v42 & 0x7FFFFFFFFFFFFFF8)) {
            goto LABEL_36;
          }
        }
        else
        {
          unint64_t v39 = v28;
        }
      }
      else
      {
        unint64_t v39 = v28;
      }
      do
      {
        int v40 = *((_DWORD *)v39 - 1);
        v39 -= 4;
        *--unint64_t v35 = v40;
      }
      while (v39 != v24);
LABEL_36:
      int64_t v25 = &v34[4 * v33];
      __p = v35;
      CGFloat v102 = v25;
      if (v24) {
        operator delete(v24);
      }
      uint64_t v24 = (char *)v35;
      uint64_t v101 = (char *)v36;
      ++v26;
      int v28 = (char *)v36;
      if (v26 == v27)
      {
LABEL_50:
        uint64_t v24 = (char *)__p;
        uint64_t v8 = v86;
        vDSP_Length v22 = v83;
        a3 = v84;
        break;
      }
    }
  }
LABEL_51:
  vDSP_Length __C = 0;
  vDSP_Length __D = 0;
  vDSP_nzcros((const float *)v24, 1, v22, &__C, &__D, v22);
  unint64_t v48 = v22 - 1;
  if (v22 < 4 || (float)((float)__D / (float)v48) > *(float *)&v7)
  {
    *uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    BOOL v58 = 1;
    id v59 = __p;
    if (!__p) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  double v95 = 0;
  CGFloat v96 = 0;
  uint64_t v97 = 0;
  if (v48 >> 60) {
    sub_1C494A220();
  }
  double v49 = (float64x2_t *)operator new(16 * v48);
  uint64_t v50 = v49;
  double v95 = v49;
  CGFloat v96 = v49;
  uint64_t v97 = &v49[v48];
  long long v51 = v103;
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t v87 = _Q0;
  if (*(void *)v104 - (void)v103 == 8)
  {
    float v57 = (double *)v49;
    goto LABEL_91;
  }
  unint64_t v61 = 0;
  do
  {
    uint64_t v62 = v51[v61++];
    float64x2_t v63 = vmulq_f64(vaddq_f64(*(float64x2_t *)(*(void *)a3 + 16 * v62), *(float64x2_t *)(*(void *)a3 + 16 * v51[v61])), v87);
    if (v50 < v97)
    {
      *v50++ = v63;
      goto LABEL_71;
    }
    float v64 = (float64x2_t *)v95;
    uint64_t v65 = ((char *)v50 - (unsigned char *)v95) >> 4;
    unint64_t v66 = v65 + 1;
    if ((unint64_t)(v65 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v67 = (char *)v97 - (unsigned char *)v95;
    if (((char *)v97 - (unsigned char *)v95) >> 3 > v66) {
      unint64_t v66 = v67 >> 3;
    }
    if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v68 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v68 = v66;
    }
    if (v68)
    {
      float64x2_t v85 = v63;
      if (v68 >> 60) {
        sub_1C4949AA8();
      }
      float v69 = (char *)operator new(16 * v68);
      float v70 = (float64x2_t *)&v69[16 * v65];
      CGVector v71 = &v69[16 * v68];
      float64x2_t *v70 = v85;
      id v72 = v70 + 1;
      if (v50 != v64)
      {
        do
        {
LABEL_84:
          v70[-1] = v50[-1];
          --v70;
          --v50;
        }
        while (v50 != v64);
        uint64_t v50 = (float64x2_t *)v95;
        double v95 = v70;
        CGFloat v96 = v72;
        uint64_t v97 = (float64x2_t *)v71;
        if (!v50) {
          goto LABEL_89;
        }
        goto LABEL_88;
      }
    }
    else
    {
      float v70 = (float64x2_t *)(16 * v65);
      CGVector v71 = 0;
      double v73 = (float64x2_t *)(16 * v65);
      *double v73 = v63;
      id v72 = v73 + 1;
      if (v50 != v64) {
        goto LABEL_84;
      }
    }
    double v95 = v70;
    CGFloat v96 = v72;
    uint64_t v97 = (float64x2_t *)v71;
LABEL_88:
    operator delete(v50);
LABEL_89:
    uint64_t v50 = v72;
LABEL_71:
    CGFloat v96 = v50;
    long long v51 = v103;
  }
  while (v61 < ((uint64_t)(*(void *)v104 - (void)v103) >> 3) - 1);
  float v57 = (double *)v95;
  double v7 = *(double *)v95;
LABEL_91:
  double v74 = v50[-1].f64[0];
  double v75 = v50[-1].f64[1];
  double v76 = v57[1];
  self;
  double v93 = v75 - v76;
  double v94 = -(v74 - v7);
  self;
  double v79 = v75 - v76;
  double v80 = v94;
  float v81 = sqrt(v80 * v80 + v79 * v79);
  if (v81 > 0.0)
  {
    double v82 = v81;
    double v79 = v93 / v82;
    double v80 = v94 / v82;
  }
  double v93 = v79;
  double v94 = v80;
  float64x2_t v92 = vmulq_f64(vaddq_f64(*(float64x2_t *)v95, v96[-1]), v87);
  objc_msgSend_projectionForPoints_direction_origin_(CHStrokeUtilities, v77, (uint64_t)&v95, (uint64_t)&v93, (uint64_t)&v92, v78);
  float v89 = 0.0;
  vDSP_Length __I = 0;
  vDSP_maxmgvi((const float *)v90, 1, &v89, &__I, (v91 - (unsigned char *)v90) >> 2);
  *uint64_t v8 = (uint64_t)((double)(unint64_t)(*((void *)v103 + __I + 1) + *((void *)v103 + __I)) * 0.5);
  if (v90)
  {
    double v91 = v90;
    operator delete(v90);
  }
  if (v95)
  {
    CGFloat v96 = (float64x2_t *)v95;
    operator delete(v95);
  }
  BOOL v58 = 0;
  id v59 = __p;
  if (__p) {
LABEL_57:
  }
    operator delete(v59);
LABEL_58:
  if (v103)
  {
    *(void *)CGFloat v104 = v103;
    operator delete(v103);
  }
  if (v106)
  {
    uint64_t v107 = (char *)v106;
    operator delete(v106);
  }
  if (v108) {
    operator delete(v108);
  }
  if (v111)
  {
    uint64_t v112 = v111;
    operator delete(v111);
  }
  if (*(void *)buf)
  {
    uint64_t v114 = *(const float **)buf;
    operator delete(*(void **)buf);
  }
  return v58;
}

+ (BOOL)linearScratchOutTestForPoints:(const void *)a3 threshold:(float)a4 cutIndex:(int64_t *)a5
{
  if (!a5)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v8 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "outCutIndex should be nonnull", buf, 2u);
    }
  }
  objc_msgSend_principalComponentsForPoints_outFirstComponent_outSecondComponent_outMeanPoint_(CHStrokeUtilities, a2, (uint64_t)a3, (uint64_t)buf, (uint64_t)v20, (uint64_t)v19);
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  *(float *)&double v9 = a4;
  if (objc_msgSend_linearScratchOutTestForPoints_direction_origin_threshold_cutIndex_(CHStrokeUtilities, v10, (uint64_t)a3, (uint64_t)buf, (uint64_t)v19, (uint64_t)&v18, v9))
  {
    LOBYTE(v13) = 1;
    int64_t v14 = v18;
  }
  else
  {
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    *(float *)&double v12 = a4;
    int v13 = objc_msgSend_linearScratchOutTestForPoints_direction_origin_threshold_cutIndex_(CHStrokeUtilities, v11, (uint64_t)a3, (uint64_t)v20, (uint64_t)v19, (uint64_t)&v17, v12);
    if (v13) {
      uint64_t v15 = &v17;
    }
    else {
      uint64_t v15 = &v18;
    }
    int64_t v14 = *v15;
  }
  *a5 = v14;
  return v13;
}

+ (vector<_NSRange,)segmentationRangesForScratchOutPoints:(id)a2
{
  uint64_t v4 = retstr;
  v258[1] = *MEMORY[0x1E4F143B8];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  id v6 = *(double **)a4;
  uint64_t v5 = *((void *)a4 + 1);
  double v7 = (_NSRange *)operator new(0x10uLL);
  v7->NSUInteger location = 0;
  v7->NSUInteger length = (v5 - (uint64_t)v6) >> 4;
  v4->var1 = v7 + 1;
  v4->var2.var0 = v7 + 1;
  v4->var0 = v7;
  uint64_t v8 = 0;
  __dst = (vector<_NSRange, std::allocator<_NSRange>> *)operator new(8uLL);
  int64x2_t v248 = vdupq_n_s64(1uLL);
  __dst->var0 = (_NSRange *)1;
  double v9 = off_1E64E0000;
  unint64_t v10 = 1;
  while (1)
  {
    size_t v11 = __dst;
    if (v10 <= 0x3F && (v10 & 0x3F) == 0) {
      break;
    }
    int v12 = 0;
    while ((((unint64_t)v11->var0 >> v12) & 1) == 0)
    {
      size_t v11 = (vector<_NSRange, std::allocator<_NSRange>> *)((char *)v11 + 8 * (v12 == 63));
      if (v12 == 63) {
        int v12 = 0;
      }
      else {
        ++v12;
      }
      if (v12 == (v10 & 0x3F) && v11 == (vector<_NSRange, std::allocator<_NSRange>> *)((char *)__dst + 8 * (v10 >> 6))) {
        goto LABEL_169;
      }
    }
    memset(buf, 0, sizeof(buf));
    __src = 0;
    unint64_t v253 = 0;
    unint64_t v254 = 0;
    var1 = v4->var1;
    int64_t v14 = (char *)var1 - (char *)v4->var0;
    unint64_t v15 = v14 >> 4;
    if (var1 != v4->var0)
    {
      if (v14 < 0) {
        sub_1C494A220();
      }
      *(void *)buf = operator new(v14);
      *(void *)&uint8_t buf[8] = *(void *)buf;
      *(void *)&uint8_t buf[16] = *(void *)buf + 16 * v15;
    }
    sub_1C49B61EC((uint64_t)&__src, v15);
    uint64_t v243 = v8;
    var0 = v4->var0;
    if (v4->var1 != v4->var0)
    {
      for (unint64_t i = 0; i < v34->var1 - v34->var0; ++i)
      {
        uint64_t v24 = &var0[i];
        int64_t v25 = *(double **)a4;
        NSUInteger location = v24->location;
        NSUInteger length = v24->length;
        v250 = 0;
        v251 = 0;
        __p = 0;
        if (length)
        {
          int v28 = &v25[2 * location];
          uint64_t v29 = &v25[2 * length + 2 * location];
          int64_t v30 = (char *)v29 - (char *)v28;
          if ((char *)v29 - (char *)v28 < 0) {
            sub_1C494A220();
          }
          __p = operator new((char *)v29 - (char *)v28);
          v250 = (__CFString *)__p;
          uint64_t v31 = (__CFString *)((char *)__p + 16 * (v30 >> 4));
          v251 = v31;
          memmove(__p, v28, v30);
          v250 = v31;
        }
        if ((*(unint64_t *)((char *)&__dst->var0 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) >> i))
        {
          v258[0] = 0x7FFFFFFFFFFFFFFFLL;
          LODWORD(v19.location) = 0.5;
          if (objc_msgSend_linearScratchOutTestForPoints_threshold_cutIndex_(v9[182], v16, (uint64_t)&__p, (uint64_t)v258, v17, v18, *(double *)&v19.location))
          {
            unint64_t v32 = *(char **)&buf[8];
            if (*(void *)&buf[8] < *(void *)&buf[16])
            {
              _NSRange v19 = *v24;
              **(_OWORD **)&uint8_t buf[8] = *v24;
              unint64_t v33 = v32 + 16;
              int64_t v34 = retstr;
LABEL_100:
              *(void *)&uint8_t buf[8] = v33;
              unint64_t v79 = v253;
              if (v253 == v254 << 6)
              {
                if ((uint64_t)(v253 + 1) < 0) {
                  sub_1C494A220();
                }
                unint64_t v80 = v254 << 7;
                if (v254 << 7 <= (v253 & 0xFFFFFFFFFFFFFFC0) + 64) {
                  unint64_t v80 = (v253 & 0xFFFFFFFFFFFFFFC0) + 64;
                }
                if (v253 <= 0x3FFFFFFFFFFFFFFELL) {
                  unint64_t v81 = v80;
                }
                else {
                  unint64_t v81 = 0x7FFFFFFFFFFFFFFFLL;
                }
                sub_1C49B61EC((uint64_t)&__src, v81);
                unint64_t v79 = v253;
              }
              unint64_t v253 = v79 + 1;
              *(void *)((char *)__src + ((v79 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v79);
              uint64_t v23 = (__CFString *)__p;
              if (!__p) {
                goto LABEL_20;
              }
LABEL_19:
              v250 = v23;
              operator delete(v23);
              goto LABEL_20;
            }
            unint64_t v52 = *(char **)buf;
            uint64_t v53 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 4;
            unint64_t v54 = v53 + 1;
            int64_t v34 = retstr;
            if ((unint64_t)(v53 + 1) >> 60) {
              sub_1C494A220();
            }
            uint64_t v55 = *(void *)&buf[16] - *(void *)buf;
            if ((uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 3 > v54) {
              unint64_t v54 = v55 >> 3;
            }
            if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v56 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v56 = v54;
            }
            if (v56)
            {
              if (v56 >> 60) {
                sub_1C4949AA8();
              }
              float v57 = (char *)operator new(16 * v56);
              int64_t v34 = retstr;
              BOOL v58 = &v57[16 * v53];
              _NSRange v19 = *v24;
              *(_NSRange *)BOOL v58 = *v24;
              uint64_t v59 = (uint64_t)v58;
              if (v32 == v52) {
                goto LABEL_98;
              }
              do
              {
LABEL_96:
                _NSRange v19 = (_NSRange)*((_OWORD *)v32 - 1);
                *(_NSRange *)(v59 - 16) = v19;
                v59 -= 16;
                v32 -= 16;
              }
              while (v32 != v52);
              unint64_t v32 = *(char **)buf;
            }
            else
            {
              float v57 = 0;
              BOOL v58 = (char *)(16 * v53);
              _NSRange v19 = *v24;
              *(_NSRange *)(16 * v53) = *v24;
              uint64_t v59 = 16 * v53;
              if (v32 != v52) {
                goto LABEL_96;
              }
            }
LABEL_98:
            unint64_t v33 = v58 + 16;
            *(void *)buf = v59;
            *(void *)&uint8_t buf[8] = v58 + 16;
            *(void *)&uint8_t buf[16] = &v57[16 * v56];
            if (v32) {
              operator delete(v32);
            }
            goto LABEL_100;
          }
          int64_t v37 = v9;
          NSUInteger v38 = v24->location;
          uint64_t v39 = v258[0];
          uint64_t v40 = v258[0] + 1;
          NSUInteger v41 = var0[i].length;
          uint64_t v42 = *(void **)&buf[8];
          if (*(void *)&buf[8] < *(void *)&buf[16])
          {
            **(void **)&uint8_t buf[8] = v38;
            v42[1] = v40;
            uint64_t v43 = v42 + 2;
            goto LABEL_116;
          }
          uint64_t v60 = *(void **)buf;
          uint64_t v61 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 4;
          unint64_t v62 = v61 + 1;
          if ((unint64_t)(v61 + 1) >> 60) {
            goto LABEL_198;
          }
          uint64_t v63 = *(void *)&buf[16] - *(void *)buf;
          if ((uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 3 > v62) {
            unint64_t v62 = v63 >> 3;
          }
          if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v64 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v64 = v62;
          }
          if (v64)
          {
            if (v64 >> 60) {
              goto LABEL_200;
            }
            uint64_t v65 = (char *)operator new(16 * v64);
            unint64_t v66 = &v65[16 * v61];
            *(void *)unint64_t v66 = v38;
            *((void *)v66 + 1) = v40;
            uint64_t v67 = (uint64_t)v66;
            if (v42 == v60)
            {
LABEL_114:
              vDSP_Length v83 = &v65[16 * v64];
              uint64_t v43 = v66 + 16;
              *(void *)buf = v67;
              *(void *)&uint8_t buf[8] = v66 + 16;
              *(void *)&uint8_t buf[16] = v83;
              if (v42) {
                goto LABEL_115;
              }
              goto LABEL_116;
            }
          }
          else
          {
            uint64_t v65 = 0;
            unint64_t v66 = (char *)(16 * v61);
            *(void *)unint64_t v66 = v38;
            *((void *)v66 + 1) = v40;
            uint64_t v67 = 16 * v61;
            if (v42 == v60) {
              goto LABEL_114;
            }
          }
          do
          {
            _NSRange v19 = (_NSRange)*((_OWORD *)v42 - 1);
            *(_NSRange *)(v67 - 16) = v19;
            v67 -= 16;
            v42 -= 2;
          }
          while (v42 != v60);
          uint64_t v42 = *(void **)buf;
          double v82 = &v65[16 * v64];
          uint64_t v43 = v66 + 16;
          *(void *)buf = v67;
          *(void *)&uint8_t buf[8] = v66 + 16;
          *(void *)&uint8_t buf[16] = v82;
          if (v42) {
LABEL_115:
          }
            operator delete(v42);
LABEL_116:
          *(void *)&uint8_t buf[8] = v43;
          unint64_t v84 = v253;
          if (v253 == v254 << 6)
          {
            if ((uint64_t)(v253 + 1) < 0) {
              sub_1C494A220();
            }
            if (v253 > 0x3FFFFFFFFFFFFFFELL)
            {
              unint64_t v85 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else if (v254 << 7 <= (v253 & 0xFFFFFFFFFFFFFFC0) + 64)
            {
              unint64_t v85 = (v253 & 0xFFFFFFFFFFFFFFC0) + 64;
            }
            else
            {
              unint64_t v85 = v254 << 7;
            }
            sub_1C49B61EC((uint64_t)&__src, v85);
            unint64_t v84 = v253;
            uint64_t v43 = *(void **)&buf[8];
          }
          uint64_t v86 = v39 + v38;
          uint64_t v87 = v41 - v39;
          unint64_t v253 = v84 + 1;
          *(void *)((char *)__src + ((v84 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v84;
          if ((unint64_t)v43 < *(void *)&buf[16])
          {
            *uint64_t v43 = v86;
            v43[1] = v87;
            uint64_t v88 = v43 + 2;
            int64_t v34 = retstr;
            double v9 = v37;
            goto LABEL_139;
          }
          float v89 = *(void **)buf;
          uint64_t v90 = ((uint64_t)v43 - *(void *)buf) >> 4;
          unint64_t v91 = v90 + 1;
          if ((unint64_t)(v90 + 1) >> 60) {
LABEL_198:
          }
            sub_1C494A220();
          uint64_t v92 = *(void *)&buf[16] - *(void *)buf;
          if ((uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 3 > v91) {
            unint64_t v91 = v92 >> 3;
          }
          if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v93 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v93 = v91;
          }
          if (v93)
          {
            if (v93 >> 60) {
LABEL_200:
            }
              sub_1C4949AA8();
            double v94 = (char *)operator new(16 * v93);
            double v95 = &v94[16 * v90];
            *(void *)double v95 = v86;
            *((void *)v95 + 1) = v87;
            double v9 = v37;
            uint64_t v96 = (uint64_t)v95;
            if (v43 != v89)
            {
LABEL_135:
              int64_t v34 = retstr;
              do
              {
                _NSRange v19 = (_NSRange)*((_OWORD *)v43 - 1);
                *(_NSRange *)(v96 - 16) = v19;
                v96 -= 16;
                v43 -= 2;
              }
              while (v43 != v89);
              uint64_t v43 = *(void **)buf;
              uint64_t v88 = v95 + 16;
              *(void *)buf = v96;
              *(void *)&uint8_t buf[8] = v95 + 16;
              *(void *)&uint8_t buf[16] = &v94[16 * v93];
              if (v43) {
LABEL_138:
              }
                operator delete(v43);
LABEL_139:
              *(void *)&uint8_t buf[8] = v88;
              unint64_t v97 = v253;
              if (v253 == v254 << 6)
              {
                if ((uint64_t)(v253 + 1) < 0) {
                  sub_1C494A220();
                }
                unint64_t v98 = v254 << 7;
                if (v254 << 7 <= (v253 & 0xFFFFFFFFFFFFFFC0) + 64) {
                  unint64_t v98 = (v253 & 0xFFFFFFFFFFFFFFC0) + 64;
                }
                if (v253 <= 0x3FFFFFFFFFFFFFFELL) {
                  unint64_t v99 = v98;
                }
                else {
                  unint64_t v99 = 0x7FFFFFFFFFFFFFFFLL;
                }
                sub_1C49B61EC((uint64_t)&__src, v99);
                unint64_t v97 = v253;
              }
              unint64_t v253 = v97 + 1;
              *(void *)((char *)__src + ((v97 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v97;
              uint64_t v23 = (__CFString *)__p;
              if (!__p) {
                goto LABEL_20;
              }
              goto LABEL_19;
            }
          }
          else
          {
            double v94 = 0;
            double v95 = (char *)(16 * v90);
            *(void *)double v95 = v86;
            *((void *)v95 + 1) = v87;
            double v9 = v37;
            uint64_t v96 = 16 * v90;
            if (v43 != v89) {
              goto LABEL_135;
            }
          }
          int64_t v34 = retstr;
          uint64_t v88 = v95 + 16;
          *(void *)buf = v96;
          *(void *)&uint8_t buf[8] = v95 + 16;
          *(void *)&uint8_t buf[16] = &v94[16 * v93];
          if (v43) {
            goto LABEL_138;
          }
          goto LABEL_139;
        }
        unint64_t v35 = *(char **)&buf[8];
        if (*(void *)&buf[8] < *(void *)&buf[16])
        {
          _NSRange v19 = *v24;
          **(_OWORD **)&uint8_t buf[8] = *v24;
          uint64_t v36 = v35 + 16;
          int64_t v34 = retstr;
          goto LABEL_68;
        }
        uint64_t v44 = *(char **)buf;
        uint64_t v45 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 4;
        unint64_t v46 = v45 + 1;
        int64_t v34 = retstr;
        if ((unint64_t)(v45 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v47 = *(void *)&buf[16] - *(void *)buf;
        if ((uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 3 > v46) {
          unint64_t v46 = v47 >> 3;
        }
        if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v48 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v48 = v46;
        }
        if (v48)
        {
          if (v48 >> 60) {
            sub_1C4949AA8();
          }
          double v49 = (char *)operator new(16 * v48);
          uint64_t v50 = &v49[16 * v45];
          _NSRange v19 = *v24;
          *(_NSRange *)uint64_t v50 = *v24;
          uint64_t v51 = (uint64_t)v50;
          if (v35 == v44)
          {
LABEL_66:
            uint64_t v36 = v50 + 16;
            *(void *)buf = v51;
            *(void *)&uint8_t buf[8] = v50 + 16;
            *(void *)&uint8_t buf[16] = &v49[16 * v48];
            if (!v35) {
              goto LABEL_68;
            }
LABEL_67:
            operator delete(v35);
            goto LABEL_68;
          }
        }
        else
        {
          double v49 = 0;
          uint64_t v50 = (char *)(16 * v45);
          _NSRange v19 = *v24;
          *(_NSRange *)(16 * v45) = *v24;
          uint64_t v51 = 16 * v45;
          if (v35 == v44) {
            goto LABEL_66;
          }
        }
        do
        {
          _NSRange v19 = (_NSRange)*((_OWORD *)v35 - 1);
          *(_NSRange *)(v51 - 16) = v19;
          v51 -= 16;
          v35 -= 16;
        }
        while (v35 != v44);
        unint64_t v35 = *(char **)buf;
        uint64_t v36 = v50 + 16;
        *(void *)buf = v51;
        *(void *)&uint8_t buf[8] = v50 + 16;
        *(void *)&uint8_t buf[16] = &v49[16 * v48];
        if (v35) {
          goto LABEL_67;
        }
LABEL_68:
        *(void *)&uint8_t buf[8] = v36;
        unint64_t v22 = v253;
        if (v253 != v254 << 6) {
          goto LABEL_18;
        }
        if ((uint64_t)(v253 + 1) < 0) {
          goto LABEL_199;
        }
        if (v253 > 0x3FFFFFFFFFFFFFFELL)
        {
          unint64_t v68 = 0x7FFFFFFFFFFFFFFFLL;
          if (v253 >= 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v22 = -1;
            goto LABEL_18;
          }
          goto LABEL_77;
        }
        unint64_t v68 = v254 << 7;
        if (v254 << 7 <= (v253 & 0xFFFFFFFFFFFFFFC0) + 64) {
          unint64_t v68 = (v253 & 0xFFFFFFFFFFFFFFC0) + 64;
        }
        if (v253 < v68)
        {
          if ((v68 & 0x8000000000000000) != 0) {
LABEL_199:
          }
            sub_1C494A220();
LABEL_77:
          unint64_t v69 = ((v68 - 1) >> 6) + 1;
          float v70 = (uint64_t *)operator new(8 * v69);
          CGVector v71 = __src;
          unint64_t v72 = (v22 - 1) >> 6;
          if (v22 < 0x41) {
            unint64_t v72 = 0;
          }
          v70[v72] = 0;
          if (v22 > 0x3F || (v22 & 0x3F) != 0)
          {
            int v73 = 0;
            int v74 = 0;
            double v75 = v70;
            double v76 = v71;
            do
            {
              uint64_t v77 = 1 << v73;
              if ((*v76 >> v74)) {
                uint64_t v78 = *v75 | v77;
              }
              else {
                uint64_t v78 = *v75 & ~v77;
              }
              *double v75 = v78;
              v76 += v74 == 63;
              if (v74 == 63) {
                int v74 = 0;
              }
              else {
                ++v74;
              }
              v75 += v73 == 63;
              if (v73 == 63) {
                int v73 = 0;
              }
              else {
                ++v73;
              }
            }
            while (v74 != (v22 & 0x3F) || v76 != &v71[v22 >> 6]);
          }
          __src = v70;
          unint64_t v254 = v69;
          if (v71)
          {
            operator delete(v71);
            unint64_t v22 = v253;
          }
        }
LABEL_18:
        unint64_t v253 = v22 + 1;
        *(void *)((char *)__src + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v22);
        uint64_t v23 = (__CFString *)__p;
        if (__p) {
          goto LABEL_19;
        }
LABEL_20:
        var0 = v34->var0;
      }
    }
    uint64_t v4 = retstr;
    if (buf != (uint8_t *)retstr) {
      sub_1C49B7D84(retstr, *(char **)buf, *(char **)&buf[8], (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 4);
    }
    unint64_t v100 = v253;
    if (v253)
    {
      uint64_t v101 = __dst;
      if (v253 <= v248.i64[1] << 6)
      {
        unint64_t v102 = v253 - 1;
      }
      else
      {
        if (__dst)
        {
          operator delete(__dst);
          unint64_t v100 = v253;
        }
        if ((v100 & 0x8000000000000000) != 0) {
          sub_1C494A220();
        }
        unint64_t v102 = v100 - 1;
        unint64_t v103 = ((v100 - 1) >> 6) + 1;
        uint64_t v101 = (vector<_NSRange, std::allocator<_NSRange>> *)operator new(8 * v103);
        __dst = v101;
        v248.i64[1] = v103;
      }
      memmove(v101, __src, ((v102 >> 3) & 0x1FFFFFFFFFFFFFF8) + 8);
      CGFloat v104 = __src;
      unint64_t v10 = v253;
      if (!__src) {
        goto LABEL_165;
      }
    }
    else
    {
      unint64_t v10 = 0;
      CGFloat v104 = __src;
      if (!__src) {
        goto LABEL_165;
      }
    }
    operator delete(v104);
LABEL_165:
    if (*(void *)buf)
    {
      *(void *)&uint8_t buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }
    uint64_t v8 = v243 + 1;
    if (v243 == 2) {
      goto LABEL_174;
    }
  }
LABEL_169:
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  CGFloat v105 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_1C492D000, v105, OS_LOG_TYPE_DEBUG, "linearSegmentationForScratchOutPoints: early stopping at iteration %ld", buf, 0xCu);
  }

  uint64_t v4 = retstr;
LABEL_174:
  self;
  if (os_variant_has_internal_diagnostics())
  {
    v244 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v106, v107, v108, v109, v110);
    CGFloat v116 = v4->var0;
    uint64_t v117 = v4->var1;
    if (v4->var0 != v117)
    {
      do
      {
        uint64_t v118 = objc_msgSend_stringWithFormat_(NSString, v111, @"[%ld, %ld]", v113, v114, v115, v116->location, v116->length);
        objc_msgSend_addObject_(v244, v119, (uint64_t)v118, v120, v121, v122);

        ++v116;
      }
      while (v116 != v117);
    }
    v241 = objc_msgSend_string(MEMORY[0x1E4F28E78], v111, v112, v113, v114, v115);
    objc_msgSend_appendString_(v241, v123, @"[", v124, v125, v126);
    id v131 = objc_msgSend_componentsJoinedByString_(v244, v127, @", ", v128, v129, v130);
    objc_msgSend_appendString_(v241, v132, (uint64_t)v131, v133, v134, v135);

    objc_msgSend_appendString_(v241, v136, @"]", v137, v138, v139);
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v140 = (id)qword_1EA3C9FA0;
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
    {
      int64_t v141 = retstr->var1 - retstr->var0;
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v141;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v241;
      _os_log_impl(&dword_1C492D000, v140, OS_LOG_TYPE_DEBUG, "segmentationRangesForScratchOutPoints, number of segments: %ld, segmentation ranges (loc, len) %@", buf, 0x16u);
    }

    v147 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v142, v143, v144, v145, v146);
    v240 = objc_msgSend_dictionaryForKey_(v147, v148, @"com.apple.corehandwriting", v149, v150, v151);

    uint64_t v156 = objc_msgSend_objectForKey_(v240, v152, @"CHLogScratchOutGesture", v153, v154, v155);
    char v162 = objc_msgSend_BOOLValue(v156, v157, v158, v159, v160, v161);

    if (v162)
    {
      v242 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v163, v164, v165, v166, v167);
      v173 = retstr->var0;
      id v172 = retstr->var1;
      if (retstr->var0 != v172)
      {
        do
        {
          uint64_t v174 = v173->location;
          uint64_t v175 = v173->length;
          __p = @"location";
          v176 = objc_msgSend_numberWithInteger_(NSNumber, v168, v174, v169, v170, v171);
          __src = v176;
          v250 = @"length";
          long long v181 = objc_msgSend_numberWithInteger_(NSNumber, v177, v175, v178, v179, v180);
          unint64_t v253 = (unint64_t)v181;
          v184 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v182, (uint64_t)&__src, (uint64_t)&__p, 2, v183);

          objc_msgSend_addObject_(v242, v185, (uint64_t)v184, v186, v187, v188);
          ++v173;
        }
        while (v173 != v172);
      }
      v257 = @"segmentationRanges";
      v258[0] = v242;
      v189 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v168, (uint64_t)v258, (uint64_t)&v257, 1, v171);
      v195 = objc_alloc_init(CHDrawing);
      v196 = *(double **)a4;
      v197 = (double *)*((void *)a4 + 1);
      if (*(double **)a4 != v197)
      {
        do
        {
          objc_msgSend_addPoint_(v195, v190, v191, v192, v193, v194, *v196, v196[1]);
          v196 += 2;
        }
        while (v196 != v197);
      }
      objc_msgSend_endStroke(v195, v190, v191, v192, v193, v194);
      if (qword_1EA3C90E8 != -1) {
        dispatch_once(&qword_1EA3C90E8, &unk_1F2010A00);
      }
      id v198 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      objc_msgSend_setDateFormat_(v198, v199, @"dd-MM-yyyy-HH-mm-ss-SSS", v200, v201, v202);
      v208 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v203, v204, v205, v206, v207);
      v214 = objc_msgSend_UUIDString(v208, v209, v210, v211, v212, v213);
      v219 = objc_msgSend_substringToIndex_(v214, v215, 4, v216, v217, v218);

      v225 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v220, v221, v222, v223, v224);
      v230 = objc_msgSend_stringFromDate_(v198, v226, (uint64_t)v225, v227, v228, v229);

      v235 = objc_msgSend_stringWithFormat_(NSString, v231, @"drawing_%@_%@.json", v232, v233, v234, v230, v219);
      objc_msgSend_writeToFileWithContext_folder_basename_(v195, v236, (uint64_t)v189, qword_1EA3C90E0, (uint64_t)v235, v237);
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v238 = (id)qword_1EA3C9FB0;
      if (os_log_type_enabled(v238, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = @"CHLogScratchOutGesture";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = qword_1EA3C90E0;
        *(_WORD *)&buf[22] = 2112;
        v256 = v235;
        _os_log_impl(&dword_1C492D000, v238, OS_LOG_TYPE_DEFAULT, "%@ serialize drawing to %@/%@", buf, 0x20u);
      }
    }
  }
  BOOL result = __dst;
  if (__dst) {
    operator delete(__dst);
  }
  return result;
}

+ (id)polygonSetForScratchOutStroke:(id)a3
{
  id v3 = a3;
  double v9 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v4, v5, v6, v7, v8);
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x4812000000;
  float v57 = sub_1C49AF7F8;
  BOOL v58 = sub_1C49AF81C;
  uint64_t v59 = &unk_1C4CB5C62;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  uint64_t v60 = 0;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = sub_1C49B66DC;
  v53[3] = &unk_1E64E18B8;
  v53[4] = &v54;
  objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(CHStrokeUtilities, v10, (uint64_t)v3, 0, 0, (uint64_t)v53);
  objc_msgSend_segmentationRangesForScratchOutPoints_(CHStrokeUtilities, v11, (uint64_t)(v55 + 6), v12, v13, v14);
  _NSRange v19 = v51;
  uint64_t v20 = v52;
  if (v51 != v52)
  {
    do
    {
      uint64_t v21 = v55[6];
      uint64_t v22 = *v19;
      uint64_t v23 = v19[1];
      double v49 = 0;
      uint64_t v50 = 0;
      unint64_t v48 = 0;
      if (v23)
      {
        uint64_t v24 = (const void *)(v21 + 16 * v22);
        uint64_t v25 = v21 + 16 * (v23 + v22);
        int64_t v26 = v25 - (void)v24;
        if (v25 - (void)v24 < 0) {
          sub_1C494A220();
        }
        unint64_t v48 = operator new(v25 - (void)v24);
        double v49 = v48;
        unint64_t v27 = (char *)v48 + 16 * (v26 >> 4);
        uint64_t v50 = v27;
        memmove(v48, v24, v26);
        double v49 = v27;
      }
      objc_msgSend_convexHullForPoints_(CHStrokeUtilities, v15, (uint64_t)&v48, v16, v17, v18);
      int v28 = __p;
      uint64_t v29 = v47;
      if (__p != v47)
      {
        int64_t v30 = v47 - 16;
        if (v47 - 16 > __p)
        {
          uint64_t v31 = __p + 16;
          do
          {
            long long v32 = *((_OWORD *)v31 - 1);
            *((_OWORD *)v31 - 1) = *(_OWORD *)v30;
            *(_OWORD *)int64_t v30 = v32;
            v30 -= 16;
            BOOL v33 = v31 >= v30;
            v31 += 16;
          }
          while (!v33);
          int v28 = __p;
          uint64_t v29 = v47;
        }
      }
      int64_t v34 = malloc_type_calloc((v29 - v28) >> 4, 0x10uLL, 0x1000040451B5BE8uLL);
      memcpy(v34, __p, v47 - __p);
      unint64_t v35 = [CHPolygon alloc];
      uint64_t v39 = objc_msgSend_initWithVertices_vertexCount_(v35, v36, (uint64_t)v34, (v47 - __p) >> 4, v37, v38);
      objc_msgSend_addObject_(v9, v40, (uint64_t)v39, v41, v42, v43);

      if (__p)
      {
        uint64_t v47 = __p;
        operator delete(__p);
      }
      if (v48)
      {
        double v49 = v48;
        operator delete(v48);
      }
      v19 += 2;
    }
    while (v19 != v20);
    _NSRange v19 = v51;
  }
  id v44 = v9;
  if (v19)
  {
    unint64_t v52 = v19;
    operator delete(v19);
  }
  _Block_object_dispose(&v54, 8);
  if (v60)
  {
    uint64_t v61 = v60;
    operator delete(v60);
  }

  return v44;
}

@end