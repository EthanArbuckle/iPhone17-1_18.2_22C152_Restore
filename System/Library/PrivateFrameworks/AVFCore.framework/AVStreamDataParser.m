@interface AVStreamDataParser
+ (BOOL)canParseExtendedMIMEType:(id)a3;
+ (NSArray)audiovisualMIMETypes;
+ (OpaqueCMBlockBuffer)_createBlockBufferUsingNSData:(id)a3 withOffset:(unint64_t)a4 withLength:(unint64_t)a5;
+ (id)_createNSDataWithBlockBuffer:(OpaqueCMBlockBuffer *)a3;
+ (id)outputMIMECodecParameterForInputMIMECodecParameter:(id)a3;
- (AVAsset)asset;
- (AVStreamDataParser)init;
- (AVStreamDataParserOutputHandling)delegate;
- (BOOL)_ICYIsAllowed;
- (BOOL)_MPEG2TSIsAllowed;
- (BOOL)_MovieFragmentStreamIsAllowed;
- (BOOL)_WebVTTIsAllowed;
- (BOOL)_attachedToExternalContentKeySession;
- (BOOL)hasProtector;
- (BOOL)isDefunct;
- (BOOL)mayRequireContentKeysForMediaDataProcessing;
- (BOOL)preferSandboxedParsing;
- (BOOL)shouldProvideMediaDataForTrackID:(int)a3;
- (NSArray)allowableMIMETypes;
- (NSData)contentProtectionSessionIdentifier;
- (NSError)error;
- (id)_fullListOfAllowableMIMETypes;
- (id)contentKeySession;
- (id)streamingContentKeyRequestDataForApp:(id)a3 contentIdentifier:(id)a4 trackID:(int)a5 options:(id)a6 error:(id *)a7;
- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5;
- (int)_createFigManifold:(OpaqueCMBlockBuffer *)a3 manifold:(OpaqueFigManifold *)a4;
- (int)_createFigManifoldRemote:(OpaqueCMBlockBuffer *)a3 manifold:(OpaqueFigManifold *)a4;
- (int)_createFigManifoldWithBlockBuffer:(OpaqueCMBlockBuffer *)a3 manifold:(OpaqueFigManifold *)a4;
- (int)_figManifold:(OpaqueFigManifold *)a3 discoveredNewTrackID:(int)a4 mediaType:(id)a5;
- (int)_figManifold:(OpaqueFigManifold *)a3 formatDescription:(opaqueCMFormatDescription *)a4 orDecryptorDidChange:(void *)a5 forTrackID:(int)a6;
- (int)_figManifold:(OpaqueFigManifold *)a3 pushedSampleBuffer:(opaqueCMSampleBuffer *)a4 trackID:(int)a5 flags:(unsigned int)a6;
- (int)_figManifold:(OpaqueFigManifold *)a3 trackDidEnd:(int)a4;
- (int)_registerForFigManifoldCallbacksForTrackID:(int)a3;
- (int)_unregisterForFigManifoldCallbacksForTrackID:(int)a3;
- (int64_t)status;
- (int64_t)status2;
- (void)_appendStreamData:(OpaqueCMBlockBuffer *)a3 withFlags:(unint64_t)a4;
- (void)_configureInternal;
- (void)_createAssetIfNecessary;
- (void)_setError:(id)a3;
- (void)_willDeallocOrFinalize;
- (void)appendStreamData:(id)a3;
- (void)appendStreamData:(id)a3 withFlags:(unint64_t)a4;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)contentKeySessionContentProtectionSessionIdentifierDidChange:(id)a3;
- (void)dealloc;
- (void)expire;
- (void)processContentKeyResponseData:(id)a3 forTrackID:(int)a4;
- (void)processContentKeyResponseError:(id)a3 forTrackID:(int)a4;
- (void)providePendingMediaData;
- (void)renewExpiringContentKeyResponseDataForTrackID:(int)a3;
- (void)setAllowableMIMETypes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferSandboxedParsing:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setShouldProvideMediaData:(BOOL)a3 forTrackID:(int)a4;
- (void)setStatus:(int64_t)a3;
@end

@implementation AVStreamDataParser

- (void)_configureInternal
{
  v3 = objc_alloc_init(AVStreamDataParserInternal);
  self->_parser = v3;
  CFRetain(v3);
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  self->_parser->_threadSafetyQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVStreamDataParser._threadSafetyQ", v4);
  self->_parser->_status = 0;
  self->_parser->_typeIdOfInitialFigManifold = 0;
  self->_parser->_samplesBeforeReadyTotalDuration = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1FA48];
  self->_parser->_startedUsingInternalContentKeySession = 0;
  self->_parser->_accumulatedInitializationData = 0;
  self->_parser->_preferSandboxedParsing = 0;
}

- (AVStreamDataParser)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVStreamDataParser;
  v2 = [(AVStreamDataParser *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AVStreamDataParser *)v2 _configureInternal];
  }
  return v3;
}

- (void)_willDeallocOrFinalize
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  parser = self->_parser;
  if (parser)
  {
    parser->_delegate = 0;
    v4 = self->_parser;
    if (v4->_threadSafetyQ)
    {
      dispatch_release((dispatch_object_t)v4->_threadSafetyQ);
      v4 = self->_parser;
    }
    if (v4->_figManifold)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      objc_super v5 = [(AVAsset *)v4->_asset tracks];
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            -[AVStreamDataParser _unregisterForFigManifoldCallbacksForTrackID:](self, "_unregisterForFigManifoldCallbacksForTrackID:", [*(id *)(*((void *)&v15 + 1) + 8 * v9++) trackID]);
          }
          while (v7 != v9);
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }
      uint64_t FigBaseObject = FigManifoldGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v11 = FigBaseObject;
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        v14 = *(void (**)(uint64_t))(v13 + 24);
        if (v14) {
          v14(v11);
        }
      }
      CFRelease(self->_parser->_figManifold);
      v4 = self->_parser;
    }
    CFRelease(v4);
  }
}

- (void)dealloc
{
  [(AVStreamDataParser *)self _willDeallocOrFinalize];
  parser = self->_parser;
  if (parser)
  {

    v4 = self->_parser;
    accumulatedInitializationData = v4->_accumulatedInitializationData;
    if (accumulatedInitializationData)
    {
      CFRelease(accumulatedInitializationData);
      v4 = self->_parser;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)AVStreamDataParser;
  [(AVStreamDataParser *)&v6 dealloc];
}

- (void)setDelegate:(id)a3
{
  self->_parser->_delegate = (AVStreamDataParserOutputHandling *)a3;
}

- (AVStreamDataParserOutputHandling)delegate
{
  return self->_parser->_delegate;
}

- (int64_t)status
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  threadSafetyQ = self->_parser->_threadSafetyQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__AVStreamDataParser_status__block_invoke;
  v5[3] = &unk_1E57B2160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafetyQ, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__AVStreamDataParser_status__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1 - (v1 > 2);
  return result;
}

