NSURL *sub_100003E84()
{
  NSArray *v0;
  NSURL *v1;
  uint64_t vars8;

  self;
  self;
  v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if ([(NSArray *)v0 count]) {
    v1 = +[NSURL fileURLWithPath:[(NSArray *)v0 firstObject] isDirectory:1];
  }
  else {
    v1 = 0;
  }

  return +[NSURL fileURLWithPath:@"com.apple.SensorKitDataExport" isDirectory:1 relativeToURL:v1];
}

void sub_10000407C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000458C(uint64_t a1)
{
  v2 = qword_100016B90;
  if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Client connection requesting export has invalidated. Cancelling Export", v4, 2u);
  }
  return [*(id *)(a1 + 32) cancelWithReply:&stru_100010320];
}

SRSensorReader *__cdecl sub_1000048D0(id a1, NSString *a2)
{
  id v3 = objc_alloc((Class)SRSensorReader);

  return (SRSensorReader *)[v3 initWithSensor:a2];
}

void sub_100005130(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id sub_100005154(uint64_t a1, void *a2, uint64_t a3)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  v7 = Weak;
  if (a3)
  {
    return [Weak replyWithError:a3];
  }
  else
  {
    objc_msgSend(Weak, "setDevices:", objc_msgSend(a2, "mutableCopy"));
    [v7 setFirstSample:1];
    v7[24] = 1;
    v9 = (SRDevice *)objc_msgSend(objc_msgSend(v7, "devices"), "lastObject");
    if (!v9) {
      v9 = +[SRDevice currentDevice];
    }
    [*(id *)(*(void *)(a1 + 32) + 48) setDevice:v9];
    id v10 = [v7 currentReader];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 48);
    return [v10 fetch:v11];
  }
}

void sub_100005320(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000054CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000056A0(_Unwind_Exception *exception_object)
{
}

void sub_100005B68(_Unwind_Exception *a1)
{
}

uint64_t sub_100005E64()
{
  if (!qword_100016B88) {
    qword_100016B88 = _sl_dlopen();
  }
  return qword_100016B88;
}

uint64_t sub_100005F34()
{
  uint64_t result = _sl_dlopen();
  qword_100016B88 = result;
  return result;
}

void sub_100005FA8(uint64_t a1, uint64_t a2)
{
}

void sub_100005FB8(uint64_t a1)
{
}

Class sub_100005FC4(uint64_t a1)
{
  if (sub_100005E64())
  {
    Class result = objc_getClass("SRStreamBlockSample");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      qword_100016B98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      return result;
    }
    Class result = (Class)[+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"Class getSRStreamBlockSampleClass(void)_block_invoke"], @"SRDataExportService.m", 35, @"Unable to find class %s", "SRStreamBlockSample" file lineNumber description];
  }
  else
  {
    Class result = (Class)[+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void *SensorKitSupportLibrary(void)"], @"SRDataExportService.m", 34, @"%s", 0 file lineNumber description];
  }
  __break(1u);
  return result;
}

void *sub_100007328(void *a1, uint64_t a2, int a3)
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)SRCompressedOutputStream;
  v5 = objc_msgSendSuper2(&v13, "init");
  v6 = v5;
  if (v5)
  {
    *((_DWORD *)v5 + 2) = a3;
    v5[7] = 0;
    size_t v7 = compression_encode_scratch_buffer_size((compression_algorithm)*((_DWORD *)v5 + 2));
    v6[8] = NSRoundUpToMultipleOfPageSize(10 * v7);
    [+[NSData data] writeToURL:a2 atomically:1];
    uint64_t v12 = 0;
    v8 = +[NSFileHandle fileHandleForWritingToURL:a2 error:&v12];
    objc_setProperty_nonatomic(v6, v9, v8, 72);
    if (!v6[9])
    {
      id v10 = qword_100016BA0;
      if (os_log_type_enabled((os_log_t)qword_100016BA0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = a2;
        __int16 v16 = 2114;
        uint64_t v17 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error creating writing file handle at %{public}@ because %{public}@", buf, 0x16u);
      }

      return 0;
    }
  }
  return v6;
}

