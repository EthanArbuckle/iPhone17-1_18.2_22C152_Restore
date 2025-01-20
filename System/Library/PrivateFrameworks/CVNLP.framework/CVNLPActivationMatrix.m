@interface CVNLPActivationMatrix
- ($FD4688982923A924290ECB669CAF1EC2)_espressoBuffer;
- ($FD4688982923A924290ECB669CAF1EC2)_indexBuffer;
- (BOOL)_isDoubleDataType;
- (BOOL)_usingIndexes;
- (CVNLPActivationMatrix)initWithBuffer:(id *)a3 domainType:(int64_t)a4 characterObservations:(id)a5 blankIndex:(int64_t)a6 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a7;
- (CVNLPActivationMatrix)initWithBuffer:(id *)a3 indexBuffer:(id *)a4 domainType:(int64_t)a5 characterObservations:(id)a6 blankIndex:(int64_t)a7 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a8;
- (CVNLPActivationMatrix)initWithMultiArray:(id)a3 characterObservations:(id)a4 blankIndex:(int64_t)a5 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a6;
- (CVNLPActivationMatrix)initWithMultiArray:(id)a3 domainType:(int64_t)a4 characterObservations:(id)a5 blankIndex:(int64_t)a6 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a7;
- (CVNLPActivationMatrix)initWithMultiArray:(id)a3 indexArray:(id)a4 domainType:(int64_t)a5 characterObservations:(id)a6 blankIndex:(int64_t)a7 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a8;
- (CVNLPTextDecodingPruningPolicy)_pruningPolicy;
- (MLMultiArray)_indexArray;
- (MLMultiArray)_multiArray;
- (MLMultiArray)getActivationsMultiArray;
- (MLMultiArray)getIndicesMultiArray;
- (NSOrderedSet)characterObservations;
- (double)_doubleScoreMatrix;
- (double)_valueForObservationIndex:(int64_t)a3 timestep:(int64_t)a4;
- (double)logProbabilityForBlankAtTimestep:(int64_t)a3;
- (double)logProbabilityForObservationIndex:(int64_t)a3 timestep:(int64_t)a4;
- (double)probabilityForBlankAtTimestep:(int64_t)a3;
- (double)probabilityForObservationIndex:(int64_t)a3 timestep:(int64_t)a4;
- (id)_candidateSymbolAtIndex:(int64_t)a3 forTimestep:(int64_t)a4 outputScore:(double *)a5;
- (id)debugDescription;
- (id)topCandidateForTimestep:(int64_t)a3 outputLogProbability:(double *)a4;
- (id)topCandidateForTimestep:(int64_t)a3 outputLogProbability:(double *)a4 outputIndex:(int64_t *)a5;
- (id)topCandidateForTimestep:(int64_t)a3 outputProbability:(double *)a4 outputIndex:(int64_t *)a5;
- (int64_t)_cachedBlankIndex;
- (int64_t)_cachedBlankIndexTimestep;
- (int64_t)_cachedPriorityQueueTimestep;
- (int64_t)_observationCount;
- (int64_t)_observationStride;
- (int64_t)_timeStride;
- (int64_t)_timestepCount;
- (int64_t)_type;
- (int64_t)blankIndex;
- (int64_t)blankIndexForTimestep:(int64_t)a3;
- (int64_t)characterIndexForObservationIndex:(int64_t)a3 timestep:(int64_t)a4;
- (int64_t)domainType;
- (int64_t)observationCount;
- (int64_t)timestepCount;
- (void)_cachedTimesample;
- (void)_enumerateNonBlankCandidatesInTimestep:(int64_t)a3 block:(id)a4;
- (void)_sortNonBlankCandidatesForTimestep:(int64_t)a3;
- (void)dealloc;
- (void)enumerateNonBlankCandidatesInTimestep:(int64_t)a3 block:(id)a4;
- (void)setBlankIndex:(int64_t)a3;
- (void)setCharacterObservations:(id)a3;
- (void)set_cachedPriorityQueueTimestep:(int64_t)a3;
- (void)set_cachedTimesample:(void *)a3;
- (void)set_doubleScoreMatrix:(double *)a3;
- (void)set_espressoBuffer:(id *)a3;
- (void)set_indexArray:(id)a3;
- (void)set_indexBuffer:(id *)a3;
- (void)set_isDoubleDataType:(BOOL)a3;
- (void)set_multiArray:(id)a3;
- (void)set_observationCount:(int64_t)a3;
- (void)set_observationStride:(int64_t)a3;
- (void)set_pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a3;
- (void)set_timeStride:(int64_t)a3;
- (void)set_timestepCount:(int64_t)a3;
- (void)set_type:(int64_t)a3;
- (void)set_usingIndexes:(BOOL)a3;
@end

