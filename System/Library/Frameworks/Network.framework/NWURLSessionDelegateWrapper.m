@interface NWURLSessionDelegateWrapper
- (_BYTE)delegateFor__schemeUpgraded;
- (_BYTE)delegateFor_betterRouteDiscovered;
- (_BYTE)delegateFor_didBecomeDownloadTask;
- (_BYTE)delegateFor_didBecomeStreamTask;
- (_BYTE)delegateFor_didCloseWithCode;
- (_BYTE)delegateFor_didCompleteWithError;
- (_BYTE)delegateFor_didCreateTask;
- (_BYTE)delegateFor_didFinishCollectingMetrics;
- (_BYTE)delegateFor_didFinishDownloadingToURL;
- (_BYTE)delegateFor_didOpenWithProtocol;
- (_BYTE)delegateFor_didReceiveData_withCB;
- (_BYTE)delegateFor_didReceiveData_withoutCB;
- (_BYTE)delegateFor_didReceiveInformationalResponse;
- (_BYTE)delegateFor_didSendBodyData;
- (_BYTE)delegateFor_didWriteData;
- (_BYTE)delegateFor_isWaitingForConnectivity;
- (_BYTE)delegateFor_needNewBodyStream;
- (_BYTE)delegateFor_needNewBodyStreamFromOffset;
- (_BYTE)delegateFor_readClosed;
- (_BYTE)delegateFor_sessionDidBecomeInvalidWithError;
- (_BYTE)delegateFor_sessionDidReceiveChallenge;
- (_BYTE)delegateFor_willCacheResponse;
- (_BYTE)delegateFor_willPerformHTTPRedirection;
- (_BYTE)delegateFor_writeClosed;
- (char)delegateFor_didReceiveChallenge;
- (char)delegateFor_didReceiveResponse;
- (char)delegateFor_didResumeAtOffset;
- (id)initWithFallbackDelegateWrapper:(id *)a1;
- (void)dataTask:(void *)a3 didBecomeDownloadTask:(void *)a4 completionHandler:;
- (void)dataTask:(void *)a3 didBecomeStreamTask:(void *)a4 completionHandler:;
- (void)downloadTask:(uint64_t)a3 didResumeAtOffset:(uint64_t)a4 expectedTotalBytes:;
- (void)readClosedForStreamTask:(uint64_t)a1;
- (void)runCompletionHandler:(int)a3 noAsync:(void *)a4 task:(void *)a5 metrics:(void *)a6 cachedResponse:(void *)a7 cache:;
- (void)runDelegateBlock:(uint64_t)a1;
- (void)saveCachedResponseOnDelegateQueue:(void *)a3 cache:(void *)a4 dataTask:(void *)a5 delegateForCache:;
- (void)task:(void *)a3 didCompleteWithError:(void *)a4 metrics:;
- (void)task:(void *)a3 didReceiveChallenge:(void *)a4 completionHandler:;
- (void)task:(void *)a3 didReceiveInformationalResponse:;
- (void)task:(void *)a3 willPerformHTTPRedirection:(void *)a4 newRequest:(void *)a5 completionHandler:;
@end

@implementation NWURLSessionDelegateWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueueWrapper, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fallbackDelegateWrapper, 0);

  objc_storeStrong((id *)&self->_wrappedDelegate, 0);
}

- (id)initWithFallbackDelegateWrapper:(id *)a1
{
  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)NWURLSessionDelegateWrapper;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      if (v4)
      {
        v5[4] = (id)v4[4];
        v6 = (void *)v4[5];
      }
      else
      {
        v6 = 0;
        v5[4] = 0;
      }
      objc_storeStrong(v5 + 5, v6);
      if (v4) {
        v7 = (void *)v4[6];
      }
      else {
        v7 = 0;
      }
      objc_storeStrong(a1 + 6, v7);
      objc_storeStrong(a1 + 3, a2);
    }
  }

  return a1;
}

