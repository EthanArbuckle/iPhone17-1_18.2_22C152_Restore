@interface WFGetMyWorkflowsAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFGetMyWorkflowsAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend(MEMORY[0x263F86A50], "defaultDatabase", a3);
  v33 = self;
  v7 = [(WFGetMyWorkflowsAction *)self parameterValueForKey:@"Folder" ofClass:objc_opt_class()];
  id v8 = v6;
  if (!v7)
  {
    v12 = 0;
    goto LABEL_9;
  }
  v9 = [v7 displayString];
  v10 = [v7 identifier];
  v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  if (([v10 isEqualToString:*MEMORY[0x263F871F0]] & 1) == 0)
  {
    v12 = [v8 collectionWithIdentifier:v11 error:0];
    if (v12) {
      goto LABEL_8;
    }
LABEL_7:
    v13 = [v8 sortedVisibleFoldersWithError:0];
    v12 = objc_msgSend(v13, "if_firstObjectWithValue:forKey:", v9, @"name");

    goto LABEL_8;
  }
  v12 = 0;
LABEL_8:

LABEL_9:
  v32 = v7;

  v14 = [v12 identifier];

  id v15 = objc_alloc(MEMORY[0x263F854C0]);
  v16 = v15;
  v30 = v12;
  if (v14)
  {
    v17 = [v12 identifier];
    uint64_t v18 = [v16 initWithFolderIdentifier:v17];
  }
  else
  {
    uint64_t v18 = [v15 initWithLocation:0];
  }
  v31 = v8;
  v29 = (void *)v18;
  v19 = [v8 sortedWorkflowsWithQuery:v18 error:a4];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * v23);
        v25 = [(WFGetMyWorkflowsAction *)v33 output];
        v26 = (void *)MEMORY[0x263F337C8];
        v27 = [MEMORY[0x263F337E8] shortcutsAppLocation];
        v28 = [v26 itemWithObject:v24 origin:v27 disclosureLevel:1];
        [v25 addItem:v28];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v21);
  }
}

@end