@implementation CVNLPActivationMatrix

- (CVNLPActivationMatrix)initWithBuffer:(id *)a3 domainType:(int64_t)a4 characterObservations:(id)a5 blankIndex:(int64_t)a6 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a7
{
  id v13 = a5;
  unint64_t var6 = a3->var6;
  unint64_t var8 = a3->var8;
  v30.receiver = self;
  v30.super_class = (Class)CVNLPActivationMatrix;
  v16 = [(CVNLPActivationMatrix *)&v30 init];
  v17 = v16;
  if (v16)
  {
    long long v18 = *(_OWORD *)&a3->var0;
    long long v19 = *(_OWORD *)&a3->var2[2];
    *(_OWORD *)v16->$70B10377DC9035999D77C63B14D421A0::dim = *(_OWORD *)a3->var2;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::dim[2] = v19;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::data = v18;
    long long v20 = *(_OWORD *)a3->var3;
    long long v21 = *(_OWORD *)&a3->var3[2];
    long long v22 = *(_OWORD *)&a3->var6;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::width = *(_OWORD *)&a3->var4;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::channels = v22;
    *(_OWORD *)v16->$70B10377DC9035999D77C63B14D421A0::stride = v20;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::stride[2] = v21;
    long long v23 = *(_OWORD *)&a3->var8;
    long long v24 = *(_OWORD *)&a3->var10;
    long long v25 = *(_OWORD *)&a3->var12;
    *(void *)&v16->$70B10377DC9035999D77C63B14D421A0::storage_type = *(void *)&a3->var14;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::stride_height = v24;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::stride_batch_number = v25;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::sequence_length = v23;
    v16->__doubleScoreMatrix = 0;
    v16->__timestepCount = var8;
    objc_storeStrong((id *)&v16->_characterObservations, a5);
    v17->__observationCount = var6;
    v17->__timeStride = a3->var13;
    unint64_t var11 = a3->var11;
    v17->_blankIndex = a6;
    v17->__observationStride = var11;
    v17->__type = 1;
    long long v27 = *(_OWORD *)&a7->strategy;
    *(void *)&v17->__pruningPolicy.maxNumberOfCandidates = *(void *)&a7->maxNumberOfCandidates;
    *(_OWORD *)&v17->__pruningPolicy.strategy = v27;
    v17->__cachedPriorityQueueTimestep = -1;
    v17->_domainType = a4;
    v17->__isDoubleDataType = 0;
    indexArray = v17->__indexArray;
    v17->__indexArray = 0;

    v17->__usingIndexes = 0;
    v17->__cachedBlankIndexTimestep = -1;
  }

  return v17;
}

- (CVNLPActivationMatrix)initWithBuffer:(id *)a3 indexBuffer:(id *)a4 domainType:(int64_t)a5 characterObservations:(id)a6 blankIndex:(int64_t)a7 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a8
{
  long long v9 = *(_OWORD *)&a3->var12;
  v24[8] = *(_OWORD *)&a3->var10;
  v24[9] = v9;
  uint64_t v25 = *(void *)&a3->var14;
  long long v10 = *(_OWORD *)&a3->var4;
  v24[4] = *(_OWORD *)&a3->var3[2];
  v24[5] = v10;
  long long v11 = *(_OWORD *)&a3->var8;
  v24[6] = *(_OWORD *)&a3->var6;
  v24[7] = v11;
  long long v12 = *(_OWORD *)a3->var2;
  v24[0] = *(_OWORD *)&a3->var0;
  v24[1] = v12;
  long long v13 = *(_OWORD *)a3->var3;
  v24[2] = *(_OWORD *)&a3->var2[2];
  v24[3] = v13;
  CVNLPTextDecodingPruningPolicy v23 = *a8;
  result = (CVNLPActivationMatrix *)objc_msgSend_initWithBuffer_domainType_characterObservations_blankIndex_pruningPolicy_(self, a2, (uint64_t)v24, a5, a6, a7, &v23);
  if (result)
  {
    long long v15 = *(_OWORD *)&a4->var0;
    long long v16 = *(_OWORD *)&a4->var2[2];
    *(_OWORD *)result->$70B10377DC9035999D77C63B14D421A0::dim = *(_OWORD *)a4->var2;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::dim[2] = v16;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::data = v15;
    long long v17 = *(_OWORD *)a4->var3;
    long long v18 = *(_OWORD *)&a4->var3[2];
    long long v19 = *(_OWORD *)&a4->var6;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::width = *(_OWORD *)&a4->var4;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::channels = v19;
    *(_OWORD *)result->$70B10377DC9035999D77C63B14D421A0::stride = v17;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::stride[2] = v18;
    long long v20 = *(_OWORD *)&a4->var8;
    long long v21 = *(_OWORD *)&a4->var10;
    long long v22 = *(_OWORD *)&a4->var12;
    *(void *)&result->$70B10377DC9035999D77C63B14D421A0::storage_type = *(void *)&a4->var14;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::stride_height = v21;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::stride_batch_number = v22;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::sequence_length = v20;
    result->__usingIndexes = a4->var0 != 0;
  }
  return result;
}

