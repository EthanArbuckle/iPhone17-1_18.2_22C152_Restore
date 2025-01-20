@interface MADEmbeddingStore
+ (BOOL)includeAudioFusedVideoEmbeddings;
+ (id)embeddingStoreDirectoryForPhotoLibrary:(id)a3;
+ (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)preferredImageEmbeddingsForAssetUUID:(id)a3 fromImageEmbeddingResults:(id)a4 error:(id *)a5;
+ (id)preferredVideoEmbeddingsForAssetUUID:(id)a3 fromVideoEmbeddingResults:(id)a4 audioFusedVideoEmbeddingResults:(id)a5 summarizedVideoEmbeddingResults:(id)a6 error:(id *)a7;
+ (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5;
@end

@implementation MADEmbeddingStore

+ (BOOL)includeAudioFusedVideoEmbeddings
{
  return 1;
}

+ (id)embeddingStoreDirectoryForPhotoLibrary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[MADVectorDatabase databaseDirectoryURLForPhotoLibrary:v3];
    v5 = [v4 path];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] nil photo library provided", v8, 2u);
      }
    }
    v5 = 0;
  }

  return v5;
}

+ (id)preferredImageEmbeddingsForAssetUUID:(id)a3 fromImageEmbeddingResults:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v27 = a4;
  v28 = [NSString stringWithFormat:@"[MADEmbeddingStore][%@]", v26];
  v30 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v6 = +[VCPVideoTransformerBackbone embeddingVersion];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v27;
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v11 = [v10 objectForKeyedSubscript:@"attributes"];
        v12 = [v11 objectForKeyedSubscript:@"embeddingVersion"];

        if (v12)
        {
          if (v6 != (int)[v12 intValue]) {
            goto LABEL_23;
          }
        }
        else if (v6 != 2)
        {
LABEL_23:
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v20 = VCPLogInstance();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v38 = v28;
              __int16 v39 = 1024;
              int v40 = v6;
              __int16 v41 = 2112;
              v42 = v12;
              _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "%@ Image embedding version mismatch (expect: %u, received: %@); skip",
                buf,
                0x1Cu);
            }
          }
          if (a5)
          {
            v21 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v35 = *MEMORY[0x1E4F28568];
            objc_msgSend(NSString, "stringWithFormat:", @"%@ Image embedding version mismatch (expect: %u, received: %@); skip",
              v28,
              v6,
            v22 = v12);
            v36 = v22;
            v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
            *a5 = [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v23];
          }
          id v19 = 0;
          v18 = v30;
          goto LABEL_30;
        }
        v13 = [v10 objectForKeyedSubscript:@"attributes"];
        v14 = [v13 objectForKeyedSubscript:@"embeddings"];

        if (v14)
        {
          [v30 addObject:v14];
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v28;
            _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "%@ Missing embedding attributes from image embedding results", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = [v30 count];
      *(_DWORD *)buf = 138412546;
      v38 = v28;
      __int16 v39 = 1024;
      int v40 = v17;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "%@ %u preferred image embeddings", buf, 0x12u);
    }
  }
  v18 = v30;
  id v19 = v30;
LABEL_30:

  return v19;
}

+ (id)preferredVideoEmbeddingsForAssetUUID:(id)a3 fromVideoEmbeddingResults:(id)a4 audioFusedVideoEmbeddingResults:(id)a5 summarizedVideoEmbeddingResults:(id)a6 error:(id *)a7
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v53 = a6;
  v50 = v10;
  v51 = v12;
  v55 = [NSString stringWithFormat:@"[MADEmbeddingStore][%@]", v10];
  id v13 = v11;
  id v14 = v13;
  v52 = v13;
  if (![(id)objc_opt_class() includeAudioFusedVideoEmbeddings]) {
    goto LABEL_14;
  }
  int v15 = !+[VCPMovieAnalyzer enableAudioVideoFusion];
  if (!v12) {
    LOBYTE(v15) = 1;
  }
  id v14 = v13;
  if (v15) {
    goto LABEL_14;
  }
  uint64_t v16 = [v12 count];
  if (v16 == [v13 count])
  {
    id v14 = v12;

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.start.value) = 138412546;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v55;
        LOWORD(buf.start.flags) = 1024;
        *(CMTimeFlags *)((char *)&buf.start.flags + 2) = [v14 count];
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEBUG, "%@ Using audio-fused video embeddings (count %d)", (uint8_t *)&buf, 0x12u);
      }
