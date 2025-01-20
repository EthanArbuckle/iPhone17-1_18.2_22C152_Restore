@interface CHMutableTokenizedMathResultToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)bounds;
- (CHMutableTokenizedMathResultToken)initWithCoder:(id)a3;
- (CHMutableTokenizedMathResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 score:(double)a5 bounds:(CGRect)a6 properties:(unint64_t)a7 maskedAlternative:(id)a8 maskedAlternativeScore:(double)a9;
- (NSIndexSet)strokeIndexes;
- (NSString)string;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendToken:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setMaskedAlternative:(id)a3;
- (void)setMaskedAlternativeScore:(double)a3;
- (void)setProperties:(unint64_t)a3;
- (void)setScore:(double)a3;
- (void)setString:(id)a3;
- (void)setStrokeIndexes:(id)a3;
@end

@implementation CHMutableTokenizedMathResultToken

- (CHMutableTokenizedMathResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 score:(double)a5 bounds:(CGRect)a6 properties:(unint64_t)a7 maskedAlternative:(id)a8 maskedAlternativeScore:(double)a9
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v20 = a3;
  id v21 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CHMutableTokenizedMathResultToken;
  v22 = -[CHTokenizedMathResultToken initWithString:strokeIndexes:score:bounds:properties:maskedAlternative:maskedAlternativeScore:](&v25, sel_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_, v20, v21, a7, a8, a5, x, y, width, height, a9);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_string, a3);
    objc_storeStrong((id *)&v23->_strokeIndexes, a4);
    v23->_bounds.origin.double x = x;
    v23->_bounds.origin.double y = y;
    v23->_bounds.size.double width = width;
    v23->_bounds.size.double height = height;
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CHTokenizedMathResultToken alloc];
  string = self->_string;
  strokeIndexes = self->_strokeIndexes;
  double score = self->super._score;
  unint64_t properties = self->super._properties;
  maskedAlternative = self->super._maskedAlternative;
  double maskedAlternativeScore = self->super._maskedAlternativeScore;
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  return (id)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v4, v5, (uint64_t)string, (uint64_t)strokeIndexes, properties, (uint64_t)maskedAlternative, score, x, y, width, height, maskedAlternativeScore);
}

- (CHMutableTokenizedMathResultToken)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CHMutableTokenizedMathResultToken;
  v3 = [(CHTokenizedMathResultToken *)&v12 initWithCoder:a3];
  if (!v3) {
    return 0;
  }
  v9 = v3;
  v10 = (CHMutableTokenizedMathResultToken *)objc_msgSend_mutableCopy(v3, v4, v5, v6, v7, v8);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v14 = (id)objc_msgSend_copy(self, v5, v6, v7, v8, v9);
  objc_msgSend_encodeWithCoder_(v14, v10, (uint64_t)v4, v11, v12, v13);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = objc_msgSend_copy(self, v5, v6, v7, v8, v9);
    char isEqualToTokenizedMathResultToken = objc_msgSend_isEqualToTokenizedMathResultToken_(v10, v11, (uint64_t)v4, v12, v13, v14);

    return isEqualToTokenizedMathResultToken;
  }
  else
  {

    return 0;
  }
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  id v11 = a3;
  objc_msgSend_string(self, v5, v6, v7, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v11) {
    objc_storeStrong((id *)&self->_string, a3);
  }
}

- (NSIndexSet)strokeIndexes
{
  return self->_strokeIndexes;
}

- (void)setStrokeIndexes:(id)a3
{
  if (self->_strokeIndexes != a3)
  {
    uint64_t v7 = (NSIndexSet *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4, v5);
    strokeIndexes = self->_strokeIndexes;
    self->_strokeIndexes = v7;
  }
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

- (void)setScore:(double)a3
{
  self->super._double score = a3;
}

- (void)setProperties:(unint64_t)a3
{
  self->super._unint64_t properties = a3;
}

- (void)setMaskedAlternative:(id)a3
{
  uint64_t v7 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4, v5);
  maskedAlternative = self->super._maskedAlternative;
  self->super._maskedAlternative = v7;
}

- (void)setMaskedAlternativeScore:(double)a3
{
  self->super._double maskedAlternativeScore = a3;
}

- (void)appendToken:(id)a3
{
  id v82 = a3;
  string = self->_string;
  id v10 = objc_msgSend_string(v82, v5, v6, v7, v8, v9);
  objc_msgSend_stringByAppendingString_(string, v11, (uint64_t)v10, v12, v13, v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = self->_string;
  self->_string = v15;

  v22 = objc_msgSend_mutableCopy(self->_strokeIndexes, v17, v18, v19, v20, v21);
  v28 = objc_msgSend_strokeIndexes(v82, v23, v24, v25, v26, v27);
  objc_msgSend_addIndexes_(v22, v29, (uint64_t)v28, v30, v31, v32);

  objc_storeStrong((id *)&self->_strokeIndexes, v22);
  objc_msgSend_score(v82, v33, v34, v35, v36, v37);
  self->super._double score = v38 * self->super._score;
  objc_msgSend_bounds(v82, v39, v40, v41, v42, v43);
  v84.origin.double x = v44;
  v84.origin.double y = v45;
  v84.size.double width = v46;
  v84.size.double height = v47;
  self->_bounds = CGRectUnion(self->_bounds, v84);
  uint64_t v53 = objc_msgSend_maskedAlternative(v82, v48, v49, v50, v51, v52);
  if (v53)
  {
    v59 = (void *)v53;
    objc_msgSend_maskedAlternativeScore(v82, v54, v55, v56, v57, v58);
    double v61 = v60;
    double maskedAlternativeScore = self->super._maskedAlternativeScore;

    if (v61 > maskedAlternativeScore)
    {
      v68 = objc_msgSend_maskedAlternative(v82, v63, v64, v65, v66, v67);
      v74 = (NSString *)objc_msgSend_copy(v68, v69, v70, v71, v72, v73);
      maskedAlternative = self->super._maskedAlternative;
      self->super._maskedAlternative = v74;

      objc_msgSend_maskedAlternativeScore(v82, v76, v77, v78, v79, v80);
      self->super._double maskedAlternativeScore = v81;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIndexes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end