@interface CHTokenizedTextResultToken
+ (BOOL)supportsSecureCoding;
+ (id)tokenWithString:(double)a3 strokeIndexes:(double)a4 wordID:(double)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(uint64_t)a10 recognizerSourceLocale:(void *)a11 inputSources:(void *)a12 substrokeCount:(uint64_t)a13 bounds:(uint64_t)a14 originalBounds:(void *)a15 principalLines:(uint64_t)a16;
+ (unint64_t)makeOriginalToken:(unint64_t)a3;
- ($9936F71585EAE7D8081FB1B234834B3F)principalLines;
- (BOOL)hasValidPrincipalLines;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToToken:(id)a3;
- (BOOL)isOriginal;
- (BOOL)isTopOriginal;
- (BOOL)isTransliterated;
- (CGRect)originalBounds;
- (CHTokenizedTextResultToken)init;
- (CHTokenizedTextResultToken)initWithCoder:(id)a3;
- (CHTokenizedTextResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5;
- (CHTokenizedTextResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 wordID:(unsigned int)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(unint64_t)a10 recognizerSourceLocale:(id)a11 inputSources:(unint64_t)a12 substrokeCount:(int64_t)a13 bounds:(CGRect)a14;
- (NSLocale)recognizerSourceLocale;
- initWithString:(double)a3 strokeIndexes:(double)a4 wordID:(double)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(uint64_t)a10 recognizerSourceLocale:(void *)a11 inputSources:(void *)a12 substrokeCount:(int)a13 bounds:(uint64_t)a14 originalBounds:(void *)a15 principalLines:(uint64_t)a16;
- (double)alignmentScore;
- (double)combinedScore;
- (double)heuristicTextScore;
- (double)modelScore;
- (double)principalOrientation;
- (double)recognitionScore;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)substrokeCount;
- (unint64_t)hash;
- (unint64_t)inputSourceModifiersCount;
- (unint64_t)inputSources;
- (unint64_t)properties;
- (unsigned)wordID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHTokenizedTextResultToken

- (CHTokenizedTextResultToken)init
{
  v7 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], a2, v2, v3, v4, v5);
  v12 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v8, (uint64_t)&stru_1F20141C8, v9, v10, v11);
  uint64_t v13 = *MEMORY[0x1E4F1DB20];
  uint64_t v14 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v15 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
  uint64_t v16 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v17 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  v21[0] = *MEMORY[0x1E4F1DAD8];
  v21[1] = v17;
  v21[2] = v21[0];
  v21[3] = v17;
  v21[4] = v21[0];
  v21[5] = v17;
  v21[6] = v21[0];
  v21[7] = v17;
  v21[8] = v21[0];
  v21[9] = v17;
  v21[10] = v21[0];
  v21[11] = v17;
  v21[12] = v21[0];
  v21[13] = v17;
  v21[14] = v21[0];
  v21[15] = v17;
  v19 = (CHTokenizedTextResultToken *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(self, v18, (uint64_t)&stru_1F20141C8, (uint64_t)v7, 0, 0, v12, 0, 0.0, 0.0, 0.0, 0.0, 0, v13, v14, v15, v16, v21);

  return v19;
}

- (CHTokenizedTextResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  uint64_t v17 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v13, (uint64_t)&stru_1F20141C8, v14, v15, v16);
  uint64_t v18 = *MEMORY[0x1E4F1DB20];
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v20 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v21 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  v25[0] = *MEMORY[0x1E4F1DAD8];
  v25[1] = v21;
  v25[2] = v25[0];
  v25[3] = v21;
  v25[4] = v25[0];
  v25[5] = v21;
  v25[6] = v25[0];
  v25[7] = v21;
  v25[8] = v25[0];
  v25[9] = v21;
  v25[10] = v25[0];
  v25[11] = v21;
  v25[12] = v25[0];
  v25[13] = v21;
  v25[14] = v25[0];
  v25[15] = v21;
  v23 = (CHTokenizedTextResultToken *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(self, v22, (uint64_t)v11, (uint64_t)v12, 0, 0, v17, 0, 0.0, 0.0, 0.0, 0.0, x, y, width, height, 0, v18, v19,
                                        v20,
                                        v25);

  return v23;
}

