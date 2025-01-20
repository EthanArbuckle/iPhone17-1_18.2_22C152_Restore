@interface VCPAudioVideoEmbeddingFuser
+ (BOOL)supportFusionForVersion:(int)a3;
+ (id)sharedFuser:(id)a3 version:(int)a4;
- (VCPAudioVideoEmbeddingFuser)initWithEmbeddingVersion:(unint64_t)a3;
- (id)results;
- (int)fuse:(id)a3;
- (int)loadAudioEmbeddingResults:(id)a3 andVideoEmbeddingResults:(id)a4;
@end

@implementation VCPAudioVideoEmbeddingFuser

+ (BOOL)supportFusionForVersion:(int)a3
{
  v4 = objc_opt_class();
  return [v4 supportsFusionOfVisionEmbeddingVersion:a3 audioEmbeddingVersion:a3];
}

+ (id)sharedFuser:(id)a3 version:(int)a4
{
  id v5 = a3;
  v6 = +[VCPSharedInstanceManager sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__VCPAudioVideoEmbeddingFuser_sharedFuser_version___block_invoke;
  v9[3] = &__block_descriptor_36_e31___SNLanguageAlignedAVFuser_8__0l;
  int v10 = a4;
  v7 = [v6 sharedInstanceWithIdentifier:v5 andCreationBlock:v9];

  return v7;
}

id __51__VCPAudioVideoEmbeddingFuser_sharedFuser_version___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F3BF18]);
  uint64_t v3 = *(int *)(a1 + 32);
  id v9 = 0;
  v4 = (void *)[v2 initWithVisionEmbeddingVersion:v3 audioEmbeddingVersion:v3 error:&v9];
  id v5 = v9;
  if (v5 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [v5 description];
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }

  return v4;
}

- (VCPAudioVideoEmbeddingFuser)initWithEmbeddingVersion:(unint64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)VCPAudioVideoEmbeddingFuser;
  v4 = [(VCPAudioVideoEmbeddingFuser *)&v17 init];
  if (!v4) {
    goto LABEL_3;
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  results = v4->_results;
  v4->_results = (NSMutableArray *)v5;

  v4->_embeddingVersion = a3;
  v4->_embeddingDim = 512;
  v7 = NSString;
  v8 = [NSNumber numberWithInt:a3];
  id v9 = [v8 stringValue];
  int v10 = [v7 stringWithFormat:@"SNLanguageAlignedAVFuser_%@", v9];

  uint64_t v11 = [(id)objc_opt_class() sharedFuser:v10 version:v4->_embeddingVersion];
  avFuser = v4->_avFuser;
  v4->_avFuser = (SNLanguageAlignedAVFuser *)v11;

  v13 = v4->_avFuser;
  if (!v13) {
    v14 = 0;
  }
  else {
LABEL_3:
  }
    v14 = v4;
  v15 = v14;

  return v15;
}

- (int)loadAudioEmbeddingResults:(id)a3 andVideoEmbeddingResults:(id)a4
{
  v6 = (NSArray *)a3;
  v7 = (NSArray *)a4;
  audioEmbeddingResults = self->_audioEmbeddingResults;
  self->_audioEmbeddingResults = v6;
  id v9 = v6;

  videoEmbeddingResults = self->_videoEmbeddingResults;
  self->_videoEmbeddingResults = v7;

  return 0;
}

