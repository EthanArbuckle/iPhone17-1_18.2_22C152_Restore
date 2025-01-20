@interface CHTokenizedMathResultToken
+ (BOOL)supportsSecureCoding;
+ (id)updatedToken:(id)a3 withString:(id)a4;
+ (id)updatedToken:(id)a3 withString:(id)a4 withTokenProperty:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTokenizedMathResultToken:(id)a3;
- (BOOL)isEquivalentToToken:(id)a3;
- (CHTokenizedMathResultToken)init;
- (CHTokenizedMathResultToken)initWithCoder:(id)a3;
- (CHTokenizedMathResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 score:(double)a5 bounds:(CGRect)a6 properties:(unint64_t)a7;
- (CHTokenizedMathResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 score:(double)a5 bounds:(CGRect)a6 properties:(unint64_t)a7 maskedAlternative:(id)a8 maskedAlternativeScore:(double)a9;
- (NSString)maskedAlternative;
- (double)maskedAlternativeScore;
- (double)score;
- (id)debugDescription;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)properties;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHTokenizedMathResultToken

- (CHTokenizedMathResultToken)init
{
  v7 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], a2, v2, v3, v4, v5);
  v10 = (CHTokenizedMathResultToken *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(self, v8, (uint64_t)&stru_1F20141C8, (uint64_t)v7, 0, v9, 0.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

  return v10;
}

- (CHTokenizedMathResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 score:(double)a5 bounds:(CGRect)a6 properties:(unint64_t)a7
{
  return (CHTokenizedMathResultToken *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(self, a2, (uint64_t)a3, (uint64_t)a4, a7, 0, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, 0.0);
}

- (CHTokenizedMathResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 score:(double)a5 bounds:(CGRect)a6 properties:(unint64_t)a7 maskedAlternative:(id)a8 maskedAlternativeScore:(double)a9
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)CHTokenizedMathResultToken;
  v20 = -[CHTokenizedResultToken initWithString:strokeIndexes:bounds:](&v30, sel_initWithString_strokeIndexes_bounds_, a3, a4, x, y, width, height);
  v26 = v20;
  if (v20)
  {
    v20->_score = a5;
    v20->_properties = a7;
    uint64_t v27 = objc_msgSend_copy(v19, v21, v22, v23, v24, v25);
    maskedAlternative = v26->_maskedAlternative;
    v26->_maskedAlternative = (NSString *)v27;

    v26->_maskedAlternativeScore = a9;
  }

  return v26;
}

+ (id)updatedToken:(id)a3 withString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [CHTokenizedMathResultToken alloc];
  v13 = objc_msgSend_strokeIndexes(v6, v8, v9, v10, v11, v12);
  objc_msgSend_score(v6, v14, v15, v16, v17, v18);
  double v20 = v19;
  objc_msgSend_bounds(v6, v21, v22, v23, v24, v25);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  uint64_t v39 = objc_msgSend_properties(v6, v34, v35, v36, v37, v38);
  v45 = objc_msgSend_maskedAlternative(v6, v40, v41, v42, v43, v44);
  objc_msgSend_maskedAlternativeScore(v6, v46, v47, v48, v49, v50);
  double v52 = v51;

  v54 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v7, v53, (uint64_t)v5, (uint64_t)v13, v39, (uint64_t)v45, v20, v27, v29, v31, v33, v52);
  return v54;
}

+ (id)updatedToken:(id)a3 withString:(id)a4 withTokenProperty:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [CHTokenizedMathResultToken alloc];
  uint64_t v15 = objc_msgSend_strokeIndexes(v8, v10, v11, v12, v13, v14);
  objc_msgSend_score(v8, v16, v17, v18, v19, v20);
  double v22 = v21;
  objc_msgSend_bounds(v8, v23, v24, v25, v26, v27);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  uint64_t v41 = objc_msgSend_maskedAlternative(v8, v36, v37, v38, v39, v40);
  objc_msgSend_maskedAlternativeScore(v8, v42, v43, v44, v45, v46);
  double v48 = v47;

  uint64_t v50 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v9, v49, (uint64_t)v7, (uint64_t)v15, a5, (uint64_t)v41, v22, v29, v31, v33, v35, v48);
  return v50;
}

