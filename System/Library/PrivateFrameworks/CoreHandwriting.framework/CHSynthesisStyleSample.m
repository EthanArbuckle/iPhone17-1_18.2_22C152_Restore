@interface CHSynthesisStyleSample
+ (BOOL)supportsSecureCoding;
+ (double)normalizationTextHeight;
+ (float)cosineSimilarityBetweenFirstVector:(const void *)a3 secondVector:(const void *)a4;
+ (float)distanceBetweenFirstVector:(const void *)a3 secondVector:(const void *)a4;
+ (id)characterCoverageWithString:(id)a3;
+ (id)floatVectorToArray:(void *)a3;
+ (id)normalizeDrawing:(id)a3 transcription:(id)a4;
+ (id)normalizeStyleSample:(id)a3;
+ (id)sampleWithTranscription:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5;
+ (id)sampleWithTranscription:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5 embeddingVector:(const void *)a6;
+ (int64_t)shiftTimestep:(int64_t)a3 offset:(int64_t)a4;
+ (vector<float,)floatArrayToVector:(id)a2;
+ (vector<float,)floatMultiArrayToVector:(id)a2;
+ (void)normalizeVector:(void *)a3;
- (BOOL)hasEmbeddingVector;
- (BOOL)isEqual:(id)a3;
- (CHDrawing)drawing;
- (CHSynthesisStyleSample)initWithCoder:(id)a3;
- (CHSynthesisStyleSample)initWithTranscription:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5 embeddingVector:(const void *)a6;
- (NSDate)creationDate;
- (NSSet)strokeIdentifiers;
- (NSString)transcription;
- (float)cosineSimilarityToSample:(id)a3;
- (float)distanceToSample:(id)a3;
- (id).cxx_construct;
- (id)characterCoverage;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)creationTimestep;
- (int64_t)samplingCount;
- (vector<float,)embeddingVector;
- (void)clearEmbeddingVector;
- (void)encodeWithCoder:(id)a3;
- (void)incrementSamplingCount;
- (void)setCreationTimestep:(int64_t)a3;
- (void)setEmbeddingVector:()vector<float;
- (void)setSamplingCount:(int64_t)a3;
- (void)shiftTimestepsByOffset:(int64_t)a3;
- (void)updateStyleEmbedding:(id)a3;
@end

@implementation CHSynthesisStyleSample

+ (double)normalizationTextHeight
{
  return 16.0;
}

+ (vector<float,)floatMultiArrayToVector:(id)a2
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (objc_msgSend_dataType(v5, v6, v7, v8, v9, v10) != 65568)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v15 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = objc_msgSend_dataType(v5, v16, v17, v18, v19, v20);
      _os_log_impl(&dword_1C492D000, v15, OS_LOG_TYPE_FAULT, "Unexpected data type from mlMultiArray: %ld", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x4812000000;
  v31 = sub_1C4A0BE1C;
  v32 = sub_1C4A0BE40;
  v33 = &unk_1C4CB5C62;
  v35 = 0;
  uint64_t v36 = 0;
  __p = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4A0BE58;
  v28[3] = &unk_1E64E23F0;
  v28[4] = &buf;
  objc_msgSend_getBytesWithHandler_(v5, v11, (uint64_t)v28, v12, v13, v14);
  uint64_t v21 = *((void *)&buf + 1);
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v23 = *(unsigned char **)(v21 + 48);
  v22 = *(unsigned char **)(v21 + 56);
  int64_t v24 = v22 - v23;
  if (v22 != v23)
  {
    if (v24 < 0) {
      sub_1C494A220();
    }
    v25 = (float *)operator new(v22 - v23);
    retstr->__begin_ = v25;
    v26 = &v25[v24 >> 2];
    retstr->__end_cap_.__value_ = v26;
    memcpy(v25, v23, v24);
    retstr->__end_ = v26;
  }
  _Block_object_dispose(&buf, 8);
  if (__p)
  {
    v35 = __p;
    operator delete(__p);
  }

  return result;
}

