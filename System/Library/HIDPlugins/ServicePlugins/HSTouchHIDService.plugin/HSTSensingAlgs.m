@interface HSTSensingAlgs
- (BOOL)filteredClients;
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (HSTSensingAlgs)initWithConfig:(const HSTSensingAlgsConfig *)a3;
- (HSTSensingAlgsConfig)config;
- (NSNumber)quantizationDPI;
- (SASInterfaceProtocol)planInterface;
- (id).cxx_construct;
- (id)_handleSAFrame:(id)a3;
- (void)_handleCoreAnalytics:(id)a3 payload:(id)a4;
- (void)_handleDriverEvent:(id)a3;
- (void)_handleEvents:(id)a3;
- (void)_handleGetPropertyEvent:(id)a3;
- (void)_handlePencilEvents:(id)a3;
- (void)_handleResetRequest:(unsigned __int8)a3;
- (void)_handleSetPropertyEvent:(id)a3;
- (void)_handleStream:(id)a3;
- (void)_handleTimestampSyncEvent:(id)a3;
- (void)handleConsume:(id)a3;
- (void)setConfig:(HSTSensingAlgsConfig *)a3;
- (void)setFilteredClients:(BOOL)a3;
- (void)setPlanInterface:(id)a3;
- (void)setQuantizationDPI:(id)a3;
@end

@implementation HSTSensingAlgs

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    uint64_t v6 = [(HSTSensingAlgs *)self _handleSAFrame:v4];

    id v7 = (id)v6;
  }
  else
  {
    id v7 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      [(HSTSensingAlgs *)self _handleDriverEvent:v7];
    }
    else
    {
      id v7 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v7;
      }
      else {
        id v9 = 0;
      }

      if (v9)
      {
        [(HSTSensingAlgs *)self _handleResetRequest:0];
      }
      else
      {
        id v7 = v7;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v10 = v7;
        }
        else {
          id v10 = 0;
        }

        if (v10)
        {
          [(HSTSensingAlgs *)self _handleSetPropertyEvent:v7];
        }
        else
        {
          v11 = HSUtil::DynamicCast<HSTGetPropertyEvent>(v7);

          if (v11)
          {
            [(HSTSensingAlgs *)self _handleGetPropertyEvent:v7];
          }
          else
          {
            v12 = HSUtil::DynamicCast<HSTTimestampSyncEvent>(v7);

            if (v12) {
              [(HSTSensingAlgs *)self _handleTimestampSyncEvent:v7];
            }
          }
        }
      }
    }
  }
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)HSTSensingAlgs;
    [(HSStage *)&v13 handleConsume:v7];
  }
}

- (void)_handleSetPropertyEvent:(id)a3
{
  id v4 = (char *)a3;
  id v5 = v4;
  uint64_t v6 = v4 + 16;
  int v7 = v4[39];
  if (v7 < 0)
  {
    uint64_t v9 = *((void *)v4 + 3);
    if (v9 != 13)
    {
      if (v9 != 15) {
        goto LABEL_35;
      }
      if (**(void **)v6 != 0x617A69746E617551 || *(void *)(*(void *)v6 + 7) != 0x4950446E6F697461) {
        goto LABEL_35;
      }
      goto LABEL_24;
    }
    uint64_t v6 = *(char **)v6;
LABEL_18:
    uint64_t v11 = *(void *)v6;
    uint64_t v12 = *(void *)(v6 + 5);
    if (v11 != 0x7369447265766F48 || v12 != 0x64656C6261736944) {
      goto LABEL_35;
    }
    goto LABEL_28;
  }
  if (v4[39] == 13) {
    goto LABEL_18;
  }
  if (v4[39] != 15) {
    goto LABEL_35;
  }
  if (*(void *)v6 != 0x617A69746E617551 || *(void *)(v4 + 23) != 0x4950446E6F697461) {
    goto LABEL_35;
  }
LABEL_24:
  id v14 = *((id *)v4 + 5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = (NSNumber *)v14;
  }
  else {
    v15 = 0;
  }

  quantizationDPI = self->_quantizationDPI;
  self->_quantizationDPI = v15;

  LOBYTE(v7) = v5[39];
LABEL_28:
  v17 = v5 + 16;
  if ((v7 & 0x80) != 0) {
    v17 = (void *)*v17;
  }
  v18 = +[NSString stringWithUTF8String:v17];
  if (([(SASInterfaceProtocol *)self->_planInterface injectProperty:v18 value:*((void *)v5 + 5)] & 1) == 0)
  {
    v19 = MTLoggingPlugin();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[HSTSensingAlgs _handleSetPropertyEvent:]();
    }
  }
