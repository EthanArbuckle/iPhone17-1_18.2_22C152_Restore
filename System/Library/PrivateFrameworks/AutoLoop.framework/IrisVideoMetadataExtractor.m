@interface IrisVideoMetadataExtractor
- (AVAsset)inMovieAsset;
- (BOOL)processedFile;
- (BOOL)saveAllMetadata;
- (IrisVideoMetadataExtractor)init;
- (NSArray)framesMetadataArray;
- (NSDictionary)allMetadata;
- (NSMutableArray)desiredIrisKeysArray;
- (NSMutableDictionary)videoTrackMetadataDict;
- (int)AddInfoFromMetadata:(id)a3 withTimeStamp:(id *)a4 toArray:(id)a5;
- (int)processFile;
- (int)processStillFrameTimeForAsset:(id)a3 toDictionary:(id)a4;
- (int)processVideoTrack:(id)a3;
- (void)AddFrameDictionary:(id)a3 withCMTime:(id *)a4 toArray:(id)a5;
- (void)setDesiredIrisKeysArray:(id)a3;
- (void)setInMovieAsset:(id)a3;
- (void)setProcessedFile:(BOOL)a3;
- (void)setSaveAllMetadata:(BOOL)a3;
@end

@implementation IrisVideoMetadataExtractor

- (IrisVideoMetadataExtractor)init
{
  v8[20] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)IrisVideoMetadataExtractor;
  v2 = [(IrisVideoMetadataExtractor *)&v7 init];
  v8[0] = @"privDFArray";
  v8[1] = @"privECMVct";
  v8[2] = @"privEMBVct";
  v8[3] = @"privDFArray";
  v8[4] = @"privET";
  v8[5] = @"privTZF";
  v8[6] = @"privImgG";
  v8[7] = @"privAFS";
  v8[8] = @"privAFSt";
  v8[9] = @"privFM";
  v8[10] = @"privRefHom";
  v8[11] = @"catBodies";
  v8[12] = @"dogBodies";
  v8[13] = @"humanBodies";
  v8[14] = @"salientObjects";
  v8[15] = @"originalPTSInNanos";
  v8[16] = @"ptsInNanos";
  v8[17] = @"IrisSequenceAdjusterRecipe";
  v8[18] = @"IrisSequenceAdjusterDisplacement";
  v8[19] = @"InterpolatedFrame";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:20];
  uint64_t v4 = [v3 mutableCopy];
  desiredIrisKeysArray = v2->desiredIrisKeysArray;
  v2->desiredIrisKeysArray = (NSMutableArray *)v4;

  v2->processedFile = 0;
  if (qword_1EBE9D6C8 != -1) {
    dispatch_once(&qword_1EBE9D6C8, &unk_1F3891F98);
  }

  return v2;
}

- (void)AddFrameDictionary:(id)a3 withCMTime:(id *)a4 toArray:(id)a5
{
  id v7 = a5;
  v8 = (void *)[a3 mutableCopy];
  CMTime v13 = *(CMTime *)a4;
  CFDictionaryRef v9 = CMTimeCopyAsDictionary(&v13, 0);
  [v8 setObject:v9 forKeyedSubscript:@"PresentationTime"];

  v10 = NSNumber;
  CMTime v13 = *(CMTime *)a4;
  Float64 Seconds = CMTimeGetSeconds(&v13);
  *(float *)&Float64 Seconds = Seconds;
  v12 = [v10 numberWithFloat:Seconds];
  [v8 setObject:v12 forKeyedSubscript:@"PresentationTimeSeconds"];

  [v7 addObject:v8];
}