- (CHTokenizedTextResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 wordID:(unsigned int)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(unint64_t)a10 recognizerSourceLocale:(id)a11 inputSources:(unint64_t)a12 substrokeCount:(int64_t)a13 bounds:(CGRect)a14
{
  uint64_t v16 = *(void *)&a5;
  double width = a14.size.width;
  double height = a14.size.height;
  double y = a14.origin.y;
  double x = a14.origin.x;
  uint64_t v26 = *MEMORY[0x1E4F1DB20];
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v27 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  id v28 = a11;
  id v29 = a4;
  id v30 = a3;
  uint64_t v31 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  v38[0] = *MEMORY[0x1E4F1DAD8];
  v38[1] = v31;
  v38[2] = v38[0];
  v38[3] = v31;
  v38[4] = v38[0];
  v38[5] = v31;
  v38[6] = v38[0];
  v38[7] = v31;
  v38[8] = v38[0];
  v38[9] = v31;
  v38[10] = v38[0];
  v38[11] = v31;
  v38[12] = v38[0];
  v38[13] = v31;
  v38[14] = v38[0];
  v38[15] = v31;
  v33 = (CHTokenizedTextResultToken *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(self, v32, (uint64_t)v30, (uint64_t)v29, v16, a10, v28, a12, a6, a7, a8, a9, x, y, width, height, a13, v26, v35,
                                        v27,
                                        v38);

  return v33;
}

- initWithString:(double)a3 strokeIndexes:(double)a4 wordID:(double)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(uint64_t)a10 recognizerSourceLocale:(void *)a11 inputSources:(void *)a12 substrokeCount:(int)a13 bounds:(uint64_t)a14 originalBounds:(void *)a15 principalLines:(uint64_t)a16
{
  id v36 = a11;
  id v37 = a12;
  id v38 = a15;
  v55.receiver = a1;
  v55.super_class = (Class)CHTokenizedTextResultToken;
  v39 = objc_msgSendSuper2(&v55, sel_initWithString_strokeIndexes_bounds_, v36, v37, a6, a7, a8, a9);
  v45 = v39;
  if (v39)
  {
    v39[14] = a13;
    *((double *)v39 + 8) = a2;
    *((double *)v39 + 9) = a3;
    *((double *)v39 + 10) = a4;
    *((double *)v39 + 11) = a5;
    *((void *)v39 + 12) = a14;
    uint64_t v46 = objc_msgSend_copy(v38, v40, v41, v42, v43, v44);
    v47 = (void *)*((void *)v45 + 13);
    *((void *)v45 + 13) = v46;

    *((void *)v45 + 14) = a16;
    *((void *)v45 + 15) = a17;
    *((void *)v45 + 16) = a18;
    *((void *)v45 + 17) = a19;
    *((void *)v45 + 18) = a20;
    *((void *)v45 + 19) = a21;
    long long v49 = a22[4];
    long long v48 = a22[5];
    long long v50 = a22[7];
    *((_OWORD *)v45 + 16) = a22[6];
    *((_OWORD *)v45 + 17) = v50;
    *((_OWORD *)v45 + 14) = v49;
    *((_OWORD *)v45 + 15) = v48;
    long long v52 = *a22;
    long long v51 = a22[1];
    long long v53 = a22[3];
    *((_OWORD *)v45 + 12) = a22[2];
    *((_OWORD *)v45 + 13) = v53;
    *((_OWORD *)v45 + 10) = v52;
    *((_OWORD *)v45 + 11) = v51;
  }

  return v45;
}

+ (unint64_t)makeOriginalToken:(unint64_t)a3
{
  return a3 & 0xFFFFFFFFFFFFFE03 | 4;
}

- (double)heuristicTextScore
{
  char v7 = objc_msgSend_properties(self, a2, v2, v3, v4, v5);
  char v13 = objc_msgSend_properties(self, v8, v9, v10, v11, v12);
  long long v19 = objc_msgSend_string(self, v14, v15, v16, v17, v18);
  uint64_t v25 = objc_msgSend_length(v19, v20, v21, v22, v23, v24);

  double v31 = 0.0;
  if (v7 & 4 | (unint64_t)(v13 & 0x40))
  {
    v32 = objc_msgSend_string(self, v26, v27, v28, v29, v30);
    double v31 = (double)(unint64_t)objc_msgSend_length(v32, v33, v34, v35, v36, v37);
  }
  return v31 + (double)(unint64_t)v25;
}

- (CHTokenizedTextResultToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v143.receiver = self;
  v143.super_class = (Class)CHTokenizedTextResultToken;
  uint64_t v9 = [(CHTokenizedResultToken *)&v143 initWithCoder:v4];
  if (!v9) {
    goto LABEL_39;
  }
  v9->_wordID = objc_msgSend_decodeInt32ForKey_(v4, v5, @"wordID", v6, v7, v8);
  objc_msgSend_decodeDoubleForKey_(v4, v10, @"modelScore", v11, v12, v13);
  v9->_modelScore = v14;
  objc_msgSend_decodeDoubleForKey_(v4, v15, @"recognitionScore", v16, v17, v18);
  v9->_recognitionScore = v19;
  objc_msgSend_decodeDoubleForKey_(v4, v20, @"combinedScore", v21, v22, v23);
  v9->_combinedScore = v24;
  objc_msgSend_decodeDoubleForKey_(v4, v25, @"alignmentScore", v26, v27, v28);
  v9->_alignmentScore = v29;
  v9->_properties = objc_msgSend_decodeIntegerForKey_(v4, v30, @"properties", v31, v32, v33);
  uint64_t v34 = objc_opt_class();
  uint64_t v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, @"recognizerSourceLocale", v36, v37);
  recognizerSourceLocale = v9->_recognizerSourceLocale;
  v9->_recognizerSourceLocale = (NSLocale *)v38;

  v9->_inputSources = objc_msgSend_decodeIntegerForKey_(v4, v40, @"inputSources", v41, v42, v43);
  v9->_substrokeCount = objc_msgSend_decodeIntegerForKey_(v4, v44, @"substrokeCount", v45, v46, v47);
  long long v48 = (CGPoint *)MEMORY[0x1E4F1DB20];
  CGSize v49 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v9->_originalBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v9->_originalBounds.size = v49;
  uint64_t v50 = objc_opt_class();
  v54 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, @"originalBounds", v52, v53);
  objc_msgSend_getValue_size_(v54, v55, (uint64_t)&v9->_originalBounds, 32, v56, v57);
  if (CGRectEqualToRect(v9->_originalBounds, *MEMORY[0x1E4F1DB28]))
  {
    CGSize v58 = (CGSize)v48[1];
    v9->_originalBounds.origin = *v48;
    v9->_originalBounds.size = v58;
  }
  uint64_t v59 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, @"PrincipalLineTopStart", v61, v62);
  v63 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v63, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    double v64 = *v144;
    double v65 = v144[1];
  }
  else
  {
    double v64 = *MEMORY[0x1E4F1DAD8];
    double v65 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (!v144) {
      goto LABEL_8;
    }
  }
  v145 = v144;
  operator delete(v144);
