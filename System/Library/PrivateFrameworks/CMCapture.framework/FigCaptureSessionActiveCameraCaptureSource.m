@interface FigCaptureSessionActiveCameraCaptureSource
- (id)initWithSource:(void *)a3 device:;
- (void)dealloc;
@end

@implementation FigCaptureSessionActiveCameraCaptureSource

- (id)initWithSource:(void *)a3 device:
{
  id v4 = a1;
  if (a1)
  {
    if (!a2 || !a3)
    {
      uint64_t v14 = v3;
      int v13 = 0;
      FigDebugAssert3();
    }
    v16.receiver = v4;
    v16.super_class = (Class)FigCaptureSessionActiveCameraCaptureSource;
    id v4 = objc_msgSendSuper2(&v16, sel_init, v13, v14);
    if (v4)
    {
      if (a2) {
        CFTypeRef v7 = CFRetain(a2);
      }
      else {
        CFTypeRef v7 = 0;
      }
      *((void *)v4 + 1) = v7;
      *((void *)v4 + 2) = a3;
      id v15 = 0;
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      v10 = *(void (**)(const void *, __CFString *, void, id *))(v9 + 48);
      if (v10)
      {
        v10(a2, @"AttributesDictionary", *MEMORY[0x1E4F1CF80], &v15);
        id v11 = v15;
      }
      else
      {
        id v11 = 0;
      }
      *((void *)v4 + 3) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"NonLocalizedName"), "copy");
      *((_DWORD *)v4 + 8) = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"DeviceType"), "intValue");
    }
  }
  return v4;
}

- (void)dealloc
{
  source = self->_source;
  if (source) {
    CFRelease(source);
  }

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSessionActiveCameraCaptureSource;
  [(FigCaptureSessionActiveCameraCaptureSource *)&v4 dealloc];
}

@end