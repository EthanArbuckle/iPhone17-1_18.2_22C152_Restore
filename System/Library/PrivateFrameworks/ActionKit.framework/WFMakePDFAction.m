@interface WFMakePDFAction
- (BOOL)isProgressIndeterminate;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFMakePDFAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v43[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 numberOfItems])
  {
    v5 = [(WFMakePDFAction *)self parameterValueForKey:@"WFPDFIncludedPages" ofClass:objc_opt_class()];
    v6 = [(WFMakePDFAction *)self parameterValueForKey:@"WFPDFSinglePage" ofClass:objc_opt_class()];
    uint64_t v7 = [(WFMakePDFAction *)self parameterValueForKey:@"WFPDFPageRangeStart" ofClass:objc_opt_class()];
    v8 = [(WFMakePDFAction *)self parameterValueForKey:@"WFPDFPageRangeEnd" ofClass:objc_opt_class()];
    v30 = (void *)v7;
    if ([v5 isEqualToString:@"Single Page"])
    {
      if (v6) {
        v9 = v6;
      }
      else {
        v9 = &unk_26F076560;
      }
      uint64_t v10 = [v9 integerValue];
      uint64_t v28 = v10;
    }
    else if ([v5 isEqualToString:@"Page Range"])
    {
      if (v7) {
        v14 = (void *)v7;
      }
      else {
        v14 = &unk_26F076560;
      }
      uint64_t v29 = [v14 integerValue];
      if (v8) {
        v15 = v8;
      }
      else {
        v15 = &unk_26F076578;
      }
      uint64_t v10 = objc_msgSend(v15, "integerValue", v29);
    }
    else
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v28 = 1;
    }
    v16 = [(WFMakePDFAction *)self parameterValueForKey:@"WFPDFIncludeMargin" ofClass:objc_opt_class()];
    uint64_t v17 = [v16 BOOLValue];

    v18 = (void *)MEMORY[0x263F33768];
    uint64_t v40 = *MEMORY[0x263F33A50];
    v19 = [NSNumber numberWithBool:v17];
    v41 = v19;
    v20 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    v21 = [v18 optionsWithDictionary:v20];

    v22 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
    uint64_t v23 = [v4 numberOfItems];
    v24 = [(WFMakePDFAction *)self progress];
    [v24 setTotalUnitCount:v23];

    v25 = [v4 items];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke;
    v35[3] = &unk_264E5E4E0;
    id v36 = v22;
    v37 = self;
    id v38 = v4;
    id v39 = v21;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke_3;
    v31[3] = &unk_264E5E508;
    v31[4] = self;
    id v32 = v36;
    uint64_t v33 = v28;
    uint64_t v34 = v10;
    id v26 = v36;
    id v27 = v21;
    objc_msgSend(v25, "if_mapAsynchronously:completionHandler:", v35, v31);

    v13 = v30;
  }
  else
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F870B8];
    v42[0] = *MEMORY[0x263F08338];
    v5 = WFLocalizedString(@"No Items");
    v43[0] = v5;
    v42[1] = *MEMORY[0x263F08320];
    v6 = WFLocalizedString(@"Make sure to pass items to the Make PDF action.");
    v43[1] = v6;
    v13 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    v8 = [v11 errorWithDomain:v12 code:6 userInfo:v13];
    [(WFMakePDFAction *)self finishRunningWithError:v8];
  }
}

void __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x263F33770];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke_2;
  uint64_t v17 = &unk_264E5E4B8;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  id v19 = v6;
  id v9 = v6;
  id v10 = a2;
  v11 = [v7 requestForCoercingToFileType:v8 completionHandler:&v14];
  uint64_t v12 = objc_msgSend(*(id *)(a1 + 48), "defaultCoercionOptions", v14, v15, v16, v17, v18);
  v13 = [v12 optionsByAddingContentsOfOptions:*(void *)(a1 + 56)];
  [v11 setOptions:v13];

  [v10 performCoercion:v11];
}

