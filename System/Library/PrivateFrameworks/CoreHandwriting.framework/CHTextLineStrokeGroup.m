@interface CHTextLineStrokeGroup
+ (BOOL)supportsSecureCoding;
- (CGPath)newEstimatedBaselineForStrokesWithTokens:(id)a3 tokenStrokeIdentifiers:(id)a4;
- (CGPath)newEstimatedBaselineForStrokesWithTokens:(id)a3 tokenStrokeIdentifiers:(id)a4 relaxedChecks:(BOOL)a5;
- (CGVector)averageStrokeDeviation;
- (CGVector)averageWritingOrientation;
- (CGVector)localWritingOrientationAtStrokeIndex:(int64_t)a3;
- (CHTextLineStrokeGroup)initWithAncestorIdentifier:(int64_t)a3 strokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 classification:(int64_t)a8 strategyIdentifier:(id)a9 writingDirectionSortedSubstrokes:(id)a10 averageWritingOrientation:(CGVector)a11 averageStrokeDeviation:(CGVector)a12 writingDirectionSortedStrokeIdentifiers:(id)a13 localStrokeWritingOrientations:(const void *)a14 coalescedLastSubstrokes:(id)a15 groupingConfidence:(double)a16 firstStrokeOrigin:(CGPoint)a17;
- (CHTextLineStrokeGroup)initWithCoder:(id)a3;
- (CHTextLineStrokeGroup)initWithStrokeIdentifiers:(id)a3 firstStrokeIdentifier:(id)a4 lastStrokeIdentifier:(id)a5 bounds:(CGRect)a6 classification:(int64_t)a7 strategyIdentifier:(id)a8 writingDirectionSortedSubstrokes:(id)a9 averageWritingOrientation:(CGVector)a10 averageStrokeDeviation:(CGVector)a11 writingDirectionSortedStrokeIdentifiers:(id)a12 localStrokeWritingOrientations:(const void *)a13 coalescedLastSubstrokes:(id)a14 groupingConfidence:(double)a15 firstStrokeOrigin:(CGPoint)a16;
- (CHTextLineStrokeGroup)initWithUniqueIdentifier:(int64_t)a3 ancestorIdentifier:(int64_t)a4 strokeIdentifiers:(id)a5 firstStrokeIdentifier:(id)a6 lastStrokeIdentifier:(id)a7 bounds:(CGRect)a8 classification:(int64_t)a9 strategyIdentifier:(id)a10 writingDirectionSortedSubstrokes:(id)a11 averageWritingOrientation:(CGVector)a12 averageStrokeDeviation:(CGVector)a13 writingDirectionSortedStrokeIdentifiers:(id)a14 localStrokeWritingOrientations:(const void *)a15 coalescedLastSubstrokes:(id)a16 groupingConfidence:(double)a17 firstStrokeOrigin:(CGPoint)a18;
- (CHTextLineStrokeGroup)strokeGroupWithUpdatedStrategyIdentifier:(id)a3 classification:(int64_t)a4;
- (NSArray)writingDirectionSortedStrokeIdentifiers;
- (id).cxx_construct;
- (id)coalescedLastSubstrokes;
- (id)groupByAddingStrokeIdentifiers:(id)a3 removingStrokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 writingDirectionSortedSubstrokes:(id)a8 averageWritingOrientation:(CGVector)a9 averageStrokeDeviation:(CGVector)a10 writingDirectionSortedStrokeIdentifiers:(id)a11 localStrokeWritingOrientations:(const void *)a12 coalescedLastSubstrokes:(id)a13 groupingConfidence:(double)a14 lastSubstrokeIndexBeforeMerge:(int64_t)a15 firstStrokeOrigin:(CGPoint)a16;
- (id)writingDirectionSortedSubstrokes;
- (int64_t)lastSubstrokeIndexBeforeMerge;
- (void)encodeWithCoder:(id)a3;
- (void)localStrokeWritingOrientations;
@end

@implementation CHTextLineStrokeGroup

- (CHTextLineStrokeGroup)initWithStrokeIdentifiers:(id)a3 firstStrokeIdentifier:(id)a4 lastStrokeIdentifier:(id)a5 bounds:(CGRect)a6 classification:(int64_t)a7 strategyIdentifier:(id)a8 writingDirectionSortedSubstrokes:(id)a9 averageWritingOrientation:(CGVector)a10 averageStrokeDeviation:(CGVector)a11 writingDirectionSortedStrokeIdentifiers:(id)a12 localStrokeWritingOrientations:(const void *)a13 coalescedLastSubstrokes:(id)a14 groupingConfidence:(double)a15 firstStrokeOrigin:(CGPoint)a16
{
  return (CHTextLineStrokeGroup *)objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_strategyIdentifier_writingDirectionSortedSubstrokes_averageWritingOrientation_averageStrokeDeviation_writingDirectionSortedStrokeIdentifiers_localStrokeWritingOrientations_coalescedLastSubstrokes_groupingConfidence_firstStrokeOrigin_(self, a2, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a7, a8, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a10.dx, a10.dy, a11.dx, a11.dy, a9, a12, a13,
                                    a14,
                                    *(void *)&a15,
                                    *(void *)&a16.x,
                                    *(void *)&a16.y);
}

- (CHTextLineStrokeGroup)initWithAncestorIdentifier:(int64_t)a3 strokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 classification:(int64_t)a8 strategyIdentifier:(id)a9 writingDirectionSortedSubstrokes:(id)a10 averageWritingOrientation:(CGVector)a11 averageStrokeDeviation:(CGVector)a12 writingDirectionSortedStrokeIdentifiers:(id)a13 localStrokeWritingOrientations:(const void *)a14 coalescedLastSubstrokes:(id)a15 groupingConfidence:(double)a16 firstStrokeOrigin:(CGPoint)a17
{
  ddouble y = a11.dy;
  CGFloat dx = a11.dx;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v28 = a4;
  id v29 = a5;
  id v30 = a6;
  id v31 = a9;
  id v39 = a10;
  id v38 = a13;
  id v37 = a15;
  v40.receiver = self;
  v40.super_class = (Class)CHTextLineStrokeGroup;
  v32 = -[CHStrokeGroup initWithAncestorIdentifier:strokeIdentifiers:firstStrokeIdentifier:lastStrokeIdentifier:bounds:classification:groupingConfidence:strategyIdentifier:firstStrokeOrigin:](&v40, sel_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_, a3, v28, v29, v30, a8, v31, x, y, width, height, a16, a17.x, a17.y);
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_writingDirectionSortedSubstrokes, a10);
    v33->_averageWritingOrientation.CGFloat dx = dx;
    v33->_averageWritingOrientation.ddouble y = dy;
    v33->_averageStrokeDeviation = a12;
    objc_storeStrong((id *)&v33->_writingDirectionSortedStrokeIdentifiers, a13);
    if (&v33->_localStrokeWritingOrientations != a14) {
      sub_1C49B7D84(&v33->_localStrokeWritingOrientations.__begin_, *(char **)a14, *((char **)a14 + 1), (uint64_t)(*((void *)a14 + 1) - *(void *)a14) >> 4);
    }
    v33->_lastSubstrokeIndexBeforeMerge = -1;
    objc_storeStrong((id *)&v33->_coalescedLastSubstrokes, a15);
  }

  return v33;
}

