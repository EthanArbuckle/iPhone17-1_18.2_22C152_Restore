@interface AVTAvatarToLiveTransition
- (AVTAvatarToLiveTransition)initWithModel:(id)a3 animated:(BOOL)a4 setupHandler:(id)a5 completionHandler:(id)a6 logger:(id)a7;
- (AVTAvatarTransitionModel)avatarTransitionModel;
- (void)performTransition;
@end

@implementation AVTAvatarToLiveTransition

- (AVTAvatarToLiveTransition)initWithModel:(id)a3 animated:(BOOL)a4 setupHandler:(id)a5 completionHandler:(id)a6 logger:(id)a7
{
  BOOL v10 = a4;
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarToLiveTransition;
  v14 = [(AVTTransition *)&v17 initWithModel:v13 animated:v10 setupHandler:a5 completionHandler:a6 logger:a7];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_avatarTransitionModel, a3);
  }

  return v15;
}

- (void)performTransition
{
  v3 = [(AVTTransition *)self logger];
  v4 = [(AVTTransition *)self description];
  [v3 logPerformTransition:v4];

  v5 = [(AVTAvatarToLiveTransition *)self avatarTransitionModel];
  v6 = [v5 liveView];

  v7 = [v6 avatar];

  if (!v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Can't perform transition without an AVTView with an avatar"];
  }
  v8 = [(AVTAvatarToLiveTransition *)self avatarTransitionModel];
  [v8 transitionLiveViewToFront];

  v9 = [(AVTAvatarToLiveTransition *)self avatarTransitionModel];
  [v9 applyFullAlpha];

  if ([(AVTTransition *)self animated])
  {
    BOOL v10 = [(AVTTransition *)self logger];
    v11 = [(AVTTransition *)self description];
    objc_msgSend(v10, "logTransition:state:reachedStage:", v11, -[AVTTransition state](self, "state"), 1);

    if ([(AVTTransition *)self state] == 1)
    {
      v12 = [(AVTTransition *)self logger];
      id v13 = [(AVTTransition *)self description];
      [v12 logToLivePoseTransitionBegins:v13];

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __46__AVTAvatarToLiveTransition_performTransition__block_invoke;
      v15[3] = &unk_263FF03D8;
      v15[4] = self;
      [v6 transitionToFaceTrackingWithDuration:v15 completionHandler:0.25];
    }
  }
  else
  {
    [v6 transitionToFaceTrackingWithDuration:0 completionHandler:0.0];
    v14 = [(AVTTransition *)self completionHandler];
    v14[2](v14, 1);
  }
}

void __46__AVTAvatarToLiveTransition_performTransition__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logger];
  v3 = [*(id *)(a1 + 32) description];
  [v2 logToLivePoseTransitionEnds:v3];

  v4 = [*(id *)(a1 + 32) logger];
  v5 = [*(id *)(a1 + 32) description];
  objc_msgSend(v4, "logTransition:state:reachedStage:", v5, objc_msgSend(*(id *)(a1 + 32), "state"), 2);

  if ([*(id *)(a1 + 32) state] == 1)
  {
    v6 = [*(id *)(a1 + 32) completionHandler];
    v6[2](v6, 1);
  }
}

- (AVTAvatarTransitionModel)avatarTransitionModel
{
  return self->_avatarTransitionModel;
}

- (void).cxx_destruct
{
}

@end