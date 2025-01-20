@interface RWIProtocolNetworkDomainEventDispatcher(IKJSDependency)
- (void)safe_dataReceivedWithRequestId:()IKJSDependency timestamp:dataLength:encodedDataLength:;
- (void)safe_loadingFailedWithRequestId:()IKJSDependency timestamp:errorText:canceled:;
- (void)safe_loadingFinishedWithRequestId:()IKJSDependency timestamp:sourceMapURL:metrics:;
- (void)safe_requestInterceptedWithRequestId:()IKJSDependency request:;
- (void)safe_requestServedFromMemoryCacheWithRequestId:()IKJSDependency frameId:loaderId:documentURL:timestamp:initiator:resource:;
- (void)safe_requestWillBeSentWithRequestId:()IKJSDependency frameId:loaderId:documentURL:request:timestamp:walltime:initiator:redirectResponse:type:targetId:;
- (void)safe_responseInterceptedWithRequestId:()IKJSDependency response:;
- (void)safe_responseReceivedWithRequestId:()IKJSDependency frameId:loaderId:timestamp:type:response:;
- (void)safe_webSocketClosedWithRequestId:()IKJSDependency timestamp:;
- (void)safe_webSocketCreatedWithRequestId:()IKJSDependency url:;
- (void)safe_webSocketFrameErrorWithRequestId:()IKJSDependency timestamp:errorMessage:;
- (void)safe_webSocketFrameReceivedWithRequestId:()IKJSDependency timestamp:response:;
- (void)safe_webSocketFrameSentWithRequestId:()IKJSDependency timestamp:response:;
- (void)safe_webSocketHandshakeResponseReceivedWithRequestId:()IKJSDependency timestamp:response:;
- (void)safe_webSocketWillSendHandshakeRequestWithRequestId:()IKJSDependency timestamp:walltime:request:;
@end

@implementation RWIProtocolNetworkDomainEventDispatcher(IKJSDependency)

- (void)safe_loadingFinishedWithRequestId:()IKJSDependency timestamp:sourceMapURL:metrics:
{
  v14[4] = *MEMORY[0x1E4F143B8];
  double v12 = a2;
  uint64_t v10 = a6;
  uint64_t v11 = a5;
  id v13 = a4;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v14[3] = &v10;
  v7 = objc_opt_class();
  v8 = [MEMORY[0x1E4F29238] valueWithPointer:v14];
  v9 = objc_msgSend(v7, "ik_invocationforSelectorString:argumentsPointerValue:", @"loadingFinishedWithRequestId:timestamp:sourceMapURL:metrics:", v8);

  [v9 retainArguments];
  [v9 invokeWithTarget:a1];
}

- (void)safe_webSocketFrameErrorWithRequestId:()IKJSDependency timestamp:errorMessage:
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  double v12 = a2;
  id v11 = a5;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v8 = objc_opt_class();
  v9 = [MEMORY[0x1E4F29238] valueWithPointer:v14];
  uint64_t v10 = objc_msgSend(v8, "ik_invocationforSelectorString:argumentsPointerValue:", @"webSocketFrameErrorWithRequestId:timestamp:errorMessage:", v9);

  [v10 retainArguments];
  [v10 invokeWithTarget:a1];
}

- (void)safe_webSocketFrameSentWithRequestId:()IKJSDependency timestamp:response:
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  double v12 = a2;
  id v11 = a5;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v8 = objc_opt_class();
  v9 = [MEMORY[0x1E4F29238] valueWithPointer:v14];
  uint64_t v10 = objc_msgSend(v8, "ik_invocationforSelectorString:argumentsPointerValue:", @"webSocketFrameSentWithRequestId:timestamp:response:", v9);

  [v10 retainArguments];
  [v10 invokeWithTarget:a1];
}

