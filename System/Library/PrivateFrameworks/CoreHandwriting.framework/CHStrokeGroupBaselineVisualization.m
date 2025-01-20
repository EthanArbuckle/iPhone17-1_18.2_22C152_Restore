@interface CHStrokeGroupBaselineVisualization
- (CGRect)dirtyRectForStrokeGroup:(id)a3;
- (int64_t)layeringPriority;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
@end

@implementation CHStrokeGroupBaselineVisualization

- (int64_t)layeringPriority
{
  return 0;
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
  v10 = self;
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  v144.receiver = self;
  v144.super_class = (Class)CHStrokeGroupBaselineVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v144, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12 = CGColorCreate(DeviceRGB, dbl_1C4C3A700);
  space = DeviceRGB;
  v130 = CGColorCreate(DeviceRGB, dbl_1C4C3A720);
  CGContextSetStrokeColorWithColor(a4, v12);
  color = v12;
  CGContextSetFillColorWithColor(a4, v12);
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  v18 = objc_msgSend_resultDrawn(v10, v13, v14, v15, v16, v17);
  v24 = objc_msgSend_strokeGroupingResult(v18, v19, v20, v21, v22, v23);
  v28 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v24, v25, 1, 1, v26, v27);

  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v140, (uint64_t)v147, 16, v30);
  if (v31)
  {
    uint64_t v36 = v31;
    uint64_t v37 = *(void *)v141;
    v133 = v138;
    v135 = v28;
    v136 = v10;
    uint64_t v134 = *(void *)v141;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v141 != v37) {
          objc_enumerationMutation(v28);
        }
        v99 = *(void **)(*((void *)&v140 + 1) + 8 * i);
        objc_msgSend_dirtyRectForStrokeGroup_(v10, v32, (uint64_t)v99, v33, v34, v35, v130, color, space, v133);
        v150.origin.CGFloat x = x;
        v150.origin.CGFloat y = y;
        v150.size.CGFloat width = width;
        v150.size.CGFloat height = height;
        if (CGRectIntersectsRect(v149, v150))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v100 = v99;
            CGContextSaveGState(a4);
            *(_OWORD *)lengths = xmmword_1C4C3A740;
            CGContextSetLineWidth(a4, 2.0);
            CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
            CGContextSetAlpha(a4, 0.8);
            v106 = objc_msgSend_resultDrawn(v10, v101, v102, v103, v104, v105);
            uint64_t v112 = objc_msgSend_uniqueIdentifier(v100, v107, v108, v109, v110, v111);
            v117 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v106, v113, v112, v114, v115, v116);
            v123 = objc_msgSend_recognitionResultsByLocale(v117, v118, v119, v120, v121, v122);
            uint64_t v129 = objc_msgSend_count(v123, v124, v125, v126, v127, v128);

            if (v129)
            {
              v39 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v79, v80, v81, v82, v83);
              v45 = objc_msgSend_resultDrawn(v10, v40, v41, v42, v43, v44);
              uint64_t v51 = objc_msgSend_uniqueIdentifier(v100, v46, v47, v48, v49, v50);
              v56 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v45, v52, v51, v53, v54, v55);
              v62 = objc_msgSend_recognitionResultsByLocale(v56, v57, v58, v59, v60, v61);
              v68 = objc_msgSend_allValues(v62, v63, v64, v65, v66, v67);
              v73 = objc_msgSend_objectAtIndexedSubscript_(v68, v69, 0, v70, v71, v72);

              v137[0] = MEMORY[0x1E4F143A8];
              v137[1] = 3221225472;
              v138[0] = sub_1C49CFF60;
              v138[1] = &unk_1E64E1AD0;
              id v74 = v39;
              id v139 = v74;
              objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v73, v75, (uint64_t)v137, v76, v77, v78);
            }
            else
            {
              id v74 = 0;
            }
            v84 = objc_msgSend_strokeIdentifiers(v100, v79, v80, v81, v82, v83);
            v90 = objc_msgSend_allObjects(v84, v85, v86, v87, v88, v89);
            v145 = v90;
            v94 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v91, (uint64_t)&v145, 1, v92, v93);
            v98 = (const CGPath *)objc_msgSend_newEstimatedBaselineForStrokesWithTokens_tokenStrokeIdentifiers_(v100, v95, (uint64_t)v74, (uint64_t)v94, v96, v97);

            CGContextAddPath(a4, v98);
            CGContextStrokePath(a4);
            CGPathRelease(v98);

            CGContextRestoreGState(a4);
            v28 = v135;
            v10 = v136;
            uint64_t v37 = v134;
          }
        }
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v32, (uint64_t)&v140, (uint64_t)v147, 16, v35);
    }
    while (v36);
  }

  CGColorRelease(color);
  CGColorRelease(v130);
  CGColorSpaceRelease(space);
}

@end