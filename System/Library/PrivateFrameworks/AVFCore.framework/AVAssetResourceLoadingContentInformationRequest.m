@interface AVAssetResourceLoadingContentInformationRequest
- (AVAssetResourceLoadingContentInformationRequest)init;
- (AVAssetResourceLoadingContentInformationRequest)initWithLoadingRequest:(id)a3 allowedContentTypes:(id)a4;
- (BOOL)isByteRangeAccessSupported;
- (BOOL)isDiskCachingPermitted;
- (BOOL)isEntireLengthAvailableOnDemand;
- (NSArray)allowedContentTypes;
- (NSDate)renewalDate;
- (NSString)contentType;
- (id)description;
- (id)propertyList;
- (uint64_t)contentLength;
- (void)dealloc;
- (void)setByteRangeAccessSupported:(BOOL)byteRangeAccessSupported;
- (void)setContentLength:(uint64_t)contentLength;
- (void)setContentType:(NSString *)contentType;
- (void)setDiskCachingPermitted:(BOOL)a3;
- (void)setEntireLengthAvailableOnDemand:(BOOL)entireLengthAvailableOnDemand;
- (void)setRenewalDate:(NSDate *)renewalDate;
@end

@implementation AVAssetResourceLoadingContentInformationRequest

- (AVAssetResourceLoadingContentInformationRequest)init
{
  return [(AVAssetResourceLoadingContentInformationRequest *)self initWithLoadingRequest:0 allowedContentTypes:0];
}

- (AVAssetResourceLoadingContentInformationRequest)initWithLoadingRequest:(id)a3 allowedContentTypes:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVAssetResourceLoadingContentInformationRequest;
  v6 = [(AVAssetResourceLoadingContentInformationRequest *)&v9 init];
  if (v6)
  {
    if (a3
      && (v7 = objc_alloc_init(AVAssetResourceLoadingContentInformationRequestInternal),
          (v6->_contentInformationRequest = v7) != 0))
    {
      v6->_contentInformationRequest->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avassetresourceloadingcontentinformationrequest.ivars");
      v6->_contentInformationRequest->diskCachingPermitted = 1;
      v6->_contentInformationRequest->allowedContentTypes = (NSArray *)[a4 copy];
      CFRetain(v6->_contentInformationRequest);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  contentInformationRequest = self->_contentInformationRequest;
  if (contentInformationRequest)
  {

    v4 = self->_contentInformationRequest;
    ivarAccessQueue = v4->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      v4 = self->_contentInformationRequest;
    }

    CFRelease(self->_contentInformationRequest);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVAssetResourceLoadingContentInformationRequest;
  [(AVAssetResourceLoadingContentInformationRequest *)&v6 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [(AVAssetResourceLoadingContentInformationRequest *)self contentType];
  uint64_t v7 = [(AVAssetResourceLoadingContentInformationRequest *)self contentLength];
  v8 = @"NO";
  if ([(AVAssetResourceLoadingContentInformationRequest *)self isByteRangeAccessSupported]) {
    objc_super v9 = @"YES";
  }
  else {
    objc_super v9 = @"NO";
  }
  if ([(AVAssetResourceLoadingContentInformationRequest *)self isDiskCachingPermitted]) {
    v8 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, content type = \"%@\", content length = %lld, byte range access supported = %@, disk caching permitted = %@, renewal date = %@>", v5, self, v6, v7, v9, v8, -[AVAssetResourceLoadingContentInformationRequest renewalDate](self, "renewalDate")];
}

- (id)propertyList
{
  contentInformationRequest = self->_contentInformationRequest;
  if (!contentInformationRequest->contentType) {
    return 0;
  }
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:contentInformationRequest->contentLength];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_contentInformationRequest->byteRangeAccessSupported];
  return (id)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, @"Content-Length", v6, @"Accept-Ranges", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", !self->_contentInformationRequest->diskCachingPermitted), @"no-cache", self->_contentInformationRequest->contentType, @"Content-Type", 0);
}

- (void)setContentType:(NSString *)contentType
{
  uint64_t v4 = [(NSString *)contentType copy];
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__AVAssetResourceLoadingContentInformationRequest_setContentType___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = self;
  v6[5] = v4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

void __66__AVAssetResourceLoadingContentInformationRequest_setContentType___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16) = *(void *)(a1 + 40);
}

- (NSString)contentType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  objc_super v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AVAssetResourceLoadingContentInformationRequest_contentType__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__AVAssetResourceLoadingContentInformationRequest_contentType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 16) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setContentLength:(uint64_t)contentLength
{
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AVAssetResourceLoadingContentInformationRequest_setContentLength___block_invoke;
  v4[3] = &unk_1E57B2228;
  v4[4] = self;
  v4[5] = contentLength;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __68__AVAssetResourceLoadingContentInformationRequest_setContentLength___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 32) = *(void *)(result + 40);
  return result;
}

- (NSArray)allowedContentTypes
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  objc_super v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__AVAssetResourceLoadingContentInformationRequest_allowedContentTypes__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __70__AVAssetResourceLoadingContentInformationRequest_allowedContentTypes__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (uint64_t)contentLength
{
  return self->_contentInformationRequest->contentLength;
}

- (void)setByteRangeAccessSupported:(BOOL)byteRangeAccessSupported
{
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__AVAssetResourceLoadingContentInformationRequest_setByteRangeAccessSupported___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = byteRangeAccessSupported;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __79__AVAssetResourceLoadingContentInformationRequest_setByteRangeAccessSupported___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 41) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isByteRangeAccessSupported
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__AVAssetResourceLoadingContentInformationRequest_isByteRangeAccessSupported__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __77__AVAssetResourceLoadingContentInformationRequest_isByteRangeAccessSupported__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 41);
  return result;
}

- (void)setRenewalDate:(NSDate *)renewalDate
{
  uint64_t v4 = [(NSDate *)renewalDate copy];
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__AVAssetResourceLoadingContentInformationRequest_setRenewalDate___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = self;
  v6[5] = v4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

void __66__AVAssetResourceLoadingContentInformationRequest_setRenewalDate___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(a1 + 40);
}

- (NSDate)renewalDate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AVAssetResourceLoadingContentInformationRequest_renewalDate__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (NSDate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__AVAssetResourceLoadingContentInformationRequest_renewalDate__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDiskCachingPermitted:(BOOL)a3
{
  self->_contentInformationRequest->diskCachingPermitted = a3;
}

- (BOOL)isDiskCachingPermitted
{
  return self->_contentInformationRequest->diskCachingPermitted;
}

- (void)setEntireLengthAvailableOnDemand:(BOOL)entireLengthAvailableOnDemand
{
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__AVAssetResourceLoadingContentInformationRequest_setEntireLengthAvailableOnDemand___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = entireLengthAvailableOnDemand;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __84__AVAssetResourceLoadingContentInformationRequest_setEntireLengthAvailableOnDemand___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 40) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isEntireLengthAvailableOnDemand
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__AVAssetResourceLoadingContentInformationRequest_isEntireLengthAvailableOnDemand__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __82__AVAssetResourceLoadingContentInformationRequest_isEntireLengthAvailableOnDemand__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 40);
  return result;
}

@end