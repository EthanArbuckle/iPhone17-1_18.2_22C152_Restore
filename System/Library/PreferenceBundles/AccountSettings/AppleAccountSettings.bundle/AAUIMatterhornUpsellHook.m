@interface AAUIMatterhornUpsellHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_matterhornUpsell:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
@end

@implementation AAUIMatterhornUpsellHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  unsigned __int8 v4 = [@"action:matterhornUpsell" isEqualToString:v3];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  unsigned __int8 v4 = [v3 objectForKeyedSubscript:AAUIClientInfoActionKey];
  unsigned __int8 v5 = [@"action:matterhornUpsell" isEqualToString:v4];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = _AAUILogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "matterhorn upsell with element %@ and objectmodel %@", (uint8_t *)&v13, 0x16u);
  }

  [(AAUIMatterhornUpsellHook *)self _matterhornUpsell:v11];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "matterhorn upsell with objectModel %@", (uint8_t *)&v9, 0xCu);
  }

  [(AAUIMatterhornUpsellHook *)self _matterhornUpsell:v7];
}

- (void)_matterhornUpsell:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)ICQUpgradeFlowManager) initWithJourneyId:@"settingsHideMyEmail"];
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_48DD4((uint64_t)v5, v6);
  }

  if (v5)
  {
    id v7 = [v4 copy];
    v8 = (void *)_hookCompletion;
    _hookCompletion = (uint64_t)v7;

    [v5 setDelegate:self];
    int v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "starting matterhorn journey", v10, 2u);
    }

    [v5 beginJourney];
  }
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_48E4C(v3);
  }

  uint64_t v4 = _hookCompletion;
  if (_hookCompletion)
  {
    id v5 = +[NSError errorWithDomain:AAErrorDomain code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_48E90(v3);
  }

  if (_hookCompletion) {
    (*(void (**)(void))(_hookCompletion + 16))();
  }
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end