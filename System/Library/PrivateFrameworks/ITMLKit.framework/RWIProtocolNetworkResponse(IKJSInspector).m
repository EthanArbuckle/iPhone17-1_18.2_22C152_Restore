@interface RWIProtocolNetworkResponse(IKJSInspector)
+ (id)ik_responseFromURLResponse:()IKJSInspector;
+ (id)ik_responseFromURLResponse:()IKJSInspector forRequest:;
@end

@implementation RWIProtocolNetworkResponse(IKJSInspector)

+ (id)ik_responseFromURLResponse:()IKJSInspector
{
  id v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "ik_responseFromURLResponse:forRequest:", v3, 0);

  return v4;
}

+ (id)ik_responseFromURLResponse:()IKJSInspector forRequest:
{
  v5 = (void *)MEMORY[0x1E4FB6CA8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 allHeaderFields];
  v9 = objc_msgSend(v5, "ik_networkHeadersFromHTTPHeaderFields:", v8);

  v10 = (void *)MEMORY[0x1E4FB6CA8];
  v11 = [v6 allHTTPHeaderFields];

  v12 = objc_msgSend(v10, "ik_networkHeadersFromHTTPHeaderFields:", v11);

  v13 = (void *)MEMORY[0x1E4FB6CD0];
  v14 = [v7 URL];
  v15 = [v14 absoluteString];
  uint64_t v16 = objc_msgSend(v7, "itunes_statusCode");
  v17 = objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", objc_msgSend(v7, "itunes_statusCode"));
  v18 = [v7 MIMEType];

  if (v18) {
    v19 = v18;
  }
  else {
    v19 = &stru_1F3E09950;
  }
  v20 = objc_msgSend(v13, "safe_initWithUrl:status:statusText:headers:mimeType:source:", v15, v16, v17, v9, v19, 1);

  if (v12) {
    [v20 setRequestHeaders:v12];
  }

  return v20;
}

@end