void *sub_100007510(void *result)
{
  if (result)
  {
    v1 = result;
    Class result = (void *)result[10];
    if (!result)
    {
      Class result = [objc_alloc((Class)NSMutableData) initWithCapacity:v1[8]];
      v1[10] = result;
    }
  }
  return result;
}

BOOL sub_1000077B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1;
  if (a1)
  {
    uint64_t v6 = 0;
    objc_msgSend(*(id *)(a1 + 72), "writeData:error:", +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(sub_100007510((void *)a1), "bytes"), a2, 0), &v6);
    uint64_t v3 = v6;
    BOOL v2 = v6 == 0;
    if (v6)
    {
      v4 = qword_100016BA0;
      if (os_log_type_enabled((os_log_t)qword_100016BA0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v8 = v3;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error writing to output file. %{public}@", buf, 0xCu);
      }
    }
  }
  return v2;
}

id sub_1000086B4(void *a1)
{
  id v2 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(a1);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) doubleValue];
        double v8 = v7;
        SEL v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        if (fabs(v8) == INFINITY) {
          CFStringRef v10 = @"inf";
        }
        else {
          CFStringRef v10 = (const __CFString *)v9;
        }
        [v2 addObject:v10];
      }
      id v4 = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  return v2;
}

void sub_100009B68(id a1)
{
  qword_100016DB8 = (uint64_t)os_log_create("com.apple.SensorKit", "SRPhotoplethysmogramExport");
}

