@interface PKTextInputDebugLogController
- (BOOL)debugStateCanDisplayDetails;
- (PKTextInputDebugLogController)init;
- (PKTextInputDebugSharpenerLog)sharpenerLogWithCurrentContent;
- (id)debugStateDetailViewController;
- (void)logEntryForAppliedResult:(uint64_t)a1;
- (void)reportDebugStateDescription:(id)a3;
@end

@implementation PKTextInputDebugLogController

- (PKTextInputDebugLogController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKTextInputDebugLogController;
  v2 = [(PKTextInputDebugLogController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    logEntries = v2->__logEntries;
    v2->__logEntries = (NSMutableArray *)v3;
  }
  return v2;
}

- (PKTextInputDebugSharpenerLog)sharpenerLogWithCurrentContent
{
  if (a1)
  {
    a1 = [[PKTextInputDebugSharpenerLog alloc] initWithLogEntries:a1->_logEntries];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)logEntryForAppliedResult:(uint64_t)a1
{
  id v16 = a2;
  if (a1 && os_variant_has_internal_diagnostics())
  {
    uint64_t v3 = [[PKTextInputDebugRecordingLogEntry alloc] initWithResultCommand:v16];
    [*(id *)(a1 + 8) addObject:v3];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    id v4 = *(id *)(a1 + 8);
    v5 = [v4 lastObject];

    if (v5)
    {
      objc_super v6 = [v5 inputTargetContentInfo];
      v7 = [v6 textInputTarget];
      v8 = [v7 inputTargetIdentifier];

      id v9 = *(id *)(a1 + 8);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__PKTextInputDebugLogController__purgeOldLogEntries__block_invoke;
      v17[3] = &unk_1E64C6120;
      id v10 = v8;
      id v18 = v10;
      v19 = &v20;
      [v9 enumerateObjectsWithOptions:2 usingBlock:v17];
    }
    uint64_t v11 = v21[3];
    if (v11 >= 5) {
      uint64_t v11 = 5;
    }
    v21[3] = v11;
    id v12 = *(id *)(a1 + 8);
    uint64_t v13 = [v12 count];
    uint64_t v14 = v13 - v21[3];

    if (v14 >= 1)
    {
      id v15 = *(id *)(a1 + 8);
      objc_msgSend(v15, "removeObjectsInRange:", 0, v14);
    }
    _Block_object_dispose(&v20, 8);
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

void __52__PKTextInputDebugLogController__purgeOldLogEntries__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  objc_super v6 = [a2 inputTargetContentInfo];
  v7 = [v6 textInputTarget];
  id v8 = [v7 inputTargetIdentifier];

  if ([v8 isEqualToNumber:*(void *)(a1 + 32)]) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else {
    *a4 = 1;
  }
}

- (void)reportDebugStateDescription:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = (void (**)(id, __CFString *, void *))a3;
  objc_super v6 = [v4 array];
  if (self) {
    logEntries = self->__logEntries;
  }
  else {
    logEntries = 0;
  }
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __61__PKTextInputDebugLogController_reportDebugStateDescription___block_invoke;
  id v15 = &unk_1E64C6148;
  id v16 = v6;
  id v8 = v6;
  [(NSMutableArray *)logEntries enumerateObjectsWithOptions:0 usingBlock:&v12];
  id v9 = NSString;
  id v10 = [v8 componentsJoinedByString:@"\n"];
  uint64_t v11 = [v9 stringWithFormat:@"\n%@", v10, v12, v13, v14, v15];

  v5[2](v5, @"Log Entries", v11);
}

void __61__PKTextInputDebugLogController_reportDebugStateDescription___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 minimalDescription];
  v5 = *(void **)(a1 + 32);
  objc_super v6 = [NSString stringWithFormat:@"  %ld: %@", a3, v7];
  [v5 addObject:v6];
}

- (BOOL)debugStateCanDisplayDetails
{
  return 1;
}

- (id)debugStateDetailViewController
{
  v2 = -[PKTextInputDebugLogController sharpenerLogWithCurrentContent]((PKTextInputDebugSharpenerLog *)self);
  uint64_t v3 = [[PKTextInputDebugSharpenerLogViewController alloc] initWithSharpenerLog:v2];

  return v3;
}

- (void).cxx_destruct
{
}

@end