- (CVNLPActivationMatrix)initWithMultiArray:(id)a3 domainType:(int64_t)a4 characterObservations:(id)a5 blankIndex:(int64_t)a6 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a7
{
  id v12 = a3;
  id v71 = a5;
  long long v16 = objc_msgSend_shape(v12, v13, v14, v15);
  objc_msgSend_count(v16, v17, v18, v19);

  CVNLPTextDecodingPruningPolicy v23 = objc_msgSend_shape(v12, v20, v21, v22);
  v26 = objc_msgSend_objectAtIndexedSubscript_(v23, v24, 1, v25);
  uint64_t v30 = objc_msgSend_integerValue(v26, v27, v28, v29);

  v34 = objc_msgSend_shape(v12, v31, v32, v33);
  v37 = objc_msgSend_objectAtIndexedSubscript_(v34, v35, 0, v36);
  uint64_t v41 = objc_msgSend_integerValue(v37, v38, v39, v40);

  v72.receiver = self;
  v72.super_class = (Class)CVNLPActivationMatrix;
  v42 = [(CVNLPActivationMatrix *)&v72 init];
  v43 = v42;
  if (v42)
  {
    objc_storeStrong((id *)&v42->__multiArray, a3);
    v43->__timestepCount = v41;
    v43->__observationCount = v30;
    v47 = objc_msgSend_strides(v12, v44, v45, v46);
    v50 = objc_msgSend_objectAtIndexedSubscript_(v47, v48, 0, v49);
    v43->__timeStride = objc_msgSend_integerValue(v50, v51, v52, v53);

    v57 = objc_msgSend_strides(v12, v54, v55, v56);
    v60 = objc_msgSend_objectAtIndexedSubscript_(v57, v58, 1, v59);
    v43->__observationStride = objc_msgSend_integerValue(v60, v61, v62, v63);

    objc_storeStrong((id *)&v43->_characterObservations, a5);
    v43->_blankIndex = a6;
    v43->__type = 0;
    long long v64 = *(_OWORD *)&a7->strategy;
    *(void *)&v43->__pruningPolicy.maxNumberOfCandidates = *(void *)&a7->maxNumberOfCandidates;
    *(_OWORD *)&v43->__pruningPolicy.strategy = v64;
    v43->__cachedPriorityQueueTimestep = -1;
    v43->_domainType = a4;
    v43->__isDoubleDataType = objc_msgSend_dataType(v43->__multiArray, v65, v66, v67) == 65600;
    v43->__usingIndexes = 0;
    indexArray = v43->__indexArray;
    v43->__indexArray = 0;

    v43->__cachedBlankIndexTimestep = -1;
  }

  return v43;
}

- (CVNLPActivationMatrix)initWithMultiArray:(id)a3 characterObservations:(id)a4 blankIndex:(int64_t)a5 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a6
{
  CVNLPTextDecodingPruningPolicy v7 = *a6;
  return (CVNLPActivationMatrix *)objc_msgSend_initWithMultiArray_domainType_characterObservations_blankIndex_pruningPolicy_(self, a2, (uint64_t)a3, 0, a4, a5, &v7);
}

- (CVNLPActivationMatrix)initWithMultiArray:(id)a3 indexArray:(id)a4 domainType:(int64_t)a5 characterObservations:(id)a6 blankIndex:(int64_t)a7 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a8
{
  id v15 = a4;
  CVNLPTextDecodingPruningPolicy v20 = *a8;
  uint64_t v17 = objc_msgSend_initWithMultiArray_domainType_characterObservations_blankIndex_pruningPolicy_(self, v16, (uint64_t)a3, a5, a6, a7, &v20);
  uint64_t v18 = (CVNLPActivationMatrix *)v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 56), a4);
    v18->__usingIndexes = v15 != 0;
  }

  return v18;
}

