@interface LAPSFetchNewPasscodeRequest
- (BOOL)isPasscodeRecoveryEnabled;
- (BOOL)isPasscodeRecoveryRestricted;
- (BOOL)isPasscodeRecoverySupported;
- (LAPSFetchNewPasscodeRequest)init;
- (LAPSPasscodeType)passcodeType;
- (NSOrderedSet)allowedPasscodeTypes;
- (void)setAllowedPasscodeTypes:(id)a3;
- (void)setIsPasscodeRecoveryEnabled:(BOOL)a3;
- (void)setIsPasscodeRecoveryRestricted:(BOOL)a3;
- (void)setIsPasscodeRecoverySupported:(BOOL)a3;
- (void)setPasscodeType:(id)a3;
@end

@implementation LAPSFetchNewPasscodeRequest

- (LAPSFetchNewPasscodeRequest)init
{
  v9.receiver = self;
  v9.super_class = (Class)LAPSFetchNewPasscodeRequest;
  v2 = [(LAPSFetchNewPasscodeRequest *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF9D8]);
    uint64_t v4 = [v3 initWithArray:MEMORY[0x263EFFA68]];
    allowedPasscodeTypes = v2->_allowedPasscodeTypes;
    v2->_allowedPasscodeTypes = (NSOrderedSet *)v4;

    uint64_t v6 = +[LAPSPasscodeType noneType];
    passcodeType = v2->_passcodeType;
    v2->_passcodeType = (LAPSPasscodeType *)v6;

    v2->_isPasscodeRecoveryEnabled = 0;
  }
  return v2;
}

- (LAPSPasscodeType)passcodeType
{
  return self->_passcodeType;
}

- (void)setPasscodeType:(id)a3
{
}

- (NSOrderedSet)allowedPasscodeTypes
{
  return self->_allowedPasscodeTypes;
}

- (void)setAllowedPasscodeTypes:(id)a3
{
}

- (BOOL)isPasscodeRecoverySupported
{
  return self->_isPasscodeRecoverySupported;
}

- (void)setIsPasscodeRecoverySupported:(BOOL)a3
{
  self->_isPasscodeRecoverySupported = a3;
}

- (BOOL)isPasscodeRecoveryEnabled
{
  return self->_isPasscodeRecoveryEnabled;
}

- (void)setIsPasscodeRecoveryEnabled:(BOOL)a3
{
  self->_isPasscodeRecoveryEnabled = a3;
}

- (BOOL)isPasscodeRecoveryRestricted
{
  return self->_isPasscodeRecoveryRestricted;
}

- (void)setIsPasscodeRecoveryRestricted:(BOOL)a3
{
  self->_isPasscodeRecoveryRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedPasscodeTypes, 0);

  objc_storeStrong((id *)&self->_passcodeType, 0);
}

@end