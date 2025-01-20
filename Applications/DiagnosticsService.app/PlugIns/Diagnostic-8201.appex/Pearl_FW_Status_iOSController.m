@interface Pearl_FW_Status_iOSController
- (BOOL)checkConnectivity;
- (BOOL)isPearlDetected;
- (BOOL)isPortTypeFrontIRDetected;
- (BOOL)isPortTypeFrontRgbDetected;
- (id).cxx_construct;
- (int)ConfigDevice:(PearlConfiguration *)a3;
- (int)getConfigurationForCaseMask:(int)a3 returnedConfiguration:(PearlConfiguration *)a4;
- (int)getPLEUUID:(char *)a3;
- (int)getPearlProjectorHWVersion:(int *)a3;
- (int)getRigelInfo:(int *)a3 serialNumber:(id *)a4;
- (int)startStreaming;
- (int)stopStreaming;
- (void)cancel;
- (void)disableAttentionDetection;
- (void)finalizingWithErrorStatusCode:(id)a3 andInfoString:(id)a4;
- (void)finalizingWithStatusCode:(id)a3 andFinalizingCode:(int)a4;
- (void)performFlow;
- (void)produceGeneralFailurForDiagnosticConfiguration:(PearlConfiguration *)a3 withString:(id)a4;
- (void)produceStatusForDiagnosticConfigurationDetailsOnFailureOnly:(PearlConfiguration *)a3;
- (void)restoreAttentionDetection;
- (void)setResultBitMaskStatus:(int)a3 andState:(BOOL)a4;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
- (void)terminateComunication;
@end

@implementation Pearl_FW_Status_iOSController

- (int)getConfigurationForCaseMask:(int)a3 returnedConfiguration:(PearlConfiguration *)a4
{
  if (a3 <= 31)
  {
    switch(a3)
    {
      case 1:
        int v5 = 0;
        *(_WORD *)&a4->isIrOn = 257;
        a4->isRgbOn = 1;
        uint64_t v6 = 0x100000003;
        goto LABEL_19;
      case 2:
        int v5 = 0;
        *(_WORD *)&a4->isIrOn = 1;
        a4->isRgbOn = 0;
        uint64_t v6 = 0x200000003;
        goto LABEL_19;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_13;
      case 4:
        int v5 = 0;
        *(_WORD *)&a4->isIrOn = 1;
        a4->isRgbOn = 0;
        uint64_t v6 = 0x400000004;
        goto LABEL_19;
      case 8:
        int v5 = 0;
        *(_WORD *)&a4->isIrOn = 1;
        a4->isRgbOn = 0;
        uint64_t v6 = 0x800000001;
        goto LABEL_19;
      default:
        if (a3 != 16) {
          goto LABEL_13;
        }
        int v5 = 0;
        *(_WORD *)&a4->isIrOn = 0;
        a4->isRgbOn = 1;
        uint64_t v6 = 0x1000000000;
        break;
    }
    goto LABEL_19;
  }
  if (a3 > 127)
  {
    if (a3 == 128)
    {
      int v5 = 0;
      *(_WORD *)&a4->isIrOn = 1;
      a4->isRgbOn = 0;
      uint64_t v6 = 0x8000000005;
      goto LABEL_19;
    }
    if (a3 == 256)
    {
      int v5 = 0;
      *(_WORD *)&a4->isIrOn = 1;
      a4->isRgbOn = 0;
      uint64_t v6 = 0x10000000006;
      goto LABEL_19;
    }
  }
  else
  {
    if (a3 == 32)
    {
      int v5 = 0;
      *(_WORD *)&a4->isIrOn = 257;
      a4->isRgbOn = 0;
      uint64_t v6 = 0x2000000003;
      goto LABEL_19;
    }
    if (a3 == 64)
    {
      int v5 = 0;
      *(_WORD *)&a4->isIrOn = 257;
      a4->isRgbOn = 0;
      uint64_t v6 = 0x4000000004;
LABEL_19:
      *(void *)&a4->irType = v6;
      deviceName = a4->deviceName;
      a4->deviceName = 0;
      goto LABEL_20;
    }
  }
LABEL_13:
  deviceName = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm", a4);
  v8 = [deviceName lastPathComponent];
  v9 = decToBinStr(a3);
  v10 = +[NSString stringWithFormat:@"no available configuration detected for this mask bit location %@", v9];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 87, v10);

  int v5 = -536870206;
LABEL_20:

  return v5;
}

- (void)setResultBitMaskStatus:(int)a3 andState:(BOOL)a4
{
  unsigned int m_resultsCasesMask = self->m_resultsCasesMask;
  int v5 = m_resultsCasesMask & ~a3;
  unsigned int v6 = m_resultsCasesMask | a3;
  if (!a4) {
    unsigned int v6 = v5;
  }
  self->unsigned int m_resultsCasesMask = v6;
}

- (void)disableAttentionDetection
{
  if (self->m_isUseADControl)
  {
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    v3 = [v9 lastPathComponent];
    v4 = +[NSString stringWithFormat:@"disableAttentionDetection if needed"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 109, v4);

    self->m_attentionDetectionSetting = _AXSAttentionAwarenessFeaturesEnabled() != 0;
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    int v5 = [v10 lastPathComponent];
    unsigned int v6 = +[NSString stringWithFormat:@"current attention detection status %d", self->m_attentionDetectionSetting];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 111, v6);

    if (self->m_attentionDetectionSetting)
    {
      _AXSSetAttentionAwarenessFeaturesEnabled();
      usleep(0x7A120u);
      id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      v7 = [v11 lastPathComponent];
      v8 = +[NSString stringWithFormat:@"disable attention detection, current status is %d", _AXSAttentionAwarenessFeaturesEnabled()];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 116, v8);
    }
    else
    {
      id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      v7 = [v11 lastPathComponent];
      v8 = +[NSString stringWithFormat:@"attention detection already disabled"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 120, v8);
    }
  }
}

