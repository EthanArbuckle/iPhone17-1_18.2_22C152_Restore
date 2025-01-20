@interface BWDeferredBufferIntermediate
+ (BOOL)supportsSecureCoding;
- (BWDeferredBufferIntermediate)initWithBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 metadataTag:(id)a7 portType:(id)a8 compressionProfile:(int)a9 URL:(id)a10;
- (BWDeferredBufferIntermediate)initWithBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 metadataTag:(id)a7 rawThumbnailsBufferTag:(id)a8 rawThumbnailsMetadataTag:(id)a9 mainRawThumbnailBufferTag:(id)a10 mainRawThumbnailMetadataTag:(id)a11 sifrRawThumbnailBufferTag:(id)a12 sifrRawThumbnailMetadataTag:(id)a13 portType:(id)a14 compressionProfile:(int)a15 URL:(id)a16;
- (BWDeferredBufferIntermediate)initWithCoder:(id)a3;
- (CFTypeRef)_read:(CFTypeRef)result;
- (NSDictionary)attributes;
- (NSString)mainRawThumbnailBufferTag;
- (NSString)mainRawThumbnailMetadataTag;
- (NSString)metadataTag;
- (NSString)portType;
- (NSString)rawThumbnailsBufferTag;
- (NSString)rawThumbnailsMetadataTag;
- (NSString)sifrRawThumbnailBufferTag;
- (NSString)sifrRawThumbnailMetadataTag;
- (__CVBuffer)buffer;
- (id)_shortString;
- (id)archive:(int *)a3;
- (id)description;
- (id)fetchAndRetain:(int *)a3;
- (int)compressionProfile;
- (int)flush;
- (int)setBuffer:(__CVBuffer *)a3;
- (int)setURL:(id)a3 prefetchQueue:(id)a4;
- (uint64_t)_compressionSettingsForProfile:(int *)a3 format:(uint64_t *)a4 options:;
- (uint64_t)_createCVPixelBufferFromAttributes:(CVPixelBufferRef *)a3 pixelBuffer:;
- (uint64_t)_writeAndReleaseBacking;
- (unint64_t)bufferType;
- (unint64_t)captureFrameFlags;
- (unsigned)pixelFormat;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)releaseBuffer;
@end

@implementation BWDeferredBufferIntermediate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredBufferIntermediate)initWithBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 metadataTag:(id)a7 rawThumbnailsBufferTag:(id)a8 rawThumbnailsMetadataTag:(id)a9 mainRawThumbnailBufferTag:(id)a10 mainRawThumbnailMetadataTag:(id)a11 sifrRawThumbnailBufferTag:(id)a12 sifrRawThumbnailMetadataTag:(id)a13 portType:(id)a14 compressionProfile:(int)a15 URL:(id)a16
{
  if (a3 && a5 && a15)
  {
    v25.receiver = self;
    v25.super_class = (Class)BWDeferredBufferIntermediate;
    v22 = [(BWDeferredIntermediate *)&v25 initWithTag:a4 URL:a16];
    v23 = v22;
    if (v22)
    {
      v22->_buffer = a3;
      CFRetain(a3);
      v23->_attributes = (NSDictionary *)(id)CVPixelBufferGetAttributes();
      v23->_metadataTag = (NSString *)a7;
      v23->_bufferType = a5;
      v23->_captureFrameFlags = a6;
      v23->_rawThumbnailsBufferTag = (NSString *)a8;
      v23->_rawThumbnailsMetadataTag = (NSString *)a9;
      v23->_mainRawThumbnailBufferTag = (NSString *)a10;
      v23->_mainRawThumbnailMetadataTag = (NSString *)a11;
      v23->_sifrRawThumbnailBufferTag = (NSString *)a12;
      v23->_sifrRawThumbnailMetadataTag = (NSString *)a13;
      v23->_portType = (NSString *)a14;
      v23->_compressionProfile = a15;
    }
  }
  else
  {
    FigDebugAssert3();

    return 0;
  }
  return v23;
}

- (BWDeferredBufferIntermediate)initWithBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 metadataTag:(id)a7 portType:(id)a8 compressionProfile:(int)a9 URL:(id)a10
{
  LODWORD(v11) = a9;
  return [(BWDeferredBufferIntermediate *)self initWithBuffer:a3 tag:a4 bufferType:a5 captureFrameFlags:a6 metadataTag:a7 rawThumbnailsBufferTag:0 rawThumbnailsMetadataTag:0 mainRawThumbnailBufferTag:0 mainRawThumbnailMetadataTag:0 sifrRawThumbnailBufferTag:0 sifrRawThumbnailMetadataTag:0 portType:a8 compressionProfile:v11 URL:a10];
}