+ (vector<float,)floatArrayToVector:(id)a2
{
  id v5 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x4812000000;
  v28 = sub_1C4A0BE1C;
  v29 = sub_1C4A0BE40;
  uint64_t v30 = &unk_1C4CB5C62;
  unint64_t v15 = objc_msgSend_count(v5, v6, v7, v8, v9, v10);
  __p = 0;
  v32 = 0;
  v33 = 0;
  if (v15)
  {
    if (v15 >> 62) {
      sub_1C494A220();
    }
    v16 = (char *)operator new(4 * v15);
    __p = v16;
    v33 = &v16[4 * v15];
    bzero(v16, 4 * v15);
    v32 = &v16[4 * v15];
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4A0C134;
  v24[3] = &unk_1E64E2418;
  v24[4] = &v25;
  objc_msgSend_enumerateObjectsUsingBlock_(v5, v11, (uint64_t)v24, v12, v13, v14);
  uint64_t v17 = v26;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  uint64_t v19 = (unsigned char *)v17[6];
  uint64_t v18 = (unsigned char *)v17[7];
  int64_t v20 = v18 - v19;
  if (v18 != v19)
  {
    if (v20 < 0) {
      sub_1C494A220();
    }
    uint64_t v21 = (float *)operator new(v18 - v19);
    retstr->__begin_ = v21;
    v22 = &v21[v20 >> 2];
    retstr->__end_cap_.__value_ = v22;
    memcpy(v21, v19, v20);
    retstr->__end_ = v22;
  }
  _Block_object_dispose(&v25, 8);
  if (__p)
  {
    v32 = (char *)__p;
    operator delete(__p);
  }

  return result;
}

+ (id)floatVectorToArray:(void *)a3
{
  uint64_t v12 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2, v3, v4, v5);
  uint64_t v14 = *(_DWORD **)a3;
  unint64_t v15 = (_DWORD *)*((void *)a3 + 1);
  if (*(_DWORD **)a3 != v15)
  {
    do
    {
      LODWORD(v13) = *v14;
      v16 = objc_msgSend_numberWithFloat_(NSNumber, v7, v8, v9, v10, v11, v13);
      objc_msgSend_addObject_(v12, v17, (uint64_t)v16, v18, v19, v20);

      ++v14;
    }
    while (v14 != v15);
  }
  return v12;
}

+ (float)distanceBetweenFirstVector:(const void *)a3 secondVector:(const void *)a4
{
  float __C = -1.0;
  vDSP_distancesq(*(const float **)a3, 1, *(const float **)a4, 1, &__C, (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2);
  return sqrtf(__C);
}

+ (float)cosineSimilarityBetweenFirstVector:(const void *)a3 secondVector:(const void *)a4
{
  float __C = -1.0;
  vDSP_dotpr(*(const float **)a3, 1, *(const float **)a4, 1, &__C, (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2);
  return __C;
}

+ (void)normalizeVector:(void *)a3
{
  uint64_t v3 = *(const float **)a3;
  uint64_t v4 = *((void *)a3 + 1) - *(void *)a3;
  if (v4)
  {
    float __C = -1.0;
    vDSP_dotpr(v3, 1, v3, 1, &__C, v4 >> 2);
    float __C = sqrtf(__C);
    double v6 = fabsf(__C);
    if (v6 <= 0.0000001)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v7 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_FAULT, "Style Inventory Embedding: Magnitude of the vector is very close to 0", buf, 2u);
      }

      double v6 = fabsf(__C);
    }
    if (v6 >= 0.0000001)
    {
      vDSP_vsdiv(*(const float **)a3, 1, &__C, *(float **)a3, 1, (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2);
    }
    else
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v8 = (id)qword_1EA3C9FD8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_ERROR, "Style Inventory Embedding: Magnitude of the vector is very close to 0, will not normalize the vector", v9, 2u);
      }
    }
  }
}

