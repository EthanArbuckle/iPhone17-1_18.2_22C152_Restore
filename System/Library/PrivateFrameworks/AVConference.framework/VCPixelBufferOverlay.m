@interface VCPixelBufferOverlay
- (VCPixelBufferOverlay)init;
- (tagVCPixelBufferOverlayConfig)currentDetails;
- (void)dealloc;
- (void)init;
- (void)setCurrentDetails:(tagVCPixelBufferOverlayConfig *)a3;
@end

@implementation VCPixelBufferOverlay

- (VCPixelBufferOverlay)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VCPixelBufferOverlay;
  v2 = [(VCObject *)&v19 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x1E4F1DAB8];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v2->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v2->_transform.c = v5;
    *(_OWORD *)&v2->_transform.tx = *(_OWORD *)(v4 + 32);
    long long v11 = *MEMORY[0x1E4F1DB28];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    v2->_textFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v2->_textFrame.size = (CGSize)v12;
    v2->_stringAttributes = 0;
    v2->_mutableDisplayText = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1000);
    long long v10 = *MEMORY[0x1E4F1DB30];
    v3->_currentVRADimensions = (CGSize)*MEMORY[0x1E4F1DB30];
    v3->_currentLongestLine = 0;
    long long v17 = unk_1E25A18E0;
    long long v18 = xmmword_1E25A18F0;
    long long v14 = xmmword_1E25A18B0;
    long long v15 = unk_1E25A18C0;
    long long v16 = xmmword_1E25A18D0;
    [(VCPixelBufferOverlay *)v3 currentDetails];
    LOBYTE(v14) = 1;
    BYTE1(v14) = VCOverlayManager_dispatchedIsOverlayEnabled();
    BYTE2(v14) = 1;
    *(void *)((char *)&v14 + 4) = 0;
    long long v15 = v11;
    long long v16 = v12;
    long long v17 = v10;
    *(void *)&long long v18 = 0;
    v13[2] = v12;
    v13[3] = v10;
    v13[4] = v18;
    v13[0] = v14;
    v13[1] = v11;
    [(VCPixelBufferOverlay *)v3 setCurrentDetails:v13];
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v3->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCPixelBufferOverlay.stateQueue", 0, CustomRootQueue);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCPixelBufferOverlay *)v8 init];
    }
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  stringAttributes = self->_stringAttributes;
  if (stringAttributes) {
    CFRelease(stringAttributes);
  }
  mutableDisplayText = self->_mutableDisplayText;
  if (mutableDisplayText) {
    CFRelease(mutableDisplayText);
  }
  audioInfo = self->_audioInfo;
  if (audioInfo) {
    CFRelease(audioInfo);
  }
  videoInfo = self->_videoInfo;
  if (videoInfo) {
    CFRelease(videoInfo);
  }
  networkInfo = self->_networkInfo;
  if (networkInfo) {
    CFRelease(networkInfo);
  }
  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPixelBufferOverlay;
  [(VCObject *)&v9 dealloc];
}

void __VCPixelBufferOverlay_updateSourceForType_block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2)
  {
    CFRetain((CFTypeRef)v2);
    uint64_t v2 = a1[6];
  }
  int v3 = *(unsigned __int8 *)(v2 + 28);
  if (v3 == 2)
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = 200;
    if (*(void *)(v4 + 200))
    {
      CFRelease(*(CFTypeRef *)(v4 + 200));
      uint64_t v2 = a1[6];
      uint64_t v4 = a1[4];
      uint64_t v5 = 200;
    }
    goto LABEL_10;
  }
  if (v3 == 1)
  {
    uint64_t v6 = a1[4];
    if (*(void *)(v6 + 192))
    {
      CFRelease(*(CFTypeRef *)(v6 + 192));
      uint64_t v2 = a1[6];
      uint64_t v6 = a1[4];
    }
    *(void *)(v6 + 176) = *(void *)(v2 + 16);
    *(void *)(a1[4] + 192) = v2;
  }
  else
  {
    if (!*(unsigned char *)(v2 + 28))
    {
      uint64_t v4 = a1[4];
      uint64_t v5 = 184;
      if (*(void *)(v4 + 184))
      {
        CFRelease(*(CFTypeRef *)(v4 + 184));
        uint64_t v2 = a1[6];
        uint64_t v4 = a1[4];
        uint64_t v5 = 184;
      }
LABEL_10:
      *(void *)(v4 + v5) = v2;
      return;
    }
    CFRelease((CFTypeRef)v2);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
}

- (tagVCPixelBufferOverlayConfig)currentDetails
{
  objc_copyStruct(retstr, &self->_currentDetails, 80, 1, 0);
  return result;
}

- (void)setCurrentDetails:(tagVCPixelBufferOverlayConfig *)a3
{
}

- (void)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCPixelBufferOverlay init]";
  __int16 v6 = 1024;
  int v7 = 64;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to initialize VCPixelBufferOverlay", (uint8_t *)&v2, 0x1Cu);
}

@end