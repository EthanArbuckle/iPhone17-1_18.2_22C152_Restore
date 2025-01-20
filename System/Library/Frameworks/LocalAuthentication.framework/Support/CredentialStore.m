@interface CredentialStore
- (void)setValue:(id)a3 forCredential:(id)a4 completion:(id)a5;
- (void)valueForCredential:(id)a3 completion:(id)a4;
@end

@implementation CredentialStore

- (void)valueForCredential:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, void, void *))a4;
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Reading of credential (%d) not supported", [a3 credential]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = +[LAErrorHelper errorWithCode:-1020 message:v7];
  v5[2](v5, 0, v6);
}

- (void)setValue:(id)a3 forCredential:(id)a4 completion:(id)a5
{
  id v18 = a3;
  id v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  id v9 = [v7 credential];
  if (v9 != (id)LACCredentialPasscode)
  {
    v15 = +[NSString stringWithFormat:@"Injection of credential (%d) not supported", LACCredentialPasscode];
    uint64_t v16 = +[LAErrorHelper errorWithCode:-1020 message:v15];
    goto LABEL_5;
  }
  id v10 = v9;
  v11 = +[LAPasscodeHelper sharedInstance];
  v12 = [v7 externalizedContext];
  v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 userID]);
  id v14 = [v11 verifyPasswordUsingAKS:v18 acmContext:v12 userId:v13 policy:0 options:0 bioLockoutRecovery:0];

  if (v14)
  {
    v15 = +[NSString stringWithFormat:@"Injection of credential (%d) failed rc=%d", v10, v14];
    uint64_t v16 = +[LAErrorHelper internalErrorWithMessage:v15];
LABEL_5:
    v17 = (void *)v16;
    v8[2](v8, v16);

    goto LABEL_7;
  }
  v8[2](v8, 0);
LABEL_7:
}

@end