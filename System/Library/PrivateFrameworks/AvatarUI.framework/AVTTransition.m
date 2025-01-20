@interface AVTTransition
- (AVTTransition)initWithModel:(id)a3 animated:(BOOL)a4 setupHandler:(id)a5 completionHandler:(id)a6 logger:(id)a7;
- (AVTTransitionModel)model;
- (AVTUILogger)logger;
- (BOOL)animated;
- (NSString)description;
- (id)completionHandler;
- (id)setupHandler;
- (int64_t)state;
- (void)cancel;
- (void)setAnimated:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setSetupHandler:(id)a3;
- (void)setState:(int64_t)a3;
- (void)start;
@end

@implementation AVTTransition

- (AVTTransition)initWithModel:(id)a3 animated:(BOOL)a4 setupHandler:(id)a5 completionHandler:(id)a6 logger:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AVTTransition;
  v17 = [(AVTTransition *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_model, a3);
    v18->_animated = a4;
    if (v14)
    {
      uint64_t v19 = [v14 copy];
      id setupHandler = v18->_setupHandler;
      v18->_id setupHandler = (id)v19;
    }
    if (v15)
    {
      uint64_t v21 = [v15 copy];
      id completionHandler = v18->_completionHandler;
      v18->_id completionHandler = (id)v21;
    }
    objc_storeStrong((id *)&v18->_logger, a7);
  }

  return v18;
}

- (void)start
{
  v3 = [(AVTTransition *)self logger];
  v4 = [(AVTTransition *)self description];
  objc_msgSend(v3, "logStartTransition:state:", v4, -[AVTTransition state](self, "state"));

  if ([(AVTTransition *)self state] == 2)
  {
    v7 = [(AVTTransition *)self completionHandler];
    v7[2](v7, 0);
  }
  else
  {
    if ([(AVTTransition *)self state]) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"-[AVTTransition start] was called twice"];
    }
    [(AVTTransition *)self setState:1];
    v5 = [(AVTTransition *)self setupHandler];

    if (v5)
    {
      v6 = [(AVTTransition *)self setupHandler];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __22__AVTTransition_start__block_invoke;
      v8[3] = &unk_263FF04A0;
      v8[4] = self;
      ((void (**)(void, void *))v6)[2](v6, v8);
    }
    else
    {
      [(AVTTransition *)self performTransition];
    }
  }
}

void __22__AVTTransition_start__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) logger];
  v5 = [*(id *)(a1 + 32) description];
  objc_msgSend(v4, "logSetupHandlerCompletedForTransition:state:finished:", v5, objc_msgSend(*(id *)(a1 + 32), "state"), a2);

  if ([*(id *)(a1 + 32) state] == 1)
  {
    v6 = *(void **)(a1 + 32);
    if (a2)
    {
      [v6 performTransition];
    }
    else
    {
      v7 = [v6 completionHandler];
      v7[2](v7, 0);
    }
  }
}

- (void)cancel
{
  v3 = [(AVTTransition *)self logger];
  v4 = [(AVTTransition *)self description];
  [v3 logCancelTransition:v4];

  int64_t v5 = [(AVTTransition *)self state];
  [(AVTTransition *)self setState:2];
  [(AVTTransition *)self performCancellation];
  if (v5 == 1)
  {
    v6 = [(AVTTransition *)self completionHandler];
    v6[2](v6, 0);
  }
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)AVTTransition;
  v3 = [(AVTTransition *)&v10 description];
  v4 = (void *)[v3 mutableCopy];

  int64_t v5 = [(AVTTransition *)self model];
  objc_msgSend(v4, "appendFormat:", @" model: %p", v5);

  BOOL v6 = [(AVTTransition *)self animated];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  [v4 appendFormat:@" animated: %@", v7];
  v8 = (void *)[v4 copy];

  return (NSString *)v8;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (AVTTransitionModel)model
{
  return self->_model;
}

- (id)setupHandler
{
  return self->_setupHandler;
}

- (void)setSetupHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_setupHandler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end