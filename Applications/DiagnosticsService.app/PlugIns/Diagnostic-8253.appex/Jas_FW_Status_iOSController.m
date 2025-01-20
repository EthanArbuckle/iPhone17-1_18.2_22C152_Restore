@interface Jas_FW_Status_iOSController
- (BOOL)checkConnectivity;
- (BOOL)isAllStatusesGood;
- (BOOL)isPortTypeJasperDetected;
- (BOOL)isUnsealedUnitModule;
- (id).cxx_construct;
- (int)ConfigDevice:(JasperConfiguration)a3;
- (int)getConfigurationForCaseMask:(int)a3 returnedConfiguration:(JasperConfiguration *)a4;
- (int)startStreaming;
- (int)stopStreaming;
- (void)cancel;
- (void)finalizingOnError;
- (void)finalizingWithStatusCode:(int)a3 andInfoString:(id)a4;
- (void)performFlow;
- (void)produceStatusForDiagnosticConfigurationDetailsOnFailureOnly:(JasperConfiguration)a3 ValidationStatus:(void *)a4;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)updateStatusDictionary:(id)a3 andValue:(id)a4;
@end

@implementation Jas_FW_Status_iOSController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  v5 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:50];
  m_statusesDict = self->m_statusesDict;
  self->m_statusesDict = v5;

  v26 = (void *)MGCopyAnswer();
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
  v8 = [v7 lastPathComponent];
  v9 = +[NSString stringWithFormat:@"setupWithInputs Jas Diagnostic %@", v26];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 51, v9);

  [(NSMutableDictionary *)self->m_statusesDict setValue:v26 forKey:@"DEVICE_NAME"];
  v10 = self->m_statusesDict;
  v11 = getCurrentVersion();
  [(NSMutableDictionary *)v10 setValue:v11 forKey:@"VERSION"];

  self->m_scenariosNumber = 0;
  self->m_timeForStreamInUSec = 5000000;
  self->m_casesMask = 4;
  v12 = [(Jas_FW_Status_iOSController *)self result];
  [v12 setData:&__NSDictionary0__struct];

  self->m_isAllPass = 0;
  self->m_passCount = 0;
  self->m_isJasperEnable = 1;
  self->m_isSuperWideEnable = 0;
  self->m_isCurrentStatusOK = 1;
  if (self->m_casesMask >= 8)
  {
    v13 = +[NSString stringWithFormat:@"Bad Diagnostic bit mask, bit mask 0x%x > 0x%x", self->m_casesMask, 7];
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
    v15 = [v14 lastPathComponent];
    v16 = +[NSString stringWithFormat:@"%@", v13];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 70, v16);

    CFStringRef v30 = @"PRE_CONFIGURATION_KEY";
    v31 = v13;
    v17 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [(Jas_FW_Status_iOSController *)self updateStatusDictionary:@"PRE_CONFIGURATION_KEY" andValue:v17];
  }
  int v18 = 3;
  uint64_t v19 = 1;
  do
  {
    if ((self->m_casesMask & v19) != 0)
    {
      v27.isJasperOn = 1;
      *(_DWORD *)&v27.isSuperWideOn = 0;
      v27.bitMaskID = 0;
      if ([(Jas_FW_Status_iOSController *)self getConfigurationForCaseMask:v19 returnedConfiguration:&v27])
      {
        v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
        v21 = [v20 lastPathComponent];
        v22 = +[NSString stringWithFormat:@"%@", @"Bad Diagnostic bit mask, configuration is not found"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v21, 88, v22);

        CFStringRef v28 = @"PRE_CONFIGURATION_KEY";
        CFStringRef v29 = @"Bad Diagnostic bit mask, configuration is not found";
        v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        [(Jas_FW_Status_iOSController *)self updateStatusDictionary:@"PRE_CONFIGURATION_KEY" andValue:v23];
      }
      else
      {
        end = self->m_configurationsList.__end_;
        if (end >= self->m_configurationsList.__end_cap_.__value_)
        {
          v25 = (JasperConfiguration *)sub_100006128((uint64_t *)&self->m_configurationsList, &v27);
        }
        else
        {
          JasperConfiguration *end = v27;
          v25 = end + 1;
        }
        self->m_configurationsList.__end_ = v25;
      }
    }
    uint64_t v19 = (2 * v19);
    --v18;
  }
  while (v18);
  self->m_scenariosNumber = (unint64_t)((char *)self->m_configurationsList.__end_
                                             - (char *)self->m_configurationsList.__begin_) >> 3;
}

