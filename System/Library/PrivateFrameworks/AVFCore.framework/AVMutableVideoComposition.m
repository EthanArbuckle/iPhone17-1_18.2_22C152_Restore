@interface AVMutableVideoComposition
+ (AVMutableVideoComposition)videoComposition;
+ (AVMutableVideoComposition)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier;
+ (AVMutableVideoComposition)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset;
+ (AVMutableVideoComposition)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset prototypeInstruction:(AVVideoCompositionInstruction *)prototypeInstruction;
+ (AVMutableVideoComposition)videoCompositionWithPropertiesOfAsset:(id)a3 videoGravity:(id)a4;
+ (void)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier completionHandler:(void *)completionHandler;
+ (void)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset completionHandler:(void *)completionHandler;
+ (void)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset prototypeInstruction:(AVVideoCompositionInstruction *)prototypeInstruction completionHandler:(void *)completionHandler;
- (AVVideoCompositionCoreAnimationTool)animationTool;
- (AVVideoCompositionPerFrameHDRDisplayMetadataPolicy)perFrameHDRDisplayMetadataPolicy;
- (CGSize)renderSize;
- (CMPersistentTrackID)sourceTrackIDForFrameTiming;
- (CMTime)frameDuration;
- (NSArray)instructions;
- (NSArray)sourceSampleDataTrackIDs;
- (NSString)colorPrimaries;
- (NSString)colorTransferFunction;
- (NSString)colorYCbCrMatrix;
- (float)renderScale;
- (id)builtInCompositorName;
- (id)customVideoCompositorClass;
- (id)sourceSampleDataTrackWindowsForTrackIDs;
- (id)sourceVideoTrackWindowsForTrackIDs;
- (void)setAnimationTool:(AVVideoCompositionCoreAnimationTool *)animationTool;
- (void)setBuiltInCompositorName:(id)a3;
- (void)setColorPrimaries:(NSString *)colorPrimaries;
- (void)setColorTransferFunction:(NSString *)colorTransferFunction;
- (void)setColorYCbCrMatrix:(NSString *)colorYCbCrMatrix;
- (void)setCustomVideoCompositorClass:(id)customVideoCompositorClass;
- (void)setFrameDuration:(CMTime *)frameDuration;
- (void)setInstructions:(NSArray *)instructions;
- (void)setPerFrameHDRDisplayMetadataPolicy:(AVVideoCompositionPerFrameHDRDisplayMetadataPolicy)perFrameHDRDisplayMetadataPolicy;
- (void)setRenderScale:(float)renderScale;
- (void)setRenderSize:(CGSize)renderSize;
- (void)setSourceSampleDataTrackIDs:(NSArray *)sourceSampleDataTrackIDs;
- (void)setSourceSampleDataTrackWindowsForTrackIDs:(id)a3;
- (void)setSourceTrackIDForFrameTiming:(CMPersistentTrackID)sourceTrackIDForFrameTiming;
- (void)setSourceVideoTrackWindowsForTrackIDs:(id)a3;
@end

@implementation AVMutableVideoComposition

+ (AVMutableVideoComposition)videoComposition
{
  v2 = objc_alloc_init(AVMutableVideoComposition);
  return v2;
}

+ (AVMutableVideoComposition)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset
{
  v3 = (void *)[+[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:asset prototypeInstruction:0] mutableCopy];
  return (AVMutableVideoComposition *)v3;
}

+ (void)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__AVMutableVideoComposition_videoCompositionWithPropertiesOfAsset_completionHandler___block_invoke;
  v4[3] = &unk_1E57B4808;
  v4[4] = completionHandler;
  +[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:asset prototypeInstruction:0 completionHandler:v4];
}

uint64_t __85__AVMutableVideoComposition_videoCompositionWithPropertiesOfAsset_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (id)[a2 mutableCopy];
  v6 = *(uint64_t (**)(uint64_t, id, uint64_t))(v4 + 16);
  return v6(v4, v5, a3);
}

