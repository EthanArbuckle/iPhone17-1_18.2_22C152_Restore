@interface SFDialog(SafariServicesExtras)
+ (id)allowDownloadDialogWithDownload:()SafariServicesExtras initiatingURL:allowViewAction:completionHandler:;
+ (id)downloadBlockedDialogWithFileType:()SafariServicesExtras initiatingURL:completionHandler:;
+ (id)redirectDialogWithNavigationResult:()SafariServicesExtras promptPolicy:completionHandler:;
@end

@implementation SFDialog(SafariServicesExtras)

+ (id)redirectDialogWithNavigationResult:()SafariServicesExtras promptPolicy:completionHandler:
{
  id v6 = a3;
  id v7 = a5;
  v8 = [v6 URL];
  int v9 = objc_msgSend(v8, "safari_isAppleOneURL");

  if (v9)
  {
    v10 = _WBSLocalizedString();
    v11 = (void *)MEMORY[0x1E4F78270];
    v12 = _WBSLocalizedString();
    v13 = _WBSLocalizedString();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __100__SFDialog_SafariServicesExtras__redirectDialogWithNavigationResult_promptPolicy_completionHandler___block_invoke;
    v22[3] = &unk_1E5C726C8;
    id v23 = v7;
    v14 = [v11 _dialogWithTitle:0 message:v10 primaryAction:v12 secondaryAction:v13 applicationModal:0 completionHandler:v22];
  }
  else
  {
    v15 = NSString;
    v16 = _WBSLocalizedString();
    v17 = [v6 externalApplication];
    v18 = [v17 localizedName];
    v19 = objc_msgSend(v15, "stringWithFormat:", v16, v18);

    v20 = [v6 appLink];

    if (v20) {
      [MEMORY[0x1E4F78270] _appLinkRedirectDialogWithMessage:v19 completionHandler:v7];
    }
    else {
    v14 = [MEMORY[0x1E4F78270] redirectDialogWithMessage:v19 completionHandler:v7];
    }
  }

  return v14;
}

+ (id)downloadBlockedDialogWithFileType:()SafariServicesExtras initiatingURL:completionHandler:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = _WBSLocalizedString();
  v11 = _WBSLocalizedString();
  switch((unint64_t)a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      a3 = _WBSLocalizedString();
      break;
    default:
      break;
  }
  v12 = [a1 _dialogWithTitle:0 message:a3 primaryAction:v10 secondaryAction:v11 applicationModal:0 completionHandler:v9];

  [v12 setCanceledOnProvisionalNavigation:0];
  if (v8)
  {
    v13 = [MEMORY[0x1E4F98EE0] sameOriginNavigationExemption:v8];
    v16[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v12 setAdditionalCancellationExemptions:v14];
  }

  return v12;
}

+ (id)allowDownloadDialogWithDownload:()SafariServicesExtras initiatingURL:allowViewAction:completionHandler:
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  v13 = _WBSLocalizedString();
  v14 = _WBSLocalizedString();
  v15 = NSString;
  v16 = _WBSLocalizedString();
  v17 = [v12 filename];

  v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);

  uint64_t v19 = *MEMORY[0x1E4F785E0];
  if (a5)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __114__SFDialog_SafariServicesExtras__allowDownloadDialogWithDownload_initiatingURL_allowViewAction_completionHandler___block_invoke;
    v28[3] = &unk_1E5C735F0;
    v20 = &v29;
    id v29 = v11;
    uint64_t v21 = [a1 _dialogWithTitle:0 message:v18 acceptAction:v13 secondaryAction:v14 cancelAction:v19 applicationModal:0 completionHandler:v28];
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __114__SFDialog_SafariServicesExtras__allowDownloadDialogWithDownload_initiatingURL_allowViewAction_completionHandler___block_invoke_2;
    v26[3] = &unk_1E5C726C8;
    v20 = &v27;
    id v27 = v11;
    uint64_t v21 = [a1 _dialogWithTitle:0 message:v18 primaryAction:v13 secondaryAction:v19 applicationModal:0 completionHandler:v26];
  }
  v22 = (void *)v21;

  [v22 setCanceledOnProvisionalNavigation:0];
  [v22 setCanceledOnApplicationBackground:1];
  if (v10)
  {
    id v23 = [MEMORY[0x1E4F98EE0] sameOriginNavigationExemption:v10];
    v30[0] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v22 setAdditionalCancellationExemptions:v24];
  }

  return v22;
}

@end