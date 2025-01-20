@interface HDSyncAnchorEntity
@end

@implementation HDSyncAnchorEntity

void __117__HDSyncAnchorEntity_HealthDiagnosticExtension__hde_reportSyncAnchorsForSyncProvenance_diagnosticOperation_database___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v32[7] = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (a6 | a5 | a7 | a8 | a10)
  {
    v31 = objc_msgSend(MEMORY[0x263F433C8], "identifierWithSchema:entity:");
    v26 = *(void **)(a1 + 32);
    v30 = [v31 description];
    v32[0] = v30;
    v29 = [NSNumber numberWithLongLong:a2];
    v28 = [v29 stringValue];
    v32[1] = v28;
    v27 = [NSNumber numberWithLongLong:a5];
    v16 = [v27 stringValue];
    v32[2] = v16;
    v17 = [NSNumber numberWithLongLong:a6];
    v18 = [v17 stringValue];
    v32[3] = v18;
    v19 = [NSNumber numberWithLongLong:a7];
    v20 = [v19 stringValue];
    v32[4] = v20;
    v21 = [NSNumber numberWithLongLong:a8];
    v22 = [v21 stringValue];
    v32[5] = v22;
    v23 = [NSNumber numberWithLongLong:a10];
    v24 = [v23 stringValue];
    v32[6] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:7];
    [v26 appendRow:v25];
  }
}

@end