+ (id)normalizeDrawing:(id)a3 transcription:(id)a4
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_strokeCount(v5, v7, v8, v9, v10, v11);
  if (v6 && v12)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    double v13 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_DEBUG, "Style Sampling: Normalizing the style sample by applying rotation and resize transformations", buf, 2u);
    }

    uint64_t v19 = objc_msgSend_strokeCount(v5, v14, v15, v16, v17, v18);
    uint64_t v82 = objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x1E4F28D60], v20, 0, v19, v21, v22);
    v90[0] = v82;
    v83 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)v90, 1, v24, v25);
    id v89 = v6;
    v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)&v89, 1, v27, v28);
    v34 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v30, @"en_US", v31, v32, v33);
    v35 = objc_opt_class();
    uint64_t v37 = objc_msgSend_textLineForDrawing_transcriptions_strokeIndexes_fullText_locale_strokeClassification_shouldCancel_(v35, v36, (uint64_t)v5, (uint64_t)v29, (uint64_t)v83, (uint64_t)v6, v34, 1, &unk_1F2012BB0);
    v41 = (void *)v37;
    if (v37)
    {
      uint64_t v84 = v37;
      v42 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v38, (uint64_t)&v84, 1, v39, v40);
      v43 = objc_alloc_init(CHTransformationParameters);
      if ((unint64_t)objc_msgSend_length(v6, v44, v45, v46, v47, v48) >= 3) {
        objc_msgSend_setOrientationBehavior_(v43, v49, 2, v50, v51, v52);
      }
      objc_msgSend_setResizeBehavior_(v43, v49, 3, v50, v51, v52);
      objc_msgSend_normalizationTextHeight(CHSynthesisStyleSample, v53, v54, v55, v56, v57);
      objc_msgSend_setTextSizeTarget_(v43, v59, (unint64_t)v58, v60, v61, v62);
      objc_msgSend_setInsertionPoint_(v43, v63, v64, v65, v66, v67, 100.0, 100.0);
      v68 = objc_opt_class();
      objc_msgSend_transformTextLines_withParameters_(v68, v69, (uint64_t)v42, (uint64_t)v43, v70, v71);
      objc_msgSend_drawingForTransformedTextLines_(CHTextTransformationManager, v72, (uint64_t)v42, v73, v74, v75);
      id v76 = (id)objc_claimAutoreleasedReturnValue();
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v77 = (void *)v82;
      v78 = (id)qword_1EA3C9FD8;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1C492D000, v78, OS_LOG_TYPE_DEBUG, "Style Sampling: Return the new style sample with normalized drawing", buf, 2u);
      }
    }
    else
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v77 = (void *)v82;
      v80 = (id)qword_1EA3C9FD8;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412546;
        id v86 = v5;
        __int16 v87 = 2112;
        id v88 = v6;
        _os_log_impl(&dword_1C492D000, v80, OS_LOG_TYPE_DEBUG, "Transformed text line is nil for drawing %@ and transcription %@", buf, 0x16u);
      }

      id v76 = v5;
    }
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v79 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C492D000, v79, OS_LOG_TYPE_ERROR, "Style Sampling: Cannot transform style sample with nil or empty drawing or nil transcription", buf, 2u);
    }

    id v76 = v5;
  }

  return v76;
}

+ (id)normalizeStyleSample:(id)a3
{
  id v3 = a3;
  uint64_t v9 = objc_msgSend_drawing(v3, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_transcription(v3, v10, v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_normalizeDrawing_transcription_(CHSynthesisStyleSample, v16, (uint64_t)v9, (uint64_t)v15, v17, v18);

  uint64_t v25 = objc_msgSend_transcription(v3, v20, v21, v22, v23, v24);
  uint64_t v31 = objc_msgSend_strokeIdentifiers(v3, v26, v27, v28, v29, v30);
  v34 = objc_msgSend_sampleWithTranscription_drawing_strokeIdentifiers_(CHSynthesisStyleSample, v32, (uint64_t)v25, (uint64_t)v19, (uint64_t)v31, v33);

  return v34;
}

- (void)clearEmbeddingVector
{
  self->_embeddingVector.__end_ = self->_embeddingVector.__begin_;
}

- (BOOL)hasEmbeddingVector
{
  objc_msgSend_embeddingVector(self, a2, v2, v3, v4, v5);
  if (v7) {
    operator delete(v7);
  }
  return v8 != v7;
}

- (void)updateStyleEmbedding:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    objc_msgSend_floatMultiArrayToVector_(CHSynthesisStyleSample, v4, (uint64_t)v9, v6, v7, v8);
    objc_msgSend_setEmbeddingVector_(self, v10, (uint64_t)__p, v11, v12, v13);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    objc_msgSend_normalizeVector_(CHSynthesisStyleSample, v14, (uint64_t)&self->_embeddingVector, v15, v16, v17);
  }
  else
  {
    objc_msgSend_clearEmbeddingVector(self, v4, v5, v6, v7, v8);
  }
}

