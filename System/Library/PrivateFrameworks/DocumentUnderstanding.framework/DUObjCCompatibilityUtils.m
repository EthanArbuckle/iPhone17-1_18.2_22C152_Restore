@interface DUObjCCompatibilityUtils
+ (id)calendarEventForObjCCalendarEvent:(id)a3;
+ (id)categoryClassificationResponseForObjC:(id)a3;
+ (id)categoryResultForObjC:(id)a3;
+ (id)clientForObjCClient:(id)a3;
+ (id)debugInfoForObjCDebugInfo:(id)a3;
+ (id)displayInfoForObjC:(id)a3;
+ (id)documentForObjCDocument:(id)a3;
+ (id)emailDataForObjCEmailData:(id)a3;
+ (id)foundInEventClassificationResultForObjC:(id)a3;
+ (id)foundInEventResultForObjC:(id)a3;
+ (id)globalTopicSetIdentifierForObjCGlobalTopicSetIdentifier:(id)a3;
+ (id)htmlDataForObjCHTMLData:(id)a3;
+ (id)languageTaggingResponseForObjC:(id)a3;
+ (id)objCCalendarEventForCalendarEvent:(id)a3;
+ (id)objCEmailDataForEmailData:(id)a3;
+ (id)objCForCategoryResult:(id)a3;
+ (id)objCForDisplayInfo:(id)a3;
+ (id)objCForStructuredExtractionLabel:(id)a3;
+ (id)objCGlobalTopicSetIdentifierForGlobalTopicSetIdentifier:(id)a3;
+ (id)objCHTMLDataForHTMLData:(id)a3;
+ (id)objCStructuredEntityForStructuredEntity:(id)a3;
+ (id)objCTopicResultForTopicResult:(id)a3;
+ (id)objCUIElementForUIElement:(id)a3;
+ (id)objcDebugInfoForDebugInfo:(id)a3;
+ (id)objcForCategoryClassificationResponse:(id)a3;
+ (id)objcForFoundInEventClassificationResult:(id)a3;
+ (id)objcForFoundInEventResult:(id)a3;
+ (id)objcForLanguageTaggingResponse:(id)a3;
+ (id)objcForResponse:(id)a3;
+ (id)objcForStructuredEntityResponse:(id)a3;
+ (id)objcForTopicDetectionResponse:(id)a3;
+ (id)strategyForObjCStrategy:(id)a3;
+ (id)structuredEntityForObjCStructuredEntity:(id)a3;
+ (id)structuredEntityResponseForObjC:(id)a3;
+ (id)structuredExtractionLabelForObjC:(id)a3;
+ (id)topicDetectionResponseForObjC:(id)a3;
+ (id)topicResultForObjCTopicResult:(id)a3;
+ (id)typeForObjCType:(id)a3;
+ (id)uiElementForObjCUIElement:(id)a3;
@end

@implementation DUObjCCompatibilityUtils