LABEL_35:
}

- (HSTSensingAlgs)initWithConfig:(const HSTSensingAlgsConfig *)a3
{
  v40.receiver = self;
  v40.super_class = (Class)HSTSensingAlgs;
  id v4 = [(HSStage *)&v40 init];
  id v5 = v4;
  if (v4)
  {
    p_config = &v4->_config;
    *(_OWORD *)&v4->_config.unint64_t maxPacketSize = *(_OWORD *)&a3->maxPacketSize;
    p_frameworkString = (id *)&v4->_config.frameworkString;
    objc_storeStrong((id *)&v4->_config.frameworkString, a3->frameworkString);
    v5->_config.device = a3->device;
    if (*p_frameworkString) {
      id v8 = (__CFString *)*p_frameworkString;
    }
    else {
      id v8 = @"SensingAlgsService.framework";
    }
    id v10 = +[NSString stringWithFormat:@"%@%@", @"/System/Library/PrivateFrameworks/", v8];
    id v11 = [objc_alloc((Class)NSBundle) initWithPath:v10];
    if ([v11 load])
    {
      uint64_t v12 = (objc_class *)[v11 principalClass];
      if ([(objc_class *)v12 conformsToProtocol:&OBJC_PROTOCOL___SASInterfaceProtocol])
      {
        objc_super v13 = MTLoggingPlugin();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v10;
          _os_log_impl(&def_411C8, v13, OS_LOG_TYPE_DEFAULT, "HSTSensingAlgs: Correctly loaded %{public}@", buf, 0xCu);
        }

        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, v5);
        id v14 = [v12 alloc];
        unint64_t maxPacketSize = p_config->maxPacketSize;
        unint64_t familyID = v5->_config.familyID;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = __33__HSTSensingAlgs_initWithConfig___block_invoke;
        v38[3] = &unk_142D48;
        objc_copyWeak(&v39, (id *)buf);
        v17 = (SASInterfaceProtocol *)[v14 initWithStreamSize:maxPacketSize platformId:familyID streamCallback:v38];
        planInterface = v5->_planInterface;
        v5->_planInterface = v17;

        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = __33__HSTSensingAlgs_initWithConfig___block_invoke_2;
        v36[3] = &unk_142D70;
        objc_copyWeak(&v37, (id *)buf);
        [(SASInterfaceProtocol *)v5->_planInterface setEventCallback:v36];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = __33__HSTSensingAlgs_initWithConfig___block_invoke_3;
        v34[3] = &unk_142D98;
        objc_copyWeak(&v35, (id *)buf);
        [(SASInterfaceProtocol *)v5->_planInterface setResetRequestCallback:v34];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = __33__HSTSensingAlgs_initWithConfig___block_invoke_4;
        v32[3] = &unk_142DC0;
        objc_copyWeak(&v33, (id *)buf);
        [(SASInterfaceProtocol *)v5->_planInterface setCoreAnalyticsCallback:v32];
        v19 = +[NSString stringWithUTF8String:"@(#)PROGRAM:HSTPipeline  PROJECT:MultitouchSoftware-8120.4\n"];
        v20 = [v19 componentsSeparatedByString:@"PROJECT:"];

        if ((unint64_t)[v20 count] >= 2)
        {
          v21 = v5->_planInterface;
          v22 = [v20 objectAtIndexedSubscript:1];
          [(SASInterfaceProtocol *)v21 addVersion:v22];
        }
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_29;
        }
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = __33__HSTSensingAlgs_initWithConfig___block_invoke_5;
        v30[3] = &unk_142D70;
        objc_copyWeak(&v31, (id *)buf);
        [(SASInterfaceProtocol *)v5->_planInterface setPencilEventCallback:v30];
        int v23 = MTDeviceEnableWorkIntervalNotification();
        int v24 = v23;
        if (v23 == -536870201)
        {
          v25 = MTLoggingPlugin();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v29 = 0;
            v26 = "Work interval notification unsupported";
            goto LABEL_25;
          }
        }
        else
        {
          if (v23)
          {
            v25 = MTLoggingPlugin();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[HSTSensingAlgs initWithConfig:](v24, v25);
            }
            goto LABEL_28;
          }
          v25 = MTLoggingPlugin();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v29 = 0;
            v26 = "Work interval notification enabled";
