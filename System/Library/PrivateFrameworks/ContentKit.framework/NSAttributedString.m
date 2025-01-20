@interface NSAttributedString
@end

@implementation NSAttributedString

void __81__NSAttributedString_TextAttachmentExtraction__wf_contentAsStringsAndAttachments__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  v8 = (void *)getNSAttachmentAttributeNameSymbolLoc_ptr_12540;
  uint64_t v40 = getNSAttachmentAttributeNameSymbolLoc_ptr_12540;
  if (!getNSAttachmentAttributeNameSymbolLoc_ptr_12540)
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __getNSAttachmentAttributeNameSymbolLoc_block_invoke_12541;
    v36[3] = &unk_26428AC60;
    v36[4] = &v37;
    __getNSAttachmentAttributeNameSymbolLoc_block_invoke_12541(v36);
    v8 = (void *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (v8)
  {
    v9 = [v7 objectForKey:*v8];
    v10 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    v11 = [v10 string];

    v12 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v13 = [v11 stringByTrimmingCharactersInSet:v12];
    v14 = v13;
    if (!v9)
    {
      uint64_t v23 = [v13 length];

      if (v23) {
        [*(id *)(a1 + 40) addObject:v11];
      }
      goto LABEL_23;
    }

    uint64_t v35 = a1;
    if (![v14 length] || objc_msgSend(v14, "isEqualToString:", @"\uFFFC"))
    {

      v14 = 0;
    }
    v15 = [v9 fileWrapper];
    v16 = [v15 preferredFilename];
    v17 = [v9 fileWrapper];
    int v18 = [v17 isRegularFile];

    if (v18)
    {
      v19 = [v15 regularFileContents];
      v20 = [MEMORY[0x263F852B8] typeFromFilename:v16];
      if (v14) {
        v21 = v14;
      }
      else {
        v21 = v16;
      }
      v22 = +[WFFileRepresentation fileWithData:v19 ofType:v20 proposedFilename:v21];
    }
    else
    {
      v24 = [v9 contents];

      if (v24)
      {
        v19 = [v9 contents];
        v25 = (void *)MEMORY[0x263F852B8];
        v20 = [v9 fileType];
        v26 = [v25 typeWithString:v20];
        v27 = v19;
      }
      else
      {
        v28 = [v9 image];

        if (!v28)
        {
LABEL_22:

LABEL_23:
          return;
        }
        id v29 = objc_alloc(MEMORY[0x263F85308]);
        v30 = [v9 image];
        v19 = (void *)[v29 initWithPlatformImage:v30];

        v20 = [v19 PNGRepresentation];
        v26 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC08]];
        v27 = v20;
      }
      v22 = +[WFFileRepresentation fileWithData:v27 ofType:v26 proposedFilename:v14];
    }
    if (v22)
    {
      v31 = *(void **)(v35 + 40);
      v32 = +[WFContentItem itemWithFile:v22];
      [v31 addObject:v32];
    }
    goto LABEL_22;
  }
  v33 = [MEMORY[0x263F08690] currentHandler];
  v34 = [NSString stringWithUTF8String:"NSAttributedStringKey getNSAttachmentAttributeName(void)"];
  objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"NSAttributedString+TextAttachmentExtraction.m", 16, @"%s", dlerror());

  __break(1u);
}

void __58__NSAttributedString_ImageExtraction__containedImageFiles__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v8 = (void *)MEMORY[0x263F852B8];
  id v30 = v7;
  v9 = [v7 fileType];
  v10 = [v8 typeWithString:v9];

  if ([v10 conformsToUTType:*MEMORY[0x263F1DB18]])
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    v12 = [v11 string];
    v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v14 = [v12 stringByTrimmingCharactersInSet:v13];

    if (![v14 length] || objc_msgSend(v14, "isEqualToString:", @"\uFFFC"))
    {

      v14 = 0;
    }
    v15 = [v30 fileWrapper];
    v16 = [v15 preferredFilename];
    v17 = [v30 fileWrapper];
    int v18 = [v17 isRegularFile];

    if (v18)
    {
      v19 = [v15 regularFileContents];
      v20 = [MEMORY[0x263F852B8] typeFromFilename:v16];
      if (v14) {
        v21 = v14;
      }
      else {
        v21 = v16;
      }
      v22 = +[WFFileRepresentation fileWithData:v19 ofType:v20 proposedFilename:v21];
    }
    else
    {
      uint64_t v23 = [v30 contents];

      if (v23)
      {
        v19 = [v30 contents];
        v24 = (void *)MEMORY[0x263F852B8];
        v20 = [v30 fileType];
        v25 = [v24 typeWithString:v20];
        v26 = v19;
      }
      else
      {
        v27 = [v30 image];

        if (!v27)
        {
LABEL_17:

          goto LABEL_18;
        }
        id v28 = objc_alloc(MEMORY[0x263F85308]);
        id v29 = [v30 image];
        v19 = (void *)[v28 initWithPlatformImage:v29];

        v20 = [v19 PNGRepresentation];
        v25 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC08]];
        v26 = v20;
      }
      v22 = +[WFFileRepresentation fileWithData:v26 ofType:v25 proposedFilename:v14];
    }
    if (v22)
    {
      [*(id *)(a1 + 40) addObject:v22];
    }
    goto LABEL_17;
  }
LABEL_18:
}

@end