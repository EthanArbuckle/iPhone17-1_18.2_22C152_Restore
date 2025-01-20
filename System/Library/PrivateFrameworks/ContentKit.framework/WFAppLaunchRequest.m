@interface WFAppLaunchRequest
- (BOOL)isRequestForUserFacingApp;
- (BOOL)requiresUserFacingApp;
- (id)readableErrorFromError:(id)a3;
- (id)rootCauseErrorFromError:(id)a3;
- (void)performWithCompletionHandler:(id)a3;
- (void)setRequiresUserFacingApp:(BOOL)a3;
@end

@implementation WFAppLaunchRequest

- (void)setRequiresUserFacingApp:(BOOL)a3
{
  self->_requiresUserFacingApp = a3;
}

- (BOOL)requiresUserFacingApp
{
  return self->_requiresUserFacingApp;
}

- (id)rootCauseErrorFromError:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKey:*MEMORY[0x263F08608]];

  if (v6)
  {
    id v7 = [(WFAppLaunchRequest *)self rootCauseErrorFromError:v6];
  }
  else
  {
    id v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (id)readableErrorFromError:(id)a3
{
  v39[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"FBSOpenApplicationServiceErrorDomain"];

  if (v6)
  {
    id v7 = [MEMORY[0x263F85258] currentDevice];
    v8 = [v7 localizedModel];

    v9 = WFLocalizedString(@"Couldn't Open App");
    v10 = WFLocalizedString(@"The app couldn't be opened because an unknown error occurred.");
    v11 = (void *)MEMORY[0x263F01890];
    v12 = [(INCAppLaunchRequest *)self bundleIdentifier];
    v13 = [v11 bundleRecordWithBundleIdentifier:v12 allowPlaceholder:0 error:0];

    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [v13 localizedName];
        uint64_t v15 = [v14 length];

        if (!v15)
        {
          int v24 = 0;
LABEL_9:
          v25 = [(WFAppLaunchRequest *)self rootCauseErrorFromError:v4];
          v26 = [v25 domain];
          if ([v26 isEqualToString:@"FBSOpenApplicationErrorDomain"])
          {
            uint64_t v27 = [v25 code];

            if (v27 != 7)
            {
LABEL_16:
              v31 = (void *)MEMORY[0x263F087E8];
              v32 = [v4 domain];
              uint64_t v33 = [v4 code];
              uint64_t v34 = *MEMORY[0x263F08320];
              v38[0] = *MEMORY[0x263F08338];
              v38[1] = v34;
              v39[0] = v9;
              v39[1] = v10;
              v38[2] = *MEMORY[0x263F08608];
              v39[2] = v4;
              v35 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
              uint64_t v36 = [v31 errorWithDomain:v32 code:v33 userInfo:v35];

              id v4 = (id)v36;
              goto LABEL_17;
            }
            v28 = NSString;
            if (v24)
            {
              v26 = WFLocalizedString(@"“%1$@” couldn't be opened because the %2$@ is locked.");
              uint64_t v29 = [v13 localizedName];
              uint64_t v30 = objc_msgSend(v28, "localizedStringWithFormat:", v26, v29, v8);

              v10 = (void *)v29;
            }
            else
            {
              v26 = WFLocalizedString(@"The app couldn't be opened because the %@ is locked.");
              uint64_t v30 = objc_msgSend(v28, "localizedStringWithFormat:", v26, v8);
            }

            v10 = (void *)v30;
          }

          goto LABEL_16;
        }
        v16 = NSString;
        v17 = WFLocalizedString(@"Couldn't Open “%@”");
        v18 = [v13 localizedName];
        uint64_t v19 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v18);

        v20 = NSString;
        v21 = WFLocalizedString(@"“%@” couldn't be opened because an unknown error occurred.");
        v22 = [v13 localizedName];
        uint64_t v23 = objc_msgSend(v20, "localizedStringWithFormat:", v21, v22);

        int v24 = 1;
        v10 = (void *)v23;
        v9 = (void *)v19;
      }
      else
      {
        int v24 = 0;
        v21 = v13;
        v13 = 0;
      }
    }
    else
    {
      v21 = 0;
      int v24 = 0;
    }

    goto LABEL_9;
  }
LABEL_17:
  return v4;
}

- (BOOL)isRequestForUserFacingApp
{
  id v3 = objc_alloc(MEMORY[0x263F01878]);
  id v4 = [(INCAppLaunchRequest *)self bundleIdentifier];
  v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  LOBYTE(v4) = objc_msgSend(v5, "wf_isAvailableInContext:", 0);
  return (char)v4;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (![(WFAppLaunchRequest *)self requiresUserFacingApp]
    || [(WFAppLaunchRequest *)self requiresUserFacingApp]
    && [(WFAppLaunchRequest *)self isRequestForUserFacingApp])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__WFAppLaunchRequest_performWithCompletionHandler___block_invoke;
    v8[3] = &unk_26428A628;
    v8[4] = self;
    id v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)WFAppLaunchRequest;
    [(INCAppLaunchRequest *)&v7 performWithCompletionHandler:v8];
  }
  else
  {
    v5 = [MEMORY[0x263F087E8] errorWithDomain:@"FBSOpenApplicationErrorDomain" code:4 userInfo:0];
    int v6 = [(WFAppLaunchRequest *)self readableErrorFromError:v5];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

void __51__WFAppLaunchRequest_performWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "readableErrorFromError:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, a2, v4);
  }
}

@end