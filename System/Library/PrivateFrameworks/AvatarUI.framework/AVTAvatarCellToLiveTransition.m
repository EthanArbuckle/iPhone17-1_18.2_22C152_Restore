@interface AVTAvatarCellToLiveTransition
- (AVTAvatarCellToLiveTransition)initWithModel:(id)a3 animated:(BOOL)a4 setupHandler:(id)a5 completionHandler:(id)a6 logger:(id)a7;
- (AVTAvatarTransitionModel)avatarTransitionModel;
- (void)performTransition;
@end

@implementation AVTAvatarCellToLiveTransition

- (AVTAvatarCellToLiveTransition)initWithModel:(id)a3 animated:(BOOL)a4 setupHandler:(id)a5 completionHandler:(id)a6 logger:(id)a7
{
  BOOL v10 = a4;
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarCellToLiveTransition;
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

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__AVTAvatarCellToLiveTransition_performTransition__block_invoke;
  v7[3] = &unk_263FF03D8;
  v7[4] = self;
  v5 = (void (**)(void))MEMORY[0x210530210](v7);
  v5[2]();
  v6 = [(AVTTransition *)self completionHandler];
  v6[2](v6, 1);
}

void __50__AVTAvatarCellToLiveTransition_performTransition__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) avatarTransitionModel];
  [v2 transitionLiveViewToFront];

  id v3 = [*(id *)(a1 + 32) avatarTransitionModel];
  [v3 applyFullAlpha];
}

- (AVTAvatarTransitionModel)avatarTransitionModel
{
  return self->_avatarTransitionModel;
}

- (void).cxx_destruct
{
}

@end