- (void)safe_webSocketWillSendHandshakeRequestWithRequestId:()IKJSDependency timestamp:walltime:request:
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v16 = a5;
  double v14 = a3;
  double v15 = a2;
  id v13 = a6;
  v17[0] = &v16;
  v17[1] = &v15;
  v17[2] = &v14;
  v17[3] = &v13;
  uint64_t v10 = objc_opt_class();
  id v11 = [MEMORY[0x1E4F29238] valueWithPointer:v17];
  double v12 = objc_msgSend(v10, "ik_invocationforSelectorString:argumentsPointerValue:", @"webSocketWillSendHandshakeRequestWithRequestId:timestamp:walltime:request:", v11);

  [v12 retainArguments];
  [v12 invokeWithTarget:a1];
}

- (void)safe_webSocketHandshakeResponseReceivedWithRequestId:()IKJSDependency timestamp:response:
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  double v12 = a2;
  id v11 = a5;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v8 = objc_opt_class();
  v9 = [MEMORY[0x1E4F29238] valueWithPointer:v14];
  uint64_t v10 = objc_msgSend(v8, "ik_invocationforSelectorString:argumentsPointerValue:", @"webSocketHandshakeResponseReceivedWithRequestId:timestamp:response:", v9);

  [v10 retainArguments];
  [v10 invokeWithTarget:a1];
}

- (void)safe_requestWillBeSentWithRequestId:()IKJSDependency frameId:loaderId:documentURL:request:timestamp:walltime:initiator:redirectResponse:type:targetId:
{
  v32[11] = *MEMORY[0x1E4F143B8];
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v28 = a8;
  id v27 = a9;
  double v25 = a3;
  double v26 = a2;
  id v24 = a10;
  v32[0] = &v31;
  v32[1] = &v30;
  v32[2] = &v29;
  v32[3] = &v28;
  v32[4] = &v27;
  v32[5] = &v26;
  v32[6] = &v25;
  v32[7] = &v24;
  v32[8] = &a11;
  v32[9] = &a12;
  v32[10] = &a13;
  v21 = objc_opt_class();
  v22 = [MEMORY[0x1E4F29238] valueWithPointer:v32];
  v23 = objc_msgSend(v21, "ik_invocationforSelectorString:argumentsPointerValue:", @"requestWillBeSentWithRequestId:frameId:loaderId:documentURL:request:timestamp:walltime:initiator:redirectResponse:type:targetId:", v22);

  [v23 retainArguments];
  [v23 invokeWithTarget:a1];
}

- (void)safe_webSocketCreatedWithRequestId:()IKJSDependency url:
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v9 = a4;
  v11[0] = &v10;
  v11[1] = &v9;
  v6 = objc_opt_class();
  v7 = [MEMORY[0x1E4F29238] valueWithPointer:v11];
  v8 = objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", @"webSocketCreatedWithRequestId:url:", v7);

  [v8 retainArguments];
  [v8 invokeWithTarget:a1];
}

- (void)safe_responseReceivedWithRequestId:()IKJSDependency frameId:loaderId:timestamp:type:response:
{
  v23[6] = *MEMORY[0x1E4F143B8];
  id v22 = a4;
  id v21 = a5;
  id v20 = a6;
  double v19 = a2;
  uint64_t v18 = a7;
  id v17 = a8;
  v23[0] = &v22;
  v23[1] = &v21;
  v23[2] = &v20;
  v23[3] = &v19;
  v23[4] = &v18;
  v23[5] = &v17;
  double v14 = objc_opt_class();
  double v15 = [MEMORY[0x1E4F29238] valueWithPointer:v23];
  id v16 = objc_msgSend(v14, "ik_invocationforSelectorString:argumentsPointerValue:", @"responseReceivedWithRequestId:frameId:loaderId:timestamp:type:response:", v15);

  [v16 retainArguments];
  [v16 invokeWithTarget:a1];
}