- (int)getConfigurationForCaseMask:(int)a3 returnedConfiguration:(JasperConfiguration *)a4
{
  switch(a3)
  {
    case 1:
      int result = 0;
      JasperConfiguration v5 = (JasperConfiguration)0x100000101;
      goto LABEL_7;
    case 2:
      int result = 0;
      JasperConfiguration v5 = (JasperConfiguration)0x201000101;
      goto LABEL_7;
    case 4:
      int result = 0;
      JasperConfiguration v5 = (JasperConfiguration)0x400000001;
LABEL_7:
      *a4 = v5;
      return result;
  }
  v6 = decToBinStr(a3);
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
  v8 = [v7 lastPathComponent];
  v9 = +[NSString stringWithFormat:@"no available configuration detetcted for this mask bit location %@", v6];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 115, v9);

  return -536870206;
}

- (BOOL)checkConnectivity
{
  DeviceCMInterface::DeviceCMInterface(&v5);
  self = (Jas_FW_Status_iOSController *)((char *)self + 32);
  long long v3 = *(_OWORD *)&v5.m_captureDeviceController;
  *(_OWORD *)self->DKDiagnosticController_opaque = *(_OWORD *)&v5.m_hVersion;
  *(_OWORD *)&self->m_validationStatusesList.__end_ = v3;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_hVersion = *(_OWORD *)&v5.m_streamIdsInfo.rgbPearlStreamId;
  self->m_diagnosticCMInterface.m_captureDeviceController = *(HxISPCaptureDeviceController **)&v5.m_currentPearlConfiguration.isIrOn;
  self->m_diagnosticCMInterface.m_streamIdsInfo.rgbTeleStreamId = v5.m_currentPearlConfiguration.bitMaskID;
  objc_storeStrong((id *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbPearlStreamId, v5.m_currentPearlConfiguration.deviceName);
  *(_OWORD *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbSuperWideStreamId = *(_OWORD *)&v5.m_currentJasperConfiguration.isJasperOn;
  DeviceCMInterface::~DeviceCMInterface(&v5);
  DeviceCMInterface::initAndActivateCaptureDeviceController((DeviceCMInterface *)self);
}

- (BOOL)isPortTypeJasperDetected
{
  DeviceCMInterface::DeviceCMInterface(&v3);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v3);
}

- (BOOL)isUnsealedUnitModule
{
  DeviceCMInterface::DeviceCMInterface(&v3);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v3);
}

- (int)ConfigDevice:(JasperConfiguration)a3
{
  self->m_isJasperEnable = 1;
  self->m_isSuperWideEnable = 0;
  int v5 = DeviceCMInterface::configJasperDevice(&self->m_diagnosticCMInterface, *(const JasperConfiguration **)&a3);
  if (v5)
  {
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
    v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:@"fail to configure device"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 180, v8);
  }
  else
  {
    self->m_isJasperEnable = *(unsigned char *)a3.isJasperOn;
    self->m_isSuperWideEnable = *(unsigned char *)(*(void *)&a3 + 1);
  }
  return v5;
}

