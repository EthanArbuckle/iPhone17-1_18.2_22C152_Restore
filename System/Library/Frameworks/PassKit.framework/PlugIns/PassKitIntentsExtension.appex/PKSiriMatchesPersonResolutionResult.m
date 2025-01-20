@interface PKSiriMatchesPersonResolutionResult
- (BOOL)isPersonWithNoHandle;
- (INPersonResolutionResult)personResolutionResult;
- (void)setIsPersonWithNoHandle:(BOOL)a3;
- (void)setPersonResolutionResult:(id)a3;
@end

@implementation PKSiriMatchesPersonResolutionResult

- (INPersonResolutionResult)personResolutionResult
{
  return self->_personResolutionResult;
}

- (void)setPersonResolutionResult:(id)a3
{
}

- (BOOL)isPersonWithNoHandle
{
  return self->_isPersonWithNoHandle;
}

- (void)setIsPersonWithNoHandle:(BOOL)a3
{
  self->_isPersonWithNoHandle = a3;
}

- (void).cxx_destruct
{
}

@end