- (int64_t)status2
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  threadSafetyQ = self->_parser->_threadSafetyQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__AVStreamDataParser_status2__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafetyQ, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__AVStreamDataParser_status2__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 24);
  return result;
}

- (void)setStatus:(int64_t)a3
{
  threadSafetyQ = self->_parser->_threadSafetyQ;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__AVStreamDataParser_setStatus___block_invoke;
  v4[3] = &unk_1E57B2228;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(threadSafetyQ, v4);
}

uint64_t __32__AVStreamDataParser_setStatus___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 < 4 || v1 >= v3) {
    *(void *)(v2 + 24) = v1;
  }
  return result;
}

- (void)appendStreamData:(id)a3
{
}

- (NSError)error
{
  return self->_parser->_error;
}

- (void)_setError:(id)a3
{
  [(AVStreamDataParser *)self setStatus:4];
  if (!self->_parser->_error)
  {
    self->_parser->_error = (NSError *)[a3 copy];
    if (self->_parser->_delegate)
    {
      if (objc_opt_respondsToSelector())
      {
        parser = self->_parser;
        delegate = parser->_delegate;
        error = parser->_error;
        [(AVStreamDataParserOutputHandling *)delegate streamDataParser:self didFailToParseStreamDataWithError:error];
      }
    }
  }
}

+ (NSArray)audiovisualMIMETypes
{
  if (audiovisualMIMETypes_onceToken != -1) {
    dispatch_once(&audiovisualMIMETypes_onceToken, &__block_literal_global_44);
  }
  return (NSArray *)audiovisualMIMETypes_mimes;
}

void __42__AVStreamDataParser_audiovisualMIMETypes__block_invoke()
{
  audiovisualMIMETypes_mimes = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v0 = FigCopyWebVTTMIMETypes();
  if (v0)
  {
    uint64_t v1 = (const void *)v0;
    [(id)audiovisualMIMETypes_mimes addObjectsFromArray:v0];
    CFRelease(v1);
  }
  uint64_t v2 = FigCopyQTMovieMIMETypes();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    [(id)audiovisualMIMETypes_mimes addObjectsFromArray:v2];
    CFRelease(v3);
  }
  uint64_t v4 = FigCopyMPEGTransportStreamMIMETypes();
  if (v4)
  {
    objc_super v5 = (const void *)v4;
    [(id)audiovisualMIMETypes_mimes addObjectsFromArray:v4];
    CFRelease(v5);
  }
  FigCopySetOfAudioSupportedMIMETypes();
}

+ (BOOL)canParseExtendedMIMEType:(id)a3
{
  return FigMediaValidatorValidateRFC4281ExtendedMIMETypeForStreaming() == 0;
}

- (void)setAllowableMIMETypes:(id)a3
{
  parser = self->_parser;
  if (parser->_figManifold) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"must only set allowableMIMETypes before any stream data is appended" userInfo:0]);
  }
  allowableMIMETypes = parser->_allowableMIMETypes;
  self->_parser->_allowableMIMETypes = (NSArray *)[a3 copyWithZone:0];
}

- (NSArray)allowableMIMETypes
{
  uint64_t v2 = (void *)[(NSArray *)self->_parser->_allowableMIMETypes copyWithZone:0];
  return (NSArray *)v2;
}

- (void)_appendStreamData:(OpaqueCMBlockBuffer *)a3 withFlags:(unint64_t)a4
{
  CFNumberRef number = 0;
  CFTypeRef cf = 0;
  if (!a3) {
    return;
  }
  if ([(AVStreamDataParser *)self status2] < 4)
  {
    parser = self->_parser;
    if (parser->_figManifold)
    {
      uint64_t v7 = (OpaqueCMBlockBuffer *)CFRetain(a3);
      if (!v7) {
        goto LABEL_59;
      }
LABEL_7:
      figManifold = self->_parser->_figManifold;
      if (!figManifold) {
        goto LABEL_59;
      }
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      v21 = *(uint64_t (**)(OpaqueFigManifold *, void, unint64_t, OpaqueCMBlockBuffer *))(v11 + 8);
      if (v21)
      {
        int v22 = v21(figManifold, 0, a4 & 1, v7);
        if (v22 == -16046)
        {
          CFTypeRef valuePtr = 0;
          v23 = self->_parser->_figManifold;
          uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v24) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = 0;
          }
          v31 = *(unsigned int (**)(OpaqueFigManifold *, void, void, CFTypeRef *))(v25 + 48);
          if (v31 && !v31(v23, *MEMORY[0x1E4F32F88], *MEMORY[0x1E4F1CF80], &valuePtr))
          {
            [(AVStreamDataParser *)self providePendingMediaData];
            uint64_t FigBaseObject = FigManifoldGetFigBaseObject();
            if (FigBaseObject)
            {
              uint64_t v33 = FigBaseObject;
              uint64_t v34 = *(void *)(CMBaseObjectGetVTable() + 8);
              uint64_t v35 = v34 ? v34 : 0;
              v39 = *(void (**)(uint64_t))(v35 + 24);
              if (v39) {
                v39(v33);
              }
            }
            v40 = self->_parser;
            v41 = v40->_figManifold;
            if (v41)
            {
              CFRelease(v41);
              self->_parser->_figManifold = 0;
              v40 = self->_parser;
            }

            self->_parser->_asset = 0;
            v42 = self->_parser;
            accumulatedInitializationData = v42->_accumulatedInitializationData;
            if (accumulatedInitializationData)
            {
              CFRelease(accumulatedInitializationData);
              self->_parser->_accumulatedInitializationData = 0;
              v42 = self->_parser;
            }

            self->_parser->_samplesBeforeReady = 0;
            self->_parser->_samplesBeforeReadyTotalSize = 0;
            v44 = self->_parser;
            uint64_t v45 = MEMORY[0x1E4F1FA48];
            *(_OWORD *)&v44->_samplesBeforeReadyTotalDuration.value = *MEMORY[0x1E4F1FA48];
            v44->_samplesBeforeReadyTotalDuration.epoch = *(void *)(v45 + 16);
            self->_parser->_encounteredStreamDiscontinuity = 1;
            uint64_t v38 = (uint64_t)valuePtr;
            if (valuePtr)
            {
              [(AVStreamDataParser *)self _appendStreamData:valuePtr withFlags:a4];
              CFRelease(valuePtr);
              uint64_t v38 = 0;
            }
            goto LABEL_57;
          }
        }
        else if (!v22)
        {
          v26 = self->_parser->_figManifold;
          uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 8);
          uint64_t v28 = v27 ? v27 : 0;
          v36 = *(unsigned int (**)(OpaqueFigManifold *, void, void, CFNumberRef *))(v28 + 48);
          if (v36)
          {
            if (!v36(v26, *MEMORY[0x1E4F32F80], *MEMORY[0x1E4F1CF80], &number))
            {
              LODWORD(valuePtr) = 0;
              CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
              if (valuePtr)
              {
                if (valuePtr == 2)
                {
                  uint64_t v37 = 3;
                }
                else
                {
                  if (valuePtr != 1) {
                    goto LABEL_59;
                  }
                  if (self->_parser->_asset) {
                    uint64_t v37 = 2;
                  }
                  else {
                    uint64_t v37 = 1;
                  }
                }
              }
              else
              {
                uint64_t v37 = 2;
              }
              [(AVStreamDataParser *)self setStatus:v37];
              goto LABEL_59;
            }
          }
        }
      }
      goto LABEL_55;
    }
    v14 = parser->_accumulatedInitializationData;
    p_accumulatedInitializationData = &parser->_accumulatedInitializationData;
    uint64_t v13 = v14;
    if (!v14)
    {
      CMBlockBufferCreateEmpty((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, p_accumulatedInitializationData);
      uint64_t v13 = self->_parser->_accumulatedInitializationData;
      if (!v13) {
        goto LABEL_4;
      }
    }
    size_t DataLength = CMBlockBufferGetDataLength(a3);
    CMBlockBufferAppendBufferReference(v13, a3, 0, DataLength, 0);
    uint64_t v7 = (OpaqueCMBlockBuffer *)CFRetain(self->_parser->_accumulatedInitializationData);
    if (!v7) {
      goto LABEL_59;
    }
    signed int v16 = [(AVStreamDataParser *)self _createFigManifoldWithBlockBuffer:v7 manifold:&cf];
    if (v16 != -16048 && v16 != -16044)
    {
      if (v16)
      {
        uint64_t v29 = AVLocalizedErrorWithUnderlyingOSStatus(v16, 0);
LABEL_56:
        uint64_t v38 = v29;
LABEL_57:
        if (v38) {
          -[AVStreamDataParser _setError:](self, "_setError:");
        }
        goto LABEL_59;
      }
      if (!cf) {
        goto LABEL_59;
      }
      unint64_t typeIdOfInitialFigManifold = self->_parser->_typeIdOfInitialFigManifold;
      CFTypeID v20 = CFGetTypeID(cf);
      if (typeIdOfInitialFigManifold)
      {
        if (typeIdOfInitialFigManifold != v20) {
          goto LABEL_55;
        }
      }
      else
      {
        self->_parser->_unint64_t typeIdOfInitialFigManifold = v20;
      }
      self->_parser->_figManifold = (OpaqueFigManifold *)CFRetain(cf);
      v30 = self->_parser->_accumulatedInitializationData;
      if (v30)
      {
        CFRelease(v30);
        self->_parser->_accumulatedInitializationData = 0;
      }
      goto LABEL_7;
    }
    if (v16 == -16048) {
      size_t v18 = 0x200000;
    }
    else {
      size_t v18 = 0x20000;
    }
    if (CMBlockBufferGetDataLength(v7) <= v18) {
      goto LABEL_7;
    }
LABEL_55:
    uint64_t v29 = AVLocalizedError(@"AVFoundationErrorDomain", -11853, 0);
    goto LABEL_56;
  }
  NSLog(&cfstr_IgnoringAppend.isa);
