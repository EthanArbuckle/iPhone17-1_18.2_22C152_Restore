@interface AXMVisionResult
+ (AXMVisionResult)resultWithImage:(id)a3 features:(id)a4 orientation:(id)a5 metricSession:(id)a6;
+ (AXMVisionResult)resultWithImage:(id)a3 features:(id)a4 orientation:(id)a5 metricSession:(id)a6 userContext:(id)a7;
+ (BOOL)supportsSecureCoding;
- (AXMSemanticTextFactory)semanticTextFactory;
- (AXMVisionFeature)assetMetadataFeature;
- (AXMVisionFeature)colorInfoFeature;
- (AXMVisionResult)initWithCoder:(id)a3;
- (AXMetricSession)metricSession;
- (BOOL)captionMayContainSensitiveContent;
- (BOOL)includesFeaturesForImageExploration;
- (BOOL)includesNSFWFeatures;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAXMVisionResult:(id)a3;
- (CIImage)image;
- (NSArray)blurFeatures;
- (NSArray)brightnessFeatures;
- (NSArray)captionFeatures;
- (NSArray)effectiveTextDetectionLocales;
- (NSArray)faceFeatures;
- (NSArray)features;
- (NSArray)iconClassFeatures;
- (NSArray)mediaAnalysisFaceFeatures;
- (NSArray)mediaAnalysisImageCaptionFeatures;
- (NSArray)mediaAnalysisNSFWClassificationFeatures;
- (NSArray)mediaAnalysisObjectClassificationFeatures;
- (NSArray)mediaAnalysisSceneClassificationFeatures;
- (NSArray)mediaAnalysisSignificantEventClassificationFeatures;
- (NSArray)modelClassificationFeatures;
- (NSArray)objectClassificationFeatures;
- (NSArray)ocrFeatures;
- (NSArray)sceneClassificationFeatures;
- (NSArray)sensitiveContentForCaptionFeatures;
- (NSData)brailleEdges;
- (NSData)equivalenceToken;
- (NSDictionary)detectedFeatureDictionary;
- (NSDictionary)featureGates;
- (NSNumber)appliedImageOrientation;
- (NSSecureCoding)userContext;
- (NSSet)evaluatedFeatureTypes;
- (NSString)detectedTextDescription;
- (NSString)detectedTextSummary;
- (NSString)detectedTextType;
- (NSString)localizedDetectedIconHint;
- (NSString)localizedDetectedTextHint;
- (NSString)localizedDetectedTextSummaryHint;
- (NSString)localizedDetectedTextTypeHint;
- (id)_init;
- (id)_processFeatureChild:(id)a3;
- (id)_processFeatureTree:(id)a3;
- (id)captionTranslationLocale;
- (id)description;
- (id)detectedCaptionFeatureDescriptionWithOptions:(id)a3;
- (id)detectedFeatureDescriptionWithOptions:(id)a3;
- (id)detectedSceneClassificationFeatureDescriptionWithOptions:(id)a3;
- (id)parentOCRFeatureTypes;
- (id)sensitiveContentFeatures;
- (id)smallestChildOCRFeatureTypes;
- (id)sortedFeatures;
- (int64_t)imageRegistrationState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppliedImageOrientation:(id)a3;
- (void)setBrailleEdges:(id)a3;
- (void)setDetectedTextDescription:(id)a3;
- (void)setDetectedTextSummary:(id)a3;
- (void)setDetectedTextType:(id)a3;
- (void)setEffectiveTextDetectionLocales:(id)a3;
- (void)setEquivalenceToken:(id)a3;
- (void)setEvaluatedFeatureTypes:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageRegistrationState:(int64_t)a3;
- (void)setMetricSession:(id)a3;
- (void)setSemanticTextFactory:(id)a3;
- (void)setUserContext:(id)a3;
@end

@implementation AXMVisionResult

+ (AXMVisionResult)resultWithImage:(id)a3 features:(id)a4 orientation:(id)a5 metricSession:(id)a6
{
  return (AXMVisionResult *)[a1 resultWithImage:a3 features:a4 orientation:a5 metricSession:a6 userContext:0];
}

+ (AXMVisionResult)resultWithImage:(id)a3 features:(id)a4 orientation:(id)a5 metricSession:(id)a6 userContext:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[AXMVisionResult alloc] _init];
  [v16 setFeatures:v14];

  [v16 setImage:v15];
  [v16 setAppliedImageOrientation:v13];

  [v16 setMetricSession:v12];
  [v16 setUserContext:v11];

  return (AXMVisionResult *)v16;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)AXMVisionResult;
  id result = [(AXMVisionResult *)&v3 init];
  if (result) {
    *((void *)result + 10) = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AXMVisionResult *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AXMVisionResult *)self isEqualToAXMVisionResult:v4];
  }

  return v5;
}