- (void)restoreAttentionDetection
{
  if (self->m_isUseADControl)
  {
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    v3 = [v9 lastPathComponent];
    v4 = +[NSString stringWithFormat:@"restore attention detection if needed"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 131, v4);

    LODWORD(v4) = _AXSAttentionAwarenessFeaturesEnabled() != 0;
    LODWORD(v3) = self->m_attentionDetectionSetting;
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    [v10 lastPathComponent];
    if (v3 == v4) {
      int v5 = {;
    }
      unsigned int v6 = +[NSString stringWithFormat:@"attention detection already as require"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 142, v6);
    }
    else {
      v7 = {;
    }
      v8 = +[NSString stringWithFormat:@"restore attention detection to its prevues status of %d", self->m_attentionDetectionSetting];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 135, v8);

      _AXSSetAttentionAwarenessFeaturesEnabled();
      usleep(0x7A120u);
      id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      int v5 = [v10 lastPathComponent];
      unsigned int v6 = +[NSString stringWithFormat:@"attention detection current status is %d after restoring", _AXSAttentionAwarenessFeaturesEnabled()];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 138, v6);
    }
  }
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v81 = a4;
  id v88 = v6;
  self->m_useHighPriorityControlRequest = [v88 useHighPriority];
  self->m_isUseADControl = [v88 useADControl];
  self->m_preemtionWaitingTimeInMicroSec = [v88 preemtingWaitInMicroSec];
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
  v8 = [v7 lastPathComponent];
  id v9 = +[NSString stringWithFormat:@"input value: useHighPriority = %d", self->m_useHighPriorityControlRequest];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 154, v9);

  id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
  id v11 = [v10 lastPathComponent];
  v12 = +[NSString stringWithFormat:@"input value: isUseADControl = %d", self->m_isUseADControl];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 155, v12);

  v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
  v14 = [v13 lastPathComponent];
  v15 = +[NSString stringWithFormat:@"input value: preemtionWaitingTimeInMicroSec = %d", self->m_preemtionWaitingTimeInMicroSec];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 156, v15);

  [(Pearl_FW_Status_iOSController *)self disableAttentionDetection];
  self->m_isYGErrorDetected = 0;
  v16 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:50];
  m_statusesDict = self->m_statusesDict;
  self->m_statusesDict = v16;

  v87 = (void *)MGCopyAnswer();
  v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
  v19 = [v18 lastPathComponent];
  v20 = +[NSString stringWithFormat:@"setupWithInputs Pearl Diagnostic %@", v87];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 163, v20);

  [(NSMutableDictionary *)self->m_statusesDict setValue:v87 forKey:@"DEVICE_NAME"];
  v21 = self->m_statusesDict;
  v22 = getCurrentVersion();
  [(NSMutableDictionary *)v21 setValue:v22 forKey:@"VERSION"];

  self->unsigned int m_resultsCasesMask = 0;
  self->m_timeForStreamInUSec = 5000000;
  self->uint64_t m_casesMask = 255;
  unsigned int v93 = -1;
  int v94 = -1;
  unsigned int v23 = [(Pearl_FW_Status_iOSController *)self getPearlProjectorHWVersion:&v94];
  self->m_isSmp = 0;
  self->m_isNuri = 0;
  if (!v23)
  {
    if (v94 == 10)
    {
      v85 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      v77 = [v85 lastPathComponent];
      v78 = +[NSString stringWithFormat:@"NURI projector version detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v77, 185, v78);

      self->m_isNuri = 1;
    }
    else if (v94 == 8)
    {
      v84 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      v31 = [v84 lastPathComponent];
      v32 = +[NSString stringWithFormat:@"SMP projector version detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v31, 180, v32);

      self->m_isSmp = 1;
    }
    else
    {
      v86 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      v79 = [v86 lastPathComponent];
      v80 = +[NSString stringWithFormat:@"Standard Pearl projector version detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v79, 190, v80);
    }
  }
  id v92 = 0;
  unsigned int v24 = [(Pearl_FW_Status_iOSController *)self getRigelInfo:&v93 serialNumber:&v92];
  CFStringRef v25 = (const __CFString *)v92;
  if (v24)
  {
    v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    v27 = [v26 lastPathComponent];
    v28 = +[NSString stringWithFormat:@"failed to get Rigel info"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 196, v28);
  }
  CFStringRef v29 = @"N/A";
  if (v25) {
    CFStringRef v30 = v25;
  }
  else {
    CFStringRef v30 = @"N/A";
  }
  v83 = (__CFString *)v30;
  if (v93 != -1)
  {
    CFStringRef v29 = +[NSString stringWithFormat:@"%d", v93];
  }
  v82 = (__CFString *)v29;
  -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:");
  [(NSMutableDictionary *)self->m_statusesDict setValue:v83 forKey:@"RIGEL_SERIAL_NUMBER"];
  if ([(Pearl_FW_Status_iOSController *)self getPLEUUID:v99])
  {
    [(NSMutableDictionary *)self->m_statusesDict setValue:@"N/A" forKey:@"PCE_CALIB_UUID"];
  }
  else
  {
    v33 = +[NSString stringWithFormat:@"%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X", v99[0], v99[1], v99[2], v99[3], v99[4], v99[5], v99[6], v99[7], v99[8], v99[9], v99[10], v99[11], v99[12], v99[13], v99[14], v99[15]];
    [(NSMutableDictionary *)self->m_statusesDict setValue:v33 forKey:@"PCE_CALIB_UUID"];
  }
  if (self->m_isSmp || self->m_isNuri) {
    self->uint64_t m_casesMask = 315;
  }
  if (!v88)
  {
    v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    v39 = [v38 lastPathComponent];
    v40 = +[NSString stringWithFormat:@"Fail to instantiate input class"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v39, 285, v40);

    [(Pearl_FW_Status_iOSController *)self finalizingWithErrorStatusCode:&off_1000346F0 andInfoString:@"Fail to instantiate input class"];
    goto LABEL_53;
  }
  if ((int)[v88 configurationTimeForStreamInSec] >= 1)
  {
    if ((int)[v88 configurationTimeForStreamInSec] <= 4)
    {
      v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"external stream time of %d sec detected and it is less then minimal (5 sec), Diagnostic will not run", [v88 configurationTimeForStreamInSec]);
      v35 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      v36 = [v35 lastPathComponent];
      v37 = +[NSString stringWithFormat:@"%@", v34];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v36, 242, v37);

      [(Pearl_FW_Status_iOSController *)self finalizingWithErrorStatusCode:&off_1000346F0 andInfoString:v34];
      goto LABEL_53;
    }
    self->m_timeForStreamInUSec = 1000000 * [v88 configurationTimeForStreamInSec];
  }
  if ([v88 diagnosticCasesMask] != -1)
  {
    v41 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    v42 = [v41 lastPathComponent];
    v43 = +[NSString stringWithFormat:@"Overriding mask due to external file input"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v42, 252, v43);

    self->uint64_t m_casesMask = [v88 diagnosticCasesMask];
  }
  v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
  v45 = [v44 lastPathComponent];
  uint64_t m_casesMask = self->m_casesMask;
  v47 = decToBinStr(self->m_casesMask);
  v48 = +[NSString stringWithFormat:@"diagnostic mask: %d [%@] detected", m_casesMask, v47];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v45, 256, v48);

  if (self->m_casesMask <= 0x1FF)
  {
    int v50 = 0;
    uint64_t v51 = 1;
    while (1)
    {
      if ((self->m_casesMask & v51) != 0)
      {
        id v91 = 0;
        LOWORD(v89) = 0;
        BYTE2(v89) = 0;
        HIDWORD(v89) = 0;
        int v90 = 0;
        id v91 = v87;
        if ([(Pearl_FW_Status_iOSController *)self getConfigurationForCaseMask:v51 returnedConfiguration:&v89])
        {
          [(Pearl_FW_Status_iOSController *)self finalizingWithErrorStatusCode:&off_1000346F0 andInfoString:@"Bad Diagnostic bit mask"];

          goto LABEL_53;
        }
        p_m_configurationsList = &self->m_configurationsList;
        end = self->m_configurationsList.__end_;
        value = self->m_configurationsList.__end_cap_.__value_;
        if (end >= value)
        {
          unint64_t v56 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)p_m_configurationsList->__begin_) >> 3);
          unint64_t v57 = v56 + 1;
          if (v56 + 1 > 0xAAAAAAAAAAAAAAALL) {
            sub_10000CAEC();
          }
          unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)p_m_configurationsList->__begin_) >> 3);
          if (2 * v58 > v57) {
            unint64_t v57 = 2 * v58;
          }
          if (v58 >= 0x555555555555555) {
            unint64_t v59 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v59 = v57;
          }
          p_end_cap = &self->m_configurationsList.__end_cap_;
          if (v59)
          {
            v60 = (char *)sub_1000171B0((uint64_t)&self->m_configurationsList.__end_cap_, v59);
            uint64_t v62 = v61;
          }
          else
          {
            v60 = 0;
            uint64_t v62 = 0;
          }
          v63 = &v60[24 * v56];
          uint64_t v64 = v89;
          *((_DWORD *)v63 + 2) = v90;
          *(void *)v63 = v64;
          *((void *)v63 + 2) = v91;
          begin = p_m_configurationsList->__begin_;
          v65 = self->m_configurationsList.__end_;
          if (v65 == p_m_configurationsList->__begin_)
          {
            int64x2_t v71 = vdupq_n_s64((unint64_t)v65);
            v67 = (PearlConfiguration *)v63;
          }
          else
          {
            v67 = (PearlConfiguration *)v63;
            do
            {
              uint64_t v68 = *(void *)&v65[-1].isIrOn;
              --v65;
              int bitMaskID = v65->bitMaskID;
              *(void *)&v67[-1].isIrOn = v68;
              --v67;
              v67->int bitMaskID = bitMaskID;
              deviceName = v65->deviceName;
              v65->deviceName = 0;
              v67->deviceName = deviceName;
            }
            while (v65 != begin);
            int64x2_t v71 = *(int64x2_t *)&p_m_configurationsList->__begin_;
          }
          v72 = (PearlConfiguration *)(v63 + 24);
          p_m_configurationsList->__begin_ = v67;
          self->m_configurationsList.__end_ = v72;
          int64x2_t v96 = v71;
          v73 = self->m_configurationsList.__end_cap_.__value_;
          self->m_configurationsList.__end_cap_.__value_ = (PearlConfiguration *)&v60[24 * v62];
          v97 = v73;
          uint64_t v95 = v71.i64[0];
          sub_1000171F8((uint64_t)&v95);
          self->m_configurationsList.__end_ = v72;
        }
        else
        {
          uint64_t v55 = v89;
          end->int bitMaskID = v90;
          *(void *)&end->isIrOn = v55;
          end->deviceName = (NSString *)v91;
          self->m_configurationsList.__end_ = end + 1;
        }
      }
      ++v50;
      uint64_t v51 = (2 * v51);
      if (v50 == 9)
      {
        v74 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
        v75 = [v74 lastPathComponent];
        v76 = +[NSString stringWithFormat:@"time for streaming: %d [us]", self->m_timeForStreamInUSec];
        NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v75, 289, v76);

        self->m_isIrEnable = 0;
        self->m_isRgbEnable = 0;
        self->m_isAllPass = 0;
        self->m_isCurrentStatusOK = 1;
        self->m_scenariosNumber = -1431655765
                                * ((unint64_t)((char *)self->m_configurationsList.__end_
                                                    - (char *)self->m_configurationsList.__begin_) >> 3);
        self->m_passCount = 0;
        goto LABEL_53;
      }
    }
  }
  v49 = +[NSString stringWithFormat:@"Bad Diagnostic bit mask, bit mask 0x%x > 0x%x", self->m_casesMask, 511];
  [(Pearl_FW_Status_iOSController *)self finalizingWithErrorStatusCode:&off_1000346F0 andInfoString:v49];

