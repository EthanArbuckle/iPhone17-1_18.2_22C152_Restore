@interface WFRichTextContentItem
+ (BOOL)isMissingHTMLHeaderInString:(id)a3;
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)attributesDictionaryForType:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)documentTypeForType:(id)a3;
+ (id)htmlFooter;
+ (id)htmlHeader;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)normalizedHTMLDocumentFromHTML:(id)a3;
+ (id)normalizedHTMLDocumentFromHTMLData:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)stringConversionBehavior;
+ (int64_t)tableTemplateSubjectType;
+ (void)loadAttributedStringInWebViewFromHTMLFile:(id)a3 handler:(id)a4 attributedStringOptions:(id)a5 documentAttributes:(id *)a6 name:(id)a7 coercionOptions:(id)a8;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)isContent;
- (WFFileType)preferredFileType;
- (id)attributedString;
- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5;
- (void)generateAttributedString:(id)a3 fromFile:(id)a4 forClass:(Class)a5 coercionOptions:(id)a6;
- (void)generateDataRepresentation:(id)a3 fromAttributedString:(id)a4 forType:(id)a5;
- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)generateRTFDRepresentation:(id)a3 fromAttributedString:(id)a4 forType:(id)a5;
- (void)getFileRepresentationsForSerialization:(id)a3;
- (void)getPDFFromResource:(id)a3 includeMargin:(BOOL)a4 options:(id)a5 handler:(id)a6;
@end

@implementation WFRichTextContentItem

- (void)getPDFFromResource:(id)a3 includeMargin:(BOOL)a4 options:(id)a5 handler:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = objc_alloc_init(WFWebResourceCapturer);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__WFRichTextContentItem_getPDFFromResource_includeMargin_options_handler___block_invoke;
  v15[3] = &unk_264289E40;
  v16 = v12;
  id v17 = v9;
  v13 = v12;
  id v14 = v9;
  [(WFWebResourceCapturer *)v13 generatePDFForWebResource:v11 includeMargin:v7 coercionOptions:v10 completionHandler:v15];
}

void __74__WFRichTextContentItem_getPDFFromResource_includeMargin_options_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v8[0] = v5;
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    BOOL v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (WFFileType)preferredFileType
{
  v3 = [(WFContentItem *)self internalRepresentationType];
  int v4 = [v3 conformsToClass:objc_opt_class()];

  if (v4)
  {
    id v5 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC68]];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFRichTextContentItem;
    id v5 = [(WFContentItem *)&v7 preferredFileType];
  }
  return (WFFileType *)v5;
}

- (BOOL)isContent
{
  return 1;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentItem *)self objectForClass:objc_opt_class()];
  if (!v5) {
    goto LABEL_10;
  }
  if ([v4 conformsToClass:objc_opt_class()])
  {
    uint64_t v25 = 0;
    uint64_t v26 = (uint64_t)&v25;
    uint64_t v27 = 0x2020000000;
    LOBYTE(v28) = 0;
    id v6 = getNSLinkAttributeName();
    uint64_t v7 = [v5 length];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __58__WFRichTextContentItem_canGenerateRepresentationForType___block_invoke;
    v24[3] = &unk_264287160;
    v24[4] = &v25;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v24);

    unsigned __int8 v8 = *(unsigned char *)(v26 + 24) != 0;
    id v9 = &v25;
LABEL_9:
    _Block_object_dispose(v9, 8);
