@interface SGQuickResponsesClassificationModel
+ (id)featurizerWithMethods:(id)a3 bucketSize:(unint64_t)a4 characterNGramRange:(_NSRange)a5 tokenNGramRange:(_NSRange)a6 idVectorLength:(unint64_t)a7 extraIdOptions:(unint64_t)a8 vectorizerStrategy:(unint64_t)a9 vectorNormalization:(int64_t)a10 vocab:(id)a11;
+ (id)newTransformerInstanceForConfig:(id)a3 seed:(unint64_t)a4 useSeed:(BOOL)a5;
+ (id)newTransformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6;
+ (id)newTransformerInstanceForLanguage:(id)a3 withDictionary:(id)a4 withVocab:(id)a5 withSeed:(unint64_t)a6 forMode:(unint64_t)a7;
@end

@implementation SGQuickResponsesClassificationModel

+ (id)newTransformerInstanceForConfig:(id)a3 seed:(unint64_t)a4 useSeed:(BOOL)a5
{
  id v7 = a3;
  if (!v7)
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, a1, @"SGQuickResponsesClassificationModel.m", 80, @"Invalid parameter not satisfying: %@", @"config" object file lineNumber description];
  }
  v8 = [SGModelSource alloc];
  v9 = [v7 sessionDescriptor];
  v53 = [(SGModelSource *)v8 initWithSessionDescriptor:v9 modelClass:objc_opt_class()];

  v49 = [v7 preprocessingMethods];
  v52 = [v7 modelHyperparameters];
  uint64_t v48 = [v52 vectorLength];
  v51 = [v7 modelHyperparameters];
  uint64_t v10 = [v51 characterNGramRange];
  uint64_t v46 = v11;
  uint64_t v47 = v10;
  v50 = [v7 modelHyperparameters];
  uint64_t v12 = [v50 tokenNGramRange];
  uint64_t v44 = v13;
  uint64_t v45 = v12;
  v14 = [v7 modelHyperparameters];
  uint64_t v15 = [v14 idVectorLength];
  v16 = [v7 modelHyperparameters];
  uint64_t v17 = [v16 extraIdOptions];
  v18 = [v7 modelHyperparameters];
  uint64_t v19 = [v18 vectorizerStrategy];
  v20 = [v7 modelHyperparameters];
  uint64_t v21 = [v20 vectorNormalization];
  v22 = [v7 vocab];
  v23 = +[SGQuickResponsesClassificationModel featurizerWithMethods:bucketSize:characterNGramRange:tokenNGramRange:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:](SGQuickResponsesClassificationModel, "featurizerWithMethods:bucketSize:characterNGramRange:tokenNGramRange:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", v49, v48, v47, v46, v45, v44, v15, v17, v19, v21, v22);

  if ([v7 mode] == 1)
  {
    v24 = 0;
    v25 = 0;
  }
  else
  {
    if (a5) {
      uint64_t v26 = [objc_alloc(MEMORY[0x263F61E88]) initWithSeed:a4];
    }
    else {
      uint64_t v26 = objc_opt_new();
    }
    v27 = (void *)v26;
    v28 = [v7 preprocessingMethods];
    v29 = [v7 labels];
    v24 = +[SGTextLabelTransformer withMethods:v28 withLabelStrings:v29];

    v30 = [SGModelSampler alloc];
    v31 = [v7 classificationParams];
    [v31 positiveSamplingRate];
    double v33 = v32;
    v34 = [v7 classificationParams];
    [v34 dynamicLabelSamplingRate];
    double v36 = v35;
    v37 = [v7 classificationParams];
    [v37 negativeSamplingRate];
    v25 = [(SGModelSampler *)v30 initWithPositiveRate:v27 dynamicLabelRate:v33 negativeRate:v36 rng:v38];
  }
  v39 = [[SGQuickResponsesTransformerInstance alloc] initWithConfig:v7 featurizer:v23 source:v53 labeler:v24 sampler:v25];

  return v39;
}

+ (id)featurizerWithMethods:(id)a3 bucketSize:(unint64_t)a4 characterNGramRange:(_NSRange)a5 tokenNGramRange:(_NSRange)a6 idVectorLength:(unint64_t)a7 extraIdOptions:(unint64_t)a8 vectorizerStrategy:(unint64_t)a9 vectorNormalization:(int64_t)a10 vocab:(id)a11
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v13 = a5.length;
  NSUInteger v14 = a5.location;
  v25[2] = *MEMORY[0x263EF8340];
  id v17 = a11;
  v18 = +[SGStringPreprocessingTransformer withMethods:a3];
  v25[0] = v18;
  LOBYTE(v24) = 0;
  LOBYTE(v23) = 0;
  uint64_t v19 = objc_msgSend(MEMORY[0x263F61950], "withBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", a4, v14, v13, location, length, 0, v23, 0, v24, a7, a8, a9, a10, v17);

  v25[1] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  uint64_t v21 = +[SGPipelineTransformer withTransformers:v20];

  return v21;
}

+ (id)newTransformerInstanceForLanguage:(id)a3 withDictionary:(id)a4 withVocab:(id)a5 withSeed:(unint64_t)a6 forMode:(unint64_t)a7
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  NSUInteger v14 = [[SGQuickResponsesConfig alloc] initWithLanguage:v13 mode:a7 dictionary:v12 vocab:v11];

  if (v14) {
    id v15 = +[SGQuickResponsesClassificationModel newTransformerInstanceForConfig:v14 seed:a6 useSeed:1];
  }
  else {
    id v15 = 0;
  }

  return v15;
}

+ (id)newTransformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  v6 = +[SGQuickResponsesConfig configWithLanguage:a3 mode:a4 plistPath:a5 vocabPath:a6];
  if (v6) {
    id v7 = +[SGQuickResponsesClassificationModel newTransformerInstanceForConfig:v6 seed:0 useSeed:0];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

@end