- (int)AddInfoFromMetadata:(id)a3 withTimeStamp:(id *)a4 toArray:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  CMTime time = *(CMTime *)a4;
  CFDictionaryRef v11 = CMTimeCopyAsDictionary(&time, 0);
  [v10 setObject:v11 forKeyedSubscript:@"PresentationTime"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v12 = self->desiredIrisKeysArray;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v18 = objc_msgSend(v8, "objectForKeyedSubscript:", v17, (void)v20);
        if (v18) {
          [v10 setObject:v18 forKeyedSubscript:v17];
        }
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v14);
  }

  [v9 addObject:v10];
  return 0;
}

- (int)processVideoTrack:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  if (v4)
  {
    [v4 timeRange];
  }
  else
  {
    memset(v38, 0, sizeof(v38));
    long long v37 = 0u;
  }
  CMTime v39 = *(CMTime *)((char *)v38 + 8);
  v6 = [v4 formatDescriptions];
  if ([v6 count]
    && (id v7 = (const opaqueCMFormatDescription *)[v6 objectAtIndex:0]) != 0)
  {
    id v8 = v7;
    CGSize PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions(v7, 0, 0);
    double width = PresentationDimensions.width;
    double height = PresentationDimensions.height;
  }
  else
  {
    [v4 naturalSize];
    double width = v12;
    double height = v13;
    id v8 = 0;
  }
  CFDictionaryRef Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension(v8, (CFStringRef)*MEMORY[0x1E4F24A78]);
  if (Extension)
  {
    CFDictionaryRef v15 = Extension;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(Extension, (const void *)*MEMORY[0x1E4F24A88]);
    CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E4F24A68]);
    if (v17) {
      BOOL v18 = Value == 0;
    }
    else {
      BOOL v18 = 1;
    }
    double v19 = height;
    double v20 = width;
    if (!v18)
    {
      CFNumberRef v21 = v17;
      v35.value = 0;
      uint64_t valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberNSIntegerType, &v35);
      CFNumberGetValue(v21, kCFNumberNSIntegerType, &valuePtr);
      double v20 = (double)v35.value;
      double v19 = (double)valuePtr;
    }
  }
  else
  {
    double v19 = height;
    double v20 = width;
  }
  long long v22 = NSNumber;
  CMTime v35 = v39;
  Float64 Seconds = CMTimeGetSeconds(&v35);
  *(float *)&Float64 Seconds = Seconds;
  v24 = [v22 numberWithFloat:Seconds];
  [(NSMutableDictionary *)v5 setObject:v24 forKeyedSubscript:@"vidTrackTotalDur"];

  *(float *)&double v25 = width;
  uint64_t v26 = [NSNumber numberWithFloat:v25];
  [(NSMutableDictionary *)v5 setObject:v26 forKeyedSubscript:@"vidTrackNaturalW"];

  *(float *)&double v27 = height;
  v28 = [NSNumber numberWithFloat:v27];
  [(NSMutableDictionary *)v5 setObject:v28 forKeyedSubscript:@"vidTrackNaturalH"];

  *(float *)&double v29 = v20;
  v30 = [NSNumber numberWithFloat:v29];
  [(NSMutableDictionary *)v5 setObject:v30 forKeyedSubscript:@"vidTrackCleanW"];

  *(float *)&double v31 = v19;
  v32 = [NSNumber numberWithFloat:v31];
  [(NSMutableDictionary *)v5 setObject:v32 forKeyedSubscript:@"vidTrackCleanH"];

  videoTrackMetadataDict = self->videoTrackMetadataDict;
  self->videoTrackMetadataDict = v5;

  return 0;
}

- (int)processStillFrameTimeForAsset:(id)a3 toDictionary:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v10 = [v7 tracksWithMediaType:*MEMORY[0x1E4F15BE0]];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:&time count:16];
  if (!v11)
  {
    id v20 = v10;
LABEL_25:

    goto LABEL_27;
  }
  uint64_t v12 = v11;
  id v35 = v7;
  CMTimeEpoch epoch = v9;
  id v34 = v6;
  uint64_t v13 = *(void *)v40;
  uint64_t v14 = *MEMORY[0x1E4F218A0];