- (CHTokenizedMathResultToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CHTokenizedMathResultToken;
  uint64_t v9 = [(CHTokenizedResultToken *)&v51 initWithCoder:v4];
  if (v9)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, @"score", v6, v7, v8);
    *(void *)(v9 + 56) = v10;
    *(void *)(v9 + 64) = objc_msgSend_decodeIntegerForKey_(v4, v11, @"properties", v12, v13, v14);
    uint64_t v15 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"maskedAlternative", v17, v18);
    uint64_t v20 = *(void **)(v9 + 72);
    *(void *)(v9 + 72) = v19;

    objc_msgSend_decodeDoubleForKey_(v4, v21, @"maskedAlternativeScore", v22, v23, v24);
    *(void *)(v9 + 80) = v25;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v50.receiver = (id)v9;
      v50.super_class = (Class)CHTokenizedMathResultToken;
      id v26 = (id)v9;
      uint64_t v27 = [(CHTokenizedResultToken *)&v50 string];
      objc_msgSend_setString_(v26, v28, (uint64_t)v27, v29, v30, v31);

      v49.receiver = v26;
      v49.super_class = (Class)CHTokenizedMathResultToken;
      double v32 = [(CHTokenizedResultToken *)&v49 strokeIndexes];
      objc_msgSend_setStrokeIndexes_(v26, v33, (uint64_t)v32, v34, v35, v36);

      v48.receiver = v26;
      v48.super_class = (Class)CHTokenizedMathResultToken;
      [(CHTokenizedResultToken *)&v48 bounds];
      objc_msgSend_setBounds_(v26, v37, v38, v39, v40, v41);
      uint64_t v9 = objc_msgSend_copy(v26, v42, v43, v44, v45, v46);
    }
  }

  return (CHTokenizedMathResultToken *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CHTokenizedMathResultToken;
  id v4 = a3;
  [(CHTokenizedResultToken *)&v19 encodeWithCoder:v4];
  objc_msgSend_encodeDouble_forKey_(v4, v5, @"score", v6, v7, v8, self->_score, v19.receiver, v19.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v9, self->_properties, @"properties", v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_maskedAlternative, @"maskedAlternative", v13, v14);
  objc_msgSend_encodeDouble_forKey_(v4, v15, @"maskedAlternativeScore", v16, v17, v18, self->_maskedAlternativeScore);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CHMutableTokenizedMathResultToken alloc];
  uint64_t v10 = objc_msgSend_string(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_strokeIndexes(self, v11, v12, v13, v14, v15);
  double score = self->_score;
  objc_msgSend_bounds(self, v18, v19, v20, v21, v22);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  uint64_t v36 = objc_msgSend_properties(self, v31, v32, v33, v34, v35);
  uint64_t v42 = objc_msgSend_maskedAlternative(self, v37, v38, v39, v40, v41);
  objc_msgSend_maskedAlternativeScore(self, v43, v44, v45, v46, v47);
  objc_super v50 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v4, v48, (uint64_t)v10, (uint64_t)v16, v36, (uint64_t)v42, score, v24, v26, v28, v30, v49);

  return v50;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)CHTokenizedMathResultToken;
  uint64_t v3 = [(CHTokenizedResultToken *)&v10 description];
  uint64_t v8 = objc_msgSend_stringByAppendingFormat_(v3, v4, @", score: %0.4f", v5, v6, v7, *(void *)&self->_score);

  return v8;
}

- (id)debugDescription
{
  uint64_t v7 = objc_msgSend_description(self, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_stringByAppendingFormat_(v7, v8, @", masked_alternative: %@, alternative_score: %0.4f", v9, v10, v11, self->_maskedAlternative, *(void *)&self->_maskedAlternativeScore);

  return v12;
}

- (BOOL)isEqualToTokenizedMathResultToken:(id)a3
{
  uint64_t v4 = (CHTokenizedMathResultToken *)a3;
  if (self == v4)
  {
    BOOL v42 = 1;
    goto LABEL_9;
  }
  v46.receiver = self;
  v46.super_class = (Class)CHTokenizedMathResultToken;
  if ([(CHTokenizedResultToken *)&v46 isEqualToTokenizedResultToken:v4])
  {
    double score = self->_score;
    objc_msgSend_score(v4, v5, v6, v7, v8, v9);
    if (vabdd_f64(score, v16) < 2.22044605e-16)
    {
      unint64_t properties = self->_properties;
      if (properties == objc_msgSend_properties(v4, v11, v12, v13, v14, v15))
      {
        maskedAlternative = self->_maskedAlternative;
        uint64_t v24 = objc_msgSend_maskedAlternative(v4, v18, v19, v20, v21, v22);
        if (maskedAlternative == (NSString *)v24)
        {
        }
        else
        {
          double v30 = (void *)v24;
          uint64_t v31 = self->_maskedAlternative;
          uint64_t v32 = objc_msgSend_maskedAlternative(v4, v25, v26, v27, v28, v29);
          LODWORD(v31) = objc_msgSend_isEqualToString_(v31, v33, (uint64_t)v32, v34, v35, v36);

          if (!v31) {
            goto LABEL_7;
          }
        }
        double maskedAlternativeScore = self->_maskedAlternativeScore;
        objc_msgSend_maskedAlternativeScore(v4, v37, v38, v39, v40, v41);
        BOOL v42 = vabdd_f64(maskedAlternativeScore, v45) < 2.22044605e-16;
        goto LABEL_9;
      }
    }
  }
LABEL_7:
  BOOL v42 = 0;
LABEL_9:

  return v42;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToTokenizedMathResultToken = objc_msgSend_isEqualToTokenizedMathResultToken_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTokenizedMathResultToken;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)CHTokenizedMathResultToken;
  unint64_t v3 = [(CHTokenizedResultToken *)&v12 hash];
  unint64_t v4 = (unint64_t)(self->_score * 1000.0);
  unint64_t v5 = v3 ^ self->_properties;
  return v5 ^ objc_msgSend_hash(self->_maskedAlternative, v6, v7, v8, v9, v10) ^ v4 ^ (unint64_t)(self->_maskedAlternativeScore * 100000.0);
}

- (BOOL)isEquivalentToToken:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v12.receiver = self,
        v12.super_class = (Class)CHTokenizedMathResultToken,
        [(CHTokenizedResultToken *)&v12 isEquivalentToToken:v4]))
  {
    BOOL v10 = objc_msgSend_properties(v4, v5, v6, v7, v8, v9) == self->_properties;

    return v10;
  }
  else
  {

    return 0;
  }
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

- (unint64_t)properties
{
  return self->_properties;
}

- (NSString)maskedAlternative
{
  return self->_maskedAlternative;
}

- (double)maskedAlternativeScore
{
  return self->_maskedAlternativeScore;
}

@end