@interface PHClientLinkedAgainst
- (BOOL)clientLinkedOnOrAfterFall2023OSVersions;
- (PHClientLinkedAgainst)init;
- (PHClientLinkedAgainst)initWithXPCDict:(id)a3;
- (void)encodeToXPCDict:(id)a3;
@end

@implementation PHClientLinkedAgainst

- (BOOL)clientLinkedOnOrAfterFall2023OSVersions
{
  return self->_clientLinkedOnOrAfterFall2023OSVersions;
}

- (void)encodeToXPCDict:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_BOOL(xdict, "PHLinkedOnOrAfterFall2023OSVersionsKey", [(PHClientLinkedAgainst *)self clientLinkedOnOrAfterFall2023OSVersions]);
}

- (PHClientLinkedAgainst)initWithXPCDict:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PHClientLinkedAgainst;
  v5 = [(PHClientLinkedAgainst *)&v7 init];
  if (v5) {
    v5->_clientLinkedOnOrAfterFall2023OSVersions = xpc_dictionary_get_BOOL(v4, "PHLinkedOnOrAfterFall2023OSVersionsKey");
  }

  return v5;
}

- (PHClientLinkedAgainst)init
{
  v4.receiver = self;
  v4.super_class = (Class)PHClientLinkedAgainst;
  v2 = [(PHClientLinkedAgainst *)&v4 init];
  if (v2) {
    v2->_clientLinkedOnOrAfterFall2023OSVersions = dyld_program_sdk_at_least();
  }
  return v2;
}

@end