void __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (!v5 || a3)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
    goto LABEL_65;
  }
  id v61 = v5;
  v62 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v77 objects:v88 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v78;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v78 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        uint64_t v12 = [v11 representationType];
        if (v12 == 1)
        {
          id v16 = objc_alloc((Class)getPDFDocumentClass_53984());
          uint64_t v14 = [v11 fileURL];
          uint64_t v15 = [v16 initWithURL:v14];
        }
        else
        {
          if (v12) {
            goto LABEL_32;
          }
          id v13 = objc_alloc((Class)getPDFDocumentClass_53984());
          uint64_t v14 = [v11 data];
          uint64_t v15 = [v13 initWithData:v14];
        }
        uint64_t v17 = (void *)v15;

        if (!v17)
        {
LABEL_32:
          v30 = getWFActionsLogObject();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v85 = "-[WFMakePDFAction runAsynchronouslyWithInput:]_block_invoke_3";
            __int16 v86 = 2112;
            v87 = v11;
            _os_log_impl(&dword_23C364000, v30, OS_LOG_TYPE_FAULT, "%s Could not make PDFDocument from PDF file %@", buf, 0x16u);
          }

          v31 = *(void **)(a1 + 32);
          id v32 = [MEMORY[0x263F337C8] badCoercionErrorForType:*(void *)(a1 + 40)];
          [v31 finishRunningWithError:v32];
          id v18 = v6;
          goto LABEL_64;
        }
        [v62 addObject:v17];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v77 objects:v88 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v59 = v6;

  id v18 = objc_alloc_init((Class)getPDFDocumentClass_53984());
  id v19 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPDFDocumentMergeBehavior" ofClass:objc_opt_class()];
  v57 = v19;
  if ([v19 isEqualToString:@"Append"])
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    obuint64_t j = v62;
    uint64_t v20 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v74;
      uint64_t v23 = 1;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v74 != v22) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v73 + 1) + 8 * j);
          uint64_t v26 = objc_msgSend(v25, "pageCount", v57);
          if (v26)
          {
            uint64_t v27 = v26;
            for (uint64_t k = 0; k != v27; ++k)
            {
              if (v23 + k >= *(void *)(a1 + 48) && v23 + k <= *(void *)(a1 + 56))
              {
                uint64_t v29 = [v25 pageAtIndex:k];
                objc_msgSend(v18, "insertPage:atIndex:", v29, objc_msgSend(v18, "pageCount"));
              }
            }
            v23 += v27;
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
      }
      while (v21);
    }
LABEL_62:

    goto LABEL_63;
  }
  if (![v19 isEqualToString:@"Shuffle"]) {
    goto LABEL_63;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v33 = v62;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v69 objects:v82 count:16];
  if (!v34) {
    goto LABEL_62;
  }
  uint64_t v35 = v34;
  uint64_t v36 = 0;
  uint64_t v37 = *(void *)v70;
  do
  {
    for (uint64_t m = 0; m != v35; ++m)
    {
      if (*(void *)v70 != v37) {
        objc_enumerationMutation(v33);
      }
      unint64_t v39 = objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * m), "pageCount", v57);
      if (v39 > v36) {
        uint64_t v36 = v39;
      }
    }
    uint64_t v35 = [v33 countByEnumeratingWithState:&v69 objects:v82 count:16];
  }
  while (v35);

  if (v36 >= 1)
  {
    unint64_t v40 = 0;
    uint64_t v41 = 1;
    id obja = v33;
    uint64_t v60 = v36;
    do
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v42 = v33;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v65 objects:v81 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v66;
        do
        {
          for (uint64_t n = 0; n != v44; ++n)
          {
            if (*(void *)v66 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v65 + 1) + 8 * n);
            if (v40 <= [v47 pageCount] - 1)
            {
              if (v41 >= *(void *)(a1 + 48))
              {
                uint64_t v48 = v41 + 1;
                if (v41 <= *(void *)(a1 + 56))
                {
                  v49 = [v47 pageAtIndex:v40];
                  objc_msgSend(v18, "insertPage:atIndex:", v49, objc_msgSend(v18, "pageCount"));
                }
                uint64_t v41 = v48;
              }
              else
              {
                ++v41;
              }
            }
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v65 objects:v81 count:16];
        }
        while (v44);
      }

      ++v40;
      id v33 = obja;
    }
    while (v40 != v60);
  }
LABEL_63:
  v50 = (void *)MEMORY[0x263F33870];
  v51 = objc_msgSend(v59, "firstObject", v57);
  v52 = [v51 wfName];
  v53 = [v50 proposedFilenameForFile:v52 ofType:*(void *)(a1 + 40)];

  v54 = [MEMORY[0x263F339A0] proposedTemporaryFileURLForFilename:v53];
  [v18 writeToURL:v54];
  v55 = [MEMORY[0x263F33870] fileWithURL:v54 options:1];
  v56 = [*(id *)(a1 + 32) output];
  [v56 addFile:v55];

  [*(id *)(a1 + 32) finishRunningWithError:0];
  id v32 = v58;
LABEL_64:

  id v5 = v61;
LABEL_65:
}

void __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 progress];
  objc_msgSend(v8, "setCompletedUnitCount:", objc_msgSend(v8, "completedUnitCount") + 1);

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v7 firstObject];

  (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v6);
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end