LABEL_25:
            _os_log_impl(&def_411C8, v25, OS_LOG_TYPE_DEFAULT, v26, v29, 2u);
          }
        }
LABEL_28:

        objc_destroyWeak(&v31);
LABEL_29:
        uint64_t v9 = v5;

        objc_destroyWeak(&v33);
        objc_destroyWeak(&v35);
        objc_destroyWeak(&v37);
        objc_destroyWeak(&v39);
        objc_destroyWeak((id *)buf);
        goto LABEL_30;
      }
      v27 = MTLoggingPlugin();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[HSTSensingAlgs initWithConfig:]();
      }
    }
    else
    {
      v27 = MTLoggingPlugin();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[HSTSensingAlgs initWithConfig:]();
      }
    }

    uint64_t v9 = 0;
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v9 = 0;
LABEL_31:

  return v9;
}

void __33__HSTSensingAlgs_initWithConfig___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleStream:v3];
}

void __33__HSTSensingAlgs_initWithConfig___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleEvents:v3];
}

void __33__HSTSensingAlgs_initWithConfig___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleResetRequest:a2];
}

void __33__HSTSensingAlgs_initWithConfig___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleCoreAnalytics:v6 payload:v5];
}

void __33__HSTSensingAlgs_initWithConfig___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handlePencilEvents:v3];
}

- (void)_handleEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (char **)objc_opt_new();
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v15 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v9);
          std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100](v5 + 1, (id *)&v15);
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }

    v10.receiver = self;
    v10.super_class = (Class)HSTSensingAlgs;
    [(HSStage *)&v10 handleConsume:v5];
    MTDeviceNotifyWorkInterval();
  }
}

- (void)_handlePencilEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (char **)objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v16 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v9);
          std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100](v5 + 1, (id *)&v16);
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }

    objc_super v10 = (id *)objc_opt_new();
    objc_storeStrong(v10 + 2, v5);
    v11.receiver = self;
    v11.super_class = (Class)HSTSensingAlgs;
    [(HSStage *)&v11 handleConsume:v10];
    MTDeviceNotifyWorkInterval();
  }
}

- (void)_handleStream:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (self->_filteredClients && [v5 length])
  {
    id v7 = (id *)objc_opt_new();
    objc_storeStrong(v7 + 1, a3);
    v8.receiver = self;
    v8.super_class = (Class)HSTSensingAlgs;
    [(HSStage *)&v8 handleConsume:v7];
  }
}

- (void)_handleCoreAnalytics:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [[HSTAnalyticsEvent alloc] initWithName:v6 payload:v7];
  v9.receiver = self;
  v9.super_class = (Class)HSTSensingAlgs;
  [(HSStage *)&v9 handleConsume:v8];
}