- (BOOL)isEqualToAXMVisionResult:(id)a3
{
  id v5 = a3;
  v6 = [(AXMVisionResult *)self features];
  v7 = [v5 features];
  if ([v6 isEqual:v7])
  {
    v8 = [(AXMVisionResult *)self captionTranslationLocale];
    if (v8 || ([v5 captionTranslationLocale], (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = [(AXMVisionResult *)self captionTranslationLocale];
      v10 = [v5 captionTranslationLocale];
      char v11 = [v9 isEqual:v10];

      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v11 = 1;
    }

    goto LABEL_9;
  }
  char v11 = 0;
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  v2 = [(AXMVisionResult *)self features];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)sortedFeatures
{
  v2 = [(AXMVisionResult *)self features];
  unint64_t v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_10];

  return v3;
}

uint64_t __33__AXMVisionResult_sortedFeatures__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 featureType];
  if (v6 < [v5 featureType]) {
    goto LABEL_6;
  }
  unint64_t v7 = [v4 featureType];
  if (v7 > [v5 featureType]) {
    goto LABEL_8;
  }
  [v4 normalizedFrame];
  double MinY = CGRectGetMinY(v16);
  [v5 normalizedFrame];
  if (MinY >= CGRectGetMinY(v17))
  {
    [v4 normalizedFrame];
    double v9 = CGRectGetMinY(v18);
    [v5 normalizedFrame];
    if (v9 <= CGRectGetMinY(v19))
    {
      [v4 normalizedFrame];
      double MinX = CGRectGetMinX(v20);
      [v5 normalizedFrame];
      if (MinX < CGRectGetMinX(v21)) {
        goto LABEL_6;
      }
      [v4 normalizedFrame];
      double v12 = CGRectGetMinX(v22);
      [v5 normalizedFrame];
      if (v12 <= CGRectGetMinX(v23))
      {
        id v14 = [v4 value];
        id v15 = [v5 value];
        uint64_t v11 = [v14 compare:v15];

        goto LABEL_9;
      }
    }
LABEL_8:
    uint64_t v11 = 1;
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v11 = -1;
LABEL_9:

  return v11;
}

- (AXMVisionFeature)colorInfoFeature
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(AXMVisionResult *)self features];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 featureType] == 4)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (AXMVisionFeature *)v3;
}

- (AXMVisionFeature)assetMetadataFeature
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(AXMVisionResult *)self features];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 featureType] == 13)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (AXMVisionFeature *)v3;
}

- (AXMSemanticTextFactory)semanticTextFactory
{
  semanticTextFactory = self->_semanticTextFactory;
  if (!semanticTextFactory)
  {
    uint64_t v4 = objc_alloc_init(AXMSemanticTextFactory);
    id v5 = self->_semanticTextFactory;
    self->_semanticTextFactory = v4;

    semanticTextFactory = self->_semanticTextFactory;
  }

  return semanticTextFactory;
}

- (id)parentOCRFeatureTypes
{
  return &unk_1F0E94170;
}

- (id)smallestChildOCRFeatureTypes
{
  return &unk_1F0E94188;
}

- (NSString)detectedTextType
{
  detectedTextType = self->_detectedTextType;
  if (!detectedTextType)
  {
    uint64_t v4 = [(AXMVisionResult *)self ocrFeatures];
    id v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_65);
    unint64_t v6 = [v5 firstObject];

    if ([v6 isValueSpeakable])
    {
      +[AXMVisionFeature nameForOCRType:](AXMVisionFeature, "nameForOCRType:", [v6 ocrFeatureType]);
      unint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      long long v8 = self->_detectedTextType;
      self->_detectedTextType = v7;
    }
    detectedTextType = self->_detectedTextType;
  }
  long long v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  long long v10 = [(NSString *)detectedTextType stringByTrimmingCharactersInSet:v9];

  return (NSString *)v10;
}

uint64_t __35__AXMVisionResult_detectedTextType__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isOCR];
}

- (NSString)detectedTextSummary
{
  detectedTextSummary = self->_detectedTextSummary;
  if (!detectedTextSummary)
  {
    uint64_t v4 = [(AXMVisionResult *)self ocrFeatures];
    id v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_69);
    unint64_t v6 = [v5 firstObject];

    if ([v6 isValueSpeakable])
    {
      unint64_t v7 = [v6 value];
      long long v8 = self->_detectedTextSummary;
      self->_detectedTextSummary = v7;
    }
    long long v9 = [(AXMVisionResult *)self ocrFeatures];
    long long v10 = objc_msgSend(v9, "ax_filteredArrayUsingBlock:", &__block_literal_global_71);
    long long v11 = [v10 firstObject];

    if ([v11 isValueSpeakable])
    {
      double v12 = [v11 values];
      uint64_t v13 = [v12 objectAtIndexedSubscript:0];
      id v14 = [MEMORY[0x1E4F1CA98] null];
      char v15 = [v13 isEqual:v14];

      if ((v15 & 1) == 0)
      {
        CGRect v16 = [v11 values];
        CGRect v17 = [v16 objectAtIndexedSubscript:0];
        CGRect v18 = self->_detectedTextSummary;
        self->_detectedTextSummary = v17;
      }
    }
    CGRect v19 = [(AXMVisionResult *)self ocrFeatures];
    CGRect v20 = objc_msgSend(v19, "ax_filteredArrayUsingBlock:", &__block_literal_global_74);
    CGRect v21 = [v20 firstObject];

    if ([v21 isValueSpeakable])
    {
      CGRect v22 = [v21 value];
      CGRect v23 = self->_detectedTextSummary;
      self->_detectedTextSummary = v22;
    }
    detectedTextSummary = self->_detectedTextSummary;
  }
  v24 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v25 = [(NSString *)detectedTextSummary stringByTrimmingCharactersInSet:v24];

  return (NSString *)v25;
}

