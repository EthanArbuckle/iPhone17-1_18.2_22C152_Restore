@interface PHMediaProcessingAlgorithmVersionProvider
+ (id)descriptionForVersionProvider:(id)a3;
+ (id)providerWithCurrentVersions;
- (PHMediaProcessingAlgorithmVersionProvider)initWithProvider:(id)a3;
- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 faceAnalysisVersion:(signed __int16)a4 characterRecognitionAlgorithmVersion:(signed __int16)a5 visualSearchAlgorithmVersion:(signed __int16)a6 stickerConfidenceAlgorithmVersion:(signed __int16)a7 vaAnalysisVersion:(signed __int16)a8 mediaAnalysisVersion:(unint64_t)a9;
- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 faceAnalysisVersion:(signed __int16)a4 characterRecognitionAlgorithmVersion:(signed __int16)a5 visualSearchAlgorithmVersion:(signed __int16)a6 stickerConfidenceAlgorithmVersion:(signed __int16)a7 vaAnalysisVersion:(signed __int16)a8 mediaAnalysisVersion:(unint64_t)a9 mediaAnalysisImageVersion:(signed __int16)a10;
- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 faceAnalysisVersion:(signed __int16)a4 characterRecognitionAlgorithmVersion:(signed __int16)a5 visualSearchAlgorithmVersion:(signed __int16)a6 stickerConfidenceAlgorithmVersion:(signed __int16)a7 vaAnalysisVersion:(signed __int16)a8 vaLocationAnalysisVersion:(signed __int16)a9 mediaAnalysisVersion:(unint64_t)a10 mediaAnalysisImageVersion:(signed __int16)a11 captionGenerationVersion:(signed __int16)a12 imageEmbeddingVersion:(signed __int16)a13 videoEmbeddingVersion:(signed __int16)a14;
- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 imageEmbeddingVersion:(signed __int16)a4 faceAnalysisVersion:(signed __int16)a5 characterRecognitionAlgorithmVersion:(signed __int16)a6 visualSearchAlgorithmVersion:(signed __int16)a7 stickerConfidenceAlgorithmVersion:(signed __int16)a8 vaAnalysisVersion:(signed __int16)a9 vaLocationAnalysisVersion:(signed __int16)a10 mediaAnalysisVersion:(unint64_t)a11 mediaAnalysisImageVersion:(signed __int16)a12;
- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 imageEmbeddingVersion:(signed __int16)a4 faceAnalysisVersion:(signed __int16)a5 characterRecognitionAlgorithmVersion:(signed __int16)a6 visualSearchAlgorithmVersion:(signed __int16)a7 stickerConfidenceAlgorithmVersion:(signed __int16)a8 vaAnalysisVersion:(signed __int16)a9 vaLocationAnalysisVersion:(signed __int16)a10 mediaAnalysisVersion:(unint64_t)a11 mediaAnalysisImageVersion:(signed __int16)a12 captionGenerationVersion:(signed __int16)a13;
- (id)copyWithZone:(_NSZone *)a3;
- (signed)captionGenerationVersion;
- (signed)characterRecognitionAlgorithmVersion;
- (signed)faceAnalysisVersion;
- (signed)imageEmbeddingVersion;
- (signed)mediaAnalysisImageVersion;
- (signed)sceneAnalysisVersion;
- (signed)stickerConfidenceAlgorithmVersion;
- (signed)vaAnalysisVersion;
- (signed)vaLocationAnalysisVersion;
- (signed)videoEmbeddingVersion;
- (signed)visualSearchAlgorithmVersion;
- (unint64_t)mediaAnalysisVersion;
- (void)setCaptionGenerationVersion:(signed __int16)a3;
- (void)setCharacterRecognitionAlgorithmVersion:(signed __int16)a3;
- (void)setFaceAnalysisVersion:(signed __int16)a3;
- (void)setImageEmbeddingVersion:(signed __int16)a3;
- (void)setMediaAnalysisImageVersion:(signed __int16)a3;
- (void)setMediaAnalysisVersion:(unint64_t)a3;
- (void)setSceneAnalysisVersion:(signed __int16)a3;
- (void)setStickerConfidenceAlgorithmVersion:(signed __int16)a3;
- (void)setVaAnalysisVersion:(signed __int16)a3;
- (void)setVaLocationAnalysisVersion:(signed __int16)a3;
- (void)setVideoEmbeddingVersion:(signed __int16)a3;
- (void)setVisualSearchAlgorithmVersion:(signed __int16)a3;
@end

@implementation PHMediaProcessingAlgorithmVersionProvider

- (void)setVideoEmbeddingVersion:(signed __int16)a3
{
  self->_videoEmbeddingVersion = a3;
}

- (signed)videoEmbeddingVersion
{
  return self->_videoEmbeddingVersion;
}

