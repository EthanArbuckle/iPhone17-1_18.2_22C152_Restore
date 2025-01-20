@interface CLSTemporalClusterReader
+ (BOOL)_isSupportedPortraitEventCategory:(unsigned __int8)a3;
- (id)eventsBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
@end

@implementation CLSTemporalClusterReader

+ (BOOL)_isSupportedPortraitEventCategory:(unsigned __int8)a3
{
  return (a3 & 0xFFFFFFFB) == 8;
}

- (id)eventsBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 array];
  id v12 = objc_alloc_init(MEMORY[0x1E4F89F78]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__CLSTemporalClusterReader_eventsBetweenStartDate_endDate_error___block_invoke;
  v16[3] = &unk_1E690F720;
  v16[4] = self;
  id v13 = v11;
  id v17 = v13;
  LODWORD(a5) = [v12 iterRankedTemporalClustersForStartDate:v10 endDate:v9 error:a5 block:v16];

  if (a5) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  return v14;
}

void __65__CLSTemporalClusterReader_eventsBetweenStartDate_endDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 event];
  if (v4
    && objc_msgSend((id)objc_opt_class(), "_isSupportedPortraitEventCategory:", objc_msgSend(v4, "suggestedEventCategory")))
  {
    v3 = [[CLSTemporalClusterEvent alloc] initWithPortraitEvent:v4];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

@end