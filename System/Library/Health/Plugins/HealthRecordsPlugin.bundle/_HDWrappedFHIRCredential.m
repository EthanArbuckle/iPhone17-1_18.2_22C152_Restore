@interface _HDWrappedFHIRCredential
- (BOOL)isInvalidated;
- (HKFHIRCredential)originalCredential;
- (HKFHIRCredential)refreshedCredential;
- (id)_initWithCredential:(id)a3;
- (void)didRefreshCredential:(id)a3;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation _HDWrappedFHIRCredential

- (id)_initWithCredential:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HDWrappedFHIRCredential;
  v5 = [(_HDWrappedFHIRCredential *)&v9 init];
  if (v5)
  {
    v6 = (HKFHIRCredential *)[v4 copy];
    originalCredential = v5->_originalCredential;
    v5->_originalCredential = v6;
  }
  return v5;
}

- (void)didRefreshCredential:(id)a3
{
  id v4 = (HKFHIRCredential *)[a3 copy];
  refreshedCredential = self->_refreshedCredential;
  self->_refreshedCredential = v4;

  self->_invalidated = 0;
}

- (HKFHIRCredential)originalCredential
{
  return self->_originalCredential;
}

- (HKFHIRCredential)refreshedCredential
{
  return self->_refreshedCredential;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshedCredential, 0);

  objc_storeStrong((id *)&self->_originalCredential, 0);
}

@end