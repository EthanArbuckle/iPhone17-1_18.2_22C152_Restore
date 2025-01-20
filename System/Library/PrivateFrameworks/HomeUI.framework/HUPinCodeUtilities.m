@interface HUPinCodeUtilities
+ (id)createSharingViewControllerForPinCodeItem:(id)a3 inHome:(id)a4;
@end

@implementation HUPinCodeUtilities

+ (id)createSharingViewControllerForPinCodeItem:(id)a3 inHome:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [[_HUPinCodeActivityItemSource alloc] initWithPinCodeItem:v5];
  id v8 = objc_alloc(MEMORY[0x1E4F42718]);
  v17[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v10 = (void *)[v8 initWithActivityItems:v9 applicationActivities:0];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__HUPinCodeUtilities_createSharingViewControllerForPinCodeItem_inHome___block_invoke;
  v14[3] = &unk_1E638BC78;
  id v15 = v6;
  id v16 = v5;
  id v11 = v5;
  id v12 = v6;
  [v10 setCompletionWithItemsHandler:v14];

  return v10;
}

void __71__HUPinCodeUtilities_createSharingViewControllerForPinCodeItem_inHome___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = *MEMORY[0x1E4F68048];
    v6[0] = *MEMORY[0x1E4F681A0];
    v6[1] = v3;
    uint64_t v4 = *(void *)(a1 + 40);
    v7[0] = *(void *)(a1 + 32);
    v7[1] = &unk_1F19B4730;
    v6[2] = *MEMORY[0x1E4F68040];
    v7[2] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
    [MEMORY[0x1E4F68EE0] sendEvent:26 withData:v5];
  }
}

@end