LABEL_4:
  uint64_t v7 = 0;
LABEL_59:
  if (number) {
    CFRelease(number);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (cf) {
    CFRelease(cf);
  }
}

- (void)appendStreamData:(id)a3 withFlags:(unint64_t)a4
{
  unint64_t v7 = [a3 length];
  uint64_t v8 = +[AVStreamDataParser _createBlockBufferUsingNSData:a3 withOffset:0 withLength:v7];
  if (v8)
  {
    uint64_t v9 = v8;
    if (v7 <= 0x20000)
    {
      [(AVStreamDataParser *)self _appendStreamData:v8 withFlags:a4];
    }
    else
    {
      size_t v10 = 0;
      CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      do
      {
        CMBlockBufferRef blockBufferOut = 0;
        if (v7 >= 0x20000) {
          size_t v12 = 0x20000;
        }
        else {
          size_t v12 = v7;
        }
        if (CMBlockBufferCreateWithBufferReference(v11, v9, v10, v12, 0, &blockBufferOut)) {
          BOOL v13 = 1;
        }
        else {
          BOOL v13 = blockBufferOut == 0;
        }
        if (v13) {
          break;
        }
        -[AVStreamDataParser _appendStreamData:withFlags:](self, "_appendStreamData:withFlags:");
        v10 += v12;
        v7 -= v12;
        CFRelease(blockBufferOut);
      }
      while (v7);
    }
    CFRelease(v9);
  }
}

- (void)providePendingMediaData
{
  if ([(AVStreamDataParser *)self status2] < 4)
  {
    figManifold = self->_parser->_figManifold;
    if (figManifold)
    {
      uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v5 = v4 ? v4 : 0;
      uint64_t v6 = *(unsigned int (**)(OpaqueFigManifold *))(v5 + 40);
      if (!v6 || v6(figManifold))
      {
        uint64_t v7 = AVLocalizedError(@"AVFoundationErrorDomain", -11853, 0);
        [(AVStreamDataParser *)self _setError:v7];
      }
    }
  }
  else
  {
    NSLog(&cfstr_IgnoringProvid.isa);
  }
}

- (AVAsset)asset
{
  return self->_parser->_asset;
}

- (void)setShouldProvideMediaData:(BOOL)a3 forTrackID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  if (![(AVAsset *)self->_parser->_asset trackWithTrackID:*(void *)&a4])
  {
    size_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    size_t v12 = @"AVErrorPersistentTrackIDKey";
    v13[0] = [MEMORY[0x1E4F28ED0] numberWithInt:v4];
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, @"trackID must be valid", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1)));
  }
  trackIDsNotProvidingMedia = self->_parser->_trackIDsNotProvidingMedia;
  if (v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:(int)v4];
    [(NSMutableArray *)trackIDsNotProvidingMedia removeObject:v8];
  }
  else
  {
    if (!trackIDsNotProvidingMedia)
    {
      self->_parser->_trackIDsNotProvidingMedia = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
      trackIDsNotProvidingMedia = self->_parser->_trackIDsNotProvidingMedia;
    }
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:(int)v4];
    [(NSMutableArray *)trackIDsNotProvidingMedia addObject:v9];
  }
}

- (BOOL)shouldProvideMediaDataForTrackID:(int)a3
{
  return -[NSMutableArray containsObject:](self->_parser->_trackIDsNotProvidingMedia, "containsObject:", [MEMORY[0x1E4F28ED0] numberWithInteger:a3]) ^ 1;
}

