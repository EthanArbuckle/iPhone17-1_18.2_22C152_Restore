uint64_t DLCSessionConnect()
{
  return 1;
}

uint64_t DLCSessionDiconnect()
{
  return 1;
}

uint64_t DLCSessionShouldLogLevel(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return IMShouldLogCategory();
  }
  else {
    return IMShouldLog();
  }
}

uint64_t DLCSessionShouldLogCheckpoints()
{
  return IMShouldLog();
}

uint64_t DLCSessionBeginSession(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  IMSyncLoggingsPreferences();
  uint64_t result = IMShouldLog();
  if (result)
  {
    return MEMORY[0x270F3CF50](a1, a2, a3, a4);
  }
  return result;
}

uint64_t DLCSessionEndSession(uint64_t a1, uint64_t a2)
{
  uint64_t result = IMShouldLog();
  if (result)
  {
    return MEMORY[0x270F3CF58](a1, a2);
  }
  return result;
}

uint64_t DLCSessionLogCallInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3)
  {
    if (IMShouldLog()) {
      goto LABEL_3;
    }
    return 0;
  }
  if ((IMShouldLogCategory() & 1) == 0) {
    return 0;
  }
LABEL_3:
  return MEMORY[0x270F3CF70](a1, a2, a3, a4);
}

uint64_t DLCSessionNoteCheckpoint()
{
  uint64_t result = IMShouldLog();
  if (result) {
    return _IMLoggingNoteCheckpoint_V();
  }
  return result;
}

uint64_t DLCSessionLogWithLevel()
{
  uint64_t result = IMShouldLogCategory();
  if (result) {
    return _IMLoggingLog_V();
  }
  return result;
}

uint64_t DLCSessionLogWithLevelV()
{
  uint64_t result = IMShouldLogCategory();
  if (result)
  {
    return _IMLoggingLog_V();
  }
  return result;
}

uint64_t DLCSessionPulse(uint64_t a1, uint64_t a2)
{
  uint64_t result = IMShouldLog();
  if (result)
  {
    return MEMORY[0x270F3CF88](a1, a2);
  }
  return result;
}

uint64_t DLCSessionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = IMShouldLog();
  if (result)
  {
    return MEMORY[0x270F3CF60](a1, a2, a3);
  }
  return result;
}

uint64_t DLCSessionAction()
{
  return MEMORY[0x270F3CF38]();
}

uint64_t DLCSessionPerformSnapshot(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = IMShouldLog();
  if (result)
  {
    v5 = (void *)MEMORY[0x2166C6D20]();
    objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, @"reasonForSnapshot", 0);
    uint64_t v6 = _IMLoggingActionWithUserInfo();
    return v6;
  }
  return result;
}

uint64_t DLCSessionSetFailureReason(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = IMShouldLog();
  if (result)
  {
    return MEMORY[0x270F3CF90](a1, a2, a3);
  }
  return result;
}

uint64_t DLCSessionSetInitiator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = IMShouldLog();
  if (result)
  {
    return MEMORY[0x270F3CF98](a1, a2, a3);
  }
  return result;
}

uint64_t DLCSessionSetRecipient(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = IMShouldLog();
  if (result)
  {
    return MEMORY[0x270F3CFA0](a1, a2, a3);
  }
  return result;
}

uint64_t DLCSessionAddLogFile()
{
  return MEMORY[0x270F3CF48]();
}

uint64_t _DLCLogWithLevelFileAndLine()
{
  return _IMLogStringWithFileAndLine_V();
}

uint64_t DLCLogWithLevel()
{
  return _IMLogString_V();
}

uint64_t DLCLogEventWithLevel()
{
  return _IMLogEventString_V();
}

uint64_t DLCLogBacktraceWithLevel()
{
  return IMLogCurrentBacktrace_V();
}

uint64_t DLCLogBacktraceWithLevelV()
{
  return IMLogCurrentBacktrace_V();
}

uint64_t _DLCLogWithLevelV()
{
  return _IMLogString_V();
}

