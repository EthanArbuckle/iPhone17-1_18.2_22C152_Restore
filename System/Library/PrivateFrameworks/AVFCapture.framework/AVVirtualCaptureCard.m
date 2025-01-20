@interface AVVirtualCaptureCard
+ (BOOL)isVirtualCaptureCardSupported;
+ (id)sharedVirtualCaptureCard;
+ (void)initialize;
- (AVVirtualCaptureCard)init;
- (BOOL)setCapacity:(int64_t)a3 error:(id *)a4;
- (int64_t)capacity;
- (int64_t)freeSpace;
- (void)dealloc;
- (void)showSystemUserInterface;
@end

@implementation AVVirtualCaptureCard

+ (id)sharedVirtualCaptureCard
{
  if (sharedVirtualCaptureCard_onceToken != -1) {
    dispatch_once(&sharedVirtualCaptureCard_onceToken, &__block_literal_global_8);
  }
  return (id)sharedVirtualCaptureCard_sAVVirtualCaptureCard;
}

AVVirtualCaptureCard *__48__AVVirtualCaptureCard_sharedVirtualCaptureCard__block_invoke()
{
  result = objc_alloc_init(AVVirtualCaptureCard);
  sharedVirtualCaptureCard_sAVVirtualCaptureCard = (uint64_t)result;
  return result;
}

+ (BOOL)isVirtualCaptureCardSupported
{
  return FigVirtualCaptureCardRemoteSupported() != 0;
}

+ (void)initialize
{
}

- (AVVirtualCaptureCard)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVVirtualCaptureCard;
  v2 = [(AVVirtualCaptureCard *)&v4 init];
  if (v2 && FigVirtualCaptureCardRemoteCreate())
  {

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  virtualCaptureCard = self->_virtualCaptureCard;
  if (virtualCaptureCard) {
    CFRelease(virtualCaptureCard);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVVirtualCaptureCard;
  [(AVVirtualCaptureCard *)&v4 dealloc];
}

- (void)showSystemUserInterface
{
  virtualCaptureCard = self->_virtualCaptureCard;
  v3 = *(void (**)(OpaqueFigVirtualCaptureCard *))(*(void *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v3)
  {
    v3(virtualCaptureCard);
  }
}

- (int64_t)capacity
{
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigVirtualCaptureCardGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  int v6 = v5(CMBaseObject, *MEMORY[0x1E4F22050], *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v7 = cf;
  if (v6)
  {
    int64_t SInt64 = 0;
    if (!cf) {
      return SInt64;
    }
    goto LABEL_7;
  }
  int64_t SInt64 = FigCFNumberGetSInt64();
  CFTypeRef v7 = cf;
  if (cf) {
LABEL_7:
  }
    CFRelease(v7);
  return SInt64;
}

- (int64_t)freeSpace
{
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigVirtualCaptureCardGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  int v6 = v5(CMBaseObject, *MEMORY[0x1E4F22058], *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v7 = cf;
  if (v6)
  {
    int64_t SInt64 = 0;
    if (!cf) {
      return SInt64;
    }
    goto LABEL_7;
  }
  int64_t SInt64 = FigCFNumberGetSInt64();
  CFTypeRef v7 = cf;
  if (cf) {
LABEL_7:
  }
    CFRelease(v7);
  return SInt64;
}

- (BOOL)setCapacity:(int64_t)a3 error:(id *)a4
{
  int64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
  uint64_t CMBaseObject = FigVirtualCaptureCardGetCMBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(uint64_t (**)(uint64_t, void, CFNumberRef))(v8 + 56);
  if (v9)
  {
    int v10 = v9(CMBaseObject, *MEMORY[0x1E4F22050], v5);
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    int v10 = -12782;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (v10) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
  }
LABEL_10:
  if (v5) {
    CFRelease(v5);
  }
  return v10 == 0;
}

@end