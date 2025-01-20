@interface CHStrokeVisualization
- (void)drawStrokesFromStrokeProvider:(id)a3 inRect:(CGRect)a4 context:(CGContext *)a5;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
- (void)recognitionSessionDidUpdateRecognitionResult;
@end

@implementation CHStrokeVisualization

- (void)recognitionSessionDidUpdateRecognitionResult
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (!self
    || (strokeProviderDrawn = self->__strokeProviderDrawn,
        self->__strokeProviderDrawn = 0,
        strokeProviderDrawn,
        !strokeProviderDrawn))
  {
    v76 = objc_msgSend_delegate(self, a2, v2, v3, v4, v5);
    objc_msgSend_visualizationNeedsDisplay_(v76, v81, (uint64_t)self, v82, v83, v84);
    goto LABEL_20;
  }
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v12 = objc_msgSend_recognitionSession(self, a2, v2, v3, v4, v5);
  v18 = objc_msgSend_lastRecognitionResult(v12, v13, v14, v15, v16, v17);
  v24 = objc_msgSend_strokeGroupingResult(v18, v19, v20, v21, v22, v23);

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v30 = objc_msgSend_createdStrokeGroups(v24, v25, v26, v27, v28, v29);
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v89, (uint64_t)v94, 16, v32);
  if (v33)
  {
    uint64_t v39 = v33;
    uint64_t v40 = *(void *)v90;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v90 != v40) {
          objc_enumerationMutation(v30);
        }
        objc_msgSend_bounds(*(void **)(*((void *)&v89 + 1) + 8 * v41), v34, v35, v36, v37, v38);
        v103.origin.CGFloat x = v42;
        v103.origin.CGFloat y = v43;
        v103.size.CGFloat width = v44;
        v103.size.CGFloat height = v45;
        v96.origin.CGFloat x = x;
        v96.origin.CGFloat y = y;
        v96.size.CGFloat width = width;
        v96.size.CGFloat height = height;
        CGRect v97 = CGRectUnion(v96, v103);
        CGFloat x = v97.origin.x;
        CGFloat y = v97.origin.y;
        CGFloat width = v97.size.width;
        CGFloat height = v97.size.height;
        ++v41;
      }
      while (v39 != v41);
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v34, (uint64_t)&v89, (uint64_t)v94, 16, v38);
    }
    while (v39);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v51 = objc_msgSend_deletedStrokeGroups(v24, v46, v47, v48, v49, v50, 0);
  uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v85, (uint64_t)v93, 16, v53);
  if (v54)
  {
    uint64_t v60 = v54;
    uint64_t v61 = *(void *)v86;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v86 != v61) {
          objc_enumerationMutation(v51);
        }
        objc_msgSend_bounds(*(void **)(*((void *)&v85 + 1) + 8 * v62), v55, v56, v57, v58, v59);
        v104.origin.CGFloat x = v63;
        v104.origin.CGFloat y = v64;
        v104.size.CGFloat width = v65;
        v104.size.CGFloat height = v66;
        v98.origin.CGFloat x = x;
        v98.origin.CGFloat y = y;
        v98.size.CGFloat width = width;
        v98.size.CGFloat height = height;
        CGRect v99 = CGRectUnion(v98, v104);
        CGFloat x = v99.origin.x;
        CGFloat y = v99.origin.y;
        CGFloat width = v99.size.width;
        CGFloat height = v99.size.height;
        ++v62;
      }
      while (v60 != v62);
      uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v55, (uint64_t)&v85, (uint64_t)v93, 16, v59);
    }
    while (v60);
  }

  v100.origin.CGFloat x = x;
  v100.origin.CGFloat y = y;
  v100.size.CGFloat width = width;
  v100.size.CGFloat height = height;
  CGRect v101 = CGRectInset(v100, -1.0, -1.0);
  double v67 = v101.origin.x;
  double v68 = v101.origin.y;
  double v69 = v101.size.width;
  double v70 = v101.size.height;

  v102.origin.CGFloat x = v67;
  v102.origin.CGFloat y = v68;
  v102.size.CGFloat width = v69;
  v102.size.CGFloat height = v70;
  if (!CGRectIsEmpty(v102))
  {
    v76 = objc_msgSend_delegate(self, v71, v72, v73, v74, v75);
    objc_msgSend_visualization_needsDisplayInRect_(v76, v77, (uint64_t)self, v78, v79, v80, v67, v68, v69, v70);
LABEL_20:
  }
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)CHStrokeVisualization;
  -[CHVisualization drawVisualizationInRect:context:viewBounds:](&v27, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (self)
  {
    strokeProviderDrawn = self->__strokeProviderDrawn;
    if (strokeProviderDrawn) {
      goto LABEL_5;
    }
  }
  uint64_t v16 = objc_msgSend_recognitionSession(self, v11, (uint64_t)strokeProviderDrawn, v13, v14, v15);
  uint64_t v22 = objc_msgSend_latestStrokeProvider(v16, v17, v18, v19, v20, v21);
  uint64_t v23 = v22;
  if (self)
  {
    objc_storeStrong((id *)&self->__strokeProviderDrawn, v22);

    strokeProviderDrawn = self->__strokeProviderDrawn;
LABEL_5:
    objc_msgSend_drawStrokesFromStrokeProvider_inRect_context_(self, v11, (uint64_t)strokeProviderDrawn, (uint64_t)a4, v14, v15, x, y, width, height);
    return;
  }

  objc_msgSend_drawStrokesFromStrokeProvider_inRect_context_(0, v24, 0, (uint64_t)a4, v25, v26, x, y, width, height);
}

- (void)drawStrokesFromStrokeProvider:(id)a3 inRect:(CGRect)a4 context:(CGContext *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)components = xmmword_1C4C44860;
  long long v41 = unk_1C4C44870;
  v12 = CGColorCreate(DeviceRGB, components);
  CGContextSetStrokeColorWithColor(a5, v12);
  CGColorRelease(v12);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetLineWidth(a5, 1.0);
  *(_OWORD *)lengths = xmmword_1C4C3A740;
  CGContextSetLineDash(a5, 0.0, lengths, 2uLL);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v18 = objc_msgSend_orderedStrokes(v10, v13, v14, v15, v16, v17, 0);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v34, (uint64_t)v38, 16, v20);
  if (v21)
  {
    uint64_t v27 = v21;
    uint64_t v28 = *(void *)v35;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend_bounds(*(void **)(*((void *)&v34 + 1) + 8 * v29), v22, v23, v24, v25, v26);
        CGFloat v30 = v43.origin.x;
        CGFloat v31 = v43.origin.y;
        CGFloat v32 = v43.size.width;
        CGFloat v33 = v43.size.height;
        v45.origin.CGFloat x = x;
        v45.origin.CGFloat y = y;
        v45.size.CGFloat width = width;
        v45.size.CGFloat height = height;
        if (CGRectIntersectsRect(v43, v45))
        {
          v44.origin.CGFloat x = v30;
          v44.origin.CGFloat y = v31;
          v44.size.CGFloat width = v32;
          v44.size.CGFloat height = v33;
          CGContextStrokeRect(a5, v44);
        }
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v34, (uint64_t)v38, 16, v26);
    }
    while (v27);
  }
}

- (void).cxx_destruct
{
}

@end