- (int)startStreaming
{
  if (self->m_isSuperWideEnable)
  {
    int started = DeviceCMInterface::startRgbSuperWideRgbStream(&self->m_diagnosticCMInterface);
    if (started)
    {
      int v4 = started;
      int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
      v6 = [v5 lastPathComponent];
      v7 = +[NSString stringWithFormat:@"start RGB SW stream failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 200, v7);
LABEL_7:

      return v4;
    }
  }
  if (!self->m_isJasperEnable) {
    return 0;
  }
  int v4 = DeviceCMInterface::startJasperStream(&self->m_diagnosticCMInterface);
  if (v4)
  {
    int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
    v6 = [v5 lastPathComponent];
    v7 = +[NSString stringWithFormat:@"start jasper stream failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 210, v7);
    goto LABEL_7;
  }
  return v4;
}

- (int)stopStreaming
{
  if (self->m_isJasperEnable)
  {
    int v3 = DeviceCMInterface::stopJasperStream(&self->m_diagnosticCMInterface);
    if (v3)
    {
      int v4 = v3;
      int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
      v6 = [v5 lastPathComponent];
      v7 = +[NSString stringWithFormat:@"stop Jasper stream failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 228, v7);
LABEL_7:

      return v4;
    }
  }
  if (!self->m_isSuperWideEnable) {
    return 0;
  }
  int v4 = DeviceCMInterface::stopRgbSuperWideStream(&self->m_diagnosticCMInterface);
  if (v4)
  {
    int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
    v6 = [v5 lastPathComponent];
    v7 = +[NSString stringWithFormat:@"stop Jasper stream failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 238, v7);
    goto LABEL_7;
  }
  return v4;
}

- (void)produceStatusForDiagnosticConfigurationDetailsOnFailureOnly:(JasperConfiguration)a3 ValidationStatus:(void *)a4
{
  self->m_isCurrentStatusOK = 1;
  p_m_diagnosticCMInterface = &self->m_diagnosticCMInterface;
  if (self->m_diagnosticCMInterface.m_hVersion == 16) {
    double v7 = 62.0;
  }
  else {
    double v7 = 124.0;
  }
  if (self->m_diagnosticCMInterface.m_hVersion == 16) {
    double v8 = 54.0;
  }
  else {
    double v8 = 108.0;
  }
  double JasperFpsDuringStreaming = JasDiagnosticInteractor::getJasperFpsDuringStreaming(&self->m_diagnosticInteractor);
  double JasperAveragePointsDuringStreaming = JasDiagnosticInteractor::getJasperAveragePointsDuringStreaming(&self->m_diagnosticInteractor);
  BOOL v11 = JasperFpsDuringStreaming > v7 || JasperFpsDuringStreaming < v8;
  double m_minAveragePointsNumberThreshold = self->m_diagnosticInteractor.m_minAveragePointsNumberThreshold;
  BOOL m_isJasperFramesArrived = self->m_diagnosticInteractor.m_isJasperFramesArrived;
  id v14 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:50];
  unsigned int v42 = -1;
  DeviceCMInterface::validateJasperFwStatus(p_m_diagnosticCMInterface, &v42);
  char v15 = 0;
  char v18 = !self->m_isCurrentStatusOK || v42 != 0 || !m_isJasperFramesArrived || v11;
  if ((v18 & 1) == 0 && JasperAveragePointsDuringStreaming > m_minAveragePointsNumberThreshold) {
    char v15 = sub_100003668((uint64_t)a4);
  }
  self->m_isCurrentStatusOK = v15;
  if (self->m_isAllPass) {
    BOOL v19 = v15;
  }
  else {
    BOOL v19 = 0;
  }
  self->m_isAllPass = v19;
  CFStringRef v20 = @"PASS";
  if (self->m_isCurrentStatusOK)
  {
    v21 = 0;
  }
  else
  {
    if (v11)
    {
      +[NSString stringWithFormat:@"Fps = %f", *(void *)&JasperFpsDuringStreaming];
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v23 = +[NSString stringWithFormat:@"%f", *(void *)&JasperFpsDuringStreaming];
      [v14 setValue:v23 forKey:@"JASPER_FPS"];

      sub_100003704(a4, 30, v22);
    }
    else
    {
      v22 = 0;
    }
    if (JasperAveragePointsDuringStreaming > m_minAveragePointsNumberThreshold)
    {
      v21 = v22;
    }
    else
    {
      +[NSString stringWithFormat:@"PointCount = %f", *(void *)&JasperAveragePointsDuringStreaming];
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v25 = +[NSString stringWithFormat:@"%f", *(void *)&JasperAveragePointsDuringStreaming];
      [v14 setValue:v25 forKey:@"JASPER_POINTS_COUNT_AVERAGE"];

      v21 = v24;
      sub_100003704(a4, 31, v24);
    }
    v26 = +[NSString stringWithFormat:@"%d", self->m_diagnosticInteractor.m_jasperFramesCount];
    [v14 setValue:v26 forKey:@"JASPER_FRAME_COUNT"];

    uint64_t v27 = v42;
    CFStringRef v28 = decToBinStr(v42);
    CFStringRef v29 = +[NSString stringWithFormat:@"(0x%X) %@", v27, v28];
    [v14 setValue:v29 forKey:@"FW_VALIDATION_BITS"];

    id v40 = 0;
    unint64_t v41 = 0;
    LODWORD(v29) = DeviceCMInterface::getJasperProjectorFault((uint64_t)p_m_diagnosticCMInterface, &v41, &v40);
    id v30 = v40;
    v31 = v30;
    if (v29)
    {

      v21 = @"Fail to get information";
      [v14 setValue:@"Fail to get information" forKey:@"PROJECTOR_FAULT"];
      sub_100003704(a4, 11, @"Fail to get information");
    }
    else if (v30)
    {
      [v14 setValue:v30 forKey:@"PROJECTOR_QUARK_FAULT"];
    }
    else
    {
      v32 = +[NSString stringWithFormat:@"0x%X", v41];
      [v14 setValue:v32 forKey:@"PROJECTOR_RIKER_FAULT"];
    }
    unint64_t v41 = 0;
    if (DeviceCMInterface::getJasperProjectorWillFault(p_m_diagnosticCMInterface, &v41))
    {

      v21 = @"Fail to get riker information";
      [v14 setValue:@"Fail to get information" forKey:@"PROJECTOR_WILL_FAULT"];
      sub_100003704(a4, 11, @"Fail to get riker information");
    }
    else
    {
      v33 = +[NSString stringWithFormat:@"0x%X", v41];
      [v14 setValue:v33 forKey:@"PROJECTOR_WILL_FAULT"];
    }
    if (p_m_diagnosticCMInterface->m_hVersion <= 15)
    {
      unint64_t v41 = 0;
      if (DeviceCMInterface::getJasperResistance(p_m_diagnosticCMInterface, &v41))
      {

        v21 = @"Fail to get riker information";
        [v14 setValue:@"Fail to get information" forKey:@"PROJECTOR_RIKER_RESISTANCE"];
        sub_100003704(a4, 11, @"Fail to get riker information");
      }
      else
      {
        v34 = +[NSString stringWithFormat:@"%d", v41];
        [v14 setValue:v34 forKey:@"PROJECTOR_RIKER_RESISTANCE"];
      }
    }

    if (!self->m_isCurrentStatusOK) {
      CFStringRef v20 = @"FAIL";
    }
  }
  [v14 setValue:v20 forKey:@"CONFIGURATION_STATUS"];
  v35 = +[NSNumber numberWithInt:p_m_diagnosticCMInterface->m_hVersion];
  [v14 setValue:v35 forKey:@"H_VER_ID"];

  if (self->m_isCurrentStatusOK)
  {

    v21 = @"Configuration status all pass";
    sub_100003704(a4, 0, @"Configuration status all pass");
  }
  id v39 = v14;
  setTestValidationBit(v42, &v39);
  id v36 = v39;

  updateJasperValidationStatus(v42, (JasperValidationStatus *)a4);
  if (v42 == 525312)
  {

    v21 = @"Real power supply fault detected";
    sub_100003704(a4, 525312, @"Real power supply fault detected");
  }

  v37 = DeviceCMInterface::getJasperConfigurationStringKey(p_m_diagnosticCMInterface, 0);
  if (v36) {
    [(Jas_FW_Status_iOSController *)self updateStatusDictionary:v37 andValue:v36];
  }
}

- (void)updateStatusDictionary:(id)a3 andValue:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  double v7 = [(NSMutableDictionary *)self->m_statusesDict allKeys];
  unsigned int v8 = [v7 containsObject:v12];

  m_statusesDict = self->m_statusesDict;
  if (v8)
  {
    id v10 = [(NSMutableDictionary *)self->m_statusesDict valueForKey:v12];
    id v11 = [v6 mutableCopy];
    [v10 addEntriesFromDictionary:v11];
  }
  else
  {
    id v10 = [v6 mutableCopy];
    [(NSMutableDictionary *)m_statusesDict setValue:v10 forKey:v12];
  }
}

- (void)performFlow
{
  int v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
  int v4 = [v3 lastPathComponent];
  int m_timeForStreamInUSec = self->m_timeForStreamInUSec;
  id v6 = decToBinStr(self->m_casesMask);
  double v7 = +[NSString stringWithFormat:@"Start diagnostic flow stream time: %d[sec] cases mask: %@", (m_timeForStreamInUSec / 1000000), v6];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 413, v7);

  self->m_isAllPass = 1;
  if (![(Jas_FW_Status_iOSController *)self checkConnectivity])
  {
    unsigned int v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
    v9 = [v8 lastPathComponent];
    id v10 = +[NSString stringWithFormat:@"%@", @"cannot define camera ststus, connectivity issue detected as camera interfaces cannot be reached"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 421, v10);

    [(Jas_FW_Status_iOSController *)self finalizingWithStatusCode:11 andInfoString:@"cannot define camera ststus, connectivity issue detected as camera interfaces cannot be reached"];
  }
  if (![(Jas_FW_Status_iOSController *)self isPortTypeJasperDetected])
  {
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:@"%@", @"Jasper module is missing"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 429, v13);

    [(Jas_FW_Status_iOSController *)self finalizingWithStatusCode:10 andInfoString:@"Jasper module is missing"];
  }
  if ([(Jas_FW_Status_iOSController *)self isUnsealedUnitModule])
  {
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
    char v15 = [v14 lastPathComponent];
    v16 = +[NSString stringWithFormat:@"%@", @"Unsealed unit module suspected"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 437, v16);

    [(Jas_FW_Status_iOSController *)self finalizingWithStatusCode:4294967294 andInfoString:@"Unsealed unit module suspected"];
  }
  if (self->m_scenariosNumber >= 1)
  {
    DeviceCMInterface::DeviceCMInterface((DeviceCMInterface *)&v30);
    long long v17 = *(_OWORD *)&v30.m_rgbSuperWideFrameCount;
    *(_OWORD *)&self->m_diagnosticCMInterface.m_hVersion = *(_OWORD *)&v30._vptr$StreamingClient;
    *(_OWORD *)&self->m_diagnosticCMInterface.m_captureDeviceController = v17;
    *(_OWORD *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbPearlStreamId = *(_OWORD *)&v30.m_timer.beginTime;
    *(void *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.isIrOn = *(void *)&v30.m_maxBanksNumberForFrame;
    self->m_diagnosticCMInterface.m_currentPearlConfiguration.bitMaskID = LODWORD(v30.m_minAveragePointsNumberThreshold);
    objc_storeStrong((id *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.deviceName, v30.m_banksIdDictionary.__tree_.__begin_node_);
    *(_OWORD *)&self->m_diagnosticCMInterface.m_currentJasperConfiguration.isJasperOn = *(_OWORD *)&v30.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_;
    DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&v30);
    JasDiagnosticInteractor::JasDiagnosticInteractor(&v30);
    *(void *)&self->m_diagnosticInteractor.m_jasperFramesCount = *(void *)&v30.m_jasperFramesCount;
    *(void *)((char *)&self->m_diagnosticInteractor.m_jasperPointsCount + 2) = *(void *)((char *)&v30.m_jasperPointsCount
                                                                                           + 2);
    self->m_diagnosticInteractor.m_timer = v30.m_timer;
    m_deviceName = v30.m_deviceName;
    v30.m_deviceName = 0;
    BOOL v19 = self->m_diagnosticInteractor.m_deviceName;
    self->m_diagnosticInteractor.m_deviceName = m_deviceName;

    p_pair1 = &self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__pair1_;
    left = self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_;
    *(_OWORD *)&self->m_diagnosticInteractor.m_maxBanksNumberForFrame = *(_OWORD *)&v30.m_maxBanksNumberForFrame;
    sub_100002038((uint64_t)&self->m_diagnosticInteractor.m_banksIdDictionary, left);
    v22 = v30.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_;
    self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__begin_node_ = v30.m_banksIdDictionary.__tree_.__begin_node_;
    self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_ = v22;
    unint64_t value = v30.m_banksIdDictionary.__tree_.__pair3_.__value_;
    self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__pair3_.__value_ = v30.m_banksIdDictionary.__tree_.__pair3_.__value_;
    if (value)
    {
      v22[2] = p_pair1;
      v22 = 0;
      v30.m_banksIdDictionary.__tree_.__begin_node_ = &v30.m_banksIdDictionary.__tree_.__pair1_;
      v30.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_ = 0;
      v30.m_banksIdDictionary.__tree_.__pair3_.__value_ = 0;
    }
    else
    {
      self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__begin_node_ = p_pair1;
    }
    *(void *)&self->m_diagnosticInteractor.m_goodPointsCount = *(void *)&v30.m_goodPointsCount;
    self->m_diagnosticInteractor.m_subframeCount = v30.m_subframeCount;
    v30._vptr$StreamingClient = (void **)off_10001C690;
    sub_100002038((uint64_t)&v30.m_banksIdDictionary, v22);

    self->m_diagnosticCMInterface.m_delegate = (StreamingClient *)&self->m_diagnosticInteractor;
    v24 = DeviceCMInterface::getJasperConfigurationStringKey(&self->m_diagnosticCMInterface, self->m_configurationsList.__begin_);
    v30._vptr$StreamingClient = (void **)&stru_10001D3B8;
    memset(&v30.m_jasperFramesCount, 0, 24);
    v30._vptr$StreamingClient = (void **)v24;

    DeviceCMInterface::initAndActivateCaptureDeviceController(&self->m_diagnosticCMInterface);
  }
  v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
  v26 = [v25 lastPathComponent];
  uint64_t v27 = +[NSString stringWithFormat:@"%@", @"Finish diagnostic flow..."];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v26, 581, v27);

  unsigned int v28 = [(Jas_FW_Status_iOSController *)self isAllStatusesGood];
  if (self->m_isAllPass) {
    unsigned int v29 = v28;
  }
  else {
    unsigned int v29 = 0;
  }
  if (v29 == 1) {
    [(Jas_FW_Status_iOSController *)self finalizingWithStatusCode:0 andInfoString:&stru_10001D3B8];
  }
  else {
    [(Jas_FW_Status_iOSController *)self finalizingOnError];
  }
}

- (BOOL)isAllStatusesGood
{
  p_m_validationStatusesList = &self->m_validationStatusesList;
  begin = self->m_validationStatusesList.__begin_;
  if (self->m_validationStatusesList.__end_ == begin) {
    return 1;
  }
  unint64_t v4 = 0;
  unsigned int v5 = 1;
  do
  {
    id v6 = (void ***)((char *)begin + 32 * v4);
    v9 = *v6;
    memset(v10, 0, sizeof(v10));
    sub_100005FE4(v10, v6[1], v6[2], v6[2] - v6[1]);
    char v7 = sub_100003668((uint64_t)&v9);
    id v11 = (void **)v10;
    sub_1000060A8(&v11);

    if ((v7 & 1) == 0) {
      break;
    }
    unint64_t v4 = v5;
    begin = p_m_validationStatusesList->__begin_;
    ++v5;
  }
  while (v4 < (p_m_validationStatusesList->__end_ - p_m_validationStatusesList->__begin_) >> 5);
  return v7;
}

- (void)start
{
}

- (void)cancel
{
  int v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
  unint64_t v4 = [v3 lastPathComponent];
  unsigned int v5 = +[NSString stringWithFormat:@"Jasper Diag was cancelled"];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 616, v5);

  id v6 = [(Jas_FW_Status_iOSController *)self result];
  [v6 setStatusCode:&off_10001FA08];

  m_statusesDict = self->m_statusesDict;
  unsigned int v8 = [(Jas_FW_Status_iOSController *)self result];
  [v8 setData:m_statusesDict];

  v9 = [(Jas_FW_Status_iOSController *)self result];
  id v10 = [v9 data];
  id v11 = [(Jas_FW_Status_iOSController *)self result];
  id v12 = [v11 statusCode];
  logMainResults(v10, 8253, (uint64_t)[v12 intValue]);

  [(Jas_FW_Status_iOSController *)self setFinished:1];
}