LABEL_53:
}

- (void)start
{
}

- (void)produceGeneralFailurForDiagnosticConfiguration:(PearlConfiguration *)a3 withString:(id)a4
{
  id v6 = a4;
  v7 = DeviceCMInterface::getPearlConfigurationStringKey(&self->m_diagnosticCMInterface, a3);
  self->m_isAllPass = 0;
  self->m_isCurrentStatusOK = 0;
  m_statusesDict = self->m_statusesDict;
  v10[0] = @"OVERALL_FOR_CONFIGURATION";
  v10[1] = @"Status";
  v11[0] = @"FAIL";
  v11[1] = v6;
  id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [(NSMutableDictionary *)m_statusesDict setValue:v9 forKey:v7];

  [(Pearl_FW_Status_iOSController *)self setResultBitMaskStatus:a3->bitMaskID andState:1];
}

- (int)getPLEUUID:(char *)a3
{
  DeviceCMInterface::DeviceCMInterface(&v4);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v4);
}

- (int)getRigelInfo:(int *)a3 serialNumber:(id *)a4
{
  DeviceCMInterface::DeviceCMInterface(&v5);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v5);
}

- (int)getPearlProjectorHWVersion:(int *)a3
{
  DeviceCMInterface::DeviceCMInterface(&v4);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v4);
}

