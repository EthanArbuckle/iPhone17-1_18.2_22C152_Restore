@interface BWCMPhotoEncoderManager
+ (void)initialize;
- (BOOL)isContainerOpen;
- (BWCMPhotoEncoderManager)initWithDeferredPhotoProcessorEnabled:(BOOL)a3;
- (NSString)description;
- (int)addAlternateImageWithDerivedImageHandles:(id)a3 options:(id)a4 parentImageHandle:(int64_t)a5 alternateGroupHandleInOut:(int64_t *)a6;
- (int)addAuxImage:(__CVBuffer *)a3 type:(int)a4 auxImageMetadata:(CGImageMetadata *)a5 options:(id)a6 parentImageHandle:(int64_t)a7 auxImageHandleOut:(int64_t *)a8;
- (int)addAuxImageMetadata:(CGImageMetadata *)a3 type:(int)a4 auxImageHandle:(int64_t)a5 options:(id)a6 parentImageHandle:(int64_t)a7;
- (int)addCompressedThumbnailImage:(__IOSurface *)a3 thumbnailImageSize:(unint64_t)a4 options:(id)a5;
- (int)addCustomMetadataContents:(id)a3 URI:(id)a4 name:(id)a5;
- (int)addMainImage:(__CVBuffer *)a3 metadata:(id)a4 options:(id)a5 imageHandleOut:(int64_t *)a6;
- (int)addMetadata:(id)a3 parentImageHandle:(int64_t)a4;
- (int)addThumbnailImage:(__CVBuffer *)a3 options:(id)a4 parentImageHandle:(int64_t)a5;
- (int)closeContainer;
- (int)closeContainerAndCopySurfaceOut:(__IOSurface *)a3;
- (int)openContainerWithOptions:(id)a3 settingsID:(int64_t)a4;
- (int)openExistingContainer:(__IOSurface *)a3 options:(id)a4;
- (int)tagStereoPairGroupWithStereoPhotoImageHandles:(id *)a3 groupMetadata:(id)a4;
- (unint64_t)auxiliaryImagesSize;
- (unint64_t)containerSize;
- (unint64_t)thumbnailImageSize;
- (void)dealloc;
@end

@implementation BWCMPhotoEncoderManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWCMPhotoEncoderManager)initWithDeferredPhotoProcessorEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v21[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)BWCMPhotoEncoderManager;
  CFTypeRef cf = 0;
  v4 = [(BWCMPhotoEncoderManager *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_asyncEncoding = 1;
    uint64_t v6 = *MEMORY[0x1E4F561B0];
    v20[0] = *MEMORY[0x1E4F561C0];
    v20[1] = v6;
    v21[0] = MEMORY[0x1E4F1CC38];
    v21[1] = MEMORY[0x1E4F1CC38];
    v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    v8 = v7;
    if (v3) {
      [v7 setObject:&unk_1EFB00ED8 forKeyedSubscript:*MEMORY[0x1E4F561A8]];
    }
    BOOL v9 = FigCapturePlatformIOSurfaceWiringAssertionEnabled() != 0;
    v18[0] = *MEMORY[0x1E4F56378];
    uint64_t v10 = [NSNumber numberWithBool:v9];
    v18[1] = *MEMORY[0x1E4F56370];
    v19[0] = v10;
    v19[1] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    uint64_t v12 = *MEMORY[0x1E4F563A0];
    v16[0] = *MEMORY[0x1E4F563A8];
    v16[1] = v12;
    v17[0] = v11;
    v17[1] = v11;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    if (!CMPhotoSurfacePoolCreate()) {
      [v8 setObject:cf forKeyedSubscript:*MEMORY[0x1E4F561B8]];
    }
    if (CMPhotoCompressionSessionCreate())
    {

      v5 = 0;
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

- (void)dealloc
{
  if (self->_photoCompressionSession)
  {
    CMPhotoCompressionSessionReleaseHardwareResources();
    CMPhotoCompressionSessionFlushCachedBuffers();
    CMPhotoCompressionSessionInvalidate();
    CFRelease(self->_photoCompressionSession);
  }
  v3.receiver = self;
  v3.super_class = (Class)BWCMPhotoEncoderManager;
  [(BWCMPhotoEncoderManager *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  photoCompressionSession = self->_photoCompressionSession;
  if ([(BWCMPhotoEncoderManager *)self isContainerOpen]) {
    uint64_t v6 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" (open for captureID:%lld)", self->_currentSettingsID);
  }
  else {
    uint64_t v6 = &stru_1EFA403E0;
  }
  return (NSString *)[v3 stringWithFormat:@"<%@ %p>: CMPhotoCompressionSession: %p%@", v4, self, photoCompressionSession, v6];
}

- (BOOL)isContainerOpen
{
  return CMPhotoCompressionSessionIsContainerOpen() == 1;
}

- (int)openExistingContainer:(__IOSurface *)a3 options:(id)a4
{
  return MEMORY[0x1F410D5F8](self->_photoCompressionSession, a4, a3, 0);
}

- (int)openContainerWithOptions:(id)a3 settingsID:(int64_t)a4
{
  int v7 = CMPhotoCompressionSessionOpenEmptyContainer();
  if (!v7) {
    self->_currentSettingsID = a4;
  }
  self->_containerFormat = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F56058]), "intValue");
  return v7;
}

- (int)addMainImage:(__CVBuffer *)a3 metadata:(id)a4 options:(id)a5 imageHandleOut:(int64_t *)a6
{
  if (self->_asyncEncoding) {
    return CMPhotoCompressionSessionAddImageAsync();
  }
  else {
    return CMPhotoCompressionSessionAddImage();
  }
}

- (int)addThumbnailImage:(__CVBuffer *)a3 options:(id)a4 parentImageHandle:(int64_t)a5
{
  BOOL asyncEncoding = self->_asyncEncoding;
  photoCompressionSession = self->_photoCompressionSession;
  if (asyncEncoding) {
    return MEMORY[0x1F410D598](photoCompressionSession, a5, a4, a3, 0);
  }
  else {
    return MEMORY[0x1F410D590](photoCompressionSession, a5, a4, a3);
  }
}

- (int)addCompressedThumbnailImage:(__IOSurface *)a3 thumbnailImageSize:(unint64_t)a4 options:(id)a5
{
  return -12782;
}

- (unint64_t)thumbnailImageSize
{
  return 0;
}

- (int)addAuxImage:(__CVBuffer *)a3 type:(int)a4 auxImageMetadata:(CGImageMetadata *)a5 options:(id)a6 parentImageHandle:(int64_t)a7 auxImageHandleOut:(int64_t *)a8
{
  int v12 = pem_cmPhotoAuxImageTypeForPhotoEncoderNodeAuxImageType(a4);
  if (v12 == 4)
  {
    uint64_t v14 = pem_cmPhotoAuxImageCustomTypeURNForPhotoEncoderNodeAuxImageType(a4);
    if (v14)
    {
      uint64_t v15 = v14;
      v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a6];
      [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F56098]];
    }
  }
  else if (!v12)
  {
    return -12780;
  }
  if (self->_asyncEncoding) {
    int v17 = CMPhotoCompressionSessionAddAuxiliaryImageAsync();
  }
  else {
    int v17 = CMPhotoCompressionSessionAddAuxiliaryImage();
  }
  int v13 = v17;
  if (v17)
  {
    FigDebugAssert3();
  }
  else
  {
    int v13 = 0;
    if (a8) {
      *a8 = 0;
    }
  }
  return v13;
}

- (int)addAuxImageMetadata:(CGImageMetadata *)a3 type:(int)a4 auxImageHandle:(int64_t)a5 options:(id)a6 parentImageHandle:(int64_t)a7
{
  if (!pem_cmPhotoAuxImageTypeForPhotoEncoderNodeAuxImageType(a4)) {
    return -12780;
  }
  int v7 = CMPhotoCompressionSessionAddAuxiliaryImageMetadata();
  if (v7) {
    FigDebugAssert3();
  }
  return v7;
}