- (_BYTE)delegateFor_sessionDidBecomeInvalidWithError
{
  if (a1)
  {
    v3 = a1;
    if (a1[8])
    {
      if ((a1[11] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 64;
      }
      else {
        int v4 = 0;
      }
      v3[11] = v3[11] & 0xBF | v4;
      v3[8] |= 1u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_sessionDidBecomeInvalidWithError](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_sessionDidReceiveChallenge
{
  if (a1)
  {
    v3 = a1;
    if ((a1[8] & 2) != 0)
    {
      if ((a1[11] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_sessionDidReceiveChallenge](*((void *)v3 + 3));
        a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        char v4 = 0x80;
      }
      else {
        char v4 = 0;
      }
      char v5 = v4 & 0x80 | v3[11] & 0x7F;
      v3[11] = v5;
      v3[8] |= 2u;
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
    }
    a1 = objc_getProperty(v3, a2, 16, 1);
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_didCreateTask
{
  if (a1)
  {
    v3 = a1;
    if ((a1[8] & 8) != 0)
    {
      if ((a1[12] & 2) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 2;
      }
      else {
        int v4 = 0;
      }
      v3[12] = v3[12] & 0xFD | v4;
      v3[8] |= 8u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_isWaitingForConnectivity
{
  if (a1)
  {
    v3 = a1;
    if ((a1[8] & 0x20) != 0)
    {
      if ((a1[12] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 8;
      }
      else {
        int v4 = 0;
      }
      v3[12] = v3[12] & 0xF7 | v4;
      v3[8] |= 0x20u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_isWaitingForConnectivity](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_willPerformHTTPRedirection
{
  if (a1)
  {
    v3 = a1;
    if ((a1[8] & 0x40) != 0)
    {
      if ((a1[12] & 0x10) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 16;
      }
      else {
        int v4 = 0;
      }
      v3[12] = v3[12] & 0xEF | v4;
      v3[8] |= 0x40u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_willPerformHTTPRedirection](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (char)delegateFor_didReceiveChallenge
{
  if (a1)
  {
    v3 = a1;
    if (a1[8] < 0)
    {
      if ((a1[12] & 0x20) != 0)
      {
LABEL_4:
        a1 = (char *)objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 32;
      }
      else {
        int v4 = 0;
      }
      v3[12] = v3[12] & 0xDF | v4;
      v3[8] |= 0x80u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveChallenge](*((void *)v3 + 3));
    a1 = (char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_needNewBodyStream
{
  if (a1)
  {
    v3 = a1;
    if (a1[9])
    {
      if ((a1[12] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 64;
      }
      else {
        int v4 = 0;
      }
      v3[12] = v3[12] & 0xBF | v4;
      v3[9] |= 1u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_needNewBodyStream](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_needNewBodyStreamFromOffset
{
  if (a1)
  {
    v3 = a1;
    if ((a1[9] & 2) != 0)
    {
      if ((a1[12] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_needNewBodyStreamFromOffset](*((void *)v3 + 3));
        a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        char v4 = 0x80;
      }
      else {
        char v4 = 0;
      }
      char v5 = v4 & 0x80 | v3[12] & 0x7F;
      v3[12] = v5;
      v3[9] |= 2u;
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
    }
    a1 = objc_getProperty(v3, a2, 16, 1);
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_didSendBodyData
{
  if (a1)
  {
    v3 = a1;
    if ((a1[9] & 4) != 0)
    {
      if ((a1[13] & 1) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_didSendBodyData](*((void *)v3 + 3));
        a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
LABEL_7:
        uint64_t v2 = vars8;
        goto LABEL_8;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      char v4 = v3[13] & 0xFE | objc_opt_respondsToSelector() & 1;
      v3[13] = v4;
      v3[9] |= 4u;
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
    }
    a1 = objc_getProperty(v3, a2, 16, 1);
    goto LABEL_7;
  }
LABEL_8:
  return a1;
}

- (_BYTE)delegateFor_didFinishCollectingMetrics
{
  if (a1)
  {
    v3 = a1;
    if ((a1[9] & 8) != 0)
    {
      if ((a1[13] & 2) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 2;
      }
      else {
        int v4 = 0;
      }
      v3[13] = v3[13] & 0xFD | v4;
      v3[9] |= 8u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didFinishCollectingMetrics](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_didCompleteWithError
{
  if (a1)
  {
    v3 = a1;
    if ((a1[9] & 0x10) != 0)
    {
      if ((a1[13] & 4) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 4;
      }
      else {
        int v4 = 0;
      }
      v3[13] = v3[13] & 0xFB | v4;
      v3[9] |= 0x10u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didCompleteWithError](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor__schemeUpgraded
{
  if (a1)
  {
    v3 = a1;
    if ((a1[9] & 0x20) != 0)
    {
      if ((a1[13] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 8;
      }
      else {
        int v4 = 0;
      }
      v3[13] = v3[13] & 0xF7 | v4;
      v3[9] |= 0x20u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor__schemeUpgraded](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_didReceiveInformationalResponse
{
  if (a1)
  {
    v3 = a1;
    if ((a1[9] & 0x40) != 0)
    {
      if ((a1[13] & 0x10) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 16;
      }
      else {
        int v4 = 0;
      }
      v3[13] = v3[13] & 0xEF | v4;
      v3[9] |= 0x40u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveInformationalResponse](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (char)delegateFor_didReceiveResponse
{
  if (a1)
  {
    v3 = a1;
    if (a1[9] < 0)
    {
      if ((a1[13] & 0x20) != 0)
      {
LABEL_4:
        a1 = (char *)objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 32;
      }
      else {
        int v4 = 0;
      }
      v3[13] = v3[13] & 0xDF | v4;
      v3[9] |= 0x80u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveResponse](*((void *)v3 + 3));
    a1 = (char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_didBecomeDownloadTask
{
  if (a1)
  {
    v3 = a1;
    if (a1[10])
    {
      if ((a1[13] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 64;
      }
      else {
        int v4 = 0;
      }
      v3[13] = v3[13] & 0xBF | v4;
      v3[10] |= 1u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didBecomeDownloadTask](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_didBecomeStreamTask
{
  if (a1)
  {
    v3 = a1;
    if ((a1[10] & 2) != 0)
    {
      if ((a1[13] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_didBecomeStreamTask](*((void *)v3 + 3));
        a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        char v4 = 0x80;
      }
      else {
        char v4 = 0;
      }
      char v5 = v4 & 0x80 | v3[13] & 0x7F;
      v3[13] = v5;
      v3[10] |= 2u;
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
    }
    a1 = objc_getProperty(v3, a2, 16, 1);
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_didReceiveData_withoutCB
{
  if (a1)
  {
    v3 = a1;
    if ((a1[10] & 4) != 0)
    {
      if ((a1[14] & 1) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_didReceiveData_withoutCB](*((void *)v3 + 3));
        a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
LABEL_7:
        uint64_t v2 = vars8;
        goto LABEL_8;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      char v4 = v3[14] & 0xFE | objc_opt_respondsToSelector() & 1;
      v3[14] = v4;
      v3[10] |= 4u;
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
    }
    a1 = objc_getProperty(v3, a2, 16, 1);
    goto LABEL_7;
  }
LABEL_8:
  return a1;
}

- (_BYTE)delegateFor_didReceiveData_withCB
{
  if (a1)
  {
    v3 = a1;
    if ((a1[10] & 8) != 0)
    {
      if ((a1[14] & 2) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 2;
      }
      else {
        int v4 = 0;
      }
      v3[14] = v3[14] & 0xFD | v4;
      v3[10] |= 8u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveData_withCB](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_willCacheResponse
{
  if (a1)
  {
    v3 = a1;
    if ((a1[10] & 0x10) != 0)
    {
      if ((a1[14] & 4) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 4;
      }
      else {
        int v4 = 0;
      }
      v3[14] = v3[14] & 0xFB | v4;
      v3[10] |= 0x10u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_willCacheResponse](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_didFinishDownloadingToURL
{
  if (a1)
  {
    v3 = a1;
    if ((a1[10] & 0x20) != 0)
    {
      if ((a1[14] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 8;
      }
      else {
        int v4 = 0;
      }
      v3[14] = v3[14] & 0xF7 | v4;
      v3[10] |= 0x20u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didFinishDownloadingToURL](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_didWriteData
{
  if (a1)
  {
    v3 = a1;
    if ((a1[10] & 0x40) != 0)
    {
      if ((a1[14] & 0x10) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 16;
      }
      else {
        int v4 = 0;
      }
      v3[14] = v3[14] & 0xEF | v4;
      v3[10] |= 0x40u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didWriteData](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (char)delegateFor_didResumeAtOffset
{
  if (a1)
  {
    v3 = a1;
    if (a1[10] < 0)
    {
      if ((a1[14] & 0x20) != 0)
      {
LABEL_4:
        a1 = (char *)objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 32;
      }
      else {
        int v4 = 0;
      }
      v3[14] = v3[14] & 0xDF | v4;
      v3[10] |= 0x80u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didResumeAtOffset](*((void *)v3 + 3));
    a1 = (char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_readClosed
{
  if (a1)
  {
    v3 = a1;
    if (a1[11])
    {
      if ((a1[14] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 64;
      }
      else {
        int v4 = 0;
      }
      v3[14] = v3[14] & 0xBF | v4;
      v3[11] |= 1u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_readClosed](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_writeClosed
{
  if (a1)
  {
    v3 = a1;
    if ((a1[11] & 2) != 0)
    {
      if ((a1[14] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_writeClosed](*((void *)v3 + 3));
        a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        char v4 = 0x80;
      }
      else {
        char v4 = 0;
      }
      char v5 = v4 & 0x80 | v3[14] & 0x7F;
      v3[14] = v5;
      v3[11] |= 2u;
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
    }
    a1 = objc_getProperty(v3, a2, 16, 1);
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_betterRouteDiscovered
{
  if (a1)
  {
    v3 = a1;
    if ((a1[11] & 4) != 0)
    {
      if ((a1[15] & 1) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_betterRouteDiscovered](*((void *)v3 + 3));
        a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
LABEL_7:
        uint64_t v2 = vars8;
        goto LABEL_8;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      char v4 = v3[15] & 0xFE | objc_opt_respondsToSelector() & 1;
      v3[15] = v4;
      v3[11] |= 4u;
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
    }
    a1 = objc_getProperty(v3, a2, 16, 1);
    goto LABEL_7;
  }
LABEL_8:
  return a1;
}

- (_BYTE)delegateFor_didOpenWithProtocol
{
  if (a1)
  {
    v3 = a1;
    if ((a1[11] & 0x10) != 0)
    {
      if ((a1[15] & 4) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 4;
      }
      else {
        int v4 = 0;
      }
      v3[15] = v3[15] & 0xFB | v4;
      v3[11] |= 0x10u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didOpenWithProtocol](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (_BYTE)delegateFor_didCloseWithCode
{
  if (a1)
  {
    v3 = a1;
    if ((a1[11] & 0x20) != 0)
    {
      if ((a1[15] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v3, a2, 16, 1);
LABEL_10:
        uint64_t v2 = vars8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if (objc_opt_respondsToSelector()) {
        int v4 = 8;
      }
      else {
        int v4 = 0;
      }
      v3[15] = v3[15] & 0xF7 | v4;
      v3[11] |= 0x20u;
      if (v4) {
        goto LABEL_4;
      }
    }
    -[NWURLSessionDelegateWrapper delegateFor_didCloseWithCode](*((void *)v3 + 3));
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (void)runDelegateBlock:(uint64_t)a1
{
  if (a1) {
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(void **)(a1 + 48), a2);
  }
}

- (void)runCompletionHandler:(int)a3 noAsync:(void *)a4 task:(void *)a5 metrics:(void *)a6 cachedResponse:(void *)a7 cache:
{
  v13 = a2;
  v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v18 = a7;
  if (a1)
  {
    v20 = [(NWURLSessionDelegateWrapper *)(unsigned char *)a1 delegateFor_willCacheResponse];
    if (v15)
    {
      v21 = [(NWURLSessionDelegateWrapper *)(unsigned char *)a1 delegateFor_didFinishCollectingMetrics];
      if (!a3) {
        goto LABEL_12;
      }
    }
    else
    {
      v21 = 0;
      if (!a3) {
        goto LABEL_12;
      }
    }
    if (!v20 && !v21)
    {
      v13[2](v13);
      if (v14)
      {
        v23 = (void *)v14[30];
        if (v23) {
          objc_setProperty_atomic(v23, v22, 0, 16);
        }
        v24 = (void *)v14[31];
        v14[31] = 0;
      }
      goto LABEL_13;
    }
LABEL_12:
    id v25 = *(id *)(a1 + 32);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __94__NWURLSessionDelegateWrapper_runCompletionHandler_noAsync_task_metrics_cachedResponse_cache___block_invoke;
    v28[3] = &unk_1E5249840;
    v28[4] = a1;
    id v29 = v16;
    id v30 = v18;
    v31 = v14;
    id v32 = v20;
    id v33 = v21;
    id v34 = v25;
    id v35 = v15;
    v36 = v13;
    v26 = *(void **)(a1 + 48);
    id v27 = v25;
    -[NWURLSessionDelegateQueue runDelegateBlock:](v26, v28);

LABEL_13:
  }
}

void __94__NWURLSessionDelegateWrapper_runCompletionHandler_noAsync_task_metrics_cachedResponse_cache___block_invoke(uint64_t a1)
{
  -[NWURLSessionDelegateWrapper saveCachedResponseOnDelegateQueue:cache:dataTask:delegateForCache:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
  [*(id *)(a1 + 72) URLSession:*(void *)(a1 + 80) task:*(void *)(a1 + 56) didFinishCollectingMetrics:*(void *)(a1 + 88)];
  (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    int v4 = *(void **)(v3 + 240);
    if (v4) {
      objc_setProperty_atomic(v4, v2, 0, 16);
    }
    char v5 = *(void **)(v3 + 248);
    *(void *)(v3 + 248) = 0;
  }
}

- (void)saveCachedResponseOnDelegateQueue:(void *)a3 cache:(void *)a4 dataTask:(void *)a5 delegateForCache:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (a1 && v9)
  {
    if (v12)
    {
      v14 = [NWURLSessionDelegateDeallocBomb alloc];
      id v15 = v13;
      if (v14)
      {
        v25.receiver = v14;
        v25.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        id v16 = (NWURLSessionDelegateDeallocBomb *)objc_msgSendSuper2(&v25, sel_init);
        v14 = v16;
        if (v16)
        {
          objc_storeStrong((id *)&v16->__object, a5);
          if (sel_URLSession_dataTask_willCacheResponse_completionHandler_) {
            v17 = sel_URLSession_dataTask_willCacheResponse_completionHandler_;
          }
          else {
            v17 = 0;
          }
          v14->__method = v17;
        }
      }

      uint64_t v18 = *(void *)(a1 + 32);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke;
      v20[3] = &unk_1E5249890;
      v21 = v14;
      uint64_t v22 = a1;
      id v23 = v10;
      id v24 = v11;
      v19 = v14;
      [v15 URLSession:v18 dataTask:v24 willCacheResponse:v9 completionHandler:v20];
    }
    else
    {
      [v10 storeCachedResponse:v9 forDataTask:v11];
    }
  }
}

void __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke_2;
    v6[3] = &unk_1E5249868;
    uint64_t v4 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v8 = v3;
    id v5 = *(id *)(a1 + 56);
    id v9 = v5;
    if (v4)
    {
      -[NWURLSessionDelegateQueue runDelegateBlock:](*(void **)(v4 + 48), v6);
      id v5 = v9;
    }
  }
}

uint64_t __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeCachedResponse:*(void *)(a1 + 40) forDataTask:*(void *)(a1 + 48)];
}

void __57__NWURLSessionDelegateWrapper_didBecomeInvalidWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) didBecomeInvalidWithError:*(void *)(a1 + 48)];
  id v3 = *(void **)(a1 + 56);
  if (v3)
  {
    objc_setProperty_atomic(v3, v2, 0, 16);
  }
}

uint64_t __60__NWURLSessionDelegateWrapper_taskIsWaitingForConnectivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) taskIsWaitingForConnectivity:*(void *)(a1 + 48)];
}

- (void)task:(void *)a3 willPerformHTTPRedirection:(void *)a4 newRequest:(void *)a5 completionHandler:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  if (a1)
  {
    v14 = [(NWURLSessionDelegateWrapper *)(unsigned char *)a1 delegateFor_willPerformHTTPRedirection];
    if (v14)
    {
      v26 = v9;
      id v15 = *(id *)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      v17 = [NWURLSessionDelegateDeallocBomb alloc];
      id v18 = v14;
      if (v17)
      {
        v36.receiver = v17;
        v36.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        id v19 = objc_msgSendSuper2(&v36, sel_init);
        v20 = v19;
        if (v19)
        {
          objc_storeStrong((id *)v19 + 2, v14);
          if (sel_task_willPerformHTTPRedirection_newRequest_completionHandler_) {
            v21 = sel_task_willPerformHTTPRedirection_newRequest_completionHandler_;
          }
          else {
            v21 = 0;
          }
          v20[3] = v21;
        }
      }
      else
      {
        v20 = 0;
      }

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
      v27[3] = &unk_1E5249930;
      id v28 = v18;
      id v29 = v15;
      id v9 = v26;
      id v30 = v26;
      id v31 = v10;
      id v32 = v11;
      id v33 = v20;
      id v34 = v16;
      id v35 = v13;
      uint64_t v22 = *(void **)(a1 + 48);
      id v23 = v16;
      id v24 = v20;
      id v25 = v15;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v22, v27);
    }
    else
    {
      (*((void (**)(id, id))v13 + 2))(v13, v11);
    }
  }
}

void __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5249908;
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 88);
  [v2 URLSession:v3 task:v4 willPerformHTTPRedirection:v5 newRequest:v6 completionHandler:v7];
}

void __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3;
  v7[3] = &unk_1E524B950;
  uint64_t v4 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)task:(void *)a3 didReceiveChallenge:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [v8 protectionSpace];
    id v11 = [v10 authenticationMethod];

    if (([v11 isEqualToString:*MEMORY[0x1E4F18CB8]] & 1) != 0
      || ([v11 isEqualToString:*MEMORY[0x1E4F18C78]] & 1) != 0
      || [v11 isEqualToString:*MEMORY[0x1E4F18CA8]])
    {
    }
    else
    {
      int v26 = [v11 isEqualToString:*MEMORY[0x1E4F18CA0]];

      if (!v26) {
        goto LABEL_15;
      }
    }
    uint64_t v13 = [(NWURLSessionDelegateWrapper *)(unsigned char *)a1 delegateFor_sessionDidReceiveChallenge];
    if (v13)
    {
      v14 = (void *)v13;
      id v15 = *(id *)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      v17 = [NWURLSessionDelegateDeallocBomb alloc];
      id v18 = v14;
      if (v17)
      {
        v52.receiver = v17;
        v52.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        id v19 = (NWURLSessionDelegateDeallocBomb *)objc_msgSendSuper2(&v52, sel_init);
        v17 = v19;
        if (v19)
        {
          objc_storeStrong((id *)&v19->__object, v14);
          if (sel_task_didReceiveChallenge_completionHandler_) {
            v20 = sel_task_didReceiveChallenge_completionHandler_;
          }
          else {
            v20 = 0;
          }
          v17->__method = v20;
        }
      }

      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke;
      v45[3] = &unk_1E5249980;
      id v46 = v18;
      id v47 = v15;
      id v48 = v8;
      v49 = v17;
      id v50 = v16;
      id v51 = v9;
      v21 = *(void **)(a1 + 48);
      id v22 = v16;
      id v23 = v17;
      id v24 = v15;
      id v25 = v18;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v21, v45);

      goto LABEL_24;
    }
LABEL_15:
    uint64_t v27 = [(NWURLSessionDelegateWrapper *)(char *)a1 delegateFor_didReceiveChallenge];
    if (!v27)
    {
      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
      id v25 = 0;
LABEL_25:

      goto LABEL_26;
    }
    id v28 = (void *)v27;
    id v29 = *(id *)(a1 + 32);
    id v30 = *(id *)(a1 + 40);
    id v31 = [NWURLSessionDelegateDeallocBomb alloc];
    id v32 = v28;
    if (v31)
    {
      v52.receiver = v31;
      v52.super_class = (Class)NWURLSessionDelegateDeallocBomb;
      id v33 = (NWURLSessionDelegateDeallocBomb *)objc_msgSendSuper2(&v52, sel_init);
      id v31 = v33;
      if (v33)
      {
        objc_storeStrong((id *)&v33->__object, v28);
        if (sel_task_didReceiveChallenge_completionHandler_) {
          id v34 = sel_task_didReceiveChallenge_completionHandler_;
        }
        else {
          id v34 = 0;
        }
        v31->__method = v34;
      }
    }

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_4;
    v37[3] = &unk_1E52498E0;
    id v25 = v32;
    id v38 = v25;
    id v39 = v29;
    id v40 = v7;
    id v41 = v8;
    v42 = v31;
    id v43 = v30;
    id v44 = v9;
    id v35 = *(void **)(a1 + 48);
    id v22 = v30;
    objc_super v36 = v31;
    id v24 = v29;
    -[NWURLSessionDelegateQueue runDelegateBlock:](v35, v37);

LABEL_24:
    goto LABEL_25;
  }
LABEL_26:
}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5249958;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v2 URLSession:v3 didReceiveChallenge:v4 completionHandler:v5];
}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_5;
  v6[3] = &unk_1E5249958;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 URLSession:v3 task:v4 didReceiveChallenge:v5 completionHandler:v6];
}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_6;
  block[3] = &unk_1E52498B8;
  id v6 = *(NSObject **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_3;
  block[3] = &unk_1E52498B8;
  id v6 = *(NSObject **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 80);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_2;
  v6[3] = &unk_1E52499A8;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  [v2 URLSession:v3 task:v5 needNewBodyStreamFromOffset:v4 completionHandler:v6];
}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_5;
  v5[3] = &unk_1E52499A8;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v2 URLSession:v3 task:v4 needNewBodyStream:v5];
}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_6;
  v7[3] = &unk_1E524B950;
  uint64_t v4 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_3;
  v7[3] = &unk_1E524B950;
  uint64_t v4 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __110__NWURLSessionDelegateWrapper_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didSendBodyData:*(void *)(a1 + 72) totalBytesSent:*(void *)(a1 + 80) totalBytesExpectedToSend:*(void *)(a1 + 88)];
  uint64_t v2 = *(NSObject **)(a1 + 56);
  id v3 = *(void **)(a1 + 64);

  dispatch_async(v2, v3);
}

- (void)task:(void *)a3 didCompleteWithError:(void *)a4 metrics:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = v9;
  if (a1)
  {
    if (v9)
    {
      uint64_t v12 = [(NWURLSessionDelegateWrapper *)(unsigned char *)a1 delegateFor_didFinishCollectingMetrics];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = [(NWURLSessionDelegateWrapper *)(unsigned char *)a1 delegateFor_didCompleteWithError];
    if (v12 | v13)
    {
      id v14 = *(id *)(a1 + 32);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __65__NWURLSessionDelegateWrapper_task_didCompleteWithError_metrics___block_invoke;
      v17[3] = &unk_1E5249A20;
      id v18 = (id)v12;
      id v19 = v14;
      id v20 = v7;
      id v21 = v11;
      id v22 = (id)v13;
      id v23 = v8;
      id v15 = *(void **)(a1 + 48);
      id v16 = v14;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v15, v17);
    }
  }
}

void __65__NWURLSessionDelegateWrapper_task_didCompleteWithError_metrics___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didFinishCollectingMetrics:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didCompleteWithError:*(void *)(a1 + 72)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = *(void **)(v3 + 240);
    if (v4) {
      objc_setProperty_atomic(v4, v2, 0, 16);
    }
    id v5 = *(void **)(v3 + 248);
    *(void *)(v3 + 248) = 0;
  }
}

void __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5249908;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:task:_schemeUpgraded:completionHandler:", v3, v4, v5, v6);
}

void __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_3;
  v7[3] = &unk_1E524B950;
  uint64_t v4 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)task:(void *)a3 didReceiveInformationalResponse:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v8 = [(NWURLSessionDelegateWrapper *)(unsigned char *)a1 delegateFor_didReceiveInformationalResponse];
    if (v8)
    {
      id v9 = *(id *)(a1 + 32);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __68__NWURLSessionDelegateWrapper_task_didReceiveInformationalResponse___block_invoke;
      v12[3] = &unk_1E524A1D0;
      id v13 = v8;
      id v14 = v9;
      id v15 = v5;
      id v16 = v7;
      id v10 = *(void **)(a1 + 48);
      id v11 = v9;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v10, v12);
    }
  }
}

uint64_t __68__NWURLSessionDelegateWrapper_task_didReceiveInformationalResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didReceiveInformationalResponse:*(void *)(a1 + 56)];
}

void __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5249A48;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 URLSession:v3 dataTask:v4 didReceiveResponse:v5 completionHandler:v6];
}

void __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
  v5[3] = &unk_1E5249D98;
  uint64_t v4 = *(NSObject **)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)dataTask:(void *)a3 didBecomeDownloadTask:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = [(NWURLSessionDelegateWrapper *)(unsigned char *)a1 delegateFor_didBecomeDownloadTask];
    if (v11)
    {
      id v12 = *(id *)(a1 + 32);
      id v13 = *(id *)(a1 + 40);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__NWURLSessionDelegateWrapper_dataTask_didBecomeDownloadTask_completionHandler___block_invoke;
      v17[3] = &unk_1E5249980;
      id v18 = v11;
      id v19 = v12;
      id v20 = v7;
      id v21 = v8;
      id v22 = v13;
      id v23 = v10;
      id v14 = *(void **)(a1 + 48);
      id v15 = v13;
      id v16 = v12;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v14, v17);
    }
    else
    {
      v10[2](v10);
    }
  }
}

void __80__NWURLSessionDelegateWrapper_dataTask_didBecomeDownloadTask_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) dataTask:*(void *)(a1 + 48) didBecomeDownloadTask:*(void *)(a1 + 56)];
  uint64_t v2 = *(NSObject **)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 72);

  dispatch_async(v2, v3);
}

- (void)dataTask:(void *)a3 didBecomeStreamTask:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = [(NWURLSessionDelegateWrapper *)(unsigned char *)a1 delegateFor_didBecomeStreamTask];
    if (v11)
    {
      id v12 = *(id *)(a1 + 32);
      id v13 = *(id *)(a1 + 40);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __78__NWURLSessionDelegateWrapper_dataTask_didBecomeStreamTask_completionHandler___block_invoke;
      v17[3] = &unk_1E5249980;
      id v18 = v11;
      id v19 = v12;
      id v20 = v7;
      id v21 = v8;
      id v22 = v13;
      id v23 = v10;
      id v14 = *(void **)(a1 + 48);
      id v15 = v13;
      id v16 = v12;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v14, v17);
    }
    else
    {
      v10[2](v10);
    }
  }
}

void __78__NWURLSessionDelegateWrapper_dataTask_didBecomeStreamTask_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) dataTask:*(void *)(a1 + 48) didBecomeStreamTask:*(void *)(a1 + 56)];
  uint64_t v2 = *(NSObject **)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 72);

  dispatch_async(v2, v3);
}

void __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_2;
    v14[3] = &unk_1E524B950;
    uint64_t v5 = &v15;
    uint64_t v6 = *(void *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 144);
    objc_msgSend(v2, "URLSession:dataTask:_didReceiveData:completionHandler:", v3, v4, v6, v14);
  }
  else
  {
    [*(id *)(a1 + 72) URLSession:*(void *)(a1 + 40) dataTask:*(void *)(a1 + 48) didReceiveData:*(void *)(a1 + 56)];
    id v7 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_4;
    block[3] = &unk_1E524AFA8;
    uint64_t v5 = &v13;
    id v13 = *(id *)(a1 + 144);
    dispatch_async(v7, block);
  }

  if (*(unsigned char *)(a1 + 152))
  {
    -[NWURLSessionDelegateWrapper saveCachedResponseOnDelegateQueue:cache:dataTask:delegateForCache:](*(void *)(a1 + 80), *(void **)(a1 + 88), *(void **)(a1 + 96), *(void **)(a1 + 48), *(void **)(a1 + 104));
    [*(id *)(a1 + 112) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didFinishCollectingMetrics:*(void *)(a1 + 120)];
    [*(id *)(a1 + 128) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didCompleteWithError:*(void *)(a1 + 136)];
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      id v10 = *(void **)(v9 + 240);
      if (v10) {
        objc_setProperty_atomic(v10, v8, 0, 16);
      }
      id v11 = *(void **)(v9 + 248);
      *(void *)(v9 + 248) = 0;
    }
  }
}

void __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_3;
  block[3] = &unk_1E524AFA8;
  v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__NWURLSessionDelegateWrapper_downloadTask_didFinishDownloadingToURL_error_metrics_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didFinishDownloadingToURL:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didFinishCollectingMetrics:*(void *)(a1 + 72)];
  [*(id *)(a1 + 80) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didCompleteWithError:*(void *)(a1 + 88)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = *(void **)(v3 + 240);
    if (v4) {
      objc_setProperty_atomic(v4, v2, 0, 16);
    }
    uint64_t v5 = *(void **)(v3 + 248);
    *(void *)(v3 + 248) = 0;
  }
  uint64_t v6 = *(NSObject **)(a1 + 96);
  id v7 = *(void **)(a1 + 104);

  dispatch_async(v6, v7);
}

void __119__NWURLSessionDelegateWrapper_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didWriteData:*(void *)(a1 + 72) totalBytesWritten:*(void *)(a1 + 80) totalBytesExpectedToWrite:*(void *)(a1 + 88)];
  uint64_t v2 = *(NSObject **)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 64);

  dispatch_async(v2, v3);
}

- (void)downloadTask:(uint64_t)a3 didResumeAtOffset:(uint64_t)a4 expectedTotalBytes:
{
  id v8 = a2;
  if (a1)
  {
    uint64_t v9 = [(NWURLSessionDelegateWrapper *)(char *)a1 delegateFor_didResumeAtOffset];
    if (v9)
    {
      id v10 = *(id *)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __81__NWURLSessionDelegateWrapper_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke;
      v13[3] = &unk_1E5249AC0;
      id v14 = v9;
      id v15 = v10;
      id v16 = v8;
      uint64_t v17 = a3;
      uint64_t v18 = a4;
      id v11 = *(void **)(a1 + 48);
      id v12 = v10;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v11, v13);
    }
  }
}

uint64_t __81__NWURLSessionDelegateWrapper_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didResumeAtOffset:*(void *)(a1 + 56) expectedTotalBytes:*(void *)(a1 + 64)];
}

- (void)readClosedForStreamTask:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = [(NWURLSessionDelegateWrapper *)(unsigned char *)a1 delegateFor_readClosed];
    if (v5)
    {
      id v6 = *(id *)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __55__NWURLSessionDelegateWrapper_readClosedForStreamTask___block_invoke;
      v9[3] = &unk_1E5249868;
      id v10 = v5;
      id v11 = v6;
      id v12 = v4;
      id v7 = *(void **)(a1 + 48);
      id v8 = v6;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v7, v9);
    }
  }
}

uint64_t __55__NWURLSessionDelegateWrapper_readClosedForStreamTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) readClosedForStreamTask:*(void *)(a1 + 48)];
}

uint64_t __56__NWURLSessionDelegateWrapper_writeClosedForStreamTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) writeClosedForStreamTask:*(void *)(a1 + 48)];
}

uint64_t __66__NWURLSessionDelegateWrapper_betterRouteDiscoveredForStreamTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) betterRouteDiscoveredForStreamTask:*(void *)(a1 + 48)];
}

uint64_t __65__NWURLSessionDelegateWrapper_webSocketTask_didOpenWithProtocol___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) webSocketTask:*(void *)(a1 + 48) didOpenWithProtocol:*(void *)(a1 + 56)];
}

uint64_t __69__NWURLSessionDelegateWrapper_webSocketTask_didCloseWithCode_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) webSocketTask:*(void *)(a1 + 48) didCloseWithCode:*(void *)(a1 + 64) reason:*(void *)(a1 + 56)];
}

@end