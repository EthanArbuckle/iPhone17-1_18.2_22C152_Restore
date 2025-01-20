@interface AMSTapToRadar
+ (id)_convertClassification:(unint64_t)a3;
+ (id)_convertReproducibility:(unint64_t)a3;
+ (void)openWithTitle:(id)a3 description:(id)a4 classification:(unint64_t)a5 reproducibility:(unint64_t)a6 keywordIds:(id)a7;
@end

@implementation AMSTapToRadar

+ (void)openWithTitle:(id)a3 description:(id)a4 classification:(unint64_t)a5 reproducibility:(unint64_t)a6 keywordIds:(id)a7
{
  v29[7] = *MEMORY[0x1E4F143B8];
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v13 = [MEMORY[0x1E4F1CB10] URLWithString:@"tap-to-radar://new"];
  if (v13)
  {
    if (v11) {
      v14 = v11;
    }
    else {
      v14 = &stru_1EDCA7308;
    }
    v28[0] = @"Title";
    v28[1] = @"Description";
    if (v12) {
      v15 = v12;
    }
    else {
      v15 = &stru_1EDCA7308;
    }
    v29[0] = v14;
    v29[1] = v15;
    v28[2] = @"ComponentID";
    v28[3] = @"ComponentName";
    v29[2] = @"954976";
    v29[3] = @"Apple Media Services";
    v29[4] = @"New Bugs";
    v28[4] = @"ComponentVersion";
    v28[5] = @"Reproducibility";
    v16 = [a1 _convertReproducibility:a6];
    v29[5] = v16;
    v28[6] = @"Classification";
    v17 = [a1 _convertClassification:a5];
    v29[6] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:7];
    v19 = objc_msgSend(v13, "ams_URLByReplaceingQueryParameters:", v18);

    v20 = [[AMSDialogRequest alloc] initWithTitle:@"[AMS] Fatal Error Detected" message:@"Please consider filing a radar."];
    v21 = +[AMSDialogAction actionWithTitle:@"Cancel" style:2];
    [(AMSDialogRequest *)v20 addButtonAction:v21];

    v22 = +[AMSDialogAction actionWithTitle:@"Tap-To-Radar" identifier:@"Ok"];
    [(AMSDialogRequest *)v20 addButtonAction:v22];

    v23 = [[AMSSystemAlertDialogTask alloc] initWithRequest:v20];
    v24 = [(AMSSystemAlertDialogTask *)v23 present];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __85__AMSTapToRadar_openWithTitle_description_classification_reproducibility_keywordIds___block_invoke;
    v26[3] = &unk_1E559F140;
    id v27 = v19;
    id v25 = v19;
    [v24 addFinishBlock:v26];
  }
}

void __85__AMSTapToRadar_openWithTitle_description_classification_reproducibility_keywordIds___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 selectedActionIdentifier];
  int v4 = [v3 isEqualToString:@"Ok"];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    +[AMSOpenURL openStandardURL:v5];
  }
}

+ (id)_convertClassification:(unint64_t)a3
{
  if (a3 > 9) {
    return &stru_1EDCA7308;
  }
  else {
    return off_1E55A6F20[a3];
  }
}

+ (id)_convertReproducibility:(unint64_t)a3
{
  if (a3 > 5) {
    return &stru_1EDCA7308;
  }
  else {
    return off_1E55A6F70[a3];
  }
}

@end