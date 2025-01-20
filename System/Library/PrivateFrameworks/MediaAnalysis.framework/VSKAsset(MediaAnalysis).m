@interface VSKAsset(MediaAnalysis)
+ (__CFString)mad_stringIdentifierPostfixForEmbeddingType:()MediaAnalysis;
+ (id)mad_assetsWithLocalIdentifier:()MediaAnalysis mediaAnalysisResults:;
+ (id)mad_attributesWithEmbeddingVersion:()MediaAnalysis;
+ (id)mad_localIdentifierFromStringIdentifier:()MediaAnalysis;
+ (id)mad_stringIdentifierFromLocalIdentifier:()MediaAnalysis embeddingType:;
+ (id)mad_stringIdentifiersFromLocalIdentifiers:()MediaAnalysis;
- (id)mad_photosLocalIdentifier;
- (uint64_t)mad_hasImageEmbedding;
- (uint64_t)mad_hasVideoEmbedding;
@end

@implementation VSKAsset(MediaAnalysis)

+ (__CFString)mad_stringIdentifierPostfixForEmbeddingType:()MediaAnalysis
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return @"_1";
  }
  int v3 = a3;
  if (a3 == 2) {
    return @"_2";
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[VSKAsset+MediaAnalysis] Unexpected embedding type %u", (uint8_t *)v6, 8u);
    }
  }
  return @"_0";
}

+ (id)mad_stringIdentifierFromLocalIdentifier:()MediaAnalysis embeddingType:
{
  v5 = NSString;
  id v6 = a3;
  uint64_t v7 = objc_msgSend((id)objc_opt_class(), "mad_stringIdentifierPostfixForEmbeddingType:", a4);
  v8 = [v5 stringWithFormat:@"%@%@", v6, v7];

  return v8;
}

+ (id)mad_localIdentifierFromStringIdentifier:()MediaAnalysis
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 2);

  return v4;
}

- (id)mad_photosLocalIdentifier
{
  v2 = objc_opt_class();
  id v3 = [a1 stringIdentifier];
  v4 = objc_msgSend(v2, "mad_localIdentifierFromStringIdentifier:", v3);

  return v4;
}

- (uint64_t)mad_hasImageEmbedding
{
  v1 = [a1 stringIdentifier];
  v2 = objc_msgSend((id)objc_opt_class(), "mad_stringIdentifierPostfixForEmbeddingType:", 1);
  uint64_t v3 = [v1 hasSuffix:v2];

  return v3;
}

- (uint64_t)mad_hasVideoEmbedding
{
  v1 = [a1 stringIdentifier];
  v2 = objc_msgSend((id)objc_opt_class(), "mad_stringIdentifierPostfixForEmbeddingType:", 2);
  uint64_t v3 = [v1 hasSuffix:v2];

  return v3;
}

+ (id)mad_stringIdentifiersFromLocalIdentifiers:()MediaAnalysis
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend((id)objc_opt_class(), "mad_stringIdentifierFromLocalIdentifier:embeddingType:", v10, 1, (void)v14);
        [v4 addObject:v11];

        v12 = objc_msgSend((id)objc_opt_class(), "mad_stringIdentifierFromLocalIdentifier:embeddingType:", v10, 2);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)mad_attributesWithEmbeddingVersion:()MediaAnalysis
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4FB3BC8], "mad_embeddingVersionAttribute");
  uint64_t v10 = v4;
  id v5 = objc_alloc(MEMORY[0x1E4FB3BE8]);
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = (void *)[v5 initWithIntegerValue:v6];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

