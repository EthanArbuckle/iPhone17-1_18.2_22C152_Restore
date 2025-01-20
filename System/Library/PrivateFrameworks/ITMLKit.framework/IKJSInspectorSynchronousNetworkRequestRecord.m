@interface IKJSInspectorSynchronousNetworkRequestRecord
@end

@implementation IKJSInspectorSynchronousNetworkRequestRecord

void __82___IKJSInspectorSynchronousNetworkRequestRecord_willSendRequest_redirectResponse___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *((void *)a1 + 4);
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E4FB6CD0], "ik_responseFromURLResponse:forRequest:", v4, *((void *)a1 + 5));
  }
  else
  {
    v5 = 0;
  }
  uint64_t v18 = [(id)objc_opt_class() _protocolResourceTypeForType:*((void *)a1 + 13)];
  v6 = [v3 dispatcher];
  v7 = v6;
  uint64_t v8 = *((void *)a1 + 7);
  uint64_t v9 = *((void *)a1 + 8);
  uint64_t v10 = *((void *)a1 + 9);
  uint64_t v11 = *((void *)a1 + 10);
  double v12 = a1[14];
  double v13 = a1[15];
  uint64_t v14 = *((void *)a1 + 11);
  uint64_t v15 = *((void *)a1 + 12);
  if (v5)
  {
    id v17 = v5;
    objc_msgSend(v6, "safe_requestWillBeSentWithRequestId:frameId:loaderId:documentURL:request:timestamp:walltime:initiator:redirectResponse:type:targetId:", v8, v9, v10, v11, v14, v15, v12, v13, &v17, &v18, 0);
    id v16 = v17;
  }
  else
  {
    objc_msgSend(v6, "safe_requestWillBeSentWithRequestId:frameId:loaderId:documentURL:request:timestamp:walltime:initiator:redirectResponse:type:targetId:", v8, v9, v10, v11, v14, v15, v12, v13, 0, &v18, 0);
  }
}

void __79___IKJSInspectorSynchronousNetworkRequestRecord_didReceiveResponse_timingData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 dispatcher];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = [v3 parentIdentifier];
  v6 = [v3 identifier];

  objc_msgSend(v7, "safe_responseReceivedWithRequestId:frameId:loaderId:timestamp:type:response:", v4, v5, v6, *(void *)(a1 + 56), *(void *)(a1 + 40), *(double *)(a1 + 48));
}

void __64___IKJSInspectorSynchronousNetworkRequestRecord_didReceiveData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 dispatcher];
  objc_msgSend(v3, "safe_dataReceivedWithRequestId:timestamp:dataLength:encodedDataLength:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 48), 0, *(double *)(a1 + 40));
}

void __66___IKJSInspectorSynchronousNetworkRequestRecord_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 dispatcher];
  double v3 = *(double *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = [*(id *)(a1 + 40) localizedDescription];
  objc_msgSend(v6, "safe_loadingFailedWithRequestId:timestamp:errorText:canceled:", v4, v5, 0, v3);
}

void __84___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingWithResponseBody___block_invoke(double *a1, void *a2)
{
  double v3 = (void *)MEMORY[0x1E4FB6CB8];
  uint64_t v4 = *((void *)a1 + 4);
  uint64_t v5 = *((void *)a1 + 5);
  uint64_t v6 = *((void *)a1 + 6);
  uint64_t v7 = *((void *)a1 + 7);
  id v8 = a2;
  uint64_t v9 = objc_msgSend(v3, "ik_networkMetricsFromURLRequest:response:responseBody:timingData:", v4, v5, v6, v7);
  uint64_t v10 = [v8 dispatcher];

  uint64_t v11 = *((void *)a1 + 8);
  double v12 = a1[9];
  id v14 = v9;
  objc_msgSend(v10, "safe_loadingFinishedWithRequestId:timestamp:sourceMapURL:metrics:", v11, 0, &v14, v12);
  id v13 = v14;
}

uint64_t __103___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromCache_mimeType_withResponseBody___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

void __99___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromCache_withResponseBodyBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v11) {
      [WeakRetained _didCompleteLoadingFromCache:*(void *)(a1 + 40) mimeType:v7 withResponseBody:v11 timestamp:*(double *)(a1 + 48)];
    }
    else {
      [WeakRetained didFailWithError:v8];
    }
  }
}

void __114___IKJSInspectorSynchronousNetworkRequestRecord__didCompleteLoadingFromCache_mimeType_withResponseBody_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 dispatcher];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [v3 parentIdentifier];
  id v7 = [v3 identifier];
  objc_msgSend(v4, "safe_responseReceivedWithRequestId:frameId:loaderId:timestamp:type:response:", v5, v6, v7, *(void *)(a1 + 56), *(void *)(a1 + 40), *(double *)(a1 + 48));

  id v8 = [v3 dispatcher];
  objc_msgSend(v8, "safe_dataReceivedWithRequestId:timestamp:dataLength:encodedDataLength:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 64), 0, *(double *)(a1 + 48));

  id v9 = [v3 dispatcher];

  objc_msgSend(v9, "safe_loadingFinishedWithRequestId:timestamp:sourceMapURL:metrics:", *(void *)(a1 + 32), 0, 0, *(double *)(a1 + 48));
}

void __120___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromMemoryWithRequest_response_withResponseBodyBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      double v12 = objc_msgSend(MEMORY[0x1E4FB6CD0], "ik_responseFromURLResponse:forRequest:", *(void *)(a1 + 32), *(void *)(a1 + 40));
      [v12 setSource:2];
      if (v8) {
        [v12 setMimeType:v8];
      }
      id v13 = objc_msgSend(MEMORY[0x1E4FB6CA0], "safe_initWithUrl:type:bodySize:", *(void *)(a1 + 48), *(void *)(a1 + 80), (double)(unint64_t)objc_msgSend(v7, "length"));
      [v13 setResponse:v12];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __120___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromMemoryWithRequest_response_withResponseBodyBlock___block_invoke_2;
      v15[3] = &unk_1E6DE5570;
      id v16 = *(id *)(a1 + 56);
      id v17 = *(id *)(a1 + 48);
      uint64_t v20 = *(void *)(a1 + 88);
      id v18 = *(id *)(a1 + 64);
      id v19 = v13;
      id v14 = v13;
      [v11 _dispatchEvent:5 block:v15];
    }
    else
    {
      [WeakRetained didFailWithError:v9];
    }
  }
}

void __120___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromMemoryWithRequest_response_withResponseBodyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 dispatcher];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [v3 parentIdentifier];
  uint64_t v6 = [v3 identifier];

  objc_msgSend(v7, "safe_requestServedFromMemoryCacheWithRequestId:frameId:loaderId:documentURL:timestamp:initiator:resource:", v4, v5, v6, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 64));
}

@end