uint64_t __38__AXMVisionResult_detectedTextSummary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isTable]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isNutritionLabel];
  }

  return v3;
}

uint64_t __38__AXMVisionResult_detectedTextSummary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEnvelope];
}

uint64_t __38__AXMVisionResult_detectedTextSummary__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isReceipt];
}

- (NSString)detectedTextDescription
{
  detectedTextDescription = self->_detectedTextDescription;
  if (!detectedTextDescription)
  {
    uint64_t v4 = [(AXMVisionResult *)self ocrFeatures];
    id v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_76);
    unint64_t v6 = [v5 firstObject];

    if ([v6 isValueSpeakable])
    {
      unint64_t v7 = [v6 value];
      long long v8 = self->_detectedTextDescription;
      self->_detectedTextDescription = v7;
    }
    long long v9 = [(AXMVisionResult *)self ocrFeatures];
    long long v10 = objc_msgSend(v9, "ax_filteredArrayUsingBlock:", &__block_literal_global_78);
    long long v11 = [v10 firstObject];

    if ([v11 isValueSpeakable])
    {
      double v12 = [v11 values];
      uint64_t v13 = [v12 objectAtIndexedSubscript:1];
      id v14 = self->_detectedTextDescription;
      self->_detectedTextDescription = v13;
    }
    detectedTextDescription = self->_detectedTextDescription;
  }

  return detectedTextDescription;
}

uint64_t __42__AXMVisionResult_detectedTextDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isTextDocument];
}

uint64_t __42__AXMVisionResult_detectedTextDescription__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEnvelope];
}

- (NSString)localizedDetectedTextTypeHint
{
  id v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  uint64_t v3 = [v2 localizedStringForKey:@"detected.text.type.hint" value:&stru_1F0E72D10 table:@"Accessibility"];

  return (NSString *)v3;
}

- (NSString)localizedDetectedTextSummaryHint
{
  id v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  uint64_t v3 = [v2 localizedStringForKey:@"detected.text.summary.hint" value:&stru_1F0E72D10 table:@"Accessibility"];

  return (NSString *)v3;
}

- (NSString)localizedDetectedTextHint
{
  id v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  uint64_t v3 = [v2 localizedStringForKey:@"detected.text.hint" value:&stru_1F0E72D10 table:@"Accessibility"];

  return (NSString *)v3;
}