- (void)dealloc
{
  if (objc_msgSend__cachedTimesample(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend__cachedTimesample(self, v5, v6, v7);
    uint64_t v11 = v8;
    if (v8)
    {
      id v12 = *(void **)(v8 + 40);
      if (v12)
      {
        *(void *)(v11 + 48) = v12;
        operator delete(v12);
      }
      long long v13 = *(void **)v11;
      if (*(void *)v11)
      {
        *(void *)(v11 + 8) = v13;
        operator delete(v13);
      }
      MEMORY[0x1BA9929C0](v11, 0x1020C40A634FBC0);
    }
    objc_msgSend_set_cachedTimesample_(self, v9, 0, v10);
  }
  v14.receiver = self;
  v14.super_class = (Class)CVNLPActivationMatrix;
  [(CVNLPActivationMatrix *)&v14 dealloc];
}

- (MLMultiArray)getActivationsMultiArray
{
  return self->__multiArray;
}

- (MLMultiArray)getIndicesMultiArray
{
  return self->__indexArray;
}

- (int64_t)timestepCount
{
  return self->__timestepCount;
}

- (int64_t)observationCount
{
  return self->__observationCount;
}

- (double)probabilityForObservationIndex:(int64_t)a3 timestep:(int64_t)a4
{
  objc_msgSend__valueForObservationIndex_timestep_(self, a2, a3, a4);
  int64_t domainType = self->_domainType;
  if (domainType == 1) {
    return exp(result);
  }
  if (domainType) {
    return 0.0;
  }
  return result;
}

- (double)logProbabilityForObservationIndex:(int64_t)a3 timestep:(int64_t)a4
{
  objc_msgSend__valueForObservationIndex_timestep_(self, a2, a3, a4);
  int64_t domainType = self->_domainType;
  if (domainType == 1) {
    return v5;
  }
  double v7 = 0.0;
  if (!domainType) {
    return log(v5);
  }
  return v7;
}

- (double)_valueForObservationIndex:(int64_t)a3 timestep:(int64_t)a4
{
  int64_t v4 = self->__observationStride * a3 + self->__timeStride * a4;
  int64_t type = self->__type;
  if (type == 1) {
    return *((float *)self->$70B10377DC9035999D77C63B14D421A0::data + v4);
  }
  double result = 0.0;
  if (!type)
  {
    BOOL isDoubleDataType = self->__isDoubleDataType;
    uint64_t v8 = objc_msgSend_dataPointer(self->__multiArray, a2, a3, a4, 0.0);
    if (isDoubleDataType) {
      return *(double *)(v8 + 8 * v4);
    }
    else {
      return *(float *)(v8 + 4 * v4);
    }
  }
  return result;
}

- (int64_t)blankIndexForTimestep:(int64_t)a3
{
  if (!self->__usingIndexes) {
    return self->_blankIndex;
  }
  if (self->__cachedBlankIndexTimestep != a3)
  {
    self->__cachedBlankIndex = -1;
    if (self->__observationCount >= 1)
    {
      uint64_t v5 = 0;
      while (objc_msgSend_characterIndexForObservationIndex_timestep_(self, a2, v5, a3) != self->_blankIndex)
      {
        if (++v5 >= self->__observationCount) {
          goto LABEL_10;
        }
      }
      self->__cachedBlankIndex = v5;
    }
LABEL_10:
    self->__cachedBlankIndexTimestep = a3;
  }
  return self->__cachedBlankIndex;
}

- (double)probabilityForBlankAtTimestep:(int64_t)a3
{
  uint64_t v6 = objc_msgSend_blankIndexForTimestep_(self, a2, a3, v3);
  if (v6 == -1) {
    return 0.01;
  }
  objc_msgSend_probabilityForObservationIndex_timestep_(self, v7, v6, a3);
  return result;
}

- (double)logProbabilityForBlankAtTimestep:(int64_t)a3
{
  uint64_t v6 = objc_msgSend_blankIndexForTimestep_(self, a2, a3, v3);
  if (v6 == -1) {
    return -4.60517019;
  }
  objc_msgSend_logProbabilityForObservationIndex_timestep_(self, v7, v6, a3);
  return result;
}

- (int64_t)characterIndexForObservationIndex:(int64_t)a3 timestep:(int64_t)a4
{
  if (!self->__usingIndexes) {
    return a3;
  }
  int64_t v4 = self->__observationStride * a3 + self->__timeStride * a4;
  int64_t type = self->__type;
  if (type == 1) {
    return (uint64_t)*((float *)self->$70B10377DC9035999D77C63B14D421A0::data + v4);
  }
  if (type) {
    return a3;
  }
  BOOL isDoubleDataType = self->__isDoubleDataType;
  uint64_t v7 = objc_msgSend_dataPointer(self->__indexArray, a2, a3, a4);
  if (isDoubleDataType) {
    return (uint64_t)*(double *)(v7 + 8 * v4);
  }
  return (uint64_t)*(float *)(v7 + 4 * v4);
}

- (void)enumerateNonBlankCandidatesInTimestep:(int64_t)a3 block:(id)a4
{
  id v8 = a4;
  if (self->__pruningPolicy.shouldSort && self->__cachedPriorityQueueTimestep != a3 && !self->__usingIndexes) {
    objc_msgSend__sortNonBlankCandidatesForTimestep_(self, v6, a3, v7);
  }
  objc_msgSend__enumerateNonBlankCandidatesInTimestep_block_(self, v6, a3, (uint64_t)v8);
}

- (id)_candidateSymbolAtIndex:(int64_t)a3 forTimestep:(int64_t)a4 outputScore:(double *)a5
{
  if (self->__pruningPolicy.shouldSort && !self->__usingIndexes)
  {
    long long v16 = (void *)sub_1B4C3AF34((uint64_t)self->__cachedTimesample, (uint64_t)&self->__pruningPolicy, 0.0);
    if (a3 >= (unint64_t)((uint64_t)(v16[1] - *v16) >> 3)) {
      sub_1B4C3C148();
    }
    uint64_t v17 = (float *)(*v16 + 8 * a3);
    *a5 = v17[1];
    uint64_t v9 = *(unsigned int *)v17;
  }
  else
  {
    uint64_t v9 = objc_msgSend_characterIndexForObservationIndex_timestep_(self, a2, a3, a4);
    objc_msgSend__valueForObservationIndex_timestep_(self, v10, a3, a4);
    *(void *)a5 = v13;
    if (v9 == -1)
    {
      objc_super v14 = 0;
      return v14;
    }
  }
  objc_super v14 = objc_msgSend_objectAtIndexedSubscript_(self->_characterObservations, v11, v9, v12);
  return v14;
}

- (void)_enumerateNonBlankCandidatesInTimestep:(int64_t)a3 block:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, unsigned char *, double))a4;
  char v34 = 0;
  uint64_t v10 = objc_msgSend_blankIndexForTimestep_(self, v7, a3, v8);
  if (v10 == -1)
  {
    int64_t domainType = self->_domainType;
    double v16 = -4.60517019;
    if (domainType != 1) {
      double v16 = 0.0;
    }
    if (domainType) {
      double v12 = v16;
    }
    else {
      double v12 = 0.01;
    }
    int64_t observationCount = self->__observationCount;
    p_pruningPolicy = &self->__pruningPolicy;
    if (!self->__pruningPolicy.shouldSort) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend__valueForObservationIndex_timestep_(self, v9, v10, a3);
    double v12 = v11;
    int64_t observationCount = self->__observationCount;
    p_pruningPolicy = &self->__pruningPolicy;
    if (!self->__pruningPolicy.shouldSort) {
      goto LABEL_11;
    }
  }
  if (!self->__usingIndexes)
  {
    float v31 = v12;
    uint64_t v32 = (void *)sub_1B4C3AF34((uint64_t)self->__cachedTimesample, (uint64_t)p_pruningPolicy, v31);
    int64_t observationCount = (uint64_t)(v32[1] - *v32) >> 3;
    if (observationCount >= 1) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_11:
  if (observationCount >= 1)
  {
LABEL_12:
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    int64_t strategy = p_pruningPolicy->strategy;
    while (1)
    {
      if (v18 >= self->__pruningPolicy.maxNumberOfCandidates || !strategy && v12 > self->__pruningPolicy.threshold) {
        goto LABEL_46;
      }
      if (v10 != v17 || self->__pruningPolicy.shouldSort && !self->__usingIndexes) {
        break;
      }
LABEL_16:
      if (observationCount == ++v17) {
        goto LABEL_46;
      }
    }
    double v33 = 0.0;
    uint64_t v21 = objc_msgSend__candidateSymbolAtIndex_forTimestep_outputScore_(self, v9, v17, a3, &v33);
    if (!v21)
    {
LABEL_15:

      goto LABEL_16;
    }
    int64_t v22 = self->_domainType;
    if (v22)
    {
      if (v22 == 1)
      {
        double v23 = v33;
        double v24 = fmax(v12, v33);
        double v25 = fmin(v12, v33);
        if (v25 >= -1021.0)
        {
          long double v26 = exp(v25 - v24);
          double v12 = log1p(v26) + v24;
          if (strategy != 1)
          {
LABEL_35:
            v6[2](v6, v21, &v34, v23);
            ++v18;
            if (strategy != 1) {
              goto LABEL_13;
            }
            int64_t v22 = self->_domainType;
LABEL_37:
            if (v22 == 1)
            {
              double threshold = self->__pruningPolicy.threshold;
              double v28 = fmax(v12, threshold);
              double v29 = fmin(v12, threshold);
              if (v29 >= -1021.0)
              {
                long double v30 = exp(v29 - v28);
                double v28 = log1p(v30) + v28;
              }
              BOOL v20 = v28 > 0.0;
              if (v34)
              {
LABEL_44:

                goto LABEL_46;
              }
              goto LABEL_14;
            }
            if (!v22)
            {
              BOOL v20 = v12 + self->__pruningPolicy.threshold > 1.0;
              if (v34) {
                goto LABEL_44;
              }
              goto LABEL_14;
            }
LABEL_13:
            BOOL v20 = 0;
            if (v34) {
              goto LABEL_44;
            }
LABEL_14:
            if (v20) {
              goto LABEL_44;
            }
            goto LABEL_15;
          }
        }
        else
        {
          double v12 = v24;
          if (strategy != 1) {
            goto LABEL_35;
          }
        }
      }
      else
      {
        double v23 = v33;
        if (strategy != 1) {
          goto LABEL_35;
        }
      }
    }
    else
    {
      double v23 = v33;
      double v12 = v33 + v12;
      if (strategy != 1) {
        goto LABEL_35;
      }
    }
    if (v23 <= self->__pruningPolicy.threshold) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
LABEL_46:
}

- (void)_sortNonBlankCandidatesForTimestep:(int64_t)a3
{
  cachedTimesample = (void **)self->__cachedTimesample;
  if (cachedTimesample)
  {
    uint64_t v5 = cachedTimesample[5];
    if (v5)
    {
      cachedTimesample[6] = v5;
      operator delete(v5);
    }
    uint64_t v6 = *cachedTimesample;
    if (*cachedTimesample)
    {
      cachedTimesample[1] = v6;
      operator delete(v6);
    }
    MEMORY[0x1BA9929C0](cachedTimesample, 0x1020C40A634FBC0, a3);
    self->__cachedPriorityQueueTimestep = -1;
    self->__cachedTimesample = 0;
  }
  operator new();
}

- (id)topCandidateForTimestep:(int64_t)a3 outputLogProbability:(double *)a4
{
  return (id)objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self, a2, a3, (uint64_t)a4, 0);
}