- (CHTextLineStrokeGroup)initWithUniqueIdentifier:(int64_t)a3 ancestorIdentifier:(int64_t)a4 strokeIdentifiers:(id)a5 firstStrokeIdentifier:(id)a6 lastStrokeIdentifier:(id)a7 bounds:(CGRect)a8 classification:(int64_t)a9 strategyIdentifier:(id)a10 writingDirectionSortedSubstrokes:(id)a11 averageWritingOrientation:(CGVector)a12 averageStrokeDeviation:(CGVector)a13 writingDirectionSortedStrokeIdentifiers:(id)a14 localStrokeWritingOrientations:(const void *)a15 coalescedLastSubstrokes:(id)a16 groupingConfidence:(double)a17 firstStrokeOrigin:(CGPoint)a18
{
  ddouble y = a12.dy;
  CGFloat dx = a12.dx;
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  id v28 = a5;
  id v29 = a6;
  id v30 = a7;
  id v31 = a10;
  id v40 = a11;
  id v39 = a14;
  id v38 = a16;
  v41.receiver = self;
  v41.super_class = (Class)CHTextLineStrokeGroup;
  v32 = -[CHStrokeGroup initWithUniqueIdentifier:ancestorIdentifier:strokeIdentifiers:firstStrokeIdentifier:lastStrokeIdentifier:bounds:classification:groupingConfidence:strategyIdentifier:firstStrokeOrigin:](&v41, sel_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_, a3, a4, v28, v29, v30, a9, x, y, width, height, a17, a18.x, a18.y, v31);
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_writingDirectionSortedSubstrokes, a11);
    v33->_averageWritingOrientation.CGFloat dx = dx;
    v33->_averageWritingOrientation.ddouble y = dy;
    v33->_averageStrokeDeviation = a13;
    objc_storeStrong((id *)&v33->_writingDirectionSortedStrokeIdentifiers, a14);
    if (&v33->_localStrokeWritingOrientations != a15) {
      sub_1C49B7D84(&v33->_localStrokeWritingOrientations.__begin_, *(char **)a15, *((char **)a15 + 1), (uint64_t)(*((void *)a15 + 1) - *(void *)a15) >> 4);
    }
    v33->_lastSubstrokeIndexBeforeMerge = -1;
    objc_storeStrong((id *)&v33->_coalescedLastSubstrokes, a16);
  }

  return v33;
}

- (id)groupByAddingStrokeIdentifiers:(id)a3 removingStrokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 writingDirectionSortedSubstrokes:(id)a8 averageWritingOrientation:(CGVector)a9 averageStrokeDeviation:(CGVector)a10 writingDirectionSortedStrokeIdentifiers:(id)a11 localStrokeWritingOrientations:(const void *)a12 coalescedLastSubstrokes:(id)a13 groupingConfidence:(double)a14 lastSubstrokeIndexBeforeMerge:(int64_t)a15 firstStrokeOrigin:(CGPoint)a16
{
  ddouble y = a9.dy;
  CGFloat dx = a9.dx;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v27 = a3;
  id v28 = a4;
  id v29 = a5;
  id v30 = a6;
  id v44 = a8;
  id v43 = a11;
  id v31 = a13;
  uint64_t v37 = objc_msgSend_classification(self, v32, v33, v34, v35, v36);
  v45.receiver = self;
  v45.super_class = (Class)CHTextLineStrokeGroup;
  uint64_t v38 = -[CHStrokeGroup groupByAddingStrokeIdentifiers:removingStrokeIdentifiers:firstStrokeIdentifier:lastStrokeIdentifier:bounds:classification:groupingConfidence:firstStrokeOrigin:](&v45, sel_groupByAddingStrokeIdentifiers_removingStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_firstStrokeOrigin_, v27, v28, v29, v30, v37, x, y, width, height, a14, a16.x, a16.y);
  objc_storeStrong((id *)(v38 + 136), a8);
  *(CGFloat *)(v38 + 144) = dx;
  *(CGFloat *)(v38 + 152) = dy;
  *(CGVector *)(v38 + 160) = a10;
  objc_storeStrong((id *)(v38 + 216), a11);
  if ((const void *)(v38 + 176) != a12) {
    sub_1C49B7D84((void *)(v38 + 176), *(char **)a12, *((char **)a12 + 1), (uint64_t)(*((void *)a12 + 1) - *(void *)a12) >> 4);
  }
  *(void *)(v38 + 200) = a15;
  id v39 = *(void **)(v38 + 208);
  *(void *)(v38 + 208) = v31;

  return (id)v38;
}