- (void)_createAssetIfNecessary
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  parser = self->_parser;
  if (!parser->_asset)
  {
    CFTypeRef cf = 0;
    figManifold = parser->_figManifold;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(uint64_t (**)(OpaqueFigManifold *, void, void, CFTypeRef *))(v6 + 48);
    if (v7)
    {
      int v8 = v7(figManifold, *MEMORY[0x1E4F32F78], *MEMORY[0x1E4F1CF80], &cf);
      if (!v8 || v8 == -12784)
      {
        if (cf)
        {
          self->_parser->_asset = (AVAsset *)+[AVAsset inspectionOnlyAssetWithFigAsset:](AVAsset, "inspectionOnlyAssetWithFigAsset:");
          CFRelease(cf);
        }
        else
        {
          self->_parser->_asset = (AVAsset *)+[AVAsset inspectionOnlyAssetWithStreamDataParser:self tracks:self->_parser->_tracksBecomingReadyByTrackID];
        }
        size_t v10 = self->_parser;
        if (v10->_asset)
        {

          self->_parser->_tracksBecomingReadyByTrackID = 0;
          uint64_t v11 = self->_parser;
          if (v11->_delegate)
          {
            char v12 = objc_opt_respondsToSelector();
            uint64_t v11 = self->_parser;
            if (v12)
            {
              [(AVStreamDataParserOutputHandling *)v11->_delegate streamDataParser:self didParseStreamDataAsAsset:v11->_asset withDiscontinuity:v11->_encounteredStreamDiscontinuity];
              uint64_t v11 = self->_parser;
            }
          }
          v11->_encounteredStreamDiscontinuity = 0;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          obj = self->_parser->_samplesBeforeReady;
          uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v19;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v19 != v15) {
                  objc_enumerationMutation(obj);
                }
                -[AVStreamDataParser _figManifold:pushedSampleBuffer:trackID:flags:](self, "_figManifold:pushedSampleBuffer:trackID:flags:", [*(id *)(*((void *)&v18 + 1) + 8 * i) objectForKey:@"figManifold"], objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "objectForKey:", @"sbuf"), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "objectForKey:", @"trackID"), "intValue"), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "objectForKey:", @"flags"), "unsignedIntValue"));
              }
              uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
            }
            while (v14);
          }

          self->_parser->_samplesBeforeReady = 0;
        }
      }
    }
  }
}

+ (id)outputMIMECodecParameterForInputMIMECodecParameter:(id)a3
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", @"avc3", @"avc1"), "stringByReplacingOccurrencesOfString:withString:", @"hev1", @"hvc1");
  return (id)[v3 stringByReplacingOccurrencesOfString:@"dvhe" withString:@"dvh1"];
}

+ (OpaqueCMBlockBuffer)_createBlockBufferUsingNSData:(id)a3 withOffset:(unint64_t)a4 withLength:(unint64_t)a5
{
  return 0;
}

+ (id)_createNSDataWithBlockBuffer:(OpaqueCMBlockBuffer *)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  CMBlockBufferRef blockBufferOut = 0;
  if (CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, 0, &blockBufferOut)|| (size_t v6 = 0, dataPointerOut = 0, CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, &v6, &dataPointerOut))|| (v3 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:dataPointerOut length:v6 freeWhenDone:0]) == 0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    v9[0] = @"data";
    v9[1] = @"contiguousBlock";
    v10[0] = v3;
    v10[1] = blockBufferOut;
    uint64_t v4 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  return v4;
}

- (int)_figManifold:(OpaqueFigManifold *)a3 pushedSampleBuffer:(opaqueCMSampleBuffer *)a4 trackID:(int)a5 flags:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  v34[4] = *MEMORY[0x1E4F143B8];
  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  CMMediaType MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
  uint64_t v13 = AVStringForOSType(MediaType);
  uint64_t v14 = CMSampleBufferGetFormatDescription(a4);
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v14);
  AVStringForOSType(MediaSubType);
  parser = self->_parser;
  if (parser->_asset)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ![(NSArray *)[(AVAssetTrack *)[(AVAsset *)self->_parser->_asset trackWithTrackID:v7] formatDescriptions] count])
    {
      CMFormatDescriptionRef v24 = CMSampleBufferGetFormatDescription(a4);
      if (v24)
      {
        CMFormatDescriptionRef v25 = v24;
        v26 = self->_parser->_asset;
        self->_parser->_asset = (AVAsset *)[(AVAsset *)self->_parser->_asset copyAssetWithReplacementFormatDescription:v25 forTrackID:v7];
        if (self->_parser->_delegate)
        {
          if (objc_opt_respondsToSelector()) {
            [(AVStreamDataParserOutputHandling *)self->_parser->_delegate streamDataParser:self didParseStreamDataAsAsset:self->_parser->_asset withDiscontinuity:0];
          }
        }
      }
    }
    LODWORD(delegate) = [(AVStreamDataParser *)self shouldProvideMediaDataForTrackID:v7];
    if (delegate)
    {
      delegate = self->_parser->_delegate;
      if (delegate)
      {
        if (objc_opt_respondsToSelector())
        {
          trackDecryptorsByTrackID = self->_parser->_trackDecryptorsByTrackID;
          if (trackDecryptorsByTrackID
            && -[NSMutableDictionary objectForKey:](trackDecryptorsByTrackID, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithInt:v7]))
          {
            FigSampleBufferSetDecryptor();
          }
          [(AVStreamDataParserOutputHandling *)self->_parser->_delegate streamDataParser:self didProvideMediaData:a4 forTrackID:v7 mediaType:v13 flags:0];
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
    samplesBeforeReady = parser->_samplesBeforeReady;
    if (!samplesBeforeReady)
    {
      self->_parser->_samplesBeforeReady = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
      samplesBeforeReady = self->_parser->_samplesBeforeReady;
    }
    v33[0] = @"figManifold";
    v33[1] = @"sbuf";
    v34[0] = a3;
    v34[1] = a4;
    v33[2] = @"trackID";
    v34[2] = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    v33[3] = @"flags";
    v34[3] = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v6];
    -[NSMutableArray addObject:](samplesBeforeReady, "addObject:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4]);
    self->_parser->_samplesBeforeReadyTotalSize += CMSampleBufferGetTotalSampleSize(a4);
    memset(&v32, 0, sizeof(v32));
    CMSampleBufferGetOutputDuration(&v32, a4);
    if ((v32.flags & 0x1D) == 1)
    {
      long long v20 = self->_parser;
      CMTime lhs = (CMTime)v20->_samplesBeforeReadyTotalDuration;
      CMTime rhs = v32;
      CMTimeAdd(&time1, &lhs, &rhs);
      v20->_samplesBeforeReadyTotalDuration = ($95D729B680665BEAEFA1D6FCA8238556)time1;
    }
    long long v21 = self->_parser;
    unint64_t samplesBeforeReadyTotalSize = v21->_samplesBeforeReadyTotalSize;
    if (samplesBeforeReadyTotalSize <= 0xA00000)
    {
      CMTime time1 = (CMTime)v21->_samplesBeforeReadyTotalDuration;
      *(_OWORD *)&lhs.value = kAVStreamDataParserMaxCachedOutputDuration;
      lhs.epoch = 0;
      if (CMTimeCompare(&time1, &lhs) < 1)
      {
LABEL_20:
        LODWORD(delegate) = 0;
        return (int)delegate;
      }
      CMTime time1 = (CMTime)self->_parser->_samplesBeforeReadyTotalDuration;
      Float64 Seconds = CMTimeGetSeconds(&time1);
      *(_OWORD *)&time1.value = kAVStreamDataParserMaxCachedOutputDuration;
      time1.epoch = 0;
      Float64 v28 = CMTimeGetSeconds(&time1);
      NSLog(&cfstr_AbortingParsin_0.isa, *(void *)&Seconds, *(void *)&v28);
    }
    else
    {
      NSLog(&cfstr_AbortingParsin.isa, samplesBeforeReadyTotalSize, 10485760);
    }
    LODWORD(delegate) = -16047;
  }
  return (int)delegate;
}