LABEL_8:

  uint64_t v66 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, @"PrincipalLineTopEnd", v68, v69);
  v70 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v70, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    double v71 = *v144;
    double v72 = v144[1];
  }
  else
  {
    double v71 = *MEMORY[0x1E4F1DAD8];
    double v72 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (!v144) {
      goto LABEL_12;
    }
  }
  v145 = v144;
  operator delete(v144);
LABEL_12:

  uint64_t v73 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v74, v73, @"PrincipalLineMidStart", v75, v76);
  v77 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v77, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    double v78 = *v144;
    double v79 = v144[1];
  }
  else
  {
    double v78 = *MEMORY[0x1E4F1DAD8];
    double v79 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (!v144) {
      goto LABEL_16;
    }
  }
  v145 = v144;
  operator delete(v144);
LABEL_16:

  uint64_t v80 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, @"PrincipalLineMidEnd", v82, v83);
  v84 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v84, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    double v85 = *v144;
    double v86 = v144[1];
  }
  else
  {
    double v85 = *MEMORY[0x1E4F1DAD8];
    double v86 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (!v144) {
      goto LABEL_20;
    }
  }
  v145 = v144;
  operator delete(v144);
LABEL_20:

  uint64_t v87 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v88, v87, @"PrincipalLineBaseStart", v89, v90);
  v91 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v91, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    double v138 = v144[1];
    double v139 = *v144;
  }
  else
  {
    double v138 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v139 = *MEMORY[0x1E4F1DAD8];
    if (!v144) {
      goto LABEL_24;
    }
  }
  v145 = v144;
  operator delete(v144);
