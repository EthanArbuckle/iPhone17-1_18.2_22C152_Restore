@interface AXMDescriptionBuilder
+ (id)builderWithOptions:(int64_t)a3;
- (AXMVisionFeature)blurFeature;
- (AXMVisionFeature)brightnessFeature;
- (AXMVisionFeature)primarySensitiveContentFeature;
- (BOOL)_shouldPersonalizeCaptionWithKnownPeople;
- (BOOL)_shouldReplaceCaptionWithGenericTemplate;
- (BOOL)_shouldSummarizeDetectedPeople;
- (BOOL)_usesTemplateForLowConfidenceAndExplicitFeatures;
- (BOOL)isNSFW;
- (BOOL)shouldModifyCaptionForSensitiveContent;
- (id)_ignoredTagsForTags:(id)a3;
- (id)_initWithOptions:(int64_t)a3;
- (id)_knownPersonNames;
- (id)_stringForPauseType:(int64_t)a3;
- (id)_subsumedTagsForTags:(id)a3;
- (id)_templateRulesForTag:(id)a3;
- (id)buildSpeakableDescription;
- (void)_addBlurInformationToDescription:(id)a3;
- (void)_addBrightnessInformationToDescription:(id)a3;
- (void)_addCaptionInformationToDescription:(id)a3 didConsumeDetectedFaceInfo:(BOOL *)a4;
- (void)_addClassificationInformationToDescription:(id)a3;
- (void)_addDetailedFaceInformationToDescription:(id)a3;
- (void)_addFaceInformationToDescription:(id)a3;
- (void)_addGenericTemplateForCaptionInformationToDescription:(id)a3;
- (void)_addIconClassInformationToDescription:(id)a3;
- (void)_addPersonSummaryToDescription:(id)a3;
- (void)_appendPauseType:(int64_t)a3 toDescriptionIfNeeded:(id)a4;
- (void)_appendToDescription:(id)a3 afterPauseType:(int64_t)a4 withContents:(id)a5;
- (void)addDetectedClassificationFeatures:(id)a3;
- (void)addDetectedClassificationLocalizedValue:(id)a3 forLabel:(id)a4;
- (void)addDetectedFaces:(id)a3;
- (void)addDetectedIconClasses:(id)a3;
- (void)addMediaAnalysisDetectedFaces:(id)a3;
- (void)setBlurFeature:(id)a3;
- (void)setBrightnessFeature:(id)a3;
- (void)setDetectedCaption:(id)a3;
- (void)setIsNSFW:(BOOL)a3;
- (void)setMediaAnalysisDetectedImageCaption:(id)a3;
- (void)setPrimarySensitiveContentFeature:(id)a3;
- (void)setShouldModifyCaptionForSensitiveContent:(BOOL)a3;
@end

@implementation AXMDescriptionBuilder

+ (id)builderWithOptions:(int64_t)a3
{
  id v3 = [[AXMDescriptionBuilder alloc] _initWithOptions:a3];

  return v3;
}

- (id)_initWithOptions:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXMDescriptionBuilder;
  id result = [(AXMDescriptionBuilder *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (void)addDetectedFaces:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    faceFeatures = self->_faceFeatures;
    if (!faceFeatures)
    {
      objc_super v5 = [MEMORY[0x1E4F1CA48] array];
      v6 = self->_faceFeatures;
      self->_faceFeatures = v5;

      faceFeatures = self->_faceFeatures;
    }
    [(NSMutableArray *)faceFeatures addObjectsFromArray:v7];
  }
}

- (void)addMediaAnalysisDetectedFaces:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    mediaAnalysisFaceFeatures = self->_mediaAnalysisFaceFeatures;
    if (!mediaAnalysisFaceFeatures)
    {
      objc_super v5 = [MEMORY[0x1E4F1CA48] array];
      v6 = self->_mediaAnalysisFaceFeatures;
      self->_mediaAnalysisFaceFeatures = v5;

      mediaAnalysisFaceFeatures = self->_mediaAnalysisFaceFeatures;
    }
    [(NSMutableArray *)mediaAnalysisFaceFeatures addObjectsFromArray:v7];
  }
}

- (void)setMediaAnalysisDetectedImageCaption:(id)a3
{
}