- (int)fuse:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  v58 = (void (**)(void))a3;
  if (![(NSArray *)self->_videoEmbeddingResults count]
    || ![(NSArray *)self->_audioEmbeddingResults count])
  {
LABEL_91:
    int v57 = 0;
    goto LABEL_92;
  }
  [(NSMutableArray *)self->_results removeAllObjects];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obj = self->_videoEmbeddingResults;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v79 objects:v89 count:16];
  if (!v4)
  {
    int v57 = 0;
    goto LABEL_88;
  }
  uint64_t v5 = 0;
  int v57 = 0;
  uint64_t v56 = *(void *)v80;
  while (2)
  {
    uint64_t v55 = v4;
    for (uint64_t i = 0; i != v55; ++i)
    {
      if (*(void *)v80 != v56) {
        objc_enumerationMutation(obj);
      }
      v7 = *(void **)(*((void *)&v79 + 1) + 8 * i);
      v58[2]();
      v8 = [v7 objectForKeyedSubscript:@"attributes"];
      v60 = [v8 objectForKeyedSubscript:@"embeddings"];

      id v9 = [v7 objectForKeyedSubscript:@"attributes"];
      int v10 = [v9 objectForKeyedSubscript:@"embeddingVersion"];
      unsigned int v59 = [v10 intValue];

      if (v59 != self->_embeddingVersion)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v46 = VCPLogInstance();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            int embeddingVersion = self->_embeddingVersion;
            LODWORD(v90.start.value) = 67109376;
            HIDWORD(v90.start.value) = embeddingVersion;
            LOWORD(v90.start.timescale) = 1024;
            *(CMTimeScale *)((char *)&v90.start.timescale + 2) = v59;
            _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_ERROR, "EmbeddingFuser - expect embedding version %d, but got %d", (uint8_t *)&v90, 0xEu);
          }
        }
        int v57 = -50;
        goto LABEL_88;
      }
      memset(&v78, 0, sizeof(v78));
      CMTimeRangeMakeFromDictionary(&v78, (CFDictionaryRef)v7);
      if ((v78.start.flags & 1) == 0 || (v78.duration.flags & 1) == 0 || v78.duration.epoch || v78.duration.value < 0)
      {

        int v57 = -50;
        goto LABEL_90;
      }
      if (!v60)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v90.start.value) = 0;
            _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "EmbeddingFuser - missing video embedding data", (uint8_t *)&v90, 2u);
          }
        }
        goto LABEL_53;
      }
      uint64_t v72 = 0;
      v73 = &v72;
      uint64_t v74 = 0x3032000000;
      v75 = __Block_byref_object_copy__27;
      v76 = __Block_byref_object_dispose__27;
      uint64_t v11 = 0;
      id v53 = v60;
      id v77 = v53;
      uint64_t v12 = (int)v5;
      float v13 = 0.0;
      while (v12 < (int)[(NSArray *)self->_audioEmbeddingResults count])
      {
        CFDictionaryRef v14 = [(NSArray *)self->_audioEmbeddingResults objectAtIndexedSubscript:v12];
        memset(&v90, 0, sizeof(v90));
        CMTimeRangeMakeFromDictionary(&v90, v14);
        if ((v90.start.flags & 1) == 0 || (v90.duration.flags & 1) == 0 || v90.duration.epoch || v90.duration.value < 0) {
          goto LABEL_49;
        }
        CMTimeRange range = v90;
        memset(&v71, 0, sizeof(v71));
        CMTimeRange otherRange = v78;
        CMTimeRangeGetIntersection(&v71, &range, &otherRange);
        CMTime time = v71.duration;
        if (CMTimeGetSeconds(&time) > v13)
        {
          CMTime duration = v71.duration;
          double Seconds = CMTimeGetSeconds(&duration);
          v16 = [(__CFDictionary *)v14 objectForKeyedSubscript:@"attributes"];
          uint64_t v17 = [v16 objectForKeyedSubscript:@"embeddings"];

          float v13 = Seconds;
          uint64_t v11 = (void *)v17;
          uint64_t v5 = v12;
        }
        CMTime lhs = v78.start;
        CMTime rhs = v78.duration;
        CMTimeAdd(&v66, &lhs, &rhs);
        CMTime lhs = v90.start;
        CMTime rhs = v66;
        BOOL v18 = CMTimeCompare(&lhs, &rhs) > 0;

        if (v18) {
          break;
        }
        ++v12;
      }
      if (![v11 length] || v13 < 1.0)
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v35 = VCPLogInstance();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            CMTime start = v78.start;
            Float64 v36 = CMTimeGetSeconds(&start);
            LODWORD(v90.start.value) = 134217984;
            *(Float64 *)((char *)&v90.start.value + 4) = v36;
            _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_DEBUG, "EmbeddingFuser - does not find paired audio embedding at time %f", (uint8_t *)&v90, 0xCu);
          }
        }
LABEL_45:
        CMTimeRange v90 = v78;
        CFDictionaryRef v37 = CMTimeRangeCopyAsDictionary(&v90, 0);
        CFDictionaryRef v14 = (const __CFDictionary *)[(__CFDictionary *)v37 mutableCopy];

        v86[0] = v73[5];
        v85[0] = @"embeddings";
        v85[1] = @"embeddingVersion";
        v38 = [NSNumber numberWithInt:v59];
        v86[1] = v38;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
        [(__CFDictionary *)v14 setObject:v39 forKeyedSubscript:@"attributes"];

        [(NSMutableArray *)self->_results addObject:v14];
        int v34 = 0;
