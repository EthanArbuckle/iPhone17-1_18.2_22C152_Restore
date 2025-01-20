@interface LSApplicationIdentityEnumerator
- (LSApplicationIdentityEnumerator)initWithAppEnumerationOptions:(unint64_t)a3;
- (id)nextObject;
@end

@implementation LSApplicationIdentityEnumerator

- (LSApplicationIdentityEnumerator)initWithAppEnumerationOptions:(unint64_t)a3
{
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  id v25 = 0;
  char v26 = 0;
  id v27 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v5, 0);

  v23.receiver = self;
  v23.super_class = (Class)LSApplicationIdentityEnumerator;
  v7 = [(LSEnumerator *)&v23 _initWithContext:v6];
  if (v7)
  {
    if (v6)
    {
      v8 = [[_LSApplicationRecordEnumerator alloc] initWithContext:v6 volumeURL:0 options:a3];
      v9 = (void *)v7[5];
      v7[5] = v8;

      v10 = (void *)v7[7];
      v7[7] = 0;

      objc_initWeak(&location, v7);
      v11 = (void *)v7[5];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __65__LSApplicationIdentityEnumerator_initWithAppEnumerationOptions___block_invoke;
      v20[3] = &unk_1E522BAF0;
      objc_copyWeak(&v21, &location);
      [v11 setErrorHandler:v20];
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v12, 0);

      if (v13) {
        id v14 = 0;
      }
      else {
        id v14 = v27;
      }
      v15 = (void *)v7[4];
      v7[4] = v14;
    }
  }
  v16 = v7;
  if (CurrentContext && v26) {
    _LSContextDestroy(CurrentContext);
  }
  id v17 = v25;
  CurrentContext = 0;
  id v25 = 0;

  char v26 = 0;
  id v18 = v27;
  id v27 = 0;

  return v16;
}

void __65__LSApplicationIdentityEnumerator_initWithAppEnumerationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (atomic_uchar *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    _LSEnumeratorFireErrorHandler(WeakRetained, v5);
  }
}

- (id)nextObject
{
  ctxError = self->_ctxError;
  if (ctxError)
  {
    _LSEnumeratorFireErrorHandler((atomic_uchar *)self, ctxError);
  }
  else
  {
    do
    {
      currentRecordIdentitiesEnumerator = self->_currentRecordIdentitiesEnumerator;
      if (!currentRecordIdentitiesEnumerator
        || ([(NSEnumerator *)currentRecordIdentitiesEnumerator nextObject],
            (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        NextObject = (LSApplicationRecord *)_LSDBEnumeratorGetNextObject((uint64_t)self->_recordEnumerator);
        currentRecord = self->_currentRecord;
        self->_currentRecord = NextObject;

        v8 = [(LSApplicationRecord *)self->_currentRecord identities];
        v9 = [v8 objectEnumerator];
        v10 = self->_currentRecordIdentitiesEnumerator;
        self->_currentRecordIdentitiesEnumerator = v9;

        id v5 = [(NSEnumerator *)self->_currentRecordIdentitiesEnumerator nextObject];
        if (!v5) {
          continue;
        }
      }
      v11 = [(LSEnumerator *)self filter];
      char v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v5);

      if (v12) {
        goto LABEL_10;
      }
    }
    while (self->_currentRecord);
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRecordIdentitiesEnumerator, 0);
  objc_storeStrong((id *)&self->_currentRecord, 0);
  objc_storeStrong((id *)&self->_recordEnumerator, 0);

  objc_storeStrong((id *)&self->_ctxError, 0);
}

@end