- (id)topCandidateForTimestep:(int64_t)a3 outputLogProbability:(double *)a4 outputIndex:(int64_t *)a5
{
  if (self->__usingIndexes)
  {
    if (a4)
    {
      objc_msgSend_logProbabilityForObservationIndex_timestep_(self, a2, 0, a3);
      *(void *)a4 = v9;
    }
    int64_t v10 = objc_msgSend_characterIndexForObservationIndex_timestep_(self, a2, 0, a3);
    if (a5) {
      *a5 = v10;
    }
    objc_msgSend_objectAtIndexedSubscript_(self->_characterObservations, v11, v10, v12);
    goto LABEL_40;
  }
  if (self->__cachedPriorityQueueTimestep == a3)
  {
    cachedTimesample = self->__cachedTimesample;
    if (cachedTimesample)
    {
      if (*((void *)self->__cachedTimesample + 1) != *cachedTimesample)
      {
        objc_msgSend_logProbabilityForBlankAtTimestep_(self, a2, a3, (uint64_t)a4);
        double v17 = v16;
        unint64_t v18 = *(float **)self->__cachedTimesample;
        int64_t v19 = *(unsigned int *)v18;
        float v20 = v18[1];
        int64_t domainType = self->_domainType;
        if (domainType != 1)
        {
          if (domainType)
          {
LABEL_43:
            if (a4)
            {
              double v42 = 1.0;
              if (v17 == 0.0) {
                double v42 = v17;
              }
              *a4 = v42;
            }
            if (a5) {
              *a5 = self->_blankIndex;
            }
            objc_msgSend_objectAtIndexedSubscript_(self->_characterObservations, v14, self->_blankIndex, v15);
            goto LABEL_40;
          }
          float v20 = logf(v20);
        }
        float v22 = 0.0;
        if (v17 != 0.0) {
          float v22 = 1.0;
        }
        if (v20 > v22)
        {
          if (a4) {
            *a4 = v20;
          }
          if (a5) {
            *a5 = v19;
          }
          objc_msgSend_objectAtIndexedSubscript_(self->_characterObservations, v14, v19, v15);
          goto LABEL_40;
        }
        goto LABEL_43;
      }
    }
  }
  uint64_t v26 = objc_msgSend_blankIndexForTimestep_(self, a2, a3, (uint64_t)a4);
  if (v26 == -1)
  {
    double v28 = 0.01;
    if (objc_msgSend_observationCount(self, v23, v24, v25) < 1) {
      goto LABEL_34;
    }
  }
  else
  {
    objc_msgSend_probabilityForObservationIndex_timestep_(self, v23, v26, a3);
    double v28 = v27;
    if (objc_msgSend_observationCount(self, v29, v30, v31) < 1) {
      goto LABEL_34;
    }
  }
  if (v28 < 1.0 - v28)
  {
    uint64_t v35 = 0;
    int64_t v36 = v26;
    double v37 = v28;
    do
    {
      if (v26 != v35)
      {
        objc_msgSend_probabilityForObservationIndex_timestep_(self, v32, v35, a3);
        BOOL v39 = v38 <= v37;
        double v37 = fmax(v38, v37);
        if (!v39) {
          int64_t v36 = v35;
        }
        double v28 = v38 + v28;
      }
      ++v35;
    }
    while (v35 < objc_msgSend_observationCount(self, v32, v33, v34) && v37 < 1.0 - v28);
    goto LABEL_35;
  }
LABEL_34:
  double v37 = v28;
  int64_t v36 = v26;
LABEL_35:
  if (a4) {
    *a4 = log(v37);
  }
  if (a5) {
    *a5 = v36;
  }
  objc_msgSend_objectAtIndexedSubscript_(self->_characterObservations, v32, v36, v34);
  uint64_t v40 = LABEL_40:;
  return v40;
}

