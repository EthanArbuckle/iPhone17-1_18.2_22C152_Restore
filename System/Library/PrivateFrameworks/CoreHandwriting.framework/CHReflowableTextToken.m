@interface CHReflowableTextToken
- ($9936F71585EAE7D8081FB1B234834B3F)principalLines;
- (BOOL)hasPrecedingSpace;
- (BOOL)hasValidPrincipalLines;
- (CGRect)bounds;
- (CHReflowableTextToken)initWithString:(id)a3 principalLines:(id *)a4 textSize:(id)a5 bounds:(CGRect)a6 hasPrecedingSpace:(BOOL)a7;
- (CHReflowableTextToken)initWithTokenizedTextResultToken:(id)a3;
- (CHTextSize)textSize;
- (NSString)string;
- (double)principalOrientation;
- (id)asFullTextResultWithStrokeIdentifiers:(id)a3 strokeProvider:(id)a4;
- (void)setBounds:(CGRect)a3;
@end

@implementation CHReflowableTextToken

- (CHReflowableTextToken)initWithString:(id)a3 principalLines:(id *)a4 textSize:(id)a5 bounds:(CGRect)a6 hasPrecedingSpace:(BOOL)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v15 = a3;
  id v16 = a5;
  v32.receiver = self;
  v32.super_class = (Class)CHReflowableTextToken;
  v22 = [(CHReflowableTextToken *)&v32 init];
  if (v22)
  {
    uint64_t v23 = objc_msgSend_copy(v15, v17, v18, v19, v20, v21);
    string = v22->_string;
    v22->_string = (NSString *)v23;

    CGPoint var0 = a4->var0.var0;
    CGPoint var1 = a4->var0.var1;
    CGPoint v27 = a4->var1.var1;
    v22->_principalLines.base.start = a4->var1.var0;
    v22->_principalLines.base.end = v27;
    v22->_principalLines.descender.start = var0;
    v22->_principalLines.descender.end = var1;
    CGPoint v28 = a4->var2.var0;
    CGPoint v29 = a4->var2.var1;
    CGPoint v30 = a4->var3.var1;
    v22->_principalLines.top.start = a4->var3.var0;
    v22->_principalLines.top.end = v30;
    v22->_principalLines.median.start = v28;
    v22->_principalLines.median.end = v29;
    objc_storeStrong((id *)&v22->_textSize, a5);
    v22->_bounds.origin.CGFloat x = x;
    v22->_bounds.origin.CGFloat y = y;
    v22->_bounds.size.CGFloat width = width;
    v22->_bounds.size.CGFloat height = height;
    v22->_hasPrecedingSpace = a7;
  }

  return v22;
}

- (CHReflowableTextToken)initWithTokenizedTextResultToken:(id)a3
{
  id v4 = a3;
  v111.receiver = self;
  v111.super_class = (Class)CHReflowableTextToken;
  v10 = [(CHReflowableTextToken *)&v111 init];
  if (v10)
  {
    v11 = objc_msgSend_string(v4, v5, v6, v7, v8, v9);
    uint64_t v17 = objc_msgSend_copy(v11, v12, v13, v14, v15, v16);
    string = v10->_string;
    v10->_string = (NSString *)v17;

    if (v4)
    {
      objc_msgSend_principalLines(v4, v19, v20, v21, v22, v23);
    }
    else
    {
      CGPoint v109 = (CGPoint)0;
      CGPoint v110 = (CGPoint)0;
      CGPoint v107 = (CGPoint)0;
      CGPoint v108 = (CGPoint)0;
      CGPoint v105 = (CGPoint)0;
      CGPoint v106 = (CGPoint)0;
      CGPoint v103 = (CGPoint)0;
      CGPoint v104 = (CGPoint)0;
    }
    CGPoint v24 = v108;
    v10->_principalLines.median.start = v107;
    v10->_principalLines.median.end = v24;
    CGPoint v25 = v110;
    v10->_principalLines.top.start = v109;
    v10->_principalLines.top.end = v25;
    CGPoint v26 = v104;
    v10->_principalLines.descender.start = v103;
    v10->_principalLines.descender.end = v26;
    CGPoint v27 = v106;
    v10->_principalLines.base.start = v105;
    v10->_principalLines.base.end = v27;
    objc_msgSend_originalBounds(v4, v19, v20, v21, v22, v23);
    v10->_bounds.origin.CGFloat x = v28;
    v10->_bounds.origin.CGFloat y = v29;
    v10->_bounds.size.CGFloat width = v30;
    v10->_bounds.size.CGFloat height = v31;
    v10->_hasPrecedingSpace = (objc_msgSend_properties(v4, v32, v33, v34, v35, v36) & 0x20) != 0;
    v42 = objc_opt_class();
    if (v4)
    {
      objc_msgSend_principalLines(v4, v37, v38, v39, v40, v41);
    }
    else
    {
      long long v96 = 0u;
      long long v99 = 0u;
      long long v90 = 0u;
      long long v93 = 0u;
      long long v84 = 0u;
      long long v87 = 0u;
      long long v78 = 0u;
      long long v81 = 0u;
    }
    objc_msgSend_originalBounds(v4, v37, v38, v39, v40, v41, v78, v81, v84, v87, v90, v93, v96, v99);
    if (v50 == 0.0) {
      double v50 = 1.0;
    }
    if (v51 == 0.0) {
      double v51 = 1.0;
    }
    v102[0] = v48 + v79 * v50;
    v102[1] = v49 + v80 * v51;
    v102[2] = v48 + v82 * v50;
    v102[3] = v49 + v83 * v51;
    v102[4] = v48 + v85 * v50;
    v102[5] = v49 + v86 * v51;
    v102[6] = v48 + v88 * v50;
    v102[7] = v49 + v89 * v51;
    v102[8] = v48 + v91 * v50;
    v102[9] = v49 + v92 * v51;
    v102[10] = v48 + v94 * v50;
    v102[11] = v49 + v95 * v51;
    v102[12] = v48 + v97 * v50;
    v102[13] = v49 + v98 * v51;
    v102[14] = v48 + v100 * v50;
    v102[15] = v49 + v101 * v51;
    v52 = objc_msgSend_string(v4, v43, v44, v45, v46, v47);
    v56 = objc_msgSend_textSizeFromPrincipalLines_string_(v42, v53, (uint64_t)v102, (uint64_t)v52, v54, v55);

    objc_msgSend_originalBounds(v4, v57, v58, v59, v60, v61);
    if (v67 == 0.0)
    {
      double v69 = 1.0;
    }
    else
    {
      objc_msgSend_originalBounds(v4, v62, v63, v64, v65, v66);
      double v69 = 1.0 / v68;
    }
    v70 = objc_opt_class();
    uint64_t v75 = objc_msgSend_scaledSize_scale_(v70, v71, (uint64_t)v56, v72, v73, v74, v69);
    textSize = v10->_textSize;
    v10->_textSize = (CHTextSize *)v75;
  }
  return v10;
}

