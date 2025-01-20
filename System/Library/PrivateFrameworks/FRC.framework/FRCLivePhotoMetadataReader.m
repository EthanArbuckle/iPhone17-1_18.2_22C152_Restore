@interface FRCLivePhotoMetadataReader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)burstDropTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageTime;
- (BOOL)printMetadata;
- (BOOL)processLivePhotoMetadataItem:(id)a3 isIDR:(BOOL)a4 recipeAvailable:(BOOL)a5;
- (BOOL)stillImageTransformAvailble;
- (BOOL)stillImageTransformReferenceDimensionsAvailable;
- (BOOL)verbose;
- (FRCLivePhotoMetadataReader)init;
- (id)createMetadataAdaptorForAsset:(id)a3;
- (id)createMetadataEntryForV3Metadata:(id *)a3 frameIndex:(unint64_t)a4 time:(id *)a5 isIDR:(BOOL)a6 noRecipeGap:(BOOL)a7;
- (int64_t)ptsMismatches;
- (unint64_t)numberOfDroppedFrames;
- (unint64_t)numberOfInterpolatedFrames;
- (unint64_t)numberOfMetadataFrames;
- (unint64_t)preParseMetadata;
- (void)parseStillImageMetadata:(id)a3;
- (void)printMetadata:(id)a3 withVideoFrame:(id)a4;
- (void)printMetadataListWithVideoTimingInfo:(id)a3;
- (void)readLivePhotoMetadataFromAsset:(id)a3;
- (void)setPrintMetadata:(BOOL)a3;
- (void)setVerbose:(BOOL)a3;
@end

@implementation FRCLivePhotoMetadataReader

- (FRCLivePhotoMetadataReader)init
{
  v3.receiver = self;
  v3.super_class = (Class)FRCLivePhotoMetadataReader;
  result = [(FRCLivePhotoMetadataReader *)&v3 init];
  result->_printMetadata = 1;
  return result;
}