- (void)addDetectedClassificationFeatures:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v9 classificationLocalizedValue];
        v11 = [v9 classificationLabel];
        [(AXMDescriptionBuilder *)self addDetectedClassificationLocalizedValue:v10 forLabel:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)addDetectedClassificationLocalizedValue:(id)a3 forLabel:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 length] && objc_msgSend(v6, "length"))
  {
    classificationLabelsToLocValuesMap = self->_classificationLabelsToLocValuesMap;
    if (!classificationLabelsToLocValuesMap)
    {
      v8 = [MEMORY[0x1E4F1CA60] dictionary];
      v9 = self->_classificationLabelsToLocValuesMap;
      self->_classificationLabelsToLocValuesMap = v8;

      classificationLabelsToLocValuesMap = self->_classificationLabelsToLocValuesMap;
    }
    [(NSMutableDictionary *)classificationLabelsToLocValuesMap setObject:v10 forKeyedSubscript:v6];
  }
}

- (void)setDetectedCaption:(id)a3
{
}

- (void)addDetectedIconClasses:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    iconClassFeatures = self->_iconClassFeatures;
    if (!iconClassFeatures)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
      id v6 = self->_iconClassFeatures;
      self->_iconClassFeatures = v5;

      iconClassFeatures = self->_iconClassFeatures;
    }
    [(NSMutableArray *)iconClassFeatures addObjectsFromArray:v7];
  }
}

- (BOOL)_usesTemplateForLowConfidenceAndExplicitFeatures
{
  return self->_builderOptions & 1;
}

- (BOOL)_shouldSummarizeDetectedPeople
{
  return (LOBYTE(self->_builderOptions) >> 1) & 1;
}

- (BOOL)_shouldPersonalizeCaptionWithKnownPeople
{
  return (LOBYTE(self->_builderOptions) >> 2) & 1;
}

- (BOOL)_shouldReplaceCaptionWithGenericTemplate
{
  if ([(AXMDescriptionBuilder *)self _usesTemplateForLowConfidenceAndExplicitFeatures])
  {
    id v3 = self->_captionFeature;
    if (AXRuntimeCheck_MediaAnalysisSupport())
    {
      id v4 = self->_mediaAnalysisImageCaptionFeature;

      id v3 = v4;
    }
    uint64_t v5 = [(AXMVisionFeature *)v3 isLowConfidence];
    if (v5)
    {
      id v6 = @"caption-low-confidence";
    }
    else
    {
      uint64_t v5 = [(AXMDescriptionBuilder *)self isNSFW];
      if (!v5)
      {
        BOOL v7 = 0;
        goto LABEL_11;
      }
      id v6 = @"caption-nsfw";
    }
    __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke(v5, v6);
    BOOL v7 = 1;
LABEL_11:

    return v7;
  }
  return 0;
}

void __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (CoreAnalyticsLibraryCore())
  {
    id v3 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke_2;
    block[3] = &unk_1E6117090;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke_3;
  v4[3] = &unk_1E6117068;
  id v5 = *(id *)(a1 + 32);
  v1 = v4;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v2 = (void (*)(__CFString *, void *))getAnalyticsSendEventLazySymbolLoc_ptr;
  id v10 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
    v6[3] = &unk_1E6116AD8;
    v6[4] = &v7;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke((uint64_t)v6);
    id v2 = (void (*)(__CFString *, void *))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v3 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v3);
  }
  v2(@"com.apple.accessibility.vot.caption.fallbacktemplates", v1);
}

id __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"fallbacktemplate";
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)buildSpeakableDescription
{
  speakableDescription = self->_speakableDescription;
  if (speakableDescription)
  {
    id v3 = speakableDescription;
    goto LABEL_13;
  }
  id v5 = [MEMORY[0x1E4F28E78] string];
  id v6 = self->_speakableDescription;
  self->_speakableDescription = v5;

  char v12 = 0;
  uint64_t v7 = self->_captionFeature;
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    v8 = self->_mediaAnalysisImageCaptionFeature;

    uint64_t v7 = v8;
  }
  if (v7)
  {
    BOOL v9 = [(AXMDescriptionBuilder *)self _shouldReplaceCaptionWithGenericTemplate];
    id v10 = self->_speakableDescription;
    if (v9) {
      [(AXMDescriptionBuilder *)self _addGenericTemplateForCaptionInformationToDescription:v10];
    }
    else {
      [(AXMDescriptionBuilder *)self _addCaptionInformationToDescription:v10 didConsumeDetectedFaceInfo:&v12];
    }
  }
  [(AXMDescriptionBuilder *)self _addBrightnessInformationToDescription:self->_speakableDescription];
  [(AXMDescriptionBuilder *)self _addBlurInformationToDescription:self->_speakableDescription];
  if (!v12)
  {
    [(AXMDescriptionBuilder *)self _addFaceInformationToDescription:self->_speakableDescription];
    char v12 = 1;
    if (v7) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v7) {
LABEL_11:
  }
    [(AXMDescriptionBuilder *)self _addClassificationInformationToDescription:self->_speakableDescription];