+ (id)mad_assetsWithLocalIdentifier:()MediaAnalysis mediaAnalysisResults:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v46 = [MEMORY[0x1E4F38EC0] uuidFromLocalIdentifier:v5];
  unint64_t v7 = +[VCPVideoTransformerBackbone embeddingVersion];
  id v45 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = objc_msgSend(v6, "vcp_results");
  uint64_t v9 = [v8 objectForKeyedSubscript:@"ImageEmbeddingResults"];

  uint64_t v10 = VCPSignPostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  v12 = VCPSignPostLog();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138412290;
    id v50 = v5;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VSKAsset_preferredImageEmbeddingsForAssetUUID", "_%@", buf, 0xCu);
  }

  id v48 = 0;
  v44 = (void *)v9;
  long long v14 = +[MADEmbeddingStore preferredImageEmbeddingsForAssetUUID:v46 fromImageEmbeddingResults:v9 error:&v48];
  id v15 = v48;
  long long v16 = VCPSignPostLog();
  long long v17 = v16;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138412290;
    id v50 = v5;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_END, v11, "VSKAsset_preferredImageEmbeddingsForAssetUUID", "_%@", buf, 0xCu);
  }

  if ([v14 count])
  {
    v18 = objc_msgSend(MEMORY[0x1E4FB3BC0], "mad_stringIdentifierFromLocalIdentifier:embeddingType:", v5, 1);
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4FB3BC0], "mad_attributesWithEmbeddingVersion:", v7);
    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB3BC0]) initWithStringIdentifier:v18 vectors:v14 attributes:v19 payload:0];
    if (v20)
    {
      [v45 addObject:v20];
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v50 = v5;
        __int16 v51 = 2112;
        id v52 = v14;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[%@] Failed to create VSKAsset with image embeddings %@", buf, 0x16u);
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v18 = VCPLogInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v50 = v5;
      __int16 v51 = 2112;
      id v52 = v15;
      _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "[%@] No valid image embedding data (%@)", buf, 0x16u);
    }
    goto LABEL_18;
  }
LABEL_19:
  v43 = v14;
  v22 = objc_msgSend(v6, "vcp_results", v7);
  uint64_t v23 = [v22 objectForKeyedSubscript:@"VideoEmbeddingResults"];

  v24 = objc_msgSend(v6, "vcp_results");
  v25 = [v24 objectForKeyedSubscript:@"AudioFusedVideoEmbeddingResults"];

  v26 = objc_msgSend(v6, "vcp_results");
  v27 = [v26 objectForKeyedSubscript:@"SummarizedEmbeddingResults"];

  v28 = VCPSignPostLog();
  os_signpost_id_t v29 = os_signpost_id_generate(v28);

  v30 = VCPSignPostLog();
  v31 = v30;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_DWORD *)buf = 138412290;
    id v50 = v5;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "VSKAsset_preferredVideoEmbeddingsForAssetUUID", "_%@", buf, 0xCu);
  }

  id v47 = v15;
  v42 = (void *)v23;
  v32 = +[MADEmbeddingStore preferredVideoEmbeddingsForAssetUUID:v46 fromVideoEmbeddingResults:v23 audioFusedVideoEmbeddingResults:v25 summarizedVideoEmbeddingResults:v27 error:&v47];
  id v33 = v47;

  v34 = VCPSignPostLog();
  v35 = v34;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_DWORD *)buf = 138412290;
    id v50 = v5;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_END, v29, "VSKAsset_preferredVideoEmbeddingsForAssetUUID", "_%@", buf, 0xCu);
  }

  if ([v32 count])
  {
    v36 = objc_msgSend(MEMORY[0x1E4FB3BC0], "mad_stringIdentifierFromLocalIdentifier:embeddingType:", v5, 2);
    v37 = objc_msgSend(MEMORY[0x1E4FB3BC0], "mad_attributesWithEmbeddingVersion:", *(void *)type);
    v38 = (void *)[objc_alloc(MEMORY[0x1E4FB3BC0]) initWithStringIdentifier:v36 vectors:v32 attributes:v37 payload:0];
    if (v38)
    {
      [v45 addObject:v38];
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v39 = VCPLogInstance();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v50 = v5;
        __int16 v51 = 2112;
        id v52 = v32;
        _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_ERROR, "[%@] Failed to create VSKAsset with video embeddings %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_37;
    }
    v36 = VCPLogInstance();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v50 = v5;
      __int16 v51 = 2112;
      id v52 = v33;
      _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_ERROR, "[%@] No valid video embedding data (%@)", buf, 0x16u);
    }
  }

LABEL_37:
  return v45;
}

@end