LABEL_13:
    }
  }
  else
  {
    id v14 = v13;
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.start.value) = 138412802;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v55;
        LOWORD(buf.start.flags) = 1024;
        *(CMTimeFlags *)((char *)&buf.start.flags + 2) = [v12 count];
        WORD1(buf.start.epoch) = 1024;
        HIDWORD(buf.start.epoch) = [v13 count];
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "%@ Unexpected audio-fused video embeddings count %d, expected %d", (uint8_t *)&buf, 0x18u);
      }
      id v14 = v13;
      goto LABEL_13;
    }
  }
LABEL_14:
  v54 = v14;
  if (![v14 count])
  {
    if ((int)MediaAnalysisLogLevel() < 4)
    {
      long long v31 = 0;
      goto LABEL_72;
    }
    v18 = VCPLogInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v55;
      _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEFAULT, "%@ Missing video embedding results from full analysis results", (uint8_t *)&buf, 0xCu);
    }
LABEL_70:
    long long v31 = 0;
    goto LABEL_71;
  }
  v18 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v57 = +[VCPVideoTransformerBackbone embeddingVersion];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v19 = v14;
  id obj = v19;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (!v20) {
    goto LABEL_38;
  }
  uint64_t v21 = *(void *)v65;
  v22 = (_OWORD *)MEMORY[0x1E4F1FA30];
  while (2)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v65 != v21) {
        objc_enumerationMutation(obj);
      }
      v24 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      v25 = [v24 objectForKeyedSubscript:@"attributes"];
      id v26 = [v25 objectForKeyedSubscript:@"embeddingVersion"];

      if (v26)
      {
        if (v57 != (int)[v26 intValue]) {
          goto LABEL_54;
        }
      }
      else if (v57 != 2)
      {
LABEL_54:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v44 = VCPLogInstance();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.start.value) = 138412802;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v55;
            LOWORD(buf.start.flags) = 1024;
            *(CMTimeFlags *)((char *)&buf.start.flags + 2) = v57;
            WORD1(buf.start.epoch) = 2112;
            *(CMTimeEpoch *)((char *)&buf.start.epoch + 4) = (CMTimeEpoch)v26;
            _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_ERROR, "%@ Video embedding version mismatch (expect: %u, received: %@); skip",
              (uint8_t *)&buf,
              0x1Cu);
          }
        }
        if (a7)
        {
          v45 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v72 = *MEMORY[0x1E4F28568];
          objc_msgSend(NSString, "stringWithFormat:", @"%@ Video embedding version mismatch (expect: %u, received: %@); skip",
            v55,
            v57,
          v46 = v26);
          v73 = v46;
          v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
          *a7 = [v45 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v47];
        }
        long long v31 = 0;
        v42 = obj;
        goto LABEL_61;
      }
      memset(&buf, 0, sizeof(buf));
      CMTimeRangeMakeFromDictionary(&buf, (CFDictionaryRef)v24);
      CMTimeRange range1 = buf;
      long long v27 = v22[1];
      *(_OWORD *)&range2.start.value = *v22;
      *(_OWORD *)&range2.start.epoch = v27;
      *(_OWORD *)&range2.duration.timescale = v22[2];
      if (CMTimeRangeEqual(&range1, &range2))
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_36;
        }
        v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v69 = 138412290;
          v70 = v55;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "%@ Found image embedding within video embeddings", v69, 0xCu);
        }
      }
      else
      {
        v29 = [v24 objectForKeyedSubscript:@"attributes"];
        v28 = [v29 objectForKeyedSubscript:@"embeddings"];

        if (v28)
        {
          [v18 addObject:v28];
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v30 = VCPLogInstance();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v69 = 138412290;
            v70 = v55;
            _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "%@ Missing embedding attributes from video embedding results", v69, 0xCu);
          }
        }
      }

LABEL_36:
    }
    id v19 = obj;
    uint64_t v20 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v20) {
      continue;
    }
    break;
  }
LABEL_38:

  if ([v18 count])
  {
    long long v31 = [MEMORY[0x1E4F1CA48] array];
    if ([v53 count])
    {
      long long v32 = [v53 objectAtIndexedSubscript:0];
      long long v33 = [v32 objectForKeyedSubscript:@"attributes"];
      long long v34 = [v33 objectForKeyedSubscript:@"embeddingIds"];

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v35 = v34;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v68 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v59 != v37) {
              objc_enumerationMutation(v35);
            }
            __int16 v39 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            int v40 = (void *)MEMORY[0x1C186D320]();
            LODWORD(v39) = [v39 unsignedIntValue];
            if ([v18 count] > (unint64_t)(int)v39)
            {
              __int16 v41 = -[NSObject objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:");
              [v31 addObject:v41];
            }
          }
          uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v68 count:16];
        }
        while (v36);
      }

      goto LABEL_50;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v35 = VCPLogInstance();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.start.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v55;
        _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_ERROR, "%@ Missing summarized embedding from embedding results", (uint8_t *)&buf, 0xCu);
      }