- (float)distanceToSample:(id)a3
{
  id v4 = a3;
  objc_msgSend_embeddingVector(self, v5, v6, v7, v8, v9);
  uint64_t v15 = v51;
  if (v51 != *(void **)buf)
  {
    if (!v4)
    {
      BOOL v27 = 0;
      goto LABEL_15;
    }
    objc_msgSend_embeddingVector(v4, v10, v11, v12, v13, v14);
    uint64_t v21 = v48;
    if (v48 == v47)
    {
      BOOL v27 = 0;
      if (!v48) {
        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend_embeddingVector(self, v16, v17, v18, v19, v20);
      objc_msgSend_embeddingVector(v4, v22, v23, v24, v25, v26);
      BOOL v27 = v46 - (void)__p == v44 - (void)v43;
      if (v43) {
        operator delete(v43);
      }
      if (__p) {
        operator delete(__p);
      }
      uint64_t v21 = v47;
      if (!v47)
      {
LABEL_15:
        uint64_t v15 = *(void **)buf;
        if (!*(void *)buf) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
    uint64_t v48 = v21;
    operator delete(v21);
    goto LABEL_15;
  }
  BOOL v27 = 0;
  if (v51)
  {
LABEL_16:
    uint64_t v51 = v15;
    operator delete(v15);
  }
LABEL_17:
  if (!v27)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v28 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C492D000, v28, OS_LOG_TYPE_FAULT, "While calculating distanceToSample, one of the embedding vectors is empty or not the same size as the other vector", buf, 2u);
    }
  }
  uint64_t v29 = objc_opt_class();
  objc_msgSend_embeddingVector(self, v30, v31, v32, v33, v34);
  if (v4)
  {
    objc_msgSend_embeddingVector(v4, v35, v36, v37, v38, v39);
  }
  else
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
  }
  objc_msgSend_distanceBetweenFirstVector_secondVector_(v29, v35, (uint64_t)buf, (uint64_t)&v47, v38, v39);
  float v41 = v40;
  if (v47)
  {
    uint64_t v48 = v47;
    operator delete(v47);
  }
  if (*(void *)buf)
  {
    uint64_t v51 = *(void **)buf;
    operator delete(*(void **)buf);
  }

  return v41;
}

- (float)cosineSimilarityToSample:(id)a3
{
  id v4 = a3;
  objc_msgSend_embeddingVector(self, v5, v6, v7, v8, v9);
  uint64_t v15 = v51;
  if (v51 != *(void **)buf)
  {
    if (!v4)
    {
      BOOL v27 = 0;
      goto LABEL_15;
    }
    objc_msgSend_embeddingVector(v4, v10, v11, v12, v13, v14);
    uint64_t v21 = v48;
    if (v48 == v47)
    {
      BOOL v27 = 0;
      if (!v48) {
        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend_embeddingVector(self, v16, v17, v18, v19, v20);
      objc_msgSend_embeddingVector(v4, v22, v23, v24, v25, v26);
      BOOL v27 = v46 - (void)__p == v44 - (void)v43;
      if (v43) {
        operator delete(v43);
      }
      if (__p) {
        operator delete(__p);
      }
      uint64_t v21 = v47;
      if (!v47)
      {
LABEL_15:
        uint64_t v15 = *(void **)buf;
        if (!*(void *)buf) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
    uint64_t v48 = v21;
    operator delete(v21);
    goto LABEL_15;
  }
  BOOL v27 = 0;
  if (v51)
  {
LABEL_16:
    uint64_t v51 = v15;
    operator delete(v15);
  }
LABEL_17:
  if (!v27)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v28 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C492D000, v28, OS_LOG_TYPE_FAULT, "While calculating cosineSimilarityToSample, one of the embedding vectors is emptyor not the same size as the other vector", buf, 2u);
    }
  }
  uint64_t v29 = objc_opt_class();
  objc_msgSend_embeddingVector(self, v30, v31, v32, v33, v34);
  if (v4)
  {
    objc_msgSend_embeddingVector(v4, v35, v36, v37, v38, v39);
  }
  else
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
  }
  objc_msgSend_cosineSimilarityBetweenFirstVector_secondVector_(v29, v35, (uint64_t)buf, (uint64_t)&v47, v38, v39);
  float v41 = v40;
  if (v47)
  {
    uint64_t v48 = v47;
    operator delete(v47);
  }
  if (*(void *)buf)
  {
    uint64_t v51 = *(void **)buf;
    operator delete(*(void **)buf);
  }

  return v41;
}

