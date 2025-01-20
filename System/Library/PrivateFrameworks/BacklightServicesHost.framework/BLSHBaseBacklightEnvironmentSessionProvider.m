@interface BLSHBaseBacklightEnvironmentSessionProvider
- (BLSHBacklightEnvironmentPresentation)presentation;
- (BLSHBacklightInactiveEnvironmentSession)activeSession;
- (BLSHBaseBacklightEnvironmentSessionProvider)init;
- (BOOL)presentationEntrySupportsAlwaysOn:(id)a3;
- (id)createInactiveEnvironmentSession;
- (void)didEndInactiveEnvironmentSession:(id)a3;
- (void)inactiveEnvironmentSession:(id)a3 didUpdateToPresentation:(id)a4;
- (void)setPresentation:(id)a3 withCompletion:(id)a4;
- (void)setPresentationWithFBScenes:(id)a3 flipbookContext:(id)a4 completion:(id)a5;
@end

@implementation BLSHBaseBacklightEnvironmentSessionProvider

- (BLSHBaseBacklightEnvironmentSessionProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)BLSHBaseBacklightEnvironmentSessionProvider;
  v2 = [(BLSHBaseBacklightEnvironmentSessionProvider *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [BLSHBacklightEnvironmentPresentation alloc];
    uint64_t v5 = [(BLSHBacklightEnvironmentPresentation *)v4 initWithPresentationEntries:MEMORY[0x263EFFA68] flipbookContext:0 expirationDate:0];
    lock_presentation = v3->_lock_presentation;
    v3->_lock_presentation = (BLSHBacklightEnvironmentPresentation *)v5;
  }
  return v3;
}

- (BLSHBacklightInactiveEnvironmentSession)activeSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_activeSession;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_presentation;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPresentation:(id)a3 withCompletion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_super v8 = (void (**)(void))a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v9 = objc_msgSend(v7, "presentationEntries", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v15 = [v14 environment];
        objc_msgSend(v15, "setAlwaysOnEnabledForEnvironment:", -[BLSHBaseBacklightEnvironmentSessionProvider presentationEntrySupportsAlwaysOn:](self, "presentationEntrySupportsAlwaysOn:", v14));
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_presentation = self->_lock_presentation;
  p_lock_presentation = &self->_lock_presentation;
  v19 = lock_presentation;
  objc_storeStrong((id *)p_lock_presentation, a3);
  uint64_t v20 = MEMORY[0x223C5E2B0](v8);
  v21 = p_lock_presentation[1];
  p_lock_presentation[1] = (BLSHBacklightEnvironmentPresentation *)v20;

  int v22 = [v7 isEqual:v19];
  v23 = *(p_lock_presentation - 1);
  if (!v23) {
    int v22 = 1;
  }
  if (v22) {
    v24 = 0;
  }
  else {
    v24 = v8;
  }
  uint64_t v25 = MEMORY[0x223C5E2B0](v24);
  v26 = p_lock_presentation[1];
  p_lock_presentation[1] = (BLSHBacklightEnvironmentPresentation *)v25;

  os_unfair_lock_unlock(p_lock);
  if (v22)
  {
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    [(BLSHBacklightEnvironmentPresentation *)v23 setPresentation:v7];
  }
}

- (void)setPresentationWithFBScenes:(id)a3 flipbookContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  objc_msgSend(a3, "bs_mapNoNulls:", &__block_literal_global_30);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [[BLSHBacklightEnvironmentPresentation alloc] initWithPresentationEntries:v11 flipbookContext:v9 expirationDate:0];

  [(BLSHBaseBacklightEnvironmentSessionProvider *)self setPresentation:v10 withCompletion:v8];
}

BLSHPresentationEntry *__102__BLSHBaseBacklightEnvironmentSessionProvider_setPresentationWithFBScenes_flipbookContext_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 backlightSceneHostEnvironment];
  v3 = [[BLSHPresentationEntry alloc] initWithEnvironment:v2 userObject:0];

  return v3;
}

- (void)inactiveEnvironmentSession:(id)a3 didUpdateToPresentation:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_activeSession = self->_lock_activeSession;

  if (__PAIR128__(self->_lock_presentation, (unint64_t)lock_activeSession) == __PAIR128__((unint64_t)v10, (unint64_t)v6))
  {
    id v8 = (void (**)(void))MEMORY[0x223C5E2B0](self->_lock_setPresentationCompletion);
    id lock_setPresentationCompletion = self->_lock_setPresentationCompletion;
    self->_id lock_setPresentationCompletion = 0;

    os_unfair_lock_unlock(&self->_lock);
    if (v8)
    {
      v8[2](v8);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)didEndInactiveEnvironmentSession:(id)a3
{
  v4 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_activeSession == v4)
  {
    self->_lock_activeSession = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  [(BLSHBacklightInactiveEnvironmentSession *)v4 removeObserver:self];
}

- (id)createInactiveEnvironmentSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = +[BLSHBacklightInactiveEnvironmentSession sessionWithPresentation:self->_lock_presentation];
  objc_storeStrong((id *)&self->_lock_activeSession, v4);
  os_unfair_lock_unlock(p_lock);
  [v4 addObserver:self];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_setPresentationCompletion, 0);
  objc_storeStrong((id *)&self->_lock_presentation, 0);

  objc_storeStrong((id *)&self->_lock_activeSession, 0);
}

- (BOOL)presentationEntrySupportsAlwaysOn:(id)a3
{
  return 1;
}

@end