LABEL_50:
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v42 = VCPLogInstance();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        CMTimeFlags v43 = [v31 count];
        LODWORD(buf.start.value) = 138412546;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v55;
        LOWORD(buf.start.flags) = 1024;
        *(CMTimeFlags *)((char *)&buf.start.flags + 2) = v43;
        _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_DEBUG, "%@ %u preferred video embeddings", (uint8_t *)&buf, 0x12u);
      }
      goto LABEL_61;
    }
    goto LABEL_71;
  }
  if ((int)MediaAnalysisLogLevel() < 3) {
    goto LABEL_70;
  }
  v42 = VCPLogInstance();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf.start.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v55;
    _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_ERROR, "%@ No valid video embedding data", (uint8_t *)&buf, 0xCu);
  }
  long long v31 = 0;
LABEL_61:

LABEL_71:
LABEL_72:

  return v31;
}

+ (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v9 = a4;
  id v55 = a5;
  unint64_t v57 = v9;
  if (v9)
  {
    long long v58 = (void *)[objc_alloc(MEMORY[0x1E4F39220]) initWithPhotoLibraryURL:v9];
  }
  else
  {
    long long v58 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultPhotoLibrary");
  }
  long long v60 = [MEMORY[0x1E4F38EC0] localIdentifiersWithUUIDs:v62];
  uint64_t v10 = [v60 count];
  if (v10 != [v62 count] && (int)MediaAnalysisLogLevel() >= 3)
  {
    id v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 67109376;
      *(_DWORD *)v83 = [v62 count];
      *(_WORD *)&v83[4] = 1024;
      *(_DWORD *)&v83[6] = [v60 count];
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to convert all UUIDs to local identifiers, converted %u but expected %u", buf, 0xEu);
    }
  }
  long long v59 = +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:v58];
  id v12 = [v60 allObjects];
  id v81 = 0;
  long long v61 = [v59 fetchAssetsWithLocalIdentifiers:v12 error:&v81];
  id v56 = v81;

  if ([v61 count])
  {
    unint64_t v66 = +[VCPVideoTransformerBackbone embeddingVersion];
    v68 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v13 = v61;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v77 objects:v88 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v78 != v15) {
            objc_enumerationMutation(v13);
          }
          int v17 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1C186D320]();
          id v19 = (void *)MEMORY[0x1E4F38EC0];
          uint64_t v20 = objc_msgSend(v17, "mad_photosLocalIdentifier");
          uint64_t v21 = [v19 uuidFromLocalIdentifier:v20];

          v22 = [v68 objectForKeyedSubscript:v21];
          LODWORD(v20) = v22 == 0;

          if (v20)
          {
            v23 = [MEMORY[0x1E4F1CA48] array];
            [v68 setObject:v23 forKeyedSubscript:v21];
          }
          v24 = [v17 vectors];
          BOOL v25 = [v24 count] == 0;

          if (v25)
          {
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_30;
            }
            id v26 = VCPLogInstance();
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
            *(_DWORD *)CMTimeRange buf = 138412290;
            *(void *)v83 = v21;
            long long v27 = v26;
            v28 = "[MADEmbeddingStore][%@] Invalid embedding count";
            goto LABEL_28;
          }
          if (objc_msgSend(v17, "mad_hasImageEmbedding"))
          {
            id v26 = [v68 objectForKeyedSubscript:v21];
            [v26 insertObject:v17 atIndex:0];
          }
          else if (objc_msgSend(v17, "mad_hasVideoEmbedding"))
          {
            id v26 = [v68 objectForKeyedSubscript:v21];
            [v26 addObject:v17];
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_30;
            }
            id v26 = VCPLogInstance();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CMTimeRange buf = 138412290;
              *(void *)v83 = v21;
              long long v27 = v26;
              v28 = "[MADEmbeddingStore][%@] Invalid embedding type";
LABEL_28:
              _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
            }
          }
LABEL_29:

LABEL_30:
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v77 objects:v88 count:16];
      }
      while (v14);
    }

    uint64_t v29 = [v68 count];
    if (v29 != [v62 count] && (int)MediaAnalysisLogLevel() >= 3)
    {
      v30 = VCPLogInstance();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int v31 = [v68 count];
        int v32 = [v13 count];
        int v33 = [v62 count];
        *(_DWORD *)CMTimeRange buf = 67109632;
        *(_DWORD *)v83 = v31;
        *(_WORD *)&v83[4] = 1024;
        *(_DWORD *)&v83[6] = v32;
        *(_WORD *)v84 = 1024;
        *(_DWORD *)&v84[2] = v33;
        _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Fetched %u assets (%u image+video entries) from vector database, but expecting %u", buf, 0x14u);
      }
    }
    id v64 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v34 = v68;
    id obj = v34;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v73 objects:v87 count:16];
    if (v35)
    {
      uint64_t v63 = *(void *)v74;
      do
      {
        uint64_t v36 = 0;
        uint64_t v65 = v35;
        do
        {
          if (*(void *)v74 != v63) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void *)(*((void *)&v73 + 1) + 8 * v36);
          v38 = (void *)MEMORY[0x1C186D320]();
          __int16 v39 = [obj objectForKeyedSubscript:v37];
          int v40 = [MEMORY[0x1E4F1CA48] array];
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v41 = v39;
          uint64_t v42 = [v41 countByEnumeratingWithState:&v69 objects:v86 count:16];
          if (v42)
          {
            uint64_t v43 = *(void *)v70;
            do
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v70 != v43) {
                  objc_enumerationMutation(v41);
                }
                v45 = [*(id *)(*((void *)&v69 + 1) + 8 * j) vectors];
                [v40 addObjectsFromArray:v45];
              }
              uint64_t v42 = [v41 countByEnumeratingWithState:&v69 objects:v86 count:16];
            }
            while (v42);
          }

          v46 = [[MADEmbedding alloc] initWithFormat:1 dimension:1 version:v66 vectors:v40];
          [v64 setObject:v46 forKeyedSubscript:v37];

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v47 = VCPLogInstance();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              int v48 = [v40 count];
              *(_DWORD *)CMTimeRange buf = 138412802;
              *(void *)v83 = v37;
              *(_WORD *)&v83[8] = 1024;
              *(_DWORD *)v84 = v48;
              *(_WORD *)&v84[4] = 1024;
              int v85 = v66;
              _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_DEBUG, "[MADEmbeddingStore][%@] Fetched %u embeddings (version %u) from vector database", buf, 0x18u);
            }
          }
          ++v36;
        }
        while (v36 != v65);
        id v34 = obj;
        uint64_t v35 = [obj countByEnumeratingWithState:&v73 objects:v87 count:16];
      }
      while (v35);
    }
    v49 = v34;
    goto LABEL_62;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v50 = VCPLogInstance();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 138412290;
      *(void *)v83 = v56;
      _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to fetch embeddings from vector database: %@", buf, 0xCu);
    }
  }
  if (a6)
  {
    v51 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v89 = *MEMORY[0x1E4F28568];
    v49 = [NSString stringWithFormat:@"[MADEmbeddingStore] Failed to fetch embeddings from vector database: %@", v56];
    v90[0] = v49;
    uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
    id v53 = v51;
    id v34 = (id)v52;
    objc_msgSend(v53, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -18);
    id v64 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:

    goto LABEL_63;
  }
  id v64 = 0;
LABEL_63:

  return v64;
}

