@interface JFXAVMediaMetaDataReader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTimeOfCurrentData;
- (AVAssetReaderOutputMetadataAdaptor)assetReaderOutputMetadataAdaptor;
- (AVMetadataItem)currentMetadataItem;
- (AVMetadataItem)nextMetadataItem;
- (BOOL)hasRemainingAvailableData;
- (BOOL)readAheadToTime:(id *)a3;
- (id)createAssetReaderTrackOutput;
- (id)metadataForTime:(id *)a3;
- (void)JFX_preloadData;
- (void)cancelReadingForReaderReset;
- (void)didUpdateReadingRange;
- (void)readAndDiscardRemainingAvailableData;
- (void)setAssetReaderOutputMetadataAdaptor:(id)a3;
- (void)setCurrentMetadataItem:(id)a3;
- (void)setNextMetadataItem:(id)a3;
@end

@implementation JFXAVMediaMetaDataReader

- (id)createAssetReaderTrackOutput
{
  v6.receiver = self;
  v6.super_class = (Class)JFXAVMediaMetaDataReader;
  v3 = [(JFXAVMediaDataReader *)&v6 createAssetReaderTrackOutput];
  v4 = [MEMORY[0x263EFA4D0] assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:v3];
  [(JFXAVMediaMetaDataReader *)self setAssetReaderOutputMetadataAdaptor:v4];

  return v3;
}

- (void)cancelReadingForReaderReset
{
  [(JFXAVMediaMetaDataReader *)self setAssetReaderOutputMetadataAdaptor:0];
  v3.receiver = self;
  v3.super_class = (Class)JFXAVMediaMetaDataReader;
  [(JFXAVMediaDataReader *)&v3 cancelReadingForReaderReset];
}

- (void)didUpdateReadingRange
{
  [(JFXAVMediaMetaDataReader *)self setCurrentMetadataItem:0];
  [(JFXAVMediaMetaDataReader *)self setNextMetadataItem:0];
  [(JFXAVMediaMetaDataReader *)self JFX_preloadData];
}

- (BOOL)readAheadToTime:(id *)a3
{
  uint64_t v5 = [(JFXAVMediaMetaDataReader *)self nextMetadataItem];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    do
    {
      v7 = [(JFXAVMediaMetaDataReader *)self nextMetadataItem];
      v8 = v7;
      if (v7) {
        [v7 time];
      }
      else {
        memset(&time2, 0, sizeof(time2));
      }
      $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a3;
      int32_t v9 = CMTimeCompare((CMTime *)&v22, &time2);

      if (v9 < 0) {
        break;
      }
      v10 = (void *)MEMORY[0x237DD1350]();
      v11 = [(JFXAVMediaMetaDataReader *)self nextMetadataItem];
      [(JFXAVMediaMetaDataReader *)self setCurrentMetadataItem:v11];

      v12 = [(AVAssetReaderOutputMetadataAdaptor *)self->_assetReaderOutputMetadataAdaptor nextTimedMetadataGroup];
      v13 = v12;
      if (v12)
      {
        v14 = [v12 items];
        v15 = [v14 firstObject];
        [(JFXAVMediaMetaDataReader *)self setNextMetadataItem:v15];
      }
      else
      {
        [(JFXAVMediaMetaDataReader *)self setNextMetadataItem:0];
      }

      objc_super v6 = [(JFXAVMediaMetaDataReader *)self nextMetadataItem];
    }
    while (v6);
  }
  v16 = [(JFXAVMediaDataReader *)self assetReader];
  uint64_t v17 = [v16 status];

  if (v17 == 3)
  {
    v19 = [(JFXAVMediaDataReader *)self assetReader];
    v20 = [v19 error];
    [(JFXAVMediaDataReader *)self didFailWithError:v20];

    goto LABEL_15;
  }
  v18 = [(JFXAVMediaMetaDataReader *)self nextMetadataItem];

  if (v18)
  {
    v19 = [(JFXAVMediaMetaDataReader *)self nextMetadataItem];
    [v19 loadValuesAsynchronouslyForKeys:&unk_26E802058 completionHandler:0];
LABEL_15:
  }
  return v17 != 3;
}