LABEL_12:
  [(AXMDescriptionBuilder *)self _addIconClassInformationToDescription:self->_speakableDescription];
  id v3 = self->_speakableDescription;

LABEL_13:

  return v3;
}

- (id)_stringForPauseType:(int64_t)a3
{
  if (a3) {
    return @".";
  }
  else {
    return @",";
  }
}

- (void)_appendPauseType:(int64_t)a3 toDescriptionIfNeeded:(id)a4
{
  id v7 = a4;
  if ([v7 length]
    && ([v7 hasSuffix:@","] & 1) == 0
    && ([v7 hasSuffix:@"."] & 1) == 0)
  {
    id v6 = [(AXMDescriptionBuilder *)self _stringForPauseType:a3];
    [v7 appendFormat:@"%@ ", v6];
  }
}

- (void)_appendToDescription:(id)a3 afterPauseType:(int64_t)a4 withContents:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if ([v8 length])
  {
    [(AXMDescriptionBuilder *)self _appendPauseType:a4 toDescriptionIfNeeded:v9];
    [v9 appendString:v8];
  }
}

- (void)_addBrightnessInformationToDescription:(id)a3
{
  brightnessFeature = self->_brightnessFeature;
  if (brightnessFeature)
  {
    id v5 = a3;
    [(AXMVisionFeature *)brightnessFeature brightness];
    if (v6 <= 0.2)
    {
      id v7 = @"photo.description.brightness.level.1";
    }
    else if (v6 <= 0.4)
    {
      id v7 = @"photo.description.brightness.level.2";
    }
    else if (v6 <= 0.6)
    {
      id v7 = @"photo.description.brightness.level.3";
    }
    else if (v6 <= 0.8)
    {
      id v7 = @"photo.description.brightness.level.4";
    }
    else
    {
      id v7 = @"photo.description.brightness.level.5";
    }
    id v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    id v8 = [v9 localizedStringForKey:v7 value:&stru_1F0E72D10 table:@"Accessibility"];
    [(AXMDescriptionBuilder *)self _appendToDescription:v5 afterPauseType:0 withContents:v8];
  }
}

- (void)_addBlurInformationToDescription:(id)a3
{
  blurFeature = self->_blurFeature;
  if (blurFeature)
  {
    id v5 = a3;
    [(AXMVisionFeature *)blurFeature blur];
    if (v6 >= 0.166666667)
    {
      if (v6 >= 0.333333333)
      {
        if (v6 >= 0.5)
        {
          if (v6 >= 0.666666667)
          {
            if (v6 >= 0.833333333) {
              id v7 = @"photo.description.blurriness.level.6";
            }
            else {
              id v7 = @"photo.description.blurriness.level.5";
            }
          }
          else
          {
            id v7 = @"photo.description.blurriness.level.4";
          }
        }
        else
        {
          id v7 = @"photo.description.blurriness.level.3";
        }
      }
      else
      {
        id v7 = @"photo.description.blurriness.level.2";
      }
    }
    else
    {
      id v7 = @"photo.description.blurriness.level.1";
    }
    id v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    id v8 = [v9 localizedStringForKey:v7 value:&stru_1F0E72D10 table:@"Accessibility"];
    [(AXMDescriptionBuilder *)self _appendToDescription:v5 afterPauseType:0 withContents:v8];
  }
}