- (void)safe_webSocketClosedWithRequestId:()IKJSDependency timestamp:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  double v8 = a2;
  id v9 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"webSocketClosedWithRequestId:timestamp:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_requestServedFromMemoryCacheWithRequestId:()IKJSDependency frameId:loaderId:documentURL:timestamp:initiator:resource:
{
  v26[7] = *MEMORY[0x1E4F143B8];
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  double v21 = a2;
  id v20 = a8;
  id v19 = a9;
  v26[0] = &v25;
  v26[1] = &v24;
  v26[2] = &v23;
  v26[3] = &v22;
  v26[4] = &v21;
  v26[5] = &v20;
  v26[6] = &v19;
  id v16 = objc_opt_class();
  id v17 = [MEMORY[0x1E4F29238] valueWithPointer:v26];
  uint64_t v18 = objc_msgSend(v16, "ik_invocationforSelectorString:argumentsPointerValue:", @"requestServedFromMemoryCacheWithRequestId:frameId:loaderId:documentURL:timestamp:initiator:resource:", v17);

  [v18 retainArguments];
  [v18 invokeWithTarget:a1];
}

- (void)safe_responseInterceptedWithRequestId:()IKJSDependency response:
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v9 = a4;
  v11[0] = &v10;
  v11[1] = &v9;
  v6 = objc_opt_class();
  v7 = [MEMORY[0x1E4F29238] valueWithPointer:v11];
  double v8 = objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", @"responseInterceptedWithRequestId:response:", v7);

  [v8 retainArguments];
  [v8 invokeWithTarget:a1];
}

- (void)safe_loadingFailedWithRequestId:()IKJSDependency timestamp:errorText:canceled:
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  double v15 = a2;
  uint64_t v13 = a6;
  id v14 = a5;
  v17[0] = &v16;
  v17[1] = &v15;
  v17[2] = &v14;
  v17[3] = &v13;
  id v10 = objc_opt_class();
  id v11 = [MEMORY[0x1E4F29238] valueWithPointer:v17];
  double v12 = objc_msgSend(v10, "ik_invocationforSelectorString:argumentsPointerValue:", @"loadingFailedWithRequestId:timestamp:errorText:canceled:", v11);

  [v12 retainArguments];
  [v12 invokeWithTarget:a1];
}

- (void)safe_dataReceivedWithRequestId:()IKJSDependency timestamp:dataLength:encodedDataLength:
{
  void v14[4] = *MEMORY[0x1E4F143B8];
  double v12 = a2;
  int v10 = a6;
  int v11 = a5;
  id v13 = a4;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v14[3] = &v10;
  v7 = objc_opt_class();
  double v8 = [MEMORY[0x1E4F29238] valueWithPointer:v14];
  id v9 = objc_msgSend(v7, "ik_invocationforSelectorString:argumentsPointerValue:", @"dataReceivedWithRequestId:timestamp:dataLength:encodedDataLength:", v8);

  [v9 retainArguments];
  [v9 invokeWithTarget:a1];
}

- (void)safe_webSocketFrameReceivedWithRequestId:()IKJSDependency timestamp:response:
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  double v12 = a2;
  id v11 = a5;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  double v8 = objc_opt_class();
  id v9 = [MEMORY[0x1E4F29238] valueWithPointer:v14];
  int v10 = objc_msgSend(v8, "ik_invocationforSelectorString:argumentsPointerValue:", @"webSocketFrameReceivedWithRequestId:timestamp:response:", v9);

  [v10 retainArguments];
  [v10 invokeWithTarget:a1];
}

- (void)safe_requestInterceptedWithRequestId:()IKJSDependency request:
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v9 = a4;
  v11[0] = &v10;
  v11[1] = &v9;
  v6 = objc_opt_class();
  v7 = [MEMORY[0x1E4F29238] valueWithPointer:v11];
  double v8 = objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", @"requestInterceptedWithRequestId:request:", v7);

  [v8 retainArguments];
  [v8 invokeWithTarget:a1];
}

@end