@interface HDWorkoutEntityEncoder
@end

@implementation HDWorkoutEntityEncoder

void __74___HDWorkoutEntityEncoder_codableRepresentationForPersistentID_row_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, double a4, double a5)
{
  id v9 = a3;
  v12 = objc_alloc_init(HDCodableWorkoutEvent);
  [(HDCodableWorkoutEvent *)v12 setDate:a4];
  [(HDCodableWorkoutEvent *)v12 setType:a2];
  [(HDCodableWorkoutEvent *)v12 setDuration:a5];
  v10 = objc_msgSend(v9, "hk_codableMetadata");
  [(HDCodableWorkoutEvent *)v12 setMetadataDictionary:v10];

  v11 = [v9 objectForKey:*MEMORY[0x1E4F2A1E8]];

  if (v11) {
    -[HDCodableWorkoutEvent setSwimmingStrokeStyle:](v12, "setSwimmingStrokeStyle:", [v11 longLongValue]);
  }
  [*(id *)(a1 + 32) addEvents:v12];
}

uint64_t __74___HDWorkoutEntityEncoder_applyPropertiesToObject_persistentID_row_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v8 = [v3 sampleType];
  [v4 setObject:v3 forKeyedSubscript:v8];

  return 1;
}

@end