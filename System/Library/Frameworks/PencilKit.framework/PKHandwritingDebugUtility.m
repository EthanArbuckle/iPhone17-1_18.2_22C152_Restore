@interface PKHandwritingDebugUtility
+ (id)lassoDrawingFromTiledView:(id)a3;
+ (id)localeIdentifiersFromDrawings:(id)a3;
+ (void)openAppleFeedbackAssistantWithAttachments:(id)a3;
+ (void)openTapToRadarWithAttachments:(id)a3 title:(id)a4;
+ (void)openURL:(id)a3;
+ (void)presentHandwritingDebugViewFromViewController:(id)a3 allDrawings:(id)a4 tiledView:(id)a5;
+ (void)submitFeedbackWithAttachments:(id)a3 title:(id)a4;
@end

@implementation PKHandwritingDebugUtility

+ (id)lassoDrawingFromTiledView:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 selectionController];
    if (!v5)
    {
      v8 = 0;
      v15 = 0;
LABEL_7:

      goto LABEL_9;
    }
    uint64_t v6 = v5[16];

    if (v6)
    {
      uint64_t v7 = [v4 selectionController];
      v8 = (void *)v7;
      if (v7) {
        v9 = *(void **)(v7 + 128);
      }
      else {
        v9 = 0;
      }
      id v10 = v9;
      v11 = [PKDrawing alloc];
      v12 = [v10 strokes];
      v13 = [v12 array];
      v14 = [v10 drawing];
      v15 = [(PKDrawing *)v11 initWithStrokes:v13 fromDrawing:v14];

      goto LABEL_7;
    }
  }
  v15 = 0;
LABEL_9:

  return v15;
}

+ (id)localeIdentifiersFromDrawings:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v9 = [v8 recognitionSession];

        if (v9)
        {
          v11 = [v8 recognitionSession];
          id v10 = [v11 preferredLocales];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  v12 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "localeIdentifier", (void)v21);
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  v19 = [MEMORY[0x1E4F1C978] arrayWithArray:v12];

  return v19;
}

+ (void)presentHandwritingDebugViewFromViewController:(id)a3 allDrawings:(id)a4 tiledView:(id)a5
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 frame];
  double Width = CGRectGetWidth(v55);
  v12 = [a1 localeIdentifiersFromDrawings:v9];
  v53[0] = @"viewWidth";
  id v13 = [NSNumber numberWithDouble:Width];
  v53[1] = @"localeIdentifiers";
  v54[0] = v13;
  v54[1] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];

  uint64_t v15 = [a1 lassoDrawingFromTiledView:v10];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke;
  aBlock[3] = &unk_1E64C6F18;
  id v16 = v14;
  id v51 = v16;
  id v17 = v8;
  id v52 = v17;
  v18 = _Block_copy(aBlock);
  v19 = v18;
  if (v15)
  {
    v20 = (void *)MEMORY[0x1E4FB1418];
    long long v21 = _PencilKitBundle();
    long long v22 = [v21 localizedStringForKey:@"Handwriting Feedback" value:@"Handwriting Feedback" table:@"Localizable"];
    _PencilKitBundle();
    long long v23 = v41 = v12;
    [v23 localizedStringForKey:@"Do you want to include only your current selection or all drawings from this note?" value:@"Do you want to include only your current selection or all drawings from this note?" table:@"Localizable"];
    long long v24 = v40 = v16;
    long long v25 = [v20 alertControllerWithTitle:v22 message:v24 preferredStyle:1];

    long long v26 = (void *)MEMORY[0x1E4FB1410];
    long long v27 = _PencilKitBundle();
    long long v28 = [v27 localizedStringForKey:@"Include Selection Only" value:@"Include Selection Only" table:@"Localizable"];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_2;
    v47[3] = &unk_1E64C6F40;
    id v29 = v19;
    id v49 = v29;
    id v48 = v15;
    v30 = [v26 actionWithTitle:v28 style:0 handler:v47];
    [v25 addAction:v30];

    uint64_t v31 = (void *)MEMORY[0x1E4FB1410];
    v32 = _PencilKitBundle();
    v33 = [v32 localizedStringForKey:@"Include All Drawings" value:@"Include All Drawings" table:@"Localizable"];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_3;
    v44[3] = &unk_1E64C6F40;
    id v46 = v29;
    id v45 = v9;
    v34 = [v31 actionWithTitle:v33 style:0 handler:v44];
    [v25 addAction:v34];

    v35 = (void *)MEMORY[0x1E4FB1410];
    v36 = _PencilKitBundle();
    v37 = [v36 localizedStringForKey:@"Cancel handwriting feedback" value:@"Cancel" table:@"Localizable"];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_4;
    v42[3] = &unk_1E64C6F68;
    id v43 = v25;
    id v38 = v25;
    v39 = [v35 actionWithTitle:v37 style:1 handler:v42];
    [v38 addAction:v39];

    v12 = v41;
    id v16 = v40;
    [v17 presentViewController:v38 animated:1 completion:0];
  }
  else
  {
    (*((void (**)(void *, id))v18 + 2))(v18, v9);
  }
}