- (void)finalizingOnError
{
  [(Jas_FW_Status_iOSController *)self updateStatusDictionary:@"All_PASS_STATUS" andValue:&off_10001FB68];
  v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
  int v3 = [v2 lastPathComponent];
  unint64_t v4 = +[NSString stringWithFormat:@"Agregating statuses"];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 627, v4);

  v60[0] = 0;
  v60[1] = 0;
  v59 = (uint64_t *)v60;
  LODWORD(v52) = 1;
  v55 = &v52;
  *((_DWORD *)sub_10000208C(&v59, (int *)&v52, (uint64_t)&unk_100017165, (unsigned int **)&v55) + 8) = 0;
  LODWORD(v52) = 2;
  v55 = &v52;
  *((_DWORD *)sub_10000208C(&v59, (int *)&v52, (uint64_t)&unk_100017165, (unsigned int **)&v55) + 8) = 0;
  LODWORD(v52) = -1;
  v55 = &v52;
  *((_DWORD *)sub_10000208C(&v59, (int *)&v52, (uint64_t)&unk_100017165, (unsigned int **)&v55) + 8) = 0;
  LODWORD(v52) = 100;
  v55 = &v52;
  *((_DWORD *)sub_10000208C(&v59, (int *)&v52, (uint64_t)&unk_100017165, (unsigned int **)&v55) + 8) = 0;
  id v47 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:50];
  begin = self->m_validationStatusesList.__begin_;
  if (self->m_validationStatusesList.__end_ != begin)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    unsigned int v43 = 0;
    while (1)
    {
      unsigned int v8 = (void ***)((char *)begin + 32 * v6);
      v55 = *v8;
      v57 = 0;
      uint64_t v58 = 0;
      v56 = 0;
      sub_100005FE4((char *)&v56, v8[1], v8[2], v8[2] - v8[1]);
      if ((sub_100003668((uint64_t)&v55) & 1) == 0) {
        break;
      }
LABEL_4:
      v52 = &v56;
      sub_1000060A8((void ***)&v52);

      begin = self->m_validationStatusesList.__begin_;
      uint64_t v6 = ++v43;
      if (v43 >= (unint64_t)((self->m_validationStatusesList.__end_ - begin) >> 5)) {
        goto LABEL_27;
      }
    }
    unsigned int v9 = 0;
