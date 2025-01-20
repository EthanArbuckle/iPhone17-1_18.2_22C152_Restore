@interface CHStrokeGroupingVisualization
- (CGColor)newColorForStrokeInGroup:(id)a3;
- (CGRect)dirtyRectForStrokeGroup:(id)a3;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
@end

@implementation CHStrokeGroupingVisualization

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CHStrokeGroupingVisualization;
  [(CHStrokeGroupBasedVisualization *)&v3 dirtyRectForStrokeGroup:a3];
  return CGRectInset(v4, -1.5, -1.5);
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  v102.receiver = self;
  v102.super_class = (Class)CHStrokeGroupingVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v102, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v16 = objc_msgSend_recognitionSession(self, v11, v12, v13, v14, v15);
  v92 = objc_msgSend_latestStrokeProvider(v16, v17, v18, v19, v20, v21);

  v90 = self;
  v27 = objc_msgSend_resultDrawn(self, v22, v23, v24, v25, v26);
  v33 = objc_msgSend_strokeGroupingResult(v27, v28, v29, v30, v31, v32);

  v85 = v33;
  v39 = objc_msgSend_strokeGroups(v33, v34, v35, v36, v37, v38);
  v45 = objc_msgSend_allObjects(v39, v40, v41, v42, v43, v44);
  v49 = objc_msgSend_sortedArrayWithOptions_usingComparator_(v45, v46, 1, (uint64_t)&unk_1F2012CD0, v47, v48);

  space = CGColorSpaceCreateDeviceRGB();
  color = CGColorCreate(space, dbl_1C4C3B158);
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obj = v49;
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v98, (uint64_t)v104, 16, v51);
  if (v52)
  {
    uint64_t v58 = v52;
    uint64_t v59 = *(void *)v99;
    uint64_t v86 = *(void *)v99;
    do
    {
      uint64_t v60 = 0;
      uint64_t v87 = v58;
      do
      {
        if (*(void *)v99 != v59) {
          objc_enumerationMutation(obj);
        }
        v61 = *(void **)(*((void *)&v98 + 1) + 8 * v60);
        objc_msgSend_bounds(v61, v53, v54, v55, v56, v57);
        v107.origin.CGFloat x = x;
        v107.origin.CGFloat y = y;
        v107.size.CGFloat width = width;
        v107.size.CGFloat height = height;
        if (CGRectIntersectsRect(v106, v107))
        {
          uint64_t v89 = v60;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          v62 = objc_msgSend_strokeIdentifiers(v61, v53, v54, v55, v56, v57);
          uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v94, (uint64_t)v103, 16, v64);
          if (v65)
          {
            uint64_t v66 = v65;
            uint64_t v67 = *(void *)v95;
            do
            {
              for (uint64_t i = 0; i != v66; ++i)
              {
                if (*(void *)v95 != v67) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v71 = *(void *)(*((void *)&v94 + 1) + 8 * i);
                v72 = objc_opt_class();
                v76 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v72, v73, v71, (uint64_t)v92, v74, v75);
                if (v76)
                {
                  Mutable = CGPathCreateMutable();
                  v93[0] = MEMORY[0x1E4F143A8];
                  v93[1] = 3221225472;
                  v93[2] = sub_1C4A527EC;
                  v93[3] = &unk_1E64E2D40;
                  v93[4] = Mutable;
                  objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(CHStrokeUtilities, v78, (uint64_t)v76, 1, 1, (uint64_t)v93);
                  CGContextSetStrokeColorWithColor(a4, color);
                  CGContextSetLineWidth(a4, 3.0);
                  CGContextAddPath(a4, Mutable);
                  CGContextStrokePath(a4);
                  CGContextSetLineWidth(a4, 1.5);
                  v83 = (CGColor *)objc_msgSend_newColorForStrokeInGroup_(v90, v79, (uint64_t)v61, v80, v81, v82);
                  CGContextSetStrokeColorWithColor(a4, v83);
                  CGContextAddPath(a4, Mutable);
                  CGContextStrokePath(a4);
                  CGColorRelease(v83);
                  CGPathRelease(Mutable);
                }
              }
              uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v69, (uint64_t)&v94, (uint64_t)v103, 16, v70);
            }
            while (v66);
          }

          uint64_t v59 = v86;
          uint64_t v58 = v87;
          uint64_t v60 = v89;
        }
        ++v60;
      }
      while (v60 != v58);
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v98, (uint64_t)v104, 16, v57);
    }
    while (v58);
  }

  CGColorSpaceRelease(space);
  CGColorRelease(color);
}

- (CGColor)newColorForStrokeInGroup:(id)a3
{
  id v4 = a3;
  v10 = objc_msgSend_delegate(self, v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_visualizationIndexForStrokeGroup_(v10, v11, (uint64_t)v4, v12, v13, v14);

  return (CGColor *)objc_msgSend_newColorForVisualizedItemAtIndex_(CHVisualizationManager, v16, v15, v17, v18, v19);
}

@end