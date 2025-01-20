@interface CHUISContentConfirmationAction
- (CHUISContentConfirmationAction)initWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation CHUISContentConfirmationAction

- (CHUISContentConfirmationAction)initWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F4F670];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__CHUISContentConfirmationAction_initWithTimeout_queue_completion___block_invoke;
  v16[3] = &unk_1E62AF478;
  id v11 = v9;
  id v17 = v11;
  v12 = [v10 responderWithHandler:v16];
  [v12 setQueue:v8];
  objc_msgSend(v12, "setTimeout:", dispatch_time(0, (uint64_t)(a3 * 1000000000.0)));
  v15.receiver = self;
  v15.super_class = (Class)CHUISContentConfirmationAction;
  v13 = [(CHUISContentConfirmationAction *)&v15 initWithInfo:0 responder:v12];

  return v13;
}

void __67__CHUISContentConfirmationAction_initWithTimeout_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 error];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    v5 = [v6 error];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

@end