- (BWDeferredBufferIntermediate)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BWDeferredBufferIntermediate;
  v4 = -[BWDeferredIntermediate initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v4->_attributes = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0), @"attributes");
    v4->_metadataTag = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"metadataTag"];
    v4->_bufferType = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"bufferType"), "unsignedIntegerValue");
    v4->_captureFrameFlags = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"captureFrameFlags"), "unsignedIntegerValue");
    v4->_rawThumbnailsBufferTag = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"rawThumbnailsBufferTag"];
    v4->_rawThumbnailsMetadataTag = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"rawThumbnailsMetadataTag"];
    v4->_mainRawThumbnailBufferTag = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"mainRawThumbnailBufferTag"];
    v4->_mainRawThumbnailMetadataTag = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"mainRawThumbnailMetadataTag"];
    v4->_sifrRawThumbnailBufferTag = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sifrRawThumbnailBufferTag"];
    v4->_sifrRawThumbnailMetadataTag = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sifrRawThumbnailMetadataTag"];
    v4->_portType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"portType"];
    v4->_compressionProfile = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"compressionProfile"), "unsignedIntegerValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWDeferredBufferIntermediate;
  -[BWDeferredIntermediate encodeWithCoder:](&v8, sel_encodeWithCoder_);
  v5 = self->_attributes;
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"PixelFormatDescription"), "objectForKeyedSubscript:", @"FillExtendedPixelsCallback"))
  {
    uint64_t v6 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"PixelFormatDescription"), "mutableCopy");
    [v6 setObject:0 forKeyedSubscript:@"FillExtendedPixelsCallback"];
    uint64_t v7 = (void *)[(NSDictionary *)v5 mutableCopy];
    [v7 setObject:v6 forKeyedSubscript:@"PixelFormatDescription"];

    v5 = (NSDictionary *)[v7 copy];
  }
  [a3 encodeObject:v5 forKey:@"attributes"];

  [a3 encodeObject:self->_metadataTag forKey:@"metadataTag"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_bufferType), @"bufferType");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_captureFrameFlags), @"captureFrameFlags");
  [a3 encodeObject:self->_rawThumbnailsBufferTag forKey:@"rawThumbnailsBufferTag"];
  [a3 encodeObject:self->_rawThumbnailsMetadataTag forKey:@"rawThumbnailsMetadataTag"];
  [a3 encodeObject:self->_mainRawThumbnailBufferTag forKey:@"mainRawThumbnailBufferTag"];
  [a3 encodeObject:self->_mainRawThumbnailMetadataTag forKey:@"mainRawThumbnailMetadataTag"];
  [a3 encodeObject:self->_sifrRawThumbnailBufferTag forKey:@"sifrRawThumbnailBufferTag"];
  [a3 encodeObject:self->_sifrRawThumbnailMetadataTag forKey:@"sifrRawThumbnailMetadataTag"];
  [a3 encodeObject:self->_portType forKey:@"portType"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_compressionProfile), @"compressionProfile");
}