+ (AVMutableVideoComposition)videoCompositionWithPropertiesOfAsset:(id)a3 videoGravity:(id)a4
{
  return 0;
}

+ (AVMutableVideoComposition)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset prototypeInstruction:(AVVideoCompositionInstruction *)prototypeInstruction
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id obj = (id)[MEMORY[0x1E4F1CA48] array];
  v71 = (void *)[MEMORY[0x1E4F1CA48] array];
  v68 = asset;
  v6 = [(AVAsset *)asset tracksWithMediaType:@"vide"];
  CGFloat x = *MEMORY[0x1E4F1DB28];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = [(NSArray *)v6 sortedArrayUsingFunction:trackLayerSort context:0];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v120 objects:v129 count:16];
  v70 = prototypeInstruction;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v121;
    CGFloat rect = y;
    CGFloat v15 = x;
    CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    float v17 = 0.0;
    v18 = (_OWORD *)MEMORY[0x1E4F1FA20];
    uint64_t v67 = *(void *)v121;
    while (2)
    {
      uint64_t v19 = 0;
      uint64_t v74 = v13;
      do
      {
        if (*(void *)v121 != v14) {
          objc_enumerationMutation(v11);
        }
        v20 = *(void **)(*((void *)&v120 + 1) + 8 * v19);
        if ([v20 isEnabled])
        {
          long long v21 = v18[1];
          *(_OWORD *)&v119.a = *v18;
          *(_OWORD *)&v119.c = v21;
          *(_OWORD *)&v119.tCGFloat x = v18[2];
          [v20 nominalFrameRate];
          if (v22 > v17) {
            float v17 = v22;
          }
          [v20 naturalSize];
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          if (v20) {
            [v20 preferredTransform];
          }
          else {
            memset(&v118, 0, sizeof(v118));
          }
          v131.origin.CGFloat x = v15;
          v131.origin.CGFloat y = rect;
          v131.size.CGFloat width = v24;
          v131.size.CGFloat height = v26;
          CGRect v136 = CGRectApplyAffineTransform(v131, &v118);
          v132.origin.CGFloat x = x;
          v132.origin.CGFloat y = y;
          v132.size.CGFloat width = width;
          v132.size.CGFloat height = height;
          CGRect v133 = CGRectUnion(v132, v136);
          CGFloat x = v133.origin.x;
          CGFloat y = v133.origin.y;
          CGFloat width = v133.size.width;
          CGFloat height = v133.size.height;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          v27 = (void *)[v20 segments];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v114 objects:v128 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v115;
LABEL_14:
            uint64_t v31 = 0;
            while (1)
            {
              if (*(void *)v115 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v114 + 1) + 8 * v31);
              if (v32)
              {
                [v32 timeMapping];
              }
              else
              {
                long long v113 = 0u;
                long long v112 = 0u;
                long long v111 = 0u;
                long long v109 = 0u;
                long long v110 = 0u;
                long long v108 = 0u;
              }
              *(_OWORD *)&time.a = v111;
              *(void *)&time.c = v112;
              CFDictionaryRef v33 = CMTimeCopyAsDictionary((CMTime *)&time, v16);
              if (!v33) {
                return 0;
              }
              CFDictionaryRef v34 = v33;
              [obj addObject:v33];
              CFRelease(v34);
              if (v29 == ++v31)
              {
                uint64_t v29 = [v27 countByEnumeratingWithState:&v114 objects:v128 count:16];
                if (v29) {
                  goto LABEL_14;
                }
                break;
              }
            }
          }
          v35 = objc_msgSend((id)objc_msgSend(v20, "segments"), "lastObject");
          if (v35)
          {
            [v35 timeMapping];
          }
          else
          {
            long long v106 = 0u;
            memset(&v107, 0, sizeof(v107));
            long long v104 = 0u;
            long long v105 = 0u;
          }
          CGAffineTransform v119 = v107;
          *(_OWORD *)&time.a = *(_OWORD *)&v107.a;
          time.c = v107.c;
          *(_OWORD *)&rhs.a = *(_OWORD *)&v107.d;
          rhs.c = v107.ty;
          CMTimeAdd(&v103, (CMTime *)&time, (CMTime *)&rhs);
          CFDictionaryRef v36 = CMTimeCopyAsDictionary(&v103, v16);
          if (!v36) {
            return 0;
          }
          CFDictionaryRef v37 = v36;
          [obj addObject:v36];
          CFRelease(v37);
          prototypeInstruction = v70;
          uint64_t v14 = v67;
          uint64_t v13 = v74;
          v18 = (_OWORD *)MEMORY[0x1E4F1FA20];
        }
        ++v19;
      }
      while (v19 != v13);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v120 objects:v129 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    float v17 = 0.0;
  }
  v134.origin.CGFloat x = x;
  v134.origin.CGFloat y = y;
  v134.size.CGFloat width = width;
  v134.size.CGFloat height = height;
  CGRect v135 = CGRectStandardize(v134);
  double v39 = v135.size.width;
  double v40 = v135.size.height;
  memset(&v119, 0, sizeof(v119));
  CGAffineTransformMakeTranslation(&v119, -v135.origin.x, -v135.origin.y);
  [obj sortUsingComparator:&__block_literal_global_12];
  uint64_t v41 = MEMORY[0x1E4F1F9F8];
  CGFloat v126 = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v42 = [obj countByEnumeratingWithState:&v99 objects:v125 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    CMTimeFlags flags = *(_DWORD *)(v41 + 12);
    CGFloat v45 = *(double *)(v41 + 16);
    uint64_t v46 = *(void *)v100;
    uint64_t v69 = *(void *)v100;
    do
    {
      uint64_t v47 = 0;
      uint64_t v72 = v43;
      do
      {
        if (*(void *)v100 != v46) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v48 = *(const __CFDictionary **)(*((void *)&v99 + 1) + 8 * v47);
        memset(&time1, 0, sizeof(time1));
        CMTimeMakeFromDictionary(&time1, v48);
        time.a = v126;
        *(void *)&time.b = __PAIR64__(flags, timescale);
        time.c = v45;
        *(_OWORD *)&rhs.a = *(_OWORD *)&time1.value;
        *(void *)&rhs.c = time1.epoch;
        if (CMTimeCompare((CMTime *)&time, (CMTime *)&rhs))
        {
          if (flags)
          {
            v49 = (void *)[MEMORY[0x1E4F1CA48] array];
            uint64_t recta = v47;
            if (prototypeInstruction && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
              v50 = (AVMutableVideoCompositionInstruction *)(id)[(AVVideoCompositionInstruction *)prototypeInstruction mutableCopy];
            }
            else {
              v50 = +[AVMutableVideoCompositionInstruction videoCompositionInstruction];
            }
            v51 = v50;
            *(_OWORD *)&time.a = *(_OWORD *)&time1.value;
            *(void *)&time.c = time1.epoch;
            rhs.a = v126;
            *(void *)&rhs.b = __PAIR64__(flags, timescale);
            rhs.c = v45;
            CMTimeSubtract(&duration, (CMTime *)&time, (CMTime *)&rhs);
            time.a = v126;
            *(void *)&time.b = __PAIR64__(flags, timescale);
            time.c = v45;
            CMTimeRangeMake(&v97, (CMTime *)&time, &duration);
            CMTimeRange v95 = v97;
            v75 = v51;
            [(AVMutableVideoCompositionInstruction *)v51 setTimeRange:&v95];
            long long v93 = 0u;
            long long v94 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            uint64_t v52 = [(NSArray *)v11 countByEnumeratingWithState:&v91 objects:v124 count:16];
            if (v52)
            {
              uint64_t v53 = v52;
              uint64_t v54 = *(void *)v92;
              do
              {
                for (uint64_t i = 0; i != v53; ++i)
                {
                  if (*(void *)v92 != v54) {
                    objc_enumerationMutation(v11);
                  }
                  v56 = *(void **)(*((void *)&v91 + 1) + 8 * i);
                  if ([v56 isEnabled])
                  {
                    time.a = v126;
                    *(void *)&time.b = __PAIR64__(flags, timescale);
                    time.c = v45;
                    v57 = (void *)[v56 segmentForTrackTime:&time];
                    if (([v57 isEmpty] & 1) == 0)
                    {
                      if (v57)
                      {
                        [v57 timeMapping];
                      }
                      else
                      {
                        long long v88 = 0u;
                        memset(&v89, 0, sizeof(v89));
                        long long v86 = 0u;
                        long long v87 = 0u;
                      }
                      CMTimeRange range = v89;
                      time.a = v126;
                      *(void *)&time.b = __PAIR64__(flags, timescale);
                      time.c = v45;
                      if (CMTimeRangeContainsTime(&range, (CMTime *)&time))
                      {
                        memset(&time, 0, sizeof(time));
                        if (v56) {
                          [v56 preferredTransform];
                        }
                        else {
                          memset(&t1, 0, sizeof(t1));
                        }
                        CGAffineTransform rhs = v119;
                        CGAffineTransformConcat(&time, &t1, &rhs);
                        v58 = +[AVMutableVideoCompositionLayerInstruction videoCompositionLayerInstructionWithAssetTrack:v56];
                        CGAffineTransform rhs = time;
                        *(CGFloat *)&time2.value = v126;
                        time2.CMTimeScale timescale = timescale;
                        time2.CMTimeFlags flags = flags;
                        *(CGFloat *)&time2.epoch = v45;
                        [(AVMutableVideoCompositionLayerInstruction *)v58 setTransform:&rhs atTime:&time2];
                        [v49 addObject:v58];
                      }
                    }
                  }
                }
                uint64_t v53 = [(NSArray *)v11 countByEnumeratingWithState:&v91 objects:v124 count:16];
              }
              while (v53);
            }
            [(AVMutableVideoCompositionInstruction *)v75 setLayerInstructions:v49];
            [v71 addObject:v75];
            uint64_t v46 = v69;
            prototypeInstruction = v70;
            uint64_t v43 = v72;
            uint64_t v47 = recta;
          }
          CGFloat v126 = *(double *)&time1.value;
          CMTimeFlags flags = time1.flags;
          CMTimeScale timescale = time1.timescale;
          CGFloat v45 = *(double *)&time1.epoch;
        }
        ++v47;
      }
      while (v47 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v99 objects:v125 count:16];
    }
    while (v43);
  }
  v59 = (void *)[v71 lastObject];
  memset(&time, 0, 24);
  if (v59) {
    [v59 timeRange];
  }
  else {
    memset(&v81, 0, sizeof(v81));
  }
  CMTimeRangeGetEnd((CMTime *)&time, &v81);
  memset(&rhs, 0, 24);
  if (v68) {
    [(AVAsset *)v68 duration];
  }
  *(_OWORD *)&time1.value = *(_OWORD *)&rhs.a;
  time1.epoch = *(void *)&rhs.c;
  *(_OWORD *)&time2.value = *(_OWORD *)&time.a;
  time2.epoch = *(void *)&time.c;
  if (CMTimeCompare(&time1, &time2) >= 1)
  {
    if (prototypeInstruction && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      v60 = (AVMutableVideoCompositionInstruction *)(id)[(AVVideoCompositionInstruction *)prototypeInstruction mutableCopy];
    }
    else {
      v60 = +[AVMutableVideoCompositionInstruction videoCompositionInstruction];
    }
    v61 = v60;
    *(_OWORD *)&time1.value = *(_OWORD *)&rhs.a;
    time1.epoch = *(void *)&rhs.c;
    *(_OWORD *)&time2.value = *(_OWORD *)&time.a;
    time2.epoch = *(void *)&time.c;
    CMTimeSubtract(&v79, &time1, &time2);
    *(_OWORD *)&time1.value = *(_OWORD *)&time.a;
    time1.epoch = *(void *)&time.c;
    CMTimeRangeMake(&v80, &time1, &v79);
    CMTimeRange v78 = v80;
    [(AVMutableVideoCompositionInstruction *)v61 setTimeRange:&v78];
    [v71 addObject:v61];
  }
  v38 = +[AVMutableVideoComposition videoComposition];
  if ([(NSArray *)v11 count] == 1) {
    uint64_t v63 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0), "trackID");
  }
  else {
    uint64_t v63 = 0;
  }
  *(float *)&double v62 = v17;
  [(AVVideoComposition *)v38 _setFrameDurationForFrameRate:v63 sourceTrackIDForFrameTiming:v62];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AVAsset *)v68 naturalSize];
    double v39 = v64;
    double v40 = v65;
  }
  -[AVMutableVideoComposition setRenderSize:](v38, "setRenderSize:", v39, v40);
  [(AVMutableVideoComposition *)v38 setInstructions:v71];
  return v38;
}

