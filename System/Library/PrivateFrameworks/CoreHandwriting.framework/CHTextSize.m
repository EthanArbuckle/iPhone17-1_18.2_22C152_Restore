@interface CHTextSize
+ (id)averageTextSize:(id)a3;
+ (id)scaledSize:(id)a3 scale:(double)a4;
+ (id)textSizeFromPrincipalLines:(id *)a3 string:(id)a4;
- (CHTextSize)init;
- (CHTextSize)initWithXHeight:(double)a3 ascenderHeight:(double)a4 descenderHeight:(double)a5 activeLines:(unint64_t)a6;
- (double)ascenderHeight;
- (double)descenderHeight;
- (double)scaleToMatchSize:(id)a3;
- (double)xHeight;
- (unint64_t)activeLines;
@end

@implementation CHTextSize

- (CHTextSize)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHTextSize;
  result = [(CHTextSize *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_descenderHeight = 0u;
    *(_OWORD *)&result->_xHeight = 0u;
  }
  return result;
}

- (CHTextSize)initWithXHeight:(double)a3 ascenderHeight:(double)a4 descenderHeight:(double)a5 activeLines:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)CHTextSize;
  result = [(CHTextSize *)&v11 init];
  if (result)
  {
    result->_xHeight = a3;
    result->_ascenderHeight = a4;
    result->_descenderHeight = a5;
    result->_activeLines = a6;
  }
  return result;
}