LABEL_3:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v40 != v13) {
      objc_enumerationMutation(v10);
    }
    v16 = *(void **)(*((void *)&v39 + 1) + 8 * v15);
    CFNumberRef v17 = [v16 formatDescriptions];
    BOOL v18 = (const opaqueCMFormatDescription *)[v17 firstObject];

    if (!v18) {
      goto LABEL_9;
    }
    double v19 = CMMetadataFormatDescriptionGetIdentifiers(v18);
    if ([v19 containsObject:v14]) {
      break;
    }

LABEL_9:
    if (v12 == ++v15)
    {
      uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:&time count:16];
      if (v12) {
        goto LABEL_3;
      }
      id v20 = v10;
      id v6 = v34;
      id v7 = v35;
      goto LABEL_23;
    }
  }
  id v20 = v16;

  if (v20)
  {
    CFNumberRef v21 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v20 outputSettings:0];
    uint64_t v38 = 0;
    id v7 = v35;
    long long v22 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v35 error:&v38];
    long long v23 = v22;
    if (v22)
    {
      [v22 addOutput:v21];
      [v23 startReading];
      do
      {
        v24 = (opaqueCMSampleBuffer *)[v21 copyNextSampleBuffer];
        if (!v24) {
          break;
        }
        double v25 = v24;
        if (CMSampleBufferGetNumSamples(v24))
        {
          uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F166C0]) initWithSampleBuffer:v25];
          double v27 = (void *)MEMORY[0x1E4F16558];
          v28 = [v26 items];
          double v29 = [v27 metadataItemsFromArray:v28 filteredByIdentifier:v14];
          v30 = [v29 firstObject];

          if (v30)
          {
            CMSampleBufferGetOutputPresentationTimeStamp(&v37, v25);
            CMTimeValue value = v37.value;
            CMTimeFlags flags = v37.flags;
            CMTimeScale timescale = v37.timescale;
            CMTimeEpoch epoch = v37.epoch;
          }
        }
        CFRelease(v25);
      }
      while ((flags & 1) == 0);
      [v23 cancelReading];
      id v7 = v35;
    }

    id v6 = v34;
LABEL_23:
    CMTimeEpoch v9 = epoch;
    goto LABEL_25;
  }
  id v6 = v34;
  id v7 = v35;
  CMTimeEpoch v9 = epoch;
LABEL_27:

  if (flags)
  {
    CFAllocatorRef v31 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    time.CMTimeValue value = value;
    time.CMTimeScale timescale = timescale;
    time.CMTimeFlags flags = flags;
    time.CMTimeEpoch epoch = v9;
    CFDictionaryRef v32 = CMTimeCopyAsDictionary(&time, v31);
    [v6 setObject:v32 forKeyedSubscript:@"vidTrackStillFrameTime"];
  }
  return 0;
}

- (int)processFile
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = qword_1EBE9D6E8;
  uint64_t v4 = qword_1EBE9D6E0;
  id obj = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  if (self->saveAllMetadata)
  {
    v60 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  }
  else
  {
    id v5 = 0;
    v60 = 0;
  }
  inMovieAsset = self->inMovieAsset;
  if (!inMovieAsset)
  {
    int Code = -6000;
    goto LABEL_14;
  }
  id v7 = [(AVAsset *)inMovieAsset tracksWithMediaType:*MEMORY[0x1E4F15C18]];
  id v8 = v7;
  if (!v7)
  {
    NSLog(&cfstr_AssetHasNoVide.isa);
    CMTimeEpoch v9 = 0;
    int Code = -6100;
    goto LABEL_13;
  }
  if (![v7 count])
  {
    CMTimeEpoch v9 = 0;
    int Code = -6101;
    goto LABEL_13;
  }
  CMTimeEpoch v9 = [v8 objectAtIndex:0];
  int v10 = [(IrisVideoMetadataExtractor *)self processVideoTrack:v9];
  if (!v10)
  {
    int v10 = [(IrisVideoMetadataExtractor *)self processStillFrameTimeForAsset:self->inMovieAsset toDictionary:self->videoTrackMetadataDict];
    if (!v10)
    {
      v54 = v8;
      v55 = v9;
      v59 = v5;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      v64 = self;
      uint64_t v62 = *MEMORY[0x1E4F15BE0];
      uint64_t v15 = -[AVAsset tracksWithMediaType:](self->inMovieAsset, "tracksWithMediaType:");
      uint64_t v16 = [v15 countByEnumeratingWithState:&v75 objects:v80 count:16];
      if (!v16) {
        goto LABEL_31;
      }
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v76;
LABEL_23:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v76 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v75 + 1) + 8 * v19);
        CFNumberRef v21 = [v20 formatDescriptions];
        long long v22 = (const opaqueCMFormatDescription *)[v21 firstObject];

        if (!v22) {
          goto LABEL_29;
        }
        long long v23 = CMMetadataFormatDescriptionGetIdentifiers(v22);
        if ([v23 containsObject:qword_1EBE9D6E8]) {
          break;
        }

