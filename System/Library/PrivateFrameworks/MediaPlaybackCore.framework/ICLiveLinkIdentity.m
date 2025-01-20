@interface ICLiveLinkIdentity
@end

@implementation ICLiveLinkIdentity

void __79__ICLiveLinkIdentity_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"serverID"];
  objc_msgSend(v15, "setServerID:", objc_msgSend(v3, "integerValue"));

  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"identifier"];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F08C38]);
    v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"identifier"];
    v7 = (void *)[v5 initWithUUIDString:v6];
    [v15 setIdentifier:v7];
  }
  else
  {
    [v15 setIdentifier:0];
  }

  v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"externalID"];
  [v15 setExternalIdentifier:v8];

  v9 = (void *)MEMORY[0x263F08A68];
  v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"nameComponents"];
  v11 = [v9 payloadValueFromJSONValue:v10];
  [v15 setNameComponents:v11];

  v12 = NSURL;
  v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"imageURL"];
  v14 = [v12 payloadValueFromJSONValue:v13];
  [v15 setImageURL:v14];
}

@end