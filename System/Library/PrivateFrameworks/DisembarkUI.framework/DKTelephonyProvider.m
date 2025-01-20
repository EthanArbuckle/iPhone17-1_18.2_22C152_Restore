@interface DKTelephonyProvider
- (id)cellularPlans;
@end

@implementation DKTelephonyProvider

- (id)cellularPlans
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v3 = [MEMORY[0x263F67F30] sharedInstance];
  v4 = [v3 planItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    unint64_t v8 = 0x264CF0000uLL;
    id v26 = v2;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        v11 = _DKLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v16 = [v10 carrierName];
          v17 = [v10 phoneNumber];
          v18 = v4;
          unint64_t v19 = v8;
          uint64_t v20 = [v10 type];
          uint64_t v21 = [v10 transferredStatus];
          *(_DWORD *)buf = 138413058;
          v22 = @"YES";
          if (!v21) {
            v22 = @"NO";
          }
          v32 = v16;
          __int16 v33 = 2112;
          v34 = v17;
          __int16 v35 = 2048;
          uint64_t v36 = v20;
          unint64_t v8 = v19;
          v4 = v18;
          __int16 v37 = 2112;
          v38 = v22;
          _os_log_debug_impl(&dword_237B3F000, v11, OS_LOG_TYPE_DEBUG, "cellularPlans - planItem carrierName:%@  phoneNumber:%@ type:%li IsTransfered:%@", buf, 0x2Au);

          id v2 = v26;
        }

        if ([v10 type] == 2 || objc_msgSend(v10, "type") == 3)
        {
          id v12 = objc_alloc(*(Class *)(v8 + 1936));
          v13 = [v10 carrierName];
          v14 = [v10 phoneNumber];
          v15 = objc_msgSend(v12, "initWithCarrierName:phoneNumber:isTransferred:", v13, v14, objc_msgSend(v10, "transferredStatus") != 0);

          [v2 addObject:v15];
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v23 = [v4 countByEnumeratingWithState:&v27 objects:v39 count:16];
      uint64_t v6 = v23;
    }
    while (v23);
  }

  v24 = (void *)[v2 copy];
  return v24;
}

@end