LABEL_7:
    v52 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    sub_100005FE4((char *)&v52, v56, v57, v57 - v56);
    unint64_t v10 = v9;
    uint64_t v11 = v53 - (void)v52;
    v62 = (void ***)&v52;
    sub_1000060A8((void ***)&v62);
    int v45 = v10;
    if (v10 >= v11 >> 3) {
      goto LABEL_4;
    }
    v52 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    sub_100005FE4((char *)&v52, v56, v57, v57 - v56);
    id v12 = v52[v10];
    v13 = [v12 allKeys];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v13;
    id v14 = [obj countByEnumeratingWithState:&v48 objects:v65 count:16];
    if (!v14) {
      goto LABEL_26;
    }
    uint64_t v15 = *(void *)v49;
LABEL_10:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v49 != v15) {
        objc_enumerationMutation(obj);
      }
      long long v17 = *(void **)(*((void *)&v48 + 1) + 8 * v16);
      char v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"];
      BOOL v19 = [v18 lastPathComponent];
      CFStringRef v20 = [v12 objectForKeyedSubscript:v17];
      v21 = +[NSString stringWithFormat:@"%@", v20];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 651, v21);

      unsigned int v22 = [v17 intValue];
      int v23 = v22;
      if (v22 <= 0x30)
      {
        if (((1 << v22) & 0x1FF0040700C00) != 0)
        {
          LODWORD(v62) = 1;
          v61 = (void ***)&v62;
          v24 = sub_10000208C(&v59, (int *)&v62, (uint64_t)&unk_100017165, (unsigned int **)&v61);
          ++*((_DWORD *)v24 + 8);
          uint64_t v25 = 1;
          goto LABEL_16;
        }
        if (v22 == 31)
        {
          LODWORD(v62) = -1;
          v61 = (void ***)&v62;
          v31 = sub_10000208C(&v59, (int *)&v62, (uint64_t)&unk_100017165, (unsigned int **)&v61);
          ++*((_DWORD *)v31 + 8);
          uint64_t v25 = 0xFFFFFFFFLL;
          goto LABEL_16;
        }
      }
      if (v22 == 525312)
      {
        LODWORD(v62) = 2;
        v61 = (void ***)&v62;
        v32 = sub_10000208C(&v59, (int *)&v62, (uint64_t)&unk_100017165, (unsigned int **)&v61);
        ++*((_DWORD *)v32 + 8);
        uint64_t v25 = 2;
      }
      else
      {
        LODWORD(v62) = 100;
        v61 = (void ***)&v62;
        v33 = sub_10000208C(&v59, (int *)&v62, (uint64_t)&unk_100017165, (unsigned int **)&v61);
        ++*((_DWORD *)v33 + 8);
        if (!v23) {
          goto LABEL_17;
        }
        uint64_t v25 = 100;
      }
