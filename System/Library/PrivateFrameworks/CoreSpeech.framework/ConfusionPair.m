@interface ConfusionPair
- (BOOL)isEqual:(id)a3;
- (BOOL)isPunctuationDeletion;
- (BOOL)isPunctuationEdit;
- (BOOL)isPunctuationInsertion;
- (BOOL)isPunctuationSubstitution;
- (ConfusionPair)initWithUttId:(id)a3;
- (NSMutableArray)correctedTokens;
- (NSMutableArray)recognizedTokens;
- (NSString)leftContext;
- (NSString)rightContext;
- (NSString)uttId;
- (int64_t)editMethod;
- (int64_t)errorType;
- (unint64_t)alignedSourceIndex;
- (unint64_t)alignedTargetIndex;
- (unint64_t)hash;
- (unint64_t)index;
- (unint64_t)numDeletion;
- (unint64_t)numInsertion;
- (unint64_t)numSubstitution;
- (unint64_t)placeholderCount;
- (void)addRecognizedToken:(id)a3 correctedToken:(id)a4;
- (void)setAlignedSourceIndex:(unint64_t)a3;
- (void)setAlignedTargetIndex:(unint64_t)a3;
- (void)setEditMethod:(int64_t)a3;
- (void)setErrorType:(int64_t)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setLeftContext:(id)a3;
- (void)setRightContext:(id)a3;
@end

@implementation ConfusionPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightContext, 0);
  objc_storeStrong((id *)&self->_leftContext, 0);
  objc_storeStrong((id *)&self->_correctedTokens, 0);
  objc_storeStrong((id *)&self->_recognizedTokens, 0);
  objc_storeStrong((id *)&self->_uttId, 0);
}

- (void)setAlignedTargetIndex:(unint64_t)a3
{
  self->_alignedTargetIndex = a3;
}

- (unint64_t)alignedTargetIndex
{
  return self->_alignedTargetIndex;
}

- (void)setAlignedSourceIndex:(unint64_t)a3
{
  self->_alignedSourceIndex = a3;
}

- (unint64_t)alignedSourceIndex
{
  return self->_alignedSourceIndex;
}

- (unint64_t)placeholderCount
{
  return self->_placeholderCount;
}

- (unint64_t)numSubstitution
{
  return self->_numSubstitution;
}

- (unint64_t)numDeletion
{
  return self->_numDeletion;
}

- (unint64_t)numInsertion
{
  return self->_numInsertion;
}

- (void)setEditMethod:(int64_t)a3
{
  self->_editMethod = a3;
}

- (int64_t)editMethod
{
  return self->_editMethod;
}

- (void)setErrorType:(int64_t)a3
{
  self->_errorType = a3;
}

- (int64_t)errorType
{
  return self->_errorType;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setRightContext:(id)a3
{
}

- (NSString)rightContext
{
  return self->_rightContext;
}

- (void)setLeftContext:(id)a3
{
}

- (NSString)leftContext
{
  return self->_leftContext;
}

- (NSMutableArray)correctedTokens
{
  return self->_correctedTokens;
}

- (NSMutableArray)recognizedTokens
{
  return self->_recognizedTokens;
}

- (NSString)uttId
{
  return self->_uttId;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ConfusionPair *)a3;
  if (self == v4)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uttId = self->_uttId;
      v7 = [(ConfusionPair *)v5 uttId];
      if ([(NSString *)uttId isEqualToString:v7])
      {
        recognizedTokens = self->_recognizedTokens;
        v9 = [(ConfusionPair *)v5 recognizedTokens];
        if ([(NSMutableArray *)recognizedTokens isEqualToArray:v9])
        {
          correctedTokens = self->_correctedTokens;
          v11 = [(ConfusionPair *)v5 correctedTokens];
          unsigned __int8 v12 = [(NSMutableArray *)correctedTokens isEqualToArray:v11];
        }
        else
        {
          unsigned __int8 v12 = 0;
        }
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uttId hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_correctedTokens hash] ^ v3;
  return v4 ^ (unint64_t)[(NSMutableArray *)self->_recognizedTokens hash];
}

- (BOOL)isPunctuationEdit
{
  if ([(ConfusionPair *)self isPunctuationDeletion]
    || [(ConfusionPair *)self isPunctuationInsertion])
  {
    return 1;
  }
  return [(ConfusionPair *)self isPunctuationSubstitution];
}

- (BOOL)isPunctuationSubstitution
{
  return [(NSMutableArray *)self->_correctedTokens count]
      && [(NSMutableArray *)self->_recognizedTokens count]
      && self->_isRecognizedTextPunctuation
      && self->_isCorrectedTextPunctuation;
}

- (BOOL)isPunctuationInsertion
{
  return ![(NSMutableArray *)self->_recognizedTokens count] && self->_isCorrectedTextPunctuation;
}

- (BOOL)isPunctuationDeletion
{
  return ![(NSMutableArray *)self->_correctedTokens count] && self->_isRecognizedTextPunctuation;
}

- (void)addRecognizedToken:(id)a3 correctedToken:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([v14 isEqualToString:@"~"])
  {
    ++self->_numInsertion;
    ++self->_placeholderCount;
    [(NSMutableArray *)self->_correctedTokens addObject:v6];
    BOOL isCorrectedTextPunctuation = self->_isCorrectedTextPunctuation;
    p_BOOL isCorrectedTextPunctuation = &self->_isCorrectedTextPunctuation;
    if (!isCorrectedTextPunctuation) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (![v6 isEqualToString:@"~"])
  {
    ++self->_numSubstitution;
    [(NSMutableArray *)self->_recognizedTokens addObject:v14];
    [(NSMutableArray *)self->_correctedTokens addObject:v6];
    if (self->_isRecognizedTextPunctuation) {
      char v11 = sub_100009180(v14);
    }
    else {
      char v11 = 0;
    }
    BOOL v12 = self->_isCorrectedTextPunctuation;
    p_BOOL isCorrectedTextPunctuation = &self->_isCorrectedTextPunctuation;
    *(p_isCorrectedTextPunctuation - 1) = v11;
    if (!v12) {
      goto LABEL_13;
    }
LABEL_11:
    v10 = v6;
    goto LABEL_12;
  }
  ++self->_numDeletion;
  [(NSMutableArray *)self->_recognizedTokens addObject:v14];
  BOOL isRecognizedTextPunctuation = self->_isRecognizedTextPunctuation;
  p_BOOL isCorrectedTextPunctuation = &self->_isRecognizedTextPunctuation;
  if (isRecognizedTextPunctuation)
  {
    v10 = v14;
LABEL_12:
    char v13 = sub_100009180(v10);
    goto LABEL_14;
  }
LABEL_13:
  char v13 = 0;
LABEL_14:
  BOOL *p_isCorrectedTextPunctuation = v13;
}

- (ConfusionPair)initWithUttId:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ConfusionPair;
  v5 = [(ConfusionPair *)&v15 init];
  if (v5)
  {
    id v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    id v8 = objc_alloc_init((Class)NSMutableArray);
    v9 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v8;

    id v10 = objc_alloc_init((Class)NSMutableArray);
    char v11 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v10;

    BOOL v12 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = &stru_10003D2D8;

    char v13 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = &stru_10003D2D8;

    *((void *)v5 + 13) = 0;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *((_WORD *)v5 + 4) = 257;
  }

  return (ConfusionPair *)v5;
}

@end