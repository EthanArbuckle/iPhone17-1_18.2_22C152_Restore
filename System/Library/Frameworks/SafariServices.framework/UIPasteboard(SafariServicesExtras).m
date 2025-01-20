@interface UIPasteboard(SafariServicesExtras)
- (BOOL)safari_canPasteAndNavigate;
- (id)safari_pasteAndNavigateButtonTitle;
- (id)safari_pasteAndNavigateCommand;
- (uint64_t)safari_bestInputTypeForPastingIntoURLField;
- (void)safari_bestStringForPastingIntoURLFieldCompletionHandler:()SafariServicesExtras;
- (void)safari_setSensitiveString:()SafariServicesExtras;
@end

@implementation UIPasteboard(SafariServicesExtras)

- (void)safari_bestStringForPastingIntoURLFieldCompletionHandler:()SafariServicesExtras
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB2E30], *MEMORY[0x1E4FB2E28], 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__UIPasteboard_SafariServicesExtras__safari_bestStringForPastingIntoURLFieldCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C73AC0;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  [a1 detectValuesForPatterns:v5 completionHandler:v7];
}

- (uint64_t)safari_bestInputTypeForPastingIntoURLField
{
  uint64_t v2 = *MEMORY[0x1E4FB2808];
  uint64_t v3 = *MEMORY[0x1E4FB2810];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB2808], *MEMORY[0x1E4FB2810], 0);
  v5 = [a1 _detectedPasteboardTypesForTypes:v4];

  if ([v5 containsObject:v3])
  {
    uint64_t v6 = 2;
  }
  else if ([v5 containsObject:v2])
  {
    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v6 = 4;
  }

  return v6;
}

- (id)safari_pasteAndNavigateButtonTitle
{
  uint64_t v1 = objc_msgSend(a1, "safari_bestInputTypeForPastingIntoURLField");
  if ((unint64_t)(v1 - 1) >= 2 && v1 && v1 != 3)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = _WBSLocalizedString();
  }

  return v2;
}

- (id)safari_pasteAndNavigateCommand
{
  uint64_t v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.clipboard"];
  uint64_t v3 = objc_msgSend(a1, "safari_bestInputTypeForPastingIntoURLField");
  if ((unint64_t)(v3 - 1) < 2)
  {
    id v4 = (void *)MEMORY[0x1E4FB1638];
    v5 = _WBSLocalizedString();
    uint64_t v6 = sel_pasteAndGo_;
    goto LABEL_6;
  }
  if (!v3 || v3 == 3)
  {
    id v4 = (void *)MEMORY[0x1E4FB1638];
    v5 = _WBSLocalizedString();
    uint64_t v6 = sel_pasteAndSearch_;
LABEL_6:
    v7 = [v4 commandWithTitle:v5 image:v2 action:v6 propertyList:0];

    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)safari_canPasteAndNavigate
{
  return objc_msgSend(a1, "safari_bestInputTypeForPastingIntoURLField") != 4;
}

- (void)safari_setSensitiveString:()SafariServicesExtras
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:60.0];
  if (v5)
  {
    uint64_t v11 = *MEMORY[0x1E4FB2E40];
    id v12 = v5;
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v13[0] = v3;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v9 = *MEMORY[0x1E4FB2E38];
  v10 = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [a1 setItems:v7 options:v8];

  if (v5)
  {
  }
}

@end