LABEL_11:

    return v8;
  }
  if (![v4 conformsToClass:objc_opt_class()])
  {
LABEL_10:
    v18.receiver = self;
    v18.super_class = (Class)WFRichTextContentItem;
    unsigned __int8 v8 = [(WFGenericFileContentItem *)&v18 canGenerateRepresentationForType:v4];
    goto LABEL_11;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  id v10 = (id *)getNSAttachmentAttributeNameSymbolLoc_ptr;
  uint64_t v33 = getNSAttachmentAttributeNameSymbolLoc_ptr;
  if (!getNSAttachmentAttributeNameSymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    uint64_t v27 = (uint64_t)__getNSAttachmentAttributeNameSymbolLoc_block_invoke;
    v28 = &unk_26428AC60;
    v29 = &v30;
    id v11 = UIFoundationLibrary();
    v12 = dlsym(v11, "NSAttachmentAttributeName");
    *(void *)(v29[1] + 24) = v12;
    getNSAttachmentAttributeNameSymbolLoc_ptr = *(void *)(v29[1] + 24);
    id v10 = (id *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (v10)
  {
    id v13 = *v10;
    uint64_t v14 = [v5 length];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __58__WFRichTextContentItem_canGenerateRepresentationForType___block_invoke_2;
    v19[3] = &unk_264287188;
    v19[4] = &v20;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v14, 0, v19);

    unsigned __int8 v8 = *((unsigned char *)v21 + 24) != 0;
    id v9 = &v20;
    goto LABEL_9;
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  id v17 = [NSString stringWithUTF8String:"NSAttributedStringKey getNSAttachmentAttributeName(void)"];
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"WFRichTextContentItem.m", 46, @"%s", dlerror());

  __break(1u);
  return result;
}

uint64_t __58__WFRichTextContentItem_canGenerateRepresentationForType___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __58__WFRichTextContentItem_canGenerateRepresentationForType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = (void *)MEMORY[0x263F852B8];
  unsigned __int8 v8 = [a2 fileType];
  id v9 = [v7 typeWithString:v8];

  if ([v9 conformsToUTType:*MEMORY[0x263F1DB18]])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  v54[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ((Class)objc_opt_class() != a5)
  {
    if ((Class)objc_opt_class() == a5)
    {
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_2;
      v50[3] = &unk_2642870C0;
      id v51 = v8;
      [(WFContentItem *)self getObjectRepresentation:v50 forClass:objc_opt_class() options:v9];
      uint64_t v20 = v51;
    }
    else
    {
      id v10 = NSStringFromClass(a5);
      int v11 = [@"UIPrintFormatter" isEqualToString:v10];

      if (v11)
      {
        v12 = [(WFContentItem *)self internalRepresentationType];
        int v13 = [v12 isEqualToUTType:*MEMORY[0x263F1DD70]];

        uint64_t v14 = [(WFContentItem *)self internalRepresentationType];
        v15 = v14;
        if (v13)
        {
          v16 = [(WFContentItem *)self fileRepresentationForType:v14];

          id v17 = +[WFWebResource webResourceWithFile:v16];
          v48[0] = MEMORY[0x263EF8330];
          v48[1] = 3221225472;
          v48[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_4;
          v48[3] = &unk_2642883C8;
          id v49 = v8;
          +[WFWebResourceCapturer getPrintFormatterForWebResource:v17 coercionOptions:v9 completionHandler:v48];

LABEL_21:
          goto LABEL_22;
        }
        int v21 = [v14 isEqualToUTType:*MEMORY[0x263F1DB00]];

        if (v21)
        {
          uint64_t v22 = [(WFContentItem *)self internalRepresentationType];
          char v23 = [(WFContentItem *)self fileRepresentationForType:v22];
          v24 = NSString;
          uint64_t v25 = [v23 data];
          uint64_t v26 = objc_msgSend(v24, "wf_stringWithData:", v25);

          uint64_t v27 = [v23 originalURL];
          v28 = +[WFWebResource webResourceWithHTMLString:v26 baseURL:v27];

          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_5;
          v46[3] = &unk_2642883C8;
          id v47 = v8;
          +[WFWebResourceCapturer getPrintFormatterForWebResource:v28 coercionOptions:v9 completionHandler:v46];

          goto LABEL_22;
        }
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_6;
        v44[3] = &unk_26428AA88;
        v44[4] = self;
        id v45 = v8;
        [(WFContentItem *)self getObjectRepresentation:v44 forClass:objc_opt_class() options:v9];
        uint64_t v20 = v45;
        goto LABEL_8;
      }
      if ((Class)objc_opt_class() != a5)
      {
        v16 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
        (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v16);
        goto LABEL_21;
      }
      v29 = [(WFContentItem *)self internalRepresentationType];
      int v30 = [v29 isEqualToUTType:*MEMORY[0x263F1DB00]];

      v31 = [(WFContentItem *)self internalRepresentationType];
      if ([v31 isEqualToUTType:*MEMORY[0x263F1DD70]])
      {

LABEL_17:
        v34 = [(WFContentItem *)self internalRepresentationType];
        v16 = [(WFContentItem *)self fileRepresentationForType:v34];

        if (v30)
        {
          v35 = NSString;
          v36 = [v16 data];
          v37 = objc_msgSend(v35, "wf_stringWithData:", v36);

          v38 = [v16 originalURL];
          v39 = +[WFWebResource webResourceWithHTMLString:v37 baseURL:v38];
        }
        else
        {
          v39 = +[WFWebResource webResourceWithFile:v16];
        }
        v40 = +[WFObjectRepresentation object:v39];
        v54[0] = v40;
        v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:1];
        (*((void (**)(id, void *, void))v8 + 2))(v8, v41, 0);

        goto LABEL_21;
      }
      uint64_t v32 = [(WFContentItem *)self internalRepresentationType];
      int v33 = [v32 isEqualToUTType:*MEMORY[0x263F1DC68]] | v30;

      if (v33 == 1) {
        goto LABEL_17;
      }
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_8;
      v42[3] = &unk_2642870C0;
      id v43 = v8;
      [(WFContentItem *)self getObjectRepresentation:v42 forClass:objc_opt_class() options:v9];
      uint64_t v20 = v43;
    }
LABEL_8:

    goto LABEL_22;
  }
  objc_super v18 = [(WFContentItem *)self internalRepresentationType];
  v19 = [(WFContentItem *)self fileRepresentationForType:v18];

  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke;
  v52[3] = &unk_2642870C0;
  id v53 = v8;
  [(WFRichTextContentItem *)self generateAttributedString:v52 fromFile:v19 forClass:a5 coercionOptions:v9];

LABEL_22:
}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2)
  {
    id v7 = a4;
    id v8 = +[WFObjectRepresentation object:a2 named:a3];
    v11[0] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v9, v7);
  }
  else
  {
    id v10 = *(void (**)(uint64_t, void, id))(v4 + 16);
    id v8 = a4;
    v10(v4, 0, v8);
  }
}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = getNSLinkAttributeName();
    uint64_t v6 = [v3 length];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_3;
    v9[3] = &unk_264287138;
    id v10 = v3;
    id v11 = v4;
    id v7 = v4;
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v9);

    (*(void (**)(void, id, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7, 0, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2)
  {
    id v7 = a4;
    id v8 = +[WFObjectRepresentation object:a2 named:a3];
    v11[0] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v9, v7);
  }
  else
  {
    id v10 = *(void (**)(uint64_t, void, id))(v4 + 16);
    id v8 = a4;
    v10(v4, MEMORY[0x263EFFA68], v8);
  }
}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[WFObjectRepresentation object:a2 named:a3];
  v6[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v5, 0);
}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_7;
    block[3] = &unk_26428A9D8;
    id v7 = v3;
    id v5 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_8(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = getNSDocumentTypeDocumentAttribute();
    uint64_t v14 = v4;
    id v5 = getNSHTMLTextDocumentType();
    v15[0] = v5;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

    id v7 = objc_msgSend(v3, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v3, "length"), v6, 0);
    uint64_t v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    id v9 = +[WFWebResource webResourceWithHTMLString:v8 baseURL:0];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = +[WFObjectRepresentation object:v9];
    int v13 = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v12, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_7(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(getUISimpleTextPrintFormatterClass_8062()) initWithAttributedText:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = [*(id *)(a1 + 40) name];
  id v5 = +[WFObjectRepresentation object:v2 named:v4];
  v7[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v6, 0);
}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v16 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [NSURL URLWithString:v16];

    id v16 = (id)v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = v16;
    uint64_t v10 = objc_msgSend(v8, "attributedSubstringFromRange:", a3, a4);
    id v11 = [v10 string];
    v12 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    int v13 = [v11 stringByTrimmingCharactersInSet:v12];

    uint64_t v14 = *(void **)(a1 + 40);
    v15 = +[WFObjectRepresentation object:v9 named:v13];

    [v14 addObject:v15];
  }
}