- (id)_knownPersonNames
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_faceFeatures count];
  id v4 = self->_faceFeatures;
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    uint64_t v3 = [(NSMutableArray *)self->_mediaAnalysisFaceFeatures count];
    id v5 = self->_mediaAnalysisFaceFeatures;

    id v4 = v5;
  }
  if (v3)
  {
    double v6 = [MEMORY[0x1E4F1CA80] set];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v4;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          char v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v13 = objc_msgSend(v12, "faceDetectionResult", (void)v18);
          if (AXRuntimeCheck_MediaAnalysisSupport())
          {
            uint64_t v14 = [v12 mediaAnalysisFaceDetectionResult];

            long long v13 = (void *)v14;
          }
          long long v15 = [v13 name];
          if ([v15 length]) {
            [v6 addObject:v15];
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    v16 = [v6 allObjects];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (void)_addPersonSummaryToDescription:(id)a3
{
  id v15 = a3;
  id v4 = [(AXMDescriptionBuilder *)self _knownPersonNames];
  if ([v4 count])
  {
    if ([v4 count] == 1)
    {
      id v5 = NSString;
      double v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v7 = [v6 localizedStringForKey:@"people.summary.one.person" value:&stru_1F0E72D10 table:@"Accessibility"];
      uint64_t v8 = [v4 firstObject];
      uint64_t v9 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);
      [(AXMDescriptionBuilder *)self _appendToDescription:v15 afterPauseType:0 withContents:v9];
    }
    else
    {
      double v6 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v4];
      uint64_t v10 = [(NSMutableArray *)self->_faceFeatures count];
      if (AXRuntimeCheck_MediaAnalysisSupport()) {
        uint64_t v10 = [(NSMutableArray *)self->_mediaAnalysisFaceFeatures count];
      }
      v11 = NSString;
      id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      uint64_t v8 = [v7 localizedStringForKey:@"people.summary.multiple.people" value:&stru_1F0E72D10 table:@"Accessibility"];
      char v12 = (void *)MEMORY[0x1E4F28EE0];
      uint64_t v9 = [NSNumber numberWithInteger:v10];
      long long v13 = [v12 localizedStringFromNumber:v9 numberStyle:0];
      uint64_t v14 = objc_msgSend(v11, "localizedStringWithFormat:", v8, v13, v6);
      [(AXMDescriptionBuilder *)self _appendToDescription:v15 afterPauseType:0 withContents:v14];
    }
  }
}

- (void)_addDetailedFaceInformationToDescription:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_faceFeatures;
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    double v6 = self->_mediaAnalysisFaceFeatures;

    id v5 = v6;
  }
  if ([(NSMutableArray *)v5 count])
  {
    [(NSMutableArray *)v5 sortUsingComparator:&__block_literal_global_109];
    id v7 = NSString;
    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v9 = [v8 localizedStringForKey:@"photo.description.faces" value:&stru_1F0E72D10 table:@"Accessibility"];
    uint64_t v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, -[NSMutableArray count](v5, "count"));
    [(AXMDescriptionBuilder *)self _appendToDescription:v4 afterPauseType:0 withContents:v10];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v45 = v5;
    char v12 = v5;
    obuint64_t j = (id)[(NSMutableArray *)v12 countByEnumeratingWithState:&v56 objects:v61 count:16];
    id v51 = v11;
    if (obj)
    {
      uint64_t v47 = 1;
      uint64_t v48 = *(void *)v57;
      unint64_t v13 = 0x1E4F28000uLL;
      v46 = self;
      do
      {
        for (uint64_t i = 0; i != obj; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v57 != v48) {
            objc_enumerationMutation(v12);
          }
          id v15 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v16 = [v15 faceDetectionResult];
          if (AXRuntimeCheck_MediaAnalysisSupport())
          {
            uint64_t v17 = [v15 mediaAnalysisFaceDetectionResult];

            v16 = (void *)v17;
          }
          uint64_t v18 = [v16 likelyExpression];
          if ((v18 & 0xFFFFFFFFFFFFFFFDLL) != 0)
          {
            uint64_t v19 = v18;
            [*(id *)(v13 + 3792) numberWithInteger:v18];
            v21 = unint64_t v20 = v13;
            v22 = [v11 objectForKey:v21];

            if (v22)
            {
              uint64_t v23 = objc_msgSend(*(id *)(v20 + 3792), "numberWithInteger:", objc_msgSend(v22, "integerValue") + 1);
              v24 = [*(id *)(v20 + 3792) numberWithInteger:v19];
              [v11 setObject:v23 forKey:v24];
            }
            else
            {
              uint64_t v23 = [*(id *)(v20 + 3792) numberWithInteger:v19];
              [v11 setObject:&unk_1F0E934C0 forKey:v23];
            }

            unint64_t v13 = 0x1E4F28000;
          }
          v25 = [v16 attributes];
          if ([(NSMutableArray *)v12 count] != 1)
          {
            v26 = NSString;
            v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
            v28 = [v27 localizedStringForKey:@"face.number" value:&stru_1F0E72D10 table:@"Accessibility"];
            self = v46;
            v29 = objc_msgSend(v26, "localizedStringWithFormat:", v28, (char *)i + v47);
            [(AXMDescriptionBuilder *)v46 _appendToDescription:v4 afterPauseType:0 withContents:v29];

            id v11 = v51;
            unint64_t v13 = 0x1E4F28000;
          }
          v30 = [v16 name];
          [(AXMDescriptionBuilder *)self _appendToDescription:v4 afterPauseType:0 withContents:v30];

          v31 = [v25 accessibilityLabelForAttributes];
          [(AXMDescriptionBuilder *)self _appendToDescription:v4 afterPauseType:0 withContents:v31];
        }
        uint64_t v47 = (v47 + i);
        obuint64_t j = (id)[(NSMutableArray *)v12 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (obj);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obja = [v11 allKeys];
    uint64_t v32 = [obja countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v53 != v34) {
            objc_enumerationMutation(obja);
          }
          uint64_t v36 = *(void *)(*((void *)&v52 + 1) + 8 * j);
          v37 = [v11 objectForKey:v36];
          uint64_t v38 = [v37 integerValue];

          v39 = +[AXMVisionFeatureFaceDetectionResult localizedStringFormatterForExpression:v36];
          v40 = NSString;
          v41 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
          v42 = [v41 localizedStringForKey:v39 value:&stru_1F0E72D10 table:@"Accessibility"];
          v43 = v40;
          id v11 = v51;
          v44 = objc_msgSend(v43, "localizedStringWithFormat:", v42, v38);
          [(AXMDescriptionBuilder *)self _appendToDescription:v4 afterPauseType:0 withContents:v44];
        }
        uint64_t v33 = [obja countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v33);
    }

    id v5 = v45;
  }
}

