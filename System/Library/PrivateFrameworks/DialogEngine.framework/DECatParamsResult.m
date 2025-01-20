@interface DECatParamsResult
- (NSDictionary)params;
- (NSString)catId;
- (void)setCatId:(id)a3;
- (void)setParams:(id)a3;
@end

@implementation DECatParamsResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_catId, 0);
}

- (void)setParams:(id)a3
{
}

- (NSDictionary)params
{
  return self->_params;
}

- (void)setCatId:(id)a3
{
}

- (NSString)catId
{
  return self->_catId;
}

@end