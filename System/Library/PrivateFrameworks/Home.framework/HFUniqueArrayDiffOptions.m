@interface HFUniqueArrayDiffOptions
- (BOOL)allowMoves;
- (HFUniqueArrayDiffOptions)init;
- (id)changeComparator;
- (id)equalComparator;
- (id)hashGenerator;
- (void)setAllowMoves:(BOOL)a3;
- (void)setChangeComparator:(id)a3;
- (void)setEqualComparator:(id)a3;
- (void)setHashGenerator:(id)a3;
@end

@implementation HFUniqueArrayDiffOptions

- (id)hashGenerator
{
  return self->_hashGenerator;
}

- (id)equalComparator
{
  return self->_equalComparator;
}

- (id)changeComparator
{
  return self->_changeComparator;
}

- (BOOL)allowMoves
{
  return self->_allowMoves;
}

- (void)setChangeComparator:(id)a3
{
}

- (HFUniqueArrayDiffOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)HFUniqueArrayDiffOptions;
  result = [(HFUniqueArrayDiffOptions *)&v3 init];
  if (result) {
    result->_allowMoves = 1;
  }
  return result;
}

- (void)setHashGenerator:(id)a3
{
}

- (void)setEqualComparator:(id)a3
{
}

- (void)setAllowMoves:(BOOL)a3
{
  self->_allowMoves = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeComparator, 0);
  objc_storeStrong(&self->_hashGenerator, 0);
  objc_storeStrong(&self->_equalComparator, 0);
}

@end