uint64_t __88__AVMutableVideoComposition_videoCompositionWithPropertiesOfAsset_prototypeInstruction___block_invoke(int a1, CFDictionaryRef dictionaryRepresentation, const __CFDictionary *a3)
{
  memset(&v8, 0, sizeof(v8));
  CMTimeMakeFromDictionary(&v8, dictionaryRepresentation);
  memset(&v7, 0, sizeof(v7));
  CMTimeMakeFromDictionary(&v7, a3);
  CMTime time1 = v8;
  CMTime v5 = v7;
  if (CMTimeCompare(&time1, &v5) > 0) {
    return 1;
  }
  CMTime time1 = v8;
  CMTime v5 = v7;
  return (uint64_t)CMTimeCompare(&time1, &v5) >> 31;
}

+ (void)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset prototypeInstruction:(AVVideoCompositionInstruction *)prototypeInstruction completionHandler:(void *)completionHandler
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__AVMutableVideoComposition_videoCompositionWithPropertiesOfAsset_prototypeInstruction_completionHandler___block_invoke;
  v5[3] = &unk_1E57B31D0;
  v5[4] = a1;
  v5[5] = asset;
  v5[6] = prototypeInstruction;
  v5[7] = completionHandler;
  AVLoadValuesAsynchronously(asset, (uint64_t)&unk_1EE5E1AB8, (uint64_t)v5);
}