void start()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  [[[SRDataExportService alloc] initWithQueue:dispatch_queue_create("com.apple.SensorKitDataExport.main", v0)] resume];
  dispatch_main();
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return _CMTimeRangeCopyDescription(allocator, range);
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return _NSRoundUpToMultipleOfPageSize(bytes);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return _compression_encode_scratch_buffer_size(algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void free(void *a1)
{
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

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

int snprintf_l(char *a1, size_t a2, locale_t a3, const char *a4, ...)
{
  return _snprintf_l(a1, a2, a3, a4);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_acceleration(void *a1, const char *a2, ...)
{
  return [a1 acceleration];
}

id objc_msgSend_accelerometerSamples(void *a1, const char *a2, ...)
{
  return [a1 accelerometerSamples];
}

id objc_msgSend_acousticFeatureValuePerFrame(void *a1, const char *a2, ...)
{
  return [a1 acousticFeatureValuePerFrame];
}

id objc_msgSend_activation(void *a1, const char *a2, ...)
{
  return [a1 activation];
}

id objc_msgSend_activePhotodiodeIndexes(void *a1, const char *a2, ...)
{
  return [a1 activePhotodiodeIndexes];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_arousal(void *a1, const char *a2, ...)
{
  return [a1 arousal];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_audioLevel(void *a1, const char *a2, ...)
{
  return [a1 audioLevel];
}

id objc_msgSend_averageActivePace(void *a1, const char *a2, ...)
{
  return [a1 averageActivePace];
}

id objc_msgSend_averagePauseDuration(void *a1, const char *a2, ...)
{
  return [a1 averagePauseDuration];
}

id objc_msgSend_averageSpeed(void *a1, const char *a2, ...)
{
  return [a1 averageSpeed];
}

id objc_msgSend_backgroundNoise(void *a1, const char *a2, ...)
{
  return [a1 backgroundNoise];
}

id objc_msgSend_backgroundNoiseOffset(void *a1, const char *a2, ...)
{
  return [a1 backgroundNoiseOffset];
}

id objc_msgSend_bestTranscription(void *a1, const char *a2, ...)
{
  return [a1 bestTranscription];
}

id objc_msgSend_blendShapes(void *a1, const char *a2, ...)
{
  return [a1 blendShapes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_classifications(void *a1, const char *a2, ...)
{
  return [a1 classifications];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_conditions(void *a1, const char *a2, ...)
{
  return [a1 conditions];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCadence(void *a1, const char *a2, ...)
{
  return [a1 currentCadence];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentPace(void *a1, const char *a2, ...)
{
  return [a1 currentPace];
}

id objc_msgSend_currentReader(void *a1, const char *a2, ...)
{
  return [a1 currentReader];
}

id objc_msgSend_currentSpeed(void *a1, const char *a2, ...)
{
  return [a1 currentSpeed];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deltaAltitude(void *a1, const char *a2, ...)
{
  return [a1 deltaAltitude];
}

id objc_msgSend_deltaDistance(void *a1, const char *a2, ...)
{
  return [a1 deltaDistance];
}

id objc_msgSend_deltaDistanceAccuracy(void *a1, const char *a2, ...)
{
  return [a1 deltaDistanceAccuracy];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detected(void *a1, const char *a2, ...)
{
  return [a1 detected];
}

id objc_msgSend_detectorIdentifier(void *a1, const char *a2, ...)
{
  return [a1 detectorIdentifier];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return [a1 distance];
}

id objc_msgSend_dominance(void *a1, const char *a2, ...)
{
  return [a1 dominance];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_effectiveWavelength(void *a1, const char *a2, ...)
{
  return [a1 effectiveWavelength];
}

id objc_msgSend_elevationAscended(void *a1, const char *a2, ...)
{
  return [a1 elevationAscended];
}

id objc_msgSend_elevationDescended(void *a1, const char *a2, ...)
{
  return [a1 elevationDescended];
}

id objc_msgSend_emitter(void *a1, const char *a2, ...)
{
  return [a1 emitter];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endJSON(void *a1, const char *a2, ...)
{
  return [a1 endJSON];
}

id objc_msgSend_endSensorJSON(void *a1, const char *a2, ...)
{
  return [a1 endSensorJSON];
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return [a1 endTime];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_exportData(void *a1, const char *a2, ...)
{
  return [a1 exportData];
}

id objc_msgSend_exportingSampleClass(void *a1, const char *a2, ...)
{
  return [a1 exportingSampleClass];
}

id objc_msgSend_faceAnchor(void *a1, const char *a2, ...)
{
  return [a1 faceAnchor];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_floorsAscended(void *a1, const char *a2, ...)
{
  return [a1 floorsAscended];
}

id objc_msgSend_floorsDescended(void *a1, const char *a2, ...)
{
  return [a1 floorsDescended];
}

id objc_msgSend_frameDuration(void *a1, const char *a2, ...)
{
  return [a1 frameDuration];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_geometry(void *a1, const char *a2, ...)
{
  return [a1 geometry];
}

id objc_msgSend_gpsAltitude(void *a1, const char *a2, ...)
{
  return [a1 gpsAltitude];
}

id objc_msgSend_gpsCourseAccuracy(void *a1, const char *a2, ...)
{
  return [a1 gpsCourseAccuracy];
}

id objc_msgSend_gpsCourseRadians(void *a1, const char *a2, ...)
{
  return [a1 gpsCourseRadians];
}

id objc_msgSend_gpsDate(void *a1, const char *a2, ...)
{
  return [a1 gpsDate];
}

id objc_msgSend_gpsSource(void *a1, const char *a2, ...)
{
  return [a1 gpsSource];
}

id objc_msgSend_groundAltitude(void *a1, const char *a2, ...)
{
  return [a1 groundAltitude];
}

id objc_msgSend_groundAltitudeUncertainty(void *a1, const char *a2, ...)
{
  return [a1 groundAltitudeUncertainty];
}

id objc_msgSend_heartRate(void *a1, const char *a2, ...)
{
  return [a1 heartRate];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidEntitlementError(void *a1, const char *a2, ...)
{
  return [a1 invalidEntitlementError];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFinal(void *a1, const char *a2, ...)
{
  return [a1 isFinal];
}

id objc_msgSend_jitter(void *a1, const char *a2, ...)
{
  return [a1 jitter];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lead(void *a1, const char *a2, ...)
{
  return [a1 lead];
}

id objc_msgSend_leftEyeTransform(void *a1, const char *a2, ...)
{
  return [a1 leftEyeTransform];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_localizedAdditionalSampleDataNote(void *a1, const char *a2, ...)
{
  return [a1 localizedAdditionalSampleDataNote];
}

id objc_msgSend_lookAtPoint(void *a1, const char *a2, ...)
{
  return [a1 lookAtPoint];
}

id objc_msgSend_loudness(void *a1, const char *a2, ...)
{
  return [a1 loudness];
}

id objc_msgSend_maxAbsSlope(void *a1, const char *a2, ...)
{
  return [a1 maxAbsSlope];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_mood(void *a1, const char *a2, ...)
{
  return [a1 mood];
}

id objc_msgSend_multiSampleExporter(void *a1, const char *a2, ...)
{
  return [a1 multiSampleExporter];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nanosecondsSinceStart(void *a1, const char *a2, ...)
{
  return [a1 nanosecondsSinceStart];
}

id objc_msgSend_nominalWavelength(void *a1, const char *a2, ...)
{
  return [a1 nominalWavelength];
}

id objc_msgSend_normalizedReflectance(void *a1, const char *a2, ...)
{
  return [a1 normalizedReflectance];
}

id objc_msgSend_numberOfSteps(void *a1, const char *a2, ...)
{
  return [a1 numberOfSteps];
}

id objc_msgSend_odometer(void *a1, const char *a2, ...)
{
  return [a1 odometer];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_opticalSamples(void *a1, const char *a2, ...)
{
  return [a1 opticalSamples];
}

id objc_msgSend_originDevice(void *a1, const char *a2, ...)
{
  return [a1 originDevice];
}

id objc_msgSend_outputStream(void *a1, const char *a2, ...)
{
  return [a1 outputStream];
}

id objc_msgSend_outputURL(void *a1, const char *a2, ...)
{
  return [a1 outputURL];
}

id objc_msgSend_partialFaceExpressions(void *a1, const char *a2, ...)
{
  return [a1 partialFaceExpressions];
}

id objc_msgSend_percentGrade(void *a1, const char *a2, ...)
{
  return [a1 percentGrade];
}

id objc_msgSend_pinkNoise(void *a1, const char *a2, ...)
{
  return [a1 pinkNoise];
}

id objc_msgSend_pitch(void *a1, const char *a2, ...)
{
  return [a1 pitch];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rightEyeTransform(void *a1, const char *a2, ...)
{
  return [a1 rightEyeTransform];
}

id objc_msgSend_rotationRate(void *a1, const char *a2, ...)
{
  return [a1 rotationRate];
}

id objc_msgSend_sample(void *a1, const char *a2, ...)
{
  return [a1 sample];
}

id objc_msgSend_samplingFrequency(void *a1, const char *a2, ...)
{
  return [a1 samplingFrequency];
}

id objc_msgSend_segments(void *a1, const char *a2, ...)
{
  return [a1 segments];
}

id objc_msgSend_sensor(void *a1, const char *a2, ...)
{
  return [a1 sensor];
}

id objc_msgSend_sensors(void *a1, const char *a2, ...)
{
  return [a1 sensors];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sessionFlags(void *a1, const char *a2, ...)
{
  return [a1 sessionFlags];
}

id objc_msgSend_sessionGuidance(void *a1, const char *a2, ...)
{
  return [a1 sessionGuidance];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sessionIdentifier];
}

id objc_msgSend_shimmer(void *a1, const char *a2, ...)
{
  return [a1 shimmer];
}

id objc_msgSend_signalIdentifier(void *a1, const char *a2, ...)
{
  return [a1 signalIdentifier];
}

id objc_msgSend_slope(void *a1, const char *a2, ...)
{
  return [a1 slope];
}

id objc_msgSend_smoothedGPSAltitude(void *a1, const char *a2, ...)
{
  return [a1 smoothedGPSAltitude];
}

id objc_msgSend_smoothedGPSAltitudeUncertainty(void *a1, const char *a2, ...)
{
  return [a1 smoothedGPSAltitudeUncertainty];
}

id objc_msgSend_soundClassification(void *a1, const char *a2, ...)
{
  return [a1 soundClassification];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceId(void *a1, const char *a2, ...)
{
  return [a1 sourceId];
}

id objc_msgSend_speakingRate(void *a1, const char *a2, ...)
{
  return [a1 speakingRate];
}

id objc_msgSend_speechDuration(void *a1, const char *a2, ...)
{
  return [a1 speechDuration];
}

id objc_msgSend_speechExpression(void *a1, const char *a2, ...)
{
  return [a1 speechExpression];
}

id objc_msgSend_speechRecognition(void *a1, const char *a2, ...)
{
  return [a1 speechRecognition];
}

id objc_msgSend_speechRecognitionMetadata(void *a1, const char *a2, ...)
{
  return [a1 speechRecognitionMetadata];
}

id objc_msgSend_speechStartTimestamp(void *a1, const char *a2, ...)
{
  return [a1 speechStartTimestamp];
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return [a1 speed];
}

id objc_msgSend_speedAccuracy(void *a1, const char *a2, ...)
{
  return [a1 speedAccuracy];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startJSON(void *a1, const char *a2, ...)
{
  return [a1 startJSON];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_steps(void *a1, const char *a2, ...)
{
  return [a1 steps];
}

id objc_msgSend_suitableForRunning(void *a1, const char *a2, ...)
{
  return [a1 suitableForRunning];
}

id objc_msgSend_suitableForWalking(void *a1, const char *a2, ...)
{
  return [a1 suitableForWalking];
}

id objc_msgSend_temperature(void *a1, const char *a2, ...)
{
  return [a1 temperature];
}

id objc_msgSend_textureCoordinateCount(void *a1, const char *a2, ...)
{
  return [a1 textureCoordinateCount];
}

id objc_msgSend_textureCoordinates(void *a1, const char *a2, ...)
{
  return [a1 textureCoordinates];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRange(void *a1, const char *a2, ...)
{
  return [a1 timeRange];
}

id objc_msgSend_timeSinceAudioStart(void *a1, const char *a2, ...)
{
  return [a1 timeSinceAudioStart];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_transcriptions(void *a1, const char *a2, ...)
{
  return [a1 transcriptions];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_triangleCount(void *a1, const char *a2, ...)
{
  return [a1 triangleCount];
}

id objc_msgSend_triangleIndices(void *a1, const char *a2, ...)
{
  return [a1 triangleIndices];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_valence(void *a1, const char *a2, ...)
{
  return [a1 valence];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_vertexCount(void *a1, const char *a2, ...)
{
  return [a1 vertexCount];
}

id objc_msgSend_vertices(void *a1, const char *a2, ...)
{
  return [a1 vertices];
}

id objc_msgSend_voiceAnalytics(void *a1, const char *a2, ...)
{
  return [a1 voiceAnalytics];
}

id objc_msgSend_voicing(void *a1, const char *a2, ...)
{
  return [a1 voicing];
}

id objc_msgSend_whiteNoise(void *a1, const char *a2, ...)
{
  return [a1 whiteNoise];
}

id objc_msgSend_wholeFaceExpressions(void *a1, const char *a2, ...)
{
  return [a1 wholeFaceExpressions];
}

id objc_msgSend_x(void *a1, const char *a2, ...)
{
  return [a1 x];
}

id objc_msgSend_y(void *a1, const char *a2, ...)
{
  return [a1 y];
}

id objc_msgSend_z(void *a1, const char *a2, ...)
{
  return [a1 z];
}