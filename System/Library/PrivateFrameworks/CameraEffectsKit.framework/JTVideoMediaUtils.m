@interface JTVideoMediaUtils
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedPreciseAssetDuration;
- (BOOL)cacheWillDieDuringLoad;
- (BOOL)cachedAssetInformationValid;
- (BOOL)hasAudibleCharacteristicWithIsMissing:(BOOL)a3;
- (BOOL)hasAudioTracks;
- (BOOL)hasVideoTracks;
- (BOOL)isOriginalHEVC4k;
- (BOOL)isProRes;
- (CGAffineTransform)cachedTransform;
- (CGAffineTransform)transform;
- (CGSize)cachedNaturalSize;
- (CGSize)naturalSizeWithIsMissing:(BOOL)a3 asset:(id)a4;
- (PVColorSpace)cachedColorSpace;
- (float)cachedFrameRate;
- (float)frameRate;
- (id)colorSpace;
- (int)cachedDurationAt30fps;
- (int)durationAt30fpsWithAssetDuration:(double)a3;
- (unint64_t)cachedAudioTrackCount;
- (unint64_t)cachedVideoTrackCount;
- (unsigned)cachedCodec4cc;
- (void)cacheTrackInformationWithAVAsset:(id)a3;
- (void)invalidateCachedAssetInformation;
- (void)requestAVAssetAsyncWithAsset:(id)a3 needsDerivativeMedia:(BOOL)a4 frameRate:(float)a5 completion:(id)a6;
- (void)setCacheWillDieDuringLoad:(BOOL)a3;
- (void)setCachedAssetInformationValid:(BOOL)a3;
- (void)setCachedAudioTrackCount:(unint64_t)a3;
- (void)setCachedCodec4cc:(unsigned int)a3;
- (void)setCachedColorSpace:(id)a3;
- (void)setCachedDurationAt30fps:(int)a3;
- (void)setCachedFrameRate:(float)a3;
- (void)setCachedNaturalSize:(CGSize)a3;
- (void)setCachedPreciseAssetDuration:(id *)a3;
- (void)setCachedTransform:(CGAffineTransform *)a3;
- (void)setCachedVideoTrackCount:(unint64_t)a3;
@end

@implementation JTVideoMediaUtils

- (void)cacheTrackInformationWithAVAsset:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && ![(JTVideoMediaUtils *)self cachedAssetInformationValid])
  {
    v5 = [v4 tracks];
    if ([v5 count])
    {
      [v4 duration];

      if (v28 >= 1)
      {
        [(JTVideoMediaUtils *)self setCachedAssetInformationValid:1];
        [(JTVideoMediaUtils *)self setCachedVideoTrackCount:0];
        -[JTVideoMediaUtils setCachedNaturalSize:](self, "setCachedNaturalSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
        [(JTVideoMediaUtils *)self setCachedFrameRate:0.0];
        long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        v27[0] = *MEMORY[0x263F000D0];
        v27[1] = v6;
        v27[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        [(JTVideoMediaUtils *)self setCachedTransform:v27];
        v7 = JFXLog_DebugDataModel();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 134218242;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v4;
          LOWORD(buf.flags) = 2112;
          *(void *)((char *)&buf.flags + 2) = v4;
          _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "Movie (Video): tracksWithMediaCharacteristic assetToInsert=%p %@", (uint8_t *)&buf, 0x16u);
        }

        objc_initWeak(&location, self);
        dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke;
        v23[3] = &unk_264C0A758;
        objc_copyWeak(&v25, &location);
        uint64_t v9 = *MEMORY[0x263EF9CE0];
        v10 = v8;
        v24 = v10;
        [v4 loadTracksWithMediaCharacteristic:v9 completionHandler:v23];
        dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
        [v4 duration];
        long long v19 = v21;
        uint64_t v20 = v22;
        [(JTVideoMediaUtils *)self setCachedPreciseAssetDuration:&v19];
        [(JTVideoMediaUtils *)self cachedPreciseAssetDuration];
        CMTimeConvertScale(&buf, &time, 30, kCMTimeRoundingMethod_QuickTime);
        [(JTVideoMediaUtils *)self setCachedDurationAt30fps:LODWORD(buf.value)];
        [(JTVideoMediaUtils *)self setCachedAudioTrackCount:0];
        dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke_2;
        v14[3] = &unk_264C0A780;
        objc_copyWeak(&v17, &location);
        uint64_t v12 = *MEMORY[0x263EF9C80];
        id v15 = v4;
        v13 = v11;
        v16 = v13;
        [v15 loadTracksWithMediaCharacteristic:v12 completionHandler:v14];
        dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&v25);

        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
  }
}

