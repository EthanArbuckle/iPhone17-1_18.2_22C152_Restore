@interface CoreGnssEmergencyManager
- (id)initForComm:(id)a3 sendIndicationToRemoteCallback:(id)a4 dispatch_queue_t:(id)a5 GemDeviceType:(int)a6;
- (void)dealloc;
- (void)handleDeviceIndication:(id)a3;
- (void)handleRemoteRequest:(id)a3 machconttimens:(unint64_t)a4;
@end

@implementation CoreGnssEmergencyManager

- (id)initForComm:(id)a3 sendIndicationToRemoteCallback:(id)a4 dispatch_queue_t:(id)a5 GemDeviceType:(int)a6
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)CoreGnssEmergencyManager;
  id v10 = a5;
  [(CoreGnssEmergencyManager *)&v9 init];
  if (!qword_26B17C488) {
    qword_26B17C488 = (uint64_t)os_log_create("com.apple.gpsd", "general");
  }
  if (!qword_26B17C498) {
    qword_26B17C498 = (uint64_t)os_log_create("com.apple.gpsd", "Warning");
  }
  if (!qword_26B17C478) {
    qword_26B17C478 = (uint64_t)os_log_create("com.apple.gpsd", "device");
  }
  if (!qword_26B17C490) {
    qword_26B17C490 = (uint64_t)os_log_create("com.apple.gpsd", "NMEA");
  }
  if (!qword_26B17C480) {
    qword_26B17C480 = (uint64_t)os_log_create("com.apple.gpsd", "gem");
  }
  v6 = qword_26B17C488;
  if (os_log_type_enabled((os_log_t)qword_26B17C488, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_24B3DE000, v6, OS_LOG_TYPE_DEBUG, "Logging init, check if the level is enabled", buf, 2u);
    v6 = qword_26B17C488;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B3DE000, v6, OS_LOG_TYPE_INFO, "Logging init, check if the level is enabled", buf, 2u);
    v6 = qword_26B17C488;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B3DE000, v6, OS_LOG_TYPE_DEFAULT, "Logging init, check if the level is enabled", buf, 2u);
    v6 = qword_26B17C488;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = sub_24B4766A4();
    *(_DWORD *)buf = 134217984;
    double v12 = v7;
    _os_log_impl(&dword_24B3DE000, v6, OS_LOG_TYPE_DEFAULT, "Record process start time, %.1f", buf, 0xCu);
  }
  operator new();
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CoreGnssEmergencyManager;
  [(CoreGnssEmergencyManager *)&v2 dealloc];
}

- (void)handleDeviceIndication:(id)a3
{
  v3 = qword_26B17C488;
  if (os_log_type_enabled((os_log_t)qword_26B17C488, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_24B3DE000, v3, OS_LOG_TYPE_DEBUG, "#gem,#interface,handleDeviceIndication", v4, 2u);
  }
  sub_24B3E4488();
}

- (void)handleRemoteRequest:(id)a3 machconttimens:(unint64_t)a4
{
  v4 = qword_26B17C488;
  if (os_log_type_enabled((os_log_t)qword_26B17C488, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_24B3DE000, v4, OS_LOG_TYPE_DEBUG, "#gem,#interface,handleRemoteRequest, calling GEM handleRemoteDataRequest", v5, 2u);
  }
  sub_24B3E50D4();
}

@end