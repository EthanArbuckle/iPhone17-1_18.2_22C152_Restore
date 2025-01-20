@interface WFStringContentItem
+ (id)coercions;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)dictionaryCoercionHandler;
+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)pdfCoercionHandler;
+ (id)printFormatterCoercionHandler;
+ (id)stringCoercionHandler;
+ (id)textFileCoercionHandler;
+ (int64_t)tableTemplateSubjectType;
- (BOOL)includesFileRepresentationInSerializedItem;
- (BOOL)isContent;
- (NSString)string;
- (WFDataDetectorResults)dataDetectorResults;
- (void)setDataDetectorResults:(id)a3;
@end

@implementation WFStringContentItem

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Text Items");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Text (plural)", @"Text");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Text (singular)", @"Text");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Documents";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
  v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)pdfCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:&__block_literal_global_61];
}

void __41__WFStringContentItem_pdfCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  v8 = [a3 options];
  v9 = [v8 dictionary];
  v10 = [v9 objectForKey:@"WFCoercionOptionPDFIncludeMargin"];
  char v11 = [v10 BOOLValue];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__WFStringContentItem_pdfCoercionHandler__block_invoke_2;
  v14[3] = &unk_2642861F0;
  char v16 = v11;
  id v15 = v6;
  v12 = (Class (__cdecl *)())getUIPrintFormatterClass;
  id v13 = v6;
  [v7 getObjectRepresentation:v14 forClass:v12() options:v8];
}

void __41__WFStringContentItem_pdfCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = a2;
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  v5 = [v3 arrayWithObjects:v6 count:1];
  +[WFPDFContentItem getPDFFromPrintFormatters:v5 nameIfKnown:0 matchingInputSize:1 withMargin:*(unsigned __int8 *)(a1 + 40) startingAtPage:1 endingAtPage:0x7FFFFFFFFFFFFFFFLL completionHandler:*(void *)(a1 + 32)];
}

+ (id)coercions
{
  v39[11] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_class();
  v38 = [a1 stringCoercionHandler];
  v37 = +[WFCoercion coercionToClass:v3 handler:v38];
  v39[0] = v37;
  v36 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
  v35 = [a1 textFileCoercionHandler];
  v34 = +[WFCoercion coercionToType:v36 handler:v35];
  v39[1] = v34;
  v33 = +[WFObjectType typeWithClassName:@"UIPrintFormatter" frameworkName:@"UIKit" location:2];
  v32 = [a1 printFormatterCoercionHandler];
  v31 = +[WFCoercion coercionToType:v33 handler:v32];
  v39[2] = v31;
  uint64_t v4 = objc_opt_class();
  v30 = +[WFCoercionHandler keyPath:@"dataDetectorResults.URLs" unavailableIfNilOrEmpty:1];
  v29 = +[WFCoercion coercionToClass:v4 handler:v30];
  v39[3] = v29;
  uint64_t v5 = objc_opt_class();
  v28 = +[WFCoercionHandler keyPath:@"dataDetectorResults.dates" unavailableIfNilOrEmpty:1];
  v27 = +[WFCoercion coercionToClass:v5 handler:v28];
  v39[4] = v27;
  uint64_t v6 = objc_opt_class();
  v26 = +[WFCoercionHandler keyPath:@"dataDetectorResults.streetAddresses" unavailableIfNilOrEmpty:1];
  v25 = +[WFCoercion coercionToClass:v6 handler:v26];
  v39[5] = v25;
  uint64_t v7 = objc_opt_class();
  v24 = +[WFCoercionHandler keyPath:@"dataDetectorResults.phoneNumbers" unavailableIfNilOrEmpty:1];
  v23 = +[WFCoercion coercionToClass:v7 handler:v24];
  v39[6] = v23;
  uint64_t v8 = objc_opt_class();
  v9 = [a1 dictionaryCoercionHandler];
  v10 = +[WFCoercion coercionToClass:v8 handler:v9];
  v39[7] = v10;
  uint64_t v11 = objc_opt_class();
  v12 = +[WFCoercionHandler keyPath:@"dataDetectorResults.number" unavailableIfNilOrEmpty:1];
  id v13 = +[WFCoercion coercionToClass:v11 handler:v12];
  v39[8] = v13;
  v14 = [NSNumber numberWithBool:1];
  uint64_t v15 = objc_opt_class();
  char v16 = +[WFCoercionHandler block:&__block_literal_global_58_2579];
  v17 = +[WFCoercion coercionToClass:v15 handler:v16];
  v39[9] = v17;
  v18 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
  v19 = [a1 pdfCoercionHandler];
  v20 = +[WFCoercion coercionToType:v18 handler:v19];
  v39[10] = v20;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:11];

  return v22;
}

id __32__WFStringContentItem_coercions__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 string];
  uint64_t v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "BOOLValue"));

  return v4;
}

+ (id)textFileCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_28_2596];
}

