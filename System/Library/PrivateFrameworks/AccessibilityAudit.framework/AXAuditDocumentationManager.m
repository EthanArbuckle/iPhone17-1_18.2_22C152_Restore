@interface AXAuditDocumentationManager
+ (id)_appleDocViewerURLForWebDocURL:(id)a3;
+ (id)_docTypeCatalystDictionary;
+ (id)_docTypeDictionary;
+ (id)_getOriginaliOSTitle:(id)a3;
+ (id)_macOSToiOSTitleDictionary;
+ (id)appleDocURLForType:(int64_t)a3;
+ (id)appleDocViewerURLs;
+ (id)sharedManager;
+ (id)webDocURLForType:(int64_t)a3;
+ (id)webpageURLs;
+ (int64_t)getAXDocumentationType:(id)a3 isCatalyst:(BOOL)a4;
@end

@implementation AXAuditDocumentationManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__AXAuditDocumentationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_5 != -1) {
    dispatch_once(&sharedManager_onceToken_5, block);
  }
  v2 = (void *)sharedManager_instance_5;

  return v2;
}

uint64_t __44__AXAuditDocumentationManager_sharedManager__block_invoke()
{
  sharedManager_instance_5 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

+ (id)webpageURLs
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AXAuditDocumentationManager_webpageURLs__block_invoke;
  block[3] = &unk_26520D308;
  v5 = @"https://developer.apple.com";
  if (webpageURLs_once != -1) {
    dispatch_once(&webpageURLs_once, block);
  }
  id v2 = (id)webpageURLs_returnValue;

  return v2;
}

