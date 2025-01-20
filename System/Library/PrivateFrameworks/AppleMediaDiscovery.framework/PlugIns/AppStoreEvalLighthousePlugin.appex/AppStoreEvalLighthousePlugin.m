uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

unsigned char *__os_log_helper_16_0_0(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t espresso_context_destroy()
{
  return _espresso_context_destroy();
}

uint64_t espresso_create_context()
{
  return _espresso_create_context();
}

uint64_t espresso_create_plan()
{
  return _espresso_create_plan();
}

uint64_t espresso_network_bind_buffer()
{
  return _espresso_network_bind_buffer();
}

uint64_t espresso_network_bind_buffer_to_global()
{
  return _espresso_network_bind_buffer_to_global();
}

uint64_t espresso_network_declare_output()
{
  return _espresso_network_declare_output();
}

uint64_t espresso_network_set_function_name()
{
  return _espresso_network_set_function_name();
}

uint64_t espresso_network_unbind_buffer_to_global()
{
  return _espresso_network_unbind_buffer_to_global();
}

uint64_t espresso_plan_add_network()
{
  return _espresso_plan_add_network();
}

uint64_t espresso_plan_build()
{
  return _espresso_plan_build();
}

uint64_t espresso_plan_destroy()
{
  return _espresso_plan_destroy();
}

uint64_t espresso_plan_execute_sync()
{
  return _espresso_plan_execute_sync();
}

uint64_t get_main_function_name()
{
  return _get_main_function_name();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_JSONResult(void *a1, const char *a2, ...)
{
  return [a1 JSONResult];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__flattenedWeightsBeforeTraining(void *a1, const char *a2, ...)
{
  return [a1 _flattenedWeightsBeforeTraining];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_batchSize(void *a1, const char *a2, ...)
{
  return [a1 batchSize];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return [a1 callStackReturnAddresses];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyCurrentTrainingDelta(void *a1, const char *a2, ...)
{
  return [a1 copyCurrentTrainingDelta];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_directoryValue(void *a1, const char *a2, ...)
{
  return [a1 directoryValue];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return [a1 errorDomain];
}

id objc_msgSend_evaluationMetrics(void *a1, const char *a2, ...)
{
  return [a1 evaluationMetrics];
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return [a1 fileValue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flattenedModelUpdate(void *a1, const char *a2, ...)
{
  return [a1 flattenedModelUpdate];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getCoreDictionary(void *a1, const char *a2, ...)
{
  return [a1 getCoreDictionary];
}

id objc_msgSend_getElementsInSampleDictionary(void *a1, const char *a2, ...)
{
  return [a1 getElementsInSampleDictionary];
}

id objc_msgSend_getInputDictionary(void *a1, const char *a2, ...)
{
  return [a1 getInputDictionary];
}

id objc_msgSend_getInputSize(void *a1, const char *a2, ...)
{
  return [a1 getInputSize];
}

id objc_msgSend_getOperationsArray(void *a1, const char *a2, ...)
{
  return [a1 getOperationsArray];
}

id objc_msgSend_initializationFunctionName(void *a1, const char *a2, ...)
{
  return [a1 initializationFunctionName];
}

id objc_msgSend_initializeManually(void *a1, const char *a2, ...)
{
  return [a1 initializeManually];
}

id objc_msgSend_inputNames(void *a1, const char *a2, ...)
{
  return [a1 inputNames];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_learningRate(void *a1, const char *a2, ...)
{
  return [a1 learningRate];
}

id objc_msgSend_learningRateBufferName(void *a1, const char *a2, ...)
{
  return [a1 learningRateBufferName];
}

id objc_msgSend_learningRateSchedule(void *a1, const char *a2, ...)
{
  return [a1 learningRateSchedule];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_loss(void *a1, const char *a2, ...)
{
  return [a1 loss];
}

id objc_msgSend_lossName(void *a1, const char *a2, ...)
{
  return [a1 lossName];
}

id objc_msgSend_metricsNames(void *a1, const char *a2, ...)
{
  return [a1 metricsNames];
}

id objc_msgSend_modelPath(void *a1, const char *a2, ...)
{
  return [a1 modelPath];
}

id objc_msgSend_multiArrayValue(void *a1, const char *a2, ...)
{
  return [a1 multiArrayValue];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_numEpochs(void *a1, const char *a2, ...)
{
  return [a1 numEpochs];
}

id objc_msgSend_numLocalIterations(void *a1, const char *a2, ...)
{
  return [a1 numLocalIterations];
}

id objc_msgSend_outputNames(void *a1, const char *a2, ...)
{
  return [a1 outputNames];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_program(void *a1, const char *a2, ...)
{
  return [a1 program];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_recipe(void *a1, const char *a2, ...)
{
  return [a1 recipe];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_shortenedEmbeddingMappingKeys(void *a1, const char *a2, ...)
{
  return [a1 shortenedEmbeddingMappingKeys];
}

id objc_msgSend_shortenedEmbeddingNames(void *a1, const char *a2, ...)
{
  return [a1 shortenedEmbeddingNames];
}

id objc_msgSend_shortenedEmbeddingNumberVectorsAfter(void *a1, const char *a2, ...)
{
  return [a1 shortenedEmbeddingNumberVectorsAfter];
}

id objc_msgSend_shortenedEmbeddingNumberVectorsBefore(void *a1, const char *a2, ...)
{
  return [a1 shortenedEmbeddingNumberVectorsBefore];
}

id objc_msgSend_shortenedEmbeddingSize(void *a1, const char *a2, ...)
{
  return [a1 shortenedEmbeddingSize];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_trainingModeBufferName(void *a1, const char *a2, ...)
{
  return [a1 trainingModeBufferName];
}

id objc_msgSend_triClient(void *a1, const char *a2, ...)
{
  return [a1 triClient];
}

id objc_msgSend_useCoreMLTrainer(void *a1, const char *a2, ...)
{
  return [a1 useCoreMLTrainer];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_weightNames(void *a1, const char *a2, ...)
{
  return [a1 weightNames];
}

id objc_msgSend_weightsArray(void *a1, const char *a2, ...)
{
  return [a1 weightsArray];
}

id objc_msgSend_worker(void *a1, const char *a2, ...)
{
  return [a1 worker];
}