@interface CHTextSynthesizerDataChunk
- (BOOL)isEqual:(id)a3;
- (BOOL)isNotDef;
- (CHTextSynthesizerDataChunk)initWithChunkValueForSynthesis:(id)a3 originalValue:(id)a4 range:(_NSRange)a5 isNotDef:(BOOL)a6 synthesisSuggestion:(int64_t)a7;
- (NSString)chunkValueForSynthesis;
- (NSString)chunkValueOriginal;
- (_NSRange)rangeInOriginalString;
- (id)description;
- (int64_t)compareByRangeWithDataChunk:(id)a3;
- (int64_t)synthesisSuggestion;
- (void)setChunkValueOriginal:(id)a3;
- (void)setRangeInOriginalString:(_NSRange)a3;
@end

@implementation CHTextSynthesizerDataChunk

- (CHTextSynthesizerDataChunk)initWithChunkValueForSynthesis:(id)a3 originalValue:(id)a4 range:(_NSRange)a5 isNotDef:(BOOL)a6 synthesisSuggestion:(int64_t)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v14 = a3;
  id v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CHTextSynthesizerDataChunk;
  v16 = [(CHTextSynthesizerDataChunk *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_chunkValueForSynthesis, a3);
    objc_storeStrong((id *)&v17->_chunkValueOriginal, a4);
    v17->_rangeInOriginalString.NSUInteger location = location;
    v17->_rangeInOriginalString.NSUInteger length = length;
    v17->_isNotDef = a6;
    v17->_synthesisSuggestion = a7;
  }

  return v17;
}

- (int64_t)compareByRangeWithDataChunk:(id)a3
{
  NSUInteger location = self->_rangeInOriginalString.location;
  unint64_t v7 = objc_msgSend_rangeInOriginalString(a3, a2, (uint64_t)a3, v3, v4, v5);
  if (location < v7) {
    return -1;
  }
  else {
    return location > v7;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v11 = objc_msgSend_chunkValueOriginal(self, v6, v7, v8, v9, v10);
    v17 = objc_msgSend_chunkValueOriginal(v5, v12, v13, v14, v15, v16);
    if (!objc_msgSend_isEqualToString_(v11, v18, (uint64_t)v17, v19, v20, v21))
    {
      BOOL v55 = 0;
      goto LABEL_11;
    }
    v27 = objc_msgSend_chunkValueForSynthesis(self, v22, v23, v24, v25, v26);
    v33 = objc_msgSend_chunkValueForSynthesis(v5, v28, v29, v30, v31, v32);
    if (!objc_msgSend_isEqualToString_(v27, v34, (uint64_t)v33, v35, v36, v37)) {
      goto LABEL_7;
    }
    uint64_t v43 = objc_msgSend_rangeInOriginalString(self, v38, v39, v40, v41, v42);
    v45 = v44;
    BOOL v55 = 0;
    if (v43 != objc_msgSend_rangeInOriginalString(v5, v44, v46, v47, v48, v49) || v45 != v50) {
      goto LABEL_8;
    }
    int isNotDef = objc_msgSend_isNotDef(self, v50, v51, v52, v53, v54);
    if (isNotDef == objc_msgSend_isNotDef(v5, v57, v58, v59, v60, v61))
    {
      uint64_t v68 = objc_msgSend_synthesisSuggestion(self, v62, v63, v64, v65, v66);
      BOOL v55 = v68 == objc_msgSend_synthesisSuggestion(v5, v69, v70, v71, v72, v73);
    }
    else
    {
LABEL_7:
      BOOL v55 = 0;
    }
LABEL_8:

LABEL_11:
    goto LABEL_12;
  }
  BOOL v55 = 0;
LABEL_12:

  return v55;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v10 = objc_msgSend_chunkValueForSynthesis(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_chunkValueOriginal(self, v11, v12, v13, v14, v15);
  v42.NSUInteger location = objc_msgSend_rangeInOriginalString(self, v17, v18, v19, v20, v21);
  v22 = NSStringFromRange(v42);
  int isNotDef = objc_msgSend_isNotDef(self, v23, v24, v25, v26, v27);
  uint64_t v34 = objc_msgSend_synthesisSuggestion(self, v29, v30, v31, v32, v33);
  if (isNotDef) {
    objc_msgSend_stringWithFormat_(v3, v35, @"%@ valueSynthesis:%@, valueOriginal:%@, range:%@, isNotDef:%@, synthesisSuggestion:%d", v36, v37, v38, v4, v10, v16, v22, @"YES", v34);
  }
  else {
  uint64_t v39 = objc_msgSend_stringWithFormat_(v3, v35, @"%@ valueSynthesis:%@, valueOriginal:%@, range:%@, isNotDef:%@, synthesisSuggestion:%d", v36, v37, v38, v4, v10, v16, v22, @"NO", v34);
  }

  return v39;
}

- (_NSRange)rangeInOriginalString
{
  NSUInteger length = self->_rangeInOriginalString.length;
  NSUInteger location = self->_rangeInOriginalString.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeInOriginalString:(_NSRange)a3
{
  self->_rangeInOriginalString = a3;
}

- (NSString)chunkValueOriginal
{
  return self->_chunkValueOriginal;
}

- (void)setChunkValueOriginal:(id)a3
{
}

- (NSString)chunkValueForSynthesis
{
  return self->_chunkValueForSynthesis;
}

- (BOOL)isNotDef
{
  return self->_isNotDef;
}

- (int64_t)synthesisSuggestion
{
  return self->_synthesisSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkValueForSynthesis, 0);
  objc_storeStrong((id *)&self->_chunkValueOriginal, 0);
}

@end