+ (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v9 = a4;
  id v57 = a5;
  id v53 = v9;
  if (v9)
  {
    id v61 = v9;
  }
  else
  {
    id v61 = [MEMORY[0x1E4F39220] systemPhotoLibraryURL];
  }
  uint64_t v10 = [objc_alloc(MEMORY[0x1E4F39220]) initWithPhotoLibraryURL:v61];
  v54 = (void *)v10;
  if (v10)
  {
    id v56 = +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:v10];
    if (v57)
    {
      id v11 = v57;
    }
    else
    {
      id v11 = +[MADEmbeddingSearchOptions defaultOptions];
    }
    long long v58 = v11;
    uint64_t v14 = [v11 assetUUIDs];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
      int v17 = [v58 assetUUIDs];
      v18 = [v16 setWithArray:v17];

      id v19 = [MEMORY[0x1E4F38EC0] localIdentifiersWithUUIDs:v18];
      uint64_t v20 = [v19 count];
      if (v20 != [v18 count] && (int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTimeRange buf = 67109376;
          *(_DWORD *)long long v77 = [v19 count];
          *(_WORD *)&v77[4] = 1024;
          *(_DWORD *)&v77[6] = [v18 count];
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to convert all UUIDs to local identifiers, converted %u but expected %u", buf, 0xEu);
        }
      }
      v22 = v19;
    }
    else
    {
      v22 = 0;
    }
    uint64_t v52 = v22;
    v23 = [v22 allObjects];
    uint64_t v24 = [v58 resultLimit];
    uint64_t v25 = [v58 fullScan];
    uint64_t v26 = [v58 includePayload];
    long long v27 = [v58 numberOfProbes];
    v28 = [v58 batchSize];
    uint64_t v29 = [v58 numConcurrentReaders];
    id v72 = 0;
    id v64 = [v56 searchWithEmbeddings:v60 localIdentifiers:v23 attributeFilters:0 limit:v24 fullScan:v25 includePayload:v26 numberOfProbes:v27 batchSize:v28 numConcurrentReaders:v29 error:&v72];
    id v55 = v72;

    if (v55)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTimeRange buf = 138412290;
          *(void *)long long v77 = v55;
          _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to search with embeddings %@", buf, 0xCu);
        }
      }
      if (a6)
      {
        id v62 = 0;
        *a6 = (id)[v55 copy];
LABEL_50:

        goto LABEL_51;
      }
    }
    else
    {
      uint64_t v31 = [v64 count];
      if (v31 == [v60 count])
      {
        id v62 = [MEMORY[0x1E4F1CA48] array];
        for (unint64_t i = 0; i < [v64 count]; ++i)
        {
          context = (void *)MEMORY[0x1C186D320]();
          long long v59 = [v64 objectAtIndexedSubscript:i];
          unint64_t v66 = [MEMORY[0x1E4F1CA48] array];
          int v32 = [MEMORY[0x1E4F1CA80] set];
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id obj = v59;
          uint64_t v33 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v69;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v69 != v34) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v36 = *(void **)(*((void *)&v68 + 1) + 8 * j);
                uint64_t v37 = (void *)MEMORY[0x1C186D320]();
                v38 = (void *)MEMORY[0x1E4FB3BC0];
                __int16 v39 = [v36 stringIdentifier];
                int v40 = objc_msgSend(v38, "mad_localIdentifierFromStringIdentifier:", v39);

                id v41 = [MEMORY[0x1E4F38EC0] uuidFromLocalIdentifier:v40];
                if (([v32 containsObject:v41] & 1) == 0)
                {
                  uint64_t v42 = [MADEmbeddingSearchResult alloc];
                  uint64_t v43 = [v36 value];
                  uint64_t v44 = -[MADEmbeddingSearchResult initWithAssetUUID:distance:metric:](v42, "initWithAssetUUID:distance:metric:", v41, v43, [v36 metric]);

                  [v66 addObject:v44];
                  [v32 addObject:v41];
                }
              }
              uint64_t v33 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
            }
            while (v33);
          }

          [v62 addObject:v66];
        }
        goto LABEL_50;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v45 = VCPLogInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          int v46 = [v60 count];
          int v47 = [v64 count];
          *(_DWORD *)CMTimeRange buf = 67109376;
          *(_DWORD *)long long v77 = v46;
          *(_WORD *)&v77[4] = 1024;
          *(_DWORD *)&v77[6] = v47;
          _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Invalid search results count: expected %u but received %u", buf, 0xEu);
        }
      }
      if (a6)
      {
        int v48 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v74 = *MEMORY[0x1E4F28568];
        v49 = objc_msgSend(NSString, "stringWithFormat:", @"[MADEmbeddingStore] Invalid search results count: expected %u but received %u", objc_msgSend(v60, "count"), objc_msgSend(v64, "count"));
        long long v75 = v49;
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        *a6 = [v48 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v50];
      }
    }
    id v62 = 0;
    goto LABEL_50;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 138412290;
      *(void *)long long v77 = 0;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to initialize Photo Library %@", buf, 0xCu);
    }
  }
  if (!a6)
  {
    id v62 = 0;
    goto LABEL_52;
  }
  id v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v78 = *MEMORY[0x1E4F28568];
  id v56 = [NSString stringWithFormat:@"[MADEmbeddingStore] Failed to initialize Photo Library %@", 0];
  v79[0] = v56;
  long long v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -50);
  id v62 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

LABEL_52:
  return v62;
}

+ (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F39220] systemPhotoLibraryURL];
  }
  uint64_t v10 = v9;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F39220]) initWithPhotoLibraryURL:v9];
  if (v11)
  {
    +[MADVectorDatabaseManager releaseAllSharedDatabase];
    id v12 = +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:v11];
    [v12 prewarmSearchWithConcurrencyLimit:a3];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTimeRange buf = 138412290;
        uint64_t v20 = 0;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to initialize Photo Library %@", buf, 0xCu);
      }
    }
    if (a5)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      uint64_t v15 = [NSString stringWithFormat:@"[MADEmbeddingStore] Failed to initialize Photo Library %@", 0];
      v18 = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a5 = [v14 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v16];
    }
  }
}

@end