- (id)asFullTextResultWithStrokeIdentifiers:(id)a3 strokeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  uint64_t v14 = objc_msgSend_string(self, v9, v10, v11, v12, v13);
  uint64_t v15 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v21 = objc_msgSend_count(v6, v16, v17, v18, v19, v20);
  CGPoint v25 = objc_msgSend_indexSetWithIndexesInRange_(v15, v22, 0, v21, v23, v24);
  objc_msgSend_bounds(self, v26, v27, v28, v29, v30);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  objc_msgSend_bounds(self, v39, v40, v41, v42, v43);
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  objc_msgSend_principalLines(self, v52, v53, v54, v55, v56);
  uint64_t v58 = objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_originalBounds_principalLines_(v8, v57, (uint64_t)v14, (uint64_t)v25, (uint64_t)&stru_1F20141C8, 0, v69, v32, v34, v36, v38, 1.0, v45, v47, v49, v51);

  uint64_t v59 = objc_opt_class();
  uint64_t v63 = objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(v59, v60, (uint64_t)v6, (uint64_t)v7, v61, v62);
  objc_msgSend_setInputStrokeIdentifiers_(v58, v64, (uint64_t)v63, v65, v66, v67);

  return v58;
}

- (BOOL)hasValidPrincipalLines
{
  double v2 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (self->_principalLines.base.start.x != *MEMORY[0x1E4F1DAD8] || self->_principalLines.base.start.y != v2) {
    return 1;
  }
  if (self->_principalLines.base.end.y == v2) {
    return self->_principalLines.base.end.x != *MEMORY[0x1E4F1DAD8];
  }
  return 1;
}

- (double)principalOrientation
{
  if (!objc_msgSend_hasValidPrincipalLines(self, a2, v2, v3, v4, v5) || CGRectIsNull(self->_bounds)) {
    return 1.79769313e308;
  }
  CGFloat v8 = (self->_principalLines.base.end.y - self->_principalLines.base.start.y) * self->_bounds.size.height;
  CGFloat v9 = (self->_principalLines.base.end.x - self->_principalLines.base.start.x) * self->_bounds.size.width;
  return atan2(v8, v9);
}

- (NSString)string
{
  return self->_string;
}

- ($9936F71585EAE7D8081FB1B234834B3F)principalLines
{
  CGPoint var1 = self[1].var0.var1;
  retstr->var2.CGPoint var0 = self[1].var0.var0;
  retstr->var2.CGPoint var1 = var1;
  CGPoint v4 = self[1].var1.var1;
  retstr->var3.CGPoint var0 = self[1].var1.var0;
  retstr->var3.CGPoint var1 = v4;
  CGPoint v5 = self->var2.var1;
  retstr->var0.CGPoint var0 = self->var2.var0;
  retstr->var0.CGPoint var1 = v5;
  CGPoint v6 = self->var3.var1;
  retstr->var1.CGPoint var0 = self->var3.var0;
  retstr->var1.CGPoint var1 = v6;
  return self;
}

- (CHTextSize)textSize
{
  return self->_textSize;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (BOOL)hasPrecedingSpace
{
  return self->_hasPrecedingSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSize, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end