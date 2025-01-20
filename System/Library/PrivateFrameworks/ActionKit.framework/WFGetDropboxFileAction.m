@interface WFGetDropboxFileAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (BOOL)isProgressIndeterminate;
- (BOOL)multipleSelectionEnabled;
- (BOOL)outputsMultipleItems;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)filePathKey;
- (id)filenamePlaceholderText;
- (id)showPickerKey;
- (id)storageService;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4;
- (void)runWithRemoteUserInterface:(id)a3 path:(id)a4 input:(id)a5 storageService:(id)a6;
- (void)updateVisibleParameters;
@end

@implementation WFGetDropboxFileAction

+ (id)userInterfaceXPCInterface
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFGetDropboxFileAction;
  v2 = objc_msgSendSuper2(&v7, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_showWithServiceName_directoryPath_options_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2CA8;
}

- (id)storageService
{
  v2 = objc_alloc_init(WFDropboxStorageService);
  return v2;
}

- (void)updateVisibleParameters
{
  id v5 = [(WFGetDropboxFileAction *)self parameterForKey:@"WFGetFileInitialDirectoryPath"];
  BOOL v3 = [(WFStorageServiceAction *)self showsFilePicker];
  if (v3 && [(WFStorageServiceAction *)self showsFilePicker])
  {
    uint64_t v4 = [(WFGetDropboxFileAction *)self storageService];
    objc_msgSend(v5, "setHidden:", objc_msgSend(v4, "supportsJumpingToSubdirectoryInUI") ^ 1);
  }
  else
  {
    [v5 setHidden:!v3];
  }
}

- (void)initializeParameters
{
  v3.receiver = self;
  v3.super_class = (Class)WFGetDropboxFileAction;
  [(WFStorageServiceAction *)&v3 initializeParameters];
  [(WFGetDropboxFileAction *)self updateVisibleParameters];
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WFGetDropboxFileAction;
  BOOL v7 = [(WFStorageServiceAction *)&v11 setParameterState:a3 forKey:v6];
  if (v7)
  {
    v8 = [(WFGetDropboxFileAction *)self showPickerKey];
    int v9 = [v6 isEqualToString:v8];

    if (v9) {
      [(WFGetDropboxFileAction *)self updateVisibleParameters];
    }
  }

  return v7;
}

- (BOOL)outputsMultipleItems
{
  if (![(WFStorageServiceAction *)self showsFilePicker]
    || (BOOL v3 = [(WFGetDropboxFileAction *)self multipleSelectionEnabled]))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)multipleSelectionEnabled
{
  v2 = [(WFGetDropboxFileAction *)self parameterStateForKey:@"SelectMultiple"];
  BOOL v3 = [v2 number];
  if (v3)
  {
    uint64_t v4 = [v2 number];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (id)filenamePlaceholderText
{
  v2 = [(WFGetDropboxFileAction *)self storageService];
  BOOL v3 = [v2 storageLocationPrefix];
  int v4 = [v3 hasSuffix:@"/"];

  if (v4) {
    char v5 = @"example.txt";
  }
  else {
    char v5 = @"/example.txt";
  }
  id v6 = WFLocalizedString(v5);
  return v6;
}

- (id)showPickerKey
{
  return @"WFShowFilePicker";
}

- (id)filePathKey
{
  return @"WFGetFilePath";
}

- (void)runWithRemoteUserInterface:(id)a3 path:(id)a4 input:(id)a5 storageService:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(WFGetDropboxFileAction *)self parameterValueForKey:@"WFGetFileInitialDirectoryPath" ofClass:objc_opt_class()];
  if (([(__CFString *)v14 hasPrefix:@"/"] & 1) == 0)
  {
    if (v14) {
      v15 = v14;
    }
    else {
      v15 = &stru_26F008428;
    }
    uint64_t v16 = [@"/" stringByAppendingString:v15];

    v14 = (__CFString *)v16;
  }
  uint64_t v17 = objc_opt_class();
  if (v10)
  {
    v18 = [(WFGetDropboxFileAction *)self parameterValueForKey:@"SelectMultiple" ofClass:v17];
    int v19 = [v18 BOOLValue];

    if (v19) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = 0;
    }
    v21 = [(id)objc_opt_class() serviceName];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke;
    v32[3] = &unk_264E5EBA0;
    v22 = &v33;
    v32[4] = self;
    id v33 = v13;
    v23 = &v34;
    id v34 = v12;
    id v24 = v12;
    id v25 = v13;
    [v10 showWithServiceName:v21 directoryPath:v14 options:v20 completionHandler:v32];
  }
  else
  {
    v26 = [(WFGetDropboxFileAction *)self parameterValueForKey:@"WFFileErrorIfNotFound" ofClass:v17];
    unsigned int v27 = [v26 BOOLValue];

    v21 = [(WFGetDropboxFileAction *)self progress];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_3;
    v29[3] = &unk_264E5EBA0;
    v22 = &v30;
    v29[4] = self;
    id v30 = v13;
    v23 = &v31;
    id v31 = v12;
    id v28 = v12;
    [v13 retrieveFilesAtPath:v11 options:v27 progress:v21 completionHandler:v29];
  }
}

void __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] isRunning])
  {
    if (v6)
    {
      [a1[4] finishRunningWithError:v6];
    }
    else
    {
      BOOL v7 = (void *)MEMORY[0x263F33708];
      v8 = [a1[5] associatedAppDescriptor];
      int v9 = [v7 locationWithAppDescriptor:v8];
      id v10 = [a1[4] progress];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_2;
      v12[3] = &unk_264E5E9F8;
      v12[4] = a1[4];
      id v13 = a1[6];
      WFContentCollectionFromStorageServiceResult(v5, v9, v11, v12);
    }
  }
}

void __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] isRunning])
  {
    if (v6)
    {
      [a1[4] finishRunningWithError:v6];
    }
    else
    {
      BOOL v7 = (void *)MEMORY[0x263F33708];
      v8 = [a1[5] associatedAppDescriptor];
      int v9 = [v7 locationWithAppDescriptor:v8];
      id v10 = [a1[4] progress];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_4;
      v12[3] = &unk_264E5E9F8;
      v12[4] = a1[4];
      id v13 = a1[6];
      WFContentCollectionFromStorageServiceResult(v5, v9, v11, v12);
    }
  }
}

void __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a2;
  if (!a2) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:v3];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a2;
  if (!a2) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:v3];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFStorageServiceAction *)self showsFilePicker])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__WFGetDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
    v11[3] = &unk_264E5D340;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [(WFGetDropboxFileAction *)self requestInterfacePresentationWithCompletionHandler:v11];
  }
  else
  {
    v8 = [(WFGetDropboxFileAction *)self parameterValueForKey:@"WFGetFilePath" ofClass:objc_opt_class()];
    if (([(__CFString *)v8 hasPrefix:@"/"] & 1) == 0)
    {
      if (v8) {
        int v9 = v8;
      }
      else {
        int v9 = &stru_26F008428;
      }
      uint64_t v10 = [@"/" stringByAppendingString:v9];

      v8 = (__CFString *)v10;
    }
    [(WFGetDropboxFileAction *)self runWithRemoteUserInterface:0 path:v8 input:v6 storageService:v7];
  }
}

uint64_t __68__WFGetDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[4];
  if (a2) {
    return [v3 runWithRemoteUserInterface:a2 path:0 input:a1[5] storageService:a1[6]];
  }
  else {
    return objc_msgSend(v3, "finishRunningWithError:");
  }
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end