@interface _IMDRelayingServiceReachabilityResponseHandler
- (IMServiceReachabilityResult)lastResult;
- (NSData)pushToken;
- (NSString)fromIdentifier;
- (NSString)requestID;
- (NSString)toIdentifier;
- (_IMDRelayingServiceReachabilityResponseHandler)initWithRequestID:(id)a3 pushToken:(id)a4 fromIdentifier:(id)a5 toIdentifier:(id)a6;
- (void)_deferSendingCurrentResultIfNeeded;
- (void)_sendCurrentResult;
- (void)reachabilityRequest:(id)a3 updatedWithResult:(id)a4;
- (void)setFromIdentifier:(id)a3;
- (void)setLastResult:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setToIdentifier:(id)a3;
@end

@implementation _IMDRelayingServiceReachabilityResponseHandler

- (_IMDRelayingServiceReachabilityResponseHandler)initWithRequestID:(id)a3 pushToken:(id)a4 fromIdentifier:(id)a5 toIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_IMDRelayingServiceReachabilityResponseHandler;
  v15 = [(_IMDRelayingServiceReachabilityResponseHandler *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_requestID, a3);
    objc_storeStrong((id *)&v16->_pushToken, a4);
    objc_storeStrong((id *)&v16->_fromIdentifier, a5);
    objc_storeStrong((id *)&v16->_toIdentifier, a6);
  }

  return v16;
}

- (void)_sendCurrentResult
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(_IMDRelayingServiceReachabilityResponseHandler *)self lastResult];

  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = [(_IMDRelayingServiceReachabilityResponseHandler *)self lastResult];
        if ([v6 isFinal]) {
          v7 = @"final";
        }
        else {
          v7 = @"intermediate";
        }
        v8 = [(_IMDRelayingServiceReachabilityResponseHandler *)self requestID];
        v9 = [(_IMDRelayingServiceReachabilityResponseHandler *)self pushToken];
        v10 = [(_IMDRelayingServiceReachabilityResponseHandler *)self fromIdentifier];
        int v20 = 138413058;
        v21 = v7;
        __int16 v22 = 2112;
        v23 = v8;
        __int16 v24 = 2112;
        v25 = v9;
        __int16 v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Sending %@ result for request ID %@ to %@/%@", (uint8_t *)&v20, 0x2Au);
      }
    }
    id v11 = [IMDRelayServiceReachabilityResponse alloc];
    id v12 = [(_IMDRelayingServiceReachabilityResponseHandler *)self lastResult];
    id v13 = [(IMDRelayServiceReachabilityResponse *)v11 initWithResult:v12];

    id v14 = +[IMDRelayServiceController sharedInstance];
    v15 = [(_IMDRelayingServiceReachabilityResponseHandler *)self requestID];
    v16 = [(_IMDRelayingServiceReachabilityResponseHandler *)self pushToken];
    v17 = [(_IMDRelayingServiceReachabilityResponseHandler *)self fromIdentifier];
    objc_super v18 = [(_IMDRelayingServiceReachabilityResponseHandler *)self toIdentifier];
    [v14 sendReachabilityResponse:v13 requestID:v15 toToken:v16 toIdentifier:v17 fromIdentifier:v18];
  }
  else if (v4)
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Not sending current result, no result cached yet?", (uint8_t *)&v20, 2u);
    }
  }
}

- (void)_deferSendingCurrentResultIfNeeded
{
  v3 = [(_IMDRelayingServiceReachabilityResponseHandler *)self lastResult];

  if (v3)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__sendCurrentResult object:0];
    int v4 = [(_IMDRelayingServiceReachabilityResponseHandler *)self lastResult];
    int v5 = [v4 isFinal];

    if (v5)
    {
      MEMORY[0x1F4181798](self, sel__sendCurrentResult);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E4FBA8A8];
      [v7 performSelector:sel__sendCurrentResult withObject:self afterDelay:0.5];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Not sending current result, no result cached yet?", v8, 2u);
    }
  }
}

- (void)reachabilityRequest:(id)a3 updatedWithResult:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [v6 requestID];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Received update for request ID %@", (uint8_t *)&v10, 0xCu);
    }
  }
  [(_IMDRelayingServiceReachabilityResponseHandler *)self setLastResult:v7];
  [(_IMDRelayingServiceReachabilityResponseHandler *)self _deferSendingCurrentResultIfNeeded];
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
}

- (IMServiceReachabilityResult)lastResult
{
  return self->_lastResult;
}

- (void)setLastResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResult, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

@end