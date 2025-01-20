@interface AKInheritanceDaemonService
- (id)exportedProtocol;
- (id)serviceName;
- (void)_executeRequestWithContext:(id)a3 urlBagKey:(id)a4 shouldSignWithIdentityToken:(BOOL)a5 completion:(id)a6;
- (void)_setupBeneficiaryAliasWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)configureExportedInterface:(id)a3;
- (void)fetchManifestOptionsWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)removeBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)setupBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)updateBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4;
@end

@implementation AKInheritanceDaemonService

- (id)serviceName
{
  return AKInheritanceMachService;
}

- (id)exportedProtocol
{
  return &OBJC_PROTOCOL___AKInheritanceInterface;
}

- (void)configureExportedInterface:(id)a3
{
  id v3 = a3;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v14[4] = objc_opt_class();
  v14[5] = objc_opt_class();
  v14[6] = objc_opt_class();
  v14[7] = objc_opt_class();
  v14[8] = objc_opt_class();
  v14[9] = objc_opt_class();
  v14[10] = objc_opt_class();
  v14[11] = objc_opt_class();
  v14[12] = objc_opt_class();
  v4 = +[NSArray arrayWithObjects:v14 count:13];
  v5 = +[NSSet setWithArray:v4];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v6 = +[NSArray arrayWithObjects:&v8 count:6];
  v7 = +[NSSet setWithArray:](NSSet, "setWithArray:", v6, v8, v9, v10, v11, v12);

  [v3 setClasses:v5 forSelector:"fetchManifestOptionsWithInheritanceContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"fetchManifestOptionsWithInheritanceContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:"setupBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"setupBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:"updateBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"updateBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:"removeBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"removeBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:"_setupBeneficiaryAliasWithInheritanceContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"_setupBeneficiaryAliasWithInheritanceContext:completion:" argumentIndex:0 ofReply:1];
}

- (void)fetchManifestOptionsWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = AKURLBagKeyInheritanceFetchDataSelectionOptionsKey;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009DD64;
  v9[3] = &unk_100228318;
  id v10 = v6;
  id v8 = v6;
  [(AKInheritanceDaemonService *)self _executeRequestWithContext:a3 urlBagKey:v7 shouldSignWithIdentityToken:0 completion:v9];
}

- (void)setupBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 beneficiarySetupToken];

  if (v8)
  {
    uint64_t v9 = AKURLBagKeyInheritanceSetupBeneficiaryKey;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009DF48;
    v12[3] = &unk_100227DB0;
    id v13 = v6;
    id v14 = v7;
    [(AKInheritanceDaemonService *)self _executeRequestWithContext:v13 urlBagKey:v9 shouldSignWithIdentityToken:0 completion:v12];

    id v10 = v13;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10018D758(v11);
  }

  if (v7)
  {
    id v10 = +[NSError ak_errorWithCode:-7044];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)removeBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AKURLBagKeyInheritanceRemoveBeneficiaryKey;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009E0AC;
  v11[3] = &unk_100227DB0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AKInheritanceDaemonService *)self _executeRequestWithContext:v10 urlBagKey:v8 shouldSignWithIdentityToken:0 completion:v11];
}

- (void)updateBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AKURLBagKeyInheritanceUpdateBeneficiaryKey;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009E210;
  v11[3] = &unk_100227DB0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AKInheritanceDaemonService *)self _executeRequestWithContext:v10 urlBagKey:v8 shouldSignWithIdentityToken:0 completion:v11];
}

- (void)_setupBeneficiaryAliasWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018D940((uint64_t)v6, v8);
  }

  uint64_t v9 = AKURLBagKeyInheritanceSetupBeneficiaryAliasKey;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009E3A4;
  v12[3] = &unk_100227DB0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(AKInheritanceDaemonService *)self _executeRequestWithContext:v11 urlBagKey:v9 shouldSignWithIdentityToken:1 completion:v12];
}

- (void)_executeRequestWithContext:(id)a3 urlBagKey:(id)a4 shouldSignWithIdentityToken:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [[AKInheritanceRequestProvider alloc] initWithContext:v9 urlBagKey:v10];
  [(AKInheritanceRequestProvider *)v12 setSignWithIdentityToken:v7];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10000F980;
  v21[4] = sub_10000F810;
  id v22 = 0;
  id v13 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v12];
  id v14 = objc_alloc_init((Class)AKAuthHandlerImpl);
  [v14 setForceSilentAuth:1];
  [(AKServiceControllerImpl *)v13 setAuthenticationDelegate:v14];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009E6DC;
  v17[3] = &unk_10022A5A8;
  v15 = v12;
  v18 = v15;
  v20 = v21;
  id v16 = v11;
  id v19 = v16;
  [(AKServiceControllerImpl *)v13 executeRequestWithCompletion:v17];

  _Block_object_dispose(v21, 8);
}

@end