void __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = -[PKHandwritingDataCollectionViewController initWithDrawings:metadata:]([PKHandwritingDataCollectionViewController alloc], v3, *(void **)(a1 + 32));

  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  [v4 setModalPresentationStyle:2];
  [*(id *)(a1 + 40) presentViewController:v4 animated:1 completion:0];
}

void __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_2(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  v3[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

+ (void)submitFeedbackWithAttachments:(id)a3 title:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v8 = [v7 BOOLForKey:@"PKShouldForceFeedbackAssistant"];

  if (v8 & 1) == 0 && (os_variant_has_internal_diagnostics()) {
    [a1 openTapToRadarWithAttachments:v9 title:v6];
  }
  else {
    [a1 openAppleFeedbackAssistantWithAttachments:v9];
  }
}

+ (void)openTapToRadarWithAttachments:(id)a3 title:(id)a4
{
  id v31 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v6 setScheme:@"tap-to-radar"];
  [v6 setHost:@"new"];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  char v8 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentName" value:@"Handwriting"];
  [v7 addObject:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentVersion" value:@"iOS"];
  [v7 addObject:v9];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentID" value:@"391023"];
  [v7 addObject:v10];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"AutoDiagnostics" value:@"1"];
  [v7 addObject:v11];

  v30 = v5;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Title" value:v5];
  [v7 addObject:v12];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Keywords" value:@"852187"];
  [v7 addObject:v13];

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Classification" value:@"Other Bug"];
  [v7 addObject:v14];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Reproducibility" value:@"Not Applicable"];
  [v7 addObject:v15];

  id v16 = [MEMORY[0x1E4F1CA48] array];
  id v17 = [MEMORY[0x1E4F1CA48] array];
  if ([v31 count])
  {
    unint64_t v18 = 0;
    do
    {
      v19 = [v31 objectAtIndexedSubscript:v18];
      v20 = [v19 path];

      long long v21 = [v20 pathExtension];
      uint64_t v22 = [v21 compare:@"png" options:1];

      if (v22) {
        long long v23 = v16;
      }
      else {
        long long v23 = v17;
      }
      [v23 addObject:v20];

      ++v18;
    }
    while ([v31 count] > v18);
  }
  if ([v17 count])
  {
    long long v24 = [v17 componentsJoinedByString:@","];
    long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Screenshot" value:v24];
    [v7 addObject:v25];
  }
  if ([v16 count])
  {
    long long v26 = [v16 componentsJoinedByString:@","];
    long long v27 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Attachments" value:v26];
    [v7 addObject:v27];
  }
  [v6 setQueryItems:v7];
  long long v28 = [v6 URL];
  [a1 openURL:v28];
}

+ (void)openAppleFeedbackAssistantWithAttachments:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v10 = [v9 pathComponents];
        v11 = [v10 lastObject];

        v12 = [NSString stringWithFormat:@"attach[%@]", v11];
        id v13 = NSString;
        uint64_t v14 = [v9 path];
        uint64_t v15 = [v13 stringWithFormat:@"%@", v14];

        id v16 = [MEMORY[0x1E4F290C8] queryItemWithName:v12 value:v15];
        [v4 addObject:v16];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  id v17 = [MEMORY[0x1E4F290C8] queryItemWithName:@"answers[:area]" value:@"seedios:notes"];
  [v4 addObject:v17];

  unint64_t v18 = [MEMORY[0x1E4F290C8] queryItemWithName:@"answers[:handwriting_sample]" value:@"Yes"];
  [v4 addObject:v18];

  id v19 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v19 setScheme:@"applefeedback"];
  [v19 setHost:@"new"];
  [v19 setQueryItems:v4];
  v20 = [v19 URL];
  [a1 openURL:v20];
}

+ (void)openURL:(id)a3
{
  id v8 = a3;
  id v3 = [NSClassFromString(&cfstr_Uiapplication.isa) sharedApplication];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA18];
    uint64_t v6 = [v3 methodSignatureForSelector:sel_openURL_options_completionHandler_];
    uint64_t v7 = [v5 invocationWithMethodSignature:v6];

    [v7 setSelector:sel_openURL_options_completionHandler_];
    [v7 setArgument:&v8 atIndex:2];
    [v7 invokeWithTarget:v4];
  }
}

@end