- (void)generateAttributedString:(id)a3 fromFile:(id)a4 forClass:(Class)a5 coercionOptions:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v10 wfType];
  int v13 = [v12 conformsToUTType:*MEMORY[0x263F1DAA8]];

  if (!v13) {
    goto LABEL_6;
  }
  id v14 = objc_alloc(MEMORY[0x263F08870]);
  v15 = [v10 mappedData];
  id v16 = (void *)[v14 initWithSerializedRepresentation:v15];

  id v17 = [v10 filename];
  objc_super v18 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC70]];
  v19 = +[WFFileRepresentation proposedFilenameForFile:v17 ofType:v18];

  uint64_t v20 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v19];
  id v46 = 0;
  int v21 = [v16 writeToURL:v20 options:0 originalContentsURL:0 error:&v46];
  id v22 = v46;
  if (v21)
  {
    uint64_t v23 = +[WFFileRepresentation fileWithURL:v20 options:1];

    id v10 = (id)v23;
  }
  else
  {
    (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v22);
  }

  if (v21)
  {
LABEL_6:
    v24 = objc_opt_class();
    uint64_t v25 = [v10 wfType];
    uint64_t v26 = [v24 attributesDictionaryForType:v25];

    uint64_t v27 = [v10 wfType];
    if ([v27 conformsToUTType:*MEMORY[0x263F1DB00]])
    {
    }
    else
    {
      v28 = [v10 wfType];
      int v29 = [v28 conformsToUTType:*MEMORY[0x263F1DD70]];

      if (!v29)
      {
        uint64_t v34 = [v10 representationType];
        id v35 = objc_alloc(MEMORY[0x263F086A0]);
        if (v34)
        {
          v36 = [v10 fileURL];
          uint64_t v41 = 0;
          uint64_t v42 = 0;
          v37 = (id *)&v42;
          v38 = (id *)&v41;
          uint64_t v39 = [v35 initWithURL:v36 options:v26 documentAttributes:&v42 error:&v41];
        }
        else
        {
          v36 = [v10 mappedData];
          uint64_t v43 = 0;
          uint64_t v44 = 0;
          v37 = (id *)&v44;
          v38 = (id *)&v43;
          uint64_t v39 = [v35 initWithData:v36 options:v26 documentAttributes:&v44 error:&v43];
        }
        v31 = (void *)v39;
        id v32 = *v37;
        id v33 = *v38;

        v40 = [(WFContentItem *)self name];
        (*((void (**)(id, void *, void *, void))v9 + 2))(v9, v31, v40, 0);

        goto LABEL_14;
      }
    }
    int v30 = objc_opt_class();
    id v45 = 0;
    v31 = [(WFContentItem *)self name];
    [v30 loadAttributedStringInWebViewFromHTMLFile:v10 handler:v9 attributedStringOptions:v26 documentAttributes:&v45 name:v31 coercionOptions:v11];
    id v32 = v45;
    id v33 = 0;
LABEL_14:
  }
}

