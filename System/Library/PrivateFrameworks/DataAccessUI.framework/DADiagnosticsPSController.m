@interface DADiagnosticsPSController
+ (BOOL)diagnosticsVisible;
+ (id)dumpRuntimeStateSpecifiers;
+ (id)linkSpecifier;
- (BOOL)isLoggingEnabledForSpecifier:(id)a3;
- (BOOL)saveFileAtPath:(id)a3 toDirectory:(id)a4 withExtension:(id)a5 error:(id *)a6;
- (id)BOOLeanPropertyWithSpecifier:(id)a3;
- (id)diagnosticSpecifiers;
- (id)pathsOfAllLogFiles;
- (id)savedLogsDirectoryNameForSpecifier:(id)a3;
- (id)specifiers;
- (void)_dismissSavingDataAlert;
- (void)_presentNotesController;
- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)handleClearAllLogsForSpecifier:(id)a3;
- (void)handleDumpRuntimeStateForSpecifier:(id)a3;
- (void)handleSaveAllLogsForSpecifier:(id)a3;
- (void)handleSaveAllLogsStep2;
- (void)purgeFileAtPath:(id)a3;
- (void)runSimpleAlertWithTitle:(id)a3 message:(id)a4;
- (void)runSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissedSelector:(SEL)a5;
- (void)saveLogsWithNotes:(id)a3;
- (void)setBooleanProperty:(id)a3 withSpecifier:(id)a4;
- (void)suspend;
@end

@implementation DADiagnosticsPSController

+ (BOOL)diagnosticsVisible
{
  return MEMORY[0x270F250E8](a1, a2);
}

+ (id)linkSpecifier
{
  if ([(id)objc_opt_class() diagnosticsVisible])
  {
    v2 = (void *)MEMORY[0x263F5FC40];
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"DIAG_LINK_TITLE" value:&stru_26E020258 table:@"Diagnostic"];
    v5 = [v2 preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)dumpRuntimeStateSpecifiers
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [MEMORY[0x263F5FC40] groupSpecifierWithName:&stru_26E020258];
  [v2 addObject:v3];

  v4 = (void *)MEMORY[0x263F5FC40];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"DIAG_DUMP_RUNTIME_STATE" value:&stru_26E020258 table:@"Diagnostic"];
  v7 = [v4 buttonSpecifierWithTitle:v6 target:0 action:sel_handleDumpRuntimeStateForSpecifier_ confirmationInfo:0];
  [v2 addObject:v7];

  return v2;
}

- (id)diagnosticSpecifiers
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() dumpRuntimeStateSpecifiers];
  if (v3) {
    [v2 addObjectsFromArray:v3];
  }
  [v3 lastObject];

  return v2;
}

- (id)specifiers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(DADiagnosticsPSController *)self diagnosticSpecifiers];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    v7 = (int *)MEMORY[0x263F5FE40];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_storeWeak((id *)(*(void *)(*((void *)&v14 + 1) + 8 * v8++) + *v7), self);
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  uint64_t v9 = (int)*MEMORY[0x263F5FDB8];
  v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)v3;
  id v11 = v3;

  id v12 = *(id *)((char *)&self->super.super.super.super.super.isa + v9);
  return v12;
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  uint64_t v6 = (UIAlertView *)a3;
  v7 = v6;
  if (self->_simpleAlert == v6)
  {
    self->_simpleAlert = 0;

    SEL simpleConfirmSheetDismissedSEL = self->_simpleConfirmSheetDismissedSEL;
    if (simpleConfirmSheetDismissedSEL) {
      [(DADiagnosticsPSController *)self performSelector:simpleConfirmSheetDismissedSEL withObject:0 afterDelay:1.0];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DADiagnosticsPSController;
    [(DADiagnosticsPSController *)&v9 alertView:v6 clickedButtonAtIndex:a4];
  }
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  uint64_t v5 = (UIAlertView *)a3;
  if (self->_savingDataAlert == v5)
  {
    self->_savingDataAlert = 0;
    uint64_t v6 = v5;

    [(DADiagnosticsPSController *)self performSelector:sel_handleSaveAllLogsStep2 withObject:0 afterDelay:0.0];
    uint64_t v5 = v6;
  }
}

- (void)runSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissedSelector:(SEL)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x263F1C400];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"OK" value:&stru_26E020258 table:@"Diagnostic"];
  long long v14 = (UIAlertView *)[v11 initWithTitle:v10 message:v9 delegate:self cancelButtonTitle:v13 otherButtonTitles:0];

  simpleAlert = self->_simpleAlert;
  self->_simpleAlert = v14;

  if (a5) {
    long long v16 = a5;
  }
  else {
    long long v16 = 0;
  }
  self->_SEL simpleConfirmSheetDismissedSEL = v16;
  long long v17 = self->_simpleAlert;

  [(UIAlertView *)v17 show];
}

