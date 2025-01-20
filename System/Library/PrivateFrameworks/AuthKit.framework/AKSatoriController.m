@interface AKSatoriController
- (AKCASatoriReporter)analyticsReport;
- (AKSatoriController)initWithClient:(id)a3;
- (id)_verificationSessionForReason:(unint64_t)a3;
- (void)fetchRealUserLikelihoodForRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)setAnalyticsReport:(id)a3;
- (void)warmUpVerificationSessionWithCompletionHandler:(id)a3;
@end

@implementation AKSatoriController

- (AKSatoriController)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSatoriController;
  v6 = [(AKSatoriController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (id)_verificationSessionForReason:(unint64_t)a3
{
  id v4 = [objc_alloc((Class)DIVerificationSessionContext) initWithName:@"tiburon" tier:0 serviceUrl:0 httpHeaders:0];
  [v4 setInvocationReason:a3];
  id v5 = [objc_alloc((Class)DIVerificationSession) initWithContext:v4];

  return v5;
}

- (void)warmUpVerificationSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AKAccountManager sharedInstance];
  v6 = [v5 primaryAuthKitAccount];

  if (v6)
  {
    v7 = +[AKAccountManager sharedInstance];
    unsigned __int8 v8 = [v7 shouldPerformSatoriWarmupVerificationForAccount:v6];

    if (v8)
    {
      objc_super v9 = (void *)os_transaction_create();
      v10 = [(AKSatoriController *)self _verificationSessionForReason:1];
      v11 = _AKLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting verification warm up..", buf, 2u);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100027C10;
      v17[3] = &unk_100227388;
      id v21 = v4;
      id v18 = v6;
      id v19 = v10;
      id v20 = v9;
      id v12 = v9;
      id v13 = v10;
      [v13 performVerificationWithAttributes:0 completion:v17];

      goto LABEL_15;
    }
    v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Verification Warm up has already been performed in the last hour skipping...", buf, 2u);
    }

    if (v4)
    {
      uint64_t v15 = -7028;
      goto LABEL_14;
    }
  }
  else
  {
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10017DBFC(v14);
    }

    if (v4)
    {
      uint64_t v15 = -7022;
LABEL_14:
      id v13 = +[NSError ak_errorWithCode:v15];
      (*((void (**)(id, void, id))v4 + 2))(v4, 0, v13);
LABEL_15:
    }
  }
}

- (void)fetchRealUserLikelihoodForRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  [(AKSatoriController *)self _verificationSessionForReason:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027DF4;
  v8[3] = &unk_1002273D8;
  v8[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  uint64_t v11 = mach_absolute_time();
  id v6 = v5;
  id v7 = v9;
  [v7 performVerificationWithAttributes:0 completion:v8];
}

- (AKCASatoriReporter)analyticsReport
{
  return self->_analyticsReport;
}

- (void)setAnalyticsReport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReport, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end