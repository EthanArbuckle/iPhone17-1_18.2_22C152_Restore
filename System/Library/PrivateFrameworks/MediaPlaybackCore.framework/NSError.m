@interface NSError
@end

@implementation NSError

id __63__NSError_MPCPlaybackEngineEventPayload__mpc_userInfoJSONValue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (!_NSIsNSString())
  {
    v7 = 0;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F08608]])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_10:
      uint64_t v6 = objc_msgSend(v5, "mpc_jsonValue");
      goto LABEL_12;
    }
  }
  if (![v4 isEqualToString:*MEMORY[0x263F083F0]] || !_NSIsNSArray())
  {
    if (![v4 isEqualToString:*MEMORY[0x263F08590]]
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v6 = _MPCJSONSanitizedValue(v5);
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  uint64_t v6 = objc_msgSend(v5, "msv_compactMap:", &__block_literal_global_64);
LABEL_12:
  v7 = (void *)v6;
LABEL_13:

  return v7;
}

id __63__NSError_MPCPlaybackEngineEventPayload__mpc_userInfoJSONValue__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = objc_msgSend(v2, "mpc_jsonValue");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __68__NSError_MPCPlaybackEngineEventPayload__mpc_userInfoFromJSONValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F08608]])
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
LABEL_7:
    id v7 = [v6 payloadValueFromJSONValue:v5];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F083F0]])
  {
    objc_msgSend(v5, "msv_map:", &__block_literal_global_69);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F08590]])
  {
    uint64_t v6 = NSURL;
    goto LABEL_7;
  }
  id v7 = v5;
LABEL_8:
  v8 = v7;

  return v8;
}

uint64_t __68__NSError_MPCPlaybackEngineEventPayload__mpc_userInfoFromJSONValue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F087E8] payloadValueFromJSONValue:a2];
}

@end