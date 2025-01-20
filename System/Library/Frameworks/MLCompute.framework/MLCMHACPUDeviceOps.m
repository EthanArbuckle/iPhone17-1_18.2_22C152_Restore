@interface MLCMHACPUDeviceOps
+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10;
- (BOOL)hasAttnBias;
- (BOOL)hasAttnMask;
- (BOOL)hasKeyMask;
- (MLCMHACPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14;
- (NSArray)attnBiasDeltaData;
- (NSData)attnMask;
- (NSData)backpropCacheData;
- (NSData)keyMask;
- (NSMutableArray)biasMomentumDeltaDataArray;
- (NSMutableArray)weightsMomentumDeltaDataArray;
- (unint64_t)backpropCacheSize;
- (unint64_t)keyMaskStride;
- (void)setAttnBiasDeltaData:(id)a3;
- (void)setAttnMask:(id)a3;
- (void)setBackpropCacheData:(id)a3;
- (void)setBackpropCacheSize:(unint64_t)a3;
- (void)setBiasMomentumDeltaDataArray:(id)a3;
- (void)setHasAttnBias:(BOOL)a3;
- (void)setHasAttnMask:(BOOL)a3;
- (void)setHasKeyMask:(BOOL)a3;
- (void)setKeyMask:(id)a3;
- (void)setKeyMaskStride:(unint64_t)a3;
- (void)setWeightsMomentumDeltaDataArray:(id)a3;
@end

@implementation MLCMHACPUDeviceOps

+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10
{
  uint64_t v15 = *(void *)&a3;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = (void *)[objc_alloc((Class)a1) initWithType:v15 params:v23 inDeltaData:v22 outDeltaData:v21 weightsDeltaData:v20 biasDeltaData:v19 weightsMomentumData:v18 biasMomentumData:v17 betaDeltaData:0 gammaDeltaData:0 betaMomentumData:0 gammaMomentumData:0];

  return v24;
}

- (MLCMHACPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14
{
  v23.receiver = self;
  v23.super_class = (Class)MLCMHACPUDeviceOps;
  v14 = [(MLCCPUDeviceOps *)&v23 initWithType:*(void *)&a3 params:a4 inDeltaData:a5 outDeltaData:a6 weightsDeltaData:a7 biasDeltaData:a8 weightsMomentumData:a9 biasMomentumData:a10 betaDeltaData:0 gammaDeltaData:0 betaMomentumData:0 gammaMomentumData:0];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_hasAttnBias = 0;
    v14->_hasKeyMask = 0;
    v14->_hasAttnMask = 0;
    keyMask = v14->_keyMask;
    v14->_keyMask = 0;

    attnMask = v15->_attnMask;
    v15->_attnMask = 0;

    v15->_keyMaskStride = 0;
    v15->_backpropCacheSize = 0;
    backpropCacheData = v15->_backpropCacheData;
    v15->_backpropCacheData = 0;

    attnBiasDeltaData = v15->_attnBiasDeltaData;
    v15->_attnBiasDeltaData = 0;

    weightsMomentumDeltaDataArray = v15->_weightsMomentumDeltaDataArray;
    v15->_weightsMomentumDeltaDataArray = 0;

    biasMomentumDeltaDataArray = v15->_biasMomentumDeltaDataArray;
    v15->_biasMomentumDeltaDataArray = 0;
  }
  return v15;
}

- (BOOL)hasAttnBias
{
  return self->_hasAttnBias;
}

- (void)setHasAttnBias:(BOOL)a3
{
  self->_hasAttnBias = a3;
}

- (BOOL)hasKeyMask
{
  return self->_hasKeyMask;
}

- (void)setHasKeyMask:(BOOL)a3
{
  self->_hasKeyMask = a3;
}

- (BOOL)hasAttnMask
{
  return self->_hasAttnMask;
}

- (void)setHasAttnMask:(BOOL)a3
{
  self->_hasAttnMask = a3;
}

- (NSData)keyMask
{
  return self->_keyMask;
}

- (void)setKeyMask:(id)a3
{
}

- (NSData)attnMask
{
  return self->_attnMask;
}

- (void)setAttnMask:(id)a3
{
}

- (unint64_t)keyMaskStride
{
  return self->_keyMaskStride;
}

- (void)setKeyMaskStride:(unint64_t)a3
{
  self->_keyMaskStride = a3;
}

- (unint64_t)backpropCacheSize
{
  return self->_backpropCacheSize;
}

- (void)setBackpropCacheSize:(unint64_t)a3
{
  self->_backpropCacheSize = a3;
}

- (NSData)backpropCacheData
{
  return self->_backpropCacheData;
}

- (void)setBackpropCacheData:(id)a3
{
}

- (NSArray)attnBiasDeltaData
{
  return self->_attnBiasDeltaData;
}

- (void)setAttnBiasDeltaData:(id)a3
{
}

- (NSMutableArray)weightsMomentumDeltaDataArray
{
  return self->_weightsMomentumDeltaDataArray;
}

- (void)setWeightsMomentumDeltaDataArray:(id)a3
{
}

- (NSMutableArray)biasMomentumDeltaDataArray
{
  return self->_biasMomentumDeltaDataArray;
}

- (void)setBiasMomentumDeltaDataArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasMomentumDeltaDataArray, 0);
  objc_storeStrong((id *)&self->_weightsMomentumDeltaDataArray, 0);
  objc_storeStrong((id *)&self->_attnBiasDeltaData, 0);
  objc_storeStrong((id *)&self->_backpropCacheData, 0);
  objc_storeStrong((id *)&self->_attnMask, 0);

  objc_storeStrong((id *)&self->_keyMask, 0);
}

@end