void __42__AXAuditDocumentationManager_webpageURLs__block_invoke(uint64_t a1)
{
  v51[46] = *MEMORY[0x263EF8340];
  v50[0] = &unk_26FB7A928;
  v49 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1534976-accessibilitylabel"];
  v51[0] = v49;
  v50[1] = &unk_26FB7A940;
  v48 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535033-accessibilitytitle"];
  v51[1] = v48;
  v50[2] = &unk_26FB7A958;
  v47 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535103-accessibilityvalue"];
  v51[2] = v47;
  v50[3] = &unk_26FB7A970;
  v46 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535144-accessibilityroledescription"];
  v51[3] = v46;
  v50[4] = &unk_26FB7A988;
  v45 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535018-accessibilitychildren"];
  v51[4] = v45;
  v50[5] = &unk_26FB7A9A0;
  v44 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/2869552-accessibilitychildreninnavigatio"];
  v51[5] = v44;
  v50[6] = &unk_26FB7A9B8;
  v43 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1534996-accessibilityextrasmenubar"];
  v51[6] = v43;
  v50[7] = &unk_26FB7A9D0;
  v42 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibilitylayoutarea/1533902-accessibilityfocuseduielement"];
  v51[7] = v42;
  v50[8] = &unk_26FB7A9E8;
  v41 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1534986-accessibilityfocusedwindow"];
  v51[8] = v41;
  v50[9] = &unk_26FB7AA00;
  v40 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535073-accessibilityfrontmost"];
  v51[9] = v40;
  v50[10] = &unk_26FB7AA18;
  v39 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/attribute/1530325-topleveluielement"];
  v51[10] = v39;
  v50[11] = &unk_26FB7AA30;
  v38 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1534961-accessibilityhidden"];
  v51[11] = v38;
  v50[12] = &unk_26FB7AA48;
  v37 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535138-accessibilitymainwindow"];
  v51[12] = v37;
  v50[13] = &unk_26FB7AA60;
  v36 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535055-accessibilitymenubar"];
  v51[13] = v36;
  v50[14] = &unk_26FB7AA78;
  v35 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535005-accessibilityrole"];
  v51[14] = v35;
  v50[15] = &unk_26FB7AA90;
  v34 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535117-accessibilitywindows"];
  v51[15] = v34;
  v50[16] = &unk_26FB7AAA8;
  v33 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/1411337-classname"];
  v51[16] = v33;
  v50[17] = &unk_26FB7AAC0;
  v32 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1532774-accessibilityperformshowmenu"];
  v51[17] = v32;
  v50[18] = &unk_26FB7AAD8;
  v31 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1526358-accessibilityperformpress"];
  v51[18] = v31;
  v50[19] = &unk_26FB7AAF0;
  v30 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibilitypositionattribute"];
  v51[19] = v30;
  v50[20] = &unk_26FB7AB08;
  v29 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibilitysizeattribute"];
  v51[20] = v29;
  v50[21] = &unk_26FB7AB20;
  v28 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535040-accessibilityparent"];
  v51[21] = v28;
  v50[22] = &unk_26FB7AB38;
  v27 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1534974-accessibilityhelp"];
  v51[22] = v27;
  v50[23] = &unk_26FB7AB50;
  v26 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1534939-accessibilityframe"];
  v51[23] = v26;
  v50[24] = &unk_26FB7AB68;
  v25 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1534994-accessibilityfocused"];
  v51[24] = v25;
  v50[25] = &unk_26FB7AB80;
  v24 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535024-accessibilityenabled"];
  v51[25] = v24;
  v50[26] = &unk_26FB7AB98;
  v23 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535149-accessibilityactivationpoint"];
  v51[26] = v23;
  v50[27] = &unk_26FB7ABB0;
  v22 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535030-accessibilitywindow"];
  v51[27] = v22;
  v50[28] = &unk_26FB7ABC8;
  v21 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535157-accessibilityurl"];
  v51[28] = v21;
  v50[29] = &unk_26FB7ABE0;
  v20 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535092-accessibilitytopleveluielement"];
  v51[29] = v20;
  v50[30] = &unk_26FB7ABF8;
  v19 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/appkit/nsaccessibility/1535070-accessibilitysubrole"];
  v51[30] = v19;
  v50[31] = &unk_26FB7AC10;
  v18 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/uikit/uiaccessibilityelement/1619577-accessibilitylabel"];
  v51[31] = v18;
  v50[32] = &unk_26FB7AC28;
  v17 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/uikit/uiaccessibilityelement/1619583-accessibilityvalue"];
  v51[32] = v17;
  v50[33] = &unk_26FB7AC40;
  v16 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/uikit/uiaccessibilityelement/1619584-accessibilitytraits"];
  v51[33] = v16;
  v50[34] = &unk_26FB7AC58;
  v15 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/uikit/uiaccessibilityidentification"];
  v51[34] = v15;
  v50[35] = &unk_26FB7AC70;
  v14 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/uiaccessibilityaction"];
  v51[35] = v14;
  v50[36] = &unk_26FB7AC88;
  id v2 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/1615093-accessibilityhint"];
  v51[36] = v2;
  v50[37] = &unk_26FB7ACA0;
  v3 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/3197989-accessibilityuserinputlabels"];
  v51[37] = v3;
  v50[38] = &unk_26FB7ACB8;
  v4 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/1615165-accessibilityactivate"];
  v51[38] = v4;
  v50[39] = &unk_26FB7ACD0;
  v5 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/1615076-accessibilityincrement"];
  v51[39] = v5;
  v50[40] = &unk_26FB7ACE8;
  v6 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/1615169-accessibilitydecrement"];
  v51[40] = v6;
  v50[41] = &unk_26FB7AD00;
  v7 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/1615161-accessibilityscroll"];
  v51[41] = v7;
  v50[42] = &unk_26FB7AD18;
  v8 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/1615202-accessibilitytraits"];
  v51[42] = v8;
  v50[43] = &unk_26FB7AD30;
  v9 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/uikit/uiaccessibility/uiaccessibilitycontainertype"];
  v51[43] = v9;
  v50[44] = &unk_26FB7AD48;
  v10 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/1615181-accessibilitylabel"];
  v51[44] = v10;
  v50[45] = &unk_26FB7AD60;
  v11 = [*(id *)(a1 + 32) stringByAppendingString:@"/documentation/objectivec/nsobject/1615117-accessibilityvalue"];
  v51[45] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:46];
  v13 = (void *)webpageURLs_returnValue;
  webpageURLs_returnValue = v12;
}

+ (id)appleDocViewerURLs
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__AXAuditDocumentationManager_appleDocViewerURLs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (appleDocViewerURLs_once != -1) {
    dispatch_once(&appleDocViewerURLs_once, block);
  }
  return 0;
}