- (CHSynthesisStyleSample)initWithTranscription:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5 embeddingVector:(const void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CHSynthesisStyleSample;
  uint64_t v14 = [(CHSynthesisStyleSample *)&v29 init];
  uint64_t v15 = v14;
  uint64_t v16 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_transcription, a3);
    objc_storeStrong((id *)&v15->_drawing, a4);
    objc_storeStrong((id *)&v15->_strokeIdentifiers, a5);
    if (&v15->_embeddingVector != a6) {
      sub_1C499DEE4(&v15->_embeddingVector.__begin_, *(char **)a6, *((char **)a6 + 1), (uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 2);
    }
    uint64_t v22 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v17, v18, v19, v20, v21);
    creationDate = v16->_creationDate;
    v16->_creationDate = (NSDate *)v22;

    objc_msgSend_normalizeVector_(CHSynthesisStyleSample, v24, (uint64_t)&v15->_embeddingVector, v25, v26, v27);
  }

  return v16;
}

+ (id)sampleWithTranscription:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __p = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v10 = [CHSynthesisStyleSample alloc];
  id v12 = objc_msgSend_initWithTranscription_drawing_strokeIdentifiers_embeddingVector_(v10, v11, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)&__p);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }

  return v12;
}

+ (id)sampleWithTranscription:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5 embeddingVector:(const void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [CHSynthesisStyleSample alloc];
  uint64_t v14 = objc_msgSend_initWithTranscription_drawing_strokeIdentifiers_embeddingVector_(v12, v13, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)a6);

  return v14;
}

