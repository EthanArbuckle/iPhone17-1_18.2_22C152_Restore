@interface CLBOpenApplicationRequest
- (BOOL)isForeground;
- (BOOL)requiresNewScene;
- (CLBApplicationInfo)application;
- (CLBOpenApplicationRequest)initWithPPTActivationContext:(id)a3 completion:(id)a4;
- (CLBOpenApplicationRequest)initWithRequest:(id)a3 completion:(id)a4;
- (FBSystemServiceOpenApplicationRequest)systemRequest;
- (WBPPTActivationContext)pptActivationContext;
- (id)_requestOptionsDictionary;
- (id)systemCompletion;
@end

@implementation CLBOpenApplicationRequest

- (CLBOpenApplicationRequest)initWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CLBOpenApplicationRequest;
  v9 = [(CLBOpenApplicationRequest *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemRequest, a3);
    id v11 = [v8 copy];
    id systemCompletion = v10->_systemCompletion;
    v10->_id systemCompletion = v11;

    v13 = +[ClarityBoard sharedApplicationLibrary];
    v14 = [v7 bundleIdentifier];
    uint64_t v15 = [v13 installedApplicationWithBundleIdentifier:v14];
    application = v10->_application;
    v10->_application = (CLBApplicationInfo *)v15;
  }
  return v10;
}

- (CLBOpenApplicationRequest)initWithPPTActivationContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CLBOpenApplicationRequest;
  v9 = [(CLBOpenApplicationRequest *)&v15 init];
  if (v9)
  {
    id v10 = [v8 copy];
    id systemCompletion = v9->_systemCompletion;
    v9->_id systemCompletion = v10;

    objc_storeStrong((id *)&v9->_pptActivationContext, a3);
    uint64_t v12 = [v7 applicationInfo];
    application = v9->_application;
    v9->_application = (CLBApplicationInfo *)v12;
  }
  return v9;
}

- (BOOL)isForeground
{
  v3 = [(CLBOpenApplicationRequest *)self _requestOptionsDictionary];
  if (objc_msgSend(v3, "bs_BOOLForKey:", FBSOpenApplicationOptionKeyActivateSuspended))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = [(CLBOpenApplicationRequest *)self application];
    unsigned int v4 = [v5 alwaysLaunchesInBackground] ^ 1;
  }
  return v4;
}

- (BOOL)requiresNewScene
{
  v2 = [(CLBOpenApplicationRequest *)self _requestOptionsDictionary];
  unsigned __int8 v3 = objc_msgSend(v2, "bs_BOOLForKey:", FBSOpenApplicationWithNewScene);

  return v3;
}

- (id)_requestOptionsDictionary
{
  v2 = [(CLBOpenApplicationRequest *)self systemRequest];
  unsigned __int8 v3 = [v2 options];
  unsigned int v4 = [v3 dictionary];

  return v4;
}

- (CLBApplicationInfo)application
{
  return self->_application;
}

- (FBSystemServiceOpenApplicationRequest)systemRequest
{
  return self->_systemRequest;
}

- (id)systemCompletion
{
  return self->_systemCompletion;
}

- (WBPPTActivationContext)pptActivationContext
{
  return self->_pptActivationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pptActivationContext, 0);
  objc_storeStrong(&self->_systemCompletion, 0);
  objc_storeStrong((id *)&self->_systemRequest, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end