- (void)produceStatusForDiagnosticConfigurationDetailsOnFailureOnly:(PearlConfiguration *)a3
{
  self->m_isCurrentStatusOK = 1;
  if (!a3->isIrOn)
  {
    v8 = 0;
    goto LABEL_58;
  }
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:70];
  unsigned int v71 = -1;
  int isGmcOk = PearlDiagnosticInteractor::isGmcOk(&self->m_diagnosticInteractor);
  DeviceCMInterface::validateIrFwStatus(&self->m_diagnosticCMInterface, &v71);
  unsigned int v5 = v71;
  if (self->m_isCurrentStatusOK && v71 == 0)
  {
    BOOL v7 = isGmcOk;
    if (!self->m_diagnosticInteractor.m_isPearlIrFramesArrived) {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  self->m_isCurrentStatusOK = v7;
  if (!self->m_isAllPass) {
    BOOL v7 = 0;
  }
  self->m_isAllPass = v7;
  if (!self->m_isCurrentStatusOK)
  {
    if (self->m_isSmp || self->m_isNuri)
    {
      *(void *)v69 = 0;
      *(void *)v70 = 0;
      uint64_t v68 = 0;
      int v67 = 0;
      uint64_t v66 = 0;
      id v9 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:70];
      if (DeviceCMInterface::getGuadalupeValues(&self->m_diagnosticCMInterface, (uint64_t *)v70, (uint64_t *)v69, &v68, &v67, &v66))
      {
        [v9 setValue:@"N/A" forKey:@"PROJECTOR_STATE"];
        [v9 setValue:@"N/A" forKey:@"PROJECTOR_FAULTS"];
        [v9 setValue:@"N/A" forKey:@"PROJECTOR_RESISTANCE"];
        [v9 setValue:@"N/A" forKey:@"PROJECTOR_LAST_RESISTANCE"];
        [v9 setValue:@"N/A" forKey:@"GUADALUPE_RECORDING_REGISTER"];
        [v9 setValue:@"N/A" forKey:@"GUADALUPE_REGISTER_4"];
      }
      else
      {
        id v10 = decToBinStr(v70[0]);
        id v11 = +[NSString stringWithFormat:@"%@", v10];
        [v9 setValue:v11 forKey:@"PROJECTOR_STATE"];

        v12 = decToBinStr(*(unsigned int *)v69);
        v13 = +[NSString stringWithFormat:@"%@", v12];
        [v9 setValue:v13 forKey:@"PROJECTOR_STATUS"];

        v14 = +[NSString stringWithFormat:@"%lld", v68];
        [v9 setValue:v14 forKey:@"PROJECTOR_RESISTANCE"];

        v15 = +[NSString stringWithFormat:@"%d", v67];
        [v9 setValue:v15 forKey:@"PROJECTOR_LAST_RESISTANCE"];

        LODWORD(v13) = HIDWORD(v66);
        v16 = decToBinStr(v66);
        v17 = +[NSString stringWithFormat:@"%@", v16];
        [v9 setValue:v17 forKey:@"GUADALUPE_RECORDING_REGISTER"];

        v18 = decToBinStr(v13);
        v19 = +[NSString stringWithFormat:@"%@", v18];
        [v9 setValue:v19 forKey:@"GUADALUPE_REGISTER_4"];
      }
      [v4 setValue:v9 forKey:@"GUADALUPE_VALUES"];

      unsigned int v5 = v71;
    }
    v20 = decToBinStr(v5);
    [v4 setValue:v20 forKey:@"FW_VALIDATION_BITS"];

    v69[0] = 0;
    if (DeviceCMInterface::isPDECaliobrationValid(&self->m_diagnosticCMInterface, v69))
    {
      CFStringRef v21 = @"Fail to get information";
    }
    else
    {
      if (v69[0])
      {
LABEL_23:
        *(void *)v70 = 0;
        id v22 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:50];
        if (a3->irType == 1)
        {
          if (!DeviceCMInterface::getPearlFloodProjectorFault(&self->m_diagnosticCMInterface, (unint64_t *)v70))
          {
            CFStringRef v86 = @"Fault Status";
            unsigned int v24 = +[NSString stringWithFormat:@"0x%08X", *(void *)v70];
            v87 = v24;
            CFStringRef v25 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
            [v4 setValue:v25 forKey:@"PROJECTOR_FAULT_FLOOD"];

            goto LABEL_31;
          }
          CFStringRef v23 = @"PROJECTOR_FAULT_FLOOD";
        }
        else
        {
          if (!DeviceCMInterface::getStructuredProjectorFault(&self->m_diagnosticCMInterface, (unint64_t *)v70))
          {
            CFStringRef v84 = @"[0x7C 0x7E 0x80 0x82 0x84]";
            v26 = +[NSString stringWithFormat:@"[0x%02X 0x%02X 0x%02X 0x%02X 0x%02X]", HIBYTE(v70[1]), BYTE2(v70[1]), BYTE1(v70[1]), LOBYTE(v70[1]), HIBYTE(v70[0]), context];
            v85 = v26;
            v27 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
            [v22 setValue:v27 forKey:@"Fault Status"];

            CFStringRef v82 = @"[0x1C 0xF0]";
            v28 = +[NSString stringWithFormat:@"[0x%02X 0x%02X]", BYTE2(v70[0]), BYTE1(v70[0])];
            v83 = v28;
            CFStringRef v29 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
            [v22 setValue:v29 forKey:@"CC State"];

            CFStringRef v80 = @"[0x07]";
            CFStringRef v30 = +[NSString stringWithFormat:@"[0x%02X]", LOBYTE(v70[0])];
            id v81 = v30;
            v31 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
            [v22 setValue:v31 forKey:@"Rigel State"];

            [v4 setValue:v22 forKey:@"PROJECTOR_FAULT_STRUCTURED"];
            goto LABEL_31;
          }
          CFStringRef v23 = @"PROJECTOR_FAULT_STRUCTURED";
        }
        [v4 setValue:@"Fail to get information" forKey:v23];
LABEL_31:

        goto LABEL_32;
      }
      CFStringRef v21 = @"Not Valid";
    }
    [v4 setValue:v21 forKey:@"PDE_CALIBRATION"];
    goto LABEL_23;
  }
