@interface LAPSPasscodePersistenceCDPAdapter
- (unint64_t)_deviceSecretType:(id)a3;
- (void)reportPasscodeDidChangeTo:(id)a3 passcodeType:(id)a4 completion:(id)a5;
@end

@implementation LAPSPasscodePersistenceCDPAdapter

- (void)reportPasscodeDidChangeTo:(id)a3 passcodeType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (getCDPStateControllerClass())
  {
    id v11 = objc_alloc_init((Class)getCDPStateControllerClass());
    unint64_t v12 = [(LAPSPasscodePersistenceCDPAdapter *)self _deviceSecretType:v9];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __87__LAPSPasscodePersistenceCDPAdapter_reportPasscodeDidChangeTo_passcodeType_completion___block_invoke;
    v15[3] = &unk_26506EB88;
    id v16 = v11;
    id v17 = v10;
    id v13 = v11;
    [v13 localSecretChangedTo:v8 secretType:v12 completion:v15];
  }
  else
  {
    v14 = +[LAPSErrorBuilder genericErrorWithDebugDescription:@"CDP update finished with error because required class was not found"];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

uint64_t __87__LAPSPasscodePersistenceCDPAdapter_reportPasscodeDidChangeTo_passcodeType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)_deviceSecretType:(id)a3
{
  unint64_t v3 = [a3 identifier];
  if (v3 > 4) {
    return 2;
  }
  else {
    return qword_23F477CA8[v3];
  }
}

@end