- (int)_figManifold:(OpaqueFigManifold *)a3 trackDidEnd:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [(AVAsset *)self->_parser->_asset trackWithTrackID:*(void *)&a4];
  if (v6)
  {
    uint64_t v7 = v6;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    parser = self->_parser;
    if (isKindOfClass)
    {
      size_t v10 = parser->_asset;
      self->_parser->_asset = (AVAsset *)[(AVAsset *)self->_parser->_asset copyAssetRemovingTrackID:v4];
      parser = self->_parser;
      if (parser->_delegate)
      {
        char v11 = objc_opt_respondsToSelector();
        parser = self->_parser;
        if (v11)
        {
          [(AVStreamDataParserOutputHandling *)parser->_delegate streamDataParser:self didParseStreamDataAsAsset:parser->_asset withDiscontinuity:0];
          parser = self->_parser;
        }
      }
    }
    if (parser->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [(AVStreamDataParserOutputHandling *)self->_parser->_delegate streamDataParser:self didReachEndOfTrackWithTrackID:v4 mediaType:[(AVAssetTrack *)v7 mediaType]];
    }
  }
  return 0;
}

- (int)_figManifold:(OpaqueFigManifold *)a3 formatDescription:(opaqueCMFormatDescription *)a4 orDecryptorDidChange:(void *)a5 forTrackID:(int)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a4 && FigCPEIsSupportedFormatDescription())
  {
    self->_parser->_currentTrackID = a6;
    parser = self->_parser;
    trackFormatDescriptionsByTrackID = parser->_trackFormatDescriptionsByTrackID;
    if (!trackFormatDescriptionsByTrackID)
    {
      self->_parser->_trackFormatDescriptionsByTrackID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      parser = self->_parser;
      trackFormatDescriptionsByTrackID = parser->_trackFormatDescriptionsByTrackID;
    }
    -[NSMutableDictionary setObject:forKey:](trackFormatDescriptionsByTrackID, "setObject:forKey:", a4, [MEMORY[0x1E4F28ED0] numberWithInt:parser->_currentTrackID]);
    CFPropertyListRef Extension = CMFormatDescriptionGetExtension(a4, (CFStringRef)*MEMORY[0x1E4F1EE20]);
    if (Extension)
    {
      char v11 = (void *)Extension;
      char v12 = (void *)[MEMORY[0x1E4F1CA48] array];
      uint64_t v13 = (void *)[v11 objectForKey:@"sinf"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v45 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v47 != v15) {
                objc_enumerationMutation(v13);
              }
              uint64_t v17 = *(void *)(*((void *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v12 addObject:v17];
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v45 count:16];
          }
          while (v14);
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v12 addObject:v13];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
    if ([v12 count])
    {
      long long v18 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v19 = [v12 countByEnumeratingWithState:&v46 objects:v45 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v47 != v20) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(v18, "addObject:", objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * j), "base64EncodedStringWithOptions:", 0));
          }
          uint64_t v19 = [v12 countByEnumeratingWithState:&v46 objects:v45 count:16];
        }
        while (v19);
      }
      v43 = @"sinf";
      v44 = v18;
      uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28D90], "dataWithJSONObject:options:error:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1), 1, 0);
      goto LABEL_43;
    }
    CMMediaType MediaType = CMFormatDescriptionGetMediaType(a4);
    signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a4);
    uint64_t v25 = 0;
    if (MediaSubType <= 2053202738)
    {
      if (MediaSubType > 1902212706)
      {
        if (MediaSubType != 1902212707)
        {
          unsigned __int16 v26 = 24931;
          goto LABEL_40;
        }
      }
      else if (MediaSubType != 1667331683)
      {
        int v27 = 1700886115;
        goto LABEL_41;
      }
    }
    else if (((MediaSubType - 2053202739) > 0x3D {
            || ((1 << (MediaSubType - 51)) & 0x2020000000000001) == 0)
    }
           && MediaSubType != 2053464883)
    {
      unsigned __int16 v26 = 30307;
LABEL_40:
      int v27 = v26 | 0x7A610000;
LABEL_41:
      if (MediaSubType != v27) {
        goto LABEL_44;
      }
    }
    Float64 v28 = (void *)[MEMORY[0x1E4F28ED0] numberWithUnsignedLong:MediaSubType];
    uint64_t v29 = (void *)[MEMORY[0x1E4F28ED0] numberWithUnsignedLong:MediaType];
    *(void *)&long long v46 = @"codc";
    *((void *)&v46 + 1) = @"mtyp";
    v45[0] = v28;
    v45[1] = v29;
    *(void *)&long long v47 = @"cont";
    v45[2] = @"mpts";
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28D90], "dataWithJSONObject:options:error:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v45, &v46, 3), 1, 0);
LABEL_43:
    uint64_t v25 = v22;
