@interface VSSetTopBoxInfoQueryResult
- (VSIdentityProvider)setTopBoxProvider;
- (VSSetTopBoxProfile)profile;
- (void)setProfile:(id)a3;
- (void)setSetTopBoxProvider:(id)a3;
@end

@implementation VSSetTopBoxInfoQueryResult

- (VSIdentityProvider)setTopBoxProvider
{
  return self->_setTopBoxProvider;
}

- (void)setSetTopBoxProvider:(id)a3
{
}

- (VSSetTopBoxProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);

  objc_storeStrong((id *)&self->_setTopBoxProvider, 0);
}

@end