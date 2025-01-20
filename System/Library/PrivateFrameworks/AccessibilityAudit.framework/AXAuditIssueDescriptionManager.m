@interface AXAuditIssueDescriptionManager
+ (id)_auditIssueTypeToLocalizationKeyLookup;
+ (id)allAuditIssueClassificationCodes;
+ (id)auditIssueTypeToAuditTestTypeMapping;
+ (id)sharedManager;
- (BOOL)isContrastTypeIssue:(int64_t)a3;
- (id)_locKeyForAuditIssueClassification:(int64_t)a3;
- (id)_locKeyWithSuffix:(id)a3 issueClassification:(int64_t)a4;
- (id)_locStringForIssue:(id)a3 suffix:(id)a4;
- (id)_locStringForKey:(id)a3;
- (id)humanReadableDescriptionForAuditIssueTestType:(id)a3;
- (id)humanReadableDescriptionForAuditTestType:(id)a3;
- (id)longDescExtraInfoForAuditIssue:(id)a3;
- (id)longDescriptionForAuditIssue:(id)a3;
- (id)shortTitleForAuditIssue:(id)a3;
- (id)suggestionDescriptionForAuditIssue:(id)a3;
@end

@implementation AXAuditIssueDescriptionManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__AXAuditIssueDescriptionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_4 != -1) {
    dispatch_once(&sharedManager_onceToken_4, block);
  }
  v2 = (void *)sharedManager_instance_4;

  return v2;
}

uint64_t __47__AXAuditIssueDescriptionManager_sharedManager__block_invoke()
{
  sharedManager_instance_4 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (id)shortTitleForAuditIssue:(id)a3
{
  id v4 = a3;
  v5 = [v4 mlGeneratedDescription];

  if (v5)
  {
    v6 = [v4 mlGeneratedDescription];
    uint64_t v7 = -[AXAuditIssueDescriptionManager _locKeyWithSuffix:issueClassification:](self, "_locKeyWithSuffix:issueClassification:", @"title.formatter", [v4 issueClassification]);
    v8 = (void *)v7;
    v9 = &stru_26FB6E0B0;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    v10 = v9;

    v11 = NSString;
    v12 = [(AXAuditIssueDescriptionManager *)self _locStringForKey:v10];

    v13 = objc_msgSend(v11, "stringWithFormat:", v12, v6);
  }
  else
  {
    v13 = [(AXAuditIssueDescriptionManager *)self _locStringForIssue:v4 suffix:@"title"];
  }

  return v13;
}

- (id)longDescriptionForAuditIssue:(id)a3
{
  return [(AXAuditIssueDescriptionManager *)self _locStringForIssue:a3 suffix:@"longDesc"];
}

- (id)longDescExtraInfoForAuditIssue:(id)a3
{
  id v4 = a3;
  v5 = [v4 longDescExtraInfo];

  if (v5)
  {
    v6 = [v4 longDescExtraInfo];
    uint64_t v7 = [v6 componentsJoinedByString:@", "];

    v8 = [(AXAuditIssueDescriptionManager *)self _locStringForIssue:v4 suffix:@"longDescExtraInfo"];
    if (v8)
    {
      v9 = [NSString stringWithFormat:@"%@ %@", v8, v7];
    }
    else
    {
      v9 = v7;
    }
    v10 = v9;
  }
  else
  {
    v10 = &stru_26FB6E0B0;
  }

  return v10;
}

- (id)suggestionDescriptionForAuditIssue:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 suggestedSelectorsToFix];
  if ([v5 count])
  {
    v6 = -[AXAuditIssueDescriptionManager _locKeyWithSuffix:issueClassification:](self, "_locKeyWithSuffix:issueClassification:", @"suggestion.formatter", [v4 issueClassification]);
    if (!v6)
    {
      v15 = 0;
      uint64_t v7 = 0;
      goto LABEL_19;
    }
    uint64_t v7 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 appendFormat:@"%@, ", *(void *)(*((void *)&v28 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v10);
    }

    objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v7, "length") - 2, 2);
    v13 = NSString;
    v14 = [(AXAuditIssueDescriptionManager *)self _locStringForKey:v6];
    v15 = objc_msgSend(v13, "stringWithFormat:", v14, v7);

    if (!v15) {
      goto LABEL_19;
    }
LABEL_18:
    if (![v15 isEqual:v6])
    {
LABEL_23:
      id v24 = v15;

      goto LABEL_24;
    }