LABEL_44:
    if (objc_opt_respondsToSelector())
    {
      [(AVStreamDataParserOutputHandling *)self->_parser->_delegate streamDataParser:self didProvideContentKeySpecifier:[[AVContentKeySpecifier alloc] initForKeySystem:@"FairPlayStreaming" initializationData:v25] forTrackID:self->_parser->_currentTrackID];
      goto LABEL_46;
    }
    if (objc_opt_respondsToSelector()) {
      [(AVStreamDataParserOutputHandling *)self->_parser->_delegate streamDataParserWillProvideContentKeyRequestInitializationData:self forTrackID:self->_parser->_currentTrackID];
    }
    if (!self->_parser->_contentKeySession
      && (objc_opt_respondsToSelector() & 1) != 0
      && !self->_parser->_contentKeySession)
    {
      self->_parser->_defaultContentKeySession = [[AVContentKeySession alloc] initWithKeySystem:@"FairPlayStreaming" storageDirectoryAtURL:0 internal:1];
      [(AVContentKeySession *)self->_parser->_defaultContentKeySession setDelegate:self];
      self->_parser->_contentKeySession = [[AVWeakReference alloc] initWithReferencedObject:self->_parser->_defaultContentKeySession];
    }
    id v36 = [(AVWeakReference *)self->_parser->_contentKeySession referencedObject];
    uint64_t v37 = [v36 copyCryptorForInitializationData:v25];
    v30 = (const void *)v37;
    if (!v36 || v37)
    {
      if (!v37)
      {
LABEL_78:
        self->_parser->_currentTrackID = 0;
        goto LABEL_47;
      }
    }
    else
    {
      uint64_t v38 = (void *)[v36 issueContentKeyRequestForInitializationData:v25];
      if ([(AVStreamDataParser *)self status2] > 3) {
        return -11860;
      }
      if ([v38 status] >= 5)
      {
        -[AVStreamDataParser _setError:](self, "_setError:", [v38 error]);
        return -11860;
      }
      id v39 = [(AVWeakReference *)self->_parser->_contentKeySession referencedObject];
      v45[0] = 0;
      v30 = (const void *)[v39 createCryptorIfNecessaryForInitializationData:v25 formatDescription:a4 error:v45];
      if (!v30)
      {
        [v45[0] code];
        return FigSignalErrorAt();
      }
      self->_parser->_startedUsingInternalContentKeySession = [v39 isInternal];
    }
    v40 = self->_parser;
    trackDecryptorsByTrackID = v40->_trackDecryptorsByTrackID;
    if (!trackDecryptorsByTrackID)
    {
      self->_parser->_trackDecryptorsByTrackID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v40 = self->_parser;
      trackDecryptorsByTrackID = v40->_trackDecryptorsByTrackID;
    }
    -[NSMutableDictionary setObject:forKey:](trackDecryptorsByTrackID, "setObject:forKey:", v30, [MEMORY[0x1E4F28ED0] numberWithInt:v40->_currentTrackID]);
    goto LABEL_78;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_parser->_trackDecryptorsByTrackID, "removeObjectForKey:", [MEMORY[0x1E4F28ED0] numberWithInt:a6]);
LABEL_46:
  v30 = 0;
LABEL_47:
  v31 = self->_parser;
  if (v31->_asset)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend((id)-[AVAsset formatDescriptionsForTrackID:](self->_parser->_asset, "formatDescriptionsForTrackID:", a6), "containsObject:", a4) & 1) == 0)
    {
      CMTime v32 = self->_parser->_asset;
      self->_parser->_asset = (AVAsset *)[(AVAsset *)self->_parser->_asset copyAssetWithReplacementFormatDescription:a4 forTrackID:a6];
      if (self->_parser->_delegate)
      {
        if (objc_opt_respondsToSelector()) {
          [(AVStreamDataParserOutputHandling *)self->_parser->_delegate streamDataParser:self didParseStreamDataAsAsset:self->_parser->_asset withDiscontinuity:0];
        }
      }
    }
  }
  else if (a4)
  {
    id v33 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](v31->_tracksBecomingReadyByTrackID, "objectForKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", a6)), "mutableCopy");
    id v34 = v33;
    if (v33)
    {
      [v33 setObject:a4 forKey:@"formatDescription"];
      -[NSMutableDictionary setObject:forKey:](self->_parser->_tracksBecomingReadyByTrackID, "setObject:forKey:", v34, [MEMORY[0x1E4F28ED0] numberWithInt:a6]);
    }
  }
  if (v30) {
    CFRelease(v30);
  }
  return 0;
}

- (int)_registerForFigManifoldCallbacksForTrackID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  figManifold = self->_parser->_figManifold;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = *(uint64_t (**)(OpaqueFigManifold *, uint64_t, uint64_t (**)(), AVStreamDataParser *))(v7 + 32);
  if (!v8) {
    return -12782;
  }
  return v8(figManifold, v3, kManifoldTrackCallbacks, self);
}

- (int)_unregisterForFigManifoldCallbacksForTrackID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  figManifold = self->_parser->_figManifold;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigManifold *, uint64_t, void, void))(v6 + 32);
  if (!v7) {
    return -12782;
  }
  return v7(figManifold, v3, 0, 0);
}

- (int)_figManifold:(OpaqueFigManifold *)a3 discoveredNewTrackID:(int)a4 mediaType:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  int v8 = [(AVStreamDataParser *)self _registerForFigManifoldCallbacksForTrackID:*(void *)&a4];
  if (!v8)
  {
    parser = self->_parser;
    if (parser->_asset)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        size_t v10 = self->_parser->_asset;
        self->_parser->_asset = (AVAsset *)[(AVAsset *)self->_parser->_asset copyAssetWithAdditionalTrackID:v6 mediaType:a5];
      }
    }
    else
    {
      tracksBecomingReadyByTrackID = parser->_tracksBecomingReadyByTrackID;
      if (!tracksBecomingReadyByTrackID)
      {
        self->_parser->_tracksBecomingReadyByTrackID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        tracksBecomingReadyByTrackID = self->_parser->_tracksBecomingReadyByTrackID;
      }
      if (!-[NSMutableDictionary objectForKey:](tracksBecomingReadyByTrackID, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithInt:v6]))
      {
        char v12 = self->_parser->_tracksBecomingReadyByTrackID;
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a5, @"mediaType", 0);
        -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, [MEMORY[0x1E4F28ED0] numberWithInt:v6]);
      }
    }
  }
  return v8;
}

- (BOOL)_WebVTTIsAllowed
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_parser->_allowableMIMETypes) {
    return 1;
  }
  uint64_t v3 = (void *)FigCopyWebVTTMIMETypes();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      if ([(NSArray *)self->_parser->_allowableMIMETypes containsObject:*(void *)(*((void *)&v10 + 1) + 8 * v7)])
      {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    BOOL v8 = 1;
    if (!v3) {
      return v8;
    }
  }
  else
  {
LABEL_10:
    BOOL v8 = 0;
    if (!v3) {
      return v8;
    }
  }
  CFRelease(v3);
  return v8;
}

- (BOOL)_MPEG2TSIsAllowed
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_parser->_allowableMIMETypes) {
    return 1;
  }
  uint64_t v3 = (void *)FigCopyMPEGTransportStreamMIMETypes();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      if ([(NSArray *)self->_parser->_allowableMIMETypes containsObject:*(void *)(*((void *)&v10 + 1) + 8 * v7)])
      {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    BOOL v8 = 1;
    if (!v3) {
      return v8;
    }
  }
  else
  {
LABEL_10:
    BOOL v8 = 0;
    if (!v3) {
      return v8;
    }
  }
  CFRelease(v3);
  return v8;
}

