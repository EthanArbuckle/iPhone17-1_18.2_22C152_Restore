@interface CHStrokeGroupBasedVisualization
- (BOOL)newGroupsDefaultToActive;
- (CGRect)dirtyRectForStrokeGroup:(id)a3;
- (CHRecognitionSessionResult)resultDrawn;
- (NSSet)activeStrokeGroupAncestorIdentifiers;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
- (void)recognitionSessionDidUpdateRecognitionResult;
- (void)toggleVisualizationRegionAtPoint:(CGPoint)a3;
@end

@implementation CHStrokeGroupBasedVisualization

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  objc_msgSend_bounds(a3, a2, (uint64_t)a3, v3, v4, v5);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)recognitionSessionDidUpdateRecognitionResult
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  double v7 = objc_msgSend_resultDrawn(self, a2, v2, v3, v4, v5);

  if (self)
  {
    resultDrawn = self->_resultDrawn;
    self->_resultDrawn = 0;
  }
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v18 = objc_msgSend_recognitionSession(self, v8, v9, v10, v11, v12);
  v24 = objc_msgSend_lastRecognitionResult(v18, v19, v20, v21, v22, v23);

  v30 = objc_msgSend_strokeGroupingResult(v24, v25, v26, v27, v28, v29);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v36 = objc_msgSend_createdStrokeGroups(v30, v31, v32, v33, v34, v35);
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v100, (uint64_t)v105, 16, v38);
  if (v39)
  {
    uint64_t v44 = v39;
    uint64_t v45 = *(void *)v101;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v101 != v45) {
          objc_enumerationMutation(v36);
        }
        objc_msgSend_dirtyRectForStrokeGroup_(self, v40, *(void *)(*((void *)&v100 + 1) + 8 * v46), v41, v42, v43);
        v112.origin.double x = v47;
        v112.origin.double y = v48;
        v112.size.double width = v49;
        v112.size.double height = v50;
        v107.origin.double x = x;
        v107.origin.double y = y;
        v107.size.double width = width;
        v107.size.double height = height;
        CGRect v108 = CGRectUnion(v107, v112);
        double x = v108.origin.x;
        double y = v108.origin.y;
        double width = v108.size.width;
        double height = v108.size.height;
        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v40, (uint64_t)&v100, (uint64_t)v105, 16, v43);
    }
    while (v44);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v56 = objc_msgSend_deletedStrokeGroups(v30, v51, v52, v53, v54, v55, 0);
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v96, (uint64_t)v104, 16, v58);
  if (v59)
  {
    uint64_t v64 = v59;
    uint64_t v65 = *(void *)v97;
    do
    {
      uint64_t v66 = 0;
      do
      {
        if (*(void *)v97 != v65) {
          objc_enumerationMutation(v56);
        }
        objc_msgSend_dirtyRectForStrokeGroup_(self, v60, *(void *)(*((void *)&v96 + 1) + 8 * v66), v61, v62, v63);
        v113.origin.double x = v67;
        v113.origin.double y = v68;
        v113.size.double width = v69;
        v113.size.double height = v70;
        v109.origin.double x = x;
        v109.origin.double y = y;
        v109.size.double width = width;
        v109.size.double height = height;
        CGRect v110 = CGRectUnion(v109, v113);
        double x = v110.origin.x;
        double y = v110.origin.y;
        double width = v110.size.width;
        double height = v110.size.height;
        ++v66;
      }
      while (v64 != v66);
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v60, (uint64_t)&v96, (uint64_t)v104, 16, v63);
    }
    while (v64);
  }

  if (objc_msgSend_newGroupsDefaultToActive(self, v71, v72, v73, v74, v75))
  {
    v81 = objc_msgSend_createdStrokeGroups(v30, v76, v77, v78, v79, v80);
    sub_1C4B397BC(self, v81);
  }
  if (!v7)
  {
    v87 = objc_msgSend_delegate(self, v76, v77, v78, v79, v80);
    objc_msgSend_visualizationNeedsDisplay_(v87, v92, (uint64_t)self, v93, v94, v95);
    goto LABEL_23;
  }
  v111.origin.double x = x;
  v111.origin.double y = y;
  v111.size.double width = width;
  v111.size.double height = height;
  if (!CGRectIsEmpty(v111))
  {
    v87 = objc_msgSend_delegate(self, v82, v83, v84, v85, v86);
    objc_msgSend_visualization_needsDisplayInRect_(v87, v88, (uint64_t)self, v89, v90, v91, x, y, width, height);
LABEL_23:
  }
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  uint64_t v9 = objc_msgSend_resultDrawn(self, a2, (uint64_t)a4, v5, v6, v7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  if (!v9)
  {
    v15 = objc_msgSend_recognitionSession(self, v10, v11, v12, v13, v14);
    uint64_t v21 = objc_msgSend_lastRecognitionResult(v15, v16, v17, v18, v19, v20);
    if (self) {
      objc_storeStrong((id *)&self->_resultDrawn, v21);
    }

    if (objc_msgSend_newGroupsDefaultToActive(self, v22, v23, v24, v25, v26))
    {
      objc_msgSend_resultDrawn(self, v27, v28, v29, v30, v31);
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend_strokeGroupingResult(v44, v32, v33, v34, v35, v36);
      uint64_t v43 = objc_msgSend_strokeGroups(v37, v38, v39, v40, v41, v42);
      sub_1C4B397BC(self, v43);
    }
  }
}

