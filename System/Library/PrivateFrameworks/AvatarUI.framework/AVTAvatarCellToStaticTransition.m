@interface AVTAvatarCellToStaticTransition
- (AVTAvatarCellToStaticTransition)initWithModel:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5 logger:(id)a6;
- (AVTAvatarTransitionModel)avatarTransitionModel;
- (void)performTransition;
@end

@implementation AVTAvatarCellToStaticTransition

- (AVTAvatarCellToStaticTransition)initWithModel:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5 logger:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarCellToStaticTransition;
  v12 = [(AVTTransition *)&v15 initWithModel:v11 animated:v8 setupHandler:0 completionHandler:a5 logger:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_avatarTransitionModel, a3);
  }

  return v13;
}

- (void)performTransition
{
  v3 = [(AVTTransition *)self logger];
  v4 = [(AVTTransition *)self description];
  [v3 logPerformTransition:v4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__AVTAvatarCellToStaticTransition_performTransition__block_invoke;
  v9[3] = &unk_263FF03D8;
  v9[4] = self;
  v5 = (void (**)(void))MEMORY[0x210530210](v9);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__AVTAvatarCellToStaticTransition_performTransition__block_invoke_2;
  v8[3] = &unk_263FF03D8;
  v8[4] = self;
  v6 = (void (**)(void))MEMORY[0x210530210](v8);
  v5[2](v5);
  v6[2](v6);
  v7 = [(AVTTransition *)self completionHandler];
  v7[2](v7, 1);
}

void __52__AVTAvatarCellToStaticTransition_performTransition__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) avatarTransitionModel];
  [v1 transitionStaticViewToFront];
}

void __52__AVTAvatarCellToStaticTransition_performTransition__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) avatarTransitionModel];
  [v1 applyBaseAlpha];
}

- (AVTAvatarTransitionModel)avatarTransitionModel
{
  return self->_avatarTransitionModel;
}

- (void).cxx_destruct
{
}

@end