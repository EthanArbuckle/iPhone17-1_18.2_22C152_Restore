@interface DPDediscoReporter
@end

@implementation DPDediscoReporter

void __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[_DPLog daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  v6 = [v3 localizedDescription];
  int v7 = [*(id *)(a1 + 48) count];
  char v8 = [*(id *)(a1 + 56) telemetryAllowed];
  BOOL v9 = 1;
  if ((v8 & 1) == 0) {
    BOOL v9 = +[_DPDeviceInfo isInternalBuild];
  }
  LOBYTE(v11) = v9;
  LODWORD(v10) = 1;
  HIDWORD(v10) = v7;
  +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v5, 4, 0, 0, 411, v6, v10, v11);
}

void __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_53(void *a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[_DPLog daemon];
  int v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = a1[4];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1DC55E000, v7, OS_LOG_TYPE_INFO, "Donation was successfully submitted to Dedisco for key: %@", (uint8_t *)&v9, 0xCu);
    }
LABEL_9:

    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:*(void *)(*(void *)(a1[7] + 8) + 40)];
    [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:a1[5]];
    goto LABEL_10;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_53_cold_2();
  }

  if ([v5 code] == 205)
  {
    int v7 = +[_DPLog daemon];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_53_cold_1(v7);
    }
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __60___DPDediscoReporter_filterNonConformingDediscoRecordsFrom___block_invoke()
{
  return [(id)objc_opt_class() conformsToProtocol:&unk_1F37A77E0] ^ 1;
}

void __59___DPDediscoReporter_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x1E019F810]();
  [*(id *)(a1 + 32) reportDediscoRecords:*(void *)(a1 + 40)];
}

void __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_0(&dword_1DC55E000, v0, v1, "Could not create connection to %@ : error=%@");
}

void __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_53_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1DC55E000, log, OS_LOG_TYPE_DEBUG, "Treating HTTP non-2xx as final failure", v1, 2u);
}

void __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_53_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_0(&dword_1DC55E000, v0, v1, "Failed to submit donation to Dedisco for key %@ with error: %@");
}

@end