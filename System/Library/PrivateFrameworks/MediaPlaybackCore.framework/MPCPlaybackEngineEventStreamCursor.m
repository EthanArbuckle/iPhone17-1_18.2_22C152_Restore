@interface MPCPlaybackEngineEventStreamCursor
@end

@implementation MPCPlaybackEngineEventStreamCursor

void __95___MPCPlaybackEngineEventStreamCursor__statementForColumnsExpression_eventTypes_payload_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = NSString;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v8 = a2;
  v9 = objc_msgSend(v6, "stringWithFormat:", @"@payload_key_%d", v7);
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"@payload_value_%d", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  [*(id *)(a1 + 32) bindStringValue:v8 toParameterNamed:v9];

  if (_NSIsNSNumber())
  {
    objc_msgSend(*(id *)(a1 + 32), "bindInt64Value:toParameterNamed:", objc_msgSend(v5, "longLongValue"), v10);
  }
  else if (_NSIsNSString())
  {
    [*(id *)(a1 + 32) bindStringValue:v5 toParameterNamed:v10];
  }
  else
  {
    id v11 = [MEMORY[0x263EFF9D0] null];

    if (v11 == v5)
    {
      [*(id *)(a1 + 32) bindNullValueToParameterNamed:v10];
    }
    else if (_NSIsNSArray())
    {
      v12 = *(void **)(a1 + 32);
      id v17 = 0;
      [v12 bindJSONValue:v5 toParameterNamed:v10 error:&v17];
      id v13 = v17;
      if (v13)
      {
        id v16 = v13;
        v15 = [MEMORY[0x263F08690] currentHandler];
        [v15 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"MPCPlaybackEngineEventStream.m", 1168, @"Unable to convert payload value to JSON: %@", v5 object file lineNumber description];

        id v13 = v16;
      }
    }
    else
    {
      v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"MPCPlaybackEngineEventStream.m", 1170, @"Unknown payload value type for query: %@", v5 object file lineNumber description];
    }
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

@end