- (CHSynthesisStyleSample)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"transcription", v7, v8);
  uint64_t v10 = objc_opt_class();
  uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"drawing", v12, v13);
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v22 = objc_msgSend_setWithObjects_(v15, v18, v16, v19, v20, v21, v17, 0);
  uint64_t v26 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, @"strokeIdentifiers", v24, v25);
  uint64_t v27 = objc_opt_class();
  uint64_t v31 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v28, v27, @"embeddingVector", v29, v30);
  objc_msgSend_floatArrayToVector_(CHSynthesisStyleSample, v32, (uint64_t)v31, v33, v34, v35);
  float v41 = (CHSynthesisStyleSample *)objc_msgSend_initWithTranscription_drawing_strokeIdentifiers_embeddingVector_(self, v36, (uint64_t)v9, (uint64_t)v14, (uint64_t)v26, (uint64_t)__p);
  if (v41)
  {
    v41->_creationTimestep = objc_msgSend_decodeIntegerForKey_(v4, v37, @"creationTimestep", v38, v39, v40);
    v41->_samplingCount = objc_msgSend_decodeIntegerForKey_(v4, v42, @"samplingCount", v43, v44, v45);
    uint64_t v46 = objc_opt_class();
    uint64_t v50 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"creationDate", v48, v49);
    creationDate = v41->_creationDate;
    v41->_creationDate = (NSDate *)v50;
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v41;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  objc_msgSend_encodeObject_forKey_(v30, v4, (uint64_t)self->_transcription, @"transcription", v5, v6);
  objc_msgSend_encodeObject_forKey_(v30, v7, (uint64_t)self->_drawing, @"drawing", v8, v9);
  objc_msgSend_encodeObject_forKey_(v30, v10, (uint64_t)self->_strokeIdentifiers, @"strokeIdentifiers", v11, v12);
  uint64_t v17 = objc_msgSend_floatVectorToArray_(CHSynthesisStyleSample, v13, (uint64_t)&self->_embeddingVector, v14, v15, v16);
  objc_msgSend_encodeObject_forKey_(v30, v18, (uint64_t)v17, @"embeddingVector", v19, v20);

  objc_msgSend_encodeInteger_forKey_(v30, v21, self->_creationTimestep, @"creationTimestep", v22, v23);
  objc_msgSend_encodeInteger_forKey_(v30, v24, self->_samplingCount, @"samplingCount", v25, v26);
  objc_msgSend_encodeObject_forKey_(v30, v27, (uint64_t)self->_creationDate, @"creationDate", v28, v29);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = self;
  uint64_t v9 = objc_msgSend_transcription(v3, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_drawing(v3, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_strokeIdentifiers(v3, v16, v17, v18, v19, v20);
  objc_msgSend_embeddingVector(v3, v22, v23, v24, v25, v26);
  uint64_t v28 = objc_msgSend_initWithTranscription_drawing_strokeIdentifiers_embeddingVector_(v3, v27, (uint64_t)v9, (uint64_t)v15, (uint64_t)v21, (uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (v28)
  {
    uint64_t v34 = objc_msgSend_creationTimestep(v3, v29, v30, v31, v32, v33);
    objc_msgSend_setCreationTimestep_(v28, v35, v34, v36, v37, v38);
    uint64_t v44 = objc_msgSend_samplingCount(v3, v39, v40, v41, v42, v43);
    objc_msgSend_setSamplingCount_(v28, v45, v44, v46, v47, v48);
  }
  return v28;
}

+ (id)characterCoverageWithString:(id)a3
{
  id v3 = a3;
  uint64_t v9 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_length(v3, v10, v11, v12, v13, v14);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4A0D9B8;
  v27[3] = &unk_1E64E0E38;
  id v16 = v9;
  id v28 = v16;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v3, v17, 0, v15, 2, (uint64_t)v27);
  if (objc_msgSend_containsObject_(v16, v18, @" ", v19, v20, v21)) {
    objc_msgSend_removeObject_(v16, v22, @" ", v23, v24, v25);
  }

  return v16;
}

- (id)characterCoverage
{
  uint64_t v6 = objc_msgSend_transcription(self, a2, v2, v3, v4, v5);
  uint64_t v11 = objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v7, (uint64_t)v6, v8, v9, v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CHSynthesisStyleSample *)a3;
  if (self == v4)
  {
    char isEqualToDate = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v11 = objc_msgSend_drawing(self, v6, v7, v8, v9, v10);
      uint64_t v17 = objc_msgSend_drawing(v5, v12, v13, v14, v15, v16);
      int isEqualToDrawing = objc_msgSend_isEqualToDrawing_(v11, v18, (uint64_t)v17, v19, v20, v21);

      if (!isEqualToDrawing) {
        goto LABEL_29;
      }
      id v28 = objc_msgSend_transcription(self, v23, v24, v25, v26, v27);
      uint64_t v34 = objc_msgSend_transcription(v5, v29, v30, v31, v32, v33);
      int isEqualToString = objc_msgSend_isEqualToString_(v28, v35, (uint64_t)v34, v36, v37, v38);

      if (!isEqualToString) {
        goto LABEL_29;
      }
      uint64_t v45 = objc_msgSend_strokeIdentifiers(self, v40, v41, v42, v43, v44);
      uint64_t v51 = objc_msgSend_strokeIdentifiers(v5, v46, v47, v48, v49, v50);
      int isEqualToSet = objc_msgSend_isEqualToSet_(v45, v52, (uint64_t)v51, v53, v54, v55);

      if (!isEqualToSet) {
        goto LABEL_29;
      }
      objc_msgSend_embeddingVector(self, v57, v58, v59, v60, v61);
      if (v5)
      {
        objc_msgSend_embeddingVector(v5, v62, v63, v64, v65, v66);
        uint64_t v67 = v110;
        v68 = v112;
        v69 = v113;
        if ((char *)v113 - v112 == v111 - (void)v110) {
          goto LABEL_8;
        }
      }
      else
      {
        uint64_t v67 = 0;
        v68 = v112;
        v69 = v113;
        if (v113 == (float *)v112)
        {
LABEL_8:
          if (v68 == (char *)v69)
          {
            BOOL v73 = 1;
          }
          else
          {
            uint64_t v70 = (float *)(v68 + 4);
            uint64_t v71 = v67;
            do
            {
              float v72 = *v71++;
              BOOL v73 = *(v70 - 1) == v72;
              BOOL v74 = *(v70 - 1) != v72 || v70 == v69;
              ++v70;
            }
            while (!v74);
          }
LABEL_21:
          if (v67)
          {
            operator delete(v67);
            v68 = v112;
          }
          if (v68) {
            operator delete(v68);
          }
          if (v73)
          {
            uint64_t v76 = objc_msgSend_creationTimestep(self, v62, v63, v64, v65, v66);
            if (v76 == objc_msgSend_creationTimestep(v5, v77, v78, v79, v80, v81))
            {
              uint64_t v87 = objc_msgSend_samplingCount(self, v82, v83, v84, v85, v86);
              if (v87 == objc_msgSend_samplingCount(v5, v88, v89, v90, v91, v92))
              {
                v98 = objc_msgSend_creationDate(self, v93, v94, v95, v96, v97);
                v104 = objc_msgSend_creationDate(v5, v99, v100, v101, v102, v103);
                char isEqualToDate = objc_msgSend_isEqualToDate_(v98, v105, (uint64_t)v104, v106, v107, v108);

LABEL_30:
                goto LABEL_31;
              }
            }
          }
LABEL_29:
          char isEqualToDate = 0;
          goto LABEL_30;
        }
      }
      BOOL v73 = 0;
      goto LABEL_21;
    }
    char isEqualToDate = 0;
  }
LABEL_31:

  return isEqualToDate;
}