- (id)topCandidateForTimestep:(int64_t)a3 outputProbability:(double *)a4 outputIndex:(int64_t *)a5
{
  long double __x = 0.0;
  uint64_t v6 = objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self, a2, a3, (uint64_t)&__x, a5);
  if (a4) {
    *a4 = exp(__x);
  }
  return v6;
}

- (id)debugDescription
{
  uint64_t v5 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3);
  objc_msgSend_appendFormat_(v5, v6, @"Activation Matrix with %ld timesteps, %ld observations \n", v7, self->__timestepCount, self->__observationCount);
  if (self->__timestepCount >= 1)
  {
    objc_msgSend_logProbabilityForBlankAtTimestep_(self, v8, 0, v9);
    uint64_t v11 = v10;
    uint64_t v38 = -1;
    uint64_t v39 = 0;
    uint64_t v13 = objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self, v12, 0, (uint64_t)&v39, &v38);
    double v16 = v13;
    if (v38 == self->_blankIndex)
    {
      double v17 = @"<B>";
      objc_msgSend_appendFormat_(v5, v14, @"\t t%ld, <B>:%.2f [%ld], sym=%@:%.2f [%ld]\n", v15, 0, v11, v38, @"<B>", v39, v38);
    }
    else
    {
      sub_1B4C481E8(v13);
      double v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v5, v18, @"\t t%ld, <B>:%.2f [%ld], sym=%@:%.2f [%ld]\n", v19, 0, v11, self->_blankIndex, v17, v39, v38);
    }

    if (self->__timestepCount >= 2)
    {
      uint64_t v22 = 1;
      objc_msgSend_logProbabilityForBlankAtTimestep_(self, v20, 1, v21);
      while (1)
      {
        uint64_t v27 = v24;
        uint64_t v38 = -1;
        uint64_t v39 = 0;
        double v28 = objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self, v23, v22, (uint64_t)&v39, &v38);
        uint64_t v31 = v28;
        int64_t blankIndex = self->_blankIndex;
        if (v22 == self->__timestepCount - 1 || v38 != blankIndex)
        {
          if (v38 == blankIndex)
          {
            uint64_t v34 = @"<B>";
            objc_msgSend_appendFormat_(v5, v29, @"\t t%ld, <B>:%.2f [%ld], sym=%@:%.2f [%ld]\n", v30, v22, v27, v38, @"<B>", v39, v38);
          }
          else
          {
            sub_1B4C481E8(v28);
            uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_appendFormat_(v5, v35, @"\t t%ld, <B>:%.2f [%ld], sym=%@:%.2f [%ld]\n", v36, v22, v27, self->_blankIndex, v34, v39, v38);
          }
        }
        if (++v22 >= self->__timestepCount) {
          break;
        }
        objc_msgSend_logProbabilityForBlankAtTimestep_(self, v25, v22, v26);
      }
    }
  }
  return v5;
}

