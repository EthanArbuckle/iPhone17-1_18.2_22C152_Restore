@interface DEPatternParamsResult
- (NSDictionary)params;
- (NSString)patternId;
- (void)setParams:(id)a3;
- (void)setPatternId:(id)a3;
@end

@implementation DEPatternParamsResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
}

- (void)setParams:(id)a3
{
}

- (NSDictionary)params
{
  return self->_params;
}

- (void)setPatternId:(id)a3
{
}

- (NSString)patternId
{
  return self->_patternId;
}

@end