uint64_t __66__AXMDescriptionBuilder__addDetailedFaceInformationToDescription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v6 = [v4 faceDetectionResult];
  id v7 = [v6 name];

  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    uint64_t v8 = [v4 mediaAnalysisFaceDetectionResult];
    uint64_t v9 = [v8 name];

    id v7 = (void *)v9;
  }
  uint64_t v10 = [v5 faceDetectionResult];
  id v11 = [v10 name];

  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    char v12 = [v5 mediaAnalysisFaceDetectionResult];
    uint64_t v13 = [v12 name];

    id v11 = (void *)v13;
  }
  uint64_t v14 = 0;
  if (v7 && v11) {
    uint64_t v14 = [v7 compare:v11];
  }

  return v14;
}

- (void)_addFaceInformationToDescription:(id)a3
{
  id v4 = a3;
  if ([(AXMDescriptionBuilder *)self _shouldSummarizeDetectedPeople]) {
    [(AXMDescriptionBuilder *)self _addPersonSummaryToDescription:v4];
  }
  else {
    [(AXMDescriptionBuilder *)self _addDetailedFaceInformationToDescription:v4];
  }
}

- (void)_addCaptionInformationToDescription:(id)a3 didConsumeDetectedFaceInfo:(BOOL *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self->_captionFeature;
  uint64_t v8 = [(AXMVisionFeature *)v7 translatedCaption];
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    uint64_t v9 = self->_mediaAnalysisImageCaptionFeature;

    uint64_t v10 = [(AXMVisionFeature *)v9 mediaAnalysisTranslatedImageCaption];

    uint64_t v8 = (void *)v10;
    id v7 = v9;
  }
  if (v8)
  {
    id v11 = +[AXMLocSupport sharedInstance];
    char v12 = [v8 targetLocale];
    char v13 = [v11 localeBaseLanguageIsEnglish:v12];

    uint64_t v14 = [v8 text];
    id v15 = v14;
    if ((v13 & 1) == 0)
    {
LABEL_72:
      [(AXMDescriptionBuilder *)self _appendToDescription:v6 afterPauseType:0 withContents:v15];
      goto LABEL_73;
    }
    if (![v14 length])
    {
LABEL_73:

      goto LABEL_74;
    }
    if (![(AXMDescriptionBuilder *)self _shouldPersonalizeCaptionWithKnownPeople])
    {
LABEL_38:
      if (![(AXMDescriptionBuilder *)self shouldModifyCaptionForSensitiveContent])goto LABEL_72; {
      uint64_t v32 = [(AXMDescriptionBuilder *)self primarySensitiveContentFeature];
      }

      if (!v32) {
        goto LABEL_72;
      }
      uint64_t v33 = [(AXMDescriptionBuilder *)self primarySensitiveContentFeature];
      uint64_t v34 = [v33 classificationLabel];

      if ([v34 isEqualToString:@"Blood"]
        && ([v15 containsString:@"blood"] & 1) == 0)
      {
        v35 = @" that might contain blood";
      }
      else if ([v34 isEqualToString:@"Demonstration"] {
             && ([v15 containsString:@"demonstration"] & 1) == 0)
      }
      {
        v35 = @" that might be a demonstration";
      }
      else
      {
        if (![v34 isEqualToString:@"Destruction"])
        {
          if ([v34 isEqualToString:@"Fire Devastation"]
            && ([v15 containsString:@"fire"] & 1) == 0)
          {
            v35 = @" that might include fire";
            goto LABEL_70;
          }
          if ([v34 isEqualToString:@"Flood Devastation"]
            && ([v15 containsString:@"flood"] & 1) == 0)
          {
            v35 = @" that might be a flood";
            goto LABEL_70;
          }
          if ([v34 isEqualToString:@"Funeral"]
            && ([v15 containsString:@"funeral"] & 1) == 0)
          {
            v35 = @" that might be a funeral";
            goto LABEL_70;
          }
          if ([v34 isEqualToString:@"Hospital"]
            && ([v15 containsString:@"hospital"] & 1) == 0)
          {
            v35 = @" that might be a hospital";
            goto LABEL_70;
          }
          if ([v34 isEqualToString:@"Religious Setting"]
            && ([v15 containsString:@"religious"] & 1) == 0)
          {
            v35 = @" that might be a religious setting";
            goto LABEL_70;
          }
          if ([v34 isEqualToString:@"Vehicle Crash"]
            && ([v15 containsString:@"crash"] & 1) == 0)
          {
            v35 = @" that might be a vehicle crash";
            goto LABEL_70;
          }
          if (![v34 isEqualToString:@"War"]
            || ([v15 containsString:@"war"] & 1) != 0)
          {
            uint64_t v36 = AXMediaLogCommon();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              -[AXMDescriptionBuilder _addCaptionInformationToDescription:didConsumeDetectedFaceInfo:](self, v36);
            }
            goto LABEL_71;
          }
        }
        v35 = @" that might be a scene of destruction";
      }
LABEL_70:
      [v15 stringByAppendingString:v35];
      id v15 = v36 = v15;
LABEL_71:

      goto LABEL_72;
    }
    v16 = [(AXMDescriptionBuilder *)self _knownPersonNames];
    if ([v16 count] != 1)
    {
LABEL_37:

      goto LABEL_38;
    }
    uint64_t v17 = [v16 firstObject];
    id v50 = 0;
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^(?!.*?\\b(person|people|child|children|baby|babies)\\b.*?\\ba\\s+person\\b)(?!.*?\\ba\\s+person\\b.*?\\b(person|people|child|children|baby|babies)\\b)(?<prefix>.*?)\\ba\\s+person(\\s+that\\s+is\\b)?\\b(?<suffix>.*)$" options:3 error:&v50];
    id v40 = v50;
    if (v40)
    {
      uint64_t v19 = AXMediaLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        unint64_t v20 = v40;
        -[AXMDescriptionBuilder _addCaptionInformationToDescription:didConsumeDetectedFaceInfo:]((uint64_t)v40, v19);
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      v39 = v18;
      objc_msgSend(v18, "matchesInString:options:range:", v15, 0, 0, -[NSObject length](v15, "length"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v43)
      {
        v37 = v17;
        uint64_t v38 = v16;
        uint64_t v41 = *(void *)v47;
        while (2)
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v47 != v41) {
              objc_enumerationMutation(v19);
            }
            v22 = v19;
            uint64_t v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            uint64_t v24 = [v23 rangeWithName:@"prefix"];
            if (v24 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v26 = 0;
            }
            else
            {
              -[NSObject substringWithRange:](v15, "substringWithRange:", v24, v25);
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            uint64_t v27 = [v23 rangeWithName:@"suffix"];
            if (v27 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v29 = 0;
            }
            else
            {
              -[NSObject substringWithRange:](v15, "substringWithRange:", v27, v28);
              v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            if ([(__CFString *)v26 length] || [(__CFString *)v29 length])
            {
              v44 = NSString;
              if ([(__CFString *)v26 length]) {
                v30 = v26;
              }
              else {
                v30 = &stru_1F0E72D10;
              }
              v42 = v30;
              if ([(__CFString *)v29 length]) {
                v31 = v29;
              }
              else {
                v31 = &stru_1F0E72D10;
              }
              uint64_t v17 = v37;
              uint64_t v45 = [v44 stringWithFormat:@"%@%@%@", v42, v37, v31];

              *a4 = 1;
              id v15 = v45;
              v16 = v38;
              uint64_t v19 = v22;
              goto LABEL_34;
            }

            uint64_t v19 = v22;
          }
          uint64_t v43 = [v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v43) {
            continue;
          }
          break;
        }
        uint64_t v17 = v37;
        v16 = v38;
      }
LABEL_34:

      uint64_t v18 = v39;
    }
    unint64_t v20 = v40;
    goto LABEL_36;
  }
