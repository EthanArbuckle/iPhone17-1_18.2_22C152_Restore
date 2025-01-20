@interface ESDiagnosticsPSController
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
- (void)saveNotesInBackground:(id)a3;
- (void)setBooleanProperty:(id)a3 withSpecifier:(id)a4;
- (void)suspend;
@end

@implementation ESDiagnosticsPSController

+ (BOOL)diagnosticsVisible
{
  return _areDADiagnosticsEnabled(a1, a2);
}

+ (id)linkSpecifier
{
  if ([(id)objc_opt_class() diagnosticsVisible])
  {
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = [v2 localizedStringForKey:@"DIAG_LINK_TITLE" value:&stru_30C50 table:@"Diagnostic"];
    v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dumpRuntimeStateSpecifiers
{
  v2 = +[NSMutableArray array];
  v3 = +[PSSpecifier groupSpecifierWithName:&stru_30C50];
  [v2 addObject:v3];

  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"DIAG_DUMP_RUNTIME_STATE" value:&stru_30C50 table:@"Diagnostic"];
  v6 = +[PSSpecifier buttonSpecifierWithTitle:v5 target:0 action:"handleDumpRuntimeStateForSpecifier:" confirmationInfo:0];
  [v2 addObject:v6];

  return v2;
}

- (id)diagnosticSpecifiers
{
  v2 = +[NSMutableArray array];
  v3 = [(id)objc_opt_class() dumpRuntimeStateSpecifiers];
  if (v3) {
    [v2 addObjectsFromArray:v3];
  }
  [v3 lastObject];

  return v2;
}

- (id)specifiers
{
  v3 = [(ESDiagnosticsPSController *)self diagnosticSpecifiers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_storeWeak((id *)(*(void *)(*((void *)&v13 + 1) + 8 * (void)v7) + OBJC_IVAR___PSSpecifier_target), self);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  uint64_t v8 = OBJC_IVAR___PSListController__specifiers;
  v9 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v10 = v3;

  id v11 = *(id *)&self->PSListController_opaque[v8];
  return v11;
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
      [(ESDiagnosticsPSController *)self performSelector:simpleConfirmSheetDismissedSEL withObject:0 afterDelay:1.0];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ESDiagnosticsPSController;
    [(ESDiagnosticsPSController *)&v9 alertView:v6 clickedButtonAtIndex:a4];
  }
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  id v5 = (UIAlertView *)a3;
  if (self->_savingDataAlert == v5)
  {
    self->_savingDataAlert = 0;
    uint64_t v6 = v5;

    [(ESDiagnosticsPSController *)self performSelector:"handleSaveAllLogsStep2" withObject:0 afterDelay:0.0];
    id v5 = v6;
  }
}

- (void)runSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissedSelector:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)UIAlertView);
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"OK" value:&stru_30C50 table:@"Diagnostic"];
  long long v13 = (UIAlertView *)[v10 initWithTitle:v9 message:v8 delegate:self cancelButtonTitle:v12 otherButtonTitles:0];

  simpleAlert = self->_simpleAlert;
  self->_simpleAlert = v13;

  if (a5) {
    long long v15 = a5;
  }
  else {
    long long v15 = 0;
  }
  self->_SEL simpleConfirmSheetDismissedSEL = v15;
  long long v16 = self->_simpleAlert;

  [(UIAlertView *)v16 show];
}

- (void)runSimpleAlertWithTitle:(id)a3 message:(id)a4
{
  uint64_t v6 = (void *)UIApp;
  v7 = (__CFString *)a4;
  alertHeader = (__CFString *)a3;
  if ([v6 isSuspended])
  {
    CFOptionFlags v9 = 0;
    CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, alertHeader, v7, 0, 0, 0, &v9);
  }
  else
  {
    [(ESDiagnosticsPSController *)self runSimpleAlertWithTitle:alertHeader message:v7 dismissedSelector:0];
  }
}