uint64_t __106__AVMutableVideoComposition_videoCompositionWithPropertiesOfAsset_prototypeInstruction_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) videoCompositionWithPropertiesOfAsset:*(void *)(a1 + 40) prototypeInstruction:*(void *)(a1 + 48)];
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

- (id)builtInCompositorName
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 builtInCompositorName];
}

- (void)setBuiltInCompositorName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if ((objc_msgSend(a3, "isEqual:", -[AVVideoComposition builtInCompositorName](&v6, sel_builtInCompositorName)) & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    [(AVVideoComposition *)&v5 setBuiltInCompositorName:a3];
    [(AVVideoComposition *)self _bumpChangeSeed];
  }
}

- (id)customVideoCompositorClass
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 customVideoCompositorClass];
}

- (void)setCustomVideoCompositorClass:(id)customVideoCompositorClass
{
  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if ([(AVVideoComposition *)&v6 customVideoCompositorClass] != customVideoCompositorClass)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    [(AVVideoComposition *)&v5 setCustomVideoCompositorClass:customVideoCompositorClass];
    [(AVVideoComposition *)self _bumpChangeSeed];
  }
}

- (CMTime)frameDuration
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableVideoComposition;
  return (CMTime *)[(CMTime *)&v4 frameDuration];
}

- (void)setFrameDuration:(CMTime *)frameDuration
{
  v7.receiver = self;
  v7.super_class = (Class)AVMutableVideoComposition;
  [(AVVideoComposition *)&v7 frameDuration];
  CMTime time1 = *frameDuration;
  if (CMTimeCompare(&time1, &time2))
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    CMTime time1 = *frameDuration;
    [(AVVideoComposition *)&v5 setFrameDuration:&time1];
    [(AVVideoComposition *)self _bumpChangeSeed];
  }
}