LABEL_16:
      v26 = +[NSString stringWithFormat:@"GROUP_CODE: %d", v25];
      uint64_t v27 = getJasperStatusValueString(v23);
      unsigned int v28 = +[NSString stringWithFormat:@"[%d] %@", v7, v27];

      v63 = v26;
      unsigned int v29 = [v12 objectForKeyedSubscript:v17];
      v64 = v29;
      JasDiagnosticInteractor v30 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];

      [v47 setValue:v30 forKey:v28];
      uint64_t v7 = (v7 + 1);
LABEL_17:
      if (v14 == (id)++v16)
      {
        id v34 = [obj countByEnumeratingWithState:&v48 objects:v65 count:16];
        id v14 = v34;
        if (!v34)
        {
LABEL_26:

          [(Jas_FW_Status_iOSController *)self updateStatusDictionary:v55 andValue:v47];
          v62 = (void ***)&v52;
          sub_1000060A8((void ***)&v62);
          unsigned int v9 = v45 + 1;
          goto LABEL_7;
        }
        goto LABEL_10;
      }
    }
  }
LABEL_27:
  LODWORD(v52) = 2;
  v55 = &v52;
  if (*((int *)sub_10000208C(&v59, (int *)&v52, (uint64_t)&unk_100017165, (unsigned int **)&v55) + 8) <= 0)
  {
    LODWORD(v52) = 1;
    v55 = &v52;
    if (*((int *)sub_10000208C(&v59, (int *)&v52, (uint64_t)&unk_100017165, (unsigned int **)&v55) + 8) <= 0)
    {
      LODWORD(v52) = -1;
      v55 = &v52;
      if (*((int *)sub_10000208C(&v59, (int *)&v52, (uint64_t)&unk_100017165, (unsigned int **)&v55) + 8) <= 0) {
        v35 = &off_10001FA68;
      }
      else {
        v35 = &off_10001FA50;
      }
    }
    else
    {
      v35 = &off_10001FA38;
    }
  }
  else
  {
    v35 = &off_10001FA20;
  }
  id v36 = [(Jas_FW_Status_iOSController *)self result];
  [v36 setStatusCode:v35];

  m_statusesDict = self->m_statusesDict;
  v38 = [(Jas_FW_Status_iOSController *)self result];
  [v38 setData:m_statusesDict];

  id v39 = [(Jas_FW_Status_iOSController *)self result];
  id v40 = [v39 data];
  unint64_t v41 = [(Jas_FW_Status_iOSController *)self result];
  unsigned int v42 = [v41 statusCode];
  logMainResults(v40, 8253, (uint64_t)[v42 intValue]);

  [(Jas_FW_Status_iOSController *)self setFinished:1];
  sub_100002038((uint64_t)&v59, v60[0]);
}