uint64_t DLCLogWithLevelV()
{
  return _IMLogString_V();
}

uint64_t _DLCLogEventWithLevelV()
{
  return _IMLogEventString_V();
}

uint64_t DLCLogEventWithLevelV()
{
  return _IMLogEventString_V();
}

uint64_t DLCWarn()
{
  return _IMWarnString_V();
}

uint64_t _DLCWarnV()
{
  return _IMWarnString_V();
}

uint64_t DLCWarnV()
{
  return _IMWarnString_V();
}

uint64_t DLCShouldLogLevel(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return IMShouldLogCategory();
  }
  else {
    return IMShouldLog();
  }
}

uint64_t DLCCollectLogsWithCompletionHandler(uint64_t result, void *a2, void *a3)
{
  if (result)
  {
    v5 = (__CFDictionary *)objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", objc_msgSend(a2, "objectForKey:", @"DLCLogGatheringFlagsKey"), @"collectionFlags", objc_msgSend(a2, "objectForKey:", @"DLCAlertTitleKey"), @"title", objc_msgSend(a2, "objectForKey:", @"DLCGatheringDisplayFlagsKey"), @"displayFlags", 0);
    uint64_t v6 = (const void *)[a2 objectForKey:@"DLCDefaultRadarComponentKey"];
    if (v6) {
      CFDictionarySetValue(v5, @"radarComponent", v6);
    }
    v7 = (const void *)[a2 objectForKey:@"DLCDefaultRadarComponentKey"];
    if (v7) {
      CFDictionarySetValue(v5, @"radarComponentVersion", v7);
    }
    id v8 = (id)[a3 copy];
    return _IMLoggingActionWithUserInfo();
  }
  return result;
}

void sub_21601C8E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [a3 objectForKey:@"logPath"];
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"replyAction"), "integerValue") != 14 || v5 == 0) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v5, @"DLCLogPathKey", 0);
  }
  id v8 = (id)v7;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t DLCCollectLogs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = a1;
  }
  id v8 = objc_alloc(NSDictionary);
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  v10 = objc_msgSend(v8, "initWithObjectsAndKeys:", v9, @"DLCGatheringDisplayFlagsKey", objc_msgSend(NSNumber, "numberWithInteger:", a4), @"DLCLogGatheringFlagsKey", v7, @"DLCAlertTitleKey", 0);
  uint64_t v11 = DLCCollectLogsWithCompletionHandler(a1, v10, 0);

  return v11;
}

uint64_t DLCShouldLogMessageBodies(uint64_t a1)
{
  uint64_t result = IMShouldLog();
  if (result)
  {
    return MEMORY[0x270F3CE50](a1);
  }
  return result;
}

uint64_t DLCLoggingStringForMessageData()
{
  return MEMORY[0x270F3CDF8]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

uint64_t IMLogCurrentBacktrace_V()
{
  return MEMORY[0x270F3CDD8]();
}

uint64_t IMShouldLog()
{
  return MEMORY[0x270F3CE40]();
}

uint64_t IMShouldLogCategory()
{
  return MEMORY[0x270F3CE48]();
}

uint64_t IMSyncLoggingsPreferences()
{
  return MEMORY[0x270F3CE90]();
}

uint64_t _IMLogEventString_V()
{
  return MEMORY[0x270F3CF20]();
}

uint64_t _IMLogStringWithFileAndLine_V()
{
  return MEMORY[0x270F3CF28]();
}

uint64_t _IMLogString_V()
{
  return MEMORY[0x270F3CF30]();
}

uint64_t _IMLoggingActionWithUserInfo()
{
  return MEMORY[0x270F3CF40]();
}

uint64_t _IMLoggingLog_V()
{
  return MEMORY[0x270F3CF78]();
}

uint64_t _IMLoggingNoteCheckpoint_V()
{
  return MEMORY[0x270F3CF80]();
}

uint64_t _IMWarnString_V()
{
  return MEMORY[0x270F3CFB0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

void objc_release(id a1)
{
}