- (void)_handleResetRequest:(unsigned __int8)a3
{
  unsigned __int8 __src = a3;
  memset(v16, 170, sizeof(v16));
  char v15 = 90;
  objc_super v10 = v16;
  long long v11 = xmmword_113850;
  unint64_t v12 = 0xAAAAAAAAAA00AA00;
  uint64_t v13 = 0;
  int inited = SABinaryWriter::initHostRequest((SABinaryWriter *)&v10, 1, 1uLL, &__src);
  id v5 = MTLoggingPlugin();
  id v6 = v5;
  if (inited)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "FW SA Reset Request", buf, 2u);
    }

    id v7 = [HSTSetReportEvent alloc];
    id v6 = [(HSTSetReportEvent *)v7 initWithBuffer:&v15 length:*((void *)&v11 + 1) + 1];
    v8.receiver = self;
    v8.super_class = (Class)HSTSensingAlgs;
    [(HSStage *)&v8 handleConsume:v6];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[HSTSensingAlgs _handleResetRequest:]();
  }
}

- (id)_handleSAFrame:(id)a3
{
  id v5 = (void **)a3;
  if (!v5)
  {
    objc_super v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HSTSensingAlgs.mm", 198, @"Invalid parameter not satisfying: %@", @"frame" object file lineNumber description];
  }
  if (HSTFrameParserTypes::ReportCast<HSTPipeline::FirmwareInterface::InputReport::SABinaryFrame>(v5[1]))
  {
    id v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[HSTSensingAlgs _handleSAFrame:]();
    }

    if (([(SASInterfaceProtocol *)self->_planInterface handleInputStream:v5[1]] & 1) == 0)
    {
      id v7 = MTLoggingPlugin();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[HSTSensingAlgs _handleSAFrame:]();
      }
    }
    if (self->_filteredClients)
    {

      id v5 = 0;
    }
  }
  objc_super v8 = v5;

  return v8;
}

- (void)_handleDriverEvent:(id)a3
{
  id v5 = a3;
  if ([v5 notification] == 5)
  {
    BOOL v4 = 1;
  }
  else
  {
    if ([v5 notification] != 6) {
      goto LABEL_6;
    }
    BOOL v4 = 0;
  }
  self->_filteredClients = v4;
LABEL_6:
}

- (void)_handleGetPropertyEvent:(id)a3
{
  BOOL v4 = (char *)a3;
  id v5 = v4 + 16;
  int v6 = v4[39];
  if (v6 < 0)
  {
    if (*((void *)v4 + 3) != 15) {
      goto LABEL_13;
    }
    id v5 = (void *)*v5;
  }
  else if (v6 != 15)
  {
    goto LABEL_13;
  }
  id v7 = (void *)*v5;
  uint64_t v8 = *(void *)((char *)v5 + 7);
  if (v7 == (void *)0x617A69746E617551 && v8 == 0x4950446E6F697461)
  {
    quantizationDPI = self->_quantizationDPI;
    if (quantizationDPI)
    {
      long long v11 = v4;
      objc_storeStrong((id *)v4 + 5, quantizationDPI);
      BOOL v4 = v11;
    }
  }
LABEL_13:
}

- (void)_handleTimestampSyncEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceTimestampOffsetMs];
  planInterface = self->_planInterface;
  id v7 = +[NSNumber numberWithLongLong:v5];
  LODWORD(planInterface) = [(SASInterfaceProtocol *)planInterface injectProperty:@"TimestampSync" value:v7];

  if (planInterface)
  {
    uint64_t v8 = MTLoggingPlugin();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[HSTSensingAlgs _handleTimestampSyncEvent:]();
    }
  }
  else
  {
    uint64_t v8 = MTLoggingPlugin();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HSTSensingAlgs _handleTimestampSyncEvent:]();
    }
  }
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)97,(char)120,(char)80,(char)97,(char)99,(char)107,(char)101,(char)116,(char)83,(char)105,(char)122,(char)101>::Key, self->_config.maxPacketSize);
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  self->_config.unint64_t maxPacketSize = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)97,(char)120,(char)80,(char)97,(char)99,(char)107,(char)101,(char)116,(char)83,(char)105,(char)122,(char)101>::Key);
  int v4 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    id v5 = basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTSensingAlgs.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTSensingAlgs handleHSDecode:]((uint64_t)v5);
    }
  }
  return v4 == 0;
}