LABEL_24:

  uint64_t v92 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v92, @"PrincipalLineBaseEnd", v94, v95);
  v96 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v96, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    double v136 = v144[1];
    double v137 = *v144;
  }
  else
  {
    double v136 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v137 = *MEMORY[0x1E4F1DAD8];
    if (!v144) {
      goto LABEL_28;
    }
  }
  v145 = v144;
  operator delete(v144);
LABEL_28:

  uint64_t v97 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v98, v97, @"PrincipalLineDescStart", v99, v100);
  v101 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v101, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    double v134 = v144[1];
    double v135 = *v144;
  }
  else
  {
    double v134 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v135 = *MEMORY[0x1E4F1DAD8];
    if (!v144) {
      goto LABEL_32;
    }
  }
  v145 = v144;
  operator delete(v144);
LABEL_32:

  uint64_t v102 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v103, v102, @"PrincipalLineDescEnd", v104, v105);
  v106 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v106, (char **)&v144);
  double v132 = v86;
  double v133 = v72;
  if ((char *)v145 - (char *)v144 == 8)
  {
    double v107 = *v144;
    double v108 = v144[1];
LABEL_35:
    v145 = v144;
    operator delete(v144);
    goto LABEL_36;
  }
  double v107 = *MEMORY[0x1E4F1DAD8];
  double v108 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v144) {
    goto LABEL_35;
  }
LABEL_36:

  v9->_principalLines.descender.start.double x = v135;
  v9->_principalLines.descender.start.double y = v134;
  v9->_principalLines.descender.end.double x = v107;
  v9->_principalLines.descender.end.double y = v108;
  v9->_principalLines.base.start.double x = v139;
  v9->_principalLines.base.start.double y = v138;
  v9->_principalLines.base.end.double x = v137;
  v9->_principalLines.base.end.double y = v136;
  v9->_principalLines.median.start.double x = v78;
  v9->_principalLines.median.start.double y = v79;
  v9->_principalLines.median.end.double x = v85;
  v9->_principalLines.median.end.double y = v132;
  v9->_principalLines.top.start.double x = v64;
  v9->_principalLines.top.start.double y = v65;
  v9->_principalLines.top.end.double x = v71;
  v9->_principalLines.top.end.double y = v133;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v109 = v9;
    v142.receiver = v109;
    v142.super_class = (Class)CHTokenizedTextResultToken;
    v110 = [(CHTokenizedResultToken *)&v142 string];
    objc_msgSend_setString_(v109, v111, (uint64_t)v110, v112, v113, v114);

    v141.receiver = v109;
    v141.super_class = (Class)CHTokenizedTextResultToken;
    v115 = [(CHTokenizedResultToken *)&v141 strokeIndexes];
    objc_msgSend_setStrokeIndexes_(v109, v116, (uint64_t)v115, v117, v118, v119);

    v140.receiver = v109;
    v140.super_class = (Class)CHTokenizedTextResultToken;
    [(CHTokenizedResultToken *)&v140 bounds];
    objc_msgSend_setBounds_(v109, v120, v121, v122, v123, v124);
    uint64_t v130 = objc_msgSend_copy(v109, v125, v126, v127, v128, v129);

    uint64_t v9 = (CHTokenizedTextResultToken *)v130;
  }

