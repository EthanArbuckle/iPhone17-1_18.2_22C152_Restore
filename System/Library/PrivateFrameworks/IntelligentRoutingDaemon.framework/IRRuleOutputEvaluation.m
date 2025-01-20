@interface IRRuleOutputEvaluation
- (BOOL)BOOLean;
- (BOOL)hasBoolean;
- (void)setBoolean:(BOOL)a3;
- (void)setHasBoolean:(BOOL)a3;
@end

@implementation IRRuleOutputEvaluation

- (BOOL)BOOLean
{
  return self->_BOOLean;
}

- (void)setBoolean:(BOOL)a3
{
  self->_BOOLean = a3;
}

- (BOOL)hasBoolean
{
  return self->_hasBoolean;
}

- (void)setHasBoolean:(BOOL)a3
{
  self->_hasBoolean = a3;
}

@end