- (void)runSimpleAlertWithTitle:(id)a3 message:(id)a4
{
  uint64_t v6 = (void *)*MEMORY[0x263F1D020];
  v7 = (__CFString *)a4;
  alertHeader = (__CFString *)a3;
  if ([v6 isSuspended])
  {
    CFOptionFlags v9 = 0;
    CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, alertHeader, v7, 0, 0, 0, &v9);
  }
  else
  {
    [(DADiagnosticsPSController *)self runSimpleAlertWithTitle:alertHeader message:v7 dismissedSelector:0];
  }
}

- (void)setBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  id v8 = a4;
  uint64_t v6 = [a3 BOOLValue];
  v7 = [v8 identifier];
  if ([v7 isEqualToString:DiagnosticsEnabledKey]) {
    [(DADiagnosticsPSController *)self setLoggingEnabled:v6 forSpecifier:v8];
  }
}

- (id)BOOLeanPropertyWithSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if ([v5 isEqualToString:DiagnosticsEnabledKey]) {
    BOOL v6 = [(DADiagnosticsPSController *)self isLoggingEnabledForSpecifier:v4];
  }
  else {
    BOOL v6 = 0;
  }
  v7 = [NSNumber numberWithBool:v6];

  return v7;
}

- (BOOL)isLoggingEnabledForSpecifier:(id)a3
{
  return MEMORY[0x270F250E8](self, a2);
}

- (void)handleDumpRuntimeStateForSpecifier:(id)a3
{
  pid_t v3 = MEMORY[0x230F717D0](@"dataaccessd", a2, a3);
  if ((v3 & 0x80000000) == 0)
  {
    kill(v3, 31);
  }
}

- (id)savedLogsDirectoryNameForSpecifier:(id)a3
{
  return @"DALogs";
}

- (BOOL)saveFileAtPath:(id)a3 toDirectory:(id)a4 withExtension:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = (void *)MEMORY[0x263F08850];
  id v11 = a4;
  id v12 = [v10 defaultManager];
  v13 = [v9 lastPathComponent];
  long long v14 = [v11 stringByAppendingPathComponent:v13];

  if (a5)
  {
    long long v15 = [v14 pathExtension];
    if ([v15 isEqual:@"log"])
    {
LABEL_5:

      goto LABEL_6;
    }
    long long v16 = [v14 pathExtension];
    char v17 = [v16 isEqual:@"gz"];

    if ((v17 & 1) == 0)
    {
      [v14 stringByAppendingPathExtension:@"log"];
      long long v14 = v15 = v14;
      goto LABEL_5;
    }
  }
LABEL_6:
  id v21 = 0;
  [v12 copyItemAtPath:v9 toPath:v14 error:&v21];
  id v18 = v21;
  uint64_t v19 = v18;
  if (a6 && v18) {
    *a6 = v18;
  }

  return v19 == 0;
}

- (void)saveLogsWithNotes:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DADiagnosticsPSController *)self pathsOfAllLogFiles];
  BOOL v6 = validPathsForPaths(v5);

  v7 = [MEMORY[0x263F08700] calendarDate];
  id v8 = [v7 descriptionWithCalendarFormat:@"%Y-%m-%d-%H%M%S"];

  id v9 = NSHomeDirectory();
  id v10 = NSString;
  id v11 = [(DADiagnosticsPSController *)self savedLogsDirectoryNameForSpecifier:0];
  id v12 = [v10 stringWithFormat:@"Library/Logs/CrashReporter/%@/Logs-%@", v11, v8];
  v13 = [v9 stringByAppendingPathComponent:v12];

  long long v14 = [MEMORY[0x263F08850] defaultManager];
  [v14 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:0];

  long long v15 = [NSString stringWithFormat:@"Log Notes [%@]\n==========================================================\n%@\n==========================================================\n", v8, v4];

  if (v13)
  {
    long long v16 = [v13 stringByAppendingPathComponent:@"Notes.log"];
    [v15 writeToFile:v16 atomically:1 encoding:4 error:0];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v28 = v6;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
LABEL_4:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        if (![(DADiagnosticsPSController *)self saveFileAtPath:*(void *)(*((void *)&v36 + 1) + 8 * v21) toDirectory:v13 withExtension:@"log" error:0])break; {
        if (v19 == ++v21)
        }
        {
          uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
          if (v19) {
            goto LABEL_4;
          }

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v22 = v17;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v33 != v25) {
                  objc_enumerationMutation(v22);
                }
                [(DADiagnosticsPSController *)self purgeFileAtPath:*(void *)(*((void *)&v32 + 1) + 8 * i)];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v24);
          }
          break;
        }
      }
    }

    BOOL v6 = v28;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DADiagnosticsPSController_saveLogsWithNotes___block_invoke;
  block[3] = &unk_26492BBD0;
  id v30 = v13;
  v31 = self;
  id v27 = v13;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __47__DADiagnosticsPSController_saveLogsWithNotes___block_invoke(uint64_t a1)
{
  v2 = NSString;
  pid_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"DIAG_LOG_SAVED_MESSAGE" value:&stru_26E020258 table:@"Diagnostic"];
  uint64_t v5 = [*(id *)(a1 + 32) lastPathComponent];
  objc_msgSend(v2, "stringWithFormat:", v4, v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v6 = *(void **)(a1 + 40);
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"DIAG_LOG_SAVED_TITLE" value:&stru_26E020258 table:@"Diagnostic"];
  [v6 runSimpleAlertWithTitle:v8 message:v9];
}