LABEL_39:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v124.receiver = self;
  v124.super_class = (Class)CHTokenizedTextResultToken;
  [(CHTokenizedResultToken *)&v124 encodeWithCoder:v4];
  objc_msgSend_encodeInt32_forKey_(v4, v5, self->_wordID, @"wordID", v6, v7);
  objc_msgSend_encodeDouble_forKey_(v4, v8, @"modelScore", v9, v10, v11, self->_modelScore);
  objc_msgSend_encodeDouble_forKey_(v4, v12, @"recognitionScore", v13, v14, v15, self->_recognitionScore);
  objc_msgSend_encodeDouble_forKey_(v4, v16, @"combinedScore", v17, v18, v19, self->_combinedScore);
  objc_msgSend_encodeDouble_forKey_(v4, v20, @"alignmentScore", v21, v22, v23, self->_alignmentScore);
  objc_msgSend_encodeInteger_forKey_(v4, v24, self->_properties, @"properties", v25, v26);
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)self->_recognizerSourceLocale, @"recognizerSourceLocale", v28, v29);
  objc_msgSend_encodeInteger_forKey_(v4, v30, self->_inputSources, @"inputSources", v31, v32);
  objc_msgSend_encodeInteger_forKey_(v4, v33, self->_substrokeCount, @"substrokeCount", v34, v35);
  v39 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v36, (uint64_t)&self->_originalBounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v37, v38);
  uint64_t v43 = objc_msgSend_encodeObject_forKey_(v4, v40, (uint64_t)v39, @"originalBounds", v41, v42);
  p_principalLines = &self->_principalLines;
  uint64_t v50 = pointToString(self->_principalLines.top.start, v43, v45, v46, v47, v48, v49);
  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)v50, @"PrincipalLineTopStart", v52, v53);

  v60 = pointToString(p_principalLines->top.end, v54, v55, v56, v57, v58, v59);
  objc_msgSend_encodeObject_forKey_(v4, v61, (uint64_t)v60, @"PrincipalLineTopEnd", v62, v63);

  v70 = pointToString(p_principalLines->median.start, v64, v65, v66, v67, v68, v69);
  objc_msgSend_encodeObject_forKey_(v4, v71, (uint64_t)v70, @"PrincipalLineMidStart", v72, v73);

  uint64_t v80 = pointToString(p_principalLines->median.end, v74, v75, v76, v77, v78, v79);
  objc_msgSend_encodeObject_forKey_(v4, v81, (uint64_t)v80, @"PrincipalLineMidEnd", v82, v83);

  uint64_t v90 = pointToString(p_principalLines->base.start, v84, v85, v86, v87, v88, v89);
  objc_msgSend_encodeObject_forKey_(v4, v91, (uint64_t)v90, @"PrincipalLineBaseStart", v92, v93);

  uint64_t v100 = pointToString(p_principalLines->base.end, v94, v95, v96, v97, v98, v99);
  objc_msgSend_encodeObject_forKey_(v4, v101, (uint64_t)v100, @"PrincipalLineBaseEnd", v102, v103);

  v110 = pointToString(p_principalLines->descender.start, v104, v105, v106, v107, v108, v109);
  objc_msgSend_encodeObject_forKey_(v4, v111, (uint64_t)v110, @"PrincipalLineDescStart", v112, v113);

  v120 = pointToString(p_principalLines->descender.end, v114, v115, v116, v117, v118, v119);
  objc_msgSend_encodeObject_forKey_(v4, v121, (uint64_t)v120, @"PrincipalLineDescEnd", v122, v123);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tokenWithString:(double)a3 strokeIndexes:(double)a4 wordID:(double)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(uint64_t)a10 recognizerSourceLocale:(void *)a11 inputSources:(void *)a12 substrokeCount:(uint64_t)a13 bounds:(uint64_t)a14 originalBounds:(void *)a15 principalLines:(uint64_t)a16
{
  id v32 = a11;
  id v33 = a12;
  id v34 = a15;
  id v35 = [a1 alloc];
  long long v36 = a22[5];
  v47[4] = a22[4];
  v47[5] = v36;
  long long v37 = a22[7];
  v47[6] = a22[6];
  v47[7] = v37;
  long long v38 = a22[1];
  v47[0] = *a22;
  v47[1] = v38;
  long long v39 = a22[3];
  v47[2] = a22[2];
  v47[3] = v39;
  uint64_t v41 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v35, v40, (uint64_t)v32, (uint64_t)v33, a13, a14, v34, a16, a2, a3, a4, a5, a6, a7, a8, a9, a17, a18, a19,
                  a20,
                  a21,
                  v47);

  return v41;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CHMutableTokenizedTextResultToken alloc];
  uint64_t v10 = objc_msgSend_string(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_strokeIndexes(self, v11, v12, v13, v14, v15);
  uint64_t wordID = self->_wordID;
  double modelScore = self->_modelScore;
  double recognitionScore = self->_recognitionScore;
  double combinedScore = self->_combinedScore;
  double alignmentScore = self->_alignmentScore;
  unint64_t properties = self->_properties;
  recognizerSourceLocale = self->_recognizerSourceLocale;
  unint64_t inputSources = self->_inputSources;
  int64_t substrokeCount = self->_substrokeCount;
  objc_msgSend_bounds(self, v26, v27, v28, v29, v30);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  CGFloat x = self->_originalBounds.origin.x;
  long long v38 = *(_OWORD *)&self->_originalBounds.origin.y;
  CGFloat height = self->_originalBounds.size.height;
  CGPoint end = self->_principalLines.median.end;
  v48[4] = self->_principalLines.median.start;
  v48[5] = end;
  CGPoint v41 = self->_principalLines.top.end;
  v48[6] = self->_principalLines.top.start;
  v48[7] = v41;
  CGPoint v42 = self->_principalLines.descender.end;
  v48[0] = self->_principalLines.descender.start;
  v48[1] = v42;
  CGPoint v43 = self->_principalLines.base.end;
  v48[2] = self->_principalLines.base.start;
  v48[3] = v43;
  uint64_t v46 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v4, v44, (uint64_t)v10, (uint64_t)v16, wordID, properties, recognizerSourceLocale, inputSources, modelScore, recognitionScore, combinedScore, alignmentScore, v32, v34, v36, v45, substrokeCount, *(void *)&x, v38,
                  *(void *)&height,
                  v48);

  return v46;
}