- (NSOrderedSet)characterObservations
{
  return self->_characterObservations;
}

- (void)setCharacterObservations:(id)a3
{
}

- (int64_t)blankIndex
{
  return self->_blankIndex;
}

- (void)setBlankIndex:(int64_t)a3
{
  self->_int64_t blankIndex = a3;
}

- (int64_t)domainType
{
  return self->_domainType;
}

- ($FD4688982923A924290ECB669CAF1EC2)_espressoBuffer
{
  long long v3 = *(_OWORD *)&self[1].var11;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[1].var9;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[1].var13;
  long long v4 = *(_OWORD *)&self[1].var3[3];
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[1].var3[1];
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[1].var7;
  *(_OWORD *)&retstr->unint64_t var6 = *(_OWORD *)&self[1].var5;
  *(_OWORD *)&retstr->unint64_t var8 = v5;
  long long v6 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var14;
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[1].var2[3];
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[1].var2[1];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)set_espressoBuffer:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->$70B10377DC9035999D77C63B14D421A0::dim = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::dim[2] = v4;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::data = v3;
  long long v5 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  long long v7 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::channels = v7;
  *(_OWORD *)self->$70B10377DC9035999D77C63B14D421A0::stride = v5;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride[2] = v6;
  long long v8 = *(_OWORD *)&a3->var8;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v10 = *(_OWORD *)&a3->var12;
  *(void *)&self->$70B10377DC9035999D77C63B14D421A0::storage_int64_t type = *(void *)&a3->var14;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride_height = v9;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride_batch_number = v10;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::sequence_length = v8;
}