- (CMPersistentTrackID)sourceTrackIDForFrameTiming
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 sourceTrackIDForFrameTiming];
}

- (void)setSourceTrackIDForFrameTiming:(CMPersistentTrackID)sourceTrackIDForFrameTiming
{
  uint64_t v3 = *(void *)&sourceTrackIDForFrameTiming;
  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if ([(AVVideoComposition *)&v6 sourceTrackIDForFrameTiming] != sourceTrackIDForFrameTiming)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    [(AVVideoComposition *)&v5 setSourceTrackIDForFrameTiming:v3];
    [(AVVideoComposition *)self _bumpChangeSeed];
  }
}

- (CGSize)renderSize
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableVideoComposition;
  [(AVVideoComposition *)&v4 renderSize];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setRenderSize:(CGSize)renderSize
{
  double height = renderSize.height;
  double width = renderSize.width;
  v10.receiver = self;
  v10.super_class = (Class)AVMutableVideoComposition;
  [(AVVideoComposition *)&v10 renderSize];
  if (width != v7 || height != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)AVMutableVideoComposition;
    -[AVVideoComposition setRenderSize:](&v9, sel_setRenderSize_, width, height);
    [(AVVideoComposition *)self _bumpChangeSeed];
  }
}

- (float)renderScale
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  [(AVVideoComposition *)&v3 renderScale];
  return result;
}