LABEL_74:
}

- (id)_templateRulesForTag:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AXMDescriptionBuilder__templateRulesForTag___block_invoke;
  block[3] = &unk_1E6117090;
  void block[4] = self;
  uint64_t v3 = _templateRulesForTag__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_templateRulesForTag__onceToken, block);
  }
  id v5 = [(id)_templateRulesForTag___TemplateRules objectForKey:v4];

  return v5;
}

void __46__AXMDescriptionBuilder__templateRulesForTag___block_invoke()
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v0 = [v3 pathForResource:@"AXCaptionTemplateRules" ofType:@"plist"];
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v0];
  id v2 = (void *)_templateRulesForTag___TemplateRules;
  _templateRulesForTag___TemplateRules = v1;
}

- (id)_subsumedTagsForTags:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[AXMDescriptionBuilder _templateRulesForTag:](self, "_templateRulesForTag:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        char v12 = [v11 objectForKeyedSubscript:@"subsume"];
        if ([v12 count]) {
          [v5 addObjectsFromArray:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_ignoredTagsForTags:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([(AXMDescriptionBuilder *)self isNSFW]
          && [v11 isEqualToString:@"baby"])
        {
          [v5 addObject:v11];
        }
        else
        {
          char v12 = [(AXMDescriptionBuilder *)self _templateRulesForTag:v11];
          char v13 = [v12 objectForKeyedSubscript:@"ignored"];
          int v14 = [v13 BOOLValue];

          if (v14) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_addGenericTemplateForCaptionInformationToDescription:(id)a3
{
  id v4 = a3;
  if ([(AXMDescriptionBuilder *)self shouldModifyCaptionForSensitiveContent]
    && [(AXMDescriptionBuilder *)self isNSFW])
  {
    [(AXMDescriptionBuilder *)self _appendToDescription:v4 afterPauseType:0 withContents:@"Possible adult content"];
  }
  id v5 = [(NSMutableDictionary *)self->_classificationLabelsToLocValuesMap allKeys];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __79__AXMDescriptionBuilder__addGenericTemplateForCaptionInformationToDescription___block_invoke;
  v36[3] = &unk_1E61170D8;
  v36[4] = self;
  id v6 = [v5 sortedArrayUsingComparator:v36];

  uint64_t v7 = [(AXMDescriptionBuilder *)self _subsumedTagsForTags:v6];
  uint64_t v8 = [(AXMDescriptionBuilder *)self _ignoredTagsForTags:v6];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __79__AXMDescriptionBuilder__addGenericTemplateForCaptionInformationToDescription___block_invoke_2;
  v33[3] = &unk_1E6117100;
  id v9 = v8;
  id v34 = v9;
  id v10 = v7;
  id v35 = v10;
  id v11 = objc_msgSend(v6, "ax_filteredArrayUsingBlock:", v33);

  uint64_t v12 = [v11 count];
  if (v12)
  {
    uint64_t v13 = v12;
    id v29 = v10;
    id v30 = v9;
    id v31 = v4;
    uint64_t v32 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"aeiouAEIOU"];
    int v14 = [MEMORY[0x1E4F28E78] string];
    for (uint64_t i = 0; i != v13; ++i)
    {
      long long v16 = [v11 objectAtIndex:i];
      long long v17 = [(AXMDescriptionBuilder *)self _templateRulesForTag:v16];
      long long v18 = [v17 objectForKeyedSubscript:@"speech"];
      if (!v18)
      {
        long long v19 = [(NSMutableDictionary *)self->_classificationLabelsToLocValuesMap objectForKeyedSubscript:v16];
        long long v18 = [v19 lowercaseString];
      }
      unint64_t v20 = [v17 objectForKeyedSubscript:@"nonCountNounOrPlural"];
      char v21 = [v20 BOOLValue];

      if (i)
      {
        if (v13 - 1 == i) {
          v22 = @" and ";
        }
        else {
          v22 = @", ";
        }
        [v14 appendString:v22];
        if (v21)
        {
          [v14 appendString:v18];
        }
        else
        {
          uint64_t v23 = [v18 rangeOfCharacterFromSet:v32];
          uint64_t v24 = @"a";
          if (!v23) {
            uint64_t v24 = @"an";
          }
          [v14 appendFormat:@"%@ %@", v24, v18];
        }
      }
      else if (v21)
      {
        [v14 appendFormat:@"A photo of %@", v18, v28];
      }
      else
      {
        uint64_t v25 = [v18 rangeOfCharacterFromSet:v32];
        v26 = @"a";
        if (!v25) {
          v26 = @"an";
        }
        [v14 appendFormat:@"A photo containing %@ %@", v26, v18];
      }
    }
    id v4 = v31;
    [(AXMDescriptionBuilder *)self _appendToDescription:v31 afterPauseType:0 withContents:v14];
    id v10 = v29;
    id v9 = v30;
    uint64_t v27 = (void *)v32;
  }
  else
  {
    uint64_t v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    int v14 = [v27 localizedStringForKey:@"No_Description" value:&stru_1F0E72D10 table:@"Accessibility"];
    [(AXMDescriptionBuilder *)self _appendToDescription:v4 afterPauseType:0 withContents:v14];
  }
}

uint64_t __79__AXMDescriptionBuilder__addGenericTemplateForCaptionInformationToDescription___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 _templateRulesForTag:a2];
  uint64_t v8 = [*(id *)(a1 + 32) _templateRulesForTag:v6];

  id v9 = [v7 objectForKeyedSubscript:@"priority"];
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = [v8 objectForKeyedSubscript:@"priority"];
  [v12 doubleValue];
  double v14 = v13;

  if (v11 > v14) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = v11 < v14;
  }

  return v15;
}