- (void)getFileRepresentationsForSerialization:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v16 = @"ContinueLoadingWebContentIfExternalResourcesAreDenied";
  v17[0] = MEMORY[0x263EFFA88];
  id v5 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v6 = +[WFCoercionOptions optionsWithDictionary:v5];

  uint64_t v7 = [(WFContentItem *)self internalRepresentationType];
  if ([v7 conformsToUTType:*MEMORY[0x263F1DB00]])
  {
    uint64_t v8 = [MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]];
  }
  else
  {
    uint64_t v8 = 0;
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke;
  v12[3] = &unk_264289130;
  v12[4] = self;
  id v13 = v8;
  id v14 = v6;
  id v15 = v4;
  id v9 = v6;
  id v10 = v8;
  id v11 = v4;
  [(WFContentItem *)self getFileRepresentation:v12 forType:v10 options:v9];
}

void __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke_2;
    v8[3] = &unk_264289130;
    id v12 = *(id *)(a1 + 56);
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v3;
    uint64_t v7 = objc_msgSend(MEMORY[0x263F852B8], "typeWithUTType:", *MEMORY[0x263F1DC20], v8[0], 3221225472, __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke_2, &unk_264289130);
    [v4 getFileRepresentation:v8 forType:v7 options:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void v17[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x263F1DC68];
    if ([*(id *)(a1 + 32) conformsToUTType:*MEMORY[0x263F1DC68]])
    {
      uint64_t v8 = *(void *)(a1 + 56);
      v17[0] = *(void *)(a1 + 48);
      v17[1] = v5;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
      (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
    }
    else
    {
      uint64_t v10 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke_3;
      v12[3] = &unk_264289130;
      id v16 = *(id *)(a1 + 56);
      id v13 = *(id *)(a1 + 48);
      id v14 = v5;
      id v15 = v6;
      id v11 = [MEMORY[0x263F852B8] typeWithUTType:v7];
      [v10 getFileRepresentation:v12 forType:v11];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[7];
  objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a1[4], a1[5], a2, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, a1[6]);
}

- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isEqualToUTType:*MEMORY[0x263F1DBF0]])
  {
    id v11 = [v9 dictionary];
    id v12 = [v11 objectForKey:@"WFCoercionOptionPDFIncludeMargin"];
    char v13 = [v12 BOOLValue];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke;
    v29[3] = &unk_264287098;
    id v31 = v8;
    v29[4] = self;
    char v32 = v13;
    id v30 = v9;
    [(WFContentItem *)self getObjectRepresentation:v29 forClass:objc_opt_class() options:v30];

    id v14 = v31;
LABEL_8:

    goto LABEL_9;
  }
  if (![v10 conformsToUTType:*MEMORY[0x263F1DB18]])
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke_24;
    v23[3] = &unk_2642870E8;
    id v26 = v8;
    id v24 = v10;
    uint64_t v25 = self;
    [(WFContentItem *)self getObjectRepresentation:v23 forClass:objc_opt_class() options:v9];

    id v14 = v26;
    goto LABEL_8;
  }
  id v15 = [(WFContentItem *)self internalRepresentationType];
  int v16 = [v15 isEqualToUTType:*MEMORY[0x263F1DD70]];

  if (!v16)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke_2;
    v27[3] = &unk_2642870C0;
    id v28 = v8;
    [(WFContentItem *)self getObjectRepresentation:v27 forClass:objc_opt_class() options:v9];
    id v14 = v28;
    goto LABEL_8;
  }
  id v17 = [(WFContentItem *)self internalRepresentationType];
  objc_super v18 = [(WFContentItem *)self fileRepresentationForType:v17];

  v19 = [WFWebArchive alloc];
  uint64_t v20 = [v18 mappedData];
  int v21 = [(WFWebArchive *)v19 initWithData:v20];

  id v22 = [(WFWebArchive *)v21 containedImageFiles];
  (*((void (**)(id, void *, void))v8 + 2))(v8, v22, 0);

