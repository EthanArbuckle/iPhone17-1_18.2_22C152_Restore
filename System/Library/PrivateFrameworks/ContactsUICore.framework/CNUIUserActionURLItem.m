@interface CNUIUserActionURLItem
@end

@implementation CNUIUserActionURLItem

id __75___CNUIUserActionURLItem_performActionWithContext_shouldCurateIfPerformed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F334E0];
  v5 = [*(id *)(a1 + 32) channelIdentifier];
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v4)
  {
    v6 = 0;
    goto LABEL_14;
  }
  id v7 = objc_alloc(getTUDialRequestClass_0());
  v6 = objc_msgSend(v7, "cn_initWithURL:", v3);

  if (v6)
  {
    v8 = [v6 provider];
    int v9 = [v8 isTelephonyProvider];

    if (!v9) {
      goto LABEL_14;
    }
    id v10 = objc_alloc(MEMORY[0x263F08C38]);
    v11 = [*(id *)(a1 + 32) channelIdentifier];
    v12 = (void *)[v10 initWithUUIDString:v11];
    [v6 setLocalSenderIdentityAccountUUID:v12];
  }
  else
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:0];
    v13 = [v11 scheme];
    v12 = [v13 lowercaseString];

    if (([v12 isEqualToString:@"sms"] & 1) != 0
      || [v12 isEqualToString:@"imessage"])
    {
      v14 = [v11 queryItems];
      v15 = objc_msgSend(v14, "_cn_filter:", &__block_literal_global_10);
      v16 = v15;
      if (v15) {
        id v17 = v15;
      }
      else {
        id v17 = objc_alloc_init(MEMORY[0x263EFF8C0]);
      }
      v18 = v17;

      v19 = [*(id *)(a1 + 32) channelIdentifier];
      v20 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
      v21 = [v19 stringByAddingPercentEncodingWithAllowedCharacters:v20];

      v22 = [MEMORY[0x263F08BD0] queryItemWithName:@"simid" value:v21];
      v23 = [v18 arrayByAddingObject:v22];
      [v11 setQueryItems:v23];

      uint64_t v24 = [v11 URL];

      v6 = 0;
      id v3 = (id)v24;
    }
    else
    {
      v6 = 0;
    }
  }

LABEL_14:
  if ([*(id *)(a1 + 32) isOriginatingFromFavorites])
  {
    if (!v6)
    {
      id v25 = objc_alloc(getTUDialRequestClass_0());
      v6 = objc_msgSend(v25, "cn_initWithURL:", v3);
    }
    v26 = [v6 provider];
    int v27 = [v26 isFaceTimeProvider];

    if (v27) {
      [v6 setOriginatingUIType:9];
    }
  }
  if (v6)
  {
    uint64_t v28 = [v6 URL];

    id v3 = (id)v28;
  }
  if (_CFMZEnabled() || ![*(id *)(a1 + 40) shouldOpenToBundleIdentifier])
  {
    v29 = 0;
  }
  else
  {
    v29 = [*(id *)(a1 + 40) bundleIdentifier];
  }
  v30 = [*(id *)(a1 + 32) urlOpener];
  uint64_t v31 = [*(id *)(a1 + 40) isSensitive];
  v32 = [*(id *)(a1 + 32) connectionEndpoint];
  v33 = [MEMORY[0x263F33660] globalAsyncScheduler];
  v34 = [v30 openURL:v3 isSensitive:v31 connectionEndpoint:v32 bundleIdentifier:v29 withScheduler:v33];

  return v34;
}

uint64_t __75___CNUIUserActionURLItem_performActionWithContext_shouldCurateIfPerformed___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"simid"] ^ 1;

  return v3;
}

void __75___CNUIUserActionURLItem_performActionWithContext_shouldCurateIfPerformed___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actionRecorder];
  [v2 recordUserAction:*(void *)(a1 + 40)];
}

uint64_t __34___CNUIUserActionURLItem_isEqual___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  uint64_t v3 = [*(id *)(a1 + 32) type];
  uint64_t v4 = [*(id *)(a1 + 40) type];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __34___CNUIUserActionURLItem_isEqual___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  uint64_t v3 = [*(id *)(a1 + 32) label];
  uint64_t v4 = [*(id *)(a1 + 40) label];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __34___CNUIUserActionURLItem_isEqual___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  uint64_t v3 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __34___CNUIUserActionURLItem_isEqual___block_invoke_4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  uint64_t v3 = [*(id *)(a1 + 32) targetHandle];
  uint64_t v4 = [*(id *)(a1 + 40) targetHandle];
  uint64_t v5 = [v2 isString:v3 localizedCaseInsensitiveEqualToOther:v4];

  return v5;
}

uint64_t __30___CNUIUserActionURLItem_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) type];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __30___CNUIUserActionURLItem_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) label];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __30___CNUIUserActionURLItem_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) targetHandle];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __30___CNUIUserActionURLItem_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

@end