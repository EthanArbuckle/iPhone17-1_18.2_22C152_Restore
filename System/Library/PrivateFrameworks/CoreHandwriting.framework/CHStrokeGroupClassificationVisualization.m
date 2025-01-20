@interface CHStrokeGroupClassificationVisualization
- (CGColor)newColorForStrokeInGroup:(id)a3;
- (int64_t)layeringPriority;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
@end

@implementation CHStrokeGroupClassificationVisualization

- (int64_t)layeringPriority
{
  return 0;
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v195 = *MEMORY[0x1E4F143B8];
  v182.receiver = self;
  v182.super_class = (Class)CHStrokeGroupClassificationVisualization;
  -[CHStrokeGroupingVisualization drawVisualizationInRect:context:viewBounds:](&v182, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  color = CGColorCreate(DeviceRGB, dbl_1C4C43FE8);
  v179 = CGColorCreate(DeviceRGB, dbl_1C4C44008);
  v175 = CGColorCreate(DeviceRGB, dbl_1C4C44028);
  v178 = CGColorCreate(DeviceRGB, dbl_1C4C44048);
  v177 = CGColorCreate(DeviceRGB, dbl_1C4C44068);
  v176 = CGColorCreate(DeviceRGB, dbl_1C4C44088);
  v174 = CGColorCreate(DeviceRGB, dbl_1C4C440A8);
  v12 = CGColorCreate(DeviceRGB, dbl_1C4C440C8);
  v13 = CGColorCreate(DeviceRGB, dbl_1C4C440E8);
  v196.size.CGFloat width = 432.0;
  v196.origin.CGFloat x = 6.0;
  v196.origin.CGFloat y = 8.0;
  v196.size.CGFloat height = 18.0;
  v202.origin.CGFloat x = x;
  v202.origin.CGFloat y = y;
  v202.size.CGFloat width = width;
  v202.size.CGFloat height = height;
  if (CGRectIntersectsRect(v196, v202))
  {
    CGContextSetFillColorWithColor(a4, color);
    v197.size.CGFloat width = 432.0;
    v197.origin.CGFloat x = 6.0;
    v197.origin.CGFloat y = 8.0;
    v197.size.CGFloat height = 18.0;
    CGContextFillRect(a4, v197);
    v198.size.CGFloat width = 432.0;
    v198.origin.CGFloat x = 6.0;
    v198.origin.CGFloat y = 8.0;
    v198.size.CGFloat height = 18.0;
    CGFloat MidY = CGRectGetMidY(v198);
    CGContextTranslateCTM(a4, 0.0, MidY);
    CGContextScaleCTM(a4, 1.0, -1.0);
    v199.size.CGFloat width = 432.0;
    v199.origin.CGFloat x = 6.0;
    v199.origin.CGFloat y = 8.0;
    v199.size.CGFloat height = 18.0;
    CGFloat v15 = CGRectGetMidY(v199);
    CGContextTranslateCTM(a4, 0.0, -v15);
    uint64_t v188 = 0;
    v189 = &v188;
    uint64_t v190 = 0x2020000000;
    v16 = (uint64_t (*)(__CFString *, void, double))off_1EA3C9368;
    v191 = off_1EA3C9368;
    if (!off_1EA3C9368)
    {
      uint64_t v183 = MEMORY[0x1E4F143A8];
      uint64_t v184 = 3221225472;
      v185 = sub_1C4B311A0;
      v186 = &unk_1E64E1EC8;
      v187 = &v188;
      sub_1C4B311A0((uint64_t)&v183);
      v16 = (uint64_t (*)(__CFString *, void, double))v189[3];
    }
    _Block_object_dispose(&v188, 8);
    if (v16)
    {
      v17 = (const void *)v16(@"Helvetica-Bold", 0, 12.0);
      char v181 = 0;
      int v192 = 0;
      uint64_t v193 = 1;
      v194 = &v181;
      uint64_t v188 = 0;
      v189 = &v188;
      uint64_t v190 = 0x2020000000;
      v18 = (uint64_t (*)(int *, uint64_t))off_1EA3C9378;
      v191 = off_1EA3C9378;
      if (!off_1EA3C9378)
      {
        uint64_t v183 = MEMORY[0x1E4F143A8];
        uint64_t v184 = 3221225472;
        v185 = sub_1C4B31354;
        v186 = &unk_1E64E1EC8;
        v187 = &v188;
        sub_1C4B31354((uint64_t)&v183);
        v18 = (uint64_t (*)(int *, uint64_t))v189[3];
      }
      _Block_object_dispose(&v188, 8);
      if (v18)
      {
        v19 = (const void *)v18(&v192, 1);
        id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
        id v25 = (id)objc_msgSend_initWithString_(v20, v21, @"   ", v22, v23, v24);
        id v26 = objc_alloc(MEMORY[0x1E4F28E48]);
        v32 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v27, v28, v29, v30, v31);
        uint64_t v35 = objc_msgSend_localizedStringForKey_value_table_(v32, v33, @"Stroke group classification: ", (uint64_t)&stru_1F20141C8, 0, v34);
        id v36 = sub_1C4B30E18(self, v35, (uint64_t)v179, (uint64_t)v17, (uint64_t)v19);
        id v41 = (id)objc_msgSend_initWithAttributedString_(v26, v37, (uint64_t)v36, v38, v39, v40);
        objc_msgSend_appendAttributedString_(v41, v42, (uint64_t)v25, v43, v44, v45);
        v51 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v46, v47, v48, v49, v50);
        uint64_t v54 = objc_msgSend_localizedStringForKey_value_table_(v51, v52, @"text", (uint64_t)&stru_1F20141C8, 0, v53);
        id v55 = sub_1C4B30E18(self, v54, (uint64_t)v178, (uint64_t)v17, (uint64_t)v19);
        objc_msgSend_appendAttributedString_(v41, v56, (uint64_t)v55, v57, v58, v59);
        objc_msgSend_appendAttributedString_(v41, v60, (uint64_t)v25, v61, v62, v63);
        v69 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v64, v65, v66, v67, v68);
        uint64_t v72 = objc_msgSend_localizedStringForKey_value_table_(v69, v70, @"math", (uint64_t)&stru_1F20141C8, 0, v71);
        id v73 = sub_1C4B30E18(self, v72, (uint64_t)v177, (uint64_t)v17, (uint64_t)v19);
        objc_msgSend_appendAttributedString_(v41, v74, (uint64_t)v73, v75, v76, v77);
        objc_msgSend_appendAttributedString_(v41, v78, (uint64_t)v25, v79, v80, v81);
        v87 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v82, v83, v84, v85, v86);
        uint64_t v90 = objc_msgSend_localizedStringForKey_value_table_(v87, v88, @"clutter", (uint64_t)&stru_1F20141C8, 0, v89);
        id v91 = sub_1C4B30E18(self, v90, (uint64_t)v13, (uint64_t)v17, (uint64_t)v19);
        objc_msgSend_appendAttributedString_(v41, v92, (uint64_t)v91, v93, v94, v95);
        objc_msgSend_appendAttributedString_(v41, v96, (uint64_t)v25, v97, v98, v99);
        v105 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v100, v101, v102, v103, v104);
        uint64_t v108 = objc_msgSend_localizedStringForKey_value_table_(v105, v106, @"doodle", (uint64_t)&stru_1F20141C8, 0, v107);
        id v109 = sub_1C4B30E18(self, v108, (uint64_t)v176, (uint64_t)v17, (uint64_t)v19);
        objc_msgSend_appendAttributedString_(v41, v110, (uint64_t)v109, v111, v112, v113);
        objc_msgSend_appendAttributedString_(v41, v114, (uint64_t)v25, v115, v116, v117);
        v123 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v118, v119, v120, v121, v122);
        uint64_t v126 = objc_msgSend_localizedStringForKey_value_table_(v123, v124, @"line", (uint64_t)&stru_1F20141C8, 0, v125);
        id v127 = sub_1C4B30E18(self, v126, (uint64_t)v174, (uint64_t)v17, (uint64_t)v19);
        objc_msgSend_appendAttributedString_(v41, v128, (uint64_t)v127, v129, v130, v131);
        objc_msgSend_appendAttributedString_(v41, v132, (uint64_t)v25, v133, v134, v135);
        v141 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v136, v137, v138, v139, v140);
        uint64_t v144 = objc_msgSend_localizedStringForKey_value_table_(v141, v142, @"container", (uint64_t)&stru_1F20141C8, 0, v143);
        id v145 = sub_1C4B30E18(self, v144, (uint64_t)v12, (uint64_t)v17, (uint64_t)v19);
        objc_msgSend_appendAttributedString_(v41, v146, (uint64_t)v145, v147, v148, v149);
        objc_msgSend_appendAttributedString_(v41, v150, (uint64_t)v25, v151, v152, v153);
        v159 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v154, v155, v156, v157, v158);
        uint64_t v162 = objc_msgSend_localizedStringForKey_value_table_(v159, v160, @"unknown", (uint64_t)&stru_1F20141C8, 0, v161);
        id v163 = sub_1C4B30E18(self, v162, (uint64_t)v175, (uint64_t)v17, (uint64_t)v19);
        objc_msgSend_appendAttributedString_(v41, v164, (uint64_t)v163, v165, v166, v167);
        v200.size.CGFloat width = 432.0;
        v200.origin.CGFloat x = 6.0;
        v200.origin.CGFloat y = 8.0;
        v200.size.CGFloat height = 18.0;
        CGRect v201 = CGRectInset(v200, 4.0, 1.0);
        v168 = CGPathCreateWithRect(v201, 0);
        uint64_t v188 = 0;
        v189 = &v188;
        uint64_t v190 = 0x2020000000;
        v169 = (uint64_t (*)(id))off_1EA3C9380;
        v191 = off_1EA3C9380;
        if (!off_1EA3C9380)
        {
          uint64_t v183 = MEMORY[0x1E4F143A8];
          uint64_t v184 = 3221225472;
          v185 = sub_1C4B31494;
          v186 = &unk_1E64E1EC8;
          v187 = &v188;
          sub_1C4B31494((uint64_t)&v183);
          v169 = (uint64_t (*)(id))v189[3];
        }
        _Block_object_dispose(&v188, 8);
        if (v169)
        {
          v170 = (const void *)v169(v41);
          uint64_t v188 = 0;
          v189 = &v188;
          uint64_t v190 = 0x2020000000;
          v171 = off_1EA3C9388;
          v191 = off_1EA3C9388;
          if (!off_1EA3C9388)
          {
            uint64_t v183 = MEMORY[0x1E4F143A8];
            uint64_t v184 = 3221225472;
            v185 = sub_1C4B315D4;
            v186 = &unk_1E64E1EC8;
            v187 = &v188;
            sub_1C4B315D4((uint64_t)&v183);
            v171 = (void *)v189[3];
          }
          _Block_object_dispose(&v188, 8);
          if (v171)
          {
            v172 = (const void *)((uint64_t (*)(const void *, void, void, const CGPath *, void))v171)(v170, 0, 0, v168, 0);
            uint64_t v188 = 0;
            v189 = &v188;
            uint64_t v190 = 0x2020000000;
            v173 = (void (*)(const void *, CGContext *))off_1EA3C9390;
            v191 = off_1EA3C9390;
            if (!off_1EA3C9390)
            {
              uint64_t v183 = MEMORY[0x1E4F143A8];
              uint64_t v184 = 3221225472;
              v185 = sub_1C4B31714;
              v186 = &unk_1E64E1EC8;
              v187 = &v188;
              sub_1C4B31714((uint64_t)&v183);
              v173 = (void (*)(const void *, CGContext *))v189[3];
            }
            _Block_object_dispose(&v188, 8);
            if (v173)
            {
              v173(v172, a4);
              CFRelease(v172);
              CFRelease(v170);
              CFRelease(v19);
              CFRelease(v17);
              CGPathRelease(v168);
              goto LABEL_18;
            }
          }
        }
      }
      dlerror();
      abort_report_np();
    }
    else
    {
      dlerror();
      abort_report_np();
    }
    __break(1u);
  }
LABEL_18:
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(color);
  CGColorRelease(v179);
  CGColorRelease(v175);
  CGColorRelease(v178);
  CGColorRelease(v177);
  CGColorRelease(v176);
  CGColorRelease(v174);
  CGColorRelease(v12);
  CGColorRelease(v13);
}

- (CGColor)newColorForStrokeInGroup:(id)a3
{
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  unint64_t v10 = objc_msgSend_classification(a3, v5, v6, v7, v8, v9);
  if (v10 > 8)
  {
    CGColorSpaceRelease(DeviceRGB);
    return 0;
  }
  else
  {
    v11 = CGColorCreate(DeviceRGB, (const CGFloat *)off_1E64E3F58[v10]);
    CGColorSpaceRelease(DeviceRGB);
    return v11;
  }
}

@end