LABEL_9:
}

uint64_t __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) getPDFFromResource:a2 includeMargin:*(unsigned __int8 *)(a1 + 56) options:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [a2 containedImageFiles];
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);
  }
  else
  {
    id v9 = getWFContentGraphLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[WFRichTextContentItem generateFileRepresentations:options:forType:]_block_invoke_2";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_216505000, v9, OS_LOG_TYPE_ERROR, "%s Failed to coerce to NSAttributedString with error %@", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke_24(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v9)
  {
    if (([*(id *)(a1 + 32) conformsToUTType:*MEMORY[0x263F1DC70]] & 1) != 0
      || [*(id *)(a1 + 32) conformsToUTType:*MEMORY[0x263F1DAA8]])
    {
      [*(id *)(a1 + 40) generateRTFDRepresentation:*(void *)(a1 + 48) fromAttributedString:v9 forType:*(void *)(a1 + 32)];
    }
    else
    {
      [*(id *)(a1 + 40) generateDataRepresentation:*(void *)(a1 + 48) fromAttributedString:v9 forType:*(void *)(a1 + 32)];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = (void *)MEMORY[0x263F852B8];
  uint64_t v7 = *MEMORY[0x263F85A38];
  id v8 = a3;
  id v9 = [v6 typeFromPasteboardType:v7];
  LODWORD(v7) = [v8 conformsToType:v9];

  if (v7
    && ([(WFContentItem *)self internalRepresentationType],
        int v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 conformsToUTType:*MEMORY[0x263F1DB00]],
        v10,
        v11))
  {
    __int16 v12 = [(WFContentItem *)self internalRepresentationType];
    id v13 = [(WFContentItem *)self fileRepresentationForType:v12];
    uint64_t v14 = [WFWebResource alloc];
    id v15 = [v13 mappedData];
    int v16 = [v13 originalURL];
    id v17 = [v12 MIMEType];
    objc_super v18 = [v13 wfName];
    v19 = [(WFWebResource *)v14 initWithData:v15 URL:v16 MIMEType:v17 textEncodingName:@"UTF-8" frameName:v18];

    uint64_t v20 = [[WFWebArchive alloc] initWithMainResource:v19 subresources:0 subframeArchives:0];
    int v21 = [(WFWebArchive *)v20 data];
    id v22 = [v13 wfName];
    uint64_t v23 = +[WFFileRepresentation fileWithData:v21 ofType:v9 proposedFilename:v22];
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (void)generateDataRepresentation:(id)a3 fromAttributedString:(id)a4 forType:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *, void))a3;
  id v9 = a5;
  id v10 = a4;
  int v11 = [(id)objc_opt_class() attributesDictionaryForType:v9];
  id v17 = 0;
  __int16 v12 = objc_msgSend(v10, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v10, "length"), v11, &v17);

  id v13 = v17;
  uint64_t v14 = [(WFContentItem *)self name];
  id v15 = +[WFFileRepresentation fileWithData:v12 ofType:v9 proposedFilename:v14];

  if (v15)
  {
    v18[0] = v15;
    int v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    v8[2](v8, v16, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v13);
  }
}