- (id)_processFeatureChild:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [v4 ocrFeatureType];
  unint64_t v7 = +[AXMVisionFeature nameForOCRType:v6];
  long long v8 = [(AXMVisionResult *)self parentOCRFeatureTypes];
  long long v9 = [NSNumber numberWithInteger:v6];
  int v10 = [v8 containsObject:v9];

  if (v10)
  {
    [v5 setObject:v7 forKey:@"AXMType"];
    uint64_t v11 = [v4 value];
    if (v11) {
      [v5 setObject:v11 forKey:@"AXMContent"];
    }
    double v12 = [MEMORY[0x1E4F1CA48] array];
    v62 = (void *)v11;
    if (v6 == 2)
    {
      v42 = v5;
      v43 = [(AXMVisionResult *)self semanticTextFactory];
      v44 = [v4 value];
      [(AXMVisionResult *)self effectiveTextDetectionLocales];
      v46 = v45 = v4;
      v47 = [v46 firstObject];
      CGRect v21 = [v43 semanticTextForText:v44 withLocale:v47];

      if ([v21 isSemanticallyComplete])
      {
        v61 = v7;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        v48 = [v45 subfeatures];
        uint64_t v49 = [v48 countByEnumeratingWithState:&v73 objects:v79 count:16];
        id v4 = v45;
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v74 != v51) {
                objc_enumerationMutation(v48);
              }
              v53 = [(AXMVisionResult *)self _processFeatureChild:*(void *)(*((void *)&v73 + 1) + 8 * i)];
              [v12 addObject:v53];
            }
            uint64_t v50 = [v48 countByEnumeratingWithState:&v73 objects:v79 count:16];
          }
          while (v50);
        }

        id v5 = v42;
        [v42 setObject:v12 forKey:@"AXMChildren"];
        v54 = (void *)MEMORY[0x1E4F29238];
        [v4 normalizedFrame];
        v55 = objc_msgSend(v54, "axmValueWithCGRect:");
        [v42 setObject:v55 forKey:@"AXMBounds"];

        unint64_t v7 = v61;
      }
      else
      {
        id v5 = v42;
        id v4 = v45;
      }
    }
    else
    {
      uint64_t v13 = v7;
      if (v6 == 13 || v6 == 7) {
        [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"AXMRowType"];
      }
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v14 = [v4 subfeatures];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v69 objects:v78 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v70;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v70 != v17) {
              objc_enumerationMutation(v14);
            }
            CGRect v19 = [(AXMVisionResult *)self _processFeatureChild:*(void *)(*((void *)&v69 + 1) + 8 * j)];
            [v12 addObject:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v69 objects:v78 count:16];
        }
        while (v16);
      }

      [v5 setObject:v12 forKey:@"AXMChildren"];
      CGRect v20 = (void *)MEMORY[0x1E4F29238];
      [v4 normalizedFrame];
      CGRect v21 = objc_msgSend(v20, "axmValueWithCGRect:");
      [v5 setObject:v21 forKey:@"AXMBounds"];
      unint64_t v7 = v13;
    }

    CGRect v22 = v62;
  }
  else
  {
    CGRect v23 = [(AXMVisionResult *)self smallestChildOCRFeatureTypes];
    v24 = [NSNumber numberWithInteger:v6];
    int v25 = [v23 containsObject:v24];

    if (!v25) {
      goto LABEL_44;
    }
    CGRect v22 = [v4 value];
    [v5 setObject:v7 forKey:@"AXMType"];
    if (v6 == 4)
    {
      v59 = v5;
      v60 = v7;
      id v58 = v4;
      v26 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v63 = v22;
      v27 = [v22 componentsSeparatedByCharactersInSet:v26];
      v28 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != ''"];
      v29 = [v27 filteredArrayUsingPredicate:v28];

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      obuint64_t j = v29;
      uint64_t v30 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v66;
        v33 = &stru_1F0E72D10;
        while (2)
        {
          uint64_t v34 = 0;
          v35 = v33;
          do
          {
            if (*(void *)v66 != v32) {
              objc_enumerationMutation(obj);
            }
            v36 = *(void **)(*((void *)&v65 + 1) + 8 * v34);
            v37 = [(AXMVisionResult *)self semanticTextFactory];
            v38 = [(AXMVisionResult *)self effectiveTextDetectionLocales];
            v39 = [v38 firstObject];
            char v40 = [v37 _textExistsInLexicon:v36 withLocale:v39];

            if ((v40 & 1) == 0 && ![v36 intValue])
            {

              goto LABEL_40;
            }
            v41 = [(__CFString *)v35 stringByAppendingString:@" "];
            v33 = [v41 stringByAppendingString:v36];

            ++v34;
            v35 = v33;
          }
          while (v31 != v34);
          uint64_t v31 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }
      else
      {
LABEL_40:
        v33 = &stru_1F0E72D10;
      }

      id v5 = v59;
      [v59 setObject:v33 forKey:@"AXMContent"];

      id v4 = v58;
      unint64_t v7 = v60;
      CGRect v22 = v63;
    }
    else
    {
      [v5 setObject:v22 forKey:@"AXMContent"];
    }
    v56 = (void *)MEMORY[0x1E4F29238];
    [v4 normalizedFrame];
    double v12 = objc_msgSend(v56, "axmValueWithCGRect:");
    [v5 setObject:v12 forKey:@"AXMBounds"];
  }

LABEL_44:

  return v5;
}

- (id)_processFeatureTree:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 featureType];
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  switch(v5)
  {
    case 5:
      unint64_t v7 = +[AXMVisionFeature nameForFeatureType:5];
      [v6 setObject:v7 forKey:@"AXMType"];

      long long v8 = [v4 faceDetectionResult];
      uint64_t v9 = [v8 likelyExpression];
      int v10 = NSString;
      uint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      double v12 = [v11 localizedStringForKey:@"description.face" value:&stru_1F0E72D10 table:@"Accessibility"];
      uint64_t v13 = +[AXMVisionFeatureFaceDetectionResult nameForFaceExpression:v9];
      id v14 = objc_msgSend(v10, "stringWithFormat:", v12, v13);
      [v6 setObject:v14 forKey:@"AXMContent"];

      uint64_t v15 = (void *)MEMORY[0x1E4F29238];
      [v4 normalizedFrame];
      uint64_t v16 = objc_msgSend(v15, "axmValueWithCGRect:");
      [v6 setObject:v16 forKey:@"AXMBounds"];

      goto LABEL_10;
    case 6:
    case 9:
      goto LABEL_11;
    case 7:
      CGRect v21 = +[AXMVisionFeature nameForFeatureType:7];
      [v6 setObject:v21 forKey:@"AXMType"];

      CGRect v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      CGRect v19 = v18;
      CGRect v20 = @"description.person";
      goto LABEL_6;
    case 8:
      [(AXMVisionResult *)self _processFeatureChild:v4];
      uint64_t v6 = v8 = v6;
      goto LABEL_10;
    case 10:
      CGRect v23 = +[AXMVisionFeature nameForFeatureType:10];
      [v6 setObject:v23 forKey:@"AXMType"];

      CGRect v19 = [v4 classificationLabel];
      [v6 setObject:v19 forKey:@"AXMContent"];
      goto LABEL_9;
    default:
      if (v5 != 19) {
        goto LABEL_11;
      }
      uint64_t v17 = +[AXMVisionFeature nameForFeatureType:19];
      [v6 setObject:v17 forKey:@"AXMType"];

      CGRect v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      CGRect v19 = v18;
      CGRect v20 = @"description.prominent.object";
LABEL_6:
      CGRect v22 = [v18 localizedStringForKey:v20 value:&stru_1F0E72D10 table:@"Accessibility"];
      [v6 setObject:v22 forKey:@"AXMContent"];

LABEL_9:
      v24 = (void *)MEMORY[0x1E4F29238];
      [v4 normalizedFrame];
      long long v8 = objc_msgSend(v24, "axmValueWithCGRect:");
      [v6 setObject:v8 forKey:@"AXMBounds"];
LABEL_10:

LABEL_11:
      return v6;
  }
}