void __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (v10 && [*(id *)(*((void *)&v30 + 1) + 8 * i) isEnabled])
        {
          objc_msgSend(WeakRetained, "setCachedVideoTrackCount:", objc_msgSend(WeakRetained, "cachedVideoTrackCount") + 1);
          [v10 naturalSize];
          objc_msgSend(WeakRetained, "setCachedNaturalSize:");
          [v10 nominalFrameRate];
          objc_msgSend(WeakRetained, "setCachedFrameRate:");
          [v10 preferredTransform];
          v26[0] = *(_OWORD *)&v29[0].value;
          v26[1] = *(_OWORD *)&v29[0].epoch;
          uint64_t v27 = 0;
          uint64_t v28 = 0;
          [WeakRetained setCachedTransform:v26];
          memset(v29, 0, 24);
          [v10 timeRange];
          CMTime lhs = v24;
          [v10 timeRange];
          CMTime rhs = v22;
          CMTimeAdd(v29, &lhs, &rhs);
          if (WeakRetained) {
            [WeakRetained cachedPreciseAssetDuration];
          }
          else {
            memset(&time2, 0, sizeof(time2));
          }
          CMTime time1 = v29[0];
          if (CMTimeCompare(&time1, &time2) < 0)
          {
            CMTime v19 = v29[0];
            [WeakRetained setCachedPreciseAssetDuration:&v19];
          }
          dispatch_semaphore_t v11 = [v10 formatDescriptions];
          uint64_t v12 = v11;
          if (v11 && [v11 count])
          {
            v13 = (const opaqueCMFormatDescription *)[v12 objectAtIndex:0];
            [WeakRetained setCachedCodec4cc:CMFormatDescriptionGetMediaSubType(v13)];
            CFPropertyListRef Extension = CMFormatDescriptionGetExtension(v13, (CFStringRef)*MEMORY[0x263F03ED8]);
            CFPropertyListRef v15 = CMFormatDescriptionGetExtension(v13, (CFStringRef)*MEMORY[0x263F03FC0]);
            CFPropertyListRef v16 = CMFormatDescriptionGetExtension(v13, (CFStringRef)*MEMORY[0x263F04020]);
            if (Extension && v15)
            {
              uint64_t v17 = objc_msgSend(MEMORY[0x263F61230], "jfx_getColorSpaceFromColorPrimaries:transferFunction:matrix:", Extension, v15, v16);
            }
            else
            {
              uint64_t v17 = [MEMORY[0x263F61230] rec709GammaColorSpace];
            }
            v18 = (void *)v17;
            [WeakRetained setCachedColorSpace:v17];
          }
          goto LABEL_24;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_24:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    objc_msgSend(WeakRetained, "setCachedAudioTrackCount:", objc_msgSend(v3, "count"));
    if ([WeakRetained cachedAudioTrackCount])
    {
      if (![WeakRetained cachedVideoTrackCount])
      {
        if (WeakRetained) {
          [WeakRetained cachedPreciseAssetDuration];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        if (CMTimeGetSeconds(&time) > 2700.0)
        {
          id v5 = [v3 objectAtIndex:0];
          uint64_t v6 = v5;
          if (v5)
          {
            uint64_t v7 = [v5 formatDescriptions];
            if ([v7 count])
            {
              uint64_t v8 = (const opaqueCMFormatDescription *)[v7 objectAtIndex:0];
              if (v8)
              {
                [WeakRetained setCacheWillDieDuringLoad:CMAudioFormatDescriptionGetStreamBasicDescription(v8)->mFormatID == 778924083];
                if ([WeakRetained cacheWillDieDuringLoad])
                {
                  uint64_t v9 = JFXLog_model();
                  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
                    __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke_2_cold_1(a1, v9);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)requestAVAssetAsyncWithAsset:(id)a3 needsDerivativeMedia:(BOOL)a4 frameRate:(float)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  if (a5 <= 105.0) {
    unint64_t v11 = ((unint64_t)[v9 mediaSubtypes] >> 17) & 1;
  }
  else {
    unint64_t v11 = 1;
  }
  id v12 = objc_alloc_init(MEMORY[0x263F14F68]);
  [v12 setVersion:v11];
  [v12 setNetworkAccessAllowed:0];
  [v12 setStreamingAllowed:0];
  if (v8) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [v12 setDeliveryMode:v13];
  v14 = [MEMORY[0x263F14E38] defaultManager];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __92__JTVideoMediaUtils_requestAVAssetAsyncWithAsset_needsDerivativeMedia_frameRate_completion___block_invoke;
  v18[3] = &unk_264C0A7D0;
  BOOL v22 = v8;
  id v19 = v9;
  id v20 = v12;
  id v21 = v10;
  id v15 = v10;
  id v16 = v12;
  id v17 = v9;
  [v14 requestAVAssetForVideo:v17 options:v16 resultHandler:v18];
}

void __92__JTVideoMediaUtils_requestAVAssetAsyncWithAsset_needsDerivativeMedia_frameRate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[CFXVideoSettings canDecodeHEVC2160P];
  if (v3 || *(unsigned char *)(a1 + 56)) {
    goto LABEL_3;
  }
  char v5 = v4;
  if ((unint64_t)[*(id *)(a1 + 32) pixelHeight] <= 0x86F)
  {
    if ((unint64_t)[*(id *)(a1 + 32) pixelWidth] < 0x870) {
      char v6 = 1;
    }
    else {
      char v6 = v5;
    }
    if (v6) {
      goto LABEL_3;
    }
LABEL_12:
    [*(id *)(a1 + 40) setDeliveryMode:2];
    uint64_t v7 = [MEMORY[0x263F14E38] defaultManager];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __92__JTVideoMediaUtils_requestAVAssetAsyncWithAsset_needsDerivativeMedia_frameRate_completion___block_invoke_2;
    v10[3] = &unk_264C0A7A8;
    id v11 = *(id *)(a1 + 48);
    [v7 requestAVAssetForVideo:v8 options:v9 resultHandler:v10];

    goto LABEL_4;
  }
  if ((v5 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_3:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_4:
}

uint64_t __92__JTVideoMediaUtils_requestAVAssetAsyncWithAsset_needsDerivativeMedia_frameRate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (float)frameRate
{
  if (![(JTVideoMediaUtils *)self cachedAssetInformationValid]) {
    return (float)+[JFXMediaSettings frameRate];
  }
  [(JTVideoMediaUtils *)self cachedFrameRate];
  return result;
}

- (int)durationAt30fpsWithAssetDuration:(double)a3
{
  if ([(JTVideoMediaUtils *)self cachedAssetInformationValid])
  {
    return [(JTVideoMediaUtils *)self cachedDurationAt30fps];
  }
  else
  {
    char v6 = JFXLog_model();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[JTVideoMediaUtils durationAt30fpsWithAssetDuration:](v6);
    }

    CMTimeMakeWithSeconds(&v7, a3, 30);
    return v7.value;
  }
}

- (BOOL)isOriginalHEVC4k
{
  BOOL result = 0;
  if ([(JTVideoMediaUtils *)self cachedCodec4cc] == 1752589105)
  {
    [(JTVideoMediaUtils *)self cachedNaturalSize];
    if (v3 >= 2160.0) {
      return 1;
    }
  }
  return result;
}

- (BOOL)isProRes
{
  unsigned int v2 = [(JTVideoMediaUtils *)self cachedCodec4cc];
  return v2 - 1634755432 <= 0xB && ((1 << (v2 - 104)) & 0x8C1) != 0 || v2 == 1634743416 || v2 == 1634743400;
}

- (BOOL)hasAudibleCharacteristicWithIsMissing:(BOOL)a3
{
  unint64_t v4 = [(JTVideoMediaUtils *)self cachedAudioTrackCount];
  if (v4) {
    LOBYTE(v4) = ![(JTVideoMediaUtils *)self isUnsupportedAudio];
  }
  return v4;
}

- (CGSize)naturalSizeWithIsMissing:(BOOL)a3 asset:(id)a4
{
  id v6 = a4;
  if ([(JTVideoMediaUtils *)self cachedAssetInformationValid])
  {
    [(JTVideoMediaUtils *)self cachedNaturalSize];
    double v8 = v7;
    double v10 = v9;
  }
  else if (v6)
  {
    double v8 = (double)(unint64_t)[v6 pixelWidth];
    double v10 = (double)(unint64_t)[v6 pixelHeight];
  }
  else
  {
    double v10 = 1080.0;
    if (!a3)
    {
      id v11 = JFXLog_model();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[JTVideoMediaUtils naturalSizeWithIsMissing:asset:](v11);
      }
    }
    double v8 = 1920.0;
  }

  double v12 = v8;
  double v13 = v10;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGAffineTransform)transform
{
  CGSize result = (CGAffineTransform *)[(JTVideoMediaUtils *)self cachedAssetInformationValid];
  if (result)
  {
    return [(JTVideoMediaUtils *)self cachedTransform];
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F000D0];
    long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  }
  return result;
}

- (id)colorSpace
{
  if ([(JTVideoMediaUtils *)self cachedAssetInformationValid])
  {
    double v3 = [(JTVideoMediaUtils *)self cachedColorSpace];
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (BOOL)hasVideoTracks
{
  return ![(JTVideoMediaUtils *)self cachedAssetInformationValid]
      || [(JTVideoMediaUtils *)self cachedVideoTrackCount] != 0;
}

- (BOOL)hasAudioTracks
{
  return [(JTVideoMediaUtils *)self cachedAudioTrackCount] != 0;
}

- (void)invalidateCachedAssetInformation
{
}

- (BOOL)cachedAssetInformationValid
{
  return self->_cachedAssetInformationValid;
}

- (void)setCachedAssetInformationValid:(BOOL)a3
{
  self->_cachedAssetInformationValid = a3;
}

- (CGSize)cachedNaturalSize
{
  double width = self->_cachedNaturalSize.width;
  double height = self->_cachedNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedNaturalSize:(CGSize)a3
{
  self->_cachedNaturalSize = a3;
}

- (float)cachedFrameRate
{
  return self->_cachedFrameRate;
}

- (void)setCachedFrameRate:(float)a3
{
  self->_cachedFrameRate = a3;
}

- (CGAffineTransform)cachedTransform
{
  long long v3 = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].d;
  return self;
}

- (void)setCachedTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_cachedTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_cachedTransform.c = v4;
  *(_OWORD *)&self->_cachedTransform.a = v3;
}

- (unsigned)cachedCodec4cc
{
  return self->_cachedCodec4cc;
}

- (void)setCachedCodec4cc:(unsigned int)a3
{
  self->_cachedCodec4cc = a3;
}

- (PVColorSpace)cachedColorSpace
{
  return self->_cachedColorSpace;
}

- (void)setCachedColorSpace:(id)a3
{
}

- (int)cachedDurationAt30fps
{
  return self->_cachedDurationAt30fps;
}

- (void)setCachedDurationAt30fps:(int)a3
{
  self->_cachedDurationAt30fps = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedPreciseAssetDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setCachedPreciseAssetDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_cachedPreciseAssetDuration.epoch = a3->var3;
  *(_OWORD *)&self->_cachedPreciseAssetDuration.value = v3;
}

- (unint64_t)cachedVideoTrackCount
{
  return self->_cachedVideoTrackCount;
}

- (void)setCachedVideoTrackCount:(unint64_t)a3
{
  self->_cachedVideoTrackCount = a3;
}

- (unint64_t)cachedAudioTrackCount
{
  return self->_cachedAudioTrackCount;
}

- (void)setCachedAudioTrackCount:(unint64_t)a3
{
  self->_cachedAudioTrackCount = a3;
}

- (BOOL)cacheWillDieDuringLoad
{
  return self->_cacheWillDieDuringLoad;
}

- (void)setCacheWillDieDuringLoad:(BOOL)a3
{
  self->_cacheWillDieDuringLoad = a3;
}

- (void).cxx_destruct
{
}

void __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "disable too long mp3 audio file: %@", (uint8_t *)&v3, 0xCu);
}

- (void)durationAt30fpsWithAssetDuration:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "durationAt30fps called before witout valid cached duration -> fix me please", v1, 2u);
}

- (void)naturalSizeWithIsMissing:(os_log_t)log asset:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "no natural size for Video...", v1, 2u);
}

@end