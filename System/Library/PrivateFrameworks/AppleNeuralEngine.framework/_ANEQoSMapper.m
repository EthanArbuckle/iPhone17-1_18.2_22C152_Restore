@interface _ANEQoSMapper
+ (id)dispatchQueueArrayByMappingPrioritiesWithTag:(id)a3;
+ (int)programPriorityForQoS:(unsigned int)a3;
+ (int)realTimeProgramPriority;
+ (unint64_t)queueIndexForQoS:(unsigned int)a3;
+ (unint64_t)realTimeQueueIndex;
+ (unsigned)aneBackgroundTaskQoS;
+ (unsigned)aneDefaultTaskQoS;
+ (unsigned)aneRealTimeTaskQoS;
+ (unsigned)aneUserInitiatedTaskQoS;
+ (unsigned)aneUserInteractiveTaskQoS;
+ (unsigned)aneUtilityTaskQoS;
+ (unsigned)qosForProgramPriority:(int)a3;
@end

@implementation _ANEQoSMapper

+ (int)programPriorityForQoS:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a1 aneRealTimeTaskQoS] == a3) {
    return 2;
  }
  HIDWORD(v7) = a3 - 9;
  LODWORD(v7) = a3 - 9;
  unsigned int v6 = v7 >> 2;
  if (v6 < 7 && ((0x5Du >> v6) & 1) != 0) {
    return dword_1DB8E7130[v6];
  }
  v8 = +[_ANELog daemon];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = NSStringFromSelector(a2);
    int v10 = 138412546;
    v11 = v9;
    __int16 v12 = 1024;
    unsigned int v13 = a3;
    _os_log_impl(&dword_1DB8AB000, v8, OS_LOG_TYPE_INFO, "%@: %d => Invalid qos requested", (uint8_t *)&v10, 0x12u);
  }
  return 5;
}

+ (unint64_t)queueIndexForQoS:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a1 aneRealTimeTaskQoS] == a3) {
    return 2;
  }
  HIDWORD(v7) = a3 - 9;
  LODWORD(v7) = a3 - 9;
  unsigned int v6 = v7 >> 2;
  if (v6 < 7 && ((0x5Du >> v6) & 1) != 0) {
    return qword_1DB8E70F8[v6];
  }
  v8 = +[_ANELog daemon];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = NSStringFromSelector(a2);
    int v10 = 138412546;
    v11 = v9;
    __int16 v12 = 1024;
    unsigned int v13 = a3;
    _os_log_impl(&dword_1DB8AB000, v8, OS_LOG_TYPE_INFO, "%@: %d => Invalid qos requested", (uint8_t *)&v10, 0x12u);
  }
  return 5;
}

+ (unsigned)aneRealTimeTaskQoS
{
  return 0;
}

+ (int)realTimeProgramPriority
{
  return 2;
}

+ (unsigned)aneUserInteractiveTaskQoS
{
  return 33;
}

+ (unsigned)aneUserInitiatedTaskQoS
{
  return 25;
}

+ (unsigned)aneDefaultTaskQoS
{
  return 21;
}

+ (unsigned)aneUtilityTaskQoS
{
  return 17;
}

+ (unsigned)aneBackgroundTaskQoS
{
  return 9;
}

+ (unint64_t)realTimeQueueIndex
{
  return 2;
}

+ (unsigned)qosForProgramPriority:(int)a3
{
  int v3 = a3 - 4;
  if (a3 < 4) {
    return 33;
  }
  if (v3 > 2) {
    return 21;
  }
  return dword_1DB8E714C[v3];
}

+ (id)dispatchQueueArrayByMappingPrioritiesWithTag:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E0193890]();
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (uint64_t i = 0; i != 8; ++i)
  {
    unint64_t v7 = objc_msgSend(v3, "stringByAppendingFormat:", @".p%d", i);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, (dispatch_qos_class_t)+[_ANEQoSMapper qosForProgramPriority:i], 0);

    id v10 = v7;
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], v9);
    [v5 setObject:v11 atIndexedSubscript:i];
  }
  __int16 v12 = (void *)[v5 copy];

  return v12;
}

@end