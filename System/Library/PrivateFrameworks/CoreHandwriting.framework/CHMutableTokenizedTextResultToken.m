@interface CHMutableTokenizedTextResultToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)bounds;
- (CHMutableTokenizedTextResultToken)initWithCoder:(id)a3;
- (NSIndexSet)strokeIndexes;
- (NSString)string;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithString:(double)a3 strokeIndexes:(double)a4 wordID:(double)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(uint64_t)a10 recognizerSourceLocale:(void *)a11 inputSources:(void *)a12 substrokeCount:(uint64_t)a13 bounds:(uint64_t)a14 originalBounds:(uint64_t)a15 principalLines:(uint64_t)a16;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignmentScore:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCombinedScore:(double)a3;
- (void)setInputSources:(unint64_t)a3;
- (void)setModelScore:(double)a3;
- (void)setProperties:(unint64_t)a3;
- (void)setRecognitionScore:(double)a3;
- (void)setRecognizerSourceLocale:(id)a3;
- (void)setString:(id)a3;
- (void)setStrokeIndexes:(id)a3;
- (void)setSubstrokeCount:(int64_t)a3;
- (void)setWordID:(unsigned int)a3;
@end

@implementation CHMutableTokenizedTextResultToken

- (id)initWithString:(double)a3 strokeIndexes:(double)a4 wordID:(double)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(uint64_t)a10 recognizerSourceLocale:(void *)a11 inputSources:(void *)a12 substrokeCount:(uint64_t)a13 bounds:(uint64_t)a14 originalBounds:(uint64_t)a15 principalLines:(uint64_t)a16
{
  id v33 = a11;
  id v34 = a12;
  long long v35 = a21[5];
  v46[4] = a21[4];
  v46[5] = v35;
  long long v36 = a21[7];
  v46[6] = a21[6];
  v46[7] = v36;
  long long v37 = a21[1];
  v46[0] = *a21;
  v46[1] = v37;
  long long v38 = a21[3];
  v46[2] = a21[2];
  v46[3] = v38;
  v45.receiver = a1;
  v45.super_class = (Class)CHMutableTokenizedTextResultToken;
  v39 = (id *)objc_msgSendSuper2(&v45, sel_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_, v33, v34, a13, a14, a15, a16, a2, a3, a4, a5, a6, a7, a8, a9, a17, a18, a19,
                a20,
                v46);
  v40 = v39;
  if (v39)
  {
    objc_storeStrong(v39 + 37, a11);
    objc_storeStrong(v40 + 38, a12);
    *((double *)v40 + 39) = a6;
    *((double *)v40 + 40) = a7;
    *((double *)v40 + 41) = a8;
    *((double *)v40 + 42) = a9;
  }

  return v40;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CHTokenizedTextResultToken alloc];
  string = self->_string;
  strokeIndexes = self->_strokeIndexes;
  uint64_t wordID = self->super._wordID;
  double modelScore = self->super._modelScore;
  double recognitionScore = self->super._recognitionScore;
  double combinedScore = self->super._combinedScore;
  double alignmentScore = self->super._alignmentScore;
  unint64_t properties = self->super._properties;
  recognizerSourceLocale = self->super._recognizerSourceLocale;
  unint64_t inputSources = self->super._inputSources;
  int64_t substrokeCount = self->super._substrokeCount;
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  CGFloat v20 = self->super._originalBounds.origin.x;
  long long v21 = *(_OWORD *)&self->super._originalBounds.origin.y;
  CGFloat v22 = self->super._originalBounds.size.height;
  CGPoint end = self->super._principalLines.median.end;
  v29[4] = self->super._principalLines.median.start;
  v29[5] = end;
  CGPoint v24 = self->super._principalLines.top.end;
  v29[6] = self->super._principalLines.top.start;
  v29[7] = v24;
  CGPoint v25 = self->super._principalLines.descender.end;
  v29[0] = self->super._principalLines.descender.start;
  v29[1] = v25;
  CGPoint v26 = self->super._principalLines.base.end;
  v29[2] = self->super._principalLines.base.start;
  v29[3] = v26;
  return (id)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v4, v27, (uint64_t)string, (uint64_t)strokeIndexes, wordID, properties, recognizerSourceLocale, inputSources, modelScore, recognitionScore, combinedScore, alignmentScore, x, y, width, height, substrokeCount, *(void *)&v20, v21,
               *(void *)&v22,
               v29);
}

- (CHMutableTokenizedTextResultToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHMutableTokenizedTextResultToken;
  v5 = [(CHTokenizedTextResultToken *)&v14 initWithCoder:v4];
  v11 = v5;
  if (v5)
  {
    v12 = (CHMutableTokenizedTextResultToken *)objc_msgSend_mutableCopy(v5, v6, v7, v8, v9, v10);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  uint64_t v9 = objc_msgSend_copy(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeWithCoder_(v9, v10, (uint64_t)v14, v11, v12, v13);
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
    uint64_t v10 = objc_msgSend_copy(self, v5, v6, v7, v8, v9);
    char v11 = sub_1C49641D4((uint64_t)v10, v4);

    return v11;
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
  id v12 = a3;
  objc_msgSend_string(self, v5, v6, v7, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  char v11 = v12;
  if (v10 != v12)
  {
    objc_storeStrong((id *)&self->_string, a3);
    char v11 = v12;
  }
}

- (NSIndexSet)strokeIndexes
{
  return self->_strokeIndexes;
}

- (void)setStrokeIndexes:(id)a3
{
  id v4 = (NSIndexSet *)a3;
  if (self->_strokeIndexes != v4)
  {
    id v12 = v4;
    id v10 = (NSIndexSet *)objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    strokeIndexes = self->_strokeIndexes;
    self->_strokeIndexes = v10;

    id v4 = v12;
  }
}

- (void)setWordID:(unsigned int)a3
{
  self->super._uint64_t wordID = a3;
}

- (void)setModelScore:(double)a3
{
  self->super._double modelScore = a3;
}

- (void)setRecognitionScore:(double)a3
{
  self->super._double recognitionScore = a3;
}

- (void)setCombinedScore:(double)a3
{
  self->super._double combinedScore = a3;
}

- (void)setAlignmentScore:(double)a3
{
  self->super._double alignmentScore = a3;
}

- (void)setProperties:(unint64_t)a3
{
  self->super._unint64_t properties = a3;
}

- (void)setRecognizerSourceLocale:(id)a3
{
  id v11 = a3;
  uint64_t v9 = (NSLocale *)objc_msgSend_copy(v11, v4, v5, v6, v7, v8);
  recognizerSourceLocale = self->super._recognizerSourceLocale;
  self->super._recognizerSourceLocale = v9;
}

- (void)setInputSources:(unint64_t)a3
{
  self->super._unint64_t inputSources = a3;
}

- (void)setSubstrokeCount:(int64_t)a3
{
  self->super._int64_t substrokeCount = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIndexes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end