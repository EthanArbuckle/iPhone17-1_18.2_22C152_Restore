@interface BWDNGEncoderManager
+ (void)initialize;
- (BOOL)isContainerOpen;
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

@implementation BWDNGEncoderManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  if ([(BWDNGEncoderManager *)self isContainerOpen]) {
    [(BWDNGEncoderManager *)self closeContainer];
  }
  v3.receiver = self;
  v3.super_class = (Class)BWDNGEncoderManager;
  [(BWDNGEncoderManager *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  dngCompressor = self->_dngCompressor;
  if ([(BWDNGEncoderManager *)self isContainerOpen]) {
    v6 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" (open for captureID:%lld)", self->_currentSettingsID);
  }
  else {
    v6 = &stru_1EFA403E0;
  }
  return (NSString *)[v3 stringWithFormat:@"<%@ %p>: CMPhotoDNGCompressor: %p%@", v4, self, dngCompressor, v6];
}

- (BOOL)isContainerOpen
{
  return self->_dngCompressor != 0;
}

- (int)openContainerWithOptions:(id)a3 settingsID:(int64_t)a4
{
  if (![(BWDNGEncoderManager *)self isContainerOpen]
    || (int result = [(BWDNGEncoderManager *)self closeContainer]) == 0)
  {
    int result = CMPhotoDNGCompressorCreate();
    if (!result)
    {
      self->_currentSettingsID = a4;
      self->_previewImageSize = 0;
      self->_auxiliaryImagesSize = 0;
      self->_containerSize = 0;
    }
  }
  return result;
}

- (int)openExistingContainer:(__IOSurface *)a3 options:(id)a4
{
  return -12788;
}

- (int)addMainImage:(__CVBuffer *)a3 metadata:(id)a4 options:(id)a5 imageHandleOut:(int64_t *)a6
{
  return MEMORY[0x1F410D6B0](self->_dngCompressor, a4, a3, a5);
}

- (int)addThumbnailImage:(__CVBuffer *)a3 options:(id)a4 parentImageHandle:(int64_t)a5
{
  return MEMORY[0x1F410D6B8](self->_dngCompressor, a3, a4);
}

- (int)addCompressedThumbnailImage:(__IOSurface *)a3 thumbnailImageSize:(unint64_t)a4 options:(id)a5
{
  if (a3 && a4)
  {
    v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a5];
    uint64_t v7 = [NSNumber numberWithUnsignedLong:a4];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F56208]];
    CMPhotoDNGCompressorSetCompressedPreviewImage();
  }
  return 0;
}

- (unint64_t)thumbnailImageSize
{
  return self->_previewImageSize;
}

- (int)addAuxImage:(__CVBuffer *)a3 type:(int)a4 auxImageMetadata:(CGImageMetadata *)a5 options:(id)a6 parentImageHandle:(int64_t)a7 auxImageHandleOut:(int64_t *)a8
{
  uint64_t v12 = pem_cmPhotoAuxImageCustomTypeURNForPhotoEncoderNodeAuxImageType(a4);
  if (!v12) {
    return -12780;
  }
  uint64_t v13 = v12;
  dngCompressor = self->_dngCompressor;
  return MEMORY[0x1F410D650](dngCompressor, a3, a5, v13, a6);
}

- (int)addAuxImageMetadata:(CGImageMetadata *)a3 type:(int)a4 auxImageHandle:(int64_t)a5 options:(id)a6 parentImageHandle:(int64_t)a7
{
  return -12782;
}

- (int)addAlternateImageWithDerivedImageHandles:(id)a3 options:(id)a4 parentImageHandle:(int64_t)a5 alternateGroupHandleInOut:(int64_t *)a6
{
  return -12782;
}

- (unint64_t)auxiliaryImagesSize
{
  return self->_auxiliaryImagesSize;
}

- (int)addMetadata:(id)a3 parentImageHandle:(int64_t)a4
{
  return -12782;
}

- (int)addCustomMetadataContents:(id)a3 URI:(id)a4 name:(id)a5
{
  return -12782;
}

- (int)tagStereoPairGroupWithStereoPhotoImageHandles:(id *)a3 groupMetadata:(id)a4
{
  return -12782;
}

- (int)closeContainerAndCopySurfaceOut:(__IOSurface *)a3
{
  BOOL v5 = [(BWDNGEncoderManager *)self isContainerOpen];
  BOOL v6 = v5;
  int FinalizedSize = -12780;
  if (a3 && v5)
  {
    int Surface = CMPhotoDNGCompressorFinalizeAndCreateSurface();
    if (Surface)
    {
      int FinalizedSize = Surface;
    }
    else
    {
      int FinalizedSize = CMPhotoDNGCompressorGetFinalizedSize();
      if (!FinalizedSize)
      {
        IOSurfaceDecrementUseCount(0);
        *a3 = 0;
        goto LABEL_6;
      }
    }
  }
  if (v6) {
    [(BWDNGEncoderManager *)self closeContainer];
  }
LABEL_6:
  if (dword_1E96B6B88)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_currentSettingsID = 0;
  dngCompressor = self->_dngCompressor;
  if (dngCompressor)
  {
    CFRelease(dngCompressor);
    self->_dngCompressor = 0;
  }
  return FinalizedSize;
}

- (int)closeContainer
{
  if ([(BWDNGEncoderManager *)self isContainerOpen])
  {
    int Data = CMPhotoDNGCompressorFinalizeAndCreateData();
  }
  else
  {
    int Data = -12780;
  }
  if (dword_1E96B6B88)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(_OWORD *)&self->_currentSettingsID = 0u;
  *(_OWORD *)&self->_auxiliaryImagesSize = 0u;
  dngCompressor = self->_dngCompressor;
  if (dngCompressor)
  {
    CFRelease(dngCompressor);
    self->_dngCompressor = 0;
  }
  return Data;
}

- (unint64_t)containerSize
{
  return self->_containerSize;
}

@end