- ($FD4688982923A924290ECB669CAF1EC2)_indexBuffer
{
  *(void *)&retstr->var14 = self[2].var13;
  long long v3 = *(_OWORD *)&self[2].var11;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[2].var9;
  *(_OWORD *)&retstr->var12 = v3;
  long long v4 = *(_OWORD *)&self[2].var3[3];
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[2].var3[1];
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[2].var7;
  *(_OWORD *)&retstr->unint64_t var6 = *(_OWORD *)&self[2].var5;
  *(_OWORD *)&retstr->unint64_t var8 = v5;
  long long v6 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var14;
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[2].var2[3];
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[2].var2[1];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)set_indexBuffer:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->$70B10377DC9035999D77C63B14D421A0::dim = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::dim[2] = v4;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::data = v3;
  long long v5 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  long long v7 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::channels = v7;
  *(_OWORD *)self->$70B10377DC9035999D77C63B14D421A0::stride = v5;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride[2] = v6;
  long long v8 = *(_OWORD *)&a3->var8;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v10 = *(_OWORD *)&a3->var12;
  *(void *)&self->$70B10377DC9035999D77C63B14D421A0::storage_int64_t type = *(void *)&a3->var14;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride_height = v9;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride_batch_number = v10;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::sequence_length = v8;
}

- (double)_doubleScoreMatrix
{
  return self->__doubleScoreMatrix;
}

- (void)set_doubleScoreMatrix:(double *)a3
{
  self->__doubleScoreMatrix = a3;
}

- (MLMultiArray)_multiArray
{
  return self->__multiArray;
}

- (void)set_multiArray:(id)a3
{
}

- (MLMultiArray)_indexArray
{
  return self->__indexArray;
}

- (void)set_indexArray:(id)a3
{
}

- (int64_t)_timestepCount
{
  return self->__timestepCount;
}

- (void)set_timestepCount:(int64_t)a3
{
  self->__timestepCount = a3;
}

- (int64_t)_observationCount
{
  return self->__observationCount;
}

- (void)set_observationCount:(int64_t)a3
{
  self->__int64_t observationCount = a3;
}

- (int64_t)_timeStride
{
  return self->__timeStride;
}

- (void)set_timeStride:(int64_t)a3
{
  self->__timeStride = a3;
}

- (int64_t)_observationStride
{
  return self->__observationStride;
}

- (void)set_observationStride:(int64_t)a3
{
  self->__observationStride = a3;
}

- (int64_t)_type
{
  return self->__type;
}

- (void)set_type:(int64_t)a3
{
  self->__int64_t type = a3;
}

- (CVNLPTextDecodingPruningPolicy)_pruningPolicy
{
  *retstr = *(CVNLPTextDecodingPruningPolicy *)((char *)self + 136);
  return self;
}

- (void)set_pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a3
{
  long long v3 = *(_OWORD *)&a3->strategy;
  *(void *)&self->__pruningPolicy.maxNumberOfCandidates = *(void *)&a3->maxNumberOfCandidates;
  *(_OWORD *)&self->__pruningPolicy.int64_t strategy = v3;
}

- (int64_t)_cachedPriorityQueueTimestep
{
  return self->__cachedPriorityQueueTimestep;
}

- (void)set_cachedPriorityQueueTimestep:(int64_t)a3
{
  self->__cachedPriorityQueueTimestep = a3;
}

- (void)_cachedTimesample
{
  return self->__cachedTimesample;
}

- (void)set_cachedTimesample:(void *)a3
{
  self->__cachedTimesample = a3;
}

- (BOOL)_isDoubleDataType
{
  return self->__isDoubleDataType;
}

- (void)set_isDoubleDataType:(BOOL)a3
{
  self->__BOOL isDoubleDataType = a3;
}

- (BOOL)_usingIndexes
{
  return self->__usingIndexes;
}

- (void)set_usingIndexes:(BOOL)a3
{
  self->__usingIndexes = a3;
}

- (int64_t)_cachedBlankIndexTimestep
{
  return self->__cachedBlankIndexTimestep;
}

- (int64_t)_cachedBlankIndex
{
  return self->__cachedBlankIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indexArray, 0);
  objc_storeStrong((id *)&self->__multiArray, 0);
  objc_storeStrong((id *)&self->_characterObservations, 0);
}

@end