- (void)_presentNotesController
{
  pid_t v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"DIAG_NOTES_TITLE" value:&stru_26E020258 table:@"Diagnostic"];
  uint64_t v6 = objc_opt_class();
  id v10 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:v6 cell:1 edit:objc_opt_class()];

  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v10 setProperty:v8 forKey:*MEMORY[0x263F60228]];

  [v10 setProperty:self forKey:@"kDADiagnosticSaveNotesDelegate"];
  id v9 = objc_opt_new();
  *((unsigned char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB0]) = 1;
  [v9 setParentController:self];
  [v9 setSpecifier:v10];
  objc_storeWeak((id *)&v10[*MEMORY[0x263F5FE40]], self);
  [(DADiagnosticsPSController *)self pushController:v9];
}

- (void)handleSaveAllLogsStep2
{
  pid_t v3 = [(DADiagnosticsPSController *)self pathsOfAllLogFiles];
  validPathsForPaths(v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 count])
  {
    [(DADiagnosticsPSController *)self _presentNotesController];
  }
  else
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"DIAG_NO_LOGS_TO_SAVE_TITLE" value:&stru_26E020258 table:@"Diagnostic"];
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"DIAGS_NO_LOGS_TO_SAVE_MESSAGE" value:&stru_26E020258 table:@"Diagnostic"];
    [(DADiagnosticsPSController *)self runSimpleAlertWithTitle:v5 message:v7];
  }
}

- (void)_dismissSavingDataAlert
{
  [(UIAlertView *)self->_savingDataAlert dismissWithClickedButtonIndex:0 animated:1];
  [(id)*MEMORY[0x263F1D020] setIgnoresInteractionEvents:0];
  id v3 = [(DADiagnosticsPSController *)self rootController];
  [v3 taskFinished:self];
}

- (void)handleSaveAllLogsForSpecifier:(id)a3
{
  id v4 = a3;
  id v14 = [(DADiagnosticsPSController *)self rootController];
  [(DADiagnosticsPSController *)self handleDumpRuntimeStateForSpecifier:v4];

  [v14 addTask:self];
  id v5 = objc_alloc(MEMORY[0x263F1C400]);
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"DIAG_SAVING_ADDITIONAL_DATA_TITLE" value:&stru_26E020258 table:@"Diagnostic"];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"DIAG_SAVING_ADDITIONAL_DATA_MESSAGE" value:&stru_26E020258 table:@"Diagnostic"];
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"OK" value:&stru_26E020258 table:@"Diagnostic"];
  id v12 = (UIAlertView *)[v5 initWithTitle:v7 message:v9 delegate:self cancelButtonTitle:v11 otherButtonTitles:0];
  savingDataAlert = self->_savingDataAlert;
  self->_savingDataAlert = v12;

  [(UIAlertView *)self->_savingDataAlert show];
  [(id)*MEMORY[0x263F1D020] setIgnoresInteractionEvents:1];
  [(DADiagnosticsPSController *)self performSelector:sel__dismissSavingDataAlert withObject:0 afterDelay:4.0];
}

- (void)suspend
{
  if (([(id)*MEMORY[0x263F1D020] isSuspendedEventsOnly] & 1) == 0)
  {
    id v3 = [(DADiagnosticsPSController *)self navigationController];
    [v3 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)handleClearAllLogsForSpecifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = [(DADiagnosticsPSController *)self pathsOfAllLogFiles];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(DADiagnosticsPSController *)self purgeFileAtPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)pathsOfAllLogFiles
{
  return (id)[MEMORY[0x263EFF980] array];
}

- (void)purgeFileAtPath:(id)a3
{
  id v5 = a3;
  id v3 = [v5 lastPathComponent];
  if ([v3 isEqualToString:@"dataaccess.log"])
  {
    truncate((const char *)[v5 fileSystemRepresentation], 0);
  }
  else
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    [v4 removeItemAtPath:v5 error:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingDataAlert, 0);

  objc_storeStrong((id *)&self->_simpleAlert, 0);
}

@end