- (NSDictionary)detectedFeatureDictionary
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  CGRect v20 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [(AXMVisionResult *)self evaluatedFeatureTypes];
  CGRect v23 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v3;
  uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __44__AXMVisionResult_detectedFeatureDictionary__block_invoke;
        v30[3] = &unk_1E6117918;
        v30[4] = v5;
        unint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v30];
        long long v8 = [(AXMVisionResult *)self features];
        uint64_t v9 = [v8 filteredArrayUsingPredicate:v7];

        int v10 = +[AXMVisionFeature nameForFeatureType:](AXMVisionFeature, "nameForFeatureType:", [v5 integerValue]);
        [v6 setObject:v10 forKey:@"AXMTypeContainer"];

        if ([v5 integerValue] == 8
          || [v5 integerValue] == 5
          || [v5 integerValue] == 10
          || [v5 integerValue] == 19
          || [v5 integerValue] == 7)
        {
          int v25 = v7;
          uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          double v12 = v9;
          id v13 = v9;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                CGRect v18 = [(AXMVisionResult *)self _processFeatureTree:*(void *)(*((void *)&v26 + 1) + 8 * j)];
                [v11 addObject:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
            }
            while (v15);
          }

          [v6 setObject:v11 forKey:@"AXMChildren"];
          unint64_t v7 = v25;
          uint64_t v9 = v12;
        }
        [v23 addObject:v6];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v24);
  }

  [v20 setObject:v23 forKey:@"AXMChildren"];

  return (NSDictionary *)v20;
}

BOOL __44__AXMVisionResult_detectedFeatureDictionary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "featureType"));
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)detectedFeatureDescriptionWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[AXMDescriptionBuilder builderWithOptions:7];
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    uint64_t v6 = [(AXMVisionResult *)self mediaAnalysisFaceFeatures];
    [v5 addMediaAnalysisDetectedFaces:v6];
  }
  else
  {
    uint64_t v6 = [(AXMVisionResult *)self faceFeatures];
    [v5 addDetectedFaces:v6];
  }

  unint64_t v7 = [(AXMVisionResult *)self captionFeatures];
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    uint64_t v8 = [(AXMVisionResult *)self mediaAnalysisImageCaptionFeatures];

    unint64_t v7 = (void *)v8;
  }
  if (![v7 count]
    || [(AXMVisionResult *)self includesNSFWFeatures]
    || [v7 count]
    && ([v7 firstObject],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isLowConfidence],
        v9,
        v10))
  {
    if (AXRuntimeCheck_MediaAnalysisSupport()) {
      [(AXMVisionResult *)self mediaAnalysisSceneClassificationFeatures];
    }
    else {
    uint64_t v11 = [(AXMVisionResult *)self sceneClassificationFeatures];
    }
    [v5 addDetectedClassificationFeatures:v11];
  }
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    double v12 = [(AXMVisionResult *)self mediaAnalysisImageCaptionFeatures];
    id v13 = [v12 firstObject];
    [v5 setMediaAnalysisDetectedImageCaption:v13];
  }
  else
  {
    double v12 = [(AXMVisionResult *)self captionFeatures];
    id v13 = [v12 firstObject];
    [v5 setDetectedCaption:v13];
  }

  objc_msgSend(v5, "setIsNSFW:", -[AXMVisionResult includesNSFWFeatures](self, "includesNSFWFeatures"));
  uint64_t v14 = [v4 objectForKeyedSubscript:@"ModifyForSensitiveContent"];

  objc_msgSend(v5, "setShouldModifyCaptionForSensitiveContent:", objc_msgSend(v14, "BOOLValue"));
  uint64_t v15 = [(AXMVisionResult *)self sensitiveContentForCaptionFeatures];
  uint64_t v16 = [v15 firstObject];
  [v5 setPrimarySensitiveContentFeature:v16];

  uint64_t v17 = [(AXMVisionResult *)self blurFeatures];
  CGRect v18 = [v17 firstObject];
  [v5 setBlurFeature:v18];

  CGRect v19 = [(AXMVisionResult *)self brightnessFeatures];
  CGRect v20 = [v19 firstObject];
  [v5 setBrightnessFeature:v20];

  CGRect v21 = [(AXMVisionResult *)self iconClassFeatures];
  [v5 addDetectedIconClasses:v21];

  uint64_t v22 = [v5 buildSpeakableDescription];

  return v22;
}

- (id)detectedCaptionFeatureDescriptionWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[AXMDescriptionBuilder builderWithOptions:3];
  uint64_t v6 = [(AXMVisionResult *)self captionFeatures];
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    uint64_t v7 = [(AXMVisionResult *)self mediaAnalysisImageCaptionFeatures];

    uint64_t v6 = (void *)v7;
  }
  if (![v6 count]
    || [(AXMVisionResult *)self includesNSFWFeatures]
    || [v6 count]
    && ([v6 firstObject],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isLowConfidence],
        v8,
        v9))
  {
    if (AXRuntimeCheck_MediaAnalysisSupport()) {
      [(AXMVisionResult *)self mediaAnalysisSceneClassificationFeatures];
    }
    else {
    int v10 = [(AXMVisionResult *)self sceneClassificationFeatures];
    }
    [v5 addDetectedClassificationFeatures:v10];
  }
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    uint64_t v11 = [(AXMVisionResult *)self mediaAnalysisImageCaptionFeatures];
    double v12 = [v11 firstObject];
    [v5 setMediaAnalysisDetectedImageCaption:v12];
  }
  else
  {
    uint64_t v11 = [(AXMVisionResult *)self captionFeatures];
    double v12 = [v11 firstObject];
    [v5 setDetectedCaption:v12];
  }

  objc_msgSend(v5, "setIsNSFW:", -[AXMVisionResult includesNSFWFeatures](self, "includesNSFWFeatures"));
  id v13 = [v4 objectForKeyedSubscript:@"ModifyForSensitiveContent"];

  objc_msgSend(v5, "setShouldModifyCaptionForSensitiveContent:", objc_msgSend(v13, "BOOLValue"));
  uint64_t v14 = [(AXMVisionResult *)self sensitiveContentForCaptionFeatures];
  uint64_t v15 = [v14 firstObject];
  [v5 setPrimarySensitiveContentFeature:v15];

  uint64_t v16 = [v5 buildSpeakableDescription];

  return v16;
}

- (id)detectedSceneClassificationFeatureDescriptionWithOptions:(id)a3
{
  id v4 = +[AXMDescriptionBuilder builderWithOptions:3];
  if (AXRuntimeCheck_MediaAnalysisSupport()) {
    [(AXMVisionResult *)self mediaAnalysisSceneClassificationFeatures];
  }
  else {
  uint64_t v5 = [(AXMVisionResult *)self sceneClassificationFeatures];
  }
  [v4 addDetectedClassificationFeatures:v5];

  uint64_t v6 = [v4 buildSpeakableDescription];

  return v6;
}

- (id)captionTranslationLocale
{
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    uint64_t v3 = [(AXMVisionResult *)self mediaAnalysisImageCaptionFeatures];
    id v4 = [v3 firstObject];
    [v4 mediaAnalysisTranslatedImageCaption];
  }
  else
  {
    uint64_t v3 = [(AXMVisionResult *)self captionFeatures];
    id v4 = [v3 firstObject];
    [v4 translatedCaption];
  uint64_t v5 = };
  uint64_t v6 = [v5 targetLocale];

  return v6;
}

- (NSString)localizedDetectedIconHint
{
  id v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  uint64_t v3 = [v2 localizedStringForKey:@"detected.icon.hint" value:&stru_1F0E72D10 table:@"Accessibility"];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXMVisionResult *)self _init];
  if (v5)
  {
    uint64_t v6 = AXMSecureCodingClasses();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:AXMVisionResultCodingKeyImage];
    [(AXMVisionResult *)v5 setImage:v7];

    uint64_t v8 = AXMSecureCodingClasses();
    int v9 = [v4 decodeObjectOfClasses:v8 forKey:AXMVisionResultCodingKeyFeatures];
    [(AXMVisionResult *)v5 setFeatures:v9];

    int v10 = AXMSecureCodingClasses();
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"detectedTextDescription"];
    [(AXMVisionResult *)v5 setDetectedTextDescription:v11];

    double v12 = AXMSecureCodingClasses();
    id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"detectedTextType"];
    [(AXMVisionResult *)v5 setDetectedTextType:v13];

    uint64_t v14 = AXMSecureCodingClasses();
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"detectedTextSummary"];
    [(AXMVisionResult *)v5 setDetectedTextSummary:v15];

    uint64_t v16 = AXMSecureCodingClasses();
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"appliedImageOrientation"];
    [(AXMVisionResult *)v5 setAppliedImageOrientation:v17];

    -[AXMVisionResult setImageRegistrationState:](v5, "setImageRegistrationState:", [v4 decodeIntegerForKey:@"imageRegistrationState"]);
    CGRect v18 = AXMSecureCodingClasses();
    CGRect v19 = [v4 decodeObjectOfClasses:v18 forKey:@"userContext"];
    [(AXMVisionResult *)v5 setUserContext:v19];

    CGRect v20 = AXMSecureCodingClasses();
    CGRect v21 = [v4 decodeObjectOfClasses:v20 forKey:@"equivalenceToken"];
    [(AXMVisionResult *)v5 setEquivalenceToken:v21];

    uint64_t v22 = AXMSecureCodingClasses();
    CGRect v23 = [v4 decodeObjectOfClasses:v22 forKey:@"brailleEdges"];
    [(AXMVisionResult *)v5 setBrailleEdges:v23];

    uint64_t v24 = AXMSecureCodingClasses();
    int v25 = [v4 decodeObjectOfClasses:v24 forKey:@"effectiveTextDetectionLocales"];
    [(AXMVisionResult *)v5 setEffectiveTextDetectionLocales:v25];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXMVisionResult *)self image];
  [v4 encodeObject:v5 forKey:AXMVisionResultCodingKeyImage];

  uint64_t v6 = [(AXMVisionResult *)self features];
  [v4 encodeObject:v6 forKey:AXMVisionResultCodingKeyFeatures];

  uint64_t v7 = [(AXMVisionResult *)self detectedTextDescription];
  [v4 encodeObject:v7 forKey:@"detectedTextDescription"];

  uint64_t v8 = [(AXMVisionResult *)self detectedTextType];
  [v4 encodeObject:v8 forKey:@"detectedTextType"];

  int v9 = [(AXMVisionResult *)self detectedTextSummary];
  [v4 encodeObject:v9 forKey:@"detectedTextSummary"];

  int v10 = [(AXMVisionResult *)self effectiveTextDetectionLocales];
  [v4 encodeObject:v10 forKey:@"effectiveTextDetectionLocales"];

  uint64_t v11 = [(AXMVisionResult *)self appliedImageOrientation];
  [v4 encodeObject:v11 forKey:@"appliedImageOrientation"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMVisionResult imageRegistrationState](self, "imageRegistrationState"), @"imageRegistrationState");
  double v12 = [(AXMVisionResult *)self userContext];
  [v4 encodeObject:v12 forKey:@"userContext"];

  id v13 = [(AXMVisionResult *)self equivalenceToken];
  [v4 encodeObject:v13 forKey:@"equivalenceToken"];

  uint64_t v14 = [(AXMVisionResult *)self brailleEdges];
  [v4 encodeObject:v14 forKey:@"brailleEdges"];

  id v15 = [(AXMVisionResult *)self metricSession];
  [v4 encodeObject:v15 forKey:@"metrics"];
}