uint64_t __79__AXMDescriptionBuilder__addGenericTemplateForCaptionInformationToDescription___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 40) containsObject:v3] ^ 1;
  }

  return v4;
}

- (void)_addClassificationInformationToDescription:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28BD0] set];
  classificationLabelsToLocValuesMap = self->_classificationLabelsToLocValuesMap;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__AXMDescriptionBuilder__addClassificationInformationToDescription___block_invoke;
  v13[3] = &unk_1E6117128;
  id v14 = v5;
  id v7 = v5;
  [(NSMutableDictionary *)classificationLabelsToLocValuesMap enumerateKeysAndObjectsUsingBlock:v13];
  uint64_t v8 = [v7 allObjects];
  id v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_246];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__AXMDescriptionBuilder__addClassificationInformationToDescription___block_invoke_3;
  v11[3] = &unk_1E6117170;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 enumerateObjectsUsingBlock:v11];
}

uint64_t __68__AXMDescriptionBuilder__addClassificationInformationToDescription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __68__AXMDescriptionBuilder__addClassificationInformationToDescription___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __68__AXMDescriptionBuilder__addClassificationInformationToDescription___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _appendToDescription:*(void *)(a1 + 40) afterPauseType:0 withContents:a2];
}

- (void)_addIconClassInformationToDescription:(id)a3
{
  iconClassFeatures = self->_iconClassFeatures;
  id v5 = a3;
  id v7 = [(NSMutableArray *)iconClassFeatures axm_featureWithHighestConfidence];
  id v6 = [v7 value];
  [(AXMDescriptionBuilder *)self _appendToDescription:v5 afterPauseType:0 withContents:v6];
}

