@interface FARequestConfigurator(FamilyCircleUI)
+ (void)addMessageEligibilityToPayload:()FamilyCircleUI;
- (id)_urlEndpointForEventType:()FamilyCircleUI;
- (id)urlProvider;
- (void)_urlForEventType:()FamilyCircleUI withCompletion:;
- (void)requestForContext:()FamilyCircleUI withCompletion:;
@end

@implementation FARequestConfigurator(FamilyCircleUI)

- (id)urlProvider
{
  v0 = objc_opt_new();
  return v0;
}

- (void)requestForContext:()FamilyCircleUI withCompletion:
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__FARequestConfigurator_FamilyCircleUI__requestForContext_withCompletion___block_invoke;
  aBlock[3] = &unk_264348F30;
  id v18 = v7;
  id v8 = v7;
  v9 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  v10 = [v6 urlForContext];

  if (v10)
  {
    v11 = _FALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "Context has url override", v16, 2u);
    }

    v12 = [v6 urlForContext];
    v9[2](v9, v12, 0);
  }
  else
  {
    v13 = [v6 urlEndpoint];

    if (v13)
    {
      v14 = _FALogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_2189F0000, v14, OS_LOG_TYPE_DEFAULT, "Context has urlEndpoint override.", v16, 2u);
      }

      v12 = [a1 urlProvider];
      v15 = [v6 urlEndpoint];
      [v12 URLForEndpoint:v15 withCompletion:v9];
    }
    else
    {
      v12 = [v6 eventType];
      [a1 _urlForEventType:v12 withCompletion:v9];
    }
  }
}

- (void)_urlForEventType:()FamilyCircleUI withCompletion:
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _urlEndpointForEventType:v6];
  v9 = _FALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "Desired enpoint %@ for event type %@", (uint8_t *)&v11, 0x16u);
  }

  if (v8)
  {
    v10 = [a1 urlProvider];
    [v10 URLForEndpoint:v8 withCompletion:v7];
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x263F087E8], "fa_familyErrorWithCode:", -1008);
    v7[2](v7, 0, v10);
  }
}

- (id)_urlEndpointForEventType:()FamilyCircleUI
{
  uint64_t v3 = _urlEndpointForEventType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_urlEndpointForEventType__onceToken, &__block_literal_global_5);
  }
  v5 = [(id)_urlEndpointForEventType__eventTypeToEndpointMap objectForKeyedSubscript:v4];

  return v5;
}

+ (void)addMessageEligibilityToPayload:()FamilyCircleUI
{
  id v4 = a3;
  if (+[FAMessagesInviteConfigurationController isAvailable])
  {
    uint64_t v3 = @"1";
  }
  else
  {
    uint64_t v3 = @"0";
  }
  [v4 setValue:v3 forKey:*MEMORY[0x263F3BDB0]];
}

@end