- (BOOL)_MovieFragmentStreamIsAllowed
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_parser->_allowableMIMETypes) {
    return 1;
  }
  uint64_t v3 = (void *)FigCopyQTMovieMIMETypes();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      if ([(NSArray *)self->_parser->_allowableMIMETypes containsObject:*(void *)(*((void *)&v10 + 1) + 8 * v7)])
      {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    BOOL v8 = 1;
    if (!v3) {
      return v8;
    }
  }
  else
  {
LABEL_10:
    BOOL v8 = 0;
    if (!v3) {
      return v8;
    }
  }
  CFRelease(v3);
  return v8;
}

- (BOOL)_ICYIsAllowed
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_parser->_allowableMIMETypes) {
    return 1;
  }
  CFTypeRef cf = 0;
  FigCopySetOfAudioSupportedMIMETypes();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  allowableMIMETypes = self->_parser->_allowableMIMETypes;
  uint64_t v4 = [(NSArray *)allowableMIMETypes countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(allowableMIMETypes);
        }
        if ([0 containsObject:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSArray *)allowableMIMETypes countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_12:
  if (cf) {
    CFRelease(cf);
  }
  return v8;
}

- (id)_fullListOfAllowableMIMETypes
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([(AVStreamDataParser *)self _WebVTTIsAllowed])
  {
    uint64_t v4 = FigCopyWebVTTMIMETypes();
    if (v4)
    {
      uint64_t v5 = (const void *)v4;
      [v3 addObjectsFromArray:v4];
      CFRelease(v5);
    }
  }
  if ([(AVStreamDataParser *)self _MovieFragmentStreamIsAllowed])
  {
    uint64_t v6 = FigCopyQTMovieMIMETypes();
    if (v6)
    {
      uint64_t v7 = (const void *)v6;
      [v3 addObjectsFromArray:v6];
      CFRelease(v7);
    }
  }
  if ([(AVStreamDataParser *)self _MPEG2TSIsAllowed])
  {
    uint64_t v8 = FigCopyMPEGTransportStreamMIMETypes();
    if (v8)
    {
      uint64_t v9 = (const void *)v8;
      [v3 addObjectsFromArray:v8];
      CFRelease(v9);
    }
  }
  if ([(AVStreamDataParser *)self _ICYIsAllowed]) {
    FigCopySetOfAudioSupportedMIMETypes();
  }
  return v3;
}

- (int)_createFigManifoldRemote:(OpaqueCMBlockBuffer *)a3 manifold:(OpaqueFigManifold *)a4
{
  if (![(AVStreamDataParser *)self _WebVTTIsAllowed]
    || (int result = FigManifoldCreateRemoteForWebVTT(), result == -16044))
  {
    if (![(AVStreamDataParser *)self _MPEG2TSIsAllowed]
      || (int result = FigManifoldCreateRemoteForMPEG2(), result == -16044))
    {
      if (![(AVStreamDataParser *)self _MovieFragmentStreamIsAllowed]
        || (int result = FigManifoldCreateRemoteForMovieFragmentStream(), result == -16044))
      {
        if ([(AVStreamDataParser *)self _ICYIsAllowed])
        {
          uint64_t v8 = *MEMORY[0x1E4F1CF80];
          return MEMORY[0x1F40ED658](v8, a3, _figManifoldDiscoveredNewTrackInStream, _figManifoldAllNewTracksReady, self, a4);
        }
        else
        {
          return -16044;
        }
      }
    }
  }
  return result;
}

- (int)_createFigManifold:(OpaqueCMBlockBuffer *)a3 manifold:(OpaqueFigManifold *)a4
{
  if (![(AVStreamDataParser *)self _WebVTTIsAllowed]
    || (int result = FigManifoldCreateForWebVTT(), result == -16044))
  {
    if (![(AVStreamDataParser *)self _MPEG2TSIsAllowed]
      || (int result = FigManifoldCreateForMPEG2(), result == -16044))
    {
      if (![(AVStreamDataParser *)self _MovieFragmentStreamIsAllowed]
        || (int result = FigManifoldCreateForMovieFragmentStream(), result == -16044))
      {
        if ([(AVStreamDataParser *)self _ICYIsAllowed])
        {
          uint64_t v8 = *MEMORY[0x1E4F1CF80];
          return MEMORY[0x1F40ED638](v8, a3, _figManifoldDiscoveredNewTrackInStream, _figManifoldAllNewTracksReady, self, a4);
        }
        else
        {
          return -16044;
        }
      }
    }
  }
  return result;
}

- (int)_createFigManifoldWithBlockBuffer:(OpaqueCMBlockBuffer *)a3 manifold:(OpaqueFigManifold *)a4
{
  if ([(AVStreamDataParser *)self preferSandboxedParsing]) {
    int v7 = [(AVStreamDataParser *)self _createFigManifoldRemote:a3 manifold:a4];
  }
  else {
    int v7 = [(AVStreamDataParser *)self _createFigManifold:a3 manifold:a4];
  }
  int v8 = v7;
  if (*a4) {
    self->_parser->_unint64_t typeIdOfInitialFigManifold = CFGetTypeID(*a4);
  }
  return v8;
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  uint64_t v6 = self->_parser->_sessionKeyRequest;
  self->_parser->_sessionKeyRequest = (AVContentKeyRequest *)a4;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_parser->_delegate;
    uint64_t v8 = [a4 initializationData];
    uint64_t currentTrackID = self->_parser->_currentTrackID;
    [(AVStreamDataParserOutputHandling *)delegate streamDataParser:self didProvideContentKeyRequestInitializationData:v8 forTrackID:currentTrackID];
  }
}

- (void)contentKeySessionContentProtectionSessionIdentifierDidChange:(id)a3
{
  uint64_t v4 = [a3 contentProtectionSessionIdentifier];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [(AVWeakReference *)self->_parser->_legacyStreamSession referencedObject];
    [v6 setFigCPEProtectorSessionIdentifier:v5];
  }
}

- (NSData)contentProtectionSessionIdentifier
{
  id v2 = [(AVWeakReference *)self->_parser->_contentKeySession referencedObject];
  return (NSData *)[v2 contentProtectionSessionIdentifier];
}

- (void)processContentKeyResponseData:(id)a3 forTrackID:(int)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  parser = self->_parser;
  sessionKeyRequest = parser->_sessionKeyRequest;
  if (!sessionKeyRequest)
  {
    legacyStreamSession = parser->_legacyStreamSession;
    if (legacyStreamSession
      && (long long v15 = 0u,
          long long v16 = 0u,
          long long v17 = 0u,
          long long v18 = 0u,
          uint64_t v9 = objc_msgSend(-[AVWeakReference referencedObject](legacyStreamSession, "referencedObject", a3, *(void *)&a4), "streamDataParsers", 0), (v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16)) != 0))
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(AVStreamDataParser **)(*((void *)&v15 + 1) + 8 * v13);
        if (v14 != self)
        {
          sessionKeyRequest = v14->_parser->_sessionKeyRequest;
          if (sessionKeyRequest) {
            break;
          }
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
          sessionKeyRequest = 0;
          if (v11) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    else
    {
      sessionKeyRequest = 0;
    }
  }
  [(AVContentKeyRequest *)sessionKeyRequest processContentKeyResponse:+[AVContentKeyResponse contentKeyResponseWithFairPlayStreamingKeyResponseData:](AVContentKeyResponse, "contentKeyResponseWithFairPlayStreamingKeyResponseData:", a3, *(void *)&a4)];
}

