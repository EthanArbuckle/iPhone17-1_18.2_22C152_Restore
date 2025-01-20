@interface CHTopDownStrokeSplit
+ (id)writingDirectionOrderedStrokes:(id)a3 substrokesByStrokeIdentifier:(id)a4 writingOrientation:(int64_t)a5;
- (CGRect)groupBounds1;
- (CGRect)groupBounds2;
- (CHTopDownStrokeSplit)initWithStrokes:(id)a3 substrokesByStrokeIdentifier:(id)a4 splitIndex:(int64_t)a5 writingOrientation:(int64_t)a6;
- (NSArray)orderedStrokes;
- (NSArray)orderedStrokesGroup1;
- (NSArray)orderedStrokesGroup2;
- (NSArray)strokeGroup1;
- (NSArray)strokeGroup2;
- (double)transitionTime;
- (int64_t)substrokeCount1;
- (int64_t)substrokeCount2;
@end

@implementation CHTopDownStrokeSplit

- (CHTopDownStrokeSplit)initWithStrokes:(id)a3 substrokesByStrokeIdentifier:(id)a4 splitIndex:(int64_t)a5 writingOrientation:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v117.receiver = self;
  v117.super_class = (Class)CHTopDownStrokeSplit;
  id v17 = [(CHTopDownStrokeSplit *)&v117 init];
  if (v17)
  {
    v18 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
    v29 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21, v22, v23);
    int64_t v30 = 0;
    CGFloat v31 = *MEMORY[0x1E4F1DB20];
    CGFloat v32 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v33 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v34 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = v32;
    CGFloat width = v33;
    CGFloat height = v34;
    while (v30 < (unint64_t)objc_msgSend_count(v10, v24, v25, v26, v27, v28))
    {
      v48 = objc_msgSend_objectAtIndexedSubscript_(v10, v39, v30, v41, v42, v43);
      if (v30 <= a5)
      {
        objc_msgSend_addObject_(v18, v44, (uint64_t)v48, v45, v46, v47);
        objc_msgSend_bounds(v48, v58, v59, v60, v61, v62);
        v123.origin.CGFloat x = v63;
        v123.origin.CGFloat y = v64;
        v123.size.CGFloat width = v65;
        v123.size.CGFloat height = v66;
        v120.origin.CGFloat x = x;
        v120.origin.CGFloat y = y;
        v120.size.CGFloat width = width;
        v120.size.CGFloat height = height;
        CGRect v121 = CGRectUnion(v120, v123);
        CGFloat x = v121.origin.x;
        CGFloat y = v121.origin.y;
        CGFloat width = v121.size.width;
        CGFloat height = v121.size.height;
      }
      else
      {
        objc_msgSend_addObject_(v29, v44, (uint64_t)v48, v45, v46, v47);
        objc_msgSend_bounds(v48, v49, v50, v51, v52, v53);
        v122.origin.CGFloat x = v54;
        v122.origin.CGFloat y = v55;
        v122.size.CGFloat width = v56;
        v122.size.CGFloat height = v57;
        v118.origin.CGFloat x = v31;
        v118.origin.CGFloat y = v32;
        v118.size.CGFloat width = v33;
        v118.size.CGFloat height = v34;
        CGRect v119 = CGRectUnion(v118, v122);
        CGFloat v31 = v119.origin.x;
        CGFloat v32 = v119.origin.y;
        CGFloat v33 = v119.size.width;
        CGFloat v34 = v119.size.height;
      }

      ++v30;
    }
    uint64_t v67 = objc_msgSend_copy(v18, v39, v40, v41, v42, v43);
    v68 = (void *)*((void *)v17 + 1);
    *((void *)v17 + 1) = v67;

    uint64_t v74 = objc_msgSend_copy(v29, v69, v70, v71, v72, v73);
    v75 = (void *)*((void *)v17 + 2);
    *((void *)v17 + 2) = v74;

    *((CGFloat *)v17 + 9) = x;
    *((CGFloat *)v17 + 10) = y;
    *((CGFloat *)v17 + 11) = width;
    *((CGFloat *)v17 + 12) = height;
    *((CGFloat *)v17 + 13) = v31;
    *((CGFloat *)v17 + 14) = v32;
    *((CGFloat *)v17 + 15) = v33;
    *((CGFloat *)v17 + 16) = v34;
    v81 = objc_msgSend_firstObject(v29, v76, v77, v78, v79, v80);
    objc_msgSend_startTimestamp(v81, v82, v83, v84, v85, v86);
    double v88 = v87;
    v94 = objc_msgSend_lastObject(v18, v89, v90, v91, v92, v93);
    objc_msgSend_endTimestamp(v94, v95, v96, v97, v98, v99);
    *((double *)v17 + 3) = v88 - v100;

    v101 = objc_opt_class();
    uint64_t v104 = objc_msgSend_writingDirectionOrderedStrokes_substrokesByStrokeIdentifier_writingOrientation_(v101, v102, (uint64_t)v10, (uint64_t)v11, a6, v103);
    v105 = (void *)*((void *)v17 + 4);
    *((void *)v17 + 4) = v104;

    v106 = objc_opt_class();
    uint64_t v109 = objc_msgSend_writingDirectionOrderedStrokes_substrokesByStrokeIdentifier_writingOrientation_(v106, v107, *((void *)v17 + 1), (uint64_t)v11, a6, v108);
    v110 = (void *)*((void *)v17 + 5);
    *((void *)v17 + 5) = v109;

    v111 = objc_opt_class();
    uint64_t v114 = objc_msgSend_writingDirectionOrderedStrokes_substrokesByStrokeIdentifier_writingOrientation_(v111, v112, *((void *)v17 + 2), (uint64_t)v11, a6, v113);
    v115 = (void *)*((void *)v17 + 6);
    *((void *)v17 + 6) = v114;

    *((void *)v17 + 7) = sub_1C4AD1230(v18, v11);
    *((void *)v17 + 8) = sub_1C4AD1230(v29, v11);
  }
  return (CHTopDownStrokeSplit *)v17;
}

