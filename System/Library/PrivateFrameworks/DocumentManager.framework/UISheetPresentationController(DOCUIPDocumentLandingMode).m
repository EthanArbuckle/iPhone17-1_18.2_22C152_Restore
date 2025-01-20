@interface UISheetPresentationController(DOCUIPDocumentLandingMode)
- (id)doc_detentForDocumentLandingMode:()DOCUIPDocumentLandingMode;
- (uint64_t)doc_documentLandingModeForDetent:()DOCUIPDocumentLandingMode;
@end

@implementation UISheetPresentationController(DOCUIPDocumentLandingMode)

- (id)doc_detentForDocumentLandingMode:()DOCUIPDocumentLandingMode
{
  v4 = [a1 detents];
  v5 = v4;
  if (a3) {
    [v4 firstObject];
  }
  else {
  v6 = [v4 lastObject];
  }
  v7 = [v6 identifier];

  return v7;
}

- (uint64_t)doc_documentLandingModeForDetent:()DOCUIPDocumentLandingMode
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [&unk_26C4030D8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(&unk_26C4030D8);
      }
      uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) integerValue];
      v10 = objc_msgSend(a1, "doc_detentForDocumentLandingMode:", v9);
      char v11 = [v10 isEqual:v4];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [&unk_26C4030D8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v9 = 1;
  }

  return v9;
}

@end