- (id)description
{
  if ((self->_properties & 2) != 0) {
    uint64_t v3 = @"Y";
  }
  else {
    uint64_t v3 = @"N";
  }
  id v4 = v3;
  if ((self->_properties & 4) != 0) {
    uint64_t v5 = @"Y";
  }
  else {
    uint64_t v5 = @"N";
  }
  uint64_t v6 = v5;
  if ((self->_properties & 0x100) != 0) {
    uint64_t v7 = @"Y";
  }
  else {
    uint64_t v7 = @"N";
  }
  uint64_t v8 = v7;
  if ((self->_properties & 8) != 0) {
    uint64_t v9 = @"Y";
  }
  else {
    uint64_t v9 = @"N";
  }
  uint64_t v10 = v9;
  if ((self->_properties & 0x10) != 0) {
    uint64_t v11 = @"Y";
  }
  else {
    uint64_t v11 = @"N";
  }
  uint64_t v12 = v11;
  if ((self->_properties & 0x20) != 0) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  uint64_t v14 = v13;
  uint64_t v19 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v15, (uint64_t)&stru_1F20141C8, v16, v17, v18);
  uint64_t v25 = v19;
  unint64_t inputSources = self->_inputSources;
  if ((inputSources & 4) != 0)
  {
    objc_msgSend_appendString_(v19, v20, @" Top Model Result,", v22, v23, v24);
  }
  else
  {
    if ((inputSources & 2) == 0) {
      goto LABEL_24;
    }
    objc_msgSend_appendString_(v19, v20, @" Model Result,", v22, v23, v24);
  }
  unint64_t inputSources = self->_inputSources;
