@interface MPCModelRadioGetTracksRequestStep
- (id)nextStepWithResponse:(id)a3 error:(id)a4;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MPCModelRadioGetTracksRequestStep

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  siriAssetInfoGetTracksResponse = self->super._siriAssetInfoGetTracksResponse;
  if (siriAssetInfoGetTracksResponse)
  {
    v7 = [(MPCModelRadioGetTracksRequestStep *)self nextStepWithResponse:siriAssetInfoGetTracksResponse error:0];
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
  else
  {
    request = self->super._request;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__MPCModelRadioGetTracksRequestStep_performWithCompletionHandler___block_invoke;
    v9[3] = &unk_2643C53F0;
    v9[4] = self;
    id v10 = v4;
    [(ICRadioGetTracksRequest *)request performWithResponseHandler:v9];
  }
}

void __66__MPCModelRadioGetTracksRequestStep_performWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) nextStepWithResponse:a2 error:a3];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

- (id)nextStepWithResponse:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [(MPCModelRadioGetTracksStep *)self nextStepWithError:v8];
    goto LABEL_12;
  }
  v9 = [v7 dialog];
  id v10 = [v7 serverError];
  if (v9)
  {
    id v11 = v9;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v12 = [v11 buttons];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __MPCModelRadioGetTracksDialogIsRetryDialog_block_invoke;
    v16[3] = &unk_2643C5440;
    v16[4] = &v17;
    [v12 enumerateObjectsUsingBlock:v16];

    LODWORD(v12) = *((unsigned __int8 *)v18 + 24);
    _Block_object_dispose(&v17, 8);

    if (v12)
    {
      v13 = [(MPCModelRadioGetTracksStep *)[MPCModelRadioGetTracksRetryDialogStep alloc] initWithPreviousStep:self];
      objc_storeStrong((id *)&v13->super._error, v10);
      p_response = (id *)&v13->super._response;
LABEL_10:
      objc_storeStrong(p_response, a3);
      goto LABEL_11;
    }
    [(MPCModelRadioGetTracksStep *)self _fireAndForgetServerDialog:v11];
  }
  if (!v10)
  {
    v13 = [[MPCModelRadioGetTracksStep alloc] initWithPreviousStep:self];
    v13->super._finished = 1;
    p_response = (id *)&v13->super._response;
    goto LABEL_10;
  }
  v13 = [(MPCModelRadioGetTracksStep *)self nextStepWithError:v10];
LABEL_11:

LABEL_12:

  return v13;
}

@end