LABEL_51:

        goto LABEL_52;
      }
      if ([v53 length] == 2 * self->_embeddingDim)
      {
        id v20 = objc_alloc(MEMORY[0x1E4F1E9A8]);
        uint64_t v21 = [v53 bytes];
        v88[0] = &unk_1F15ECFD8;
        v22 = [NSNumber numberWithInt:self->_embeddingDim];
        uint64_t v23 = v5;
        v88[1] = v22;
        v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
        id v65 = 0;
        v52 = (void *)[v20 initWithDataPointer:v21 shape:v24 dataType:65552 strides:&unk_1F15EE250 deallocator:0 error:&v65];
        CFDictionaryRef v14 = (const __CFDictionary *)v65;

        uint64_t v5 = v23;
        if (v14 || !v52)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v41 = VCPLogInstance();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v42 = [(__CFDictionary *)v14 description];
              LODWORD(v90.start.value) = 138412290;
              *(CMTimeValue *)((char *)&v90.start.value + 4) = (CMTimeValue)v42;
              _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_ERROR, "EmbeddingFuser failed to create video embedding %@", (uint8_t *)&v90, 0xCu);
            }
          }

          int v34 = 1;
          goto LABEL_51;
        }
        id v25 = objc_alloc(MEMORY[0x1E4F1E9A8]);
        id v51 = v11;
        uint64_t v26 = [v51 bytes];
        v87[0] = &unk_1F15ECFD8;
        v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", (unint64_t)objc_msgSend(v51, "length") >> 1);
        v87[1] = v27;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
        id v64 = 0;
        v50 = (void *)[v25 initWithDataPointer:v26 shape:v28 dataType:65552 strides:&unk_1F15EE268 deallocator:0 error:&v64];
        id v29 = v64;

        if (v29 || !v50)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            int v34 = 1;
LABEL_77:

            if (!v34) {
              goto LABEL_45;
            }
            uint64_t v11 = v51;
            goto LABEL_52;
          }
          v31 = VCPLogInstance();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v43 = [v29 description];
            LODWORD(v90.start.value) = 138412290;
            *(CMTimeValue *)((char *)&v90.start.value + 4) = (CMTimeValue)v43;
            _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_ERROR, "EmbeddingFuser failed to create video embedding %@", (uint8_t *)&v90, 0xCu);
          }
        }
        else
        {
          avFuser = self->_avFuser;
          id v63 = 0;
          v31 = [(SNLanguageAlignedAVFuser *)avFuser fuseVisionEmbedding:v52 audioEmbedding:v50 error:&v63];
          id v29 = v63;
          if (v29 || !v31)
          {
            if ((int)MediaAnalysisLogLevel() < 3)
            {
              int v34 = 8;
              int v57 = 1;
              goto LABEL_76;
            }
            log = VCPLogInstance();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v44 = [v29 description];
              LODWORD(v90.start.value) = 138412290;
              *(CMTimeValue *)((char *)&v90.start.value + 4) = (CMTimeValue)v44;
              _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v90, 0xCu);
            }
            int v34 = 8;
            int v57 = 1;
LABEL_74:

            goto LABEL_76;
          }
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __36__VCPAudioVideoEmbeddingFuser_fuse___block_invoke;
          v62[3] = &unk_1E6298098;
          v62[4] = &v72;
          [v31 getBytesWithHandler:v62];
          if ([v31 dataType] == 65568)
          {
            uint64_t v32 = +[VCPTextEncoder convertFloat32ToFloat16:v73[5]];
            v33 = (void *)v73[5];
            v73[5] = v32;
          }
          if ([(id)v73[5] length] == 2 * self->_embeddingDim)
          {
            int v34 = 0;
LABEL_76:

            goto LABEL_77;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            log = VCPLogInstance();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              int v45 = [v31 count];
              LODWORD(v90.start.value) = 67109120;
              HIDWORD(v90.start.value) = v45;
              _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "EmbeddingFuser unexpected fusion embedding size %d", (uint8_t *)&v90, 8u);
            }
            int v34 = 1;
            goto LABEL_74;
          }
        }
        int v34 = 1;
        goto LABEL_76;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        VCPLogInstance();
        CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
        {
          int v40 = [v53 length];
          LODWORD(v90.start.value) = 67109120;
          HIDWORD(v90.start.value) = v40;
          int v34 = 8;
          _os_log_impl(&dword_1BBEDA000, (os_log_t)v14, OS_LOG_TYPE_ERROR, "EmbeddingFuser unexpected embedding data length %d", (uint8_t *)&v90, 8u);
        }
        else
        {
LABEL_49:
          int v34 = 8;
        }
        int v57 = -50;
        goto LABEL_51;
      }
      int v34 = 8;
      int v57 = -50;
LABEL_52:

      _Block_object_dispose(&v72, 8);
      if (v34)
      {

        if (v34 == 8) {
          goto LABEL_89;
        }
        int v57 = -18;
        goto LABEL_92;
      }
LABEL_53:
    }
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v79 objects:v89 count:16];
    if (v4) {
      continue;
    }
    break;
  }
LABEL_88:

LABEL_89:
  if (!v57) {
    goto LABEL_91;
  }
LABEL_90:
  [(NSMutableArray *)self->_results removeAllObjects];
LABEL_92:

  return v57;
}

void __36__VCPAudioVideoEmbeddingFuser_fuse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a2 length:a3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)results
{
  v6[1] = *MEMORY[0x1E4F143B8];
  results = self->_results;
  uint64_t v5 = @"AudioFusedVideoEmbeddingResults";
  v6[0] = results;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avFuser, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_videoEmbeddingResults, 0);
  objc_storeStrong((id *)&self->_audioEmbeddingResults, 0);
}

@end