- (void)setImageEmbeddingVersion:(signed __int16)a3
{
  self->_imageEmbeddingVersion = a3;
}

- (signed)imageEmbeddingVersion
{
  return self->_imageEmbeddingVersion;
}

- (void)setCaptionGenerationVersion:(signed __int16)a3
{
  self->_captionGenerationVersion = a3;
}

- (signed)captionGenerationVersion
{
  return self->_captionGenerationVersion;
}

- (void)setMediaAnalysisImageVersion:(signed __int16)a3
{
  self->_mediaAnalysisImageVersion = a3;
}

- (signed)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (void)setMediaAnalysisVersion:(unint64_t)a3
{
  self->_mediaAnalysisVersion = a3;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (void)setVaLocationAnalysisVersion:(signed __int16)a3
{
  self->_vaLocationAnalysisVersion = a3;
}

- (signed)vaLocationAnalysisVersion
{
  return self->_vaLocationAnalysisVersion;
}

- (void)setVaAnalysisVersion:(signed __int16)a3
{
  self->_vaAnalysisVersion = a3;
}

- (signed)vaAnalysisVersion
{
  return self->_vaAnalysisVersion;
}

- (void)setStickerConfidenceAlgorithmVersion:(signed __int16)a3
{
  self->_stickerConfidenceAlgorithmVersion = a3;
}

- (signed)stickerConfidenceAlgorithmVersion
{
  return self->_stickerConfidenceAlgorithmVersion;
}

- (void)setVisualSearchAlgorithmVersion:(signed __int16)a3
{
  self->_visualSearchAlgorithmVersion = a3;
}

- (signed)visualSearchAlgorithmVersion
{
  return self->_visualSearchAlgorithmVersion;
}

- (void)setCharacterRecognitionAlgorithmVersion:(signed __int16)a3
{
  self->_characterRecognitionAlgorithmVersion = a3;
}

- (signed)characterRecognitionAlgorithmVersion
{
  return self->_characterRecognitionAlgorithmVersion;
}

- (void)setFaceAnalysisVersion:(signed __int16)a3
{
  self->_faceAnalysisVersion = a3;
}

- (signed)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (void)setSceneAnalysisVersion:(signed __int16)a3
{
  self->_sceneAnalysisVersion = a3;
}

- (signed)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithProvider:(id)a3
{
  id v3 = a3;
  unsigned int v21 = [v3 sceneAnalysisVersion];
  unsigned int v20 = [v3 faceAnalysisVersion];
  unsigned int v19 = [v3 characterRecognitionAlgorithmVersion];
  uint64_t v4 = [v3 visualSearchAlgorithmVersion];
  uint64_t v5 = [v3 stickerConfidenceAlgorithmVersion];
  uint64_t v6 = [v3 vaAnalysisVersion];
  __int16 v7 = PHOptionalVALocationAnalysisVersion(v3);
  uint64_t v8 = [v3 mediaAnalysisVersion];
  __int16 v9 = PHMediaAnalysisImageVersionUsingFallback(v3);
  __int16 v10 = PHOptionalCaptionGenerationVersion(v3);
  id v11 = v3;
  if (objc_opt_respondsToSelector()) {
    __int16 v12 = [v11 imageEmbeddingVersion];
  }
  else {
    __int16 v12 = 0;
  }

  id v13 = v11;
  if (objc_opt_respondsToSelector()) {
    __int16 v14 = [v13 videoEmbeddingVersion];
  }
  else {
    __int16 v14 = 0;
  }

  HIWORD(v18) = v14;
  WORD2(v18) = v12;
  WORD1(v18) = v10;
  LOWORD(v18) = v9;
  LOWORD(v17) = v7;
  v15 = -[PHMediaProcessingAlgorithmVersionProvider initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:](self, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", v21, v20, v19, v4, v5, v6, v17, v8, v18);

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  LOWORD(v6) = self->_vaLocationAnalysisVersion;
  return (id)objc_msgSend(v4, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", self->_sceneAnalysisVersion, self->_faceAnalysisVersion, self->_characterRecognitionAlgorithmVersion, self->_visualSearchAlgorithmVersion, self->_stickerConfidenceAlgorithmVersion, self->_vaAnalysisVersion, v6, self->_mediaAnalysisVersion, *(void *)&self->_mediaAnalysisImageVersion);
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 faceAnalysisVersion:(signed __int16)a4 characterRecognitionAlgorithmVersion:(signed __int16)a5 visualSearchAlgorithmVersion:(signed __int16)a6 stickerConfidenceAlgorithmVersion:(signed __int16)a7 vaAnalysisVersion:(signed __int16)a8 vaLocationAnalysisVersion:(signed __int16)a9 mediaAnalysisVersion:(unint64_t)a10 mediaAnalysisImageVersion:(signed __int16)a11 captionGenerationVersion:(signed __int16)a12 imageEmbeddingVersion:(signed __int16)a13 videoEmbeddingVersion:(signed __int16)a14
{
  v21.receiver = self;
  v21.super_class = (Class)PHMediaProcessingAlgorithmVersionProvider;
  result = [(PHMediaProcessingAlgorithmVersionProvider *)&v21 init];
  if (result)
  {
    result->_sceneAnalysisVersion = a3;
    result->_faceAnalysisVersion = a4;
    result->_characterRecognitionAlgorithmVersion = a5;
    result->_visualSearchAlgorithmVersion = a6;
    result->_stickerConfidenceAlgorithmVersion = a7;
    result->_vaAnalysisVersion = a8;
    result->_vaLocationAnalysisVersion = a9;
    result->_mediaAnalysisVersion = a10;
    result->_mediaAnalysisImageVersion = a11;
    result->_captionGenerationVersion = a12;
    result->_imageEmbeddingVersion = a13;
    result->_videoEmbeddingVersion = a14;
  }
  return result;
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 imageEmbeddingVersion:(signed __int16)a4 faceAnalysisVersion:(signed __int16)a5 characterRecognitionAlgorithmVersion:(signed __int16)a6 visualSearchAlgorithmVersion:(signed __int16)a7 stickerConfidenceAlgorithmVersion:(signed __int16)a8 vaAnalysisVersion:(signed __int16)a9 vaLocationAnalysisVersion:(signed __int16)a10 mediaAnalysisVersion:(unint64_t)a11 mediaAnalysisImageVersion:(signed __int16)a12 captionGenerationVersion:(signed __int16)a13
{
  HIWORD(v15) = a4;
  WORD2(v15) = a4;
  LODWORD(v15) = __PAIR32__(a13, a12);
  LOWORD(v14) = a10;
  return -[PHMediaProcessingAlgorithmVersionProvider initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:](self, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", a3, a5, a6, a7, a8, a9, v14, a11, v15);
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 imageEmbeddingVersion:(signed __int16)a4 faceAnalysisVersion:(signed __int16)a5 characterRecognitionAlgorithmVersion:(signed __int16)a6 visualSearchAlgorithmVersion:(signed __int16)a7 stickerConfidenceAlgorithmVersion:(signed __int16)a8 vaAnalysisVersion:(signed __int16)a9 vaLocationAnalysisVersion:(signed __int16)a10 mediaAnalysisVersion:(unint64_t)a11 mediaAnalysisImageVersion:(signed __int16)a12
{
  HIWORD(v14) = a4;
  WORD2(v14) = a4;
  WORD1(v14) = a12;
  LOWORD(v14) = a12;
  LOWORD(v13) = a10;
  return -[PHMediaProcessingAlgorithmVersionProvider initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:](self, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", a3, a5, a6, a7, a8, a9, v13, a11, v14);
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 faceAnalysisVersion:(signed __int16)a4 characterRecognitionAlgorithmVersion:(signed __int16)a5 visualSearchAlgorithmVersion:(signed __int16)a6 stickerConfidenceAlgorithmVersion:(signed __int16)a7 vaAnalysisVersion:(signed __int16)a8 mediaAnalysisVersion:(unint64_t)a9 mediaAnalysisImageVersion:(signed __int16)a10
{
  HIWORD(v12) = a10;
  LOWORD(v12) = a10;
  LOWORD(v11) = 0;
  return -[PHMediaProcessingAlgorithmVersionProvider initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:](self, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", a3, a4, a5, a6, a7, a8, v11, a9, v12);
}

- (PHMediaProcessingAlgorithmVersionProvider)initWithSceneAnalysisVersion:(signed __int16)a3 faceAnalysisVersion:(signed __int16)a4 characterRecognitionAlgorithmVersion:(signed __int16)a5 visualSearchAlgorithmVersion:(signed __int16)a6 stickerConfidenceAlgorithmVersion:(signed __int16)a7 vaAnalysisVersion:(signed __int16)a8 mediaAnalysisVersion:(unint64_t)a9
{
  WORD1(v11) = a9;
  LOWORD(v11) = a9;
  LODWORD(v10) = (unsigned __int16)a8;
  return -[PHMediaProcessingAlgorithmVersionProvider initWithSceneAnalysisVersion:imageEmbeddingVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:](self, "initWithSceneAnalysisVersion:imageEmbeddingVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:", a3, 0, a4, a5, a6, a7, v10, a9, v11);
}

+ (id)descriptionForVersionProvider:(id)a3
{
  v24[12] = *MEMORY[0x1E4F143B8];
  v23[0] = @"scene";
  id v3 = NSNumber;
  id v4 = a3;
  v22 = objc_msgSend(v3, "numberWithShort:", objc_msgSend(v4, "sceneAnalysisVersion"));
  v24[0] = v22;
  v23[1] = @"face";
  objc_super v21 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "faceAnalysisVersion"));
  v24[1] = v21;
  v23[2] = @"ocr";
  unsigned int v20 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "characterRecognitionAlgorithmVersion"));
  v24[2] = v20;
  v23[3] = @"vsearch";
  unsigned int v19 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "visualSearchAlgorithmVersion"));
  v24[3] = v19;
  v23[4] = @"sticker";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "stickerConfidenceAlgorithmVersion"));
  v24[4] = v5;
  v23[5] = @"va";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "vaAnalysisVersion"));
  v24[5] = v6;
  v23[6] = @"valoc";
  __int16 v7 = [NSNumber numberWithShort:PHOptionalVALocationAnalysisVersion(v4)];
  v24[6] = v7;
  v23[7] = @"media";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "mediaAnalysisVersion"));
  v24[7] = v8;
  v23[8] = @"mediai";
  __int16 v9 = [NSNumber numberWithShort:PHMediaAnalysisImageVersionUsingFallback(v4)];
  v24[8] = v9;
  v23[9] = @"caption";
  uint64_t v10 = [NSNumber numberWithShort:PHOptionalCaptionGenerationVersion(v4)];
  v24[9] = v10;
  v23[10] = @"iembed";
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "imageEmbeddingVersion"));
  v24[10] = v11;
  v23[11] = @"vembed";
  unsigned int v12 = NSNumber;
  uint64_t v13 = [v4 videoEmbeddingVersion];

  uint64_t v14 = [v12 numberWithShort:v13];
  v24[11] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:12];

  v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v15 options:0 error:0];
  uint64_t v17 = (void *)[[NSString alloc] initWithData:v16 encoding:4];

  return v17;
}