LABEL_29:
        if (v17 == ++v19)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v75 objects:v80 count:16];
          if (!v17)
          {
LABEL_31:

            goto LABEL_61;
          }
          goto LABEL_23;
        }
      }
      id v24 = v20;

      if (!v24)
      {
LABEL_61:
        NSLog(&cfstr_AssetHasNoLive.isa);
        self = v64;
        v48 = [(AVAsset *)v64->inMovieAsset tracksWithMediaType:v62];
        uint64_t v49 = [v48 count];

        if (v49) {
          int Code = 0;
        }
        else {
          int Code = -6001;
        }
        id v5 = v59;
        id v8 = v54;
        CMTimeEpoch v9 = v55;
        goto LABEL_13;
      }
      self = v64;
      double v25 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v64->inMovieAsset error:0];
      uint64_t v26 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v24 outputSettings:0];
      [v26 setAlwaysCopiesSampleData:0];
      id v5 = v59;
      CMTimeEpoch v9 = v55;
      if ([v25 canAddOutput:v26])
      {
        [v25 addOutput:v26];
        double v27 = [MEMORY[0x1E4F16390] assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:v26];
        if ([v25 startReading])
        {
          v50 = v26;
          v51 = v25;
          id v52 = v24;
          v28 = (void *)MEMORY[0x1E01B4410]();
          double v29 = [v27 nextTimedMetadataGroup];
          int Code = 0;
          if (!v29) {
            goto LABEL_60;
          }
          uint64_t v63 = *MEMORY[0x1E4F1F020];
          CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          v53 = v27;
          while (1)
          {
            v56 = v29;
            context = v28;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            v30 = [v29 items];
            uint64_t v31 = [v30 countByEnumeratingWithState:&v71 objects:v79 count:16];
            if (!v31) {
              goto LABEL_59;
            }
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v72;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v72 != v33) {
                  objc_enumerationMutation(v30);
                }
                id v35 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                uint64_t v69 = 0;
                CFErrorRef error = 0;
                long long v68 = 0uLL;
                if (v35) {
                  [v35 time];
                }
                v36 = [v35 identifier];
                int v37 = [v36 isEqualToString:v3];

                if (v37)
                {
                  v67 = 0;
                  uint64_t v38 = [v35 dataType];
                  int v39 = [v38 isEqualToString:v4];

                  if (v39)
                  {
                    CFDataRef v40 = [v35 value];
                    int Code = sub_1DD3C00C4(v40, &v67);

                    CFPropertyListRef v41 = v67;
                    if (v67)
                    {
                      if (v60)
                      {
                        long long v65 = v68;
                        uint64_t v66 = v69;
                        -[IrisVideoMetadataExtractor AddFrameDictionary:withCMTime:toArray:](v64, "AddFrameDictionary:withCMTime:toArray:", v67, &v65);
                      }
                      long long v65 = v68;
                      uint64_t v66 = v69;
                      [(IrisVideoMetadataExtractor *)v64 AddInfoFromMetadata:v41 withTimeStamp:&v65 toArray:obj];
                      goto LABEL_54;
                    }
                  }
                }
                else
                {
                  long long v42 = [v35 identifier];
                  int v43 = [v42 isEqualToString:@"mdta/com.apple.quicktime.camera-debug-info"];

                  if (v43)
                  {
                    v44 = [v35 dataType];
                    int v45 = [v44 isEqualToString:v63];

                    if (v45)
                    {
                      if (v59)
                      {
                        CFDataRef v46 = [v35 value];
                        CFPropertyListRef v41 = CFPropertyListCreateWithData(allocator, v46, 0, 0, &error);

                        long long v65 = v68;
                        uint64_t v66 = v69;
                        [(IrisVideoMetadataExtractor *)v64 AddFrameDictionary:v41 withCMTime:&v65 toArray:v59];
LABEL_54:
                        CFRelease(v41);
                      }
                    }
                  }
                }
                if (error)
                {
                  int Code = CFErrorGetCode(error);
                  CFRelease(error);
                }
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v71 objects:v79 count:16];
            }
            while (v32);