- (AXMVisionFeature)blurFeature
{
  return self->_blurFeature;
}

- (void)setBlurFeature:(id)a3
{
}

- (AXMVisionFeature)brightnessFeature
{
  return self->_brightnessFeature;
}

- (void)setBrightnessFeature:(id)a3
{
}

- (BOOL)isNSFW
{
  return self->_isNSFW;
}

- (void)setIsNSFW:(BOOL)a3
{
  self->_isNSFW = a3;
}

- (BOOL)shouldModifyCaptionForSensitiveContent
{
  return self->_shouldModifyCaptionForSensitiveContent;
}

- (void)setShouldModifyCaptionForSensitiveContent:(BOOL)a3
{
  self->_shouldModifyCaptionForSensitiveContent = a3;
}

- (AXMVisionFeature)primarySensitiveContentFeature
{
  return self->_primarySensitiveContentFeature;
}

- (void)setPrimarySensitiveContentFeature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primarySensitiveContentFeature, 0);
  objc_storeStrong((id *)&self->_brightnessFeature, 0);
  objc_storeStrong((id *)&self->_blurFeature, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisImageCaptionFeature, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisFaceFeatures, 0);
  objc_storeStrong((id *)&self->_captionFeature, 0);
  objc_storeStrong((id *)&self->_iconClassFeatures, 0);
  objc_storeStrong((id *)&self->_classificationLabelsToLocValuesMap, 0);
  objc_storeStrong((id *)&self->_faceFeatures, 0);
  objc_storeStrong((id *)&self->_visualDescription, 0);

  objc_storeStrong((id *)&self->_speakableDescription, 0);
}

- (void)_addCaptionInformationToDescription:(void *)a1 didConsumeDetectedFaceInfo:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 primarySensitiveContentFeature];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Cannot modify caption for sensitive content. unexpected category: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_addCaptionInformationToDescription:(uint64_t)a1 didConsumeDetectedFaceInfo:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Failed to create caption personalization regex: %@", (uint8_t *)&v2, 0xCu);
}

@end