LABEL_19:
    if ([v4 platform] == 1) {
      v25 = @"defaultIOSSuggestion";
    }
    else {
      v25 = @"defaultMacOSSuggestion";
    }
    uint64_t v26 = [(AXAuditIssueDescriptionManager *)self _locStringForKey:v25];

    v15 = (void *)v26;
    goto LABEL_23;
  }
  v16 = [v4 mlGeneratedDescription];

  if (!v16)
  {
    v6 = -[AXAuditIssueDescriptionManager _locKeyWithSuffix:issueClassification:](self, "_locKeyWithSuffix:issueClassification:", @"suggestion", [v4 issueClassification]);
    v15 = [(AXAuditIssueDescriptionManager *)self _locStringForKey:v6];
    uint64_t v7 = 0;
    if (!v15) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v17 = [v4 mlGeneratedDescription];
  uint64_t v18 = -[AXAuditIssueDescriptionManager _locKeyWithSuffix:issueClassification:](self, "_locKeyWithSuffix:issueClassification:", @"suggestion.formatter", [v4 issueClassification]);
  v19 = (void *)v18;
  v20 = &stru_26FB6E0B0;
  if (v18) {
    v20 = (__CFString *)v18;
  }
  v21 = v20;

  v22 = NSString;
  v23 = [(AXAuditIssueDescriptionManager *)self _locStringForKey:v21];

  objc_msgSend(v22, "stringWithFormat:", v23, v17);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:

  return v24;
}

- (id)_locStringForKey:(id)a3
{
  uint64_t v3 = _locStringForKey__onceToken_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_locStringForKey__onceToken_0, &__block_literal_global_16);
  }
  v5 = [(id)_locStringForKey__myBundle_0 localizedStringForKey:v4 value:v4 table:@"AuditIssues"];

  return v5;
}

uint64_t __51__AXAuditIssueDescriptionManager__locStringForKey___block_invoke()
{
  _locStringForKey__myBundle_0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

- (id)_locStringForIssue:(id)a3 suffix:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[AXAuditIssueDescriptionManager _locKeyWithSuffix:issueClassification:](self, "_locKeyWithSuffix:issueClassification:", v6, [v7 issueClassification]);

  uint64_t v9 = [v7 elementDescription];

  if (!v9)
  {
    uint64_t v9 = [(AXAuditIssueDescriptionManager *)self _locStringForKey:@"element"];
  }
  uint64_t v10 = NSString;
  uint64_t v11 = [(AXAuditIssueDescriptionManager *)self _locStringForKey:v8];
  v12 = objc_msgSend(v10, "stringWithFormat:", v11, v9);

  if ([v12 isEqual:v8]) {
    v13 = 0;
  }
  else {
    v13 = v12;
  }
  id v14 = v13;

  return v14;
}

