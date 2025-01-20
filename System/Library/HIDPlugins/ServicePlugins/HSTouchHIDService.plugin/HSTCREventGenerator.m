@interface HSTCREventGenerator
+ (id)continousRecordingIDsFomService:(unsigned int)a3;
- (BOOL)isContinuousRecordingReport:(id)a3;
- (HSTCREventGenerator)initWithReportIDs:(id)a3 deviceID:(unint64_t)a4;
- (NSArray)reportIDs;
- (void)handleConsume:(id)a3;
- (void)handleDebugStateEvent:(id)a3;
- (void)handleFrame:(id)a3;
- (void)handleGetPropertyEvent:(id)a3;
- (void)setReportIDs:(id)a3;
@end

@implementation HSTCREventGenerator

+ (id)continousRecordingIDsFomService:(unsigned int)a3
{
  v3 = (id)IORegistryEntrySearchCFProperty(a3, "IOService", @"DefaultProperties", kCFAllocatorDefault, 3u);
  v18 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  v17 = v4;
  id v5 = [v4 objectForKeyedSubscript:@"ContinuousRecordingReportIDs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if ([v6 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(id *)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || !v13 || [v13 unsignedIntValue] > 0xFF)
          {

            id v15 = 0;
            goto LABEL_27;
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v14 = v9;
  }
  else if (v8)
  {
    id v23 = v8;
    id v14 = +[NSArray arrayWithObjects:&v23 count:1];
  }
  else
  {
    id v14 = 0;
  }
  id v15 = v14;
LABEL_27:

  return v15;
}

- (HSTCREventGenerator)initWithReportIDs:(id)a3 deviceID:(unint64_t)a4
{
  id v7 = a3;
  if ([v7 count] && (os_variant_has_internal_diagnostics() & 1) != 0)
  {
    v29.receiver = self;
    v29.super_class = (Class)HSTCREventGenerator;
    id v8 = [(HSStage *)&v29 init];
    id v9 = v8;
    if (v8)
    {
      v8->_deviceID = a4;
      objc_storeStrong((id *)&v8->_reportIDs, a3);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v10 = v7;
      id v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v26;
        while (2)
        {
          id v13 = 0;
          do
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v10);
            }
            unsigned int v14 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)v13), "unsignedIntValue", (void)v25);
            if (v14 >= 0x100)
            {

              id v23 = 0;
              self = v9;
              goto LABEL_15;
            }
            *((unsigned char *)&v31 + v14) = 1;
            id v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      long long v15 = v44;
      *(_OWORD *)&v9->_reportIDTable[192] = v43;
      *(_OWORD *)&v9->_reportIDTable[208] = v15;
      long long v16 = v46;
      *(_OWORD *)&v9->_reportIDTable[224] = v45;
      *(_OWORD *)&v9->_reportIDTable[240] = v16;
      long long v17 = v40;
      *(_OWORD *)&v9->_reportIDTable[128] = v39;
      *(_OWORD *)&v9->_reportIDTable[144] = v17;
      long long v18 = v42;
      *(_OWORD *)&v9->_reportIDTable[160] = v41;
      *(_OWORD *)&v9->_reportIDTable[176] = v18;
      long long v19 = v36;
      *(_OWORD *)&v9->_reportIDTable[64] = v35;
      *(_OWORD *)&v9->_reportIDTable[80] = v19;
      long long v20 = v38;
      *(_OWORD *)&v9->_reportIDTable[96] = v37;
      *(_OWORD *)&v9->_reportIDTable[112] = v20;
      long long v21 = v32;
      *(_OWORD *)v9->_reportIDTable = v31;
      *(_OWORD *)&v9->_reportIDTable[16] = v21;
      long long v22 = v34;
      *(_OWORD *)&v9->_reportIDTable[32] = v33;
      *(_OWORD *)&v9->_reportIDTable[48] = v22;
    }
    self = v9;
    id v23 = self;
  }
  else
  {
    id v23 = 0;
  }
LABEL_15:

  return v23;
}

- (BOOL)isContinuousRecordingReport:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    BOOL v5 = self->_reportIDTable[*(unsigned __int8 *)[v4 bytes]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)handleFrame:(id)a3
{
  id v4 = (id *)a3;
  if ([(HSTCREventGenerator *)self isContinuousRecordingReport:v4[1]])
  {
    mach_absolute_time();
    [v4[1] bytes];
    [v4[1] length];
    id VendorDefinedEvent = (id)IOHIDEventCreateVendorDefinedEvent();
    BOOL v5 = (char **)objc_opt_new();
    std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100](v5 + 1, &VendorDefinedEvent);
    [(HSTCREventGenerator *)self handleConsume:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)HSTCREventGenerator;
  [(HSStage *)&v6 handleConsume:v4];
}

- (void)handleDebugStateEvent:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HSTCREventGenerator handleDebugStateEvent:]");
    [v7 handleFailureInFunction:v8, @"HSTCREventGenerator.mm", 140, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  *((unsigned char *)v4 + 16) = 1;
  v10[0] = @"Stage";
  v10[1] = @"Report IDs";
  v11[0] = @"HSTCREventGenerator";
  BOOL v5 = [(HSTCREventGenerator *)self reportIDs];
  v11[1] = v5;
  objc_super v6 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [*((id *)v4 + 3) addObject:v6];
  v9.receiver = self;
  v9.super_class = (Class)HSTCREventGenerator;
  [(HSStage *)&v9 handleConsume:v4];
}

- (void)handleGetPropertyEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  objc_super v6 = v4 + 2;
  int v7 = *((char *)v4 + 39);
  if (v7 < 0)
  {
    if (v4[3] != 24) {
      goto LABEL_13;
    }
    objc_super v6 = (void *)*v6;
  }
  else if (v7 != 24)
  {
    goto LABEL_13;
  }
  id v8 = (void *)*v6;
  uint64_t v9 = v6[1];
  uint64_t v10 = v6[2];
  if (v8 == (void *)0x69746E6F43444948 && v9 == 0x63655273756F756ELL && v10 == 0x4449676E6964726FLL)
  {
    uint64_t v13 = +[NSString stringWithFormat:@"%s 0x%08llX", "Multitouch ID", self->_deviceID];
    unsigned int v14 = (void *)v5[5];
    v5[5] = v13;

    goto LABEL_14;
  }
LABEL_13:
  v15.receiver = self;
  v15.super_class = (Class)HSTCREventGenerator;
  [(HSStage *)&v15 handleConsume:v4];
LABEL_14:
}

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
    [(HSTCREventGenerator *)self handleFrame:v4];
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      [(HSTCREventGenerator *)self handleDebugStateEvent:v6];
    }
    else
    {
      id v8 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      if (v9)
      {
        [(HSTCREventGenerator *)self handleGetPropertyEvent:v8];
      }
      else
      {
        v10.receiver = self;
        v10.super_class = (Class)HSTCREventGenerator;
        [(HSStage *)&v10 handleConsume:v8];
      }
    }
  }
}

- (NSArray)reportIDs
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setReportIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end