+ (id)objcForResponse:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DUResponseObjC);
    v9 = objc_msgSend_topics(v3, v5, v6, v7, v8);
    v13 = objc_msgSend_objcForTopicDetectionResponse_(DUObjCCompatibilityUtils, v10, (uint64_t)v9, v11, v12);
    objc_msgSend_setTopics_(v4, v14, (uint64_t)v13, v15, v16);

    v21 = objc_msgSend_structuredEntities(v3, v17, v18, v19, v20);
    v25 = objc_msgSend_objcForStructuredEntityResponse_(DUObjCCompatibilityUtils, v22, (uint64_t)v21, v23, v24);
    objc_msgSend_setStructuredEntities_(v4, v26, (uint64_t)v25, v27, v28);

    v33 = objc_msgSend_languageTags(v3, v29, v30, v31, v32);
    v37 = objc_msgSend_objcForLanguageTaggingResponse_(DUObjCCompatibilityUtils, v34, (uint64_t)v33, v35, v36);
    objc_msgSend_setLanguageTags_(v4, v38, (uint64_t)v37, v39, v40);

    v45 = objc_msgSend_foundInEventResult(v3, v41, v42, v43, v44);
    v49 = objc_msgSend_objcForFoundInEventResult_(DUObjCCompatibilityUtils, v46, (uint64_t)v45, v47, v48);
    objc_msgSend_setFoundInEvent_(v4, v50, (uint64_t)v49, v51, v52);

    v57 = objc_msgSend_foundInEventClassificationResult(v3, v53, v54, v55, v56);
    v61 = objc_msgSend_objcForFoundInEventClassificationResult_(DUObjCCompatibilityUtils, v58, (uint64_t)v57, v59, v60);
    objc_msgSend_setFoundInEventClassification_(v4, v62, (uint64_t)v61, v63, v64);

    v69 = objc_msgSend_responseDebugInfo(v3, v65, v66, v67, v68);

    v73 = objc_msgSend_objcDebugInfoForDebugInfo_(DUObjCCompatibilityUtils, v70, (uint64_t)v69, v71, v72);
    objc_msgSend_setResponseDebugInfo_(v4, v74, (uint64_t)v73, v75, v76);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objcForFoundInEventClassificationResult:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DUFoundInEventClassificationResultObjC);
    v9 = objc_msgSend_isSupportedLocale(v3, v5, v6, v7, v8);
    objc_msgSend_setIsSupportedLocale_(v4, v10, (uint64_t)v9, v11, v12);

    v17 = objc_msgSend_isHumanSender(v3, v13, v14, v15, v16);
    objc_msgSend_setIsHumanSender_(v4, v18, (uint64_t)v17, v19, v20);

    v25 = objc_msgSend_isHumanHeaders(v3, v21, v22, v23, v24);
    objc_msgSend_setIsHumanHeaders_(v4, v26, (uint64_t)v25, v27, v28);

    v33 = objc_msgSend_containsDataDetectors(v3, v29, v30, v31, v32);
    objc_msgSend_setContainsDataDetectors_(v4, v34, (uint64_t)v33, v35, v36);

    v41 = objc_msgSend_isClassifiedAsEvent(v3, v37, v38, v39, v40);
    objc_msgSend_setIsClassifiedAsEvent_(v4, v42, (uint64_t)v41, v43, v44);

    v49 = objc_msgSend_isEventCandidate(v3, v45, v46, v47, v48);

    objc_msgSend_setIsEventCandidate_(v4, v50, (uint64_t)v49, v51, v52);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objcForFoundInEventResult:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [DUFoundInEventResultObjC alloc];
    uint64_t v8 = objc_msgSend_initWithDUFoundInEventResult_(v4, v5, (uint64_t)v3, v6, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

+ (id)objcForCategoryClassificationResponse:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DUCategoryClassificationResponseObjC);
    v5 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v10 = objc_msgSend_categories(v3, v6, v7, v8, v9, 0);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v39, (uint64_t)v43, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = objc_msgSend_objCForCategoryResult_(DUObjCCompatibilityUtils, v13, *(void *)(*((void *)&v39 + 1) + 8 * i), v14, v15);
          objc_msgSend_addObject_(v5, v20, (uint64_t)v19, v21, v22);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v39, (uint64_t)v43, 16);
      }
      while (v16);
    }

    objc_msgSend_setCategories_(v4, v23, (uint64_t)v5, v24, v25);
    uint64_t v30 = objc_msgSend_responseDebugInfo(v3, v26, v27, v28, v29);
    v34 = objc_msgSend_objcDebugInfoForDebugInfo_(DUObjCCompatibilityUtils, v31, (uint64_t)v30, v32, v33);
    objc_msgSend_setResponseDebugInfo_(v4, v35, (uint64_t)v34, v36, v37);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)categoryClassificationResponseForObjC:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding32DUCategoryClassificationResponse);
    v5 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v10 = objc_msgSend_categories(v3, v6, v7, v8, v9, 0);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v39, (uint64_t)v43, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = objc_msgSend_categoryResultForObjC_(DUObjCCompatibilityUtils, v13, *(void *)(*((void *)&v39 + 1) + 8 * i), v14, v15);
          objc_msgSend_addObject_(v5, v20, (uint64_t)v19, v21, v22);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v39, (uint64_t)v43, 16);
      }
      while (v16);
    }

    objc_msgSend_setCategories_(v4, v23, (uint64_t)v5, v24, v25);
    uint64_t v30 = objc_msgSend_responseDebugInfo(v3, v26, v27, v28, v29);
    v34 = objc_msgSend_debugInfoForObjCDebugInfo_(DUObjCCompatibilityUtils, v31, (uint64_t)v30, v32, v33);
    objc_msgSend_setResponseDebugInfo_(v4, v35, (uint64_t)v34, v36, v37);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)foundInEventClassificationResultForObjC:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult);
    uint64_t v9 = objc_msgSend_isSupportedLocale(v3, v5, v6, v7, v8);
    objc_msgSend_setIsSupportedLocale_(v4, v10, (uint64_t)v9, v11, v12);

    uint64_t v17 = objc_msgSend_isHumanSender(v3, v13, v14, v15, v16);
    objc_msgSend_setIsHumanSender_(v4, v18, (uint64_t)v17, v19, v20);

    uint64_t v25 = objc_msgSend_isHumanHeaders(v3, v21, v22, v23, v24);
    objc_msgSend_setIsHumanHeaders_(v4, v26, (uint64_t)v25, v27, v28);

    uint64_t v33 = objc_msgSend_containsDataDetectors(v3, v29, v30, v31, v32);
    objc_msgSend_setContainsDataDetectors_(v4, v34, (uint64_t)v33, v35, v36);

    long long v41 = objc_msgSend_isClassifiedAsEvent(v3, v37, v38, v39, v40);
    objc_msgSend_setIsClassifiedAsEvent_(v4, v42, (uint64_t)v41, v43, v44);

    v49 = objc_msgSend_isEventCandidate(v3, v45, v46, v47, v48);

    objc_msgSend_setIsEventCandidate_(v4, v50, (uint64_t)v49, v51, v52);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)foundInEventResultForObjC:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [_TtC21DocumentUnderstanding20DUFoundInEventResult alloc];
    uint64_t v8 = objc_msgSend_initWithFoundInEventResult_(v4, v5, (uint64_t)v3, v6, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

+ (id)objCForCategoryResult:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DUCategoryResultObjC);
    uint64_t v9 = objc_msgSend_categoryIdentifier(v3, v5, v6, v7, v8);
    objc_msgSend_setCategoryIdentifier_(v4, v10, (uint64_t)v9, v11, v12);

    objc_msgSend_categoryConfidence(v3, v13, v14, v15, v16);
    double v18 = v17;

    objc_msgSend_setCategoryConfidence_(v4, v19, v20, v21, v22, v18);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)categoryResultForObjC:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding16DUCategoryResult);
    uint64_t v9 = objc_msgSend_categoryIdentifier(v3, v5, v6, v7, v8);
    objc_msgSend_setCategoryIdentifier_(v4, v10, (uint64_t)v9, v11, v12);

    objc_msgSend_categoryConfidence(v3, v13, v14, v15, v16);
    double v18 = v17;

    objc_msgSend_setCategoryConfidence_(v4, v19, v20, v21, v22, v18);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objcForLanguageTaggingResponse:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DULanguageTaggingResponseObjC);
    uint64_t v9 = objc_msgSend_languageTags(v3, v5, v6, v7, v8);
    objc_msgSend_setLanguageTags_(v4, v10, (uint64_t)v9, v11, v12);

    double v17 = objc_msgSend_responseDebugInfo(v3, v13, v14, v15, v16);

    uint64_t v21 = objc_msgSend_objcDebugInfoForDebugInfo_(DUObjCCompatibilityUtils, v18, (uint64_t)v17, v19, v20);
    objc_msgSend_setResponseDebugInfo_(v4, v22, (uint64_t)v21, v23, v24);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)languageTaggingResponseForObjC:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding25DULanguageTaggingResponse);
    uint64_t v9 = objc_msgSend_languageTags(v3, v5, v6, v7, v8);
    objc_msgSend_setLanguageTags_(v4, v10, (uint64_t)v9, v11, v12);

    double v17 = objc_msgSend_responseDebugInfo(v3, v13, v14, v15, v16);

    uint64_t v21 = objc_msgSend_debugInfoForObjCDebugInfo_(DUObjCCompatibilityUtils, v18, (uint64_t)v17, v19, v20);
    objc_msgSend_setResponseDebugInfo_(v4, v22, (uint64_t)v21, v23, v24);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objcForTopicDetectionResponse:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DUTopicDetectionResponseObjC);
    v5 = objc_opt_new();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v10 = objc_msgSend_globalTopics(v3, v6, v7, v8, v9);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v64, (uint64_t)v69, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v65 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = objc_msgSend_objCTopicResultForTopicResult_(DUObjCCompatibilityUtils, v13, *(void *)(*((void *)&v64 + 1) + 8 * i), v14, v15);
          objc_msgSend_addObject_(v5, v20, (uint64_t)v19, v21, v22);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v64, (uint64_t)v69, 16);
      }
      while (v16);
    }

    uint64_t v23 = objc_opt_new();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v28 = objc_msgSend_personalTopics(v3, v24, v25, v26, v27, 0);
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v60, (uint64_t)v68, 16);
    if (v30)
    {
      uint64_t v34 = v30;
      uint64_t v35 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v61 != v35) {
            objc_enumerationMutation(v28);
          }
          uint64_t v37 = objc_msgSend_objCTopicResultForTopicResult_(DUObjCCompatibilityUtils, v31, *(void *)(*((void *)&v60 + 1) + 8 * j), v32, v33);
          objc_msgSend_addObject_(v23, v38, (uint64_t)v37, v39, v40);
        }
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v60, (uint64_t)v68, 16);
      }
      while (v34);
    }

    objc_msgSend_setGlobalTopics_(v4, v41, (uint64_t)v5, v42, v43);
    objc_msgSend_setPersonalTopics_(v4, v44, (uint64_t)v23, v45, v46);
    uint64_t v51 = objc_msgSend_responseDebugInfo(v3, v47, v48, v49, v50);
    uint64_t v55 = objc_msgSend_objcDebugInfoForDebugInfo_(DUObjCCompatibilityUtils, v52, (uint64_t)v51, v53, v54);
    objc_msgSend_setResponseDebugInfo_(v4, v56, (uint64_t)v55, v57, v58);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)topicDetectionResponseForObjC:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding24DUTopicDetectionResponse);
    v5 = objc_opt_new();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v10 = objc_msgSend_globalTopics(v3, v6, v7, v8, v9);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v64, (uint64_t)v69, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v65 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = objc_msgSend_topicResultForObjCTopicResult_(DUObjCCompatibilityUtils, v13, *(void *)(*((void *)&v64 + 1) + 8 * i), v14, v15);
          objc_msgSend_addObject_(v5, v20, (uint64_t)v19, v21, v22);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v64, (uint64_t)v69, 16);
      }
      while (v16);
    }

    uint64_t v23 = objc_opt_new();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v28 = objc_msgSend_personalTopics(v3, v24, v25, v26, v27, 0);
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v60, (uint64_t)v68, 16);
    if (v30)
    {
      uint64_t v34 = v30;
      uint64_t v35 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v61 != v35) {
            objc_enumerationMutation(v28);
          }
          uint64_t v37 = objc_msgSend_topicResultForObjCTopicResult_(DUObjCCompatibilityUtils, v31, *(void *)(*((void *)&v60 + 1) + 8 * j), v32, v33);
          objc_msgSend_addObject_(v23, v38, (uint64_t)v37, v39, v40);
        }
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v60, (uint64_t)v68, 16);
      }
      while (v34);
    }

    objc_msgSend_setGlobalTopics_(v4, v41, (uint64_t)v5, v42, v43);
    objc_msgSend_setPersonalTopics_(v4, v44, (uint64_t)v23, v45, v46);
    uint64_t v51 = objc_msgSend_responseDebugInfo(v3, v47, v48, v49, v50);
    uint64_t v55 = objc_msgSend_debugInfoForObjCDebugInfo_(DUObjCCompatibilityUtils, v52, (uint64_t)v51, v53, v54);
    objc_msgSend_setResponseDebugInfo_(v4, v56, (uint64_t)v55, v57, v58);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)objcForStructuredEntityResponse:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DUStructuredEntityResponseObjC);
    v5 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v10 = objc_msgSend_structuredEntities(v3, v6, v7, v8, v9, 0);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v39, (uint64_t)v43, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = objc_msgSend_objCStructuredEntityForStructuredEntity_(DUObjCCompatibilityUtils, v13, *(void *)(*((void *)&v39 + 1) + 8 * i), v14, v15);
          objc_msgSend_addObject_(v5, v20, (uint64_t)v19, v21, v22);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v39, (uint64_t)v43, 16);
      }
      while (v16);
    }

    objc_msgSend_setStructuredEntities_(v4, v23, (uint64_t)v5, v24, v25);
    uint64_t v30 = objc_msgSend_responseDebugInfo(v3, v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_objcDebugInfoForDebugInfo_(DUObjCCompatibilityUtils, v31, (uint64_t)v30, v32, v33);
    objc_msgSend_setResponseDebugInfo_(v4, v35, (uint64_t)v34, v36, v37);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)structuredEntityResponseForObjC:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding26DUStructuredEntityResponse);
    v5 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v10 = objc_msgSend_structuredEntities(v3, v6, v7, v8, v9, 0);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v39, (uint64_t)v43, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = objc_msgSend_structuredEntityForObjCStructuredEntity_(DUObjCCompatibilityUtils, v13, *(void *)(*((void *)&v39 + 1) + 8 * i), v14, v15);
          objc_msgSend_addObject_(v5, v20, (uint64_t)v19, v21, v22);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v39, (uint64_t)v43, 16);
      }
      while (v16);
    }

    objc_msgSend_setStructuredEntities_(v4, v23, (uint64_t)v5, v24, v25);
    uint64_t v30 = objc_msgSend_responseDebugInfo(v3, v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_debugInfoForObjCDebugInfo_(DUObjCCompatibilityUtils, v31, (uint64_t)v30, v32, v33);
    objc_msgSend_setResponseDebugInfo_(v4, v35, (uint64_t)v34, v36, v37);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)objCTopicResultForTopicResult:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DUTopicResultObjC);
    uint64_t v9 = objc_msgSend_topicSet(v3, v5, v6, v7, v8);
    v13 = objc_msgSend_objCGlobalTopicSetIdentifierForGlobalTopicSetIdentifier_(DUObjCCompatibilityUtils, v10, (uint64_t)v9, v11, v12);
    objc_msgSend_setTopicSet_(v4, v14, (uint64_t)v13, v15, v16);

    uint64_t v21 = objc_msgSend_topicIdentifier(v3, v17, v18, v19, v20);
    objc_msgSend_setTopicIdentifier_(v4, v22, (uint64_t)v21, v23, v24);

    objc_msgSend_topicConfidence(v3, v25, v26, v27, v28);
    double v30 = v29;

    objc_msgSend_setTopicConfidence_(v4, v31, v32, v33, v34, v30);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)topicResultForObjCTopicResult:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding13DUTopicResult);
    uint64_t v9 = objc_msgSend_topicSet(v3, v5, v6, v7, v8);
    v13 = objc_msgSend_globalTopicSetIdentifierForObjCGlobalTopicSetIdentifier_(DUObjCCompatibilityUtils, v10, (uint64_t)v9, v11, v12);
    objc_msgSend_setTopicSet_(v4, v14, (uint64_t)v13, v15, v16);

    uint64_t v21 = objc_msgSend_topicIdentifier(v3, v17, v18, v19, v20);
    objc_msgSend_setTopicIdentifier_(v4, v22, (uint64_t)v21, v23, v24);

    objc_msgSend_topicConfidence(v3, v25, v26, v27, v28);
    double v30 = v29;

    objc_msgSend_setTopicConfidence_(v4, v31, v32, v33, v34, v30);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCGlobalTopicSetIdentifierForGlobalTopicSetIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DUGlobalTopicSetIdentifierObjC);
    uint64_t v9 = objc_msgSend_topicSetName(v3, v5, v6, v7, v8);
    objc_msgSend_setTopicSetName_(v4, v10, v9, v11, v12);
    uint64_t v17 = objc_msgSend_topicSetVersion(v3, v13, v14, v15, v16);

    objc_msgSend_setTopicSetVersion_(v4, v18, v17, v19, v20);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)globalTopicSetIdentifierForObjCGlobalTopicSetIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier);
    uint64_t v9 = objc_msgSend_topicSetName(v3, v5, v6, v7, v8);
    objc_msgSend_setTopicSetName_(v4, v10, v9, v11, v12);
    uint64_t v17 = objc_msgSend_topicSetVersion(v3, v13, v14, v15, v16);

    objc_msgSend_setTopicSetVersion_(v4, v18, v17, v19, v20);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCStructuredEntityForStructuredEntity:(id)a3
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DUStructuredEntityObjC);
    uint64_t v9 = objc_msgSend_title(v3, v5, v6, v7, v8);
    objc_msgSend_setTitle_(v4, v10, (uint64_t)v9, v11, v12);

    uint64_t v17 = objc_msgSend_type(v3, v13, v14, v15, v16);
    objc_msgSend_setType_(v4, v18, (uint64_t)v17, v19, v20);

    uint64_t v21 = objc_opt_new();
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    uint64_t v26 = objc_msgSend_labels(v3, v22, v23, v24, v25, 0);
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v119, (uint64_t)v123, 16);
    if (v28)
    {
      uint64_t v32 = v28;
      uint64_t v33 = *(void *)v120;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v120 != v33) {
            objc_enumerationMutation(v26);
          }
          uint64_t v35 = objc_msgSend_objCForStructuredExtractionLabel_(DUObjCCompatibilityUtils, v29, *(void *)(*((void *)&v119 + 1) + 8 * i), v30, v31);
          objc_msgSend_addObject_(v21, v36, (uint64_t)v35, v37, v38);
        }
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v119, (uint64_t)v123, 16);
      }
      while (v32);
    }

    objc_msgSend_setLabels_(v4, v39, (uint64_t)v21, v40, v41);
    uint64_t v46 = objc_msgSend_phoneNumber(v3, v42, v43, v44, v45);
    objc_msgSend_setPhoneNumber_(v4, v47, (uint64_t)v46, v48, v49);

    uint64_t v54 = objc_msgSend_email(v3, v50, v51, v52, v53);
    objc_msgSend_setEmail_(v4, v55, (uint64_t)v54, v56, v57);

    long long v62 = objc_msgSend_url(v3, v58, v59, v60, v61);
    objc_msgSend_setUrl_(v4, v63, (uint64_t)v62, v64, v65);

    uint64_t v70 = objc_msgSend_addressComponents(v3, v66, v67, v68, v69);
    objc_msgSend_setAddressComponents_(v4, v71, (uint64_t)v70, v72, v73);

    v78 = objc_msgSend_calendarEvent(v3, v74, v75, v76, v77);
    v82 = objc_msgSend_objCCalendarEventForCalendarEvent_(DUObjCCompatibilityUtils, v79, (uint64_t)v78, v80, v81);
    objc_msgSend_setCalendarEvent_(v4, v83, (uint64_t)v82, v84, v85);

    v90 = objc_msgSend_homeAutomationID(v3, v86, v87, v88, v89);
    objc_msgSend_setHomeAutomationID_(v4, v91, (uint64_t)v90, v92, v93);

    v98 = objc_msgSend_displayInfo(v3, v94, v95, v96, v97);
    v102 = objc_msgSend_objCForDisplayInfo_(DUObjCCompatibilityUtils, v99, (uint64_t)v98, v100, v101);
    objc_msgSend_setDisplayInfo_(v4, v103, (uint64_t)v102, v104, v105);

    v110 = objc_msgSend_responseDebugInfo(v3, v106, v107, v108, v109);
    v114 = objc_msgSend_objcDebugInfoForDebugInfo_(DUObjCCompatibilityUtils, v111, (uint64_t)v110, v112, v113);
    objc_msgSend_setResponseDebugInfo_(v4, v115, (uint64_t)v114, v116, v117);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)structuredEntityForObjCStructuredEntity:(id)a3
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding18DUStructuredEntity);
    uint64_t v9 = objc_msgSend_title(v3, v5, v6, v7, v8);
    objc_msgSend_setTitle_(v4, v10, (uint64_t)v9, v11, v12);

    uint64_t v17 = objc_msgSend_type(v3, v13, v14, v15, v16);
    objc_msgSend_setType_(v4, v18, (uint64_t)v17, v19, v20);

    uint64_t v21 = objc_opt_new();
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    uint64_t v26 = objc_msgSend_labels(v3, v22, v23, v24, v25, 0);
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v119, (uint64_t)v123, 16);
    if (v28)
    {
      uint64_t v32 = v28;
      uint64_t v33 = *(void *)v120;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v120 != v33) {
            objc_enumerationMutation(v26);
          }
          uint64_t v35 = objc_msgSend_structuredExtractionLabelForObjC_(DUObjCCompatibilityUtils, v29, *(void *)(*((void *)&v119 + 1) + 8 * i), v30, v31);
          objc_msgSend_addObject_(v21, v36, (uint64_t)v35, v37, v38);
        }
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v119, (uint64_t)v123, 16);
      }
      while (v32);
    }

    objc_msgSend_setLabels_(v4, v39, (uint64_t)v21, v40, v41);
    uint64_t v46 = objc_msgSend_phoneNumber(v3, v42, v43, v44, v45);
    objc_msgSend_setPhoneNumber_(v4, v47, (uint64_t)v46, v48, v49);

    uint64_t v54 = objc_msgSend_email(v3, v50, v51, v52, v53);
    objc_msgSend_setEmail_(v4, v55, (uint64_t)v54, v56, v57);

    long long v62 = objc_msgSend_url(v3, v58, v59, v60, v61);
    objc_msgSend_setUrl_(v4, v63, (uint64_t)v62, v64, v65);

    uint64_t v70 = objc_msgSend_addressComponents(v3, v66, v67, v68, v69);
    objc_msgSend_setAddressComponents_(v4, v71, (uint64_t)v70, v72, v73);

    v78 = objc_msgSend_calendarEvent(v3, v74, v75, v76, v77);
    v82 = objc_msgSend_calendarEventForObjCCalendarEvent_(DUObjCCompatibilityUtils, v79, (uint64_t)v78, v80, v81);
    objc_msgSend_setCalendarEvent_(v4, v83, (uint64_t)v82, v84, v85);

    v90 = objc_msgSend_homeAutomationID(v3, v86, v87, v88, v89);
    objc_msgSend_setHomeAutomationID_(v4, v91, (uint64_t)v90, v92, v93);

    v98 = objc_msgSend_displayInfo(v3, v94, v95, v96, v97);
    v102 = objc_msgSend_displayInfoForObjC_(DUObjCCompatibilityUtils, v99, (uint64_t)v98, v100, v101);
    objc_msgSend_setDisplayInfo_(v4, v103, (uint64_t)v102, v104, v105);

    v110 = objc_msgSend_responseDebugInfo(v3, v106, v107, v108, v109);
    v114 = objc_msgSend_debugInfoForObjCDebugInfo_(DUObjCCompatibilityUtils, v111, (uint64_t)v110, v112, v113);
    objc_msgSend_setResponseDebugInfo_(v4, v115, (uint64_t)v114, v116, v117);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)objCForDisplayInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DUDisplayInfoObjC);
    objc_msgSend_frameInWindow(v3, v5, v6, v7, v8);
    objc_msgSend_setFrameInWindow_(v4, v9, v10, v11, v12);
    objc_msgSend_absoluteOriginOnScreen(v3, v13, v14, v15, v16);
    objc_msgSend_setAbsoluteOriginOnScreen_(v4, v17, v18, v19, v20);
    uint64_t v25 = objc_msgSend_isOnScreen(v3, v21, v22, v23, v24);

    objc_msgSend_setIsOnScreen_(v4, v26, v25, v27, v28);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)displayInfoForObjC:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding13DUDisplayInfo);
    objc_msgSend_frameInWindow(v3, v5, v6, v7, v8);
    objc_msgSend_setFrameInWindow_(v4, v9, v10, v11, v12);
    objc_msgSend_absoluteOriginOnScreen(v3, v13, v14, v15, v16);
    objc_msgSend_setAbsoluteOriginOnScreen_(v4, v17, v18, v19, v20);
    uint64_t v25 = objc_msgSend_isOnScreen(v3, v21, v22, v23, v24);

    objc_msgSend_setIsOnScreen_(v4, v26, v25, v27, v28);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCCalendarEventForCalendarEvent:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DUCalendarEventObjC);
    uint64_t isAllDay = objc_msgSend_isAllDay(v3, v5, v6, v7, v8);
    objc_msgSend_setIsAllDay_(v4, v10, isAllDay, v11, v12);
    uint64_t v17 = objc_msgSend_startDateComponents(v3, v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_copy(v17, v18, v19, v20, v21);
    objc_msgSend_setStartDateComponents_(v4, v23, (uint64_t)v22, v24, v25);

    uint64_t v30 = objc_msgSend_startTimezone(v3, v26, v27, v28, v29);
    uint64_t v35 = objc_msgSend_copy(v30, v31, v32, v33, v34);
    objc_msgSend_setStartTimezone_(v4, v36, (uint64_t)v35, v37, v38);

    uint64_t v43 = objc_msgSend_endDateComponents(v3, v39, v40, v41, v42);
    uint64_t v48 = objc_msgSend_copy(v43, v44, v45, v46, v47);
    objc_msgSend_setEndDateComponents_(v4, v49, (uint64_t)v48, v50, v51);

    uint64_t v56 = objc_msgSend_endTimezone(v3, v52, v53, v54, v55);

    uint64_t v61 = objc_msgSend_copy(v56, v57, v58, v59, v60);
    objc_msgSend_setEndTimezone_(v4, v62, (uint64_t)v61, v63, v64);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCForStructuredExtractionLabel:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DUStructuredEntityLabelObjC);
    uint64_t v9 = objc_msgSend_labelName(v3, v5, v6, v7, v8);
    objc_msgSend_setLabelName_(v4, v10, (uint64_t)v9, v11, v12);

    objc_msgSend_confidenceScore(v3, v13, v14, v15, v16);
    double v18 = v17;

    objc_msgSend_setConfidenceScore_(v4, v19, v20, v21, v22, v18);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)structuredExtractionLabelForObjC:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding27DUStructuredExtractionLabel);
    uint64_t v9 = objc_msgSend_labelName(v3, v5, v6, v7, v8);
    objc_msgSend_setLabelName_(v4, v10, (uint64_t)v9, v11, v12);

    objc_msgSend_confidenceScore(v3, v13, v14, v15, v16);
    double v18 = v17;

    objc_msgSend_setConfidenceScore_(v4, v19, v20, v21, v22, v18);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)calendarEventForObjCCalendarEvent:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding15DUCalendarEvent);
    uint64_t isAllDay = objc_msgSend_isAllDay(v3, v5, v6, v7, v8);
    objc_msgSend_setIsAllDay_(v4, v10, isAllDay, v11, v12);
    double v17 = objc_msgSend_startDateComponents(v3, v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_copy(v17, v18, v19, v20, v21);
    objc_msgSend_setStartDateComponents_(v4, v23, (uint64_t)v22, v24, v25);

    uint64_t v30 = objc_msgSend_startTimezone(v3, v26, v27, v28, v29);
    uint64_t v35 = objc_msgSend_copy(v30, v31, v32, v33, v34);
    objc_msgSend_setStartTimezone_(v4, v36, (uint64_t)v35, v37, v38);

    uint64_t v43 = objc_msgSend_endDateComponents(v3, v39, v40, v41, v42);
    uint64_t v48 = objc_msgSend_copy(v43, v44, v45, v46, v47);
    objc_msgSend_setEndDateComponents_(v4, v49, (uint64_t)v48, v50, v51);

    uint64_t v56 = objc_msgSend_endTimezone(v3, v52, v53, v54, v55);

    uint64_t v61 = objc_msgSend_copy(v56, v57, v58, v59, v60);
    objc_msgSend_setEndTimezone_(v4, v62, (uint64_t)v61, v63, v64);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objcDebugInfoForDebugInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DUDebugInfoObjC);
    uint64_t v9 = objc_msgSend_debugString(v3, v5, v6, v7, v8);

    objc_msgSend_setDebugString_(v4, v10, (uint64_t)v9, v11, v12);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)debugInfoForObjCDebugInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding11DUDebugInfo);
    uint64_t v9 = objc_msgSend_debugString(v3, v5, v6, v7, v8);

    objc_msgSend_setDebugString_(v4, v10, (uint64_t)v9, v11, v12);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCUIElementForUIElement:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(DUDocumentUIElementObjC);
  uint64_t v9 = objc_msgSend_text(v3, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_copy(v9, v10, v11, v12, v13);
  objc_msgSend_setText_(v4, v15, (uint64_t)v14, v16, v17);

  uint64_t v22 = objc_msgSend_version(v3, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_copy(v22, v23, v24, v25, v26);
  objc_msgSend_setVersion_(v4, v28, (uint64_t)v27, v29, v30);

  uint64_t v35 = objc_msgSend_classDescriptor(v3, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_copy(v35, v36, v37, v38, v39);
  objc_msgSend_setClassDescriptor_(v4, v41, (uint64_t)v40, v42, v43);

  objc_msgSend_fontSize(v3, v44, v45, v46, v47);
  objc_msgSend_setFontSize_(v4, v48, v49, v50, v51);
  uint64_t v56 = objc_msgSend_superviewClassNames(v3, v52, v53, v54, v55);
  uint64_t v61 = objc_msgSend_copy(v56, v57, v58, v59, v60);
  objc_msgSend_setSuperviewClassNames_(v4, v62, (uint64_t)v61, v63, v64);

  objc_msgSend_frameInWindow(v3, v65, v66, v67, v68);
  objc_msgSend_setFrameInWindow_(v4, v69, v70, v71, v72);
  objc_msgSend_absoluteOriginOnScreen(v3, v73, v74, v75, v76);
  objc_msgSend_setAbsoluteOriginOnScreen_(v4, v77, v78, v79, v80);
  uint64_t v85 = objc_msgSend_isOnScreen(v3, v81, v82, v83, v84);
  objc_msgSend_setIsOnScreen_(v4, v86, v85, v87, v88);
  uint64_t isValidForContentExtraction = objc_msgSend_isValidForContentExtraction(v3, v89, v90, v91, v92);

  objc_msgSend_setIsValidForContentExtraction_(v4, v94, isValidForContentExtraction, v95, v96);
  return v4;
}

+ (id)uiElementForObjCUIElement:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_TtC21DocumentUnderstanding19DUDocumentUIElement);
  uint64_t v9 = objc_msgSend_text(v3, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_copy(v9, v10, v11, v12, v13);
  objc_msgSend_setText_(v4, v15, (uint64_t)v14, v16, v17);

  uint64_t v22 = objc_msgSend_version(v3, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_copy(v22, v23, v24, v25, v26);
  objc_msgSend_setVersion_(v4, v28, (uint64_t)v27, v29, v30);

  uint64_t v35 = objc_msgSend_classDescriptor(v3, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_copy(v35, v36, v37, v38, v39);
  objc_msgSend_setClassDescriptor_(v4, v41, (uint64_t)v40, v42, v43);

  objc_msgSend_fontSize(v3, v44, v45, v46, v47);
  objc_msgSend_setFontSize_(v4, v48, v49, v50, v51);
  uint64_t v56 = objc_msgSend_superviewClassNames(v3, v52, v53, v54, v55);
  uint64_t v61 = objc_msgSend_copy(v56, v57, v58, v59, v60);
  objc_msgSend_setSuperviewClassNames_(v4, v62, (uint64_t)v61, v63, v64);

  objc_msgSend_frameInWindow(v3, v65, v66, v67, v68);
  objc_msgSend_setFrameInWindow_(v4, v69, v70, v71, v72);
  objc_msgSend_absoluteOriginOnScreen(v3, v73, v74, v75, v76);
  objc_msgSend_setAbsoluteOriginOnScreen_(v4, v77, v78, v79, v80);
  uint64_t v85 = objc_msgSend_isOnScreen(v3, v81, v82, v83, v84);
  objc_msgSend_setIsOnScreen_(v4, v86, v85, v87, v88);
  uint64_t isValidForContentExtraction = objc_msgSend_isValidForContentExtraction(v3, v89, v90, v91, v92);

  objc_msgSend_setIsValidForContentExtraction_(v4, v94, isValidForContentExtraction, v95, v96);
  return v4;
}

+ (id)objCEmailDataForEmailData:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(DUDocumentEmailDataObjC);
  uint64_t v9 = objc_msgSend_subject(v3, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_copy(v9, v10, v11, v12, v13);
  objc_msgSend_setSubject_(v4, v15, (uint64_t)v14, v16, v17);

  uint64_t v22 = objc_msgSend_senderName(v3, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_copy(v22, v23, v24, v25, v26);
  objc_msgSend_setSenderName_(v4, v28, (uint64_t)v27, v29, v30);

  uint64_t v35 = objc_msgSend_senderEmail(v3, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_copy(v35, v36, v37, v38, v39);
  objc_msgSend_setSenderEmail_(v4, v41, (uint64_t)v40, v42, v43);

  uint64_t v48 = objc_msgSend_senderDomain(v3, v44, v45, v46, v47);
  uint64_t v53 = objc_msgSend_copy(v48, v49, v50, v51, v52);
  objc_msgSend_setSenderDomain_(v4, v54, (uint64_t)v53, v55, v56);

  uint64_t v61 = objc_msgSend_recipientNames(v3, v57, v58, v59, v60);
  uint64_t v66 = objc_msgSend_copy(v61, v62, v63, v64, v65);
  objc_msgSend_setRecipientNames_(v4, v67, (uint64_t)v66, v68, v69);

  uint64_t v74 = objc_msgSend_recipientEmails(v3, v70, v71, v72, v73);
  uint64_t v79 = objc_msgSend_copy(v74, v75, v76, v77, v78);
  objc_msgSend_setRecipientEmails_(v4, v80, (uint64_t)v79, v81, v82);

  uint64_t v87 = objc_msgSend_ccNames(v3, v83, v84, v85, v86);
  uint64_t v92 = objc_msgSend_copy(v87, v88, v89, v90, v91);
  objc_msgSend_setCcNames_(v4, v93, (uint64_t)v92, v94, v95);

  uint64_t v100 = objc_msgSend_ccEmails(v3, v96, v97, v98, v99);
  uint64_t v105 = objc_msgSend_copy(v100, v101, v102, v103, v104);
  objc_msgSend_setCcEmails_(v4, v106, (uint64_t)v105, v107, v108);

  uint64_t v113 = objc_msgSend_bccNames(v3, v109, v110, v111, v112);
  v118 = objc_msgSend_copy(v113, v114, v115, v116, v117);
  objc_msgSend_setBccNames_(v4, v119, (uint64_t)v118, v120, v121);

  v126 = objc_msgSend_bccEmails(v3, v122, v123, v124, v125);
  v131 = objc_msgSend_copy(v126, v127, v128, v129, v130);
  objc_msgSend_setBccEmails_(v4, v132, (uint64_t)v131, v133, v134);

  v139 = objc_msgSend_dateReceived(v3, v135, v136, v137, v138);
  v144 = objc_msgSend_copy(v139, v140, v141, v142, v143);
  objc_msgSend_setDateReceived_(v4, v145, (uint64_t)v144, v146, v147);

  v152 = objc_msgSend_headers(v3, v148, v149, v150, v151);
  v157 = objc_msgSend_copy(v152, v153, v154, v155, v156);
  objc_msgSend_setHeaders_(v4, v158, (uint64_t)v157, v159, v160);

  v165 = objc_msgSend_text(v3, v161, v162, v163, v164);

  v170 = objc_msgSend_copy(v165, v166, v167, v168, v169);
  objc_msgSend_setText_(v4, v171, (uint64_t)v170, v172, v173);

  return v4;
}

+ (id)emailDataForObjCEmailData:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_TtC21DocumentUnderstanding19DUDocumentEmailData);
  uint64_t v9 = objc_msgSend_subject(v3, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_copy(v9, v10, v11, v12, v13);
  objc_msgSend_setSubject_(v4, v15, (uint64_t)v14, v16, v17);

  uint64_t v22 = objc_msgSend_senderName(v3, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_copy(v22, v23, v24, v25, v26);
  objc_msgSend_setSenderName_(v4, v28, (uint64_t)v27, v29, v30);

  uint64_t v35 = objc_msgSend_senderEmail(v3, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_copy(v35, v36, v37, v38, v39);
  objc_msgSend_setSenderEmail_(v4, v41, (uint64_t)v40, v42, v43);

  uint64_t v48 = objc_msgSend_senderDomain(v3, v44, v45, v46, v47);
  uint64_t v53 = objc_msgSend_copy(v48, v49, v50, v51, v52);
  objc_msgSend_setSenderDomain_(v4, v54, (uint64_t)v53, v55, v56);

  uint64_t v61 = objc_msgSend_recipientNames(v3, v57, v58, v59, v60);
  uint64_t v66 = objc_msgSend_copy(v61, v62, v63, v64, v65);
  objc_msgSend_setRecipientNames_(v4, v67, (uint64_t)v66, v68, v69);

  uint64_t v74 = objc_msgSend_recipientEmails(v3, v70, v71, v72, v73);
  uint64_t v79 = objc_msgSend_copy(v74, v75, v76, v77, v78);
  objc_msgSend_setRecipientEmails_(v4, v80, (uint64_t)v79, v81, v82);

  uint64_t v87 = objc_msgSend_ccNames(v3, v83, v84, v85, v86);
  uint64_t v92 = objc_msgSend_copy(v87, v88, v89, v90, v91);
  objc_msgSend_setCcNames_(v4, v93, (uint64_t)v92, v94, v95);

  uint64_t v100 = objc_msgSend_ccEmails(v3, v96, v97, v98, v99);
  uint64_t v105 = objc_msgSend_copy(v100, v101, v102, v103, v104);
  objc_msgSend_setCcEmails_(v4, v106, (uint64_t)v105, v107, v108);

  uint64_t v113 = objc_msgSend_bccNames(v3, v109, v110, v111, v112);
  v118 = objc_msgSend_copy(v113, v114, v115, v116, v117);
  objc_msgSend_setBccNames_(v4, v119, (uint64_t)v118, v120, v121);

  v126 = objc_msgSend_bccEmails(v3, v122, v123, v124, v125);
  v131 = objc_msgSend_copy(v126, v127, v128, v129, v130);
  objc_msgSend_setBccEmails_(v4, v132, (uint64_t)v131, v133, v134);

  v139 = objc_msgSend_dateReceived(v3, v135, v136, v137, v138);
  v144 = objc_msgSend_copy(v139, v140, v141, v142, v143);
  objc_msgSend_setDateReceived_(v4, v145, (uint64_t)v144, v146, v147);

  v152 = objc_msgSend_headers(v3, v148, v149, v150, v151);
  v157 = objc_msgSend_copy(v152, v153, v154, v155, v156);
  objc_msgSend_setHeaders_(v4, v158, (uint64_t)v157, v159, v160);

  v165 = objc_msgSend_text(v3, v161, v162, v163, v164);

  v170 = objc_msgSend_copy(v165, v166, v167, v168, v169);
  objc_msgSend_setText_(v4, v171, (uint64_t)v170, v172, v173);

  return v4;
}

+ (id)objCHTMLDataForHTMLData:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(DUDocumentHTMLDataObjC);
  uint64_t v10 = objc_msgSend_documentEmailData(v4, v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_objCEmailDataForEmailData_(a1, v11, (uint64_t)v10, v12, v13);

  uint64_t v19 = objc_msgSend_htmlString(v4, v15, v16, v17, v18);

  uint64_t v24 = objc_msgSend_copy(v19, v20, v21, v22, v23);
  objc_msgSend_setHtmlString_(v5, v25, (uint64_t)v24, v26, v27);

  objc_msgSend_setDocumentEmailData_(v5, v28, (uint64_t)v14, v29, v30);
  return v5;
}

+ (id)htmlDataForObjCHTMLData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(_TtC21DocumentUnderstanding18DUDocumentHTMLData);
  v5 = objc_alloc_init(_TtC21DocumentUnderstanding19DUDocumentEmailData);
  uint64_t v10 = objc_msgSend_htmlString(v3, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_copy(v10, v11, v12, v13, v14);
  objc_msgSend_setHtmlString_(v4, v16, (uint64_t)v15, v17, v18);

  uint64_t v23 = objc_msgSend_documentEmailData(v3, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_subject(v23, v24, v25, v26, v27);
  uint64_t v33 = objc_msgSend_copy(v28, v29, v30, v31, v32);
  objc_msgSend_setSubject_(v5, v34, (uint64_t)v33, v35, v36);

  uint64_t v41 = objc_msgSend_documentEmailData(v3, v37, v38, v39, v40);
  uint64_t v46 = objc_msgSend_senderName(v41, v42, v43, v44, v45);
  uint64_t v51 = objc_msgSend_copy(v46, v47, v48, v49, v50);
  objc_msgSend_setSenderName_(v5, v52, (uint64_t)v51, v53, v54);

  uint64_t v59 = objc_msgSend_documentEmailData(v3, v55, v56, v57, v58);
  uint64_t v64 = objc_msgSend_senderEmail(v59, v60, v61, v62, v63);
  uint64_t v69 = objc_msgSend_copy(v64, v65, v66, v67, v68);
  objc_msgSend_setSenderEmail_(v5, v70, (uint64_t)v69, v71, v72);

  uint64_t v77 = objc_msgSend_documentEmailData(v3, v73, v74, v75, v76);
  uint64_t v82 = objc_msgSend_senderDomain(v77, v78, v79, v80, v81);
  uint64_t v87 = objc_msgSend_copy(v82, v83, v84, v85, v86);
  objc_msgSend_setSenderDomain_(v5, v88, (uint64_t)v87, v89, v90);

  uint64_t v95 = objc_msgSend_documentEmailData(v3, v91, v92, v93, v94);
  uint64_t v100 = objc_msgSend_recipientNames(v95, v96, v97, v98, v99);
  uint64_t v105 = objc_msgSend_copy(v100, v101, v102, v103, v104);
  objc_msgSend_setRecipientNames_(v5, v106, (uint64_t)v105, v107, v108);

  uint64_t v113 = objc_msgSend_documentEmailData(v3, v109, v110, v111, v112);
  v118 = objc_msgSend_recipientEmails(v113, v114, v115, v116, v117);
  uint64_t v123 = objc_msgSend_copy(v118, v119, v120, v121, v122);
  objc_msgSend_setRecipientEmails_(v5, v124, (uint64_t)v123, v125, v126);

  v131 = objc_msgSend_documentEmailData(v3, v127, v128, v129, v130);
  uint64_t v136 = objc_msgSend_ccNames(v131, v132, v133, v134, v135);
  uint64_t v141 = objc_msgSend_copy(v136, v137, v138, v139, v140);
  objc_msgSend_setCcNames_(v5, v142, (uint64_t)v141, v143, v144);

  uint64_t v149 = objc_msgSend_documentEmailData(v3, v145, v146, v147, v148);
  uint64_t v154 = objc_msgSend_ccEmails(v149, v150, v151, v152, v153);
  uint64_t v159 = objc_msgSend_copy(v154, v155, v156, v157, v158);
  objc_msgSend_setCcEmails_(v5, v160, (uint64_t)v159, v161, v162);

  uint64_t v167 = objc_msgSend_documentEmailData(v3, v163, v164, v165, v166);
  uint64_t v172 = objc_msgSend_bccNames(v167, v168, v169, v170, v171);
  v177 = objc_msgSend_copy(v172, v173, v174, v175, v176);
  objc_msgSend_setBccNames_(v5, v178, (uint64_t)v177, v179, v180);

  v185 = objc_msgSend_documentEmailData(v3, v181, v182, v183, v184);
  v190 = objc_msgSend_bccEmails(v185, v186, v187, v188, v189);
  v195 = objc_msgSend_copy(v190, v191, v192, v193, v194);
  objc_msgSend_setBccEmails_(v5, v196, (uint64_t)v195, v197, v198);

  v203 = objc_msgSend_documentEmailData(v3, v199, v200, v201, v202);
  v208 = objc_msgSend_dateReceived(v203, v204, v205, v206, v207);
  v213 = objc_msgSend_copy(v208, v209, v210, v211, v212);
  objc_msgSend_setDateReceived_(v5, v214, (uint64_t)v213, v215, v216);

  v221 = objc_msgSend_documentEmailData(v3, v217, v218, v219, v220);
  v226 = objc_msgSend_headers(v221, v222, v223, v224, v225);
  v231 = objc_msgSend_copy(v226, v227, v228, v229, v230);
  objc_msgSend_setHeaders_(v5, v232, (uint64_t)v231, v233, v234);

  v239 = objc_msgSend_documentEmailData(v3, v235, v236, v237, v238);

  v244 = objc_msgSend_text(v239, v240, v241, v242, v243);
  v249 = objc_msgSend_copy(v244, v245, v246, v247, v248);
  objc_msgSend_setText_(v5, v250, (uint64_t)v249, v251, v252);

  v257 = objc_msgSend_copy(v5, v253, v254, v255, v256);
  objc_msgSend_setDocumentEmailData_(v4, v258, (uint64_t)v257, v259, v260);

  return v4;
}

+ (id)documentForObjCDocument:(id)a3
{
  uint64_t v244 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(_TtC21DocumentUnderstanding13DURawDocument);
  uint64_t v9 = objc_msgSend_headline(v3, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_copy(v9, v10, v11, v12, v13);
  objc_msgSend_setHeadline_(v4, v15, (uint64_t)v14, v16, v17);

  uint64_t v22 = objc_msgSend_subHeadline(v3, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_copy(v22, v23, v24, v25, v26);
  objc_msgSend_setSubHeadline_(v4, v28, (uint64_t)v27, v29, v30);

  uint64_t v35 = objc_msgSend_version(v3, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_copy(v35, v36, v37, v38, v39);
  objc_msgSend_setVersion_(v4, v41, (uint64_t)v40, v42, v43);

  uint64_t v48 = objc_msgSend_creator(v3, v44, v45, v46, v47);
  uint64_t v53 = objc_msgSend_copy(v48, v49, v50, v51, v52);
  objc_msgSend_setCreator_(v4, v54, (uint64_t)v53, v55, v56);

  uint64_t v61 = objc_msgSend_abstract(v3, v57, v58, v59, v60);
  uint64_t v66 = objc_msgSend_copy(v61, v62, v63, v64, v65);
  objc_msgSend_setAbstract_(v4, v67, (uint64_t)v66, v68, v69);

  uint64_t v74 = objc_msgSend_comment(v3, v70, v71, v72, v73);
  uint64_t v79 = objc_msgSend_copy(v74, v75, v76, v77, v78);
  objc_msgSend_setComment_(v4, v80, (uint64_t)v79, v81, v82);

  uint64_t v87 = objc_msgSend_text(v3, v83, v84, v85, v86);
  uint64_t v92 = objc_msgSend_copy(v87, v88, v89, v90, v91);
  objc_msgSend_setText_(v4, v93, (uint64_t)v92, v94, v95);

  uint64_t v100 = objc_msgSend_inLanguage(v3, v96, v97, v98, v99);
  uint64_t v105 = objc_msgSend_copy(v100, v101, v102, v103, v104);
  objc_msgSend_setInLanguage_(v4, v106, (uint64_t)v105, v107, v108);

  uint64_t v113 = objc_msgSend_keywords(v3, v109, v110, v111, v112);
  v118 = objc_msgSend_copy(v113, v114, v115, v116, v117);
  objc_msgSend_setKeywords_(v4, v119, (uint64_t)v118, v120, v121);

  uint64_t v126 = objc_msgSend_identifier(v3, v122, v123, v124, v125);
  v131 = objc_msgSend_copy(v126, v127, v128, v129, v130);
  objc_msgSend_setIdentifier_(v4, v132, (uint64_t)v131, v133, v134);

  uint64_t v139 = objc_msgSend_url(v3, v135, v136, v137, v138);
  uint64_t v144 = objc_msgSend_copy(v139, v140, v141, v142, v143);
  objc_msgSend_setUrl_(v4, v145, (uint64_t)v144, v146, v147);

  uint64_t v152 = objc_msgSend_thumbnailUrl(v3, v148, v149, v150, v151);
  uint64_t v157 = objc_msgSend_copy(v152, v153, v154, v155, v156);
  objc_msgSend_setThumbnailUrl_(v4, v158, (uint64_t)v157, v159, v160);

  uint64_t v165 = objc_msgSend_significantLink(v3, v161, v162, v163, v164);
  uint64_t v170 = objc_msgSend_copy(v165, v166, v167, v168, v169);
  objc_msgSend_setSignificantLink_(v4, v171, (uint64_t)v170, v172, v173);

  v178 = objc_msgSend_dateCreated(v3, v174, v175, v176, v177);
  objc_msgSend_setDateCreated_(v4, v179, (uint64_t)v178, v180, v181);

  v186 = objc_msgSend_dateModified(v3, v182, v183, v184, v185);
  objc_msgSend_setDateModified_(v4, v187, (uint64_t)v186, v188, v189);

  uint64_t v194 = objc_msgSend_documentHTMLData(v3, v190, v191, v192, v193);
  uint64_t v198 = objc_msgSend_htmlDataForObjCHTMLData_(DUObjCCompatibilityUtils, v195, (uint64_t)v194, v196, v197);

  objc_msgSend_setDocumentHTMLData_(v4, v199, (uint64_t)v198, v200, v201);
  uint64_t v206 = objc_msgSend_documentUIElements(v3, v202, v203, v204, v205);
  id v207 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v239 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  id v208 = v206;
  uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v208, v209, (uint64_t)&v239, (uint64_t)v243, 16);
  if (v210)
  {
    uint64_t v214 = v210;
    uint64_t v215 = *(void *)v240;
    do
    {
      for (uint64_t i = 0; i != v214; ++i)
      {
        if (*(void *)v240 != v215) {
          objc_enumerationMutation(v208);
        }
        uint64_t v220 = objc_msgSend_uiElementForObjCUIElement_(DUObjCCompatibilityUtils, v211, *(void *)(*((void *)&v239 + 1) + 8 * i), v212, v213, (void)v239);
        if (v220) {
          objc_msgSend_addObject_(v207, v217, (uint64_t)v220, v218, v219);
        }
      }
      uint64_t v214 = objc_msgSend_countByEnumeratingWithState_objects_count_(v208, v211, (uint64_t)&v239, (uint64_t)v243, 16);
    }
    while (v214);
  }

  uint64_t v225 = objc_msgSend_copy(v207, v221, v222, v223, v224);
  objc_msgSend_setDocumentUIElements_(v4, v226, (uint64_t)v225, v227, v228);

  uint64_t v229 = [_TtC21DocumentUnderstanding10DUDocument alloc];
  uint64_t v234 = objc_msgSend_noMaxLength(_TtC21DocumentUnderstanding17DUDocumentGlobals, v230, v231, v232, v233);
  uint64_t v237 = objc_msgSend_initWithRawDocument_maxLength_(v229, v235, (uint64_t)v4, v234, v236);

  return v237;
}

+ (id)strategyForObjCStrategy:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_contentType(v3, v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_typeForObjCType_(DUObjCCompatibilityUtils, v9, (uint64_t)v8, v10, v11);

  uint64_t v13 = [_TtC21DocumentUnderstanding17DURequestStrategy alloc];
  uint64_t v18 = objc_msgSend_modelIdentifier(v3, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_preprocess(v3, v19, v20, v21, v22);

  uint64_t v25 = objc_msgSend_initWithContentType_preferredModelIdentifier_preprocess_(v13, v24, (uint64_t)v12, (uint64_t)v18, v23);
  return v25;
}

+ (id)typeForObjCType:(id)a3
{
  __int16 v5 = objc_msgSend_options(a3, a2, (uint64_t)a3, v3, v4);
  uint64_t v14 = objc_msgSend_array(MEMORY[0x263EFF980], v6, v7, v8, v9);
  if (v5)
  {
    uint64_t v25 = objc_msgSend_languageTag(_TtC21DocumentUnderstanding20DURequestContentType, v10, v11, v12, v13);
    objc_msgSend_addObject_(v14, v26, (uint64_t)v25, v27, v28);

    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v29 = objc_msgSend_wikiDataTopic(_TtC21DocumentUnderstanding20DURequestContentType, v10, v11, v12, v13);
  objc_msgSend_addObject_(v14, v30, (uint64_t)v29, v31, v32);

  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v33 = objc_msgSend_date(_TtC21DocumentUnderstanding20DURequestContentType, v10, v11, v12, v13);
  objc_msgSend_addObject_(v14, v34, (uint64_t)v33, v35, v36);

  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v37 = objc_msgSend_address(_TtC21DocumentUnderstanding20DURequestContentType, v10, v11, v12, v13);
  objc_msgSend_addObject_(v14, v38, (uint64_t)v37, v39, v40);

  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v41 = objc_msgSend_link(_TtC21DocumentUnderstanding20DURequestContentType, v10, v11, v12, v13);
  objc_msgSend_addObject_(v14, v42, (uint64_t)v41, v43, v44);

  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v45 = objc_msgSend_phoneNumber(_TtC21DocumentUnderstanding20DURequestContentType, v10, v11, v12, v13);
  objc_msgSend_addObject_(v14, v46, (uint64_t)v45, v47, v48);

  if ((v5 & 0x800) == 0)
  {
LABEL_8:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v49 = objc_msgSend_foundInEvent(_TtC21DocumentUnderstanding20DURequestContentType, v10, v11, v12, v13);
  objc_msgSend_addObject_(v14, v50, (uint64_t)v49, v51, v52);

  if ((v5 & 0x1000) != 0)
  {
LABEL_9:
    uint64_t v15 = objc_msgSend_foundInEventClassification(_TtC21DocumentUnderstanding20DURequestContentType, v10, v11, v12, v13);
    objc_msgSend_addObject_(v14, v16, (uint64_t)v15, v17, v18);
  }
LABEL_10:
  uint64_t v19 = [_TtC21DocumentUnderstanding20DURequestContentType alloc];
  uint64_t v23 = objc_msgSend_initWithAbilitiesToUnion_(v19, v20, (uint64_t)v14, v21, v22);

  return v23;
}

+ (id)clientForObjCClient:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_TtC21DocumentUnderstanding8DUClient alloc];
  uint64_t v9 = objc_msgSend_identifier(v3, v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_initWithIdentifier_(v4, v10, (uint64_t)v9, v11, v12);
  return v13;
}

@end