LABEL_32:
  if (a3->isDepthOn && a3->irType == 3)
  {
    id v64 = 0;
    id v65 = 0;
    PearlDiagnosticInteractor::getGmcMetaData((uint64_t)&self->m_diagnosticInteractor, &v65, &v64);
    id v32 = v65;
    id v33 = v64;
    id v34 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
    v35 = v34;
    if (v33)
    {
      if ([v33 intValue] == 0xFFFF) {
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d DATA NEVER DETECTED", [v33 intValue]);
      }
      else {
      v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v33 intValue]);
      }
      [v35 setValue:v36 forKey:@"GMC_RESULTS"];
    }
    else
    {
      [v34 setValue:@"Fail to get information" forKey:@"GMC_RESULTS"];
    }
    if (v32)
    {
      if ([v32 intValue] == -2) {
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d DATA NEVER DETECTED", [v32 intValue]);
      }
      else {
      v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v32 intValue]);
      }
      [v35 setValue:v37 forKey:@"GMC_POINT_COUNT"];
    }
    else
    {
      [v35 setValue:@"Fail to get information" forKey:@"GMC_POINT_COUNT"];
    }
    id v62 = 0;
    id v63 = 0;
    id v61 = 0;
    PearlDiagnosticInteractor::getGmcResultInformation(&self->m_diagnosticInteractor, (int)[v33 intValue], &v63, &v62, &v61);
    id v38 = v63;
    id v39 = v62;
    id v40 = v61;
    [v35 setValue:v38 forKey:@"GMC_RESULT_NAME"];
    [v35 setValue:v40 forKey:@"GMC_RESULT_DESCRIPTION"];
    [v35 setValue:v39 forKey:@"GMC_RESULT_STAGE"];
    if (isGmcOk) {
      CFStringRef v41 = @"PASS";
    }
    else {
      CFStringRef v41 = @"FAIL";
    }
    [v4 setValue:v41 forKey:@"GMC_STATUS"];
    [v4 setValue:v35 forKey:@"GMC_META_DATA"];
  }
  v42 = +[NSString stringWithFormat:@"%d", self->m_diagnosticInteractor.m_irPearlFramesCount];
  [v4 setValue:v42 forKey:@"IR_FRAME_COUNT"];

  if ((self->m_isCurrentStatusOK & isGmcOk) != 0) {
    CFStringRef v43 = @"OK";
  }
  else {
    CFStringRef v43 = @"FAIL";
  }
  [v4 setValue:v43 forKey:@"OVERALL_IR"];
  if (!self->m_diagnosticInteractor.m_isPearlIrFramesArrived) {
    [v4 setValue:@"FAIL" forKey:@"IR_FRAME_VALIDATION"];
  }
  id v60 = v4;
  setTestValidationBit(v71, &v60);
  id v44 = v60;

  if ((v71 & 0x2000) != 0) {
    self->m_isYGErrorDetected = 1;
  }
  v8 = v44;
LABEL_58:
  if (a3->isRgbOn)
  {
    BOOL m_isPearlRgbFramesArrived = self->m_diagnosticInteractor.m_isPearlRgbFramesArrived;
    BOOL v47 = self->m_diagnosticInteractor.m_isPearlRgbFramesArrived && self->m_isAllPass;
    self->m_isAllPass = v47;
    if (m_isPearlRgbFramesArrived)
    {
      v78[0] = @"OVERALL_RGB";
      v78[1] = @"RGB_FRAME_COUNT";
      v79[0] = @"OK";
      v48 = +[NSString stringWithFormat:@"%d", self->m_diagnosticInteractor.m_rgbPearlFramesCount];
      v79[1] = v48;
      v49 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];
    }
    else
    {
      v49 = &off_100034798;
    }
    BOOL v51 = m_isPearlRgbFramesArrived && self->m_isCurrentStatusOK;
    self->m_isCurrentStatusOK = v51;
  }
  else
  {
    v49 = 0;
  }
  v52 = DeviceCMInterface::getPearlConfigurationStringKey(&self->m_diagnosticCMInterface, 0);
  if (v8 && v49)
  {
    m_statusesDict = self->m_statusesDict;
    v76[0] = @"RGB";
    v76[1] = @"IR";
    v77[0] = v49;
    v77[1] = v8;
    v54 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
    [(NSMutableDictionary *)m_statusesDict setValue:v54 forKey:v52];
LABEL_83:

    goto LABEL_84;
  }
  if (v8)
  {
    uint64_t v55 = self->m_statusesDict;
    CFStringRef v74 = @"IR";
    v75 = v8;
    v54 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    [(NSMutableDictionary *)v55 setValue:v54 forKey:v52];
    goto LABEL_83;
  }
  if (v49)
  {
    unint64_t v56 = self->m_statusesDict;
    CFStringRef v72 = @"RGB";
    v73 = v49;
    v54 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    [(NSMutableDictionary *)v56 setValue:v54 forKey:v52];
    goto LABEL_83;
  }
LABEL_84:
  [(Pearl_FW_Status_iOSController *)self setResultBitMaskStatus:a3->bitMaskID andState:!self->m_isCurrentStatusOK];
}

- (int)ConfigDevice:(PearlConfiguration *)a3
{
  self->m_isRgbEnable = 0;
  self->m_isIrEnable = 0;
  p_m_diagnosticCMInterface = &self->m_diagnosticCMInterface;
  int v6 = DeviceCMInterface::configPearlDevice(&self->m_diagnosticCMInterface, a3);
  if (v6)
  {
    BOOL v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:@"fail to configure device"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 688, v9);
  }
  else
  {
    self->m_isIrEnable = p_m_diagnosticCMInterface->m_isPearlIrConfigured;
    self->m_isRgbEnable = p_m_diagnosticCMInterface->m_isPearlRgbConfigured;
  }

  return v6;
}