- (HSTSensingAlgsConfig)config
{
  p_config = &self->_config;
  *(_OWORD *)&retstr->unint64_t maxPacketSize = *(_OWORD *)&self->_config.maxPacketSize;
  result = self->_config.frameworkString;
  device = p_config->device;
  retstr->frameworkString = (NSString *)result;
  retstr->device = device;
  return result;
}

- (void)setConfig:(HSTSensingAlgsConfig *)a3
{
  p_config = &self->_config;
  *(_OWORD *)&self->_config.unint64_t maxPacketSize = *(_OWORD *)&a3->maxPacketSize;
  objc_storeStrong((id *)&self->_config.frameworkString, a3->frameworkString);
  p_config->device = a3->device;
  frameworkString = a3->frameworkString;
}

- (SASInterfaceProtocol)planInterface
{
  return self->_planInterface;
}

- (void)setPlanInterface:(id)a3
{
}

- (BOOL)filteredClients
{
  return self->_filteredClients;
}

- (void)setFilteredClients:(BOOL)a3
{
  self->_filteredClients = a3;
}

- (NSNumber)quantizationDPI
{
  return self->_quantizationDPI;
}

- (void)setQuantizationDPI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantizationDPI, 0);

  objc_storeStrong((id *)&self->_planInterface, 0);
}

- (id).cxx_construct
{
  *((void *)self + 20) = 0;
  return self;
}

- (void)initWithConfig:(int)a1 .cold.1(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&def_411C8, a2, OS_LOG_TYPE_ERROR, "Work interval notification returned error: 0x%08X", (uint8_t *)v2, 8u);
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_0(&def_411C8, v0, v1, "HSTSensingAlgs: Provided InterfaceClass does not conform to SASInterfaceProtocol", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&def_411C8, v0, OS_LOG_TYPE_ERROR, "HSTSensingAlgs: Unable to load SensingAlgsService from %{public}@", v1, 0xCu);
}

- (void)_handleResetRequest:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_0(&def_411C8, v0, v1, "Unable to generate SA reset request", v2, v3, v4, v5, v6);
}

- (void)_handleSAFrame:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_0(&def_411C8, v0, v1, "Error handling SA Frame", v2, v3, v4, v5, v6);
}

- (void)_handleSAFrame:.cold.2()
{
  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(&def_411C8, v0, OS_LOG_TYPE_DEBUG, "Processing SA Frame", v1, 2u);
}

- (void)_handleSetPropertyEvent:.cold.1()
{
  OUTLINED_FUNCTION_10();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&def_411C8, v1, OS_LOG_TYPE_ERROR, "Error injecting property %{public}@=%{public}@ in SA", v2, 0x16u);
}

- (void)_handleTimestampSyncEvent:.cold.1()
{
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&def_411C8, v0, OS_LOG_TYPE_DEBUG, "Timestamp sync injected to SA: %lldms", v1, 0xCu);
}

- (void)_handleTimestampSyncEvent:.cold.2()
{
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&def_411C8, v0, OS_LOG_TYPE_ERROR, "Error injecting timestamp sync to SA: %lldms", v1, 0xCu);
}

- (void)handleHSDecode:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1 = 136315906;
  uint64_t v2 = "-[HSTSensingAlgs handleHSDecode:]";
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 324;
  __int16 v7 = 2080;
  uint64_t v8 = "coder";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)&v1, 0x2Au);
}

@end