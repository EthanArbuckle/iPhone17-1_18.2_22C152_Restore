@interface AVAssetCustomURLRequest
+ (id)requestWithRequest:(__CFDictionary *)a3 id:(unint64_t)a4;
- (AVAssetCustomURLRequest)init;
- (AVAssetCustomURLRequest)initWithRequest:(__CFDictionary *)a3 id:(unint64_t)a4;
- (NSURLSessionTaskMetrics)metrics;
- (__CFDictionary)customURLRequest;
- (__CFDictionary)customURLResponse;
- (unint64_t)requestID;
- (void)dealloc;
- (void)setCustomURLRequest:(__CFDictionary *)a3;
- (void)setCustomURLResponse:(__CFDictionary *)a3;
- (void)setMetrics:(id)a3;
@end

@implementation AVAssetCustomURLRequest

+ (id)requestWithRequest:(__CFDictionary *)a3 id:(unint64_t)a4
{
  v4 = [[AVAssetCustomURLRequest alloc] initWithRequest:a3 id:a4];
  return v4;
}

- (AVAssetCustomURLRequest)initWithRequest:(__CFDictionary *)a3 id:(unint64_t)a4
{
  v18.receiver = self;
  v18.super_class = (Class)AVAssetCustomURLRequest;
  v7 = [(AVAssetCustomURLRequest *)&v18 init];
  v8 = v7;
  if (v7)
  {
    if (!a3)
    {
      v11 = v7;
      v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"invalid parameter not satisfying: %s", v12, v13, v14, v15, v16, (uint64_t)"request"), 0 reason userInfo];
      objc_exception_throw(v17);
    }
    v9 = (__CFDictionary *)CFRetain(a3);
    v8->_requestID = a4;
    v8->_customURLRequest = v9;
  }
  return v8;
}

- (AVAssetCustomURLRequest)init
{
  return 0;
}

- (void)dealloc
{
  customURLRequest = self->_customURLRequest;
  if (customURLRequest) {
    CFRelease(customURLRequest);
  }
  customURLResponse = self->_customURLResponse;
  if (customURLResponse) {
    CFRelease(customURLResponse);
  }

  v5.receiver = self;
  v5.super_class = (Class)AVAssetCustomURLRequest;
  [(AVAssetCustomURLRequest *)&v5 dealloc];
}

- (__CFDictionary)customURLRequest
{
  return self->_customURLRequest;
}

- (void)setCustomURLRequest:(__CFDictionary *)a3
{
  customURLRequest = self->_customURLRequest;
  self->_customURLRequest = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (customURLRequest)
  {
    CFRelease(customURLRequest);
  }
}

- (__CFDictionary)customURLResponse
{
  return self->_customURLResponse;
}

- (void)setCustomURLResponse:(__CFDictionary *)a3
{
  customURLResponse = self->_customURLResponse;
  self->_customURLResponse = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (customURLResponse)
  {
    CFRelease(customURLResponse);
  }
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (NSURLSessionTaskMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

@end