- (void)dealloc
{
  buffer = self->_buffer;
  if (buffer) {
    CFRelease(buffer);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWDeferredBufferIntermediate;
  [(BWDeferredIntermediate *)&v4 dealloc];
}

- (int)setURL:(id)a3 prefetchQueue:(id)a4
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  if (!a3)
  {
    FigDebugAssert3();
    objc_super v10 = v14;
    int v11 = -16134;
LABEL_9:
    *((_DWORD *)v10 + 6) = v11;
    goto LABEL_6;
  }
  if (self->_buffer || self->super._URL)
  {
    FigDebugAssert3();
    objc_super v10 = v14;
    int v11 = -16135;
    goto LABEL_9;
  }
  self->super._URL = (NSURL *)[a3 copy];
  if (a4)
  {
    self->super._prefetching = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__BWDeferredBufferIntermediate_setURL_prefetchQueue___block_invoke;
    block[3] = &unk_1E5C24F58;
    block[4] = self;
    block[5] = &v13;
    dispatch_async((dispatch_queue_t)a4, block);
  }
LABEL_6:
  pthread_mutex_unlock(p_lock);
  int v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __53__BWDeferredBufferIntermediate_setURL_prefetchQueue___block_invoke(uint64_t a1)
{
  CFTypeRef v2 = -[BWDeferredBufferIntermediate _read:](*(CFTypeRef *)(a1 + 32), (int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    FigDebugAssert3();
  }
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (v2) {
      CFRelease(v2);
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 152) = v2;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
  pthread_cond_signal((pthread_cond_t *)(*(void *)(a1 + 32) + 72));
  v3 = (pthread_mutex_t *)(*(void *)(a1 + 32) + 8);
  return pthread_mutex_unlock(v3);
}

- (CFTypeRef)_read:(CFTypeRef)result
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v4 = (uint64_t)result;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  CFTypeRef v20 = 0;
  CFTypeRef v21 = 0;
  CFTypeRef cf = 0;
  FigGetUpTimeNanoseconds();
  if (!*(void *)(v4 + 128) || *(void *)(v4 + 152))
  {
    FigDebugAssert3();
    uint64_t v6 = 0;
    int v15 = -16135;
    goto LABEL_20;
  }
  if (!*(void *)(v4 + 160))
  {
    FigDebugAssert3();
    uint64_t v6 = 0;
    int v15 = -16132;
    goto LABEL_20;
  }
  id v18 = 0;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:*(void *)(v4 + 128) options:0 error:&v18];
  if (!v6)
  {
    LODWORD(v17) = 0;
    FigDebugAssert3();
    objc_msgSend(v18, "code", v17, v2);
    int v15 = FigSignalErrorAt();
    goto LABEL_19;
  }
  int v7 = CMPhotoDecompressionSessionCreate();
  if (v7)
  {
    int v15 = v7;
    goto LABEL_39;
  }
  unsigned __int8 v8 = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 160), "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "unsignedIntValue");
  char v9 = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 160), "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "unsignedIntValue");
  int Container = CMPhotoDecompressionSessionCreateContainer();
  if (Container)
  {
    int v15 = Container;
    goto LABEL_39;
  }
  if (*(_DWORD *)(v4 + 248) == 1)
  {
    unsigned __int8 v11 = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 160), "objectForKeyedSubscript:", *MEMORY[0x1E4F24CD0]), "unsignedIntValue")+ v9;
    if (((v8 | v11) & 7) == 0 || !(v8 & 0xF | v11 & 3))
    {
      int v12 = -[BWDeferredBufferIntermediate _createCVPixelBufferFromAttributes:pixelBuffer:](v4, *(void **)(v4 + 160), (CVPixelBufferRef *)&cf);
      if (!v12)
      {
        [v5 setObject:cf forKeyedSubscript:*MEMORY[0x1E4F562E8]];
        char v13 = 0;
        goto LABEL_14;
      }
      int v15 = v12;
LABEL_39:
      FigDebugAssert3();
      goto LABEL_20;
    }
  }
  char v13 = 1;
LABEL_14:
  [v5 setObject:&unk_1EFB042B0 forKeyedSubscript:*MEMORY[0x1E4F56278]];
  if (v20 && (int ImageForIndex = CMPhotoDecompressionContainerCreateImageForIndex()) != 0)
  {
    int v15 = ImageForIndex;
    FigDebugAssert3();
    if (v13) {
      goto LABEL_20;
    }
  }
  else
  {
    int v15 = 0;
    if (v13) {
      goto LABEL_21;
    }
  }
  if (cf) {
    CFRelease(cf);
  }
LABEL_19:
  if (v15) {
LABEL_20:
  }
    CFTypeRef cf = 0;
LABEL_21:

  if (v20) {
    CFRelease(v20);
  }
  if (v21) {
    CFRelease(v21);
  }

  if (a2) {
    *a2 = v15;
  }
  FigGetUpTimeNanoseconds();
  if (dword_1EB4C5630)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return cf;
}

- (int)setBuffer:(__CVBuffer *)a3
{
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  if (self->_buffer || self->super._URL)
  {
    FigDebugAssert3();
    int v6 = -16135;
  }
  else
  {
    self->_buffer = a3;
    CFRetain(a3);
    int v6 = 0;
  }
  pthread_mutex_unlock(p_lock);
  return v6;
}

- (void)releaseBuffer
{
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  buffer = self->_buffer;
  if (buffer)
  {
    CFRelease(buffer);
    self->_buffer = 0;
  }
  pthread_mutex_unlock(p_lock);
}

