@interface CLSimulationManager
- (CLSimulationManager)init;
- (CLSimulationXPCServerInterface)daemonProxy;
- (NSXPCConnection)connection;
- (double)locationDistance;
- (double)locationInterval;
- (double)locationSpeed;
- (id)availableScenarios;
- (id)localizedNameForScenario:(id)a3;
- (id)scenariosPath;
- (unsigned)locationDeliveryBehavior;
- (unsigned)locationRepeatBehavior;
- (void)appendSimulatedLocation:(id)a3;
- (void)clearSimulatedCells;
- (void)clearSimulatedLocations;
- (void)flush;
- (void)getFencesForBundleID:(id)a3 withHandler:(id)a4;
- (void)loadScenarioFromURL:(id)a3;
- (void)selectScenario:(id)a3;
- (void)setConnection:(id)a3;
- (void)setLocationDeliveryBehavior:(unsigned __int8)a3;
- (void)setLocationDistance:(double)a3;
- (void)setLocationInterval:(double)a3;
- (void)setLocationRepeatBehavior:(unsigned __int8)a3;
- (void)setLocationSpeed:(double)a3;
- (void)setSimulatedCell:(id)a3;
- (void)setSimulatedCellRegistrationStatus:(BOOL)a3;
- (void)setSimulatedWifiPower:(BOOL)a3;
- (void)setWifiScanResults:(id)a3;
- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6;
- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6;
- (void)simulateSignificantLocationChange:(id)a3;
- (void)simulateVisit:(id)a3;
- (void)startCellSimulation;
- (void)startLocationSimulation;
- (void)startWifiSimulation;
- (void)stopCellSimulation;
- (void)stopLocationSimulation;
- (void)stopWifiSimulation;
@end

@implementation CLSimulationManager

- (CLSimulationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CLSimulationManager;
  result = [(CLSimulationManager *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_locationDistance = _Q0;
    result->_locationSpeed = -1.0;
    *(_WORD *)&result->_locationRepeatBehavior = 0;
  }
  return result;
}

- (id)scenariosPath
{
  v2 = NSString;
  sub_1907AADC4(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v4 = objc_msgSend((id)objc_msgSend(v2, "stringWithUTF8String:", p_p), "stringByAppendingPathComponent:", @"SimulationScenarios");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v4;
}

- (id)availableScenarios
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", -[CLSimulationManager scenariosPath](self, "scenariosPath"), 0);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "stringByDeletingPathExtension"));
        }
        uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else
  {
    NSLog(&cfstr_CouldnTGetList.isa);
    return 0;
  }
  return v4;
}

- (id)localizedNameForScenario:(id)a3
{
  return a3;
}

- (void)selectScenario:(id)a3
{
  uint64_t v4 = objc_msgSend(-[CLSimulationManager scenariosPath](self, "scenariosPath"), "stringByAppendingPathComponent:", objc_msgSend(a3, "stringByAppendingPathExtension:", @"plist"));
  [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];

  MEMORY[0x1F4181798](self, sel_loadScenarioFromURL_);
}

- (void)loadScenarioFromURL:(id)a3
{
  if ([a3 isFileURL])
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")))
    {
      if (objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "isEqualToString:", @"plist"))
      {
        uint64_t v5 = [(CLSimulationManager *)self daemonProxy];
        MEMORY[0x1F4181798](v5, sel_setSimulationScenario_);
      }
      else
      {
        NSLog(&cfstr_SelectedLocati_1.isa);
      }
    }
    else
    {
      NSLog(&cfstr_SelectedLocati_0.isa);
    }
  }
  else
  {
    NSLog(&cfstr_SelectedLocati.isa);
  }
}

- (void)setLocationDeliveryBehavior:(unsigned __int8)a3
{
  self->_locationDeliveryBehavior = a3;
  v3 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v3, sel_setLocationDeliveryBehavior_);
}

- (void)setLocationDistance:(double)a3
{
  self->_locationDistance = a3;
  v3 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v3, sel_setIntermediateLocationDistance_);
}

- (void)setLocationInterval:(double)a3
{
  self->_locationInterval = a3;
  v3 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v3, sel_setLocationInterval_);
}

- (void)setLocationSpeed:(double)a3
{
  self->_locationSpeed = a3;
  v3 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v3, sel_setLocationTravellingSpeed_);
}

- (void)setLocationRepeatBehavior:(unsigned __int8)a3
{
  self->_locationRepeatBehavior = a3;
  v3 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v3, sel_setLocationRepeatBehavior_);
}

- (void)clearSimulatedLocations
{
  uint64_t v2 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v2, sel_clearSimulatedLocations);
}

- (void)appendSimulatedLocation:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = 0u;
      memset(v17, 0, 28);
      long long v15 = 0u;
      long long v13 = 0u;
      memset(v14, 0, sizeof(v14));
      long long v11 = 0u;
      long long v12 = 0u;
      long long v10 = 0u;
      [a3 clientLocation];
      LODWORD(v15) = 1;
      if (*(double *)((char *)v14 + 12) <= 0.0) {
        *(void *)((char *)v14 + 12) = CFAbsoluteTimeGetCurrent();
      }
      if (*((double *)&v14[1] + 1) == 0.0) {
        *((void *)&v14[1] + 1) = 0xBFF0000000000000;
      }
      if (*(double *)((char *)&v11 + 4) == 0.0) {
        *(void *)((char *)&v11 + 4) = 0x4014000000000000;
      }
      uint64_t v5 = [CLLocation alloc];
      v8[6] = v15;
      v8[7] = v16;
      v9[0] = v17[0];
      *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)((char *)v17 + 12);
      v8[2] = v12;
      v8[3] = v13;
      v8[4] = v14[0];
      v8[5] = v14[1];
      v8[0] = v10;
      v8[1] = v11;
      uint64_t v6 = [(CLLocation *)v5 initWithClientLocation:v8];
      uint64_t v7 = [(CLSimulationManager *)self daemonProxy];
      -[CLSimulationXPCServerInterface appendSimulatedLocations:](v7, "appendSimulatedLocations:", [MEMORY[0x1E4F1C978] arrayWithObject:v6]);
    }
    else
    {
      NSLog(&cfstr_ClsimulationOb.isa);
    }
  }
}