- (void)setBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  id v8 = a4;
  id v6 = [a3 BOOLValue];
  v7 = [v8 identifier];
  if ([v7 isEqualToString:@"ESDiagnosticsEnabled"]) {
    [(ESDiagnosticsPSController *)self setLoggingEnabled:v6 forSpecifier:v8];
  }
}

- (id)BOOLeanPropertyWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  if ([v5 isEqualToString:@"ESDiagnosticsEnabled"]) {
    BOOL v6 = [(ESDiagnosticsPSController *)self isLoggingEnabledForSpecifier:v4];
  }
  else {
    BOOL v6 = 0;
  }
  v7 = +[NSNumber numberWithBool:v6];

  return v7;
}

- (BOOL)isLoggingEnabledForSpecifier:(id)a3
{
  return _areDADiagnosticsEnabled(self, a2);
}

- (void)handleDumpRuntimeStateForSpecifier:(id)a3
{
  pid_t v3 = PSPIDForProcessNamed();
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
  id v10 = a4;
  id v11 = +[NSFileManager defaultManager];
  v12 = [v9 lastPathComponent];
  long long v13 = [v10 stringByAppendingPathComponent:v12];

  if (a5)
  {
    long long v14 = [v13 pathExtension];
    if ([v14 isEqual:@"log"])
    {
LABEL_5:

      goto LABEL_6;
    }
    long long v15 = [v13 pathExtension];
    unsigned __int8 v16 = [v15 isEqual:@"gz"];

    if ((v16 & 1) == 0)
    {
      [v13 stringByAppendingPathExtension:@"log"];
      long long v13 = v14 = v13;
      goto LABEL_5;
    }
  }
LABEL_6:
  id v20 = 0;
  [v11 copyItemAtPath:v9 toPath:v13 error:&v20];
  id v17 = v20;
  v18 = v17;
  if (a6 && v17) {
    *a6 = v17;
  }

  return v18 == 0;
}

- (void)saveLogsWithNotes:(id)a3
{
  id v4 = a3;
  id v5 = [(ESDiagnosticsPSController *)self pathsOfAllLogFiles];
  BOOL v6 = sub_EC08(v5);

  v7 = +[NSCalendarDate calendarDate];
  id v8 = [v7 descriptionWithCalendarFormat:@"%Y-%m-%d-%H%M%S"];

  id v9 = NSHomeDirectory();
  id v10 = [(ESDiagnosticsPSController *)self savedLogsDirectoryNameForSpecifier:0];
  id v11 = +[NSString stringWithFormat:@"Library/Logs/CrashReporter/%@/Logs-%@", v10, v8];
  v12 = [v9 stringByAppendingPathComponent:v11];

  long long v13 = +[NSFileManager defaultManager];
  [v13 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:0];

  long long v14 = +[NSString stringWithFormat:@"Log Notes [%@]\n==========================================================\n%@\n==========================================================\n", v8, v4];

  if (v12)
  {
    long long v15 = [v12 stringByAppendingPathComponent:@"Notes.log"];
    [v14 writeToFile:v15 atomically:1 encoding:4 error:0];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v27 = v6;
    id v16 = v6;
    id v17 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v36;
LABEL_4:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        if (![(ESDiagnosticsPSController *)self saveFileAtPath:*(void *)(*((void *)&v35 + 1) + 8 * v20) toDirectory:v12 withExtension:@"log" error:0])break; {
        if (v18 == (id)++v20)
        }
        {
          id v18 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v18) {
            goto LABEL_4;
          }

          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v21 = v16;
          id v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v32;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v32 != v24) {
                  objc_enumerationMutation(v21);
                }
                [(ESDiagnosticsPSController *)self purgeFileAtPath:*(void *)(*((void *)&v31 + 1) + 8 * i)];
              }
              id v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v23);
          }
          break;
        }
      }
    }

    BOOL v6 = v27;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_ED70;
  block[3] = &unk_30888;
  id v29 = v12;
  v30 = self;
  id v26 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)saveNotesInBackground:(id)a3
{
}