- (uint64_t)_compressionSettingsForProfile:(int *)a3 format:(uint64_t *)a4 options:
{
  v14[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 && a3 && a4)
    {
      if (a2 == 2)
      {
        uint64_t v9 = *MEMORY[0x1E4F56158];
        v11[0] = *MEMORY[0x1E4F560B8];
        v11[1] = v9;
        v12[0] = &unk_1EFB014D8;
        v12[1] = &unk_1EFB014F0;
        uint64_t v10 = *MEMORY[0x1E4F56180];
        v11[2] = *MEMORY[0x1E4F56150];
        v11[3] = v10;
        v12[2] = &unk_1EFB01508;
        v12[3] = MEMORY[0x1E4F1CC28];
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
        int v8 = 1;
LABEL_11:
        result = 0;
        *a3 = v8;
        *a4 = v7;
        return result;
      }
      if (a2 == 1)
      {
        if (_compressionSettingsForProfile_format_options__onceToken != -1) {
          dispatch_once(&_compressionSettingsForProfile_format_options__onceToken, &__block_literal_global_100);
        }
        uint64_t v6 = *MEMORY[0x1E4F56080];
        v13[0] = *MEMORY[0x1E4F560B8];
        v13[1] = v6;
        v14[0] = &unk_1EFB014C0;
        v14[1] = MEMORY[0x1E4F1CC38];
        v13[2] = *MEMORY[0x1E4F56180];
        v14[2] = [NSNumber numberWithInt:2];
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
        int v8 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      FigDebugAssert3();
    }
    return 4294951162;
  }
  return result;
}

- (uint64_t)_createCVPixelBufferFromAttributes:(CVPixelBufferRef *)a3 pixelBuffer:
{
  if (result)
  {
    id v5 = (void *)result;
    CVPixelBufferRef pixelBufferOut = 0;
    size_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "unsignedLongValue");
    size_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "unsignedLongValue");
    OSType v8 = [v5 pixelFormat];
    if (v8)
    {
      result = CVPixelBufferCreate(0, v6, v7, v8, (CFDictionaryRef)a2, &pixelBufferOut);
      if (result)
      {
        FigDebugAssert3();
        result = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      result = 4294954516;
    }
    if (a3) {
      *a3 = pixelBufferOut;
    }
  }
  return result;
}

- (uint64_t)_writeAndReleaseBacking
{
  v21[5] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v19 = 0;
  FigGetUpTimeNanoseconds();
  uint64_t v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  CFTypeRef cf = 0;
  unsigned int v17 = 0;
  uint64_t v16 = 0;
  if (*(void *)(a1 + 152) && *(void *)(a1 + 128))
  {
    uint64_t v3 = CMPhotoCompressionSessionCreate();
    if (v3)
    {
      uint64_t v13 = v3;
    }
    else
    {
      uint64_t v4 = -[BWDeferredBufferIntermediate _compressionSettingsForProfile:format:options:](a1, *(_DWORD *)(a1 + 248), (int *)&v17, &v16);
      if (v4)
      {
        uint64_t v13 = v4;
      }
      else
      {
        v20[0] = *MEMORY[0x1E4F56058];
        uint64_t v5 = [NSNumber numberWithInt:v17];
        uint64_t v6 = *MEMORY[0x1E4F56048];
        v21[0] = v5;
        v21[1] = &unk_1EFB01520;
        uint64_t v7 = *MEMORY[0x1E4F56038];
        v20[1] = v6;
        v20[2] = v7;
        uint64_t v8 = *MEMORY[0x1E4F56068];
        v21[2] = *(void *)(a1 + 128);
        v21[3] = &unk_1EFB01538;
        uint64_t v9 = *MEMORY[0x1E4F56050];
        v20[3] = v8;
        v20[4] = v9;
        v21[4] = MEMORY[0x1E4F1CC38];
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
        uint64_t v10 = CMPhotoCompressionSessionOpenEmptyContainer();
        if (v10)
        {
          uint64_t v13 = v10;
        }
        else
        {
          uint64_t v11 = CMPhotoCompressionSessionAddImage();
          if (!v11)
          {
            int v12 = *(const void **)(a1 + 152);
            if (v12)
            {
              CFRelease(v12);
              uint64_t v13 = 0;
              *(void *)(a1 + 152) = 0;
            }
            else
            {
              uint64_t v13 = 0;
            }
            goto LABEL_13;
          }
          uint64_t v13 = v11;
        }
      }
    }
    FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
    uint64_t v13 = 4294951160;
  }
LABEL_13:
  if (cf)
  {
    uint64_t v13 = CMPhotoCompressionSessionCloseContainer();
    if (cf) {
      CFRelease(cf);
    }
  }
  if (*v2 == 1) {
    kdebug_trace();
  }
  FigGetUpTimeNanoseconds();
  if (dword_1EB4C5630)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v13;
}

