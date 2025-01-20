@interface MPCModelRadioGetTracksEstablishAccountStep
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MPCModelRadioGetTracksEstablishAccountStep

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(ICRadioGetTracksRequest *)self->super._request requestContext];
  v6 = [v5 identityStore];
  v7 = [v5 identity];
  id v13 = 0;
  v8 = [v6 getVerificationContextForUserIdentity:v7 error:&v13];
  id v9 = v13;

  if (v8)
  {
    [v8 setInteractionLevel:4];
    v10 = (MPCModelRadioGetTracksPrepareIdentityStep *)[objc_alloc(MEMORY[0x263F893D8]) initWithVerificationContext:v8];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__MPCModelRadioGetTracksEstablishAccountStep_performWithCompletionHandler___block_invoke;
    v11[3] = &unk_2643C5350;
    v11[4] = self;
    id v12 = v4;
    [(MPCModelRadioGetTracksPrepareIdentityStep *)v10 performWithResponseHandler:v11];
  }
  else
  {
    v10 = [(MPCModelRadioGetTracksStep *)[MPCModelRadioGetTracksPrepareIdentityStep alloc] initWithPreviousStep:self];
    (*((void (**)(id, MPCModelRadioGetTracksPrepareIdentityStep *))v4 + 2))(v4, v10);
  }
}

void __75__MPCModelRadioGetTracksEstablishAccountStep_performWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = [(MPCModelRadioGetTracksStep *)[MPCModelRadioGetTracksPrepareIdentityStep alloc] initWithPreviousStep:*(void *)(a1 + 32)];
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "nextStepWithError:");
    v3 = (MPCModelRadioGetTracksPrepareIdentityStep *)objc_claimAutoreleasedReturnValue();
    id v4 = *(void (**)(void))(v5 + 16);
  }
  v6 = v3;
  v4();
}

@end