id __46__WFStringContentItem_textFileCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v7 requestedType];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v7 options];

  v12 = [v11 dictionary];
  id v13 = [v12 objectForKey:@"WFCoercionOptionStringSecureFilename"];
  char v14 = [v13 BOOLValue];

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x263F08C38] UUID];
    char v16 = [v15 UUIDString];
  }
  else
  {
    char v16 = [v6 name];
  }
  v17 = +[WFFileRepresentation proposedFilenameForFile:v16 ofType:v10];
  v18 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v17];
  v19 = [v6 string];
  char v20 = [v19 writeToURL:v18 atomically:0 encoding:4 error:a4];

  if (v20)
  {
    v21 = +[WFFileRepresentation fileWithURL:v18 options:1 ofType:v10 proposedFilename:v17];
  }
  else
  {
    id v22 = getWFContentGraphLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315138;
      v25 = "+[WFStringContentItem textFileCoercionHandler]_block_invoke";
      _os_log_impl(&dword_216505000, v22, OS_LOG_TYPE_ERROR, "%s Failed to write data for WFStringContentItem", (uint8_t *)&v24, 0xCu);
    }

    v21 = 0;
  }

  return v21;
}

+ (id)printFormatterCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:&__block_literal_global_25_2602];
}

void __52__WFStringContentItem_printFormatterCoercionHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__WFStringContentItem_printFormatterCoercionHandler__block_invoke_2;
  v9[3] = &unk_264288800;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __52__WFStringContentItem_printFormatterCoercionHandler__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(getUISimpleTextPrintFormatterClass());
  uint64_t v3 = [*(id *)(a1 + 32) string];
  id v4 = (id)[v2 initWithText:v3];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)dictionaryCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_19 availabilityCheck:&__block_literal_global_22_2605];
}

BOOL __48__WFStringContentItem_dictionaryCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 dataDetectorResults];
  uint64_t v3 = [v2 dictionaries];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

id __48__WFStringContentItem_dictionaryCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [a2 dataDetectorResults];
  uint64_t v3 = [v2 dictionaryType];
  BOOL v4 = [v2 dictionaries];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "setWf_preferredFileType:", v3);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)stringCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_2608];
}

id __44__WFStringContentItem_stringCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = [v6 internalRepresentationType];
  v9 = [v6 fileRepresentationForType:v8];

  long long v10 = [v9 data];
  if (v10)
  {
    long long v11 = objc_msgSend(NSString, "wf_stringWithData:", v10);
    long long v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      char v14 = getWFContentGraphLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        int v18 = 136315394;
        v19 = "+[WFStringContentItem stringCoercionHandler]_block_invoke";
        __int16 v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_216505000, v14, OS_LOG_TYPE_FAULT, "%s Failed to decode string with data %@", (uint8_t *)&v18, 0x16u);
      }

      uint64_t v15 = objc_opt_class();
      char v16 = [v7 requestedType];
      *a4 = [v15 badCoercionErrorForType:v16];
    }
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
LABEL_2:
    v17 = [v13 string];
    int v18 = [v12 objectForKey:v17];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [a1 itemWithObject:v18 named:v14 attributionSet:v15 cachingIdentifier:v16];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v20 = +[WFFileRepresentation fileWithData:v18 ofType:v13 proposedFilename:v14];
        v19 = [a1 itemWithFile:v20 attributionSet:v15 cachingIdentifier:v16];
      }
      else
      {
        v19 = 0;
      }
    }
    v21 = v13;
    goto LABEL_19;
  }
  v21 = [a1 ownedTypes];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v18 = [v12 allKeys];
  uint64_t v22 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v22)
  {
    v19 = 0;
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v23 = v22;
  id v27 = a1;
  id v28 = v14;
  uint64_t v24 = *(void *)v30;
LABEL_8:
  uint64_t v25 = 0;
  while (1)
  {
    if (*(void *)v30 != v24) {
      objc_enumerationMutation(v18);
    }
    objc_msgSend(MEMORY[0x263F852B8], "typeWithString:", *(void *)(*((void *)&v29 + 1) + 8 * v25), v27);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if ([v13 conformsToTypes:v21]) {
      break;
    }

    if (v23 == ++v25)
    {
      uint64_t v23 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v23) {
        goto LABEL_8;
      }
      v19 = 0;
      id v14 = v28;
      goto LABEL_19;
    }
  }

  a1 = v27;
  id v14 = v28;
  if (v13) {
    goto LABEL_2;
  }
  v19 = 0;
LABEL_20:

  return v19;
}

- (void).cxx_destruct
{
}

- (void)setDataDetectorResults:(id)a3
{
}

- (BOOL)isContent
{
  return 1;
}

- (WFDataDetectorResults)dataDetectorResults
{
  dataDetectorResults = self->_dataDetectorResults;
  if (!dataDetectorResults)
  {
    BOOL v4 = [(WFStringContentItem *)self string];
    if (v4)
    {
      uint64_t v5 = [(WFStringContentItem *)self string];
      id v6 = +[WFDataDetector resultsForString:v5 ofTypes:0x600000838 error:0];
      id v7 = self->_dataDetectorResults;
      self->_dataDetectorResults = v6;
    }
    else
    {
      id v8 = (WFDataDetectorResults *)objc_opt_new();
      uint64_t v5 = self->_dataDetectorResults;
      self->_dataDetectorResults = v8;
    }

    dataDetectorResults = self->_dataDetectorResults;
  }
  return dataDetectorResults;
}

- (NSString)string
{
  uint64_t v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  BOOL v4 = [(WFContentItem *)self getRepresentationsForType:v3 error:0];
  uint64_t v5 = [v4 firstObject];
  id v6 = [v5 object];

  return (NSString *)v6;
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  id v2 = [(WFContentItem *)self internalRepresentationType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end