- (int)addAlternateImageWithDerivedImageHandles:(id)a3 options:(id)a4 parentImageHandle:(int64_t)a5 alternateGroupHandleInOut:(int64_t *)a6
{
  if (a6)
  {
    if (*a6 != -1) {
      goto LABEL_6;
    }
    int v9 = CMPhotoCompressionSessionAddGroup();
    if (!v9)
    {
      *a6 = -1;
      goto LABEL_6;
    }
LABEL_18:
    int v11 = v9;
    goto LABEL_19;
  }
  int v9 = CMPhotoCompressionSessionAddGroup();
  if (v9) {
    goto LABEL_18;
  }
LABEL_6:
  if (![a3 count]) {
    return 0;
  }
  if (self->_asyncEncoding) {
    int v10 = CMPhotoCompressionSessionAddImageAsync();
  }
  else {
    int v10 = CMPhotoCompressionSessionAddImage();
  }
  int v11 = v10;
  if (v10)
  {
LABEL_19:
    FigDebugAssert3();
    return v11;
  }
  int v12 = CMPhotoCompressionSessionAddImageHandleToGroup();
  if (v12)
  {
    int v11 = v12;
    goto LABEL_19;
  }
  int v11 = CMPhotoCompressionSessionAddImageHandleToGroup();
  if (v11) {
    goto LABEL_19;
  }
  return v11;
}

- (unint64_t)auxiliaryImagesSize
{
  return 0;
}

- (int)addMetadata:(id)a3 parentImageHandle:(int64_t)a4
{
  return MEMORY[0x1F410D588](self->_photoCompressionSession, a4, 0, a3);
}

- (int)addCustomMetadataContents:(id)a3 URI:(id)a4 name:(id)a5
{
  int v5 = 0;
  v12[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F98], "dataWithPropertyList:format:options:error:");
        [0 code];
        uint64_t v9 = *MEMORY[0x1E4F561E0];
        v11[0] = *MEMORY[0x1E4F561D0];
        v11[1] = v9;
        v12[0] = v8;
        v12[1] = a4;
        v11[2] = *MEMORY[0x1E4F561D8];
        v12[2] = a5;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
        int v5 = CMPhotoCompressionSessionAddCustomMetadata();
        if (v5) {
          FigDebugAssert3();
        }
      }
    }
  }
  return v5;
}

- (int)tagStereoPairGroupWithStereoPhotoImageHandles:(id *)a3 groupMetadata:(id)a4
{
  int v4 = CMPhotoCompressionSessionAddGroup();
  if (v4)
  {
    int v8 = v4;
    goto LABEL_11;
  }
  int v5 = CMPhotoCompressionSessionAddImageHandleToGroup();
  if (v5)
  {
    int v8 = v5;
    goto LABEL_11;
  }
  int v6 = CMPhotoCompressionSessionAddImageHandleToGroup();
  if (v6)
  {
    int v8 = v6;
    goto LABEL_11;
  }
  int v7 = CMPhotoCompressionSessionAddImageHandleToGroup();
  if (v7)
  {
    int v8 = v7;
    goto LABEL_11;
  }
  int v8 = CMPhotoCompressionSessionAddGroupProperties();
  if (v8) {
LABEL_11:
  }
    FigDebugAssert3();
  return v8;
}

- (int)closeContainerAndCopySurfaceOut:(__IOSurface *)a3
{
  if (a3)
  {
    int v4 = CMPhotoCompressionSessionCloseContainerAndCopyBacking();
    if (!v4)
    {
      int v7 = -12780;
      goto LABEL_4;
    }
    int v7 = v4;
  }
  else
  {
    int v7 = -12780;
  }
  [(BWCMPhotoEncoderManager *)self closeContainer];
LABEL_4:
  if (dword_1E96B6B88)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_currentSettingsID = 0;
  return v7;
}

- (int)closeContainer
{
  int v3 = CMPhotoCompressionSessionCloseContainer();
  if (dword_1E96B6B88)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_currentSettingsID = 0;
  self->_containerSize = 0;
  return v3;
}

- (unint64_t)containerSize
{
  return self->_containerSize;
}

@end