- (void)finalizingWithStatusCode:(int)a3 andInfoString:(id)a4
{
  id v6 = a4;
  if (!a3 && self->m_isAllPass)
  {
    [(Jas_FW_Status_iOSController *)self updateStatusDictionary:@"All_PASS_STATUS" andValue:&off_10001FBB8];
    goto LABEL_8;
  }
  [(Jas_FW_Status_iOSController *)self updateStatusDictionary:@"All_PASS_STATUS" andValue:&off_10001FB90];
  if ((a3 - 10) < 2)
  {
    if (!v6)
    {
      [(Jas_FW_Status_iOSController *)self updateStatusDictionary:@"IMMEDIATE_ERROR_FINALIZING" andValue:&off_10001FBE0];
      unsigned int v8 = &off_10001FA38;
      goto LABEL_16;
    }
    CFStringRef v20 = @"FINALIZING_ERROR_INFO";
    id v21 = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    [(Jas_FW_Status_iOSController *)self updateStatusDictionary:@"IMMEDIATE_ERROR_FINALIZING" andValue:v7];
    unsigned int v8 = &off_10001FA38;
    goto LABEL_13;
  }
  if (a3 == -2)
  {
    if (!v6)
    {
      unsigned int v8 = &off_10001FA98;
      goto LABEL_16;
    }
    CFStringRef v18 = @"FINALIZING_ERROR_INFO";
    id v19 = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [(Jas_FW_Status_iOSController *)self updateStatusDictionary:@"IMMEDIATE_ERROR_FINALIZING" andValue:v7];
    unsigned int v8 = &off_10001FA98;
    goto LABEL_13;
  }
  if (a3)
  {
    CFStringRef v16 = @"JASPER_UNKNOWN_GROUP";
    id v17 = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [(Jas_FW_Status_iOSController *)self updateStatusDictionary:@"IMMEDIATE_ERROR_FINALIZING" andValue:v7];
    unsigned int v8 = &off_10001FA68;
LABEL_13:

    goto LABEL_16;
  }
LABEL_8:
  unsigned int v8 = &off_10001FA80;
LABEL_16:
  unsigned int v9 = [(Jas_FW_Status_iOSController *)self result];
  [v9 setStatusCode:v8];

  m_statusesDict = self->m_statusesDict;
  uint64_t v11 = [(Jas_FW_Status_iOSController *)self result];
  [v11 setData:m_statusesDict];

  id v12 = [(Jas_FW_Status_iOSController *)self result];
  v13 = [v12 data];
  id v14 = [(Jas_FW_Status_iOSController *)self result];
  uint64_t v15 = [v14 statusCode];
  logMainResults(v13, 8253, (uint64_t)[v15 intValue]);

  [(Jas_FW_Status_iOSController *)self setFinished:1];
}