- (double)scaleToMatchSize:(id)a3
{
  id v4 = a3;
  v10 = v4;
  if (self->_xHeight == 0.0)
  {
    double v12 = 1.0;
    if ((self->_activeLines & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend_xHeight(v4, v5, v6, v7, v8, v9);
    double v12 = v11 / self->_xHeight;
    if ((self->_activeLines & 1) == 0)
    {
LABEL_3:

      return v12;
    }
  }
  if ((objc_msgSend_activeLines(v10, v5, v6, v7, v8, v9) & 1) == 0) {
    goto LABEL_3;
  }
  objc_msgSend_xHeight(v10, v14, v15, v16, v17, v18);
  double v20 = v19;
  objc_msgSend_ascenderHeight(v10, v21, v22, v23, v24, v25);
  double v27 = sqrt(v20 * v26 / (self->_xHeight * self->_ascenderHeight));

  return v27;
}

+ (id)scaledSize:(id)a3 scale:(double)a4
{
  id v5 = a3;
  uint64_t v6 = [CHTextSize alloc];
  objc_msgSend_xHeight(v5, v7, v8, v9, v10, v11);
  double v13 = v12;
  objc_msgSend_ascenderHeight(v5, v14, v15, v16, v17, v18);
  double v20 = v19;
  objc_msgSend_descenderHeight(v5, v21, v22, v23, v24, v25);
  double v27 = v26;
  uint64_t active = objc_msgSend_activeLines(v5, v28, v29, v30, v31, v32);
  v38 = objc_msgSend_initWithXHeight_ascenderHeight_descenderHeight_activeLines_(v6, v34, active, v35, v36, v37, v13 * a4, v20 * a4, v27 * a4);

  return v38;
}

+ (id)textSizeFromPrincipalLines:(id *)a3 string:(id)a4
{
  id v5 = a4;
  double x = a3->var1.var1.x;
  double y = a3->var1.var1.y;
  double v9 = a3->var1.var0.x;
  double v8 = a3->var1.var0.y;
  double v45 = a3->var3.var0.x;
  double v46 = a3->var3.var0.y;
  double v11 = a3->var2.var0.x;
  double v10 = a3->var2.var0.y;
  double v12 = a3->var0.var0.x;
  double v13 = a3->var0.var0.y;
  id v14 = v5;
  int hasAscender = objc_msgSend_hasAscender(v14, v15, v16, v17, v18, v19);
  int hasDescender = objc_msgSend_hasDescender(v14, v21, v22, v23, v24, v25);

  double v27 = [CHTextSize alloc];
  double v32 = (y - v8) / (x - v9 + 1.0e-10);
  double v33 = v46 - v45 * v32;
  double v34 = v10 - v11 * v32;
  double v35 = v8 - v9 * v32;
  double v36 = v13 - v12 * v32;
  double v37 = sqrt(v32 * v32 + 1.0);
  double v38 = vabdd_f64(v34, v35) / v37;
  double v39 = vabdd_f64(v33, v35) / v37;
  double v40 = vabdd_f64(v34, v36) / v37;
  uint64_t v41 = 6;
  if (hasAscender) {
    uint64_t v41 = 7;
  }
  if (hasDescender) {
    uint64_t active = objc_msgSend_initWithXHeight_ascenderHeight_descenderHeight_activeLines_(v27, v28, v41 | 8, v29, v30, v31, v38, v39, v40, *(void *)&v45, *(void *)&v46);
  }
  else {
    uint64_t active = objc_msgSend_initWithXHeight_ascenderHeight_descenderHeight_activeLines_(v27, v28, v41, v29, v30, v31, v38, v39, v40, *(void *)&v45, *(void *)&v46);
  }
  v43 = (void *)active;

  return v43;
}

+ (id)averageTextSize:(id)a3
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v153 = v3;
  uint64_t v10 = objc_msgSend_count(v3, v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_arrayWithCapacity_(v4, v11, v10, v12, v13, v14);
  uint64_t v16 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v22 = objc_msgSend_count(v153, v17, v18, v19, v20, v21);
  v154 = objc_msgSend_arrayWithCapacity_(v16, v23, v22, v24, v25, v26);
  double v27 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v33 = objc_msgSend_count(v153, v28, v29, v30, v31, v32);
  double v38 = objc_msgSend_arrayWithCapacity_(v27, v34, v33, v35, v36, v37);
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v39 = v153;
  uint64_t v42 = 0;
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v155, (uint64_t)v159, 16, v41);
  if (v48)
  {
    uint64_t v49 = *(void *)v156;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v156 != v49) {
          objc_enumerationMutation(v39);
        }
        v51 = *(void **)(*((void *)&v155 + 1) + 8 * i);
        v52 = NSNumber;
        objc_msgSend_xHeight(v51, v43, v44, v45, v46, v47);
        v58 = objc_msgSend_numberWithDouble_(v52, v53, v54, v55, v56, v57);
        objc_msgSend_addObject_(v15, v59, (uint64_t)v58, v60, v61, v62);

        if (objc_msgSend_activeLines(v51, v63, v64, v65, v66, v67))
        {
          v73 = NSNumber;
          objc_msgSend_ascenderHeight(v51, v68, v69, v70, v71, v72);
          v79 = objc_msgSend_numberWithDouble_(v73, v74, v75, v76, v77, v78);
          objc_msgSend_addObject_(v154, v80, (uint64_t)v79, v81, v82, v83);
        }
        if ((objc_msgSend_activeLines(v51, v68, v69, v70, v71, v72) & 8) != 0)
        {
          v89 = NSNumber;
          objc_msgSend_descenderHeight(v51, v84, v85, v86, v87, v88);
          v95 = objc_msgSend_numberWithDouble_(v89, v90, v91, v92, v93, v94);
          objc_msgSend_addObject_(v38, v96, (uint64_t)v95, v97, v98, v99);
        }
        v42 |= objc_msgSend_activeLines(v51, v84, v85, v86, v87, v88);
      }
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v43, (uint64_t)&v155, (uint64_t)v159, 16, v47);
    }
    while (v48);
  }

  if (objc_msgSend_count(v15, v100, v101, v102, v103, v104))
  {
    v110 = objc_msgSend_valueForKeyPath_(v15, v105, @"@avg.floatValue", v107, v108, v109);
    objc_msgSend_floatValue(v110, v111, v112, v113, v114, v115);
    float v117 = v116;

    double v118 = v117;
  }
  else
  {
    double v118 = 0.0;
  }
  if (objc_msgSend_count(v154, v105, v106, v107, v108, v109))
  {
    v124 = objc_msgSend_valueForKeyPath_(v154, v119, @"@avg.floatValue", v121, v122, v123);
    objc_msgSend_floatValue(v124, v125, v126, v127, v128, v129);
    float v131 = v130;

    double v132 = v131;
  }
  else
  {
    double v132 = 0.0;
  }
  if (objc_msgSend_count(v38, v119, v120, v121, v122, v123))
  {
    v137 = objc_msgSend_valueForKeyPath_(v38, v133, @"@avg.floatValue", v134, v135, v136);
    objc_msgSend_floatValue(v137, v138, v139, v140, v141, v142);
    float v144 = v143;

    double v145 = v144;
  }
  else
  {
    double v145 = 0.0;
  }
  v146 = [CHTextSize alloc];
  uint64_t active = objc_msgSend_initWithXHeight_ascenderHeight_descenderHeight_activeLines_(v146, v147, v42, v148, v149, v150, v118, v132, v145);

  return active;
}

- (double)xHeight
{
  return self->_xHeight;
}

- (double)ascenderHeight
{
  return self->_ascenderHeight;
}

- (double)descenderHeight
{
  return self->_descenderHeight;
}

- (unint64_t)activeLines
{
  return self->_activeLines;
}

@end