- (void)_presentNotesController
{
  pid_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"DIAG_NOTES_TITLE" value:&stru_30C50 table:@"Diagnostic"];
  uint64_t v5 = objc_opt_class();
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:v5 cell:1 edit:objc_opt_class()];

  BOOL v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v9 setProperty:v7 forKey:PSSetupCustomClassKey];

  [v9 setProperty:self forKey:@"kESDiagnosticSaveNotesDelegate"];
  id v8 = objc_opt_new();
  self->PSListController_opaque[OBJC_IVAR___PSListController__showingSetupController] = 1;
  [v8 setParentController:self];
  [v8 setSpecifier:v9];
  objc_storeWeak((id *)&v9[OBJC_IVAR___PSSpecifier_target], self);
  [(ESDiagnosticsPSController *)self pushController:v8];
}

- (void)handleSaveAllLogsStep2
{
  pid_t v3 = [(ESDiagnosticsPSController *)self pathsOfAllLogFiles];
  sub_EC08(v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 count])
  {
    [(ESDiagnosticsPSController *)self _presentNotesController];
  }
  else
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"DIAG_NO_LOGS_TO_SAVE_TITLE" value:&stru_30C50 table:@"Diagnostic"];
    BOOL v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"DIAGS_NO_LOGS_TO_SAVE_MESSAGE" value:&stru_30C50 table:@"Diagnostic"];
    [(ESDiagnosticsPSController *)self runSimpleAlertWithTitle:v5 message:v7];
  }
}

- (void)_dismissSavingDataAlert
{
  [(UIAlertView *)self->_savingDataAlert dismissWithClickedButtonIndex:0 animated:1];
  [UIApp setIgnoresInteractionEvents:0];
  id v3 = [(ESDiagnosticsPSController *)self rootController];
  [v3 taskFinished:self];
}

- (void)handleSaveAllLogsForSpecifier:(id)a3
{
  id v4 = a3;
  id v14 = [(ESDiagnosticsPSController *)self rootController];
  [(ESDiagnosticsPSController *)self handleDumpRuntimeStateForSpecifier:v4];

  [v14 addTask:self];
  id v5 = objc_alloc((Class)UIAlertView);
  BOOL v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"DIAG_SAVING_ADDITIONAL_DATA_TITLE" value:&stru_30C50 table:@"Diagnostic"];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"DIAG_SAVING_ADDITIONAL_DATA_MESSAGE" value:&stru_30C50 table:@"Diagnostic"];
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"OK" value:&stru_30C50 table:@"Diagnostic"];
  v12 = (UIAlertView *)[v5 initWithTitle:v7 message:v9 delegate:self cancelButtonTitle:v11 otherButtonTitles:0];
  savingDataAlert = self->_savingDataAlert;
  self->_savingDataAlert = v12;

  [(UIAlertView *)self->_savingDataAlert show];
  [UIApp setIgnoresInteractionEvents:1];
  [(ESDiagnosticsPSController *)self performSelector:"_dismissSavingDataAlert" withObject:0 afterDelay:4.0];
}

- (void)suspend
{
  if (([UIApp isSuspendedEventsOnly] & 1) == 0)
  {
    id v3 = [(ESDiagnosticsPSController *)self navigationController];
    [v3 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)handleClearAllLogsForSpecifier:(id)a3
{
  id v4 = [(ESDiagnosticsPSController *)self pathsOfAllLogFiles];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(ESDiagnosticsPSController *)self purgeFileAtPath:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)pathsOfAllLogFiles
{
  return +[NSMutableArray array];
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
    id v4 = +[NSFileManager defaultManager];
    [v4 removeItemAtPath:v5 error:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingDataAlert, 0);

  objc_storeStrong((id *)&self->_simpleAlert, 0);
}

@end