- (void).cxx_destruct
{
  p_m_diagnosticInteractor = &self->m_diagnosticInteractor;
  self->m_diagnosticInteractor._vptr$StreamingClient = (void **)off_10001C690;
  sub_100002038((uint64_t)&self->m_diagnosticInteractor.m_banksIdDictionary, (void *)self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_);

  objc_storeStrong((id *)&self->m_statusesDict, 0);
  begin = self->m_configurationsList.__begin_;
  if (begin)
  {
    self->m_configurationsList.__end_ = begin;
    operator delete(begin);
  }
  DeviceCMInterface::~DeviceCMInterface(&self->m_diagnosticCMInterface);
  p_m_validationStatusesList = &self->m_validationStatusesList;
  sub_100006720((void ***)&p_m_validationStatusesList);
}

- (id).cxx_construct
{
  self->m_validationStatusesList.__end_ = 0;
  self->m_validationStatusesList.__end_cap_.__value_ = 0;
  self->m_validationStatusesList.__begin_ = 0;
  DeviceCMInterface::DeviceCMInterface(&self->m_diagnosticCMInterface);
  self->m_configurationsList.__end_ = 0;
  self->m_configurationsList.__end_cap_.__value_ = 0;
  self->m_configurationsList.__begin_ = 0;
  JasDiagnosticInteractor::JasDiagnosticInteractor(&self->m_diagnosticInteractor);
  return self;
}

@end