- (void)generateRTFDRepresentation:(id)a3 fromAttributedString:(id)a4 forType:(id)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *, void))a3;
  id v9 = a5;
  id v10 = a4;
  int v11 = [(id)objc_opt_class() attributesDictionaryForType:v9];
  id v26 = 0;
  __int16 v12 = objc_msgSend(v10, "fileWrapperFromRange:documentAttributes:error:", 0, objc_msgSend(v10, "length"), v11, &v26);

  id v13 = v26;
  if (v12)
  {
    if ([v9 conformsToUTType:*MEMORY[0x263F1DAA8]])
    {
      uint64_t v14 = [v12 serializedRepresentation];
      id v15 = [(WFContentItem *)self name];
      int v16 = +[WFFileRepresentation fileWithData:v14 ofType:v9 proposedFilename:v15];

      if (v16)
      {
        v28[0] = v16;
        id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
        v8[2](v8, v17, 0);
      }
      else
      {
        v8[2](v8, 0, 0);
      }
    }
    else
    {
      uint64_t v18 = [(WFContentItem *)self name];
      v19 = +[WFFileRepresentation proposedFilenameForFile:v18 ofType:v9];
      uint64_t v20 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v19];

      id v25 = v13;
      LOBYTE(v18) = [v12 writeToURL:v20 options:0 originalContentsURL:0 error:&v25];
      id v21 = v25;

      if (v18)
      {
        id v22 = [(WFContentItem *)self name];
        uint64_t v23 = +[WFFileRepresentation fileWithURL:v20 options:1 ofType:v9 proposedFilename:v22];
        uint64_t v27 = v23;
        id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
        v8[2](v8, v24, 0);
      }
      else
      {
        ((void (**)(id, void *, id))v8)[2](v8, 0, v21);
      }

      id v13 = v21;
    }
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v13);
  }
}

- (id)attributedString
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v11 = 0;
  id v4 = [(WFContentItem *)self getRepresentationsForType:v3 error:&v11];
  id v5 = v11;
  id v6 = [v4 firstObject];
  uint64_t v7 = [v6 object];

  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v5 == 0;
  }
  if (!v8)
  {
    id v9 = getWFContentGraphLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[WFRichTextContentItem attributedString]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_216505000, v9, OS_LOG_TYPE_ERROR, "%s Error getting attributed string from rich text content item: %@", buf, 0x16u);
    }
  }
  return v7;
}

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Rich Text Items");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Rich text (plural)", @"Rich text");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Rich text (singular)", @"Rich text");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Documents";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
  id v5 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB18]];
  id v6 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
  uint64_t v7 = +[WFObjectType typeWithClassName:@"UIPrintFormatter" frameworkName:@"UIKit" location:2];
  BOOL v8 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v9 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, 0);

  return v9;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC68]];
  id v5 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC70]];
  id v6 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAA8]];
  uint64_t v7 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
  BOOL v8 = [MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]];
  id v9 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, 0);

  return v9;
}