LABEL_24:
  if ((inputSources & 0x10) != 0)
  {
    objc_msgSend_appendString_(v25, v20, @" Text Replacement,", v22, v23, v24);
    unint64_t inputSources = self->_inputSources;
  }
  if ((inputSources & 8) != 0)
  {
    objc_msgSend_appendString_(v25, v20, @" Transliteration,", v22, v23, v24);
    unint64_t inputSources = self->_inputSources;
  }
  if ((inputSources & 0x20) != 0)
  {
    objc_msgSend_appendString_(v25, v20, @" Spell Correction,", v22, v23, v24);
    unint64_t inputSources = self->_inputSources;
  }
  if ((inputSources & 0x80) != 0)
  {
    objc_msgSend_appendString_(v25, v20, @" Confusion Correction,", v22, v23, v24);
    unint64_t inputSources = self->_inputSources;
  }
  if ((inputSources & 0x40) != 0)
  {
    objc_msgSend_appendString_(v25, v20, @" Lexicon Correction,", v22, v23, v24);
    unint64_t inputSources = self->_inputSources;
  }
  if ((inputSources & 0x100) != 0)
  {
    objc_msgSend_appendString_(v25, v20, @" Case Correction,", v22, v23, v24);
    unint64_t inputSources = self->_inputSources;
  }
  if ((inputSources & 0x200) != 0)
  {
    objc_msgSend_appendString_(v25, v20, @" Space Correction,", v22, v23, v24);
    unint64_t inputSources = self->_inputSources;
  }
  if ((inputSources & 0x800) != 0) {
    objc_msgSend_appendString_(v25, v20, @" Other,", v22, v23, v24);
  }
  uint64_t v27 = objc_msgSend_localeIdentifier(self->_recognizerSourceLocale, v20, v21, v22, v23, v24);
  v35.receiver = self;
  v35.super_class = (Class)CHTokenizedTextResultToken;
  uint64_t v28 = [(CHTokenizedResultToken *)&v35 description];
  objc_msgSend_stringByAppendingFormat_(v28, v29, @", substrokeCount: %ld, wordID: %d, modelScore: %0.4f, recognitionScore: %0.4f, combinedScore: %0.4f, alignmentScore: %0.4f, rare: %@, lexicon: %@, lexiconMatching: %@, pattern: %@, inappropriate: %@, precedingSpace: %@, inputSources: {%@}, recognizerSourceLocale: %@", v30, v31, v32, self->_substrokeCount, self->_wordID, *(void *)&self->_modelScore, *(void *)&self->_recognitionScore, *(void *)&self->_combinedScore, *(void *)&self->_alignmentScore, v4, v6, v8, v10, v12, v14, v25,
  double v33 = v27);

  return v33;
}

- (BOOL)isEquivalentToToken:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v49.receiver = self,
        v49.super_class = (Class)CHTokenizedTextResultToken,
        [(CHTokenizedResultToken *)&v49 isEquivalentToToken:v4]))
  {
    id v5 = v4;
    uint64_t v11 = objc_msgSend_properties(v5, v6, v7, v8, v9, v10);
    unint64_t properties = self->_properties;
    uint64_t v18 = objc_msgSend_recognizerSourceLocale(v5, v13, v14, v15, v16, v17);
    int isEqual = objc_msgSend_isEqual_(v18, v19, (uint64_t)self->_recognizerSourceLocale, v20, v21, v22);

    uint64_t v29 = objc_msgSend_inputSources(v5, v24, v25, v26, v27, v28);
    unint64_t inputSources = self->_inputSources;
    BOOL v41 = 0;
    if (objc_msgSend_wordID(v5, v31, v32, v33, v34, v35) == self->_wordID
      && v11 == properties
      && ((isEqual ^ 1) & 1) == 0
      && v29 == inputSources)
    {
      uint64_t v42 = objc_msgSend_substrokeCount(v5, v36, v37, v38, v39, v40);
      BOOL v41 = v42 == objc_msgSend_substrokeCount(self, v43, v44, v45, v46, v47);
    }
  }
  else
  {
    BOOL v41 = 0;
  }

  return v41;
}

