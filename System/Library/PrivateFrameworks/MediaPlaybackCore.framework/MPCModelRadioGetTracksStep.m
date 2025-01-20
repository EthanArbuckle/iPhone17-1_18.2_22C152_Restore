@interface MPCModelRadioGetTracksStep
- (BOOL)isFinished;
- (ICRadioGetTracksRequest)request;
- (ICRadioGetTracksResponse)response;
- (ICRadioGetTracksResponse)siriAssetInfoGetTracksResponse;
- (ICUserIdentityProperties)delegatedIdentityProperties;
- (ICUserIdentityProperties)identityProperties;
- (MPCModelRadioGetTracksStep)initWithGetTracksRequest:(id)a3 siriAssetInfo:(id)a4;
- (MPCModelRadioGetTracksStep)initWithPreviousStep:(id)a3;
- (NSError)error;
- (id)nextStepWithError:(id)a3;
- (void)_fireAndForgetServerDialog:(id)a3;
- (void)_performDefaultHandlingForButtonAction:(id)a3;
- (void)_presentServerDialog:(id)a3 completionHandler:(id)a4;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MPCModelRadioGetTracksStep

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriAssetInfoGetTracksResponse, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_delegatedIdentityProperties, 0);
  objc_storeStrong((id *)&self->_identityProperties, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (ICRadioGetTracksResponse)siriAssetInfoGetTracksResponse
{
  return self->_siriAssetInfoGetTracksResponse;
}

- (ICRadioGetTracksResponse)response
{
  return self->_response;
}

- (ICRadioGetTracksRequest)request
{
  return self->_request;
}

- (ICUserIdentityProperties)identityProperties
{
  return self->_identityProperties;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSError)error
{
  return self->_error;
}

- (ICUserIdentityProperties)delegatedIdentityProperties
{
  return self->_delegatedIdentityProperties;
}

- (void)_presentServerDialog:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x263F893D0]) initWithStoreDialog:v5];
  [v7 setAllowInCar:1];
  uint64_t v8 = [v7 createCFUserNotification];
  if (v8)
  {
    v9 = (const void *)v8;
    v10 = (void *)[objc_alloc(MEMORY[0x263F54F48]) initWithCFUserNotification:v8];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__MPCModelRadioGetTracksStep__presentServerDialog_completionHandler___block_invoke;
    v13[3] = &unk_2643C5328;
    id v14 = v5;
    id v15 = v6;
    [v10 presentWithCompletion:v13];
    CFRelease(v9);
  }
  else
  {
    v11 = ICUserNotificationGetResponseButton();
    v12 = [v11 action];
    (*((void (**)(id, void *))v6 + 2))(v6, v12);
  }
}

void __69__MPCModelRadioGetTracksStep__presentServerDialog_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) buttons];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__MPCModelRadioGetTracksStep__presentServerDialog_completionHandler___block_invoke_2;
  v9[3] = &unk_2643C5300;
  id v10 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "msv_firstWhere:", v9);

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [v6 action];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

uint64_t __69__MPCModelRadioGetTracksStep__presentServerDialog_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) buttonIdentifier];
  if (v4 <= 2)
  {
    a1 = qword_21BEF1978[v4];
    LOBYTE(a1) = [v3 type] == a1;
  }

  return a1 & 1;
}

- (void)_performDefaultHandlingForButtonAction:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x263F89330];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  id v6 = [(ICRadioGetTracksRequest *)self->_request requestContext];
  [v7 handleButtonAction:v5 usingRequestContext:v6 withCompletionHandler:&__block_literal_global_29866];
}

- (void)_fireAndForgetServerDialog:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__MPCModelRadioGetTracksStep__fireAndForgetServerDialog___block_invoke;
  v3[3] = &unk_2643C52B8;
  v3[4] = self;
  [(MPCModelRadioGetTracksStep *)self _presentServerDialog:a3 completionHandler:v3];
}

uint64_t __57__MPCModelRadioGetTracksStep__fireAndForgetServerDialog___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _performDefaultHandlingForButtonAction:a2];
  }
  return result;
}

- (void)performWithCompletionHandler:(id)a3
{
}

- (id)nextStepWithError:(id)a3
{
  id v4 = a3;
  id v5 = [[MPCModelRadioGetTracksStep alloc] initWithPreviousStep:self];
  uint64_t v6 = [v4 copy];

  error = v5->_error;
  v5->_error = (NSError *)v6;

  v5->_finished = 1;

  return v5;
}

- (MPCModelRadioGetTracksStep)initWithPreviousStep:(id)a3
{
  id v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCModelRadioGetTracksStep;
  id v5 = [(MPCModelRadioGetTracksStep *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_delegatedIdentityProperties, v4[4]);
    objc_storeStrong((id *)&v6->_identityProperties, v4[3]);
    objc_storeStrong((id *)&v6->_request, v4[5]);
    objc_storeStrong((id *)&v6->_siriAssetInfoGetTracksResponse, v4[7]);
  }

  return v6;
}

- (MPCModelRadioGetTracksStep)initWithGetTracksRequest:(id)a3 siriAssetInfo:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MPCModelRadioGetTracksStep;
  objc_super v8 = [(MPCModelRadioGetTracksStep *)&v29 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    request = v8->_request;
    v8->_request = (ICRadioGetTracksRequest *)v9;

    if ([v7 length])
    {
      v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v7 options:0];
      if (![v11 length])
      {
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "[MPCModelRadioGetTracksStep] Failed to convert Siri Asset Info into UTF-8 data.", buf, 2u);
        }
        goto LABEL_22;
      }
      id v28 = 0;
      v12 = [MEMORY[0x263F08AC0] propertyListWithData:v11 options:0 format:0 error:&v28];
      v13 = v28;
      if (_NSIsNSDictionary())
      {
        id v14 = objc_alloc(MEMORY[0x263F89298]);
        id v15 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:10800.0];
        os_log_t v16 = (os_log_t)[v14 initWithResponseDictionary:v12 expirationDate:v15];

        uint64_t v17 = [v16 stationMetadata];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = [v16 tracks];
          uint64_t v20 = [v19 count];

          if (v20)
          {
            objc_storeStrong((id *)&v8->_siriAssetInfoGetTracksResponse, v16);
            v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v22 = "[MPCModelRadioGetTracksStep] Using Siri Asset Info as side-packed getTracks response.";
              v23 = v21;
              uint32_t v24 = 2;
LABEL_19:
              _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
            }
LABEL_20:

            goto LABEL_21;
          }
        }
        v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 138543362;
        v31 = v7;
        v22 = "[MPCModelRadioGetTracksStep] Siri Asset Info provided with invalid content: %{public}@";
        v23 = v21;
      }
      else
      {
        os_log_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        BOOL v25 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
        if (v13)
        {
          if (v25)
          {
            *(_DWORD *)buf = 138543362;
            v31 = v13;
            _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, "[MPCModelRadioGetTracksStep] Siri Asset Info failed to deserialize with error: %{public}@.", buf, 0xCu);
          }
          goto LABEL_21;
        }
        if (!v25)
        {
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
        v26 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138543362;
        v31 = v21;
        v22 = "[MPCModelRadioGetTracksStep] Siri Asset Info expected to be a dictionary, but is %{public}@ instead.";
        v23 = v16;
      }
      uint32_t v24 = 12;
      goto LABEL_19;
    }
  }
LABEL_23:

  return v8;
}

@end