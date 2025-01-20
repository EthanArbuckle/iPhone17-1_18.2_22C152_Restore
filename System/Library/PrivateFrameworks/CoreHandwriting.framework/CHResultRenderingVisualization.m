@interface CHResultRenderingVisualization
- (BOOL)shouldRenderStrokeGroupResult:(id)a3;
- (CGRect)dirtyRectForStrokeGroup:(id)a3;
- (CHResultRenderingVisualization)initWithRecognitionSession:(id)a3;
- (NSArray)renderedResults;
- (int64_t)layeringPriority;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
@end

@implementation CHResultRenderingVisualization

- (CHResultRenderingVisualization)initWithRecognitionSession:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CHResultRenderingVisualization;
  v8 = [(CHVisualization *)&v12 initWithRecognitionSession:a3];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v3, v4, v5, v6, v7);
    renderedResults = v8->_renderedResults;
    v8->_renderedResults = (NSMutableArray *)v9;
  }
  return v8;
}

- (NSArray)renderedResults
{
  return (NSArray *)self->_renderedResults;
}

- (int64_t)layeringPriority
{
  return 2;
}

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CHResultRenderingVisualization;
  [(CHStrokeGroupBasedVisualization *)&v9 dirtyRectForStrokeGroup:a3];
  double v6 = v5 + 60.0;
  double v8 = v7 + -60.0;
  result.size.height = v6;
  result.size.width = v4;
  result.origin.y = v8;
  result.origin.x = v3;
  return result;
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  v139.receiver = self;
  v139.super_class = (Class)CHResultRenderingVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v139, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v132 = objc_msgSend_resultDrawn(self, v6, v7, v8, v9, v10);
  v16 = objc_msgSend_strokeGroupingResult(v132, v11, v12, v13, v14, v15);
  objc_msgSend_removeAllObjects(self->_renderedResults, v17, v18, v19, v20, v21);
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  v128 = v16;
  objc_msgSend_strokeGroups(v16, v22, v23, v24, v25, v26);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v135, (uint64_t)v141, 16, v28);
  if (v29)
  {
    uint64_t v34 = v29;
    uint64_t v35 = *(void *)v136;
    uint64_t v129 = *(void *)v136;
    do
    {
      uint64_t v36 = 0;
      uint64_t v131 = v34;
      do
      {
        if (*(void *)v136 == v35)
        {
          v37 = *(void **)(*((void *)&v135 + 1) + 8 * v36);
          if (!objc_msgSend_shouldRenderStrokeGroupResult_(self, v30, (uint64_t)v37, v31, v32, v33)) {
            goto LABEL_6;
          }
        }
        else
        {
          objc_enumerationMutation(obj);
          v37 = *(void **)(*((void *)&v135 + 1) + 8 * v36);
          if (!objc_msgSend_shouldRenderStrokeGroupResult_(self, v39, (uint64_t)v37, v40, v41, v42)) {
            goto LABEL_6;
          }
        }
        uint64_t v43 = objc_msgSend_uniqueIdentifier(v37, v30, v38, v31, v32, v33);
        v48 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v132, v44, v43, v45, v46, v47);
        v54 = objc_msgSend_mathResult(v48, v49, v50, v51, v52, v53);

        if (v54)
        {
          objc_msgSend_bounds(v37, v55, v56, v57, v58, v59);
          CGFloat v61 = v60;
          objc_msgSend_bounds(v37, v62, v63, v64, v65, v66);
          CGFloat v68 = v67 + -60.0;
          objc_msgSend_bounds(v37, v69, v70, v71, v72, v73);
          v143.size.CGFloat height = 60.0;
          v143.origin.CGFloat x = v61;
          v143.origin.CGFloat y = v68;
          CGRect v144 = CGRectInset(v143, 1.0, 1.0);
          CGFloat x = v144.origin.x;
          CGFloat y = v144.origin.y;
          CGFloat width = v144.size.width;
          CGFloat height = v144.size.height;
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          v79 = CGColorCreate(DeviceRGB, dbl_1C4C3B070);
          CGContextSetStrokeColorWithColor(a4, v79);
          CGContextSetLineWidth(a4, 1.0);
          v145.origin.CGFloat x = x;
          v145.origin.CGFloat y = y;
          v145.size.CGFloat width = width;
          v145.size.CGFloat height = height;
          CGContextStrokeRect(a4, v145);
          CGColorRelease(v79);
          CGColorSpaceRelease(DeviceRGB);
          v146.origin.CGFloat x = x;
          v146.origin.CGFloat y = y;
          v146.size.CGFloat width = width;
          v146.size.CGFloat height = height;
          CGRect v147 = CGRectInset(v146, 1.0, 1.0);
          double v80 = v147.origin.x;
          double v81 = v147.origin.y;
          double v82 = v147.size.width;
          double v83 = v147.size.height;
          renderedResults = self->_renderedResults;
          v89 = objc_msgSend_mathResult(v48, v84, v85, v86, v87, v88);
          v95 = objc_msgSend_preferredTranscription(v89, v90, v91, v92, v93, v94);
          v140[0] = v95;
          v101 = objc_msgSend_numberWithDouble_(NSNumber, v96, v97, v98, v99, v100, v80);
          v140[1] = v101;
          v107 = objc_msgSend_numberWithDouble_(NSNumber, v102, v103, v104, v105, v106, v81);
          v140[2] = v107;
          v113 = objc_msgSend_numberWithDouble_(NSNumber, v108, v109, v110, v111, v112, v82);
          v140[3] = v113;
          v119 = objc_msgSend_numberWithDouble_(NSNumber, v114, v115, v116, v117, v118, v83);
          v140[4] = v119;
          v123 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v120, (uint64_t)v140, 5, v121, v122);
          objc_msgSend_addObject_(renderedResults, v124, (uint64_t)v123, v125, v126, v127);

          uint64_t v35 = v129;
          uint64_t v34 = v131;
        }
LABEL_6:
        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v135, (uint64_t)v141, 16, v33);
    }
    while (v34);
  }
}

- (BOOL)shouldRenderStrokeGroupResult:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_class();
  uint64_t v11 = objc_msgSend_classification(v4, v6, v7, v8, v9, v10);
  if (objc_msgSend_isStrokeClassificationTextOrMath_(v5, v12, v11, v13, v14, v15))
  {
    uint64_t v21 = objc_msgSend_activeStrokeGroupAncestorIdentifiers(self, v16, v17, v18, v19, v20);
    v22 = NSNumber;
    uint64_t v28 = objc_msgSend_ancestorIdentifier(v4, v23, v24, v25, v26, v27);
    uint64_t v33 = objc_msgSend_numberWithInteger_(v22, v29, v28, v30, v31, v32);
    LOBYTE(v22) = objc_msgSend_containsObject_(v21, v34, (uint64_t)v33, v35, v36, v37);

    return (char)v22;
  }
  else
  {

    return 0;
  }
}

- (void).cxx_destruct
{
}

@end