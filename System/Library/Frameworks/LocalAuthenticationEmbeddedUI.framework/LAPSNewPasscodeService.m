@interface LAPSNewPasscodeService
- (LAPSNewPasscodeService)initWithPersistence:(id)a3;
- (LAPSPasscodePersistence)persistence;
- (id)allowedPasscodeTypes;
- (id)passcodeType;
- (void)allowedPasscodeTypes;
- (void)verifyPasscode:(id)a3 completion:(id)a4;
@end

@implementation LAPSNewPasscodeService

- (LAPSNewPasscodeService)initWithPersistence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSNewPasscodeService;
  v6 = [(LAPSNewPasscodeService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistence, a3);
  }

  return v7;
}

- (id)allowedPasscodeTypes
{
  v2 = [(LAPSNewPasscodeService *)self persistence];
  v3 = [v2 simplestAllowedNewPasscodeType];

  if (![v3 identifier]) {
    -[LAPSNewPasscodeService allowedPasscodeTypes]();
  }
  v4 = +[LAPSPasscodeTypeCollection allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo:](LAPSPasscodeTypeCollection, "allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo:", [v3 complexityRating]);

  return v4;
}

- (id)passcodeType
{
  v2 = [(LAPSNewPasscodeService *)self persistence];
  v3 = [v2 defaultNewPasscodeType];

  return v3;
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = [(LAPSNewPasscodeService *)self persistence];
  id v25 = 0;
  char v9 = [v8 verifyNewPasscodeMeetsPlatformRequirements:v6 error:&v25];
  id v10 = v25;

  if ((v9 & 1) == 0)
  {
    v16 = [v10 localizedDescription];
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      v20 = [(LAPSNewPasscodeService *)self persistence];
      uint64_t v21 = [v20 localizedPasscodeRequirements];
      v22 = (void *)v21;
      v23 = &stru_26F31E768;
      if (v21) {
        v23 = (__CFString *)v21;
      }
      v18 = v23;
    }
    id v24 = +[LAPSErrorBuilder newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:v18];
    v7[2](v7, v24);

    goto LABEL_16;
  }
  v11 = [v6 type];
  if ([v11 hasFixedLength])
  {
    v12 = [v6 type];
    uint64_t v13 = [v12 identifier];

    if (v13 != 4)
    {
      v14 = [(LAPSNewPasscodeService *)self persistence];
      char v15 = [v14 verifyFixedLengthNumericPasscodeIsStrong:v6];
      goto LABEL_9;
    }
  }
  else
  {
  }
  v14 = [(LAPSNewPasscodeService *)self persistence];
  char v15 = [v14 verifyVariableLengthAlphanumericPasscodeIsStrong:v6];
LABEL_9:
  char v19 = v15;

  if ((v19 & 1) == 0)
  {
    v18 = +[LAPSErrorBuilder newPasscodeIsTooEasyError];
    v7[2](v7, v18);
LABEL_16:

    goto LABEL_17;
  }
  v7[2](v7, 0);
LABEL_17:
}

- (LAPSPasscodePersistence)persistence
{
  return self->_persistence;
}

- (void).cxx_destruct
{
}

- (void)allowedPasscodeTypes
{
  __assert_rtn("-[LAPSNewPasscodeService allowedPasscodeTypes]", "LAPSNewPasscodeService.m", 26, "[simplestAllowedPasscodeType identifier] != LAPSPasscodeTypeIdentifierNone");
}

@end