- (id)_locKeyWithSuffix:(id)a3 issueClassification:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(AXAuditIssueDescriptionManager *)self _locKeyForAuditIssueClassification:a4];
  if (v7)
  {
    id v8 = [NSString stringWithFormat:@"%@.%@", v7, v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_locKeyForAuditIssueClassification:(int64_t)a3
{
  id v4 = +[AXAuditIssueDescriptionManager _auditIssueTypeToLocalizationKeyLookup];
  v5 = [NSNumber numberWithLong:a3];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (BOOL)isContrastTypeIssue:(int64_t)a3
{
  return (unint64_t)(a3 - 10) < 7;
}

+ (id)_auditIssueTypeToLocalizationKeyLookup
{
  if (_auditIssueTypeToLocalizationKeyLookup_onceToken != -1) {
    dispatch_once(&_auditIssueTypeToLocalizationKeyLookup_onceToken, &__block_literal_global_50_0);
  }
  v2 = (void *)_auditIssueTypeToLocalizationKeyLookup__AuditIssueTypeToLocalizationKeyLookup;

  return v2;
}

void __72__AXAuditIssueDescriptionManager__auditIssueTypeToLocalizationKeyLookup__block_invoke()
{
  v3[37] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26FB7A5B0;
  v2[1] = &unk_26FB7A5C8;
  v3[0] = @"contrastUnknown";
  v3[1] = @"contrastAAPass";
  v2[2] = &unk_26FB7A5E0;
  v2[3] = &unk_26FB7A5F8;
  v3[2] = @"contrastAAPartialPass";
  v3[3] = @"contrastAAFail";
  v2[4] = &unk_26FB7A610;
  v2[5] = &unk_26FB7A628;
  v3[4] = @"contrastAAAPass";
  v3[5] = @"contrastAAAPartialPass";
  v2[6] = &unk_26FB7A640;
  v2[7] = &unk_26FB7A658;
  v3[6] = @"contrastAAAFail";
  v3[7] = @"hitRegionTooSmall";
  v2[8] = &unk_26FB7A670;
  v2[9] = &unk_26FB7A688;
  v3[8] = @"elementLabelAndValueEmptyWithMLGeneratedDesc";
  v3[9] = @"elementLabelAndValueEmpty";
  v2[10] = &unk_26FB7A6A0;
  v2[11] = &unk_26FB7A6B8;
  v3[10] = @"elementLabelUsesImageName";
  v3[11] = @"elementLabelNotHumanReadable";
  v2[12] = &unk_26FB7A6D0;
  v2[13] = &unk_26FB7A6E8;
  v3[12] = @"elementMissingTraitNotEnabled";
  v3[13] = @"elementLabelDuplicateTraitString";
  v2[14] = &unk_26FB7A700;
  v2[15] = &unk_26FB7A718;
  v3[14] = @"elementValueDuplicateTraitString";
  v3[15] = @"potentialElement";
  v2[16] = &unk_26FB7A730;
  v2[17] = &unk_26FB7A748;
  v3[16] = @"potentialTextElement";
  v3[17] = @"hitTestButNotInSwipeOrder";
  v2[18] = &unk_26FB7A760;
  v2[19] = &unk_26FB7A778;
  v3[18] = @"inSwipeOrderButNotHitTested";
  v3[19] = @"swipeOrderForwardReverseMismatch";
  v2[20] = &unk_26FB7A790;
  v2[21] = &unk_26FB7A7A8;
  v3[20] = @"dynamicTextUnsupported";
  v3[21] = @"dynamicTextPartiallyUnsupported";
  v2[22] = &unk_26FB7A7C0;
  v2[23] = &unk_26FB7A7D8;
  v3[22] = @"textIsClipped";
  v3[23] = @"elementLabelAndValueEmpty";
  v2[24] = &unk_26FB7A7F0;
  v2[25] = &unk_26FB7A808;
  v3[24] = @"elementImageHasNoLabel";
  v3[25] = @"elementLabelUsesImageName";
  v2[26] = &unk_26FB7A820;
  v2[27] = &unk_26FB7A838;
  v3[26] = @"missingParent";
  v3[27] = @"notChildOfParent";
  v2[28] = &unk_26FB7A850;
  v2[29] = &unk_26FB7A868;
  v3[28] = @"potentialElement";
  v3[29] = @"elementLabelAndValueEmpty";
  v2[30] = &unk_26FB7A880;
  v2[31] = &unk_26FB7A898;
  v3[30] = @"elementLabelNotHumanReadable";
  v3[31] = @"elementImageHasNoLabel";
  v2[32] = &unk_26FB7A8B0;
  v2[33] = &unk_26FB7A8C8;
  v3[32] = @"elementLabelDuplicateRoleDescription";
  v3[33] = @"elementCouldUseTitle";
  v2[34] = &unk_26FB7A8E0;
  v2[35] = &unk_26FB7A8F8;
  v3[34] = @"actionMissing";
  v3[35] = @"unknownRole";
  v2[36] = &unk_26FB7A910;
  v3[36] = @"potentialTextElement";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)_auditIssueTypeToLocalizationKeyLookup__AuditIssueTypeToLocalizationKeyLookup;
  _auditIssueTypeToLocalizationKeyLookup__AuditIssueTypeToLocalizationKeyLookup = v0;
}

- (id)humanReadableDescriptionForAuditIssueTestType:(id)a3
{
  uint64_t v4 = [a3 issueClassification];
  v5 = [NSNumber numberWithLong:v4];
  id v6 = +[AXAuditIssueDescriptionManager auditIssueTypeToAuditTestTypeMapping];
  id v7 = [v6 objectForKey:v5];

  id v8 = [(AXAuditIssueDescriptionManager *)self humanReadableDescriptionForAuditTestType:v7];

  return v8;
}

- (id)humanReadableDescriptionForAuditTestType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"testTypeContrast"])
  {
    v5 = @"contrast";
  }
  else if ([v4 isEqualToString:@"testTypeHitRegion"])
  {
    v5 = @"hitRegion";
  }
  else if ([v4 isEqualToString:@"testTypeSufficientElementDescription"])
  {
    v5 = @"elementDescription";
  }
  else if ([v4 isEqualToString:@"testTypeAction"])
  {
    v5 = @"action";
  }
  else if ([v4 isEqualToString:@"testTypeTrait"])
  {
    v5 = @"trait";
  }
  else if ([v4 isEqualToString:@"testTypeElementDetection"])
  {
    v5 = @"elementDetection";
  }
  else if ([v4 isEqualToString:@"testTypeSwipeOrder"])
  {
    v5 = @"swipeOrder";
  }
  else if ([v4 isEqualToString:@"testTypeDynamicText"])
  {
    v5 = @"dynamicText";
  }
  else if ([v4 isEqualToString:@"testTypeTextClipped"])
  {
    v5 = @"textClipped";
  }
  else if ([v4 isEqualToString:@"testTypeParentChild"])
  {
    v5 = @"parentChild";
  }
  else
  {
    v5 = 0;
  }
  if ([(__CFString *)v5 length])
  {
    id v6 = [NSString stringWithFormat:@"auditTestType.%@", v5];
    id v7 = [(AXAuditIssueDescriptionManager *)self _locStringForKey:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)auditIssueTypeToAuditTestTypeMapping
{
  if (auditIssueTypeToAuditTestTypeMapping_onceToken != -1) {
    dispatch_once(&auditIssueTypeToAuditTestTypeMapping_onceToken, &__block_literal_global_249);
  }
  v2 = (void *)auditIssueTypeToAuditTestTypeMapping__AuditIssueTypeToAuditTestTypeMapping;

  return v2;
}

void __70__AXAuditIssueDescriptionManager_auditIssueTypeToAuditTestTypeMapping__block_invoke()
{
  v3[37] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26FB7A5B0;
  v2[1] = &unk_26FB7A5C8;
  v3[0] = @"testTypeContrast";
  v3[1] = @"testTypeContrast";
  v2[2] = &unk_26FB7A5E0;
  v2[3] = &unk_26FB7A5F8;
  v3[2] = @"testTypeContrast";
  v3[3] = @"testTypeContrast";
  v2[4] = &unk_26FB7A610;
  v2[5] = &unk_26FB7A628;
  v3[4] = @"testTypeContrast";
  v3[5] = @"testTypeContrast";
  v2[6] = &unk_26FB7A640;
  v2[7] = &unk_26FB7A658;
  v3[6] = @"testTypeContrast";
  v3[7] = @"testTypeHitRegion";
  v2[8] = &unk_26FB7A670;
  v2[9] = &unk_26FB7A688;
  v3[8] = @"testTypeSufficientElementDescription";
  v3[9] = @"testTypeSufficientElementDescription";
  v2[10] = &unk_26FB7A6A0;
  v2[11] = &unk_26FB7A6B8;
  v3[10] = @"testTypeSufficientElementDescription";
  v3[11] = @"testTypeSufficientElementDescription";
  v2[12] = &unk_26FB7A6D0;
  v2[13] = &unk_26FB7A6E8;
  v3[12] = @"testTypeTrait";
  v3[13] = @"testTypeTrait";
  v2[14] = &unk_26FB7A700;
  v2[15] = &unk_26FB7A718;
  v3[14] = @"testTypeTrait";
  v3[15] = @"testTypeElementDetection";
  v2[16] = &unk_26FB7A730;
  v2[17] = &unk_26FB7A748;
  v3[16] = @"testTypeElementDetection";
  v3[17] = @"testTypeSwipeOrder";
  v2[18] = &unk_26FB7A760;
  v2[19] = &unk_26FB7A778;
  v3[18] = @"testTypeSwipeOrder";
  v3[19] = @"testTypeSwipeOrder";
  v2[20] = &unk_26FB7A790;
  v2[21] = &unk_26FB7A7A8;
  v3[20] = @"testTypeDynamicText";
  v3[21] = @"testTypeDynamicText";
  v2[22] = &unk_26FB7A7C0;
  v2[23] = &unk_26FB7A7D8;
  v3[22] = @"testTypeTextClipped";
  v3[23] = @"testTypeSufficientElementDescription";
  v2[24] = &unk_26FB7A7F0;
  v2[25] = &unk_26FB7A808;
  v3[24] = @"testTypeSufficientElementDescription";
  v3[25] = @"testTypeSufficientElementDescription";
  v2[26] = &unk_26FB7A820;
  v2[27] = &unk_26FB7A838;
  v3[26] = @"testTypeParentChild";
  v3[27] = @"testTypeParentChild";
  v2[28] = &unk_26FB7A850;
  v2[29] = &unk_26FB7A868;
  v3[28] = @"testTypeElementDetection";
  v3[29] = @"testTypeSufficientElementDescription";
  v2[30] = &unk_26FB7A880;
  v2[31] = &unk_26FB7A898;
  v3[30] = @"testTypeSufficientElementDescription";
  v3[31] = @"testTypeSufficientElementDescription";
  v2[32] = &unk_26FB7A8B0;
  v2[33] = &unk_26FB7A8C8;
  v3[32] = @"testTypeSufficientElementDescription";
  v3[33] = @"testTypeSufficientElementDescription";
  v2[34] = &unk_26FB7A8E0;
  v2[35] = &unk_26FB7A8F8;
  v3[34] = @"testTypeAction";
  v3[35] = @"testTypeSufficientElementDescription";
  v2[36] = &unk_26FB7A910;
  v3[36] = @"testTypeElementDetection";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)auditIssueTypeToAuditTestTypeMapping__AuditIssueTypeToAuditTestTypeMapping;
  auditIssueTypeToAuditTestTypeMapping__AuditIssueTypeToAuditTestTypeMapping = v0;
}

+ (id)allAuditIssueClassificationCodes
{
  v2 = [(id)objc_opt_class() _auditIssueTypeToLocalizationKeyLookup];
  uint64_t v3 = [v2 allKeys];

  return v3;
}

@end