- (void)startLocationSimulation
{
  uint64_t v2 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v2, sel_startLocationSimulation);
}

- (void)stopLocationSimulation
{
  uint64_t v2 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v2, sel_stopLocationSimulation);
}

- (void)simulateVisit:(id)a3
{
  v3 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v3, sel_simulateVisit_);
}

- (void)simulateSignificantLocationChange:(id)a3
{
  v3 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v3, sel_simulateSignificantLocationChange_);
}

- (void)getFencesForBundleID:(id)a3 withHandler:(id)a4
{
  uint64_t v4 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v4, sel_getFencesForBundleID_withReply_);
}

- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6
{
  uint64_t v6 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v6, sel_simulateFenceWithBundleID_andFenceID_eventType_atLocation_);
}

- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6
{
  uint64_t v6 = [(CLSimulationManager *)self daemonProxy];

  MEMORY[0x1F4181798](v6, sel_simulateBeaconWithProximityUUID_major_minor_eventType_);
}

- (void)clearSimulatedCells
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
  }
  uint64_t v2 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
    }
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLSimulationManager clearSimulatedCells]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (void)setSimulatedCell:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
  }
  v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLSimulationManager setSimulatedCell:]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)startCellSimulation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
  }
  uint64_t v2 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
    }
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLSimulationManager startCellSimulation]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (void)stopCellSimulation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
  }
  uint64_t v2 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
    }
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLSimulationManager stopCellSimulation]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (void)setSimulatedCellRegistrationStatus:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
  }
  v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLSimulationManager setSimulatedCellRegistrationStatus:]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)setWifiScanResults:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
  }
  v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLSimulationManager setWifiScanResults:]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)startWifiSimulation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
  }
  uint64_t v2 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
    }
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLSimulationManager startWifiSimulation]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (void)stopWifiSimulation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
  }
  uint64_t v2 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
    }
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLSimulationManager stopWifiSimulation]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (void)setSimulatedWifiPower:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
  }
  v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLSimulationManager setSimulatedWifiPower:]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)flush
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
  }
  uint64_t v2 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0061E0);
    }
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLSimulationManager flush]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (CLSimulationXPCServerInterface)daemonProxy
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F618 != -1) {
    dispatch_once(&qword_1E929F618, &unk_1EE006220);
  }
  v3 = qword_1E929F5F8;
  if (os_log_type_enabled((os_log_t)qword_1E929F5F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)long long v13 = 2082;
    *(void *)&v13[2] = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"getDaemonProxy called\"}", buf, 0x12u);
  }
  if (![(CLSimulationManager *)self connection])
  {
    if (qword_1E929F618 != -1) {
      dispatch_once(&qword_1E929F618, &unk_1EE006220);
    }
    uint64_t v4 = qword_1E929F5F8;
    if (os_log_type_enabled((os_log_t)qword_1E929F5F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)long long v13 = 2082;
      *(void *)&v13[2] = "";
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"no existing connection, trying to get one\"}", buf, 0x12u);
    }
    -[CLSimulationManager setConnection:](self, "setConnection:", (id)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.locationd.simulation" options:4096]);
    uint64_t v5 = [(CLSimulationManager *)self connection];
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE0411B8]);
    [(NSXPCConnection *)[(CLSimulationManager *)self connection] setInterruptionHandler:&unk_1EE005C20];
    *(void *)buf = 0;
    *(void *)long long v13 = buf;
    *(void *)&v13[8] = 0x3052000000;
    *(void *)&v13[16] = sub_1907D88AC;
    *(void *)&v13[24] = sub_1907D88BC;
    v14 = self;
    uint64_t v6 = [(CLSimulationManager *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1907D88C8;
    v11[3] = &unk_1E5696DA8;
    v11[4] = buf;
    [(NSXPCConnection *)v6 setInvalidationHandler:v11];
    [(NSXPCConnection *)[(CLSimulationManager *)self connection] resume];
    _Block_object_dispose(buf, 8);
  }
  uint64_t v7 = [(NSXPCConnection *)[(CLSimulationManager *)self connection] remoteObjectProxyWithErrorHandler:&unk_1EE0063E0];
  if (qword_1E929F618 != -1) {
    dispatch_once(&qword_1E929F618, &unk_1EE006220);
  }
  objc_super v8 = qword_1E929F5F8;
  if (os_log_type_enabled((os_log_t)qword_1E929F5F8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(CLSimulationManager *)self connection];
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)long long v13 = 2082;
    *(void *)&v13[2] = "";
    *(_WORD *)&v13[10] = 2114;
    *(void *)&v13[12] = v7;
    *(_WORD *)&v13[20] = 2114;
    *(void *)&v13[22] = v9;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Do we have a proxy?\", \"proxy\":%{public, location:escape_only}@, \"connection\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  return v7;
}

- (unsigned)locationDeliveryBehavior
{
  return self->_locationDeliveryBehavior;
}

- (double)locationDistance
{
  return self->_locationDistance;
}

- (double)locationInterval
{
  return self->_locationInterval;
}

- (double)locationSpeed
{
  return self->_locationSpeed;
}

- (unsigned)locationRepeatBehavior
{
  return self->_locationRepeatBehavior;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end