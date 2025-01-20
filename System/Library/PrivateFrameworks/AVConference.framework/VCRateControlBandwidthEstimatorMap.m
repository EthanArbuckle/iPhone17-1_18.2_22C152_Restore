@interface VCRateControlBandwidthEstimatorMap
- (VCRateControlBandwidthEstimatorMap)init;
- (VCRateControlServerBag)serverBag;
- (double)estimatedBandwidth;
- (double)estimatedBandwidthUncapped;
- (int)bandwidthEstimationState;
- (unsigned)mode;
- (unsigned)radioAccessTechnology;
- (void)dealloc;
- (void)setEstimatedBandwidth:(double)a3;
- (void)setEstimatedBandwidthUncapped:(double)a3;
- (void)setMaxBitrateForBandwidthEstimatorMap:(unsigned int)a3;
- (void)setMode:(unsigned int)a3;
- (void)setRadioAccessTechnology:(unsigned int)a3;
- (void)setServerBag:(id)a3;
@end

@implementation VCRateControlBandwidthEstimatorMap

- (VCRateControlBandwidthEstimatorMap)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCRateControlBandwidthEstimatorMap;
  v2 = [(VCRateControlBandwidthEstimatorMap *)&v4 init];
  if (v2)
  {
    v2->_estimatorMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_currentActiveEstimatorID = -1;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlBandwidthEstimatorMap;
  [(VCRateControlBandwidthEstimatorMap *)&v3 dealloc];
}

- (double)estimatedBandwidth
{
  VCRateControlBandwidthEstimatorMap_EstimatedBandwidthWithArrivalTime((uint64_t)self, 0.0);
  return result;
}

- (double)estimatedBandwidthUncapped
{
  VCRateControlBandwidthEstimatorMap_EstimatedBandwidthUncappedWithArrivalTime((uint64_t)self, 0.0);
  return result;
}

- (void)setEstimatedBandwidthUncapped:(double)a3
{
  self->_estimatedBandwidthUncapped = a3;
}

uint64_t __VCRateControlBandwidthEstimatorMap_EstimatedBandwidthWithArrivalTime_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(double *)(a1 + 40);
  if (v5 == 0.0 || (uint64_t result = [a3 lastProbingArrivalTime], v5 - v7 < 30.0))
  {
    double v8 = *(double *)(*(void *)(a1 + 32) + 24);
    uint64_t result = [a3 estimatedBandwidth];
    if (v8 >= v9) {
      double v9 = v8;
    }
    *(double *)(*(void *)(a1 + 32) + 24) = v9;
  }
  return result;
}

uint64_t __VCRateControlBandwidthEstimatorMap_EstimatedBandwidthUncappedWithArrivalTime_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(double *)(a1 + 40);
  if (v5 == 0.0 || (uint64_t result = [a3 lastProbingArrivalTime], v5 - v7 < 30.0))
  {
    double v8 = *(double *)(*(void *)(a1 + 32) + 32);
    uint64_t result = [a3 estimatedBandwidthUncapped];
    if (v8 >= v9) {
      double v9 = v8;
    }
    *(double *)(*(void *)(a1 + 32) + 32) = v9;
  }
  return result;
}

void __VCRateControlBandwidthEstimatorMap_SetEstimatedBandwidth_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (void)setEstimatedBandwidth:(double)a3
{
  v7[5] = *MEMORY[0x1E4F143B8];
  self->_estimatedBandwidth = a3;
  defaultEstimator = self->_defaultEstimator;
  if (defaultEstimator) {
    BOOL v5 = self->_mode - 6 > 0xFFFFFFFD;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    estimatorMap = self->_estimatorMap;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__VCRateControlBandwidthEstimatorMap_setEstimatedBandwidth___block_invoke;
    v7[3] = &__block_descriptor_40_e58_v32__0__NSNumber_8__VCRateControlBandwidthEstimator_16_B24l;
    *(double *)&v7[4] = a3;
    [(NSMutableDictionary *)estimatorMap enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    -[VCRateControlBandwidthEstimator setEstimatedBandwidth:](defaultEstimator, "setEstimatedBandwidth:");
  }
}

uint64_t __60__VCRateControlBandwidthEstimatorMap_setEstimatedBandwidth___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setEstimatedBandwidth:*(double *)(a1 + 32)];
}

- (void)setMaxBitrateForBandwidthEstimatorMap:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  self->_maxBitrate = a3;
  estimatorMap = self->_estimatorMap;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__VCRateControlBandwidthEstimatorMap_setMaxBitrateForBandwidthEstimatorMap___block_invoke;
  v4[3] = &__block_descriptor_36_e58_v32__0__NSNumber_8__VCRateControlBandwidthEstimator_16_B24l;
  unsigned int v5 = a3;
  [(NSMutableDictionary *)estimatorMap enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __76__VCRateControlBandwidthEstimatorMap_setMaxBitrateForBandwidthEstimatorMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setMaxBitrateForBandwidthEstimator:*(unsigned int *)(a1 + 32)];
}

- (void)setMode:(unsigned int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self->_mode = a3;
  defaultEstimator = self->_defaultEstimator;
  if (a3 - 6 > 0xFFFFFFFD || defaultEstimator == 0)
  {
    estimatorMap = self->_estimatorMap;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__VCRateControlBandwidthEstimatorMap_setMode___block_invoke;
    v7[3] = &__block_descriptor_36_e58_v32__0__NSNumber_8__VCRateControlBandwidthEstimator_16_B24l;
    unsigned int v8 = a3;
    [(NSMutableDictionary *)estimatorMap enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    -[VCRateControlBandwidthEstimator setMode:](defaultEstimator, "setMode:");
  }
}

uint64_t __46__VCRateControlBandwidthEstimatorMap_setMode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setMode:*(unsigned int *)(a1 + 32)];
}

void __VCRateControlBandwidthEstimatorMap_SetRadioAccessTechnology_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (int)bandwidthEstimationState
{
  defaultEstimator = self->_defaultEstimator;
  unsigned int v4 = self->_mode - 6;
  if (defaultEstimator) {
    BOOL v5 = v4 > 0xFFFFFFFD;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  else {
    return [(VCRateControlBandwidthEstimator *)defaultEstimator bandwidthEstimationState];
  }
}

void __VCRateControlBandwidthEstimatorMap_SetFastSuddenBandwidthDetectionEnabled_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (void)setServerBag:(id)a3
{
  v9[5] = *MEMORY[0x1E4F143B8];
  serverBag = self->_serverBag;
  if (serverBag != a3)
  {

    self->_serverBag = (VCRateControlServerBag *)a3;
  }
  defaultEstimator = self->_defaultEstimator;
  if (defaultEstimator) {
    BOOL v7 = self->_mode - 6 > 0xFFFFFFFD;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    estimatorMap = self->_estimatorMap;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__VCRateControlBandwidthEstimatorMap_setServerBag___block_invoke;
    v9[3] = &unk_1E6DB91C0;
    v9[4] = a3;
    [(NSMutableDictionary *)estimatorMap enumerateKeysAndObjectsUsingBlock:v9];
  }
  else
  {
    [(VCRateControlBandwidthEstimator *)defaultEstimator setServerBag:a3];
  }
}

uint64_t __51__VCRateControlBandwidthEstimatorMap_setServerBag___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setServerBag:*(void *)(a1 + 32)];
}

- (unsigned)radioAccessTechnology
{
  return self->_radioAccessTechnology;
}

- (void)setRadioAccessTechnology:(unsigned int)a3
{
  self->_radioAccessTechnology = a3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (VCRateControlServerBag)serverBag
{
  return self->_serverBag;
}

@end