+ (id)stringConversionBehavior
{
  v2 = WFLocalizedStringWithKey(@"Text - Default Name", @"Text");
  id v3 = +[WFContentItemStringConversionBehavior coercingToStringWithDescription:v2];

  return v3;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  if (([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToUTType:*MEMORY[0x263F1DC20]] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFRichTextContentItem;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)normalizedHTMLDocumentFromHTMLData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_msgSend(NSString, "if_stringWithData:", v4);
  if ([a1 isMissingHTMLHeaderInString:v5])
  {
    uint64_t v6 = [NSString stringEncodingForData:v4 encodingOptions:0 convertedString:0 usedLossyConversion:0];
    id v7 = (id)objc_opt_new();
    BOOL v8 = [a1 htmlHeader];
    id v9 = [v8 dataUsingEncoding:v6];
    [v7 appendData:v9];

    [v7 appendData:v4];
    id v10 = [a1 htmlFooter];
    id v11 = [v10 dataUsingEncoding:v6];
    [v7 appendData:v11];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

+ (BOOL)isMissingHTMLHeaderInString:(id)a3
{
  if (a3)
  {
    id v3 = [a3 lowercaseString];
    int v4 = [v3 containsString:@"<html"] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (id)normalizedHTMLDocumentFromHTML:(id)a3
{
  id v4 = a3;
  if ([a1 isMissingHTMLHeaderInString:v4])
  {
    unsigned __int8 v5 = [a1 htmlHeader];
    uint64_t v6 = [v5 stringByAppendingString:v4];
    id v7 = [a1 htmlFooter];
    id v8 = [v6 stringByAppendingString:v7];
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

+ (id)htmlFooter
{
  return @"\n</body>\n</html>\n";
}

+ (id)htmlHeader
{
  return @"<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\">\n</head>\n<body>\n";
}

+ (void)loadAttributedStringInWebViewFromHTMLFile:(id)a3 handler:(id)a4 attributedStringOptions:(id)a5 documentAttributes:(id *)a6 name:(id)a7 coercionOptions:(id)a8
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a8;
  id v15 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v26 = "+[WFRichTextContentItem loadAttributedStringInWebViewFromHTMLFile:handler:attributedStringOptions:documentAttr"
          "ibutes:name:coercionOptions:]";
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl(&dword_216505000, v15, OS_LOG_TYPE_DEBUG, "%s Transforming HTML file %@ to NSAttributedString via WKWebView.", buf, 0x16u);
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke;
  v20[3] = &unk_2642881E8;
  id v21 = v11;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  id v19 = v11;
  dispatch_async(MEMORY[0x263EF83A0], v20);
}

void __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke(uint64_t a1)
{
  v2 = +[WFWebResource webResourceWithFile:*(void *)(a1 + 32)];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v3 = (void *)getWKWebViewConfigurationClass_softClass;
  uint64_t v14 = getWKWebViewConfigurationClass_softClass;
  if (!getWKWebViewConfigurationClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getWKWebViewConfigurationClass_block_invoke;
    v10[3] = &unk_26428AC60;
    v10[4] = &v11;
    __getWKWebViewConfigurationClass_block_invoke((uint64_t)v10);
    id v3 = (void *)v12[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v11, 8);
  unsigned __int8 v5 = objc_opt_new();
  [v5 _setAllowsJavaScriptMarkup:0];
  uint64_t v6 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke_2;
  v7[3] = &unk_264288DB8;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", v2, v5, v6, v7, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

void __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke_3;
    v5[3] = &unk_264287110;
    id v7 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    [a2 _getContentsAsAttributedStringWithCompletionHandler:v5];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

+ (id)attributesDictionaryForType:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [a1 documentTypeForType:v4];
  id v6 = getNSPlainTextDocumentType();
  if ([v5 isEqualToString:v6])
  {
    id v7 = [NSNumber numberWithUnsignedInteger:4];
  }
  else
  {
    id v7 = 0;
  }

  id v8 = NSDictionary;
  id v9 = getNSDocumentTypeDocumentAttribute();
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  id v10 = (void *)getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr;
  uint64_t v19 = getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr;
  if (!getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr)
  {
    uint64_t v11 = UIFoundationLibrary();
    void v17[3] = (uint64_t)dlsym(v11, "NSCharacterEncodingDocumentAttribute");
    getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr = v17[3];
    id v10 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v10)
  {
    id v12 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v5, v9, v7, *v10, 0);

    return v12;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    id v15 = [NSString stringWithUTF8String:"NSAttributedStringDocumentAttributeKey getNSCharacterEncodingDocumentAttribute(void)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"WFRichTextContentItem.m", 47, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)documentTypeForType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToUTType:*MEMORY[0x263F1DC68]])
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    id v4 = (id *)getNSRTFTextDocumentTypeSymbolLoc_ptr;
    uint64_t v19 = getNSRTFTextDocumentTypeSymbolLoc_ptr;
    if (!getNSRTFTextDocumentTypeSymbolLoc_ptr)
    {
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      uint64_t v14 = __getNSRTFTextDocumentTypeSymbolLoc_block_invoke;
      id v15 = &unk_26428AC60;
      unsigned __int8 v5 = UIFoundationLibrary();
      void v17[3] = (uint64_t)dlsym(v5, "NSRTFTextDocumentType");
      getNSRTFTextDocumentTypeSymbolLoc_ptr = v17[3];
      id v4 = (id *)v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v4)
    {
      id v6 = [MEMORY[0x263F08690] currentHandler];
      id v7 = [NSString stringWithUTF8String:"NSAttributedStringDocumentType getNSRTFTextDocumentType(void)"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"WFRichTextContentItem.m", 52, @"%s", dlerror(), v12, v13, v14, v15);
LABEL_24:

      __break(1u);
      return result;
    }
LABEL_11:
    id v9 = (__CFString *)*v4;
LABEL_12:
    id v10 = v9;
    goto LABEL_13;
  }
  if (([v3 isEqualToUTType:*MEMORY[0x263F1DC70]] & 1) != 0
    || [v3 isEqualToUTType:*MEMORY[0x263F1DAA8]])
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    id v4 = (id *)getNSRTFDTextDocumentTypeSymbolLoc_ptr;
    uint64_t v19 = getNSRTFDTextDocumentTypeSymbolLoc_ptr;
    if (!getNSRTFDTextDocumentTypeSymbolLoc_ptr)
    {
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      uint64_t v14 = __getNSRTFDTextDocumentTypeSymbolLoc_block_invoke;
      id v15 = &unk_26428AC60;
      id v8 = UIFoundationLibrary();
      void v17[3] = (uint64_t)dlsym(v8, "NSRTFDTextDocumentType");
      getNSRTFDTextDocumentTypeSymbolLoc_ptr = v17[3];
      id v4 = (id *)v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v4)
    {
      id v6 = [MEMORY[0x263F08690] currentHandler];
      id v7 = [NSString stringWithUTF8String:"NSAttributedStringDocumentType getNSRTFDTextDocumentType(void)"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"WFRichTextContentItem.m", 51, @"%s", dlerror(), v12, v13, v14, v15);
      goto LABEL_24;
    }
    goto LABEL_11;
  }
  if ([v3 isEqualToUTType:*MEMORY[0x263F1DB00]])
  {
    getNSHTMLTextDocumentType();
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ([v3 conformsToUTType:*MEMORY[0x263F1DC20]])
  {
    getNSPlainTextDocumentType();
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ([v3 isEqualToUTType:*MEMORY[0x263F1DD70]]) {
    id v10 = @"NSWebArchive";
  }
  else {
    id v10 = 0;
  }
LABEL_13:

  return v10;
}

@end