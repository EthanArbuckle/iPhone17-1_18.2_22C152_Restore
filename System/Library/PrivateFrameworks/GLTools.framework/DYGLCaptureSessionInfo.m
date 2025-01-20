@interface DYGLCaptureSessionInfo
+ (DYGLCaptureSessionInfo)captureSessionInfoWithCaptureStore:(id)a3;
- (BOOL)canPlaybackOnDeviceWithInfo:(id)a3 limitBackwardsCompatibility:(BOOL)a4 isInternal:(BOOL)a5;
- (BOOL)wasCheckingGLErrors;
- (DYGLCaptureSessionInfo)initWithCaptureStore:(id)a3;
- (NSArray)contextsInfo;
- (NSArray)requiredExtensions;
- (id)contextInfoForContext:(unint64_t)a3;
- (void)dealloc;
- (void)deleteContexts:(const void *)a3;
@end

@implementation DYGLCaptureSessionInfo

+ (DYGLCaptureSessionInfo)captureSessionInfoWithCaptureStore:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCaptureStore:a3];
  return (DYGLCaptureSessionInfo *)v3;
}

- (DYGLCaptureSessionInfo)initWithCaptureStore:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DYGLCaptureSessionInfo;
  v4 = -[DYCaptureSessionInfo initWithCaptureStore:](&v6, sel_initWithCaptureStore_);
  if (v4)
  {
    v4->_wasCheckingGLErrors = objc_msgSend((id)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x263F3FAC8]), "BOOLValue");
    v4->_contextsInfo = (NSArray *)(id)objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", *MEMORY[0x263F3F940], 0), "decodeArchivedObject");
    v4->_requiredExtensions = (NSArray *)(id)objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", *MEMORY[0x263F3F948], 0), "decodeSerializedPropertyListWithOptions:error:", 0, 0);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYGLCaptureSessionInfo;
  [(DYCaptureSessionInfo *)&v3 dealloc];
}

- (id)contextInfoForContext:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  contextsInfo = self->_contextsInfo;
  uint64_t v5 = [(NSArray *)contextsInfo countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(contextsInfo);
      }
      v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if ([v9 identifier] == a3) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSArray *)contextsInfo countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  return v9;
}

- (BOOL)canPlaybackOnDeviceWithInfo:(id)a3 limitBackwardsCompatibility:(BOOL)a4 isInternal:(BOOL)a5
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __93__DYGLCaptureSessionInfo_canPlaybackOnDeviceWithInfo_limitBackwardsCompatibility_isInternal___block_invoke;
  v7[3] = &unk_26532C3C8;
  v7[4] = self;
  v7[5] = a3;
  v6.receiver = self;
  v6.super_class = (Class)DYGLCaptureSessionInfo;
  return [(DYCaptureSessionInfo *)&v6 canPlaybackOnDeviceWithInfo:a3 limitBackwardsCompatibility:a4 isInternal:a5 withBlock:v7];
}

uint64_t __93__DYGLCaptureSessionInfo_canPlaybackOnDeviceWithInfo_limitBackwardsCompatibility_isInternal___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "contextsInfo", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (!v3) {
    return 1;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v9;
LABEL_3:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v9 != v5) {
      objc_enumerationMutation(v2);
    }
    uint64_t result = [*(id *)(a1 + 40) supportsCapabilitiesOfGraphicsAPI:*(void *)(*((void *)&v8 + 1) + 8 * v6) allowedClass:objc_opt_class()];
    if (!result) {
      return result;
    }
    if (v4 == ++v6)
    {
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        goto LABEL_3;
      }
      return 1;
    }
  }
}

- (void)deleteContexts:(const void *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_contextsInfo)
  {
    uint64_t v5 = (NSArray *)objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    contextsInfo = self->_contextsInfo;
    uint64_t v7 = [(NSArray *)contextsInfo countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(contextsInfo);
          }
          long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (*(void *)a3 == *((void *)a3 + 1)) {
            goto LABEL_15;
          }
          uint64_t v12 = *(void *)a3 + 8;
          do
          {
            uint64_t v13 = [v11 identifier];
            uint64_t v14 = *(void *)(v12 - 8);
            BOOL v15 = v12 == *((void *)a3 + 1);
            v12 += 8;
            BOOL v15 = v15 || v13 == v14;
          }
          while (!v15);
          if (v13 != v14) {
LABEL_15:
          }
            [(NSArray *)v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)contextsInfo countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    if (![(NSArray *)v5 count])
    {

      uint64_t v5 = 0;
    }
    self->_contextsInfo = v5;
  }
}

- (NSArray)contextsInfo
{
  return self->_contextsInfo;
}

- (NSArray)requiredExtensions
{
  return self->_requiredExtensions;
}

- (BOOL)wasCheckingGLErrors
{
  return self->_wasCheckingGLErrors;
}

@end