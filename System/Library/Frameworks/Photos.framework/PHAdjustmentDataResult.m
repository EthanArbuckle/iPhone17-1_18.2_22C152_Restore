@interface PHAdjustmentDataResult
- (BOOL)containsValidData;
- (id)adjustmentData;
- (id)allowedInfoKeys;
- (void)setAdjustmentData:(id)a3;
@end

@implementation PHAdjustmentDataResult

- (id)adjustmentData
{
  return (id)[(NSMutableDictionary *)self->super._mutableInfo objectForKeyedSubscript:@"PHAdjustmentDataKey"];
}

- (void)setAdjustmentData:(id)a3
{
}

- (id)allowedInfoKeys
{
  v5.receiver = self;
  v5.super_class = (Class)PHAdjustmentDataResult;
  v2 = [(PHCompositeMediaResult *)&v5 allowedInfoKeys];
  v3 = [v2 setByAddingObject:@"PHAdjustmentDataKey"];

  return v3;
}

- (BOOL)containsValidData
{
  v2 = [(PHAdjustmentDataResult *)self adjustmentData];
  BOOL v3 = v2 != 0;

  return v3;
}

@end