- (unint64_t)inputSourceModifiersCount
{
  p_unint64_t inputSources = &self->_inputSources;
  uint64x2_t v3 = (uint64x2_t)vld1q_dup_f64((const double *)p_inputSources);
  int8x16_t v4 = (int8x16_t)vdupq_n_s64(1uLL);
  return vaddvq_s64(vaddq_s64(vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_1C4C39C40), v4), (int64x2_t)vandq_s8((int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_1C4C39C50), v4)), vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_1C4C39C20), v4), (int64x2_t)vandq_s8((int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_1C4C39C30), v4))));
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
  if (!objc_msgSend_hasValidPrincipalLines(self, a2, v2, v3, v4, v5)) {
    return 1.79769313e308;
  }
  objc_msgSend_originalBounds(self, v7, v8, v9, v10, v11);
  if (CGRectIsNull(v30)) {
    return 1.79769313e308;
  }
  double x = self->_principalLines.base.start.x;
  double v19 = self->_principalLines.base.end.x;
  CGFloat v20 = self->_principalLines.base.end.y - self->_principalLines.base.start.y;
  objc_msgSend_originalBounds(self, v12, v13, v14, v15, v16);
  double v22 = v20 * v21;
  objc_msgSend_originalBounds(self, v23, v24, v25, v26, v27);
  return atan2(v22, (v19 - x) * v28);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = sub_1C49641D4((uint64_t)self, v4);

    return v5;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)CHTokenizedTextResultToken;
  return [(CHTokenizedResultToken *)&v3 hash];
}

- (unsigned)wordID
{
  return self->_wordID;
}

- (CGRect)originalBounds
{
  double x = self->_originalBounds.origin.x;
  double y = self->_originalBounds.origin.y;
  double width = self->_originalBounds.size.width;
  double height = self->_originalBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($9936F71585EAE7D8081FB1B234834B3F)principalLines
{
  CGPoint var1 = self[1].var3.var1;
  retstr->var2.var0 = self[1].var3.var0;
  retstr->var2.CGPoint var1 = var1;
  CGPoint v4 = self[2].var0.var1;
  retstr->var3.var0 = self[2].var0.var0;
  retstr->var3.CGPoint var1 = v4;
  CGPoint v5 = self[1].var1.var1;
  retstr->var0.var0 = self[1].var1.var0;
  retstr->var0.CGPoint var1 = v5;
  CGPoint v6 = self[1].var2.var1;
  retstr->var1.var0 = self[1].var2.var0;
  retstr->var1.CGPoint var1 = v6;
  return self;
}

- (void).cxx_destruct
{
}

- (double)recognitionScore
{
  return self->_recognitionScore;
}

- (double)modelScore
{
  return self->_modelScore;
}

- (double)combinedScore
{
  return self->_combinedScore;
}

- (double)alignmentScore
{
  return self->_alignmentScore;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (NSLocale)recognizerSourceLocale
{
  return self->_recognizerSourceLocale;
}

- (unint64_t)inputSources
{
  return self->_inputSources;
}

- (BOOL)isOriginal
{
  return (self->_inputSources & 0x1F8) == 0;
}

- (BOOL)isTopOriginal
{
  if ((self->_inputSources & 4) != 0) {
    return objc_msgSend_isOriginal(self, a2, v2, v3, v4, v5);
  }
  else {
    return 0;
  }
}

- (BOOL)isTransliterated
{
  return (LOBYTE(self->_inputSources) >> 3) & 1;
}

- (int64_t)substrokeCount
{
  return self->_substrokeCount;
}

@end