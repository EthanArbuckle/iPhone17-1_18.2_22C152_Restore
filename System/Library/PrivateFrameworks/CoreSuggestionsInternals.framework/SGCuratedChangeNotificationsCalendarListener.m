@interface SGCuratedChangeNotificationsCalendarListener
- (void)startListening;
- (void)stopListening;
@end

@implementation SGCuratedChangeNotificationsCalendarListener

- (void).cxx_destruct
{
}

- (void)stopListening
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_notificationCenterToken];
}

- (void)startListening
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F25460];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SGCuratedChangeNotificationsCalendarListener_startListening__block_invoke;
  v7[3] = &unk_1E65B9030;
  objc_copyWeak(&v8, &location);
  v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
  notificationCenterToken = self->_notificationCenterToken;
  self->_notificationCenterToken = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__SGCuratedChangeNotificationsCalendarListener_startListening__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fire];
}

@end