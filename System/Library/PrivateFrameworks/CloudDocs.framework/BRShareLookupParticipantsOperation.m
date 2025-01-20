@interface BRShareLookupParticipantsOperation
- (BRShareLookupParticipantsOperation)initWithUserIdentities:(id)a3;
- (id)lookupParticipantsCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setLookupParticipantsCompletionBlock:(id)a3;
@end

@implementation BRShareLookupParticipantsOperation

- (BRShareLookupParticipantsOperation)initWithUserIdentities:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRShareLookupParticipantsOperation;
  v6 = [(BRShareOperation *)&v9 initWithDirectConnection];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userIdentities, a3);
  }

  return v7;
}

- (void)main
{
  v3 = [(BRShareOperation *)self remoteObject];
  userIdentities = self->_userIdentities;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__BRShareLookupParticipantsOperation_main__block_invoke;
  v5[3] = &unk_1E59AD558;
  v5[4] = self;
  [v3 startOperation:self toLookupShareParticipants:userIdentities reply:v5];
}

uint64_t __42__BRShareLookupParticipantsOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:a2 error:a3];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRShareLookupParticipantsOperation *)self lookupParticipantsCompletionBlock];
  objc_super v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(BRShareLookupParticipantsOperation *)self setLookupParticipantsCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareLookupParticipantsOperation;
  [(BROperation *)&v10 finishWithResult:v6 error:v7];
}

- (id)lookupParticipantsCompletionBlock
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setLookupParticipantsCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lookupParticipantsCompletionBlock, 0);

  objc_storeStrong((id *)&self->_userIdentities, 0);
}

@end