- (void)setRenderScale:(float)renderScale
{
  v7.receiver = self;
  v7.super_class = (Class)AVMutableVideoComposition;
  [(AVVideoComposition *)&v7 renderScale];
  if (*(float *)&v5 != renderScale)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVMutableVideoComposition;
    *(float *)&double v5 = renderScale;
    [(AVVideoComposition *)&v6 setRenderScale:v5];
    [(AVVideoComposition *)self _bumpChangeSeed];
  }
}

- (NSArray)instructions
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 instructions];
}

- (void)setInstructions:(NSArray *)instructions
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableVideoComposition;
  [(AVVideoComposition *)&v4 setInstructions:instructions];
  [(AVVideoComposition *)self _bumpChangeSeed];
}

- (AVVideoCompositionCoreAnimationTool)animationTool
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 animationTool];
}

- (void)setAnimationTool:(AVVideoCompositionCoreAnimationTool *)animationTool
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableVideoComposition;
  [(AVVideoComposition *)&v4 setAnimationTool:animationTool];
  [(AVVideoComposition *)self _bumpChangeSeed];
}

- (NSArray)sourceSampleDataTrackIDs
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 sourceSampleDataTrackIDs];
}

- (void)setSourceSampleDataTrackIDs:(NSArray *)sourceSampleDataTrackIDs
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  [(AVVideoComposition *)&v3 setSourceSampleDataTrackIDs:sourceSampleDataTrackIDs];
}

- (id)sourceVideoTrackWindowsForTrackIDs
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 sourceVideoTrackWindowsForTrackIDs];
}

- (void)setSourceVideoTrackWindowsForTrackIDs:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  [(AVVideoComposition *)&v3 setSourceVideoTrackWindowsForTrackIDs:a3];
}

- (id)sourceSampleDataTrackWindowsForTrackIDs
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 sourceSampleDataTrackWindowsForTrackIDs];
}

- (void)setSourceSampleDataTrackWindowsForTrackIDs:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  [(AVVideoComposition *)&v3 setSourceSampleDataTrackWindowsForTrackIDs:a3];
}

- (NSString)colorPrimaries
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 colorPrimaries];
}