+ (id)providerWithCurrentVersions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init((Class)a1);
  id v4 = [MEMORY[0x1E4F8A998] currentSceneVersion];
  objc_msgSend(v3, "setSceneAnalysisVersion:", objc_msgSend(v4, "shortValue"));

  uint64_t v5 = [MEMORY[0x1E4F8A998] currentFaceVersion];
  objc_msgSend(v3, "setFaceAnalysisVersion:", objc_msgSend(v5, "shortValue"));

  uint64_t v6 = [MEMORY[0x1E4F8A998] currentOCRAlgorithmVersion];
  objc_msgSend(v3, "setCharacterRecognitionAlgorithmVersion:", objc_msgSend(v6, "shortValue"));

  __int16 v7 = [MEMORY[0x1E4F8A998] currentVisualSearchAlgorithmVersion];
  objc_msgSend(v3, "setVisualSearchAlgorithmVersion:", objc_msgSend(v7, "shortValue"));

  uint64_t v8 = [MEMORY[0x1E4F8A998] currentStickerConfidenceAlgorithmVersion];
  objc_msgSend(v3, "setStickerConfidenceAlgorithmVersion:", objc_msgSend(v8, "shortValue"));

  __int16 v9 = [MEMORY[0x1E4F8A998] currentVaAnalysisAlgorithmVersion];
  objc_msgSend(v3, "setVaAnalysisVersion:", objc_msgSend(v9, "shortValue"));

  uint64_t v10 = [MEMORY[0x1E4F8A998] currentVaLocationAnalysisAlgorithmVersion];
  objc_msgSend(v3, "setVaLocationAnalysisVersion:", objc_msgSend(v10, "shortValue"));

  uint64_t v11 = [MEMORY[0x1E4F8A998] currentMediaAnalysisVersion];
  objc_msgSend(v3, "setMediaAnalysisVersion:", objc_msgSend(v11, "unsignedLongLongValue"));

  unsigned int v12 = [MEMORY[0x1E4F8A998] currentMediaAnalysisImageVersion];
  objc_msgSend(v3, "setMediaAnalysisImageVersion:", objc_msgSend(v12, "shortValue"));

  uint64_t v13 = [MEMORY[0x1E4F8A998] currentCaptionGenerationVersion];
  objc_msgSend(v3, "setCaptionGenerationVersion:", objc_msgSend(v13, "shortValue"));

  uint64_t v14 = [MEMORY[0x1E4F8A998] currentImageEmbeddingVersion];
  objc_msgSend(v3, "setImageEmbeddingVersion:", objc_msgSend(v14, "shortValue"));

  uint64_t v15 = [MEMORY[0x1E4F8A998] currentVideoEmbeddingVersion];
  objc_msgSend(v3, "setVideoEmbeddingVersion:", objc_msgSend(v15, "shortValue"));

  v16 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [a1 descriptionForVersionProvider:v3];
    int v19 = 138412290;
    unsigned int v20 = v17;
    _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_INFO, "providerWithCurrentVersions: %@", (uint8_t *)&v19, 0xCu);
  }

  return v3;
}

@end