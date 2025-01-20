@interface MPCAudioAssetTypeSelection
- (NSDictionary)justification;
- (NSString)explanation;
- (int64_t)type;
- (void)setExplanation:(id)a3;
- (void)setJustification:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MPCAudioAssetTypeSelection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_justification, 0);

  objc_storeStrong((id *)&self->_explanation, 0);
}

- (void)setJustification:(id)a3
{
}

- (NSDictionary)justification
{
  return self->_justification;
}

- (void)setExplanation:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

@end