- (unint64_t)preParseMetadata
{
  memset(&v18, 0, sizeof(v18));
  CMTimeMakeWithSeconds(&v18, 1.0, 600);
  self->_totalFrames = 0;
  objc_super v3 = ($95D729B680665BEAEFA1D6FCA8238556 *)MEMORY[0x1E4F1F9F8];
  self->_numberOfInterpolatedFrames = 0;
  self->_burstDropTime = *v3;
  uint64_t v4 = [(AVAssetReaderOutputMetadataAdaptor *)self->_metadataOutputAdaptor nextTimedMetadataGroup];
  if (v4)
  {
    v5 = (void *)v4;
    unint64_t v6 = 0;
    while (1)
    {
      v7 = [v5 items];
      v8 = [v7 firstObject];

      if (v8) {
        [v8 duration];
      }
      else {
        memset(&time2, 0, sizeof(time2));
      }
      CMTime v15 = v18;
      CMTimeMinimum(&v17, &v15, &time2);
      CMTime v18 = v17;
      v17.value = 0;
      objc_msgSend(v8, "value", 0);
      CFDataRef v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      deserializeLivePhotoMetadata(v9, &v17, &v15);

      if (!v17.value) {
        break;
      }
      FigLivePhotoMetadataV3 = (unsigned __int16 *)getFigLivePhotoMetadataV3(v17.value);
      if (!FigLivePhotoMetadataV3) {
        break;
      }
      unint64_t v11 = *FigLivePhotoMetadataV3;
      if ((v11 & 0x20) != 0) {
        self->_numberOfInterpolatedFrames += *((unsigned __int8 *)FigLivePhotoMetadataV3 + 58);
      }
      v6 += (v11 >> 3) & 1;
      free((void *)v17.value);
      ++self->_totalFrames;

      uint64_t v12 = [(AVAssetReaderOutputMetadataAdaptor *)self->_metadataOutputAdaptor nextTimedMetadataGroup];

      v5 = (void *)v12;
      if (!v12) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
LABEL_14:
  CMTime v15 = v18;
  CMTimeMultiplyByRatio(&v17, &v15, 19, 10);
  *(_OWORD *)&self->_droppingThreshold.value = *(_OWORD *)&v17.value;
  CMTimeEpoch epoch = v17.epoch;
  self->_droppingThreshold.CMTimeEpoch epoch = v17.epoch;
  *(_OWORD *)&v15.value = *(_OWORD *)&self->_droppingThreshold.value;
  v15.CMTimeEpoch epoch = epoch;
  CMTimeConvertScale(&v17, &v15, v18.timescale, kCMTimeRoundingMethod_QuickTime);
  self->_droppingThreshold = ($95D729B680665BEAEFA1D6FCA8238556)v17;
  return v6;
}

- (void)parseStillImageMetadata:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_stillImageTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
  *(_WORD *)&self->_stillImageTransformAvailble = 0;
  id v23 = v4;
  [v4 tracksWithMediaType:*MEMORY[0x1E4F15BE0]];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    p_stillImageTime = &self->_stillImageTime;
    v26 = self;
    uint64_t v7 = *(void *)v31;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        CFDataRef v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v10 = [v9 formatDescriptions];
        unint64_t v11 = [v10 objectAtIndexedSubscript:0];

        if (v11)
        {
          uint64_t v12 = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v11);
          if ([v12 containsObject:@"mdta/com.apple.quicktime.still-image-time"])
          {
            id v13 = v9;
            v14 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v13 outputSettings:0];
            CMTime v15 = (void *)MEMORY[0x1E4F16378];
            v16 = [v13 asset];
            CMTime v17 = [v15 assetReaderWithAsset:v16 error:0];

            [v17 addOutput:v14];
            [v17 startReading];
            uint64_t v18 = [v14 copyNextSampleBuffer];
            if (v18)
            {
              v19 = (opaqueCMSampleBuffer *)v18;
              v20 = 0;
              do
              {
                if (CMSampleBufferGetNumSamples(v19))
                {
                  uint64_t v21 = [objc_alloc(MEMORY[0x1E4F166C0]) initWithSampleBuffer:v19];

                  v20 = (void *)v21;
                }
                CFRelease(v19);
                v19 = (opaqueCMSampleBuffer *)[v14 copyNextSampleBuffer];
              }
              while (v19);
            }
            else
            {
              v20 = 0;
            }
            [v17 cancelReading];
            id v22 = v20;

            if (v22)
            {
              [v22 timeRange];
            }
            else
            {
              int64_t v29 = 0;
              long long v28 = 0u;
            }
            self = v26;
            uint64_t v7 = v24;
            *(_OWORD *)&p_stillImageTime->value = v28;
            p_stillImageTime->CMTimeEpoch epoch = v29;
          }
          if ([v12 containsObject:@"mdta/com.apple.quicktime.live-photo-still-image-transform"])self->_stillImageTransformAvailble = 1; {
          if ([v12 containsObject:@"mdta/com.apple.quicktime.live-photo-still-image-transform-reference-dimensions"])self->_stillImageTransformReferenceDimensionsAvailable = 1;
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }
}

- (void)readLivePhotoMetadataFromAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = findIRAPs(v4);
  uint64_t v6 = (void *)MEMORY[0x1E4F16558];
  uint64_t v7 = [v4 metadata];
  v8 = [v6 metadataItemsFromArray:v7 filteredByIdentifier:@"mdta/com.apple.quicktime.software"];
  CFDataRef v9 = [v8 firstObject];

  v10 = [v9 value];
  [v10 floatValue];
  float v12 = v11;

  id v13 = (void *)MEMORY[0x1E4F16558];
  v14 = [v4 metadata];
  CMTime v15 = [v13 metadataItemsFromArray:v14 filteredByIdentifier:@"mdta/com.apple.quicktime.model"];
  v16 = [v15 firstObject];

  if (self->_printMetadata)
  {
    printf("OS Version : %.1f\n", v12);
    id v17 = [v16 value];
    printf("Model      : %s\n", (const char *)[v17 UTF8String]);

    uint64_t v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    metadataList = self->_metadataList;
    self->_metadataList = v18;
  }
  [(FRCLivePhotoMetadataReader *)self parseStillImageMetadata:v4];
  v20 = [(FRCLivePhotoMetadataReader *)self createMetadataAdaptorForAsset:v4];
  metadataOutputAdaptor = self->_metadataOutputAdaptor;
  self->_metadataOutputAdaptor = v20;

  if (self->_metadataOutputAdaptor)
  {
    unint64_t v22 = [(FRCLivePhotoMetadataReader *)self preParseMetadata];
    id v23 = [(FRCLivePhotoMetadataReader *)self createMetadataAdaptorForAsset:v4];
    uint64_t v24 = self->_metadataOutputAdaptor;
    self->_metadataOutputAdaptor = v23;

    self->_frameIndex = 0;
    self->_recipe = 0;
    self->_numberOfDroppedFrames = 0;
    uint64_t v25 = [(AVAssetReaderOutputMetadataAdaptor *)self->_metadataOutputAdaptor nextTimedMetadataGroup];
    if (v25)
    {
      v26 = (void *)v25;
      while (1)
      {
        if (![v5 count]) {
          goto LABEL_11;
        }
        [v26 timeRange];
        CMTime time1 = v35;
        v27 = [v5 firstObject];
        long long v28 = v27;
        if (v27) {
          [v27 time];
        }
        else {
          memset(&time2, 0, sizeof(time2));
        }
        int32_t v29 = CMTimeCompare(&time1, &time2);

        if (!v29)
        {
          [v5 removeObjectAtIndex:0];
          uint64_t v30 = 1;
        }
        else
        {
LABEL_11:
          uint64_t v30 = 0;
        }
        long long v31 = [v26 items];
        long long v32 = [v31 firstObject];

        if (![(FRCLivePhotoMetadataReader *)self processLivePhotoMetadataItem:v32 isIDR:v30 recipeAvailable:v22 != 0])break; {
        ++self->_frameIndex;
        }

        uint64_t v33 = [(AVAssetReaderOutputMetadataAdaptor *)self->_metadataOutputAdaptor nextTimedMetadataGroup];

        v26 = (void *)v33;
        if (!v33) {
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      self->_numberOfMetadataFrames = self->_frameIndex;
    }
  }
}

- (BOOL)processLivePhotoMetadataItem:(id)a3 isIDR:(BOOL)a4 recipeAvailable:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  unint64_t numberOfInterpolatedFrames = self->_numberOfInterpolatedFrames;
  CFDataRef v10 = [v8 value];
  deserializeLivePhotoMetadata(v10, &v25, &v24);

  float v11 = v25;
  if (!v25) {
    goto LABEL_10;
  }
  self->_metadataVersion = *v25;
  uint64_t FigLivePhotoMetadataV3 = getFigLivePhotoMetadataV3(v11);
  if (!FigLivePhotoMetadataV3)
  {
    free(v25);
    printf("No LivePhotoMetadataV3 in this movie. Metadata verison is %d\n", self->_metadataVersion);
LABEL_10:
    BOOL v15 = 0;
    goto LABEL_34;
  }
  uint64_t v13 = FigLivePhotoMetadataV3;
  if ((*(_WORD *)FigLivePhotoMetadataV3 & 0x10) != 0)
  {
    int64_t v16 = *(char *)(FigLivePhotoMetadataV3 + 57);
    if (self->_recipe)
    {
      uint64_t v17 = v16 - self->_previousDisplacement;
      if (v17 >= 2) {
        self->_numberOfDroppedFrames = v17 + self->_numberOfDroppedFrames - 1;
      }
    }
    else
    {
      self->_recipe = *(unsigned __int8 *)(FigLivePhotoMetadataV3 + 56);
    }
    self->_previousDisplacement = v16;
    if (!v16 && (self->_burstDropTime.flags & 1) == 0)
    {
      if (v8) {
        [v8 time];
      }
      else {
        memset(&time2, 0, sizeof(time2));
      }
      uint64_t v14 = 0;
      self->_burstDropTime = ($95D729B680665BEAEFA1D6FCA8238556)time2;
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (a5 || self->_frameIndex >= self->_totalFrames - 1)
  {
LABEL_27:
    uint64_t v14 = 0;
    goto LABEL_28;
  }
  if ((*(_WORD *)FigLivePhotoMetadataV3 & 0x20) == 0 || !*(unsigned char *)(FigLivePhotoMetadataV3 + 58))
  {
    if (!numberOfInterpolatedFrames)
    {
      if (v8) {
        [v8 duration];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      CMTime time2 = (CMTime)self->_droppingThreshold;
      if (CMTimeCompare(&time1, &time2) == 1)
      {
        ++self->_numberOfDroppedFrames;
        uint64_t v14 = 1;
        goto LABEL_28;
      }
    }
    goto LABEL_27;
  }
  uint64_t v14 = 0;
  ++self->_numberOfDroppedFrames;
LABEL_28:
  if (self->_printMetadata)
  {
    unint64_t frameIndex = self->_frameIndex;
    if (v8) {
      [v8 time];
    }
    else {
      memset(v21, 0, sizeof(v21));
    }
    v19 = [(FRCLivePhotoMetadataReader *)self createMetadataEntryForV3Metadata:v13 frameIndex:frameIndex time:v21 isIDR:v6 noRecipeGap:v14];
    [(NSMutableArray *)self->_metadataList addObject:v19];
  }
  free(v25);
  BOOL v15 = 1;
LABEL_34:

  return v15;
}

- (id)createMetadataAdaptorForAsset:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 tracksWithMediaType:*MEMORY[0x1E4F15BE0]];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v23;
  uint64_t v9 = *MEMORY[0x1E4F52790];
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v4);
      }
      float v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      float v12 = [v11 formatDescriptions];
      uint64_t v13 = [v12 objectAtIndexedSubscript:0];

      if (v13)
      {
        uint64_t v14 = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v13);
        if ([v14 containsObject:v9])
        {
          id v15 = v11;

          uint64_t v7 = v15;
        }
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v6);
  if (v7)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F16378]);
    uint64_t v17 = [v7 asset];
    uint64_t v18 = (void *)[v16 initWithAsset:v17 error:0];

    v19 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v7 outputSettings:0];
    if ([v18 canAddOutput:v19])
    {
      [v18 addOutput:v19];
      v20 = [MEMORY[0x1E4F16390] assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:v19];
      [v18 startReading];
    }
    else
    {
      puts("Error: cannot add metadata output");
      v20 = 0;
    }
  }
  else
  {
LABEL_15:
    puts("Error : No LivePhoto metadata track");
    v20 = 0;
  }

  return v20;
}