+ (id)writingDirectionOrderedStrokes:(id)a3 substrokesByStrokeIdentifier:(id)a4 writingOrientation:(int64_t)a5
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4AD1488;
  v15[3] = &unk_1E64E3720;
  id v16 = v7;
  int64_t v17 = a5;
  id v8 = v7;
  uint64_t v13 = objc_msgSend_sortedArrayUsingComparator_(a3, v9, (uint64_t)v15, v10, v11, v12);

  return v13;
}

- (NSArray)strokeGroup1
{
  return self->_strokeGroup1;
}

- (NSArray)strokeGroup2
{
  return self->_strokeGroup2;
}

- (CGRect)groupBounds1
{
  double x = self->_groupBounds1.origin.x;
  double y = self->_groupBounds1.origin.y;
  double width = self->_groupBounds1.size.width;
  double height = self->_groupBounds1.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)groupBounds2
{
  double x = self->_groupBounds2.origin.x;
  double y = self->_groupBounds2.origin.y;
  double width = self->_groupBounds2.size.width;
  double height = self->_groupBounds2.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)transitionTime
{
  return self->_transitionTime;
}

- (NSArray)orderedStrokes
{
  return self->_orderedStrokes;
}

- (NSArray)orderedStrokesGroup1
{
  return self->_orderedStrokesGroup1;
}

- (NSArray)orderedStrokesGroup2
{
  return self->_orderedStrokesGroup2;
}

- (int64_t)substrokeCount1
{
  return self->_substrokeCount1;
}

- (int64_t)substrokeCount2
{
  return self->_substrokeCount2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedStrokesGroup2, 0);
  objc_storeStrong((id *)&self->_orderedStrokesGroup1, 0);
  objc_storeStrong((id *)&self->_orderedStrokes, 0);
  objc_storeStrong((id *)&self->_strokeGroup2, 0);
  objc_storeStrong((id *)&self->_strokeGroup1, 0);
}

@end