- (void)incrementSamplingCount
{
  uint64_t v8 = objc_msgSend_samplingCount(self, a2, v2, v3, v4, v5) + 1;
  objc_msgSend_setSamplingCount_(self, v7, v8, v9, v10, v11);
}

- (void)shiftTimestepsByOffset:(int64_t)a3
{
  uint64_t v8 = objc_msgSend_creationTimestep(self, a2, a3, v3, v4, v5);
  uint64_t v13 = objc_msgSend_shiftTimestep_offset_(CHSynthesisStyleSample, v9, v8, a3, v10, v11);
  objc_msgSend_setCreationTimestep_(self, v12, v13, v14, v15, v16);
}

+ (int64_t)shiftTimestep:(int64_t)a3 offset:(int64_t)a4
{
  if (a4 < 0)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v6 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_FAULT, "Offset must be zero or positive", v8, 2u);
    }
  }
  if (a4 >= 0) {
    return a3 - a4;
  }
  else {
    return 0x8000000000000000;
  }
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (NSString)transcription
{
  return self->_transcription;
}

- (vector<float,)embeddingVector
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  end = self[2].__end_;
  value = self[2].__end_cap_.__value_;
  int64_t v6 = (char *)value - (char *)end;
  if (value != end)
  {
    if (v6 < 0) {
      sub_1C494A220();
    }
    uint64_t v7 = (float *)operator new((char *)value - (char *)end);
    retstr->__begin_ = v7;
    uint64_t v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, end, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (void)setEmbeddingVector:()vector<float
{
  p_embeddingVector = &self->_embeddingVector;
  if (p_embeddingVector != a3) {
    sub_1C499DEE4(p_embeddingVector, (char *)a3->__begin_, (char *)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (int64_t)creationTimestep
{
  return self->_creationTimestep;
}

- (void)setCreationTimestep:(int64_t)a3
{
  self->_creationTimestep = a3;
}

- (int64_t)samplingCount
{
  return self->_samplingCount;
}

- (void)setSamplingCount:(int64_t)a3
{
  self->_samplingCount = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (void).cxx_destruct
{
  begin = self->_embeddingVector.__begin_;
  if (begin)
  {
    self->_embeddingVector.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  return self;
}

@end