- (CHTextLineStrokeGroup)strokeGroupWithUpdatedStrategyIdentifier:(id)a3 classification:(int64_t)a4
{
  id v109 = a3;
  v107 = [CHTextLineStrokeGroup alloc];
  uint64_t v10 = objc_msgSend_uniqueIdentifier(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_ancestorIdentifier(self, v11, v12, v13, v14, v15);
  v22 = objc_msgSend_strokeIdentifiers(self, v17, v18, v19, v20, v21);
  id v28 = objc_msgSend_firstStrokeIdentifier(self, v23, v24, v25, v26, v27);
  uint64_t v34 = objc_msgSend_lastStrokeIdentifier(self, v29, v30, v31, v32, v33);
  objc_msgSend_bounds(self, v35, v36, v37, v38, v39);
  double v106 = v40;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  v52 = objc_msgSend_writingDirectionSortedSubstrokes(self, v47, v48, v49, v50, v51);
  objc_msgSend_averageWritingOrientation(self, v53, v54, v55, v56, v57);
  double v59 = v58;
  double v61 = v60;
  objc_msgSend_averageStrokeDeviation(self, v62, v63, v64, v65, v66);
  double v68 = v67;
  double v70 = v69;
  v76 = objc_msgSend_writingDirectionSortedStrokeIdentifiers(self, v71, v72, v73, v74, v75);
  uint64_t v82 = objc_msgSend_localStrokeWritingOrientations(self, v77, v78, v79, v80, v81);
  v88 = objc_msgSend_coalescedLastSubstrokes(self, v83, v84, v85, v86, v87);
  objc_msgSend_groupingConfidence(self, v89, v90, v91, v92, v93);
  uint64_t v95 = v94;
  objc_msgSend_firstStrokeOrigin(self, v96, v97, v98, v99, v100);
  StrokeIdentifier_lastStrokeIdentifier_bounds_classification_strategyIdentifier_writingDirectionSortedSubstrokes_averageWritingOrientation_averageStrokeDeviation_writingDirectionSortedStrokeIdentifiers_localStrokeWritingOrientations_coalescedLastSubstrokes_groupingConfidence_firstStrokeOrigin = objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_strategyIdentifier_writingDirectionSortedSubstrokes_averageWritingOrientation_averageStrokeDeviation_writingDirectionSortedStrokeIdentifiers_localStrokeWritingOrientations_coalescedLastSubstrokes_groupingConfidence_firstStrokeOrigin_(v107, v101, v10, v16, (uint64_t)v22, (uint64_t)v28, v34, a4, v106, v42, v44, v46, v59, v61, v68, v70, v109, v52, v76, v82, v88, v95, v102, v103);

  return (CHTextLineStrokeGroup *)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_strategyIdentifier_writingDirectionSortedSubstrokes_averageWritingOrientation_averageStrokeDeviation_writingDirectionSortedStrokeIdentifiers_localStrokeWritingOrientations_coalescedLastSubstrokes_groupingConfidence_firstStrokeOrigin;
}

- (id)writingDirectionSortedSubstrokes
{
  return self->_writingDirectionSortedSubstrokes;
}

- (void)localStrokeWritingOrientations
{
  return &self->_localStrokeWritingOrientations;
}

- (CGVector)localWritingOrientationAtStrokeIndex:(int64_t)a3
{
  v3 = &self->_localStrokeWritingOrientations.__begin_[a3];
  double dx = v3->dx;
  ddouble y = v3->dy;
  result.ddouble y = dy;
  result.double dx = dx;
  return result;
}

- (CGVector)averageWritingOrientation
{
  double dx = self->_averageWritingOrientation.dx;
  ddouble y = self->_averageWritingOrientation.dy;
  result.ddouble y = dy;
  result.double dx = dx;
  return result;
}

- (CGVector)averageStrokeDeviation
{
  double dx = self->_averageStrokeDeviation.dx;
  ddouble y = self->_averageStrokeDeviation.dy;
  result.ddouble y = dy;
  result.double dx = dx;
  return result;
}

- (int64_t)lastSubstrokeIndexBeforeMerge
{
  return self->_lastSubstrokeIndexBeforeMerge;
}

- (id)coalescedLastSubstrokes
{
  return self->_coalescedLastSubstrokes;
}

- (CGPath)newEstimatedBaselineForStrokesWithTokens:(id)a3 tokenStrokeIdentifiers:(id)a4
{
  return (CGPath *)((uint64_t (*)(CHTextLineStrokeGroup *, char *, id, id, void))MEMORY[0x1F4181798])(self, sel_newEstimatedBaselineForStrokesWithTokens_tokenStrokeIdentifiers_relaxedChecks_, a3, a4, 0);
}

- (CGPath)newEstimatedBaselineForStrokesWithTokens:(id)a3 tokenStrokeIdentifiers:(id)a4 relaxedChecks:(BOOL)a5
{
  uint64_t v535 = *MEMORY[0x1E4F143B8];
  id v454 = a3;
  id v491 = a4;
  BOOL v492 = a5;
  if (!a5 && !objc_msgSend_count(v491, v7, v8, v9, v10, v11))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v12 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v12, OS_LOG_TYPE_FAULT, "There needs to be at least one array of token stroke identifiers to get a baseline.", buf, 2u);
    }
  }
  if (v454)
  {
    uint64_t v13 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v454, v7, (uint64_t)&stru_1F20141C8, (uint64_t)&unk_1F2012C10, v10, v11);
    uint64_t v19 = objc_msgSend_ch_possibleDescenderCharSet(MEMORY[0x1E4F28B88], v14, v15, v16, v17, v18);
    uint64_t v24 = objc_msgSend_indexesOfCharacters_(v13, v20, (uint64_t)v19, v21, v22, v23);

    uint64_t v25 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v31 = objc_msgSend_count(v24, v26, v27, v28, v29, v30);
    uint64_t v36 = objc_msgSend_arrayWithCapacity_(v25, v32, v31, v33, v34, v35);
    v503[0] = MEMORY[0x1E4F143A8];
    v503[1] = 3221225472;
    v503[2] = sub_1C4A320B4;
    v503[3] = &unk_1E64E29C8;
    id v453 = v36;
    id v504 = v453;
    id v37 = v13;
    id v505 = v37;
    objc_msgSend_enumerateIndexesUsingBlock_(v24, v38, (uint64_t)v503, v39, v40, v41);
  }
  else
  {
    id v453 = 0;
  }
  double v42 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v43 = objc_msgSend_count(v491, v7, v8, v9, v10, v11);
  v486 = objc_msgSend_arrayWithCapacity_(v42, v44, v43, v45, v46, v47);
  for (unint64_t i = 0; i < objc_msgSend_count(v491, v48, v49, v50, v51, v52); ++i)
  {
    double v59 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v54, v55, v56, v57, v58);
    objc_msgSend_addObject_(v486, v60, (uint64_t)v59, v61, v62, v63);
  }
  uint64_t v64 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v65 = objc_msgSend_writingDirectionSortedSubstrokes(self, v54, v55, v56, v57, v58);
  uint64_t v71 = objc_msgSend_count(v65, v66, v67, v68, v69, v70);
  v490 = objc_msgSend_arrayWithCapacity_(v64, v72, v71, v73, v74, v75);

  if (!v492)
  {
    uint64_t v81 = objc_msgSend_writingDirectionSortedSubstrokes(self, v76, v77, v78, v79, v80);
    BOOL v87 = objc_msgSend_count(v81, v82, v83, v84, v85, v86) == 0;

    if (v87)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v88 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v88, OS_LOG_TYPE_FAULT, "There should be at least one substroke for a text line stroke group to get a baseline.", buf, 2u);
      }
    }
  }
  long long v501 = 0u;
  long long v502 = 0u;
  long long v500 = 0u;
  long long v499 = 0u;
  v89 = objc_msgSend_writingDirectionSortedSubstrokes(self, v76, v77, v78, v79, v80);
  uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v499, (uint64_t)v528, 16, v91);
  if (v96)
  {
    uint64_t v97 = *(void *)v500;
    do
    {
      for (uint64_t j = 0; j != v96; ++j)
      {
        if (*(void *)v500 != v97) {
          objc_enumerationMutation(v89);
        }
        uint64_t v99 = *(void *)(*((void *)&v499 + 1) + 8 * j);
        v498[0] = MEMORY[0x1E4F143A8];
        v498[1] = 3221225472;
        v498[2] = sub_1C4A32140;
        v498[3] = &unk_1E64E29F0;
        v498[4] = v99;
        uint64_t v100 = objc_msgSend_indexOfObjectPassingTest_(v491, v92, (uint64_t)v498, v93, v94, v95);
        if (v100 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend_addObject_(v490, v92, v99, v93, v94, v95);
          v105 = objc_msgSend_objectAtIndexedSubscript_(v486, v101, v100, v102, v103, v104);
          uint64_t v111 = objc_msgSend_count(v490, v106, v107, v108, v109, v110);
          objc_msgSend_addIndex_(v105, v112, v111 - 1, v113, v114, v115);
        }
      }
      uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v92, (uint64_t)&v499, (uint64_t)v528, 16, v95);
    }
    while (v96);
  }

  if (!v492 && !objc_msgSend_count(v490, v116, v117, v118, v119, v120))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v121 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v121, OS_LOG_TYPE_FAULT, "There should be at least one substroke covering one of the strokeIdentifiers.", buf, 2u);
    }
  }
  if (!objc_msgSend_count(v490, v116, v117, v118, v119, v120))
  {
    v330 = (void *)MEMORY[0x1E4F1CA48];
    v331 = objc_msgSend_writingDirectionSortedSubstrokes(self, v122, v123, v124, v125, v126);
    uint64_t v337 = objc_msgSend_count(v331, v332, v333, v334, v335, v336);
    v342 = objc_msgSend_arrayWithCapacity_(v330, v338, v337, v339, v340, v341);

    v348 = objc_msgSend_writingDirectionSortedSubstrokes(self, v343, v344, v345, v346, v347);
    v496[0] = MEMORY[0x1E4F143A8];
    v496[1] = 3221225472;
    v496[2] = sub_1C4A321E0;
    v496[3] = &unk_1E64E2A18;
    id v349 = v342;
    id v497 = v349;
    objc_msgSend_enumerateObjectsUsingBlock_(v348, v350, (uint64_t)v496, v351, v352, v353);

    v359 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v354, v355, v356, v357, v358);
    v494[0] = MEMORY[0x1E4F143A8];
    v494[1] = 3221225472;
    v494[2] = sub_1C4A32274;
    v494[3] = &unk_1E64E2A40;
    id v360 = v359;
    id v495 = v360;
    objc_msgSend_enumerateObjectsUsingBlock_(v491, v361, (uint64_t)v494, v362, v363, v364);
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v365 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v365, OS_LOG_TYPE_ERROR))
    {
      v370 = objc_msgSend_componentsJoinedByString_(v360, v366, @", ", v367, v368, v369);
      v375 = objc_msgSend_componentsJoinedByString_(v349, v371, @", ", v372, v373, v374);
      *(_DWORD *)buf = 138412546;
      v532 = v370;
      __int16 v533 = 2112;
      v534 = v375;
      _os_log_impl(&dword_1C492D000, v365, OS_LOG_TYPE_ERROR, "Failed to match any substrokes with token stroke identifiers.\nToken Stroke Identifiers: %@\nSubstroke Stroke Identifiers: %@", buf, 0x16u);
    }
    if (qword_1EA3CA000 == -1)
    {
      v376 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v376, OS_LOG_TYPE_ERROR))
      {
LABEL_179:

        v377 = 0;
        goto LABEL_238;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v376 = (id)qword_1EA3C9F98;
      if (!os_log_type_enabled(v376, OS_LOG_TYPE_ERROR)) {
        goto LABEL_179;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v376, OS_LOG_TYPE_ERROR, "Skipping baseline estimation since substroke count == 0", buf, 2u);
    goto LABEL_179;
  }
  id v127 = v490;
  id v457 = v454;
  id v461 = v486;
  id v455 = v453;
  v452 = v127;
  if (!self)
  {
    v377 = 0;
    goto LABEL_237;
  }
  v526 = 0;
  v525 = 0;
  v527 = 0;
  v523 = 0;
  __p = 0;
  v524 = 0;
  long long v518 = 0u;
  long long v519 = 0u;
  long long v520 = 0u;
  long long v521 = 0u;
  id v128 = v127;
  uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v129, (uint64_t)&v518, (uint64_t)buf, 16, v130);
  obuint64_t j = v128;
  if (v136)
  {
    v137 = 0;
    uint64_t v138 = *(void *)v519;
    do
    {
      for (uint64_t k = 0; k != v136; ++k)
      {
        if (*(void *)v519 != v138) {
          objc_enumerationMutation(obj);
        }
        v140 = *(void **)(*((void *)&v518 + 1) + 8 * k);
        objc_msgSend_orientedBounds(v140, v131, v132, v133, v134, v135);
        uint64_t v150 = v146;
        uint64_t v151 = v147;
        uint64_t v152 = v148;
        uint64_t v153 = v149;
        v154 = v526;
        if (v526 < v527)
        {
          *(void *)v526 = v146;
          *((void *)v154 + 1) = v147;
          v155 = v154 + 32;
          *((void *)v154 + 2) = v148;
          *((void *)v154 + 3) = v149;
          goto LABEL_64;
        }
        v156 = (char *)v525;
        uint64_t v157 = (v526 - (unsigned char *)v525) >> 5;
        unint64_t v158 = v157 + 1;
        if ((unint64_t)(v157 + 1) >> 59) {
          sub_1C494A220();
        }
        uint64_t v159 = v527 - (unsigned char *)v525;
        if ((v527 - (unsigned char *)v525) >> 4 > v158) {
          unint64_t v158 = v159 >> 4;
        }
        if ((unint64_t)v159 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v160 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v160 = v158;
        }
        if (v160)
        {
          if (v160 >> 59) {
            sub_1C4949AA8();
          }
          v161 = (char *)operator new(32 * v160);
          v162 = &v161[32 * v157];
          *(void *)v162 = v150;
          *((void *)v162 + 1) = v151;
          *((void *)v162 + 2) = v152;
          *((void *)v162 + 3) = v153;
          v163 = v162;
          if (v154 == v156)
          {
LABEL_62:
            v155 = v162 + 32;
            v525 = v163;
            v527 = &v161[32 * v160];
            if (!v154) {
              goto LABEL_64;
            }
LABEL_63:
            operator delete(v154);
            goto LABEL_64;
          }
        }
        else
        {
          v161 = 0;
          v162 = (char *)(32 * v157);
          *(void *)v162 = v146;
          *((void *)v162 + 1) = v147;
          *((void *)v162 + 2) = v148;
          *((void *)v162 + 3) = v149;
          v163 = (char *)(32 * v157);
          if (v154 == v156) {
            goto LABEL_62;
          }
        }
        do
        {
          long long v164 = *((_OWORD *)v154 - 1);
          *((_OWORD *)v163 - 2) = *((_OWORD *)v154 - 2);
          *((_OWORD *)v163 - 1) = v164;
          v163 -= 32;
          v154 -= 32;
        }
        while (v154 != v156);
        v154 = v156;
        v155 = v162 + 32;
        v525 = v163;
        v527 = &v161[32 * v160];
        if (v154) {
          goto LABEL_63;
        }
LABEL_64:
        v526 = v155;
        objc_msgSend_writingOrientation(v140, v141, v142, v143, v144, v145);
        uint64_t v167 = v165;
        uint64_t v168 = v166;
        if (v137 < v524)
        {
          *(void *)v137 = v165;
          *((void *)v137 + 1) = v166;
          v137 += 16;
          goto LABEL_43;
        }
        v169 = (char *)__p;
        uint64_t v170 = (v137 - (unsigned char *)__p) >> 4;
        unint64_t v171 = v170 + 1;
        if ((unint64_t)(v170 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v172 = v524 - (unsigned char *)__p;
        if ((v524 - (unsigned char *)__p) >> 3 > v171) {
          unint64_t v171 = v172 >> 3;
        }
        if ((unint64_t)v172 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v173 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v173 = v171;
        }
        if (v173)
        {
          if (v173 >> 60) {
            sub_1C4949AA8();
          }
          v174 = (char *)operator new(16 * v173);
          v175 = &v174[16 * v170];
          *(void *)v175 = v167;
          *((void *)v175 + 1) = v168;
          if (v137 == v169)
          {
LABEL_79:
            v177 = v137;
            v137 = v175 + 16;
            __p = v175;
            v523 = v175 + 16;
            v524 = &v174[16 * v173];
            if (!v177) {
              goto LABEL_43;
            }
LABEL_80:
            operator delete(v177);
            goto LABEL_43;
          }
        }
        else
        {
          v174 = 0;
          v175 = (char *)(16 * v170);
          *(void *)v175 = v165;
          *((void *)v175 + 1) = v166;
          if (v137 == v169) {
            goto LABEL_79;
          }
        }
        v176 = v175;
        do
        {
          *((_OWORD *)v176 - 1) = *((_OWORD *)v137 - 1);
          v176 -= 16;
          v137 -= 16;
        }
        while (v137 != v169);
        v177 = __p;
        v137 = v175 + 16;
        __p = v176;
        v523 = v175 + 16;
        v524 = &v174[16 * v173];
        if (v177) {
          goto LABEL_80;
        }
LABEL_43:
        v523 = v137;
      }
      id v128 = obj;
      uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v131, (uint64_t)&v518, (uint64_t)buf, 16, v135);
    }
    while (v136);
  }

  v183 = (double *)MEMORY[0x1E4F1DAB8];
  double v184 = *MEMORY[0x1E4F1DAB8];
  double v473 = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
  double v185 = *(double *)(MEMORY[0x1E4F1DAB8] + 16);
  double v186 = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
  double v187 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
  double v188 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat x = *MEMORY[0x1E4F1DB28];
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  v516 = 0;
  v515 = 0;
  v517 = 0;
  if (v455 && objc_msgSend_count(v455, v178, v179, v180, v181, v182))
  {
    v189 = objc_msgSend_objectAtIndex_(v455, v178, 0, v180, v181, v182);
    objc_msgSend_floatValue(v189, v190, v191, v192, v193, v194);
    float v458 = v195;

    uint64_t v460 = 0;
  }
  else
  {
    uint64_t v460 = -1;
    float v458 = INFINITY;
  }
  unint64_t v196 = 0;
  LOBYTE(v197) = 0;
  char v459 = 0;
  uint64_t v198 = 0x7FFFFFFFFFFFFFFFLL;
  while (v196 < objc_msgSend_count(v128, v178, v179, v180, v181, v182))
  {
    double v484 = v183[1];
    double v485 = *v183;
    double v482 = v183[3];
    double v483 = v183[2];
    double v480 = v183[5];
    double v481 = v183[4];
    v200 = (char *)v525;
    v201 = (double *)((char *)v525 + 32 * v196);
    CGFloat v487 = v201[1];
    CGFloat v488 = *v201;
    double v493 = v201[2];
    double rect = v201[3];
    if (v516 == v515 && v196 >= objc_msgSend_count(v128, v178, v179, v180, v181, v182) - 1
      || (v493 < 9.0 ? (BOOL v202 = rect < 9.0) : (BOOL v202 = 0), !v202))
    {
      if (v198 == 0x7FFFFFFFFFFFFFFFLL
        || (objc_msgSend_objectAtIndexedSubscript_(v461, v178, v198, v180, v181, v182),
            v203 = objc_claimAutoreleasedReturnValue(),
            char v208 = objc_msgSend_containsIndex_(v203, v204, v196, v205, v206, v207),
            v203,
            (v208 & 1) == 0))
      {
        v514[0] = MEMORY[0x1E4F143A8];
        v514[1] = 3221225472;
        v514[2] = sub_1C4A32280;
        v514[3] = &unk_1E64E2A60;
        v514[4] = v196;
        uint64_t v198 = objc_msgSend_indexOfObjectPassingTest_(v461, v178, (uint64_t)v514, v180, v181, v182);
      }
      v209 = objc_msgSend_objectAtIndex_(v457, v178, v198, v180, v181, v182);
      v215 = objc_msgSend_string(v209, v210, v211, v212, v213, v214);
      uint64_t v221 = objc_msgSend_countCharacters(v215, v216, v217, v218, v219, v220);

      v227 = (CGFloat *)&v200[32 * v196 + 56];
      CGFloat y = v487;
      CGFloat x = v488;
      CGFloat height = rect;
      CGFloat width = v493;
      while (v196 < objc_msgSend_count(v128, v222, v223, v224, v225, v226) - 1)
      {
        double v232 = *(v227 - 3);
        double v233 = *(v227 - 2);
        CGFloat v234 = *(v227 - 1);
        CGFloat v235 = *v227;
        v236 = objc_msgSend_objectAtIndexedSubscript_(v128, v228, v196 + 1, v229, v230, v231);
        v242 = v236;
        long long v530 = 0u;
        memset(v529, 0, sizeof(v529));
        if (v236)
        {
          objc_msgSend_orientationTransform(v236, v237, v238, v239, v240, v241);
          double v466 = *(double *)&v529[16];
          double v467 = *(double *)v529;
          double v469 = *(double *)&v529[24];
          double v471 = *(double *)&v529[8];
          double v474 = *((double *)&v530 + 1);
          double v468 = *(double *)&v530;
        }
        else
        {
          double v471 = 0.0;
          double v474 = 0.0;
          double v468 = 0.0;
          double v469 = 0.0;
          double v466 = 0.0;
          double v467 = 0.0;
        }
        v512.double a = v485;
        v512.double b = v484;
        v512.double c = v483;
        v512.double d = v482;
        v512.tCGFloat x = v481;
        v512.tCGFloat y = v480;
        CGAffineTransformInvert(&v513, &v512);
        double a = v513.a;
        double c = v513.c;
        double d = v513.d;
        tCGFloat x = v513.tx;
        tCGFloat y = v513.ty;
        double b = v513.b;
        v536.origin.CGFloat x = v232;
        v536.origin.CGFloat y = v233;
        v536.size.CGFloat width = v234;
        v536.size.CGFloat height = v235;
        double MaxX = CGRectGetMaxX(v536);
        v537.origin.CGFloat x = v232;
        v537.origin.CGFloat y = v233;
        v537.size.CGFloat width = v234;
        v537.size.CGFloat height = v235;
        CGFloat MaxY = CGRectGetMaxY(v537);
        double v248 = v468 + v233 * v466 + v467 * v232;
        double v249 = v474 + v233 * v469 + v471 * v232;
        double v250 = tx + v249 * c + a * v248;
        double v251 = *(double *)&v530 + MaxY * *(double *)&v529[16] + *(double *)v529 * MaxX;
        v510.double a = v485;
        v510.double b = v484;
        double v252 = *((double *)&v530 + 1) + MaxY * *(double *)&v529[24] + *(double *)&v529[8] * MaxX;
        v510.double c = v483;
        v510.double d = v482;
        v510.tCGFloat x = v481;
        v510.tCGFloat y = v480;
        CGAffineTransformInvert(&v511, &v510);
        double v472 = v511.b;
        double v475 = v511.d;
        double v257 = v251;
        double v470 = v511.ty;
        double v258 = v511.tx + v252 * v511.c + v511.a * v251;
        if (v221 != 1
          || (objc_msgSend_objectAtIndexedSubscript_(v461, v253, v198, v254, v255, v256),
              v259 = objc_claimAutoreleasedReturnValue(),
              char v264 = objc_msgSend_containsIndex_(v259, v260, v196 + 1, v261, v262, v263),
              v259,
              (v264 & 1) == 0))
        {
          v538.origin.CGFloat y = v487;
          v538.origin.CGFloat x = v488;
          v538.size.CGFloat width = v493;
          v538.size.CGFloat height = rect;
          if (CGRectGetMinX(v538) > v250
            || (v539.origin.CGFloat y = v487,
                v539.origin.CGFloat x = v488,
                v539.size.CGFloat width = v493,
                v539.size.CGFloat height = rect,
                v250 > CGRectGetMaxX(v539)))
          {
            v540.origin.CGFloat y = v487;
            v540.origin.CGFloat x = v488;
            v540.size.CGFloat width = v493;
            v540.size.CGFloat height = rect;
            if (v250 > CGRectGetMinX(v540)) {
              goto LABEL_118;
            }
            v541.origin.CGFloat y = v487;
            v541.origin.CGFloat x = v488;
            v541.size.CGFloat width = v493;
            v541.size.CGFloat height = rect;
            if (CGRectGetMinX(v541) > v258) {
              goto LABEL_118;
            }
          }
          v542.origin.CGFloat y = v487;
          v542.origin.CGFloat x = v488;
          v542.size.CGFloat width = v493;
          v542.size.CGFloat height = rect;
          double MinX = v250;
          if (CGRectGetMinX(v542) > v250)
          {
            v543.origin.CGFloat y = v487;
            v543.origin.CGFloat x = v488;
            v543.size.CGFloat width = v493;
            v543.size.CGFloat height = rect;
            double MinX = CGRectGetMinX(v543);
          }
          v544.origin.CGFloat y = v487;
          v544.origin.CGFloat x = v488;
          v544.size.CGFloat width = v493;
          v544.size.CGFloat height = rect;
          BOOL v202 = CGRectGetMaxX(v544) < v258;
          double v266 = v258;
          if (v202)
          {
            v545.origin.CGFloat y = v487;
            v545.origin.CGFloat x = v488;
            v545.size.CGFloat width = v493;
            v545.size.CGFloat height = rect;
            double v266 = CGRectGetMaxX(v545);
          }
          if ((v266 - MinX) / v493 + (v266 - MinX) / (v258 - v250) < 0.1)
          {
LABEL_118:

            break;
          }
        }
        v560.origin.CGFloat y = ty + v249 * d + b * v248;
        v560.origin.CGFloat x = v250 + -1.0;
        v560.size.CGFloat width = 1.0;
        v560.size.CGFloat height = 1.0;
        v546.origin.CGFloat y = y;
        v546.origin.CGFloat x = x;
        v546.size.CGFloat height = height;
        v546.size.CGFloat width = width;
        CGRect v547 = CGRectUnion(v546, v560);
        v561.origin.CGFloat y = v470 + v252 * v475 + v472 * v257;
        v561.origin.CGFloat x = v258 + -1.0;
        v561.size.CGFloat width = 1.0;
        v561.size.CGFloat height = 1.0;
        CGRect v548 = CGRectUnion(v547, v561);
        CGFloat y = v548.origin.y;
        CGFloat x = v548.origin.x;
        CGFloat height = v548.size.height;
        CGFloat width = v548.size.width;

        v227 += 4;
        ++v196;
      }
      v549.origin.CGFloat y = y;
      v549.origin.CGFloat x = x;
      v549.size.CGFloat height = height;
      v549.size.CGFloat width = width;
      double v267 = CGRectGetMaxY(v549);
      BOOL v197 = (float)((float)(uint64_t)v196
                   / (float)(unint64_t)objc_msgSend_count(v128, v268, v269, v270, v271, v272)) >= v458
          && v460 >= 0;
      if (v197)
      {
        v550.origin.CGFloat y = y;
        v550.origin.CGFloat x = x;
        v550.size.CGFloat height = height;
        v550.size.CGFloat width = width;
        double MinY = CGRectGetMinY(v550);
        v551.origin.CGFloat y = y;
        v551.origin.CGFloat x = x;
        v551.size.CGFloat height = height;
        v551.size.CGFloat width = width;
        double v280 = CGRectGetMaxY(v551);
        uint64_t v286 = objc_msgSend_count(v455, v281, v282, v283, v284, v285);
        double v267 = (MinY + v280) * 0.5;
        uint64_t v274 = v460;
        if (v460 < (unint64_t)(v286 - 1))
        {
          v287 = objc_msgSend_objectAtIndex_(v455, v273, ++v460, v275, v276, v277);
          objc_msgSend_floatValue(v287, v288, v289, v290, v291, v292);
          float v458 = v293;

          goto LABEL_128;
        }
        uint64_t v460 = -1;
        float v458 = INFINITY;
        float v294 = v267;
        if (v459)
        {
LABEL_153:
          v554.origin.CGFloat y = y;
          v554.origin.CGFloat x = x;
          v554.size.CGFloat height = height;
          v554.size.CGFloat width = width;
          CGFloat MidX = CGRectGetMidX(v554);
          double v311 = v294 + 6.0;
          double v312 = v481 + v483 * v311 + v485 * MidX;
          double v313 = v480 + v482 * v311 + v484 * MidX;
          v314 = v516;
          if (v516 < (double *)v517)
          {
            double *v516 = v312;
            v314[1] = v313;
            v199 = v314 + 2;
            goto LABEL_88;
          }
          v315 = (double *)v515;
          uint64_t v316 = ((char *)v516 - (unsigned char *)v515) >> 4;
          unint64_t v317 = v316 + 1;
          if ((unint64_t)(v316 + 1) >> 60) {
            sub_1C494A220();
          }
          uint64_t v318 = v517 - (unsigned char *)v515;
          if ((v517 - (unsigned char *)v515) >> 3 > v317) {
            unint64_t v317 = v318 >> 3;
          }
          if ((unint64_t)v318 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v319 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v319 = v317;
          }
          if (v319)
          {
            if (v319 >> 60) {
              sub_1C4949AA8();
            }
            v320 = (char *)operator new(16 * v319);
            v321 = (double *)&v320[16 * v316];
            double *v321 = v312;
            v321[1] = v313;
            v322 = v321;
            if (v314 == v315)
            {
LABEL_168:
              v199 = v321 + 2;
              v515 = v322;
              v516 = v321 + 2;
              v517 = &v320[16 * v319];
              if (v314) {
                goto LABEL_169;
              }
              goto LABEL_88;
            }
          }
          else
          {
            v320 = 0;
            v321 = (double *)(16 * v316);
            double *v321 = v312;
            v321[1] = v313;
            v322 = (double *)(16 * v316);
            if (v314 == v315) {
              goto LABEL_168;
            }
          }
          do
          {
            *((_OWORD *)v322 - 1) = *((_OWORD *)v314 - 1);
            v322 -= 2;
            v314 -= 2;
          }
          while (v314 != v315);
          v314 = (double *)v515;
          v199 = v321 + 2;
          v515 = v322;
          v516 = v321 + 2;
          v517 = &v320[16 * v319];
          if (v314) {
LABEL_169:
          }
            operator delete(v314);
LABEL_88:
          char v459 = 1;
          double v184 = v485;
          v516 = v199;
          double v473 = v484;
          double v186 = v482;
          double v185 = v483;
          double v188 = v480;
          double v187 = v481;
          goto LABEL_89;
        }
      }
      else
      {
LABEL_128:
        float v294 = v267;
        if (v459) {
          goto LABEL_153;
        }
      }
      objc_msgSend_averageWritingOrientation(self, v273, v274, v275, v276, v277);
      if (v295 >= 0.0)
      {
        v553.origin.CGFloat y = y;
        v553.origin.CGFloat x = x;
        v553.size.CGFloat height = height;
        v553.size.CGFloat width = width;
        double v296 = CGRectGetMinX(v553);
      }
      else
      {
        v552.origin.CGFloat y = y;
        v552.origin.CGFloat x = x;
        v552.size.CGFloat height = height;
        v552.size.CGFloat width = width;
        double v296 = CGRectGetMaxX(v552);
      }
      double v297 = v294 + 6.0;
      double v298 = v481 + v483 * v297 + v485 * v296;
      double v299 = v480 + v482 * v297 + v484 * v296;
      v300 = v516;
      if (v516 < (double *)v517)
      {
        double *v516 = v298;
        v300[1] = v299;
        v301 = v300 + 2;
LABEL_152:
        v516 = v301;
        goto LABEL_153;
      }
      v302 = (double *)v515;
      uint64_t v303 = ((char *)v516 - (unsigned char *)v515) >> 4;
      unint64_t v304 = v303 + 1;
      if ((unint64_t)(v303 + 1) >> 60) {
        sub_1C494A220();
      }
      uint64_t v305 = v517 - (unsigned char *)v515;
      if ((v517 - (unsigned char *)v515) >> 3 > v304) {
        unint64_t v304 = v305 >> 3;
      }
      if ((unint64_t)v305 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v306 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v306 = v304;
      }
      if (v306)
      {
        if (v306 >> 60) {
          sub_1C4949AA8();
        }
        v307 = (char *)operator new(16 * v306);
        v308 = (double *)&v307[16 * v303];
        double *v308 = v298;
        v308[1] = v299;
        v309 = v308;
        if (v300 == v302) {
          goto LABEL_150;
        }
        do
        {
LABEL_147:
          *((_OWORD *)v309 - 1) = *((_OWORD *)v300 - 1);
          v309 -= 2;
          v300 -= 2;
        }
        while (v300 != v302);
        v300 = (double *)v515;
        v301 = v308 + 2;
        v515 = v309;
        v516 = v308 + 2;
        v517 = &v307[16 * v306];
        if (!v300) {
          goto LABEL_152;
        }
      }
      else
      {
        v307 = 0;
        v308 = (double *)(16 * v303);
        double *v308 = v298;
        v308[1] = v299;
        v309 = (double *)(16 * v303);
        if (v300 != v302) {
          goto LABEL_147;
        }
LABEL_150:
        v301 = v308 + 2;
        v515 = v309;
        v516 = v308 + 2;
        v517 = &v307[16 * v306];
        if (!v300) {
          goto LABEL_152;
        }
      }
      operator delete(v300);
      goto LABEL_152;
    }
LABEL_89:
    ++v196;
  }
  v555.origin.CGFloat y = y;
  v555.origin.CGFloat x = x;
  v555.size.CGFloat height = height;
  v555.size.CGFloat width = width;
  double v328 = CGRectGetMaxY(v555);
  BOOL v329 = v197 || v458 <= 1.0 && v460 >= 0;
  if (objc_msgSend_count(v128, v323, v324, v325, v326, v327))
  {
    if (v329)
    {
      v556.origin.CGFloat y = y;
      v556.origin.CGFloat x = x;
      v556.size.CGFloat height = height;
      v556.size.CGFloat width = width;
      double v384 = CGRectGetMinY(v556);
      v557.origin.CGFloat y = y;
      v557.origin.CGFloat x = x;
      v557.size.CGFloat height = height;
      v557.size.CGFloat width = width;
      double v328 = (v384 + CGRectGetMaxY(v557)) * 0.5;
    }
    objc_msgSend_averageWritingOrientation(self, v379, v380, v381, v382, v383);
    if (v385 >= 0.0)
    {
      v559.origin.CGFloat y = y;
      v559.origin.CGFloat x = x;
      v559.size.CGFloat height = height;
      v559.size.CGFloat width = width;
      double v386 = CGRectGetMaxX(v559);
    }
    else
    {
      v558.origin.CGFloat y = y;
      v558.origin.CGFloat x = x;
      v558.size.CGFloat height = height;
      v558.size.CGFloat width = width;
      double v386 = CGRectGetMinX(v558);
    }
    float v387 = v328;
    double v388 = v386 + 7.0;
    double v389 = v387 + 6.0;
    double v390 = v187 + v185 * v389 + v184 * v388;
    double v391 = v188 + v186 * v389 + v473 * v388;
    v392 = v516;
    if (v516 < (double *)v517)
    {
      double *v516 = v390;
      v392[1] = v391;
      v393 = v392 + 2;
      goto LABEL_212;
    }
    v394 = (double *)v515;
    uint64_t v395 = ((char *)v516 - (unsigned char *)v515) >> 4;
    unint64_t v396 = v395 + 1;
    if ((unint64_t)(v395 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v397 = v517 - (unsigned char *)v515;
    if ((v517 - (unsigned char *)v515) >> 3 > v396) {
      unint64_t v396 = v397 >> 3;
    }
    if ((unint64_t)v397 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v398 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v398 = v396;
    }
    if (v398)
    {
      if (v398 >> 60) {
        sub_1C4949AA8();
      }
      v399 = (char *)operator new(16 * v398);
      v400 = (double *)&v399[16 * v395];
      v401 = &v399[16 * v398];
      double *v400 = v390;
      v400[1] = v391;
      v393 = v400 + 2;
      if (v392 == v394)
      {
LABEL_210:
        v515 = v400;
        v516 = v393;
        v517 = v401;
        if (v392) {
          goto LABEL_211;
        }
        goto LABEL_212;
      }
    }
    else
    {
      v400 = (double *)(16 * v395);
      v401 = 0;
      double *v400 = v390;
      v400[1] = v391;
      v393 = (double *)(16 * v395 + 16);
      if (v392 == v394) {
        goto LABEL_210;
      }
    }
    do
    {
      *((_OWORD *)v400 - 1) = *((_OWORD *)v392 - 1);
      v400 -= 2;
      v392 -= 2;
    }
    while (v392 != v394);
    v392 = (double *)v515;
    v515 = v400;
    v516 = v393;
    v517 = v401;
    if (v392) {
LABEL_211:
    }
      operator delete(v392);
LABEL_212:
    v516 = v393;
    if (v393 == v515)
    {
LABEL_213:
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v402 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v402, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v529 = 0;
        _os_log_impl(&dword_1C492D000, v402, OS_LOG_TYPE_FAULT, "The number of points in the raw baseline estimate must be > 0 at this point.", v529, 2u);
      }
    }
  }
  else if (v516 == v515)
  {
    goto LABEL_213;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v403 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v403, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v405 = *(void *)v515;
    uint64_t v404 = *((void *)v515 + 1);
    *(_DWORD *)v529 = 134218240;
    *(void *)&v529[4] = v405;
    *(_WORD *)&v529[12] = 2048;
    *(void *)&v529[14] = v404;
    _os_log_impl(&dword_1C492D000, v403, OS_LOG_TYPE_DEBUG, "Raw points[0] = %.2f, %.2f\n", v529, 0x16u);
  }

  uint64_t v509 = 0;
  v406 = objc_opt_class();
  if (v406)
  {
    objc_msgSend_regularizedPathFromPoints_delta_gamma_outError_(v406, v407, (uint64_t)&v515, (uint64_t)&v509, v408, v409, 1.0, 0.9);
    if (qword_1EA3CA000 == -1) {
      goto LABEL_224;
    }
LABEL_240:
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v410 = (id)qword_1EA3C9F98;
    if (!os_log_type_enabled(v410, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_226;
    }
LABEL_225:
    v416 = v516;
    v417 = v515;
    uint64_t v418 = v509;
    uint64_t v419 = objc_msgSend_count(v128, v411, v412, v413, v414, v415);
    *(_DWORD *)v529 = 134218496;
    *(void *)&v529[4] = ((char *)v416 - v417) >> 4;
    *(_WORD *)&v529[12] = 2048;
    *(void *)&v529[14] = v418;
    *(_WORD *)&v529[22] = 2048;
    *(void *)&v529[24] = v419;
    _os_log_impl(&dword_1C492D000, v410, OS_LOG_TYPE_DEFAULT, "Baseline Data detectors baseline approximation with %lu points, correction error = %.2f, number of substrokes %lu", v529, 0x20u);
    goto LABEL_226;
  }
  v507 = 0;
  v506 = 0;
  uint64_t v508 = 0;
  if (qword_1EA3CA000 != -1) {
    goto LABEL_240;
  }
LABEL_224:
  v410 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v410, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_225;
  }
LABEL_226:

  v420 = [CHQuadCurvePointFIFO alloc];
  v425 = objc_msgSend_initWithFIFO_(v420, v421, 0, v422, v423, v424);
  v426 = [CHBoxcarFilterPointFIFO alloc];
  LODWORD(v427) = 2.0;
  v431 = objc_msgSend_initWithFIFO_width_spacing_(v426, v428, (uint64_t)v425, 2, v429, v430, v427);
  v432 = [CHPointFIFO alloc];
  v442 = objc_msgSend_initWithFIFO_(v432, v433, (uint64_t)v431, v434, v435, v436);
  v443 = (float64x2_t *)v506;
  if (v507 != v506)
  {
    unint64_t v444 = 0;
    do
    {
      objc_msgSend_addPoint_(v442, v437, v438, v439, v440, v441, COERCE_DOUBLE(vcvt_f32_f64(v443[v444++])));
      v443 = (float64x2_t *)v506;
    }
    while (v444 < (v507 - (unsigned char *)v506) >> 4);
  }
  objc_msgSend_flush(v442, v437, v438, v439, v440, v441);
  v450 = (const CGPath *)objc_msgSend_path(v425, v445, v446, v447, v448, v449);
  v377 = CGPathRetain(v450);

  if (v506)
  {
    v507 = v506;
    operator delete(v506);
  }
  if (v515)
  {
    v516 = (double *)v515;
    operator delete(v515);
  }
  if (__p) {
    operator delete(__p);
  }
  if (v525) {
    operator delete(v525);
  }
LABEL_237:

LABEL_238:
  return v377;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_ancestorIdentifier(self, v5, v6, v7, v8, v9);
  objc_msgSend_encodeInteger_forKey_(v4, v11, v10, @"ancestorIdentifier", v12, v13);
  uint64_t v19 = objc_msgSend_uniqueIdentifier(self, v14, v15, v16, v17, v18);
  objc_msgSend_encodeInteger_forKey_(v4, v20, v19, @"uniqueIdentifier", v21, v22);
  uint64_t v28 = objc_msgSend_strokeIdentifiers(self, v23, v24, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)v28, @"strokeIdentifiers", v30, v31);

  id v37 = objc_msgSend_firstStrokeIdentifier(self, v32, v33, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, @"firstStrokeIdentifier", v39, v40);

  uint64_t v46 = objc_msgSend_lastStrokeIdentifier(self, v41, v42, v43, v44, v45);
  objc_msgSend_encodeObject_forKey_(v4, v47, (uint64_t)v46, @"lastStrokeIdentifier", v48, v49);

  objc_msgSend_bounds(self, v50, v51, v52, v53, v54);
  v154[0] = v55;
  v154[1] = v56;
  v154[2] = v57;
  v154[3] = v58;
  uint64_t v62 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v59, (uint64_t)v154, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v60, v61);
  objc_msgSend_encodeObject_forKey_(v4, v63, (uint64_t)v62, @"bounds", v64, v65);
  uint64_t v71 = objc_msgSend_classification(self, v66, v67, v68, v69, v70);
  objc_msgSend_encodeInteger_forKey_(v4, v72, v71, @"classification", v73, v74);
  objc_msgSend_groupingConfidence(self, v75, v76, v77, v78, v79);
  objc_msgSend_encodeDouble_forKey_(v4, v80, @"groupingConfidence", v81, v82, v83);
  v89 = objc_msgSend_strategyIdentifier(self, v84, v85, v86, v87, v88);
  objc_msgSend_encodeObject_forKey_(v4, v90, (uint64_t)v89, @"strategyIdentifier", v91, v92);

  objc_msgSend_firstStrokeOrigin(self, v93, v94, v95, v96, v97);
  v153[0] = v98;
  v153[1] = v99;
  uint64_t v103 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v100, (uint64_t)v153, (uint64_t)"{CGPoint=dd}", v101, v102);
  objc_msgSend_encodeObject_forKey_(v4, v104, (uint64_t)v103, @"firstStrokeOrigin", v105, v106);
  objc_msgSend_encodeObject_forKey_(v4, v107, (uint64_t)self->_writingDirectionSortedStrokeIdentifiers, @"writingDirectionSortedStrokeIdentifiers", v108, v109);
  objc_msgSend_encodeObject_forKey_(v4, v110, (uint64_t)self->_writingDirectionSortedSubstrokes, @"writingDirectionSortedSubstrokes", v111, v112);
  v116 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v113, (uint64_t)&self->_averageStrokeDeviation, (uint64_t)"{CGPoint=dd}", v114, v115);
  objc_msgSend_encodeObject_forKey_(v4, v117, (uint64_t)v116, @"averageStrokeDeviation", v118, v119);
  uint64_t v123 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v120, (uint64_t)&self->_averageWritingOrientation, (uint64_t)"{CGPoint=dd}", v121, v122);
  objc_msgSend_encodeObject_forKey_(v4, v124, (uint64_t)v123, @"averageWritingOrientation", v125, v126);
  id v127 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v133 = *objc_msgSend_localStrokeWritingOrientations(self, v128, v129, v130, v131, v132);
  v139 = objc_msgSend_localStrokeWritingOrientations(self, v134, v135, v136, v137, v138);
  uint64_t v143 = objc_msgSend_dataWithBytes_length_(v127, v140, v133, v139[1] - *v139, v141, v142);
  objc_msgSend_encodeObject_forKey_(v4, v144, (uint64_t)v143, @"localStrokeWritingOrientations", v145, v146);
  objc_msgSend_encodeInteger_forKey_(v4, v147, self->_lastSubstrokeIndexBeforeMerge, @"lastSubstrokeIndexBeforeMerge", v148, v149);
  objc_msgSend_encodeObject_forKey_(v4, v150, (uint64_t)self->_coalescedLastSubstrokes, @"coalescedLastSubstrokes", v151, v152);
}

