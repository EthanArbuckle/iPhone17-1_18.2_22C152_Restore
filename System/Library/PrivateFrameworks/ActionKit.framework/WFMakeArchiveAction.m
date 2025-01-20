@interface WFMakeArchiveAction
- (BOOL)inputsMultipleItems;
- (id)currentlySelectedArchiveFormat;
- (id)localizedKeywordsWithContext:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFMakeArchiveAction

- (id)localizedKeywordsWithContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFMakeArchiveAction;
  v3 = [(WFMakeArchiveAction *)&v8 localizedKeywordsWithContext:a3];
  v4 = WFSupportedArchiveFormats();
  v5 = objc_msgSend(v4, "if_map:", &__block_literal_global_52946);
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

id __52__WFMakeArchiveAction_localizedKeywordsWithContext___block_invoke()
{
  v0 = WFArchiveFormatFileExtension();
  v1 = [@"." stringByAppendingString:v0];

  return v1;
}

- (BOOL)inputsMultipleItems
{
  v2 = [(WFMakeArchiveAction *)self currentlySelectedArchiveFormat];
  if (v2) {
    char v3 = WFArchiveFormatSupportsMultipleFiles();
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (id)currentlySelectedArchiveFormat
{
  char v3 = [(WFMakeArchiveAction *)self parameterValueForKey:@"WFArchiveFormat" ofClass:objc_opt_class()];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(WFMakeArchiveAction *)self parameterStateForKey:@"WFArchiveFormat"];
    id v5 = [v6 value];
  }
  return v5;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__WFMakeArchiveAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5EEE8;
  v3[4] = self;
  [a3 getFileRepresentations:v3 forType:0];
}

void __50__WFMakeArchiveAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v7 = [*(id *)(a1 + 32) parameterValueForKey:@"WFArchiveFormat" ofClass:objc_opt_class()];
    objc_super v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFZIPName" ofClass:objc_opt_class()];
    v9 = WFCreateArchiveWithFiles();
    id v10 = v6;

    if (v9)
    {
      v11 = [*(id *)(a1 + 32) output];
      [v11 addFile:v9];
    }
    [*(id *)(a1 + 32) finishRunningWithError:v10];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
    id v10 = v6;
  }
}

@end