- (void)processContentKeyResponseError:(id)a3 forTrackID:(int)a4
{
  uint64_t v4 = (uint64_t)a3;
  v7[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v6 = @"AVErrorPersistentTrackIDKey";
    v7[0] = [MEMORY[0x1E4F28ED0] numberWithInt:*(void *)&a4];
    uint64_t v4 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1]);
  }
  -[AVStreamDataParser _setError:](self, "_setError:", v4, *(void *)&a4);
  [(AVContentKeyRequest *)self->_parser->_sessionKeyRequest processContentKeyResponseError:v4];
}

- (void)renewExpiringContentKeyResponseDataForTrackID:(int)a3
{
}

- (id)streamingContentKeyRequestDataForApp:(id)a3 contentIdentifier:(id)a4 trackID:(int)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  objc_msgSend(-[AVWeakReference referencedObject](self->_parser->_legacyStreamSession, "referencedObject"), "setAppIdentifier:", a3);
  id v13 = (id)[a6 mutableCopy];
  uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_parser->_trackFormatDescriptionsByTrackID, "objectForKeyedSubscript:", [MEMORY[0x1E4F28ED0] numberWithInt:v9]);
  if (v14) {
    [v13 setObject:v14 forKeyedSubscript:0x1EE5A92F8];
  }
  sessionKeyRequest = self->_parser->_sessionKeyRequest;
  return [(AVContentKeyRequest *)sessionKeyRequest contentKeyRequestDataForApp:a3 contentIdentifier:a4 options:v13 error:a7];
}

- (BOOL)hasProtector
{
  id v2 = [(AVWeakReference *)self->_parser->_contentKeySession referencedObject];
  return [v2 hasProtector];
}

- (void)expire
{
  [(AVStreamDataParser *)self setStatus:5];
  id v3 = [(AVWeakReference *)self->_parser->_contentKeySession referencedObject];
  [v3 expire];
}

- (void)setSession:(id)a3
{
  if (a3)
  {
    [a3 referencedObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    parser = self->_parser;
    p_parser = &self->_parser;
    uint64_t v5 = parser;
    if (parser->_legacyStreamSession)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      long long v16 = @"AVStreamDataParser can't attach to an AVContentKeySession when it's already attached to an AVStreamSession";
    }
    else
    {
      if (!v5->_startedUsingInternalContentKeySession)
      {
        uint64_t v8 = v5->_contentKeySession;
        uint64_t v9 = (AVWeakReference *)a3;
        uint64_t v10 = p_parser;
LABEL_10:
        (*v10)->_contentKeySession = v9;
        return;
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      long long v16 = @"AVStreamDataParser can't attach to an AVContentKeySession after it started using its own AVContentKeySession for key loading";
    }
    objc_exception_throw((id)[v14 exceptionWithName:v15 reason:v16 userInfo:0]);
  }
  uint64_t v10 = &self->_parser;
  uint64_t v11 = self->_parser;
  if (v11->_legacyStreamSession)
  {
    [(AVStreamDataParser *)self setStatus:5];
    uint64_t v12 = self->_parser->_legacyStreamSession;
    self->_parser->_legacyStreamSession = 0;
    uint64_t v11 = self->_parser;
  }
  if (v11->_contentKeySession)
  {
    [(AVStreamDataParser *)self setStatus:5];
    id v13 = self->_parser->_contentKeySession;
    uint64_t v9 = 0;
    goto LABEL_10;
  }
}

- (id)contentKeySession
{
  return [(AVWeakReference *)self->_parser->_contentKeySession referencedObject];
}

- (BOOL)_attachedToExternalContentKeySession
{
  id v3 = [(AVWeakReference *)self->_parser->_contentKeySession referencedObject];
  if (v3) {
    int v4 = [v3 isInternal] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }
  if (self->_parser->_legacyStreamSession) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)mayRequireContentKeysForMediaDataProcessing
{
  return 1;
}

- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5
{
  int v7 = (AVWeakReference *)[a3 _weakReference];
  if (self->_parser->_contentKeySession == v7)
  {
    if (a5) {
      *a5 = 0;
    }
  }
  else
  {
    [(AVStreamDataParser *)self setSession:v7];
  }
  return 0;
}

- (void)setPreferSandboxedParsing:(BOOL)a3
{
  threadSafetyQ = self->_parser->_threadSafetyQ;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__AVStreamDataParser_AVStreamDataParserSandboxedParsing__setPreferSandboxedParsing___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(threadSafetyQ, v4);
}

uint64_t __84__AVStreamDataParser_AVStreamDataParserSandboxedParsing__setPreferSandboxedParsing___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 200) != v2 && *(void *)(v1 + 64)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"must only set preferSandboxedParsing before any stream data is appended" userInfo:0]);
  }
  *(unsigned char *)(v1 + 200) = v2;
  return result;
}

- (BOOL)preferSandboxedParsing
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  threadSafetyQ = self->_parser->_threadSafetyQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__AVStreamDataParser_AVStreamDataParserSandboxedParsing__preferSandboxedParsing__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafetyQ, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __80__AVStreamDataParser_AVStreamDataParserSandboxedParsing__preferSandboxedParsing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 200);
  return result;
}

- (BOOL)isDefunct
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  threadSafetyQ = self->_parser->_threadSafetyQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AVStreamDataParser_AVIntegrityChecking__isDefunct__block_invoke;
  v5[3] = &unk_1E57B2160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafetyQ, v5);
  BOOL v3 = *((unsigned char *)v7 + 24) == 1;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AVStreamDataParser_AVIntegrityChecking__isDefunct__block_invoke(uint64_t a1)
{
  int v2 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112) referencedObject];
  if (!v2
    || (uint64_t result = [v2 isDefunct],
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result) == 0))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void *)(v4 + 64);
    if (!v5)
    {
LABEL_14:
      uint64_t result = *(void *)(v4 + 40);
      if (result)
      {
        uint64_t result = [(id)result isDefunct];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
      }
      return result;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    int v7 = *(void **)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    if (*v8 >= 5uLL && (char v9 = (uint64_t (*)(uint64_t, uint64_t))v8[11]) != 0) {
      uint64_t result = v9(v5, v6 + 24);
    }
    else {
      uint64_t result = 4294954514;
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(unsigned char *)(v10 + 24))
    {
      if (result)
      {
        *(unsigned char *)(v10 + 24) = 1;
        return result;
      }
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
      goto LABEL_14;
    }
  }
  return result;
}

@end