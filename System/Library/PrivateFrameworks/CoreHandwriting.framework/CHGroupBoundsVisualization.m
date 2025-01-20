@interface CHGroupBoundsVisualization
- (CGRect)dirtyRectForStrokeGroup:(id)a3;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
@end

@implementation CHGroupBoundsVisualization

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CHGroupBoundsVisualization;
  [(CHStrokeGroupBasedVisualization *)&v3 dirtyRectForStrokeGroup:a3];
  return CGRectInset(v4, -2.0, -2.0);
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)CHGroupBoundsVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v71, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v16 = objc_msgSend_resultDrawn(self, v11, v12, v13, v14, v15);
  v22 = objc_msgSend_strokeGroupingResult(v16, v17, v18, v19, v20, v21);

  v28 = objc_msgSend_strokeGroups(v22, v23, v24, v25, v26, v27);
  v34 = objc_msgSend_allObjects(v28, v29, v30, v31, v32, v33);
  v38 = objc_msgSend_sortedArrayWithOptions_usingComparator_(v34, v35, 1, (uint64_t)&unk_1F2012F90, v36, v37);

  CGContextSetLineWidth(a4, 2.0);
  *(_OWORD *)lengths = xmmword_1C4C3A740;
  CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v39 = v38;
  uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v67, (uint64_t)v72, 16, v41);
  if (v42)
  {
    uint64_t v48 = v42;
    uint64_t v49 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v68 != v49) {
          objc_enumerationMutation(v39);
        }
        v51 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        objc_msgSend_bounds(v51, v43, v44, v45, v46, v47, (void)v67);
        CGFloat v52 = v75.origin.x;
        CGFloat v53 = v75.origin.y;
        CGFloat v54 = v75.size.width;
        CGFloat v55 = v75.size.height;
        v77.origin.CGFloat x = x;
        v77.origin.CGFloat y = y;
        v77.size.CGFloat width = width;
        v77.size.CGFloat height = height;
        if (CGRectIntersectsRect(v75, v77))
        {
          v56 = objc_msgSend_delegate(self, v43, v44, v45, v46, v47);
          uint64_t v61 = objc_msgSend_visualizationIndexForStrokeGroup_(v56, v57, (uint64_t)v51, v58, v59, v60);

          v66 = (CGColor *)objc_msgSend_newColorForVisualizedItemAtIndex_(CHVisualizationManager, v62, v61, v63, v64, v65);
          CGContextSetStrokeColorWithColor(a4, v66);
          CGColorRelease(v66);
          v76.origin.CGFloat x = v52;
          v76.origin.CGFloat y = v53;
          v76.size.CGFloat width = v54;
          v76.size.CGFloat height = v55;
          CGContextStrokeRect(a4, v76);
        }
      }
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v43, (uint64_t)&v67, (uint64_t)v72, 16, v47);
    }
    while (v48);
  }
}

@end