@interface AVDataAsset
+ (id)_getFigAssetCreationOptionsFromDataAssetInitializationOptions:(id)a3 figAssetCreationFlags:(unint64_t *)a4;
+ (unint64_t)_dataLengthLimit;
- (AVDataAsset)initWithData:(id)a3 contentType:(id)a4;
- (AVDataAsset)initWithData:(id)a3 contentType:(id)a4 options:(id)a5;
- (BOOL)_requiresInProcessOperation;
- (Class)_classForTrackInspectors;
- (OpaqueFigFormatReader)_copyFormatReader;
- (id)_assetInspector;
- (id)_assetInspectorLoader;
- (id)tracks;
- (unint64_t)referenceRestrictions;
- (void)dealloc;
@end

@implementation AVDataAsset

+ (unint64_t)_dataLengthLimit
{
  return 10485760;
}

+ (id)_getFigAssetCreationOptionsFromDataAssetInitializationOptions:(id)a3 figAssetCreationFlags:(unint64_t *)a4
{
  if (a3) {
    v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  }
  else {
    v6 = 0;
  }
  v7 = (void *)[a3 objectForKey:@"AVAssetReferenceRestrictionsKey"];
  if (v7) {
    unint64_t v8 = 4 * ([v7 unsignedIntegerValue] & 0xF);
  }
  else {
    unint64_t v8 = 8;
  }
  *a4 = v8;
  v9 = (void *)[a3 objectForKey:@"AVAssetPreferNominalDurationsKey"];
  if (v9)
  {
    if (([v9 BOOLValue] & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0) {
LABEL_9:
  }
    *a4 |= 0x100uLL;
LABEL_10:
  uint64_t v10 = [a3 objectForKey:@"AVAssetPreferPreciseDurationAndTimingKey"];
  if (v10) {
    [v6 setObject:v10 forKey:*MEMORY[0x1E4F32098]];
  }
  uint64_t v11 = [a3 objectForKey:@"AVURLAssetAllowableTypeCategoriesKey"];
  if (v11) {
    [v6 setObject:v11 forKey:*MEMORY[0x1E4F31F10]];
  }
  if (+[AVAsset _assetCreationOptionsRequiresInProcessOperation:a3])
  {
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v6 setObject:v12 forKey:*MEMORY[0x1E4F320D8]];
  }
  if (+[AVAsset _assetCreationOptionsPrefersSandboxedOption:a3])
  {
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v6 setObject:v13 forKey:*MEMORY[0x1E4F320A0]];
  }
  return v6;
}

- (AVDataAsset)initWithData:(id)a3 contentType:(id)a4 options:(id)a5
{
  if ((unint64_t)[a3 length] > 0xA00000)
  {
    v16 = self;
    v22 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Data length cannot exceed %llu bytes", v17, v18, v19, v20, v21, 10485760), 0 reason userInfo];
    objc_exception_throw(v22);
  }
  v26.receiver = self;
  v26.super_class = (Class)AVDataAsset;
  v9 = [(AVAsset *)&v26 init];
  if (v9)
  {
    CFTypeRef v24 = 0;
    CFTypeRef cf = 0;
    uint64_t v10 = (void *)[a3 copy];
    v9->_initializationOptions = (NSDictionary *)[a5 copy];
    v9->_allocateTracksOnceOnly = objc_alloc_init(AVDispatchOnce);
    [v10 length];
    uint64_t BlockBufferWithCFDataNoCopy = FigCreateBlockBufferWithCFDataNoCopy();
    if (BlockBufferWithCFDataNoCopy
      || ((uint64_t v23 = 0,
           +[AVDataAsset _getFigAssetCreationOptionsFromDataAssetInitializationOptions:figAssetCreationFlags:](AVDataAsset, "_getFigAssetCreationOptionsFromDataAssetInitializationOptions:figAssetCreationFlags:", v9->_initializationOptions, &v23), !+[AVAsset _assetCreationOptionsRequiresInProcessOperation:v9->_initializationOptions])? (uint64_t v12 = FigAssetRemoteCreateWithBlockBuffer()): (uint64_t v12 = FigAssetCreateWithBlockBuffer()), BlockBufferWithCFDataNoCopy = v12, v12))
    {
      uint64_t v13 = [[AVUnreachableAssetInspectorLoader alloc] initWithFigError:BlockBufferWithCFDataNoCopy userInfo:0];
    }
    else
    {
      v15 = [AVFigAssetInspectorLoader alloc];
      uint64_t v13 = [(AVFigAssetInspectorLoader *)v15 initWithFigAsset:v24 forAsset:v9];
    }
    v9->_loader = &v13->super;
    if (cf) {
      CFRelease(cf);
    }
    if (v24) {
      CFRelease(v24);
    }

    if (!v9->_loader)
    {

      return 0;
    }
  }
  return v9;
}

- (AVDataAsset)initWithData:(id)a3 contentType:(id)a4
{
  return [(AVDataAsset *)self initWithData:a3 contentType:a4 options:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVDataAsset;
  [(AVAsset *)&v3 dealloc];
}

- (id)_assetInspectorLoader
{
  return self->_loader;
}

- (id)_assetInspector
{
  return [(AVAssetInspectorLoader *)self->_loader assetInspector];
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return [(AVAssetInspectorLoader *)self->_loader _copyFormatReader];
}

- (Class)_classForTrackInspectors
{
  return [(AVAssetInspectorLoader *)self->_loader _classForTrackInspectors];
}

- (id)tracks
{
  allocateTracksOnceOnly = self->_allocateTracksOnceOnly;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__AVDataAsset_tracks__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)allocateTracksOnceOnly runBlockOnce:v5];
  return self->_tracks;
}

uint64_t __21__AVDataAsset_tracks__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_tracksWithClass:", objc_opt_class()), "copy");
  *(void *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

- (unint64_t)referenceRestrictions
{
  if (![(NSDictionary *)self->_initializationOptions objectForKey:@"AVAssetReferenceRestrictionsKey"])return 2; {
  id v3 = [(NSDictionary *)self->_initializationOptions objectForKey:@"AVAssetReferenceRestrictionsKey"];
  }
  return [v3 unsignedIntegerValue];
}

- (BOOL)_requiresInProcessOperation
{
  return +[AVAsset _assetCreationOptionsRequiresInProcessOperation:self->_initializationOptions];
}

@end