LABEL_59:

            v28 = (void *)MEMORY[0x1E01B4410]();
            double v27 = v53;
            uint64_t v47 = [v53 nextTimedMetadataGroup];

            double v29 = (void *)v47;
            if (!v47)
            {
LABEL_60:
              double v25 = v51;
              [v51 cancelReading];
              self = v64;
              id v5 = v59;
              CMTimeEpoch v9 = v55;
              id v24 = v52;
              uint64_t v26 = v50;
              goto LABEL_67;
            }
          }
        }
        NSLog(&cfstr_AvassetreaderF.isa);
        int Code = -6003;
LABEL_67:
      }
      else
      {
        NSLog(&cfstr_AvassetreaderC.isa);
        int Code = -6002;
      }
      id v8 = v54;

      goto LABEL_13;
    }
  }
  int Code = v10;
LABEL_13:

LABEL_14:
  objc_storeStrong((id *)&self->_framesMetadataArray, obj);
  if (self->saveAllMetadata)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    [(NSDictionary *)v12 setObject:self->videoTrackMetadataDict forKeyedSubscript:@"VideoTrackMetadata"];
    [(NSDictionary *)v12 setObject:v60 forKeyedSubscript:@"PerFrameMetadataPrivate"];
    if ([v5 count]) {
      [(NSDictionary *)v12 setObject:v5 forKeyedSubscript:@"PerFrameMetadataDebug"];
    }
    allMetadata = self->allMetadata;
    self->allMetadata = v12;
  }
  if (!Code) {
    self->processedFile = 1;
  }

  return Code;
}

- (NSMutableDictionary)videoTrackMetadataDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (AVAsset)inMovieAsset
{
  return (AVAsset *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInMovieAsset:(id)a3
{
}

- (NSMutableArray)desiredIrisKeysArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDesiredIrisKeysArray:(id)a3
{
}

- (BOOL)saveAllMetadata
{
  return self->saveAllMetadata;
}

- (void)setSaveAllMetadata:(BOOL)a3
{
  self->saveAllMetadata = a3;
}

- (NSDictionary)allMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)processedFile
{
  return self->processedFile;
}

- (void)setProcessedFile:(BOOL)a3
{
  self->processedFile = a3;
}

- (NSArray)framesMetadataArray
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->allMetadata, 0);
  objc_storeStrong((id *)&self->desiredIrisKeysArray, 0);
  objc_storeStrong((id *)&self->inMovieAsset, 0);
  objc_storeStrong((id *)&self->videoTrackMetadataDict, 0);

  objc_storeStrong((id *)&self->_framesMetadataArray, 0);
}

@end