@interface LAPSPasscodeChangeSystemRemovalAdapter
- (BOOL)canChangePasscodeWithError:(id *)a3;
- (BOOL)hasPasscode;
- (LAPSPasscodeChangeSystemRemovalAdapter)initWithPersistence:(id)a3;
- (id)lastPasscodeChange;
- (id)newPasscodeRequest;
- (id)oldPasscodeRequest;
- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5;
- (void)verifyNewPasscode:(id)a3 completion:(id)a4;
- (void)verifyPasscode:(id)a3 completion:(id)a4;
@end

@implementation LAPSPasscodeChangeSystemRemovalAdapter

- (LAPSPasscodeChangeSystemRemovalAdapter)initWithPersistence:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LAPSPasscodeChangeSystemRemovalAdapter;
  v5 = [(LAPSPasscodeChangeSystemRemovalAdapter *)&v11 init];
  if (v5)
  {
    v6 = [[LAPSCurrentPasscodeService alloc] initWithPersistence:v4];
    currentPasscodeService = v5->_currentPasscodeService;
    v5->_currentPasscodeService = v6;

    uint64_t v8 = +[LAPSPasscodeChangeSystemBuilder passcodeChangeSystem];
    changeSystem = v5->_changeSystem;
    v5->_changeSystem = (LAPSPasscodeChangeSystem *)v8;
  }
  return v5;
}

- (id)oldPasscodeRequest
{
  return (id)[(LAPSPasscodeChangeSystem *)self->_changeSystem oldPasscodeRequest];
}

- (id)newPasscodeRequest
{
  return objc_alloc_init(LAPSFetchNewPasscodeRequest);
}

- (id)lastPasscodeChange
{
  return (id)[(LAPSPasscodeChangeSystem *)self->_changeSystem lastPasscodeChange];
}

- (BOOL)hasPasscode
{
  return [(LAPSPasscodeChangeSystem *)self->_changeSystem hasPasscode];
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return [(LAPSCurrentPasscodeService *)self->_currentPasscodeService canRemovePasscodeWithError:a3];
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeSystem, 0);

  objc_storeStrong((id *)&self->_currentPasscodeService, 0);
}

@end