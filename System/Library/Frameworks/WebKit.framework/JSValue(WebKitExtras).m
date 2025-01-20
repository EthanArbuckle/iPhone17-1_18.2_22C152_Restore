@interface JSValue(WebKitExtras)
- (BOOL)_isFunction;
- (id)_toJSONString;
- (id)_toSortedJSONString;
- (uint64_t)_isDictionary;
- (uint64_t)_isRegularExpression;
- (uint64_t)_isThenable;
- (void)_awaitThenableResolutionWithCompletionHandler:()WebKitExtras;
@end

@implementation JSValue(WebKitExtras)

- (id)_toJSONString
{
  v2 = [a1 context];
  v3 = (WebKit *)[v2 JSGlobalContextRef];
  v4 = (const OpaqueJSContext *)[a1 JSValueRef];
  v6 = WebKit::serializeJSObject(v3, v4, 0, v5);

  return v6;
}

- (id)_toSortedJSONString
{
  v1 = [a1 _toJSONString];
  v2 = [v1 dataUsingEncoding:4];

  if (!v2)
  {
    v5 = 0;
    goto LABEL_9;
  }
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v2 options:4 error:0];
  if (!v3) {
    goto LABEL_7;
  }
  uint64_t v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:6 error:0];

  if (!v4)
  {
    v2 = 0;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  v2 = (void *)v4;
LABEL_8:

LABEL_9:

  return v5;
}

- (BOOL)_isFunction
{
  v2 = [a1 context];
  v3 = (const OpaqueJSContext *)[v2 JSGlobalContextRef];

  uint64_t v4 = (const OpaqueJSValue *)[a1 JSValueRef];
  if (!v4) {
    return 0;
  }
  v5 = v4;
  if (!JSValueIsObject(v3, v4)) {
    return 0;
  }
  v6 = JSValueToObject(v3, v5, 0);
  if (!v6) {
    return 0;
  }

  return JSObjectIsFunction(v3, v6);
}

- (uint64_t)_isDictionary
{
  if (![a1 isObject]) {
    return 0;
  }
  v2 = [a1 objectForKeyedSubscript:@"__proto__"];
  v3 = [a1 context];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"Object"];
  v5 = [v4 objectForKeyedSubscript:@"prototype"];
  if ([v2 isEqualToObject:v5]) {
    uint64_t v6 = [a1 _isThenable] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)_isRegularExpression
{
  if (![a1 isObject]) {
    return 0;
  }
  v2 = [a1 context];
  v3 = [v2 objectForKeyedSubscript:@"RegExp"];
  uint64_t v4 = [a1 isInstanceOf:v3];

  return v4;
}

- (uint64_t)_isThenable
{
  if (![a1 isObject]) {
    return 0;
  }
  v2 = [a1 objectForKeyedSubscript:@"then"];
  objc_opt_class();
  v3 = WTF::dynamic_objc_cast<JSValue>(v2);
  uint64_t v4 = [v3 _isFunction];

  return v4;
}

- (void)_awaitThenableResolutionWithCompletionHandler:()WebKitExtras
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__JSValue_WebKitExtras___awaitThenableResolutionWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E5811B08;
  id v5 = v4;
  id v16 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__JSValue_WebKitExtras___awaitThenableResolutionWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5811B08;
  id v7 = v5;
  id v14 = v7;
  v8 = _Block_copy(v13);
  v9 = _Block_copy(v6);
  v17[0] = v9;
  v10 = _Block_copy(v8);
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v12 = (id)[a1 invokeMethod:@"then" withArguments:v11];
}

@end