- (id)createMetadataEntryForV3Metadata:(id *)a3 frameIndex:(unint64_t)a4 time:(id *)a5 isIDR:(BOOL)a6 noRecipeGap:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  unsigned __int16 var0 = a3->var0;
  uint64_t v13 = objc_alloc_init(FRCLivePhotoMetadata);
  [(FRCLivePhotoMetadata *)v13 setNoRecipeGap:v7];
  [(FRCLivePhotoMetadata *)v13 setIsIDR:v8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a5;
  [(FRCLivePhotoMetadata *)v13 setTime:&v15];
  [(FRCLivePhotoMetadata *)v13 setFrameIndex:a4];
  if ((var0 & 0x20) != 0)
  {
    [(FRCLivePhotoMetadata *)v13 setInterpolated:a3->var6 != 0];
    if ((var0 & 4) == 0)
    {
LABEL_3:
      if ((var0 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((var0 & 4) == 0)
  {
    goto LABEL_3;
  }
  [(FRCLivePhotoMetadata *)v13 setPtsInNanos:a3->var2];
  [(FRCLivePhotoMetadata *)v13 setOriginalPTSInNanos:a3->var3];
  if ((var0 & 8) != 0)
  {
LABEL_4:
    [(FRCLivePhotoMetadata *)v13 setSequenceAdjusterRecipe:a3->var4];
    [(FRCLivePhotoMetadata *)v13 setSequenceAdjusterDisplacement:a3->var5];
  }
LABEL_5:
  return v13;
}

- (void)printMetadata:(id)a3 withVideoFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(&v16, 0, sizeof(v16));
  double v8 = (double)(unint64_t)[v6 ptsInNanos] / 1000000000.0;
  if (v6)
  {
    [v6 time];
    int32_t v9 = v14;
  }
  else
  {
    int32_t v9 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  CMTimeMakeWithSeconds(&v16, v8, v9);
  if (![v6 frameIndex])
  {
    self->_initialOriginalPTS = [v6 ptsInNanos];
    self->_initialTime = ($95D729B680665BEAEFA1D6FCA8238556)v16;
  }
  if (self->_verbose)
  {
    if (v7)
    {
      [v7 presentationTimeStamp];
      printf("Video: %4lld");
    }
    else
    {
      printf("            ");
    }
  }
  if (v6)
  {
    if (self->_verbose)
    {
      if (v7) {
        [v7 presentationTimeStamp];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      [v6 time];
      if (CMTimeCompare(&time1, &time2))
      {
        printf(" != ");
        ++self->_ptsMismatches;
      }
      else
      {
        printf("    ");
      }
      [v6 time];
      printf("Metadata: %4lld ", v10);
      [v6 ptsInNanos];
      [v6 originalPTSInNanos];
      printf("\tPTSinNanos: %-15lld \tOriginalPTSinNanos: %-15lld ");
    }
    else
    {
      [v6 time];
      printf("Time %4lld:");
    }
    printf("\tinterpolated:%d", [v6 interpolated]);
    if ([v6 sequenceAdjusterRecipe]) {
      printf("\trecipe:%ld  displacement:%ld", [v6 sequenceAdjusterRecipe], objc_msgSend(v6, "sequenceAdjusterDisplacement"));
    }
    if ([v6 noRecipeGap]) {
      printf("\t*");
    }
    if ([v6 isIDR]) {
      printf("\tIDR");
    }
  }
  putchar(10);
}

- (void)printMetadataListWithVideoTimingInfo:(id)a3
{
  float v12 = (NSMutableArray *)a3;
  if ([(NSMutableArray *)self->_metadataList count])
  {
    unint64_t v4 = [(NSMutableArray *)self->_metadataList count];
    unint64_t v5 = [(NSMutableArray *)v12 count];
    metadataList = v12;
    if (v4 > v5) {
      metadataList = self->_metadataList;
    }
    uint64_t v7 = [(NSMutableArray *)metadataList count];
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      for (unint64_t i = 0; i != v8; ++i)
      {
        printf("[%3ld] ", i);
        if (i >= [(NSMutableArray *)v12 count])
        {
          uint64_t v10 = 0;
        }
        else
        {
          uint64_t v10 = [(NSMutableArray *)v12 objectAtIndex:i];
        }
        if (i >= [(NSMutableArray *)self->_metadataList count])
        {
          float v11 = 0;
        }
        else
        {
          float v11 = [(NSMutableArray *)self->_metadataList objectAtIndex:i];
        }
        [(FRCLivePhotoMetadataReader *)self printMetadata:v11 withVideoFrame:v10];
      }
    }
  }
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (BOOL)printMetadata
{
  return self->_printMetadata;
}

- (void)setPrintMetadata:(BOOL)a3
{
  self->_printMetadata = a3;
}

- (unint64_t)numberOfMetadataFrames
{
  return self->_numberOfMetadataFrames;
}

- (unint64_t)numberOfDroppedFrames
{
  return self->_numberOfDroppedFrames;
}

- (unint64_t)numberOfInterpolatedFrames
{
  return self->_numberOfInterpolatedFrames;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)burstDropTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (int64_t)ptsMismatches
{
  return self->_ptsMismatches;
}

- (BOOL)stillImageTransformAvailble
{
  return self->_stillImageTransformAvailble;
}

- (BOOL)stillImageTransformReferenceDimensionsAvailable
{
  return self->_stillImageTransformReferenceDimensionsAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataList, 0);
  objc_storeStrong((id *)&self->_metadataOutputAdaptor, 0);
}

@end