- (CHTextLineStrokeGroup)initWithCoder:(id)a3
{
  v166[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_decodeIntegerForKey_(v3, v4, @"ancestorIdentifier", v5, v6, v7);
  uint64_t v13 = objc_msgSend_decodeIntegerForKey_(v3, v9, @"uniqueIdentifier", v10, v11, v12);
  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  v166[0] = objc_opt_class();
  v166[1] = objc_opt_class();
  uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v166, 2, v16, v17);
  uint64_t v23 = objc_msgSend_setWithArray_(v14, v19, (uint64_t)v18, v20, v21, v22);
  uint64_t v147 = v13;
  uint64_t v148 = v8;
  v154 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v24, (uint64_t)v23, @"strokeIdentifiers", v25, v26);

  uint64_t v27 = objc_opt_class();
  uint64_t v153 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v28, v27, @"firstStrokeIdentifier", v29, v30);
  uint64_t v31 = objc_opt_class();
  uint64_t v152 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v32, v31, @"lastStrokeIdentifier", v33, v34);
  uint64_t v35 = objc_opt_class();
  uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v36, v35, @"bounds", v37, v38);
  long long v40 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v161 = *MEMORY[0x1E4F1DB20];
  long long v162 = v40;
  uint64_t v146 = v39;
  objc_msgSend_getValue_size_(v39, v41, (uint64_t)&v161, 32, v42, v43);
  objc_msgSend_decodeDoubleForKey_(v3, v44, @"groupingConfidence", v45, v46, v47);
  uint64_t v49 = v48;
  uint64_t v54 = objc_msgSend_decodeIntegerForKey_(v3, v50, @"classification", v51, v52, v53);
  uint64_t v55 = objc_opt_class();
  uint64_t v151 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v56, v55, @"strategyIdentifier", v57, v58);
  uint64_t v59 = objc_opt_class();
  uint64_t v145 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v60, v59, @"firstStrokeOrigin", v61, v62);
  objc_msgSend_getValue_size_(v145, v63, (uint64_t)v160, 16, v64, v65);
  uint64_t v66 = (void *)MEMORY[0x1E4F1CAD0];
  v165[0] = objc_opt_class();
  v165[1] = objc_opt_class();
  uint64_t v70 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v67, (uint64_t)v165, 2, v68, v69);
  uint64_t v75 = objc_msgSend_setWithArray_(v66, v71, (uint64_t)v70, v72, v73, v74);
  uint64_t v76 = v54;
  uint64_t v150 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v77, (uint64_t)v75, @"writingDirectionSortedStrokeIdentifiers", v78, v79);

  uint64_t v80 = (void *)MEMORY[0x1E4F1CAD0];
  v164[0] = objc_opt_class();
  v164[1] = objc_opt_class();
  uint64_t v84 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v81, (uint64_t)v164, 2, v82, v83);
  v89 = objc_msgSend_setWithArray_(v80, v85, (uint64_t)v84, v86, v87, v88);
  uint64_t v93 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v90, (uint64_t)v89, @"writingDirectionSortedSubstrokes", v91, v92);

  uint64_t v94 = objc_opt_class();
  uint64_t v98 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v95, v94, @"averageStrokeDeviation", v96, v97);
  objc_msgSend_getValue_size_(v98, v99, (uint64_t)v159, 16, v100, v101);
  uint64_t v102 = objc_opt_class();
  uint64_t v106 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v103, v102, @"averageWritingOrientation", v104, v105);
  objc_msgSend_getValue_size_(v106, v107, (uint64_t)v158, 16, v108, v109);
  uint64_t v110 = objc_opt_class();
  uint64_t v114 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v111, v110, @"localStrokeWritingOrientations", v112, v113);
  uint64_t v120 = objc_msgSend_length(v114, v115, v116, v117, v118, v119);
  id v121 = v114;
  id v127 = (char *)objc_msgSend_bytes(v121, v122, v123, v124, v125, v126);
  __p = 0;
  v156 = 0;
  uint64_t v157 = 0;
  sub_1C49B7D84(&__p, v127, &v127[v120 & 0xFFFFFFFFFFFFFFF0], v120 >> 4);
  id v128 = (void *)MEMORY[0x1E4F1CAD0];
  v163[0] = objc_opt_class();
  v163[1] = objc_opt_class();
  uint64_t v132 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v129, (uint64_t)v163, 2, v130, v131);
  uint64_t v137 = objc_msgSend_setWithArray_(v128, v133, (uint64_t)v132, v134, v135, v136);
  uint64_t v141 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v138, (uint64_t)v137, @"coalescedLastSubstrokes", v139, v140);

  uint64_t v143 = (CHTextLineStrokeGroup *)objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_strategyIdentifier_writingDirectionSortedSubstrokes_averageWritingOrientation_averageStrokeDeviation_writingDirectionSortedStrokeIdentifiers_localStrokeWritingOrientations_coalescedLastSubstrokes_groupingConfidence_firstStrokeOrigin_(self, v142, v147, v148, (uint64_t)v154, (uint64_t)v153, v152, v76, v161, v162, v158[0], v158[1], v159[0], v159[1], v151, v93, v150, &__p, v141,
                                    v49,
                                    v160[0],
                                    v160[1]);

  if (__p)
  {
    v156 = __p;
    operator delete(__p);
  }

  return v143;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)writingDirectionSortedStrokeIdentifiers
{
  return self->_writingDirectionSortedStrokeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writingDirectionSortedStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_coalescedLastSubstrokes, 0);
  begin = self->_localStrokeWritingOrientations.__begin_;
  if (begin)
  {
    self->_localStrokeWritingOrientations.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_writingDirectionSortedSubstrokes, 0);
}

- (id).cxx_construct
{
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 22) = 0;
  return self;
}

@end