- (int)startStreaming
{
  if (self->m_isIrEnable)
  {
    if (!self->m_isRgbEnable) {
      goto LABEL_8;
    }
  }
  else if (!self->m_isRgbEnable)
  {
    unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    int v6 = [v5 lastPathComponent];
    BOOL v7 = +[NSString stringWithFormat:@"there is no stream avaiable for streaming"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 705, v7);
    int v4 = -536870212;
    goto LABEL_11;
  }
  int started = DeviceCMInterface::startPearlRgbStream(&self->m_diagnosticCMInterface);
  if (started)
  {
    int v4 = started;
    unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    int v6 = [v5 lastPathComponent];
    BOOL v7 = +[NSString stringWithFormat:@"start Rgb stream failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 714, v7);
LABEL_11:

    return v4;
  }
  if (!self->m_isIrEnable) {
    return 0;
  }
LABEL_8:
  int v4 = DeviceCMInterface::startPearlIrStream(&self->m_diagnosticCMInterface);
  if (v4)
  {
    unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    int v6 = [v5 lastPathComponent];
    BOOL v7 = +[NSString stringWithFormat:@"start ir stream failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 724, v7);
    goto LABEL_11;
  }
  return v4;
}

- (int)stopStreaming
{
  if (self->m_isIrEnable)
  {
    int v3 = DeviceCMInterface::stopPearlIrStream(&self->m_diagnosticCMInterface);
    if (v3)
    {
      int v4 = v3;
      unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      int v6 = [v5 lastPathComponent];
      BOOL v7 = +[NSString stringWithFormat:@"stop ir stream failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 742, v7);
LABEL_7:

      return v4;
    }
  }
  if (!self->m_isRgbEnable) {
    return 0;
  }
  int v4 = DeviceCMInterface::stopPearlRgbStream(&self->m_diagnosticCMInterface);
  if (v4)
  {
    unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    int v6 = [v5 lastPathComponent];
    BOOL v7 = +[NSString stringWithFormat:@"stop Rgb stream failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 752, v7);
    goto LABEL_7;
  }
  return v4;
}

- (BOOL)checkConnectivity
{
  DeviceCMInterface::DeviceCMInterface(&v5);
  long long v3 = *(_OWORD *)&v5.m_captureDeviceController;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_hVersion = *(_OWORD *)&v5.m_hVersion;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_captureDeviceController = v3;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbPearlStreamId = *(_OWORD *)&v5.m_streamIdsInfo.rgbPearlStreamId;
  *(void *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.isIrOn = *(void *)&v5.m_currentPearlConfiguration.isIrOn;
  self->m_diagnosticCMInterface.m_currentPearlConfiguration.int bitMaskID = v5.m_currentPearlConfiguration.bitMaskID;
  objc_storeStrong((id *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.deviceName, v5.m_currentPearlConfiguration.deviceName);
  *(_OWORD *)&self->m_diagnosticCMInterface.m_currentJasperConfiguration.isJasperOn = *(_OWORD *)&v5.m_currentJasperConfiguration.isJasperOn;
  DeviceCMInterface::~DeviceCMInterface(&v5);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&self->m_diagnosticCMInterface);
}

- (BOOL)isPortTypeFrontIRDetected
{
  DeviceCMInterface::DeviceCMInterface(&v3);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v3);
}

- (BOOL)isPortTypeFrontRgbDetected
{
  DeviceCMInterface::DeviceCMInterface(&v3);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v3);
}

- (BOOL)isPearlDetected
{
  DeviceCMInterface::DeviceCMInterface(&v5);
  long long v3 = *(_OWORD *)&v5.m_captureDeviceController;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_hVersion = *(_OWORD *)&v5.m_hVersion;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_captureDeviceController = v3;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbPearlStreamId = *(_OWORD *)&v5.m_streamIdsInfo.rgbPearlStreamId;
  *(void *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.isIrOn = *(void *)&v5.m_currentPearlConfiguration.isIrOn;
  self->m_diagnosticCMInterface.m_currentPearlConfiguration.int bitMaskID = v5.m_currentPearlConfiguration.bitMaskID;
  objc_storeStrong((id *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.deviceName, v5.m_currentPearlConfiguration.deviceName);
  *(_OWORD *)&self->m_diagnosticCMInterface.m_currentJasperConfiguration.isJasperOn = *(_OWORD *)&v5.m_currentJasperConfiguration.isJasperOn;
  DeviceCMInterface::~DeviceCMInterface(&v5);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&self->m_diagnosticCMInterface);
}

- (void)performFlow
{
  long long v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
  int v4 = [v3 lastPathComponent];
  int m_timeForStreamInUSec = self->m_timeForStreamInUSec;
  int v6 = decToBinStr(self->m_casesMask);
  BOOL v7 = +[NSString stringWithFormat:@"Start diagnostic flow stream time: %d[sec] cases mask: %@", (m_timeForStreamInUSec / 1000000), v6];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 817, v7);

  uint64_t v35 = 5;
  uint64_t PearlSelfTestResult = getPearlSelfTestResult(&v35);
  id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
  id v10 = [v9 lastPathComponent];
  id v11 = +[NSString stringWithFormat:@"SelfTestResult ret value is %d results %llu", PearlSelfTestResult, v35];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 821, v11);

  self->m_isAllPass = 1;
  self->unsigned int m_resultsCasesMask = 0;
  if ([(Pearl_FW_Status_iOSController *)self checkConnectivity])
  {
    if (![(Pearl_FW_Status_iOSController *)self isPortTypeFrontRgbDetected])
    {
      v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      v13 = [v12 lastPathComponent];
      v14 = +[NSString stringWithFormat:@"Missing FCAM device, tests with FCAM will fail!"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 835, v14);
    }
    if ([(Pearl_FW_Status_iOSController *)self isPortTypeFrontIRDetected])
    {
      if (self->m_scenariosNumber >= 1)
      {
        DeviceCMInterface::DeviceCMInterface(&v34);
        long long v15 = *(_OWORD *)&v34.m_captureDeviceController;
        *(_OWORD *)&self->m_diagnosticCMInterface.m_hVersion = *(_OWORD *)&v34.m_hVersion;
        *(_OWORD *)&self->m_diagnosticCMInterface.m_captureDeviceController = v15;
        *(_OWORD *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbPearlStreamId = *(_OWORD *)&v34.m_streamIdsInfo.rgbPearlStreamId;
        *(void *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.isIrOn = *(void *)&v34.m_currentPearlConfiguration.isIrOn;
        self->m_diagnosticCMInterface.m_currentPearlConfiguration.int bitMaskID = v34.m_currentPearlConfiguration.bitMaskID;
        objc_storeStrong((id *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.deviceName, v34.m_currentPearlConfiguration.deviceName);
        *(_OWORD *)&self->m_diagnosticCMInterface.m_currentJasperConfiguration.isJasperOn = *(_OWORD *)&v34.m_currentJasperConfiguration.isJasperOn;
        DeviceCMInterface::~DeviceCMInterface(&v34);
        PearlDiagnosticInteractor::PearlDiagnosticInteractor((PearlDiagnosticInteractor *)&v34);
        m_delegate = (NSNumber *)v34.m_delegate;
        v34.m_delegate = 0;
        m_gmcResult = self->m_diagnosticInteractor.m_gmcResult;
        self->m_diagnosticInteractor.m_gmcResult = m_delegate;

        m_captureDeviceController = v34.m_captureDeviceController;
        v34.m_captureDeviceController = 0;
        m_gmcPointCount = self->m_diagnosticInteractor.m_gmcPointCount;
        self->m_diagnosticInteractor.m_gmcPointCount = (NSNumber *)m_captureDeviceController;

        *(void *)&self->m_diagnosticInteractor.m_currentPearlConfiguration.isIrOn = *(void *)&v34.m_streamIdsInfo.rgbTeleStreamId;
        self->m_diagnosticInteractor.m_currentPearlConfiguration.int bitMaskID = v34.m_streamIdsInfo.rgbPearlStreamId;
        v20 = *(NSString **)&v34.m_streamIdsInfo.rgbSuperWideStreamId;
        *(void *)&v34.m_streamIdsInfo.rgbSuperWideStreamId = 0;
        deviceName = self->m_diagnosticInteractor.m_currentPearlConfiguration.deviceName;
        self->m_diagnosticInteractor.m_currentPearlConfiguration.deviceName = v20;

        *(void *)&self->m_diagnosticInteractor.m_rgbPearlFramesCount = *(void *)&v34.m_currentPearlConfiguration.isIrOn;
        self->m_diagnosticInteractor.m_irPearlFramesCount = v34.m_currentPearlConfiguration.bitMaskID;

        self->m_diagnosticCMInterface.m_delegate = (StreamingClient *)&self->m_diagnosticInteractor;
        DeviceCMInterface::initAndActivateCaptureDeviceController(&self->m_diagnosticCMInterface);
      }
      id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      CFStringRef v23 = [v22 lastPathComponent];
      unsigned int v24 = +[NSString stringWithFormat:@"Finish diagnostic flow..."];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v23, 972, v24);

      CFStringRef v25 = &off_100034708;
      v26 = self;
      uint64_t v27 = 0;
    }
    else
    {
      v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
      id v32 = [v31 lastPathComponent];
      id v33 = +[NSString stringWithFormat:@"fail with missing PEARL device, cannot dignose pearl"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v32, 840, v33);

      self->m_isAllPass = 0;
      CFStringRef v25 = &off_1000346F0;
      v26 = self;
      uint64_t v27 = 0x8000000;
    }
  }
  else
  {
    v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
    CFStringRef v29 = [v28 lastPathComponent];
    CFStringRef v30 = +[NSString stringWithFormat:@"cannot define camera ststus, connectivity issue detected as camera interfaces cannot be reached"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v29, 829, v30);

    self->m_isAllPass = 0;
    CFStringRef v25 = &off_1000346F0;
    v26 = self;
    uint64_t v27 = 0x2000000;
  }
  [(Pearl_FW_Status_iOSController *)v26 finalizingWithStatusCode:v25 andFinalizingCode:v27];
}

- (void)teardown
{
  long long v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
  int v4 = [v3 lastPathComponent];
  DeviceCMInterface v5 = +[NSString stringWithFormat:@"tear down triggered, verify attention detection status before bailing out"];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 979, v5);

  [(Pearl_FW_Status_iOSController *)self restoreAttentionDetection];

  [(Pearl_FW_Status_iOSController *)self terminateComunication];
}

- (void)cancel
{
  long long v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
  int v4 = [v3 lastPathComponent];
  DeviceCMInterface v5 = +[NSString stringWithFormat:@"cancel triggered, verify attention detection status before bailing out"];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 988, v5);

  [(Pearl_FW_Status_iOSController *)self restoreAttentionDetection];

  [(Pearl_FW_Status_iOSController *)self terminateComunication];
}

- (void)finalizingWithErrorStatusCode:(id)a3 andInfoString:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  [(Pearl_FW_Status_iOSController *)self restoreAttentionDetection];
  BOOL v7 = [(Pearl_FW_Status_iOSController *)self result];
  [v7 setStatusCode:v16];

  m_statusesDict = self->m_statusesDict;
  id v9 = +[NSString stringWithFormat:@"FAIL due to: %@", v6];
  [(NSMutableDictionary *)m_statusesDict setValue:v9 forKey:@"All_PASS_STATUS"];

  id v10 = self->m_statusesDict;
  id v11 = [(Pearl_FW_Status_iOSController *)self result];
  [v11 setData:v10];

  v12 = [(Pearl_FW_Status_iOSController *)self result];
  v13 = [v12 data];
  v14 = [(Pearl_FW_Status_iOSController *)self result];
  long long v15 = [v14 statusCode];
  logMainResults(v13, 8201, (uint64_t)[v15 intValue]);

  [(Pearl_FW_Status_iOSController *)self terminateComunication];
  [(Pearl_FW_Status_iOSController *)self setFinished:1];
}

- (void)finalizingWithStatusCode:(id)a3 andFinalizingCode:(int)a4
{
  id v34 = a3;
  [(Pearl_FW_Status_iOSController *)self restoreAttentionDetection];
  id v6 = +[NSNumber numberWithUnsignedInt:self->m_resultsCasesMask];
  BOOL v7 = [(Pearl_FW_Status_iOSController *)self result];
  [v7 setStatusCode:v6];

  if (![v34 intValue])
  {
    if (a4)
    {
      CFStringRef v12 = @"PASS";
      if (a4 == 0x10000)
      {
        m_statusesDict = self->m_statusesDict;
        if (!self->m_isAllPass) {
          CFStringRef v12 = @"FAIL";
        }
        id v11 = +[NSString stringWithFormat:@"%@, device without pearl", v12];
        [(NSMutableDictionary *)m_statusesDict setValue:v11 forKey:@"All_PASS_STATUS"];
      }
      else
      {
        v18 = self->m_statusesDict;
        if (!self->m_isAllPass) {
          CFStringRef v12 = @"FAIL";
        }
        id v11 = +[NSString stringWithFormat:@"%@, missing information...", v12];
        [(NSMutableDictionary *)v18 setValue:v11 forKey:@"All_PASS_STATUS"];
      }
    }
    else
    {
      id v16 = self->m_statusesDict;
      if (self->m_isAllPass) {
        CFStringRef v17 = @"PASS";
      }
      else {
        CFStringRef v17 = @"FAIL";
      }
      id v11 = +[NSString stringWithFormat:@"%@, (%d passed out of %d)", v17, self->m_passCount, self->m_scenariosNumber];
      [(NSMutableDictionary *)v16 setValue:v11 forKey:@"All_PASS_STATUS"];
    }
    goto LABEL_38;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->m_resultsCasesMask | a4];
  id v9 = [(Pearl_FW_Status_iOSController *)self result];
  [v9 setStatusCode:v8];

  if (a4 >= 0x400000)
  {
    if (a4 <= 0x1FFFFFF)
    {
      if (a4 == 0x400000)
      {
        v20 = self->m_statusesDict;
        id v11 = +[NSString stringWithFormat:@"FAIL, (%d passed out of %d) cannot stop streaming", self->m_passCount, self->m_scenariosNumber];
        [(NSMutableDictionary *)v20 setValue:v11 forKey:@"All_PASS_STATUS"];
        goto LABEL_38;
      }
      if (a4 == 0x800000)
      {
        long long v15 = self->m_statusesDict;
        id v11 = +[NSString stringWithFormat:@"FAIL, (%d passed out of %d) cannot disable sync mode", self->m_passCount, self->m_scenariosNumber];
        [(NSMutableDictionary *)v15 setValue:v11 forKey:@"All_PASS_STATUS"];
        goto LABEL_38;
      }
      goto LABEL_44;
    }
    if (a4 == 0x8000000)
    {
      [(NSMutableDictionary *)self->m_statusesDict setValue:@"FAIL, FAIL_ON_FLOW_ISSUE, missing PEARL" forKey:@"All_PASS_STATUS"];
      goto LABEL_39;
    }
    if (a4 == 0x4000000)
    {
      [(NSMutableDictionary *)self->m_statusesDict setValue:@"FAIL, FAIL_ON_FLOW_ISSUE, missing FCAM" forKey:@"All_PASS_STATUS"];
      goto LABEL_39;
    }
    if (a4 != 0x2000000) {
      goto LABEL_44;
    }
LABEL_36:
    [(NSMutableDictionary *)self->m_statusesDict setValue:@"FAIL, FAIL_ON_FLOW_ISSUE, connectivity issue detected (fail to connect to interfaces)" forKey:@"All_PASS_STATUS"];
    goto LABEL_39;
  }
  if (a4 >= 0x80000)
  {
    switch(a4)
    {
      case 0x80000:
        [(NSMutableDictionary *)self->m_statusesDict setValue:@"FAIL, FAIL_ON_FLOW_ISSUE, cannot activate device" forKey:@"All_PASS_STATUS"];
        goto LABEL_39;
      case 0x100000:
        v19 = self->m_statusesDict;
        id v11 = +[NSString stringWithFormat:@"FAIL, (%d passed out of %d) cannot achieve control on streams", self->m_passCount, self->m_scenariosNumber];
        [(NSMutableDictionary *)v19 setValue:v11 forKey:@"All_PASS_STATUS"];
        goto LABEL_38;
      case 0x200000:
        id v10 = self->m_statusesDict;
        id v11 = +[NSString stringWithFormat:@"FAIL, (%d passed out of %d) cannot start streaming", self->m_passCount, self->m_scenariosNumber];
        [(NSMutableDictionary *)v10 setValue:v11 forKey:@"All_PASS_STATUS"];
LABEL_38:

        goto LABEL_39;
    }
    goto LABEL_44;
  }
  if (a4 == 0x20000)
  {
    [(NSMutableDictionary *)self->m_statusesDict setValue:@"FAIL, FAIL_ON_FLOW_ISSUE, enumeration fail on rgb or ir sensores" forKey:@"All_PASS_STATUS"];
    goto LABEL_36;
  }
  if (a4 == 0x40000)
  {
    v14 = self->m_statusesDict;
    id v11 = +[NSString stringWithFormat:@"FAIL, (%d passed out of %d) Diagnostic bit mask input is not illegal", self->m_passCount, self->m_scenariosNumber];
    [(NSMutableDictionary *)v14 setValue:v11 forKey:@"All_PASS_STATUS"];
    goto LABEL_38;
  }
LABEL_44:
  [(NSMutableDictionary *)self->m_statusesDict setValue:@"FAIL, FAIL_ON_FLOW_ISSUE, unknown flow issue" forKey:@"All_PASS_STATUS"];
LABEL_39:
  if (self->m_isYGErrorDetected)
  {
    CFStringRef v21 = [(Pearl_FW_Status_iOSController *)self result];
    [v21 setStatusCode:&off_100034720];
  }
  id v22 = self->m_statusesDict;
  CFStringRef v23 = [(Pearl_FW_Status_iOSController *)self result];
  [v23 setData:v22];

  unsigned int v24 = [(Pearl_FW_Status_iOSController *)self result];
  CFStringRef v25 = [v24 data];
  v26 = [(Pearl_FW_Status_iOSController *)self result];
  uint64_t v27 = [v26 statusCode];
  logMainResults(v25, 8201, (uint64_t)[v27 intValue]);

  v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"];
  CFStringRef v29 = [v28 lastPathComponent];
  CFStringRef v30 = [(Pearl_FW_Status_iOSController *)self result];
  v31 = [v30 statusCode];
  id v32 = decToBinStr([v31 intValue]);
  id v33 = +[NSString stringWithFormat:@"Ended Diagnostic. diagnostic flow status code %@ and all pass = %d", v32, self->m_isAllPass];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v29, 1074, v33);

  [(Pearl_FW_Status_iOSController *)self terminateComunication];
  [(Pearl_FW_Status_iOSController *)self setFinished:1];
}

- (void)terminateComunication
{
  p_m_diagnosticCMInterface = &self->m_diagnosticCMInterface;
  if (DeviceCMInterface::isActivated(&self->m_diagnosticCMInterface))
  {
    DeviceCMInterface::releaseDevice(p_m_diagnosticCMInterface);
  }
}

- (void).cxx_destruct
{
  p_m_diagnosticInteractor = &self->m_diagnosticInteractor;

  p_m_configurationsList = &self->m_configurationsList;
  sub_10001724C((void ***)&p_m_configurationsList);
  objc_storeStrong((id *)&self->m_statusesDict, 0);
  DeviceCMInterface::~DeviceCMInterface(&self->m_diagnosticCMInterface);
}

- (id).cxx_construct
{
  self->m_configurationsList.__end_ = 0;
  self->m_configurationsList.__end_cap_.__value_ = 0;
  self->m_configurationsList.__begin_ = 0;
  PearlDiagnosticInteractor::PearlDiagnosticInteractor(&self->m_diagnosticInteractor);
  return self;
}

@end