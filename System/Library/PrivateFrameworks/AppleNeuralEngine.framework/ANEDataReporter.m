@interface ANEDataReporter
@end

@implementation ANEDataReporter

id __42___ANEDataReporter_addValue_forScalarKey___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  v2 = [NSNumber numberWithLongLong:v1];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

void __50___ANEDataReporter_reportTelemetryToPPS_playload___block_invoke()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v1 = (void *)reportTelemetryToPPS_playload__ppsIDMapping;
  reportTelemetryToPPS_playload__ppsIDMapping = v0;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = +[_ANEStrings ppsCategoryForANE];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v18;
    *(void *)&long long v4 = 138412290;
    long long v15 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v9 = objc_msgSend((id)reportTelemetryToPPS_playload__ppsIDMapping, "objectForKey:", v8, v15);
        v10 = +[_ANELog common];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v15;
          uint64_t v22 = v8;
          _os_log_debug_impl(&dword_1DB8AB000, v10, OS_LOG_TYPE_DEBUG, "Telemetry: add identifier %@.", buf, 0xCu);
        }

        uint64_t v16 = 0;
        v11 = +[_ANEStrings ppsSubsystemForANE];
        uint64_t v12 = PPSCreateTelemetryIdentifier();

        uint64_t v16 = v12;
        if (v12)
        {
          uint64_t v13 = [MEMORY[0x1E4F29238] value:&v16 withObjCType:"^{PPSTelemetryIdentifier=}"];

          [(id)reportTelemetryToPPS_playload__ppsIDMapping setObject:v13 forKeyedSubscript:v8];
          v9 = (void *)v13;
        }
        else
        {
          v14 = +[_ANELog common];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            uint64_t v22 = v8;
            _os_log_error_impl(&dword_1DB8AB000, v14, OS_LOG_TYPE_ERROR, "Telemetry: could not create ppsId for %@!", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }
}

@end