- (void)setColorPrimaries:(NSString *)colorPrimaries
{
  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if ([(AVVideoComposition *)&v6 colorPrimaries] != colorPrimaries)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    [(AVVideoComposition *)&v5 setColorPrimaries:colorPrimaries];
    [(AVVideoComposition *)self _bumpChangeSeed];
  }
}

- (NSString)colorYCbCrMatrix
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 colorYCbCrMatrix];
}

- (void)setColorYCbCrMatrix:(NSString *)colorYCbCrMatrix
{
  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if ([(AVVideoComposition *)&v6 colorYCbCrMatrix] != colorYCbCrMatrix)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    [(AVVideoComposition *)&v5 setColorYCbCrMatrix:colorYCbCrMatrix];
    [(AVVideoComposition *)self _bumpChangeSeed];
  }
}

- (NSString)colorTransferFunction
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 colorTransferFunction];
}

- (void)setColorTransferFunction:(NSString *)colorTransferFunction
{
  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if ([(AVVideoComposition *)&v6 colorTransferFunction] != colorTransferFunction)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    [(AVVideoComposition *)&v5 setColorTransferFunction:colorTransferFunction];
    [(AVVideoComposition *)self _bumpChangeSeed];
  }
}

- (AVVideoCompositionPerFrameHDRDisplayMetadataPolicy)perFrameHDRDisplayMetadataPolicy
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return [(AVVideoComposition *)&v3 perFrameHDRDisplayMetadataPolicy];
}

- (void)setPerFrameHDRDisplayMetadataPolicy:(AVVideoCompositionPerFrameHDRDisplayMetadataPolicy)perFrameHDRDisplayMetadataPolicy
{
  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if ([(AVVideoComposition *)&v6 perFrameHDRDisplayMetadataPolicy] != perFrameHDRDisplayMetadataPolicy)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    [(AVVideoComposition *)&v5 setPerFrameHDRDisplayMetadataPolicy:perFrameHDRDisplayMetadataPolicy];
    [(AVVideoComposition *)self _bumpChangeSeed];
  }
}

+ (AVMutableVideoComposition)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier
{
  if (!asset)
  {
    objc_super v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = "asset";
    goto LABEL_6;
  }
  if (!applier)
  {
    objc_super v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = "handler";
LABEL_6:
    uint64_t v12 = (void *)[v9 exceptionWithName:v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", (uint64_t)applier, v4, v5, v6, v7, (uint64_t)v11), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___AVMutableVideoComposition;
  return (AVMutableVideoComposition *)objc_msgSendSuper2(&v13, sel__mutableVideoCompositionWithAsset_applyingCIFiltersWithHandler_);
}

+ (void)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier completionHandler:(void *)completionHandler
{
  if (!asset)
  {
    CMTime v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = "asset != nil";
    goto LABEL_8;
  }
  if (!applier)
  {
    CMTime v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = "applier != nil";
    goto LABEL_8;
  }
  if (!completionHandler)
  {
    CMTime v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = "completionHandler != nil";
LABEL_8:
    v11 = (void *)[v8 exceptionWithName:v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", (uint64_t)applier, (uint64_t)completionHandler, v5, v6, v7, (uint64_t)v10), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __131__AVMutableVideoComposition_AVVideoCompositionFiltering__videoCompositionWithAsset_applyingCIFiltersWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E57B47E0;
  v12[4] = a1;
  v12[5] = asset;
  v12[6] = applier;
  v12[7] = completionHandler;
  AVLoadValuesAsynchronously(asset, (uint64_t)&unk_1EE5E1AD0, (uint64_t)v12);
}

uint64_t __131__AVMutableVideoComposition_AVVideoCompositionFiltering__videoCompositionWithAsset_applyingCIFiltersWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) videoCompositionWithAsset:*(void *)(a1 + 40) applyingCIFiltersWithHandler:*(void *)(a1 + 48)];
  }
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

@end