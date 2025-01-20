@interface BCSRealTimeFlagSignposter
+ (id)signposterForBCSType:(uint64_t)a1;
+ (id)signposterForItemIdentifier:(uint64_t)a1;
+ (id)signposterForShardIdentifier:(uint64_t)a1;
- (void)flagMeasurementDidChange:(BOOL)a3 forMeasurement:(id)a4;
@end

@implementation BCSRealTimeFlagSignposter

+ (id)signposterForBCSType:(uint64_t)a1
{
  self;
  id v3 = [(BCSRealTimeSignposter *)[BCSRealTimeFlagSignposter alloc] _initWithType:a2 signpostIdentifier:a2];

  return v3;
}

+ (id)signposterForShardIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = [BCSRealTimeFlagSignposter alloc];
  uint64_t v4 = [v2 type];

  id v5 = [(BCSRealTimeShardSignposter *)v3 _initWithShardType:v4 signpostIdentifier:v2];

  return v5;
}

+ (id)signposterForItemIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = [BCSRealTimeFlagSignposter alloc];
  uint64_t v4 = [v2 type];

  id v5 = [(BCSRealTimeSignposter *)v3 _initWithType:v4 signpostIdentifier:v2];

  return v5;
}

- (void)flagMeasurementDidChange:(BOOL)a3 forMeasurement:(id)a4
{
  BOOL v4 = a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (self)
  {
    int64_t signposterType = self->_signposterType;
    if (signposterType == 2)
    {
      id v35 = v6;
      v14 = ABSLogSignpost();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        if (v4) {
          v31 = "_ItemCacheHit";
        }
        else {
          v31 = "_ItemCacheMiss";
        }
        v32 = NSStringFromBCSType([(BCSRealTimeSignposter *)self type]);
        *(_DWORD *)buf = 136315394;
        v37 = v31;
        __int16 v38 = 2112;
        v39 = v32;
        _os_log_debug_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEBUG, "Signposting %s for type: %@", buf, 0x16u);
      }
      int64_t v15 = [(BCSRealTimeSignposter *)self type];
      v10 = ABSLogCommon();
      os_signpost_id_t v11 = [(BCSRealTimeSignposter *)self signpostIdentifier];
      unint64_t v16 = v11 - 1;
      if (v4)
      {
        if (v15 == 2)
        {
          if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "BusinessLink_ItemCacheHit";
        }
        else
        {
          if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "ChatSuggest_ItemCacheHit";
        }
      }
      else if (v15 == 2)
      {
        if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
          goto LABEL_72;
        }
        *(_WORD *)buf = 0;
        v13 = "BusinessLink_ItemCacheMiss";
      }
      else
      {
        if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
          goto LABEL_72;
        }
        *(_WORD *)buf = 0;
        v13 = "ChatSuggest_ItemCacheMiss";
      }
      goto LABEL_71;
    }
    if (signposterType != 1)
    {
      if (signposterType) {
        goto LABEL_73;
      }
      id v35 = v6;
      v8 = ABSLogSignpost();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        if (v4) {
          v29 = "_ConfigCacheHit";
        }
        else {
          v29 = "_ConfigCacheMiss";
        }
        v30 = NSStringFromBCSType([(BCSRealTimeSignposter *)self type]);
        *(_DWORD *)buf = 136315394;
        v37 = v29;
        __int16 v38 = 2112;
        v39 = v30;
        _os_log_debug_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEBUG, "Signposting %s for type: %@", buf, 0x16u);
      }
      int64_t v9 = [(BCSRealTimeSignposter *)self type];
      v10 = ABSLogCommon();
      os_signpost_id_t v11 = [(BCSRealTimeSignposter *)self signpostIdentifier];
      unint64_t v12 = v11 - 1;
      if (v4)
      {
        if (v9 == 2)
        {
          if (v12 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "BusinessLink_ConfigCacheHit";
        }
        else
        {
          if (v12 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "ChatSuggest_ConfigCacheHit";
        }
      }
      else if (v9 == 2)
      {
        if (v12 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
          goto LABEL_72;
        }
        *(_WORD *)buf = 0;
        v13 = "BusinessLink_ConfigCacheMiss";
      }
      else
      {
        if (v12 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
          goto LABEL_72;
        }
        *(_WORD *)buf = 0;
        v13 = "ChatSuggest_ConfigCacheMiss";
      }
LABEL_71:
      _os_signpost_emit_with_name_impl(&dword_2154F4000, v10, OS_SIGNPOST_EVENT, v11, v13, (const char *)&unk_215579135, buf, 2u);
LABEL_72:

      id v6 = v35;
      goto LABEL_73;
    }
    id v35 = v6;
    v17 = ABSLogSignpost();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (v4) {
        v33 = "_ShardCacheHit";
      }
      else {
        v33 = "_ShardCacheMiss";
      }
      v34 = NSStringFromBCSShardType([(BCSRealTimeShardSignposter *)self shardType]);
      *(_DWORD *)buf = 136315394;
      v37 = v33;
      __int16 v38 = 2112;
      v39 = v34;
      _os_log_debug_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEBUG, "Signposting %s for shard type: %@", buf, 0x16u);
    }
    int64_t v18 = [(BCSRealTimeShardSignposter *)self shardType] - 1;
    if (v4)
    {
      id v6 = v35;
      switch(v18)
      {
        case 0:
          v10 = ABSLogCommon();
          unint64_t v19 = [(BCSRealTimeSignposter *)self signpostIdentifier];
          if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_72;
          }
          os_signpost_id_t v11 = v19;
          if (!os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "ChatSuggest_ShardCacheHit";
          goto LABEL_71;
        case 1:
          v10 = ABSLogCommon();
          unint64_t v21 = [(BCSRealTimeSignposter *)self signpostIdentifier];
          if (v21 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_72;
          }
          os_signpost_id_t v11 = v21;
          if (!os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "BusinessLink_ShardCacheHit";
          goto LABEL_71;
        case 2:
          v10 = ABSLogCommon();
          unint64_t v22 = [(BCSRealTimeSignposter *)self signpostIdentifier];
          if (v22 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_72;
          }
          os_signpost_id_t v11 = v22;
          if (!os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "BusinessDomain_ShardCacheHit";
          goto LABEL_71;
        case 3:
          v10 = ABSLogCommon();
          unint64_t v23 = [(BCSRealTimeSignposter *)self signpostIdentifier];
          if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_72;
          }
          os_signpost_id_t v11 = v23;
          if (!os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "BusinessCaller_ShardCacheHit";
          goto LABEL_71;
        case 4:
          v10 = ABSLogCommon();
          unint64_t v24 = [(BCSRealTimeSignposter *)self signpostIdentifier];
          if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_72;
          }
          os_signpost_id_t v11 = v24;
          if (!os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "BusinessEmail_ShardCacheHit";
          goto LABEL_71;
        default:
          break;
      }
    }
    else
    {
      id v6 = v35;
      switch(v18)
      {
        case 0:
          v10 = ABSLogCommon();
          unint64_t v20 = [(BCSRealTimeSignposter *)self signpostIdentifier];
          if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_72;
          }
          os_signpost_id_t v11 = v20;
          if (!os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "ChatSuggest_ShardCacheMiss";
          goto LABEL_71;
        case 1:
          v10 = ABSLogCommon();
          unint64_t v25 = [(BCSRealTimeSignposter *)self signpostIdentifier];
          if (v25 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_72;
          }
          os_signpost_id_t v11 = v25;
          if (!os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "BusinessLink_ShardCacheMiss";
          goto LABEL_71;
        case 2:
          v10 = ABSLogCommon();
          unint64_t v26 = [(BCSRealTimeSignposter *)self signpostIdentifier];
          if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_72;
          }
          os_signpost_id_t v11 = v26;
          if (!os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "BusinessDomain_ShardCacheMiss";
          goto LABEL_71;
        case 3:
          v10 = ABSLogCommon();
          unint64_t v27 = [(BCSRealTimeSignposter *)self signpostIdentifier];
          if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_72;
          }
          os_signpost_id_t v11 = v27;
          if (!os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "BusinessCaller_ShardCacheMiss";
          goto LABEL_71;
        case 4:
          v10 = ABSLogCommon();
          unint64_t v28 = [(BCSRealTimeSignposter *)self signpostIdentifier];
          if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_72;
          }
          os_signpost_id_t v11 = v28;
          if (!os_signpost_enabled(v10)) {
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v13 = "BusinessEmail_ShardCacheMiss";
          goto LABEL_71;
        default:
          break;
      }
    }
  }
LABEL_73:
}

@end