- (void)toggleVisualizationRegionAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = objc_msgSend_activeStrokeGroupAncestorIdentifiers(self, a2, v3, v4, v5, v6);
  v16 = objc_msgSend_mutableCopy(v10, v11, v12, v13, v14, v15);

  if (!v16)
  {
    v16 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v17, v18, v19, v20, v21);
  }
  uint64_t v22 = (double *)MEMORY[0x1E4F1DB20];
  uint64_t v23 = objc_msgSend_resultDrawn(self, v17, v18, v19, v20, v21);

  if (!v23)
  {
    uint64_t v29 = objc_msgSend_recognitionSession(self, v24, v25, v26, v27, v28);
    uint64_t v35 = objc_msgSend_lastRecognitionResult(v29, v30, v31, v32, v33, v34);
    if (self) {
      objc_storeStrong((id *)&self->_resultDrawn, v35);
    }
  }
  double v37 = *v22;
  double v36 = v22[1];
  double width = v22[2];
  double height = v22[3];
  uint64_t v40 = objc_msgSend_resultDrawn(self, v24, v25, v26, v27, v28);
  uint64_t v46 = objc_msgSend_strokeGroupingResult(v40, v41, v42, v43, v44, v45);

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v52 = objc_msgSend_strokeGroups(v46, v47, v48, v49, v50, v51, 0);
  uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v99, (uint64_t)v103, 16, v54);
  if (v55)
  {
    uint64_t v61 = v55;
    uint64_t v62 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v100 != v62) {
          objc_enumerationMutation(v52);
        }
        uint64_t v72 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        objc_msgSend_bounds(v72, v56, v57, v58, v59, v60);
        v105.CGFloat x = x;
        v105.CGFloat y = y;
        if (CGRectContainsPoint(v108, v105))
        {
          uint64_t v73 = NSNumber;
          uint64_t v74 = objc_msgSend_ancestorIdentifier(v72, v56, v57, v58, v59, v60);
          uint64_t v79 = objc_msgSend_numberWithInteger_(v73, v75, v74, v76, v77, v78);
          if (objc_msgSend_containsObject_(v16, v80, (uint64_t)v79, v81, v82, v83)) {
            objc_msgSend_removeObject_(v16, v84, (uint64_t)v79, v85, v86, v87);
          }
          else {
            objc_msgSend_addObject_(v16, v84, (uint64_t)v79, v85, v86, v87);
          }
          objc_msgSend_dirtyRectForStrokeGroup_(self, v64, (uint64_t)v72, v65, v66, v67);
          v110.origin.CGFloat x = v68;
          v110.origin.CGFloat y = v69;
          v110.size.double width = v70;
          v110.size.double height = v71;
          v106.origin.CGFloat x = v37;
          v106.origin.CGFloat y = v36;
          v106.size.double width = width;
          v106.size.double height = height;
          CGRect v107 = CGRectUnion(v106, v110);
          double v37 = v107.origin.x;
          double v36 = v107.origin.y;
          double width = v107.size.width;
          double height = v107.size.height;
        }
      }
      uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v56, (uint64_t)&v99, (uint64_t)v103, 16, v60);
    }
    while (v61);
  }

  if (self) {
    objc_setProperty_nonatomic_copy(self, v88, v16, 40);
  }
  v109.origin.CGFloat x = v37;
  v109.origin.CGFloat y = v36;
  v109.size.double width = width;
  v109.size.double height = height;
  if (!CGRectIsNull(v109))
  {
    uint64_t v94 = objc_msgSend_delegate(self, v89, v90, v91, v92, v93);
    objc_msgSend_visualization_needsDisplayInRect_(v94, v95, (uint64_t)self, v96, v97, v98, v37, v36, width, height);
  }
}

- (CHRecognitionSessionResult)resultDrawn
{
  return self->_resultDrawn;
}

- (NSSet)activeStrokeGroupAncestorIdentifiers
{
  return self->_activeStrokeGroupAncestorIdentifiers;
}

- (BOOL)newGroupsDefaultToActive
{
  return self->_newGroupsDefaultToActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeStrokeGroupAncestorIdentifiers, 0);
  objc_storeStrong((id *)&self->_resultDrawn, 0);
}

@end