- (NSDictionary)featureGates
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(AXMVisionResult *)self features];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v10 = [v9 featureGates];
        if (v10)
        {
          uint64_t v11 = [v9 featureGates];
          [v3 addEntriesFromDictionary:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (id)description
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"Locale";
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
  v12[1] = @"ModifyForSensitiveContent";
  v13[0] = v3;
  v13[1] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v5 = [(AXMVisionResult *)self detectedFeatureDescriptionWithOptions:v4];

  uint64_t v6 = NSString;
  uint64_t v7 = [(AXMVisionResult *)self image];
  uint64_t v8 = [(AXMVisionResult *)self features];
  int v9 = [(AXMVisionResult *)self detectedTextDescription];
  int v10 = [v6 stringWithFormat:@"AXMVisionResult<%p>: Image:%@ Results:%@ Feature Description: '%@'. Text Description: '%@'.", self, v7, v8, v5, v9];

  return v10;
}

- (CIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (NSSet)evaluatedFeatureTypes
{
  return self->_evaluatedFeatureTypes;
}

- (void)setEvaluatedFeatureTypes:(id)a3
{
}

- (NSNumber)appliedImageOrientation
{
  return self->_appliedImageOrientation;
}

- (void)setAppliedImageOrientation:(id)a3
{
}

- (void)setDetectedTextDescription:(id)a3
{
}

- (NSArray)effectiveTextDetectionLocales
{
  return self->_effectiveTextDetectionLocales;
}

- (void)setEffectiveTextDetectionLocales:(id)a3
{
}

- (void)setDetectedTextSummary:(id)a3
{
}

- (void)setDetectedTextType:(id)a3
{
}

- (AXMetricSession)metricSession
{
  return self->_metricSession;
}

- (void)setMetricSession:(id)a3
{
}

- (int64_t)imageRegistrationState
{
  return self->_imageRegistrationState;
}

- (void)setImageRegistrationState:(int64_t)a3
{
  self->_imageRegistrationState = a3;
}

- (NSSecureCoding)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (NSData)equivalenceToken
{
  return self->_equivalenceToken;
}

- (void)setEquivalenceToken:(id)a3
{
}

- (NSData)brailleEdges
{
  return self->_brailleEdges;
}

- (void)setBrailleEdges:(id)a3
{
}

- (void)setSemanticTextFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticTextFactory, 0);
  objc_storeStrong((id *)&self->_brailleEdges, 0);
  objc_storeStrong((id *)&self->_equivalenceToken, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_metricSession, 0);
  objc_storeStrong((id *)&self->_detectedTextType, 0);
  objc_storeStrong((id *)&self->_detectedTextSummary, 0);
  objc_storeStrong((id *)&self->_effectiveTextDetectionLocales, 0);
  objc_storeStrong((id *)&self->_detectedTextDescription, 0);
  objc_storeStrong((id *)&self->_appliedImageOrientation, 0);
  objc_storeStrong((id *)&self->_evaluatedFeatureTypes, 0);
  objc_storeStrong((id *)&self->_features, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (NSArray)faceFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_306);

  return (NSArray *)v3;
}

uint64_t __65__AXMVisionResult_AXMVisionEngineLookupConvenience__faceFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFace];
}

- (NSArray)sceneClassificationFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_308);

  return (NSArray *)v3;
}