void __49__AXAuditDocumentationManager_appleDocViewerURLs__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [*(id *)(a1 + 32) webpageURLs];
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * v5);
        v7 = [*(id *)(a1 + 32) webpageURLs];
        v8 = [v7 objectForKey:v6];

        v9 = [NSURL URLWithString:v8];
        if (v9)
        {
          v10 = [*(id *)(a1 + 32) _appleDocViewerURLForWebDocURL:v9];
          v11 = [v10 absoluteString];
          if (v11) {
            [0 setObject:v11 forKey:v6];
          }
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

+ (id)appleDocURLForType:(int64_t)a3
{
  uint64_t v3 = [(id)objc_opt_class() webDocURLForType:a3];
  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() _appleDocViewerURLForWebDocURL:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)_appleDocViewerURLForWebDocURL:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [a3 absoluteString];
    uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"/" withString:@"%252F"];

    uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"https:%252F%252Fdeveloper.apple.com" withString:@"x-xcode-documentation:/apple-built-in/doc%253A%252F%252Fcom.apple.documentation"];

    uint64_t v6 = (void *)[objc_alloc(NSURL) initWithString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)webDocURLForType:(int64_t)a3
{
  uint64_t v4 = [a1 webpageURLs];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKey:v5];

  v7 = (void *)[objc_alloc(NSURL) initWithString:v6];

  return v7;
}

+ (id)_getOriginaliOSTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _macOSToiOSTitleDictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (int64_t)getAXDocumentationType:(id)a3 isCatalyst:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [(id)objc_opt_class() _getOriginaliOSTitle:v6];

    v8 = [a1 _docTypeCatalystDictionary];
    v9 = [v8 objectForKeyedSubscript:v7];
    id v6 = (id)v7;
  }
  else
  {
    v8 = [a1 _docTypeDictionary];
    v10 = [v8 objectForKeyedSubscript:v6];

    if (!v10)
    {
      int64_t v11 = 0;
      goto LABEL_7;
    }
    v9 = [v8 objectForKeyedSubscript:v6];
  }
  int64_t v11 = (int)[v9 intValue];

LABEL_7:
  return v11;
}

+ (id)_macOSToiOSTitleDictionary
{
  if (_macOSToiOSTitleDictionary_once != -1) {
    dispatch_once(&_macOSToiOSTitleDictionary_once, &__block_literal_global_18);
  }
  uint64_t v2 = (void *)_macOSToiOSTitleDictionary_macOSToiOSTitleDictionary;

  return v2;
}

void __57__AXAuditDocumentationManager__macOSToiOSTitleDictionary__block_invoke()
{
  v0 = (void *)_macOSToiOSTitleDictionary_macOSToiOSTitleDictionary;
  _macOSToiOSTitleDictionary_macOSToiOSTitleDictionary = (uint64_t)&unk_26FB7AE20;
}

+ (id)_docTypeCatalystDictionary
{
  if (_docTypeCatalystDictionary_once != -1) {
    dispatch_once(&_docTypeCatalystDictionary_once, &__block_literal_global_259);
  }
  uint64_t v2 = (void *)_docTypeCatalystDictionary_docTypeCatalystDictionary;

  return v2;
}

void __57__AXAuditDocumentationManager__docTypeCatalystDictionary__block_invoke()
{
  v0 = (void *)_docTypeCatalystDictionary_docTypeCatalystDictionary;
  _docTypeCatalystDictionary_docTypeCatalystDictionary = (uint64_t)&unk_26FB7AE48;
}

+ (id)_docTypeDictionary
{
  if (_docTypeDictionary_once != -1) {
    dispatch_once(&_docTypeDictionary_once, &__block_literal_global_277);
  }
  uint64_t v2 = (void *)_docTypeDictionary_docTypeDictionary;

  return v2;
}

void __49__AXAuditDocumentationManager__docTypeDictionary__block_invoke()
{
  v0 = (void *)_docTypeDictionary_docTypeDictionary;
  _docTypeDictionary_docTypeDictionary = (uint64_t)&unk_26FB7AE70;
}

@end