- (id)fetchAndRetain:(int *)a3
{
  int v7 = 0;
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  if (self->super._prefetching) {
    pthread_cond_wait(&self->super._cv, p_lock);
  }
  if (!self->_buffer) {
    self->_buffer = (__CVBuffer *)-[BWDeferredBufferIntermediate _read:](self, &v7);
  }
  pthread_mutex_unlock(p_lock);
  if (a3) {
    *a3 = v7;
  }
  id result = self->_buffer;
  if (result)
  {
    CFRetain(result);
    return self->_buffer;
  }
  return result;
}

- (id)archive:(int *)a3
{
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  buffer = self->_buffer;
  if (buffer)
  {
    IOSurface = CVPixelBufferGetIOSurface(buffer);
    if (IOSurface)
    {
      xpc_object_t XPCObject = IOSurfaceCreateXPCObject(IOSurface);
      uint64_t v9 = XPCObject;
      if (XPCObject)
      {
        CFAutorelease(XPCObject);
        int v10 = 0;
        goto LABEL_5;
      }
      FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
      uint64_t v9 = 0;
    }
    int v10 = -16133;
  }
  else
  {
    FigDebugAssert3();
    uint64_t v9 = 0;
    int v10 = -16136;
  }
LABEL_5:
  pthread_mutex_unlock(p_lock);
  if (a3) {
    *a3 = v10;
  }
  return v9;
}

- (int)flush
{
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  if (!self->super._URL) {
    goto LABEL_10;
  }
  if (!self->_buffer)
  {
    if (!self->super._dirty) {
      goto LABEL_8;
    }
LABEL_10:
    FigDebugAssert3();
    int v4 = -16136;
    goto LABEL_9;
  }
  if (!self->super._dirty)
  {
LABEL_8:
    int v4 = 0;
    goto LABEL_9;
  }
  int v4 = -[BWDeferredBufferIntermediate _writeAndReleaseBacking]((uint64_t)self);
  if (v4) {
    FigDebugAssert3();
  }
  self->super._dirty = 0;
LABEL_9:
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(BWDeferredIntermediate *)self tag];
  uint64_t v6 = BWStillImageBufferTypeToShortString(self->_bufferType);
  return (id)[v3 stringWithFormat:@"<%@ %p>: tag:%@ bufferType:%@ captureFrameFlags:%@ portType:%@ metadataTag:%@ bufferAttributes:%@", v4, self, v5, v6, BWStillImageCaptureFrameFlagsToShortString(self->_captureFrameFlags), self->_portType, self->_metadataTag, self->_attributes];
}

- (id)_shortString
{
  uint64_t v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "unsignedIntValue");
  uint64_t v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "unsignedIntValue");
  uint64_t v5 = NSString;
  uint64_t v6 = BWStillImageBufferTypeToShortString(self->_bufferType);
  uint64_t v7 = BWStillImageCaptureFrameFlagsToShortString(self->_captureFrameFlags);
  return (id)[v5 stringWithFormat:@"'%@ - %@' ('%@', %dx%d)", v6, v7, BWStringFromCVPixelFormatType(-[BWDeferredBufferIntermediate pixelFormat](self, "pixelFormat")), v3, v4];
}

- (unsigned)pixelFormat
{
  id v2 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = (id)[v2 firstObject];
  }
  return [v2 unsignedIntValue];
}

- (__CVBuffer)buffer
{
  return self->_buffer;
}

- (unint64_t)bufferType
{
  return self->_bufferType;
}

- (unint64_t)captureFrameFlags
{
  return self->_captureFrameFlags;
}

- (NSString)metadataTag
{
  return self->_metadataTag;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)rawThumbnailsBufferTag
{
  return self->_rawThumbnailsBufferTag;
}

- (NSString)rawThumbnailsMetadataTag
{
  return self->_rawThumbnailsMetadataTag;
}

- (NSString)mainRawThumbnailBufferTag
{
  return self->_mainRawThumbnailBufferTag;
}

- (NSString)mainRawThumbnailMetadataTag
{
  return self->_mainRawThumbnailMetadataTag;
}

- (NSString)sifrRawThumbnailBufferTag
{
  return self->_sifrRawThumbnailBufferTag;
}

- (NSString)sifrRawThumbnailMetadataTag
{
  return self->_sifrRawThumbnailMetadataTag;
}

- (NSString)portType
{
  return self->_portType;
}

- (int)compressionProfile
{
  return self->_compressionProfile;
}

@end