uint64_t __80__AXMVisionResult_AXMVisionEngineLookupConvenience__sceneClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSceneClassification];
}

- (NSArray)objectClassificationFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_310);

  return (NSArray *)v3;
}

uint64_t __81__AXMVisionResult_AXMVisionEngineLookupConvenience__objectClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isObjectClassification];
}

- (NSArray)captionFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_312);

  return (NSArray *)v3;
}

uint64_t __68__AXMVisionResult_AXMVisionEngineLookupConvenience__captionFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCaption];
}

- (NSArray)mediaAnalysisImageCaptionFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_314);

  return (NSArray *)v3;
}

uint64_t __86__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisImageCaptionFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMediaAnalysisImageCaption];
}

- (NSArray)mediaAnalysisSceneClassificationFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_316_0);

  return (NSArray *)v3;
}

uint64_t __93__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisSceneClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMediaAnalysisSceneClassification];
}

- (NSArray)mediaAnalysisObjectClassificationFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_318);

  return (NSArray *)v3;
}

uint64_t __94__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisObjectClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMediaAnalysisObjectClassification];
}

- (NSArray)mediaAnalysisNSFWClassificationFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_320);

  return (NSArray *)v3;
}

uint64_t __92__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisNSFWClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMediaAnalysisNSFWClassification];
}

- (NSArray)mediaAnalysisSignificantEventClassificationFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_322);

  return (NSArray *)v3;
}

uint64_t __104__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisSignificantEventClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMediaAnalysisSignificantEventClassification];
}

- (NSArray)mediaAnalysisFaceFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_324);

  return (NSArray *)v3;
}

uint64_t __78__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisFaceFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMediaAnalysisFace];
}

- (BOOL)includesNSFWFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_326);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

uint64_t __73__AXMVisionResult_AXMVisionEngineLookupConvenience__includesNSFWFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (AXRuntimeCheck_MediaAnalysisSupport()) {
    uint64_t v3 = [v2 isMediaAnalysisNSFWClassification];
  }
  else {
    uint64_t v3 = [v2 isNSFWClassification];
  }
  uint64_t v4 = v3;

  return v4;
}

- (NSArray)modelClassificationFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_328);

  return (NSArray *)v3;
}

uint64_t __80__AXMVisionResult_AXMVisionEngineLookupConvenience__modelClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isModelClassification];
}

- (NSArray)ocrFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_330);

  return (NSArray *)v3;
}

uint64_t __64__AXMVisionResult_AXMVisionEngineLookupConvenience__ocrFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isOCR];
}

- (NSArray)blurFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_332);

  return (NSArray *)v3;
}

uint64_t __65__AXMVisionResult_AXMVisionEngineLookupConvenience__blurFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBlur];
}

- (NSArray)brightnessFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_334);

  return (NSArray *)v3;
}

uint64_t __71__AXMVisionResult_AXMVisionEngineLookupConvenience__brightnessFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBrightness];
}

- (NSArray)iconClassFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_336);

  return (NSArray *)v3;
}

uint64_t __70__AXMVisionResult_AXMVisionEngineLookupConvenience__iconClassFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isIconClass];
}

- (id)sensitiveContentFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_338);

  return v3;
}

uint64_t __77__AXMVisionResult_AXMVisionEngineLookupConvenience__sensitiveContentFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 captionMayContainSensitiveContent];
}

- (NSArray)sensitiveContentForCaptionFeatures
{
  id v2 = [(AXMVisionResult *)self features];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_340);

  return (NSArray *)v3;
}

uint64_t __87__AXMVisionResult_AXMVisionEngineLookupConvenience__sensitiveContentForCaptionFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isMediaAnalysisImageCaption]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 captionMayContainSensitiveContent];
  }

  return v3;
}

- (BOOL)captionMayContainSensitiveContent
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(AXMVisionResult *)self captionFeatures];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) captionMayContainSensitiveContent])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)includesFeaturesForImageExploration
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = [(AXMVisionResult *)self features];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__AXMVisionResult_AXMVisionEngineLookupConvenience__includesFeaturesForImageExploration__block_invoke;
  v4[3] = &unk_1E6117950;
  v4[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

void __88__AXMVisionResult_AXMVisionEngineLookupConvenience__includesFeaturesForImageExploration__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 featureType];
  switch(v3)
  {
    case 5:
    case 6:
    case 8:
      goto LABEL_2;
    case 7:
    case 9:
    case 11:
    case 12:
      goto LABEL_9;
    case 10:
      goto LABEL_6;
    case 13:
      uint64_t v7 = [v9 assetMetadata];
      char v8 = [v7 localIdentifier];

      if (v8) {
LABEL_2:
      }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      goto LABEL_9;
    default:
      if (v3 == 27) {
        goto LABEL_6;
      }
      if (v3 == 31)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_6:
        uint64_t v4 = +[AXMPhotoVisionSupport _deniedVoiceOverObjectClassificationLabels];
        uint64_t v5 = [v9 classificationLabel];
        char v6 = [v4 containsObject:v5];

        if ((v6 & 1) == 0) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        }
      }
LABEL_9:

      return;
  }
}

@end