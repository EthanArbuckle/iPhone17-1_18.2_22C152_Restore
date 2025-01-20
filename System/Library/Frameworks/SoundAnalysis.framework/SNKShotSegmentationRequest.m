@interface SNKShotSegmentationRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)hangoverDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSegmentDuration;
- (NSArray)fileURLs;
- (SNKShotSegmentationRequest)init;
- (float)backgroundEnergyPercentile;
- (float)foregroundEnergyPercentile;
- (float)similarityThreshold;
- (void)setBackgroundEnergyPercentile:(float)a3;
- (void)setFileURLs:(id)a3;
- (void)setForegroundEnergyPercentile:(float)a3;
- (void)setHangoverDuration:(id *)a3;
- (void)setMinSegmentDuration:(id *)a3;
- (void)setSimilarityThreshold:(float)a3;
@end

@implementation SNKShotSegmentationRequest

- (SNKShotSegmentationRequest)init
{
  return (SNKShotSegmentationRequest *)SNKShotSegmentationRequest.init()();
}

- (NSArray)fileURLs
{
  sub_1DC893938();
  sub_1DCB86A18();
  v2 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setFileURLs:(id)a3
{
}

- (float)backgroundEnergyPercentile
{
  v2 = self;
  float v3 = sub_1DC893B30();

  return v3;
}

- (void)setBackgroundEnergyPercentile:(float)a3
{
}

- (float)foregroundEnergyPercentile
{
  v2 = self;
  float v3 = sub_1DC893C64();

  return v3;
}

- (void)setForegroundEnergyPercentile:(float)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)hangoverDuration
{
  sub_1DC893EEC(self, sub_1DC893D74, &retstr->var0);
  return result;
}

- (void)setHangoverDuration:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSegmentDuration
{
  sub_1DC893EEC(self, sub_1DC893F50, &retstr->var0);
  return result;
}

- (void)setMinSegmentDuration:(id *)a3
{
}

- (float)similarityThreshold
{
  v2 = self;
  float v3 = sub_1DC894134();

  return v3;
}

- (void)setSimilarityThreshold:(float)a3
{
}

- (void).cxx_destruct
{
}

@end