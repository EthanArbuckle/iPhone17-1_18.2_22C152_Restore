@interface CHPrincipalLinesVisualization
- (CGRect)dirtyRectForStrokeGroup:(id)a3;
- (int64_t)layeringPriority;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
@end

@implementation CHPrincipalLinesVisualization

- (int64_t)layeringPriority
{
  return 2;
}

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  objc_msgSend_bounds(a3, a2, (uint64_t)a3, v3, v4, v5);
  CGRect result = CGRectInset(v8, -22.0, -22.0);
  double v6 = result.size.height + 13.0;
  double v7 = result.size.width + 7.0;
  result.size.height = v6;
  result.size.width = v7;
  return result;
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v73.receiver = self;
  v73.super_class = (Class)CHPrincipalLinesVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v73, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v17 = objc_msgSend_resultDrawn(self, v12, v13, v14, v15, v16);
  v23 = objc_msgSend_autoRefineResults(v17, v18, v19, v20, v21, v22);
  v29 = objc_msgSend_firstObject(v23, v24, v25, v26, v27, v28);

  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = sub_1C4AAFB98;
  v72[3] = &unk_1E64E3610;
  v72[4] = DeviceRGB;
  v72[5] = a4;
  v35 = (void *)MEMORY[0x1C8786E90](v72);
  if (v29)
  {
    v36 = objc_msgSend_strokeGroup(v29, v30, v31, v32, v33, v34);
    objc_msgSend_dirtyRectForStrokeGroup_(self, v37, (uint64_t)v36, v38, v39, v40);
    v77.origin.CGFloat x = x;
    v77.origin.CGFloat y = y;
    v77.size.CGFloat width = width;
    v77.size.CGFloat height = height;
    if (CGRectIntersectsRect(v76, v77))
    {
      CGContextSaveGState(a4);
      *(_OWORD *)lengths = xmmword_1C4C3A740;
      CGContextSetLineWidth(a4, 2.0);
      CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
      CGContextSetAlpha(a4, 0.8);
      v46 = objc_msgSend_textResult(v29, v41, v42, v43, v44, v45);
      uint64_t v47 = *MEMORY[0x1E4F1DAD8];
      uint64_t v48 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = sub_1C4AAFCE0;
      v53[3] = &unk_1E64E3638;
      id v54 = v29;
      uint64_t v56 = v47;
      uint64_t v57 = v48;
      uint64_t v58 = v47;
      uint64_t v59 = v48;
      uint64_t v60 = v47;
      uint64_t v61 = v48;
      uint64_t v62 = v47;
      uint64_t v63 = v48;
      uint64_t v64 = v47;
      uint64_t v65 = v48;
      uint64_t v66 = v47;
      uint64_t v67 = v48;
      uint64_t v68 = v47;
      uint64_t v69 = v48;
      uint64_t v70 = v47;
      uint64_t v71 = v48;
      id v55 = v35;
      objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v46, v49, (uint64_t)v53, v50, v51, v52);

      CGContextRestoreGState(a4);
    }
  }
  CGColorSpaceRelease(DeviceRGB);
}

@end