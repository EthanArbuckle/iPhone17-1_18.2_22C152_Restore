@interface HDSyncAnchorEntity(HealthDiagnosticExtension)
+ (void)hde_reportSyncAnchorsForSyncProvenance:()HealthDiagnosticExtension diagnosticOperation:database:;
@end

@implementation HDSyncAnchorEntity(HealthDiagnosticExtension)

+ (void)hde_reportSyncAnchorsForSyncProvenance:()HealthDiagnosticExtension diagnosticOperation:database:
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v10 = (void *)[objc_alloc(MEMORY[0x263F0A808]) initWithColumnTitles:&unk_26DD8D778];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __117__HDSyncAnchorEntity_HealthDiagnosticExtension__hde_reportSyncAnchorsForSyncProvenance_diagnosticOperation_database___block_invoke;
  v17 = &unk_264867028;
  v19 = &v21;
  id v20 = 0;
  id v11 = v10;
  id v18 = v11;
  LOBYTE(a1) = [a1 enumerateSyncAnchorsForStoreID:a3 database:v9 error:&v20 handler:&v14];
  id v12 = v20;
  v13 = [v11 formattedTable];
  [v8 appendString:v13];

  [v8 appendNewline];
  if (a1)
  {
    if (!*((unsigned char *)v22 + 24)) {
      [v8 appendFormat:@"\tNo sync anchors found for this store."];
    }
  }
  else
  {
    [v8 log:@"ERROR: Failed to retrieve sync anchor information: %@", v12, v14, v15, v16, v17];
  }

  _Block_object_dispose(&v21, 8);
}

@end