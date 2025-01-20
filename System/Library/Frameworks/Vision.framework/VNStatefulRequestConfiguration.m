@interface VNStatefulRequestConfiguration
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameAnalysisSpacing;
- (NSUUID)requestUUID;
- (VNStatefulRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFrameAnalysisSpacing:(id *)a3;
@end

@implementation VNStatefulRequestConfiguration

- (void).cxx_destruct
{
}

- (NSUUID)requestUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFrameAnalysisSpacing:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameAnalysisSpacing
{
  objc_copyStruct(retstr, &self->_frameAnalysisSpacing, 24, 1, 0);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VNStatefulRequestConfiguration;
  v4 = [(VNImageBasedRequestConfiguration *)&v8 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 18, self->_requestUUID);
    int64_t epoch = self->_frameAnalysisSpacing.epoch;
    *(_OWORD *)(v5 + 19) = *(_OWORD *)&self->_frameAnalysisSpacing.value;
    v5[21] = (id)epoch;
  }
  return v5;
}

- (VNStatefulRequestConfiguration)initWithRequestClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNStatefulRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v7 initWithRequestClass:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    requestUUID = v3->_requestUUID;
    v3->_requestUUID = (NSUUID *)v4;
  }
  return v3;
}

@end