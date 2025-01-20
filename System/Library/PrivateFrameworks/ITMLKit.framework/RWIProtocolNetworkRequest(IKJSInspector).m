@interface RWIProtocolNetworkRequest(IKJSInspector)
+ (id)ik_networkRequestFromURLRequest:()IKJSInspector;
@end

@implementation RWIProtocolNetworkRequest(IKJSInspector)

+ (id)ik_networkRequestFromURLRequest:()IKJSInspector
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4FB6CA8];
  v5 = [v3 allHTTPHeaderFields];
  v6 = objc_msgSend(v4, "ik_networkHeadersFromHTTPHeaderFields:", v5);

  v7 = (void *)MEMORY[0x1E4FB6CC0];
  v8 = [v3 URL];
  v9 = [v8 absoluteString];
  v10 = [v3 HTTPMethod];
  v11 = objc_msgSend(v7, "safe_initWithUrl:method:headers:", v9, v10, v6);

  v12 = [v3 HTTPBody];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    id v14 = [NSString alloc];
    v15 = [v3 HTTPBody];
    v16 = (void *)[v14 initWithData:v15 encoding:4];
    [v11 setPostData:v16];
  }
  else
  {
    v17 = [v3 HTTPBodyStream];

    if (v17)
    {
      v18 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        +[RWIProtocolNetworkRequest(IKJSInspector) ik_networkRequestFromURLRequest:](v18);
      }
    }
  }

  return v11;
}

+ (void)ik_networkRequestFromURLRequest:()IKJSInspector .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E2ACE000, log, OS_LOG_TYPE_DEBUG, "Building postData for HTTPBodyStream not currently supported", v1, 2u);
}

@end