- (void)readAndDiscardRemainingAvailableData
{
  objc_super v3 = [(JFXAVMediaMetaDataReader *)self nextMetadataItem];

  if (v3)
  {
    do
    {
      v4 = (void *)MEMORY[0x237DD1350]();
      uint64_t v5 = [(AVAssetReaderOutputMetadataAdaptor *)self->_assetReaderOutputMetadataAdaptor nextTimedMetadataGroup];
      objc_super v6 = v5;
      if (v5)
      {
        v7 = [v5 items];
        v8 = [v7 firstObject];
        [(JFXAVMediaMetaDataReader *)self setNextMetadataItem:v8];
      }
      else
      {
        [(JFXAVMediaMetaDataReader *)self setNextMetadataItem:0];
      }

      int32_t v9 = [(JFXAVMediaMetaDataReader *)self nextMetadataItem];
    }
    while (v9);
  }
  v10 = [(JFXAVMediaDataReader *)self assetReader];
  uint64_t v11 = [v10 status];

  if (v11 == 3)
  {
    id v13 = [(JFXAVMediaDataReader *)self assetReader];
    v12 = [v13 error];
    [(JFXAVMediaDataReader *)self didFailWithError:v12];
  }
}

- (BOOL)hasRemainingAvailableData
{
  v2 = [(JFXAVMediaMetaDataReader *)self nextMetadataItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTimeOfCurrentData
{
  uint64_t v5 = [(JFXAVMediaMetaDataReader *)self currentMetadataItem];

  if (v5)
  {
    v7 = [(JFXAVMediaMetaDataReader *)self currentMetadataItem];
    if (v7)
    {
      int32_t v9 = v7;
      [v7 time];
      v7 = v9;
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F010E0];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x263F010E0];
    retstr->var3 = *(void *)(v8 + 16);
  }
  return result;
}

- (id)metadataForTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  if ([(JFXAVMediaDataReader *)self seekToTime:&v6])
  {
    v4 = [(JFXAVMediaMetaDataReader *)self currentMetadataItem];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)JFX_preloadData
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  BOOL v3 = [(JFXAVMediaDataReader *)self assetReader];
  uint64_t v4 = [v3 status];

  if (v4 == 1)
  {
    uint64_t v5 = [(JFXAVMediaMetaDataReader *)self assetReaderOutputMetadataAdaptor];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [v5 nextTimedMetadataGroup];

    v7 = [v6 items];
    uint64_t v8 = [v7 firstObject];
    [(JFXAVMediaMetaDataReader *)self setCurrentMetadataItem:v8];
  }
  int32_t v9 = [(JFXAVMediaMetaDataReader *)self currentMetadataItem];

  if (!v9)
  {
    v10 = JFXLog_DebugMediaDataReader();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [(JFXAVMediaDataReader *)self currentReadingRange];
      CMTime time = v23;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138412546;
      v26 = self;
      __int16 v27 = 2048;
      Float64 v28 = Seconds;
      _os_log_debug_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEBUG, "%@ could not preload metadata from time %f", buf, 0x16u);
    }
  }
  uint64_t v11 = [(JFXAVMediaDataReader *)self assetReader];
  uint64_t v12 = [v11 status];

  if (v12 == 1)
  {
    id v13 = [(JFXAVMediaMetaDataReader *)self assetReaderOutputMetadataAdaptor];
    v14 = [v13 nextTimedMetadataGroup];

    v15 = [v14 items];
    v16 = [v15 firstObject];
    [(JFXAVMediaMetaDataReader *)self setNextMetadataItem:v16];

    uint64_t v17 = [(JFXAVMediaMetaDataReader *)self nextMetadataItem];
    [v17 time];
  }
  v18 = [(JFXAVMediaDataReader *)self assetReader];
  uint64_t v19 = [v18 status];

  if (v19 == 3)
  {
    v20 = [(JFXAVMediaDataReader *)self assetReader];
    v21 = [v20 error];
    [(JFXAVMediaDataReader *)self didFailWithError:v21];
  }
}

- (AVAssetReaderOutputMetadataAdaptor)assetReaderOutputMetadataAdaptor
{
  return self->_assetReaderOutputMetadataAdaptor;
}

- (void)setAssetReaderOutputMetadataAdaptor:(id)a3
{
}

- (AVMetadataItem)currentMetadataItem
{
  return self->_currentMetadataItem;
}

- (void)setCurrentMetadataItem:(id)a3
{
}

- (AVMetadataItem)nextMetadataItem
{
  return self->_nextMetadataItem;
}

- (void)setNextMetadataItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextMetadataItem, 0);
  objc_storeStrong((id *)&self->_currentMetadataItem, 0);
  objc_storeStrong((id *)&self->_assetReaderOutputMetadataAdaptor, 0);
}

@end