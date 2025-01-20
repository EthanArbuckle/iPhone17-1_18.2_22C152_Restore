@interface StocksSyncPreferences
- (StocksSyncPersistable)persistence;
- (StocksSyncPreferences)initWithPersistence:(id)a3 delegate:(id)a4;
- (StocksSyncPreferencesDelegate)delegate;
@end

@implementation StocksSyncPreferences

- (StocksSyncPreferences)initWithPersistence:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)StocksSyncPreferences;
  v9 = [(StocksSyncPreferences *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistence, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (StocksSyncPersistable)persistence
{
  return self->_persistence;
}

- (StocksSyncPreferencesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (StocksSyncPreferencesDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_persistence, 0);
}

@end