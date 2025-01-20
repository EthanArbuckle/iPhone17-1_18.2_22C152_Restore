@interface NIAcwgEventNotifier
- (NIAcwgEventNotifier)initWithParentSession:(id)a3;
- (void)notifyLockStatusChanged:(unsigned __int16)a3;
- (void)notifyUrskCreated:(unsigned int)a3;
@end

@implementation NIAcwgEventNotifier

- (NIAcwgEventNotifier)initWithParentSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NIAcwgEventNotifier;
  v5 = [(NIAcwgEventNotifier *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->parentSession, v4);
  }

  return v6;
}

- (void)notifyUrskCreated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained prefetchAcwgUrsk:v3];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2324 description:@"Parent session is nil"];
  }
}

- (void)notifyLockStatusChanged:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _processUpdatedLockState:v3];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2334 description:@"Parent session is nil"];
  }
}

- (void).cxx_destruct
{
}

@end