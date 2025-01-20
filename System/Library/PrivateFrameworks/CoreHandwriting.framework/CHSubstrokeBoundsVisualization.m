@interface CHSubstrokeBoundsVisualization
- (CGRect)dirtyRectForStrokeGroup:(id)a3;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
@end

@implementation CHSubstrokeBoundsVisualization

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CHSubstrokeBoundsVisualization;
  [(CHStrokeGroupBasedVisualization *)&v3 dirtyRectForStrokeGroup:a3];
  return CGRectInset(v4, -2.0, -2.0);
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v77.receiver = self;
  v77.super_class = (Class)CHSubstrokeBoundsVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v77, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v16 = objc_msgSend_resultDrawn(self, v11, v12, v13, v14, v15);
  v67 = objc_msgSend_strokeGroupingResult(v16, v17, v18, v19, v20, v21);

  v27 = objc_msgSend_strokeGroups(v67, v22, v23, v24, v25, v26);
  v33 = objc_msgSend_allObjects(v27, v28, v29, v30, v31, v32);
  v66 = objc_msgSend_sortedArrayWithOptions_usingComparator_(v33, v34, 1, (uint64_t)&unk_1F2012C90, v35, v36);

  CGContextSetLineWidth(a4, 2.0);
  *(_OWORD *)lengths = xmmword_1C4C3A740;
  CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = v66;
  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v73, (uint64_t)v79, 16, v38);
  if (v44)
  {
    uint64_t v45 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v74 != v45) {
          objc_enumerationMutation(obj);
        }
        v47 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        objc_msgSend_bounds(v47, v39, v40, v41, v42, v43);
        v84.origin.CGFloat x = x;
        v84.origin.CGFloat y = y;
        v84.size.CGFloat width = width;
        v84.size.CGFloat height = height;
        if (CGRectIntersectsRect(v82, v84))
        {
          id v48 = v47;
          if (objc_opt_respondsToSelector())
          {
            v54 = objc_msgSend_writingDirectionSortedSubstrokes(v48, v49, v50, v51, v52, v53);
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            id v55 = v54;
            uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v69, (uint64_t)v78, 16, v57);
            if (v63)
            {
              uint64_t v64 = *(void *)v70;
              do
              {
                for (uint64_t j = 0; j != v63; ++j)
                {
                  if (*(void *)v70 != v64) {
                    objc_enumerationMutation(v55);
                  }
                  objc_msgSend_rotatedBounds(*(void **)(*((void *)&v69 + 1) + 8 * j), v58, v59, v60, v61, v62);
                  CGContextStrokeRect(a4, v83);
                }
                uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v69, (uint64_t)v78, 16, v62);
              }
              while (v63);
            }
          }
        }
      }
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v73, (uint64_t)v79, 16, v43);
    }
    while (v44);
  }
}

@end