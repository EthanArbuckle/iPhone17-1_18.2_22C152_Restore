@interface AVCaptureDeferredPhotoProcessingRequest
- (AVCaptureDeferredPhotoProcessingRequest)initWithPhotoProxy:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 qosClass:(unsigned int)a6;
- (NSArray)delegatesStorage;
- (NSMutableArray)photoProxies;
- (NSString)originalDeferredPhotoIdentifier;
- (id)description;
- (int)expectedPhotoCount;
- (int)firedPhotoCallbacksCount;
- (unsigned)firedCallbackFlags;
- (unsigned)qosClass;
- (void)addDelegate:(id)a3;
- (void)addProxy:(id)a3;
- (void)dealloc;
- (void)setExpectedPhotoCount:(int)a3;
- (void)setFiredCallbackFlags:(unsigned int)a3;
- (void)setFiredPhotoCallbacksCount:(int)a3;
- (void)setOriginalDeferredPhotoIdentifier:(id)a3;
- (void)setQosClass:(unsigned int)a3;
@end

@implementation AVCaptureDeferredPhotoProcessingRequest

- (AVCaptureDeferredPhotoProcessingRequest)initWithPhotoProxy:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 qosClass:(unsigned int)a6
{
  v13.receiver = self;
  v13.super_class = (Class)AVCaptureDeferredPhotoProcessingRequest;
  v10 = [(AVCaptureDeferredPhotoProcessingRequest *)&v13 init];
  if (v10)
  {
    v10->_delegatesStorage = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10->_delegateQueue = (OS_dispatch_queue *)a5;
    [(AVCaptureDeferredPhotoProcessingRequest *)v10 addDelegate:a4];
    v10->_photoProxies = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a3, 0);
    v10->_expectedPhotoCount = 1;
    v10->_originalDeferredPhotoIdentifier = (NSString *)objc_msgSend((id)objc_msgSend(a3, "deferredPhotoIdentifier"), "copy");
    v10->_qosClass = a6;
    v11 = (void *)[[NSString alloc] initWithFormat:@"AVCaptureDeferredPhotoProcessor-%@", objc_msgSend(a3, "deferredPhotoIdentifier")];
    [v11 cStringUsingEncoding:4];
    v10->_transaction = (OS_os_transaction *)FigOSTransactionCreate();
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeferredPhotoProcessingRequest;
  [(AVCaptureDeferredPhotoProcessingRequest *)&v3 dealloc];
}

- (void)addDelegate:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F47DF8]);
  [v5 setDelegate:a3 queue:self->_delegateQueue];
  [(NSMutableArray *)self->_delegatesStorage addObject:v5];
}

- (void)addProxy:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  photoProxies = self->_photoProxies;
  uint64_t v6 = [(NSMutableArray *)photoProxies countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(photoProxies);
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "deferredPhotoIdentifier"), "isEqual:", objc_msgSend(a3, "deferredPhotoIdentifier")))break; {
      if (v7 == ++v9)
      }
      {
        uint64_t v7 = [(NSMutableArray *)photoProxies countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    [(NSMutableArray *)self->_photoProxies addObject:a3];
    ++self->_expectedPhotoCount;
  }
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"proxies: "];
  if ([(NSMutableArray *)self->_photoProxies count])
  {
    unint64_t v4 = 0;
    do
    {
      [v3 appendFormat:@"%@", objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_photoProxies, "objectAtIndexedSubscript:", v4), "deferredPhotoIdentifier")];
      if ([(NSMutableArray *)self->_photoProxies count] - 1 > v4) {
        [v3 appendString:@", "];
      }
      ++v4;
    }
    while ([(NSMutableArray *)self->_photoProxies count] > v4);
  }
  id v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  return (id)[v5 stringWithFormat:@"<%@: %p %@ %@>", v7, self, v3, AVCaptureQOSClassToString(self->_qosClass)];
}

- (NSArray)delegatesStorage
{
  return &self->_delegatesStorage->super;
}

- (NSMutableArray)photoProxies
{
  return self->_photoProxies;
}

- (unsigned)firedCallbackFlags
{
  return self->_firedCallbackFlags;
}

- (void)setFiredCallbackFlags:(unsigned int)a3
{
  self->_firedCallbackFlags = a3;
}

- (int)expectedPhotoCount
{
  return self->_expectedPhotoCount;
}

- (void)setExpectedPhotoCount:(int)a3
{
  self->_expectedPhotoCount = a3;
}

- (int)firedPhotoCallbacksCount
{
  return self->_firedPhotoCallbacksCount;
}

- (void)setFiredPhotoCallbacksCount:(int)a3
{
  self->_firedPhotoCallbacksCount = a3;
}

- (NSString)originalDeferredPhotoIdentifier
{
  return self->_originalDeferredPhotoIdentifier;
}

- (void)setOriginalDeferredPhotoIdentifier:(id)a3
{
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (void)setQosClass:(unsigned int)a3
{
  self->_qosClass = a3;
}

@end