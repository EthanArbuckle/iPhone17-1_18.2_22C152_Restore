@interface OnDeviceACAM
+ (id)algorithmWithData:(id)a3;
- (BOOL)freshInitNeeded;
- (NSDictionary)bdcOutputBuffer;
- (NSDictionary)freshInitInfo;
- (NSDictionary)runTimeOptions;
- (NSMutableArray)debugLogBuffer;
- (NSMutableArray)runningInfo;
- (NSMutableDictionary)lastBDCOutputTimestamp;
- (NSNumber)runPeriod;
- (NSString)algoDescription;
- (NSString)name;
- (NSString)version;
- (OS_os_log)logger;
- (id)init:(id)a3;
- (id)output;
- (int)freshInitWithData:(id)a3;
- (int)runWithData:(id)a3;
- (unint64_t)runType;
- (void)addToBdcOutputBuffer:(const void *)a3 :(double)a4;
- (void)model;
- (void)multiLog:(id)a3;
- (void)setBdcOutputBuffer:(id)a3;
- (void)setDebugLogBuffer:(id)a3;
- (void)setFreshInitInfo:(id)a3;
- (void)setLastBDCOutputTimestamp:(id)a3;
- (void)setLogger:(id)a3;
- (void)setModel:(void *)a3;
- (void)setRunTimeOptions:(id)a3;
- (void)setRunningInfo:(id)a3;
@end

@implementation OnDeviceACAM

+ (id)algorithmWithData:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__OnDeviceACAM_algorithmWithData___block_invoke;
  v9[3] = &unk_26524ED90;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = +[OnDeviceACAM algorithmWithData:]::onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&+[OnDeviceACAM algorithmWithData:]::onceToken, v9);
  }
  id v7 = (id)+[OnDeviceACAM algorithmWithData:]::instance;

  return v7;
}

uint64_t __34__OnDeviceACAM_algorithmWithData___block_invoke(uint64_t a1)
{
  +[OnDeviceACAM algorithmWithData:]::instance = [objc_alloc(*(Class *)(a1 + 40)) init:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

- (int)freshInitWithData:(id)a3
{
  v70[35] = *(double *)MEMORY[0x263EF8340];
  id v4 = a3;
  v52 = [v4 objectForKey:@"smcData"];
  uint64_t v5 = [v4 objectForKey:@"sbcStreamData"];
  id v6 = [v4 objectForKey:@"obcStreamData"];
  v51 = [v4 objectForKey:@"dailyStreamData"];
  id v7 = (double *)([(OnDeviceACAM *)self model] + 6912);
  ACAMSerialization::Deserialization::setSMCKeyDataFromDictionary(v70, v7, v52);
  v8 = [MEMORY[0x263EFF9D0] null];
  if (([v5 isEqual:v8] & 1) == 0 && objc_msgSend(v5, "count"))
  {
    v9 = [MEMORY[0x263EFF9D0] null];
    if (([v6 isEqual:v9] & 1) == 0 && objc_msgSend(v6, "count"))
    {
      id v10 = [MEMORY[0x263EFF9D0] null];
      if (![v51 isEqual:v10])
      {
        BOOL v12 = [v51 count] == 0;

        if (!v12)
        {
          v63 = 0;
          v64 = 0;
          v65 = 0;
          std::vector<OBCData>::reserve(&v63, [v6 count]);
          for (unint64_t i = 0; i < [v6 count]; ++i)
          {
            v14 = [v6 objectAtIndex:i];
            if (ACAMSerialization::Deserialization::setOBCDataFromDictionary((uint64_t)v57, v14))
            {
              v15 = v64;
              if (v64 >= v65)
              {
                uint64_t v17 = (v64 - (unsigned char *)v63) >> 4;
                unint64_t v18 = v17 + 1;
                if ((unint64_t)(v17 + 1) >> 60) {
                  std::vector<OBCData>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v19 = v65 - (unsigned char *)v63;
                if ((v65 - (unsigned char *)v63) >> 3 > v18) {
                  unint64_t v18 = v19 >> 3;
                }
                if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v20 = v18;
                }
                if (v20) {
                  v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<OBCData>>((uint64_t)&v65, v20);
                }
                else {
                  v21 = 0;
                }
                v22 = &v21[16 * v17];
                *(_OWORD *)v22 = *(_OWORD *)v57;
                v24 = (char *)v63;
                v23 = v64;
                v25 = v22;
                if (v64 != v63)
                {
                  do
                  {
                    *((_OWORD *)v25 - 1) = *((_OWORD *)v23 - 1);
                    v25 -= 16;
                    v23 -= 16;
                  }
                  while (v23 != v24);
                  v23 = (char *)v63;
                }
                v16 = v22 + 16;
                v63 = v25;
                v64 = v22 + 16;
                v65 = &v21[16 * v20];
                if (v23) {
                  operator delete(v23);
                }
              }
              else
              {
                *(_OWORD *)v64 = *(_OWORD *)v57;
                v16 = v15 + 16;
              }
              v64 = v16;
            }
          }
          *(void *)&long long v67 = v63;
          *((void *)&v67 + 1) = (v64 - (unsigned char *)v63) >> 4;
          __p = 0;
          v61 = 0;
          v62 = 0;
          std::vector<SBCData>::reserve(&__p, [v5 count]);
          for (unint64_t j = 0; j < [v5 count]; ++j)
          {
            v27 = [v5 objectAtIndex:j];
            if (ACAMSerialization::Deserialization::setSBCDataFromDictionary((uint64_t)v57, v27))
            {
              v28 = v61;
              if (v61 >= v62)
              {
                v32 = __p;
                unint64_t v33 = 0xCCCCCCCCCCCCCCCDLL * ((v61 - (unsigned char *)__p) >> 3);
                unint64_t v34 = v33 + 1;
                if (v33 + 1 > 0x666666666666666) {
                  std::vector<OBCData>::__throw_length_error[abi:ne180100]();
                }
                if (0x999999999999999ALL * ((v62 - (unsigned char *)__p) >> 3) > v34) {
                  unint64_t v34 = 0x999999999999999ALL * ((v62 - (unsigned char *)__p) >> 3);
                }
                if (0xCCCCCCCCCCCCCCCDLL * ((v62 - (unsigned char *)__p) >> 3) >= 0x333333333333333) {
                  unint64_t v35 = 0x666666666666666;
                }
                else {
                  unint64_t v35 = v34;
                }
                if (v35)
                {
                  v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SBCData>>((uint64_t)&v62, v35);
                  v32 = __p;
                  v28 = v61;
                }
                else
                {
                  v36 = 0;
                }
                v37 = &v36[40 * v33];
                long long v38 = *(_OWORD *)v57;
                long long v39 = v58;
                *((void *)v37 + 4) = v59;
                *(_OWORD *)v37 = v38;
                *((_OWORD *)v37 + 1) = v39;
                if (v28 == v32)
                {
                  v43 = &v36[40 * v33];
                }
                else
                {
                  v40 = &v36[40 * v33];
                  do
                  {
                    long long v41 = *(_OWORD *)((char *)v28 - 40);
                    long long v42 = *(_OWORD *)((char *)v28 - 24);
                    v43 = v40 - 40;
                    *((void *)v40 - 1) = *((void *)v28 - 1);
                    *(_OWORD *)(v40 - 24) = v42;
                    *(_OWORD *)(v40 - 40) = v41;
                    v28 = (_OWORD *)((char *)v28 - 40);
                    v40 -= 40;
                  }
                  while (v28 != v32);
                }
                v31 = v37 + 40;
                __p = v43;
                v61 = v37 + 40;
                v62 = &v36[40 * v35];
                if (v32) {
                  operator delete(v32);
                }
              }
              else
              {
                long long v29 = *(_OWORD *)v57;
                long long v30 = v58;
                *((void *)v61 + 4) = v59;
                _OWORD *v28 = v29;
                v28[1] = v30;
                v31 = (char *)v28 + 40;
              }
              v61 = v31;
            }
          }
          *(void *)&long long v66 = __p;
          *((void *)&v66 + 1) = 0xCCCCCCCCCCCCCCCDLL * ((v61 - (unsigned char *)__p) >> 3);
          v44 = [v51 objectAtIndexedSubscript:0];
          ACAMSerialization::Deserialization::setDailyDataFromDictionary((double *)&v68, (NSString *)v7, v44);

          [(OnDeviceACAM *)self multiLog:@"Performing BDC-based initialization."];
          v45 = [(OnDeviceACAM *)self runTimeOptions];
          v46 = [v45 objectForKeyedSubscript:@"SaveDebugInfo"];
          int v47 = [v46 isEqual:MEMORY[0x263EFFA88]];

          if (v47)
          {
            v57[0] = 0;
            v57[1] = 0;
            *(void *)&long long v58 = 0;
            v48 = [(OnDeviceACAM *)self model];
            v55[0] = v66;
            v55[1] = v67;
            v55[2] = v68;
            uint64_t v56 = v69;
            ACAM::init(v48, (double *)v55);
          }
          v49 = [(OnDeviceACAM *)self model];
          v53[0] = v66;
          v53[1] = v67;
          v53[2] = v68;
          uint64_t v54 = v69;
          ACAM::init(v49, (double *)v53);
        }
LABEL_9:
        [(OnDeviceACAM *)self multiLog:@"BDC Data is not present. Performing fallback initialization"];
        id v11 = [(OnDeviceACAM *)self model];
        ACAM::init(v11, v70[3], v70[1], v70[0]);
      }
    }
  }

  goto LABEL_9;
}

- (id)init:(id)a3
{
  v3 = (void *)((uint64_t (*)(OnDeviceACAM *, SEL))MEMORY[0x270FA5388])(self, a2);
  v90[3] = *MEMORY[0x263EF8340];
  id v63 = v4;
  v64 = [v63 objectForKey:@"smcData"];
  v65 = [v63 objectForKey:@"systemState"];
  long long v66 = [v63 objectForKey:@"savedAlgoState"];
  v70.receiver = v3;
  v70.super_class = (Class)OnDeviceACAM;
  uint64_t v5 = [(OnDeviceACAM *)&v70 init];
  os_log_t v6 = os_log_create("com.apple.batteryalgorithms", "OnDeviceACAM");
  logger = v5->_logger;
  v5->_logger = (OS_os_log *)v6;

  [(OnDeviceACAM *)v5 multiLog:@"OnDeviceACAM: %@", v64];
  name = v5->_name;
  v5->_name = (NSString *)@"OnDeviceACAM";

  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 2);
  version = v5->_version;
  v5->_version = (NSString *)v9;

  algoDescription = v5->_algoDescription;
  v5->_algoDescription = (NSString *)@"Physics-based battery aging model for on-device battery chemistry state.";

  uint64_t v12 = [NSNumber numberWithInt:86400];
  runPeriod = v5->_runPeriod;
  v5->_runPeriod = (NSNumber *)v12;

  uint64_t v15 = OnDeviceACAMUtility::createRuntimeOptions(v14);
  runTimeOptions = v5->_runTimeOptions;
  v5->_runTimeOptions = (NSDictionary *)v15;

  uint64_t v17 = [MEMORY[0x263EFF980] array];
  debugLogBuffer = v5->_debugLogBuffer;
  v5->_debugLogBuffer = (NSMutableArray *)v17;

  uint64_t v19 = [v66 objectForKeyedSubscript:@"kSavedAlgoStateOnDeviceACAMInterface"];
  BOOL v20 = v19 == 0;

  if (v20)
  {
    uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
    lastBDCOutputTimestamp = v5->_lastBDCOutputTimestamp;
    v5->_lastBDCOutputTimestamp = (NSMutableDictionary *)v24;

    [(NSMutableDictionary *)v5->_lastBDCOutputTimestamp setObject:&unk_26FCCD818 forKeyedSubscript:@"SBC"];
    [(NSMutableDictionary *)v5->_lastBDCOutputTimestamp setObject:&unk_26FCCD818 forKeyedSubscript:@"Daily"];
    [(NSMutableDictionary *)v5->_lastBDCOutputTimestamp setObject:&unk_26FCCD818 forKeyedSubscript:@"Weekly"];
  }
  else
  {
    v21 = [v66 objectForKeyedSubscript:@"kSavedAlgoStateOnDeviceACAMInterface"];
    uint64_t v22 = [v21 mutableCopy];
    v23 = v5->_lastBDCOutputTimestamp;
    v5->_lastBDCOutputTimestamp = (NSMutableDictionary *)v22;
  }
  v26 = [v66 objectForKeyedSubscript:@"kSavedAlgoStateOnDeviceACAMFreshInitInfo"];
  BOOL v27 = v26 == 0;

  if (v27)
  {
    uint64_t v31 = [NSDictionary dictionary];
    freshInitInfo = v5->_freshInitInfo;
    v5->_freshInitInfo = (NSDictionary *)v31;
  }
  else
  {
    freshInitInfo = [v66 objectForKeyedSubscript:@"kSavedAlgoStateOnDeviceACAMFreshInitInfo"];
    uint64_t v29 = [freshInitInfo copy];
    long long v30 = v5->_freshInitInfo;
    v5->_freshInitInfo = (NSDictionary *)v29;
  }
  v32 = [v66 objectForKeyedSubscript:@"kSavedAlgoStateOnDeviceACAMRunningInfo"];
  BOOL v33 = v32 == 0;

  if (v33)
  {
    uint64_t v37 = [MEMORY[0x263EFF980] array];
    runningInfo = v5->_runningInfo;
    v5->_runningInfo = (NSMutableArray *)v37;
  }
  else
  {
    runningInfo = [v66 objectForKeyedSubscript:@"kSavedAlgoStateOnDeviceACAMRunningInfo"];
    uint64_t v35 = [runningInfo mutableCopy];
    v36 = v5->_runningInfo;
    v5->_runningInfo = (NSMutableArray *)v35;
  }
  v89[0] = @"SBC";
  long long v38 = [MEMORY[0x263EFF980] array];
  v90[0] = v38;
  v89[1] = @"Daily";
  long long v39 = [MEMORY[0x263EFF980] array];
  v90[1] = v39;
  v89[2] = @"Weekly";
  v40 = [MEMORY[0x263EFF980] array];
  v90[2] = v40;
  uint64_t v41 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:3];
  bdcOutputBuffer = v5->_bdcOutputBuffer;
  v5->_bdcOutputBuffer = (NSDictionary *)v41;

  std::string::basic_string[abi:ne180100]<0>(&v69, "Default");
  v87[0] = @"D37";
  v85[0] = &unk_26FCCBEB8;
  v86[0] = @"D37ATL";
  v85[1] = &unk_26FCCBED0;
  v86[1] = @"D37ATL";
  v85[2] = &unk_26FCCBEE8;
  v86[2] = @"D37ATL";
  v85[3] = &unk_26FCCBF00;
  v86[3] = @"D37ATL";
  v85[4] = &unk_26FCCBF18;
  v86[4] = @"D37ATL";
  v85[5] = &unk_26FCCBF30;
  v86[5] = @"D37ATL";
  v85[6] = &unk_26FCCBF48;
  v86[6] = @"D37ATL";
  v85[7] = &unk_26FCCBF60;
  v86[7] = @"D37ATL";
  v85[8] = &unk_26FCCBF78;
  v86[8] = @"D37ATL";
  v85[9] = &unk_26FCCBF90;
  v86[9] = @"D37ATL";
  v85[10] = &unk_26FCCBFA8;
  v86[10] = @"D37ATL";
  v85[11] = &unk_26FCCBFC0;
  v86[11] = @"D37LGC";
  v85[12] = &unk_26FCCBFD8;
  v86[12] = @"D37LGC";
  v85[13] = &unk_26FCCBFF0;
  v86[13] = @"D37LGC";
  v85[14] = &unk_26FCCC008;
  v86[14] = @"D37LGC";
  v85[15] = &unk_26FCCC020;
  v86[15] = @"D37LGC";
  v85[16] = &unk_26FCCC038;
  v86[16] = @"D37LGC";
  v85[17] = &unk_26FCCC050;
  v86[17] = @"D37LGC";
  v85[18] = &unk_26FCCC068;
  v86[18] = @"D37LGC";
  v85[19] = &unk_26FCCC080;
  v86[19] = @"D37LGC";
  v85[20] = &unk_26FCCC098;
  v86[20] = @"D37LGC";
  v85[21] = &unk_26FCCC0B0;
  v86[21] = @"D37LGC";
  v85[22] = &unk_26FCCC0C8;
  v86[22] = @"D37LGC";
  v85[23] = &unk_26FCCC0E0;
  v86[23] = @"D37LGC";
  v85[24] = &unk_26FCCC0F8;
  v86[24] = @"D37LGC";
  v85[25] = &unk_26FCCC110;
  v86[25] = @"D37LGC";
  v62 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:26];
  v88[0] = v62;
  v87[1] = @"D38";
  v83[0] = &unk_26FCCC128;
  v84[0] = @"D38ATL";
  v83[1] = &unk_26FCCC140;
  v84[1] = @"D38ATL";
  v83[2] = &unk_26FCCC158;
  v84[2] = @"D38ATL";
  v83[3] = &unk_26FCCC170;
  v84[3] = @"D38ATL";
  v83[4] = &unk_26FCCC188;
  v84[4] = @"D38ATL";
  v83[5] = &unk_26FCCC1A0;
  v84[5] = @"D38ATL";
  v83[6] = &unk_26FCCC1B8;
  v84[6] = @"D38ATL";
  v83[7] = &unk_26FCCC1D0;
  v84[7] = @"D38ATL";
  v83[8] = &unk_26FCCC1E8;
  v84[8] = @"D38ATL";
  v83[9] = &unk_26FCCC200;
  v84[9] = @"D38ATL";
  v83[10] = &unk_26FCCC218;
  v84[10] = @"D38ATL";
  v83[11] = &unk_26FCCC230;
  v84[11] = @"D38ATL";
  v83[12] = &unk_26FCCC248;
  v84[12] = @"D38ATL";
  v83[13] = &unk_26FCCC260;
  v84[13] = @"D38ATL";
  v83[14] = &unk_26FCCC278;
  v84[14] = @"D38ATL";
  v83[15] = &unk_26FCCC290;
  v84[15] = @"D38ATL";
  v83[16] = &unk_26FCCC2A8;
  v84[16] = @"D38ATL";
  v83[17] = &unk_26FCCC2C0;
  v84[17] = @"D38ATL";
  v83[18] = &unk_26FCCC2D8;
  v84[18] = @"D38ATL";
  v83[19] = &unk_26FCCC2F0;
  v84[19] = @"D38ATL";
  v83[20] = &unk_26FCCC308;
  v84[20] = @"D38ATL";
  v83[21] = &unk_26FCCC320;
  v84[21] = @"D38ATL";
  v83[22] = &unk_26FCCC338;
  v84[22] = @"D38ATL";
  v83[23] = &unk_26FCCC350;
  v84[23] = @"D38ATL";
  v83[24] = &unk_26FCCC368;
  v84[24] = @"D38LGC";
  v83[25] = &unk_26FCCC380;
  v84[25] = @"D38LGC";
  v83[26] = &unk_26FCCC398;
  v84[26] = @"D38LGC";
  v83[27] = &unk_26FCCC3B0;
  v84[27] = @"D38LGC";
  v83[28] = &unk_26FCCC3C8;
  v84[28] = @"D38LGC";
  v83[29] = &unk_26FCCC3E0;
  v84[29] = @"D38LGC";
  v83[30] = &unk_26FCCC3F8;
  v84[30] = @"D38LGC";
  v83[31] = &unk_26FCCC410;
  v84[31] = @"D38LGC";
  v83[32] = &unk_26FCCC428;
  v84[32] = @"D38LGC";
  v83[33] = &unk_26FCCC440;
  v84[33] = @"D38LGC";
  v83[34] = &unk_26FCCC458;
  v84[34] = @"D38LGC";
  v83[35] = &unk_26FCCC470;
  v84[35] = @"D38LGC";
  v83[36] = &unk_26FCCC488;
  v84[36] = @"D38LGC";
  v83[37] = &unk_26FCCC4A0;
  v84[37] = @"D38LGC";
  v83[38] = &unk_26FCCC4B8;
  v84[38] = @"D38LGC";
  v83[39] = &unk_26FCCC4D0;
  v84[39] = @"D38LGC";
  v83[40] = &unk_26FCCC4E8;
  v84[40] = @"D38LGC";
  v83[41] = &unk_26FCCC500;
  v84[41] = @"D38LGC";
  v43 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:42];
  v88[1] = v43;
  v87[2] = @"D83";
  v81[0] = &unk_26FCCC518;
  v82[0] = @"D83ATL";
  v81[1] = &unk_26FCCC530;
  v82[1] = @"D83ATL";
  v81[2] = &unk_26FCCC548;
  v82[2] = @"D83ATL";
  v81[3] = &unk_26FCCC560;
  v82[3] = @"D83ATL";
  v81[4] = &unk_26FCCC578;
  v82[4] = @"D83ATL";
  v81[5] = &unk_26FCCC590;
  v82[5] = @"D83ATL";
  v81[6] = &unk_26FCCC5A8;
  v82[6] = @"D83ATL";
  v81[7] = &unk_26FCCC5C0;
  v82[7] = @"D83ATL";
  v81[8] = &unk_26FCCC5D8;
  v82[8] = @"D83ATL";
  v81[9] = &unk_26FCCC5F0;
  v82[9] = @"D83ATL";
  v81[10] = &unk_26FCCC608;
  v82[10] = @"D83ATL";
  v81[11] = &unk_26FCCC620;
  v82[11] = @"D83ATL";
  v81[12] = &unk_26FCCC638;
  v82[12] = @"D83ATL";
  v81[13] = &unk_26FCCC650;
  v82[13] = @"D83ATL";
  v81[14] = &unk_26FCCC668;
  v82[14] = @"D83ATL";
  v81[15] = &unk_26FCCC680;
  v82[15] = @"D83ATL";
  v81[16] = &unk_26FCCC698;
  v82[16] = @"D83COS";
  v81[17] = &unk_26FCCC6B0;
  v82[17] = @"D83COS";
  v81[18] = &unk_26FCCC6C8;
  v82[18] = @"D83COS";
  v81[19] = &unk_26FCCC6E0;
  v82[19] = @"D83COS";
  v81[20] = &unk_26FCCC6F8;
  v82[20] = @"D83COS";
  v81[21] = &unk_26FCCC710;
  v82[21] = @"D83COS";
  v81[22] = &unk_26FCCC728;
  v82[22] = @"D83COS";
  v81[23] = &unk_26FCCC740;
  v82[23] = @"D83COS";
  v81[24] = &unk_26FCCC758;
  v82[24] = @"D83COS";
  v81[25] = &unk_26FCCC770;
  v82[25] = @"D83COS";
  v81[26] = &unk_26FCCC788;
  v82[26] = @"D83COS";
  v81[27] = &unk_26FCCC7A0;
  v82[27] = @"D83COS";
  v81[28] = &unk_26FCCC7B8;
  v82[28] = @"D83COS";
  v81[29] = &unk_26FCCC7D0;
  v82[29] = @"D83COS";
  v81[30] = &unk_26FCCC7E8;
  v82[30] = @"D83COS";
  v44 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:31];
  v88[2] = v44;
  v87[3] = @"D84";
  v79[0] = &unk_26FCCC800;
  v80[0] = @"D84ATL";
  v79[1] = &unk_26FCCC818;
  v80[1] = @"D84ATL";
  v79[2] = &unk_26FCCC830;
  v80[2] = @"D84ATL";
  v79[3] = &unk_26FCCC848;
  v80[3] = @"D84ATL";
  v79[4] = &unk_26FCCC860;
  v80[4] = @"D84ATL";
  v79[5] = &unk_26FCCC878;
  v80[5] = @"D84ATL";
  v79[6] = &unk_26FCCC890;
  v80[6] = @"D84ATL";
  v79[7] = &unk_26FCCC8A8;
  v80[7] = @"D84ATL";
  v79[8] = &unk_26FCCC8C0;
  v80[8] = @"D84ATL";
  v79[9] = &unk_26FCCC8D8;
  v80[9] = @"D84ATL";
  v79[10] = &unk_26FCCC8F0;
  v80[10] = @"D84ATL";
  v79[11] = &unk_26FCCC908;
  v80[11] = @"D84ATL";
  v79[12] = &unk_26FCCC920;
  v80[12] = @"D84ATL";
  v79[13] = &unk_26FCCC938;
  v80[13] = @"D84ATL";
  v79[14] = &unk_26FCCC950;
  v80[14] = @"D84ATL";
  v79[15] = &unk_26FCCC968;
  v80[15] = @"D84ATL";
  v79[16] = &unk_26FCCC980;
  v80[16] = @"D84ATL";
  v79[17] = &unk_26FCCC998;
  v80[17] = @"D84ATL";
  v79[18] = &unk_26FCCC9B0;
  v80[18] = @"D84ATL";
  v79[19] = &unk_26FCCC9C8;
  v80[19] = @"D84ATL";
  v79[20] = &unk_26FCCC9E0;
  v80[20] = @"D84ATL";
  v79[21] = &unk_26FCCC9F8;
  v80[21] = @"D84ATL";
  v79[22] = &unk_26FCCCA10;
  v80[22] = @"D84ATL";
  v79[23] = &unk_26FCCCA28;
  v80[23] = @"D84ATL";
  v79[24] = &unk_26FCCCA40;
  v80[24] = @"D84LGC";
  v79[25] = &unk_26FCCCA58;
  v80[25] = @"D84LGC";
  v79[26] = &unk_26FCCCA70;
  v80[26] = @"D84LGC";
  v79[27] = &unk_26FCCCA88;
  v80[27] = @"D84LGC";
  v79[28] = &unk_26FCCCAA0;
  v80[28] = @"D84LGC";
  v79[29] = &unk_26FCCCAB8;
  v80[29] = @"D84LGC";
  v79[30] = &unk_26FCCCAD0;
  v80[30] = @"D84LGC";
  v79[31] = &unk_26FCCCAE8;
  v80[31] = @"D84LGC";
  v79[32] = &unk_26FCCCB00;
  v80[32] = @"D84LGC";
  v79[33] = &unk_26FCCCB18;
  v80[33] = @"D84LGC";
  v79[34] = &unk_26FCCCB30;
  v80[34] = @"D84LGC";
  v79[35] = &unk_26FCCCB48;
  v80[35] = @"D84LGC";
  v79[36] = &unk_26FCCCB60;
  v80[36] = @"D84LGC";
  v79[37] = &unk_26FCCCB78;
  v80[37] = @"D84LGC";
  v79[38] = &unk_26FCCCB90;
  v80[38] = @"D84LGC";
  v79[39] = &unk_26FCCCBA8;
  v80[39] = @"D84LGC";
  v79[40] = &unk_26FCCCBC0;
  v80[40] = @"D84LGC";
  v79[41] = &unk_26FCCCBD8;
  v80[41] = @"D84LGC";
  v79[42] = &unk_26FCCCBF0;
  v80[42] = @"D84LGC";
  v79[43] = &unk_26FCCCC08;
  v80[43] = @"D84LGC";
  v79[44] = &unk_26FCCCC20;
  v80[44] = @"D84LGC";
  v79[45] = &unk_26FCCCC38;
  v80[45] = @"D84LGC";
  v79[46] = &unk_26FCCCC50;
  v80[46] = @"D84LGC";
  v79[47] = &unk_26FCCCC68;
  v80[47] = @"D84LGC";
  v45 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:48];
  v88[3] = v45;
  v87[4] = @"D47";
  v77[0] = &unk_26FCCCC80;
  v78[0] = @"D47ATL";
  v77[1] = &unk_26FCCCC98;
  v78[1] = @"D47ATL";
  v77[2] = &unk_26FCCCCB0;
  v78[2] = @"D47ATL";
  v77[3] = &unk_26FCCCCC8;
  v78[3] = @"D47ATL";
  v77[4] = &unk_26FCCCCE0;
  v78[4] = @"D47ATL";
  v77[5] = &unk_26FCCCCF8;
  v78[5] = @"D47ATL";
  v77[6] = &unk_26FCCCD10;
  v78[6] = @"D47ATL";
  v77[7] = &unk_26FCCCD28;
  v78[7] = @"D47ATL";
  v77[8] = &unk_26FCCCD40;
  v78[8] = @"D47ATL";
  v77[9] = &unk_26FCCCD58;
  v78[9] = @"D47ATL";
  v77[10] = &unk_26FCCCD70;
  v78[10] = @"D47ATL";
  v77[11] = &unk_26FCCCD88;
  v78[11] = @"D47ATL";
  v77[12] = &unk_26FCCCDA0;
  v78[12] = @"D47ATL";
  v77[13] = &unk_26FCCCDB8;
  v78[13] = @"D47ATL";
  v77[14] = &unk_26FCCCDD0;
  v78[14] = @"D47ATL";
  v77[15] = &unk_26FCCCDE8;
  v78[15] = @"D47ATL";
  v77[16] = &unk_26FCCCE00;
  v78[16] = @"D47ATL";
  v77[17] = &unk_26FCCCE18;
  v78[17] = @"D47ATL";
  v77[18] = &unk_26FCCCE30;
  v78[18] = @"D47COS";
  v77[19] = &unk_26FCCCE48;
  v78[19] = @"D47COS";
  v77[20] = &unk_26FCCCE60;
  v78[20] = @"D47COS";
  v77[21] = &unk_26FCCCE78;
  v78[21] = @"D47COS";
  v77[22] = &unk_26FCCCE90;
  v78[22] = @"D47COS";
  v77[23] = &unk_26FCCCEA8;
  v78[23] = @"D47COS";
  v77[24] = &unk_26FCCCEC0;
  v78[24] = @"D47COS";
  v77[25] = &unk_26FCCCED8;
  v78[25] = @"D47COS";
  v77[26] = &unk_26FCCCEF0;
  v78[26] = @"D47COS";
  v77[27] = &unk_26FCCCF08;
  v78[27] = @"D47COS";
  v77[28] = &unk_26FCCCF20;
  v78[28] = @"D47COS";
  v77[29] = &unk_26FCCCF38;
  v78[29] = @"D47COS";
  v77[30] = &unk_26FCCCF50;
  v78[30] = @"D47COS";
  v77[31] = &unk_26FCCCF68;
  v78[31] = @"D47COS";
  v77[32] = &unk_26FCCCF80;
  v78[32] = @"D47COS";
  v77[33] = &unk_26FCCCF98;
  v78[33] = @"D47COS";
  v77[34] = &unk_26FCCCFB0;
  v78[34] = @"D47COS";
  v77[35] = &unk_26FCCCFC8;
  v78[35] = @"D47COS";
  v77[36] = &unk_26FCCCFE0;
  v78[36] = @"D47COS";
  uint64_t v46 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:37];
  v88[4] = v46;
  v87[5] = @"D48";
  v75[0] = &unk_26FCCCFF8;
  v76[0] = @"D48ATL";
  v75[1] = &unk_26FCCD010;
  v76[1] = @"D48ATL";
  v75[2] = &unk_26FCCD028;
  v76[2] = @"D48ATL";
  v75[3] = &unk_26FCCD040;
  v76[3] = @"D48ATL";
  v75[4] = &unk_26FCCD058;
  v76[4] = @"D48ATL";
  v75[5] = &unk_26FCCD070;
  v76[5] = @"D48ATL";
  v75[6] = &unk_26FCCD088;
  v76[6] = @"D48ATL";
  v75[7] = &unk_26FCCD0A0;
  v76[7] = @"D48ATL";
  v75[8] = &unk_26FCCD0B8;
  v76[8] = @"D48ATL";
  v75[9] = &unk_26FCCD0D0;
  v76[9] = @"D48ATL";
  v75[10] = &unk_26FCCD0E8;
  v76[10] = @"D48ATL";
  v75[11] = &unk_26FCCD100;
  v76[11] = @"D48ATL";
  v75[12] = &unk_26FCCD118;
  v76[12] = @"D48ATL";
  v75[13] = &unk_26FCCD130;
  v76[13] = @"D48ATL";
  v75[14] = &unk_26FCCD148;
  v76[14] = @"D48LGC";
  v75[15] = &unk_26FCCD160;
  v76[15] = @"D48LGC";
  v75[16] = &unk_26FCCD178;
  v76[16] = @"D48LGC";
  v75[17] = &unk_26FCCD190;
  v76[17] = @"D48LGC";
  v75[18] = &unk_26FCCD1A8;
  v76[18] = @"D48LGC";
  v75[19] = &unk_26FCCD1C0;
  v76[19] = @"D48LGC";
  v75[20] = &unk_26FCCD1D8;
  v76[20] = @"D48LGC";
  v75[21] = &unk_26FCCD1F0;
  v76[21] = @"D48LGC";
  v75[22] = &unk_26FCCD208;
  v76[22] = @"D48LGC";
  v75[23] = &unk_26FCCD220;
  v76[23] = @"D48LGC";
  v75[24] = &unk_26FCCD238;
  v76[24] = @"D48LGC";
  v75[25] = &unk_26FCCD250;
  v76[25] = @"D48LGC";
  v75[26] = &unk_26FCCD268;
  v76[26] = @"D48LGC";
  v75[27] = &unk_26FCCD280;
  v76[27] = @"D48LGC";
  v75[28] = &unk_26FCCD298;
  v76[28] = @"D48LGC";
  v75[29] = &unk_26FCCD2B0;
  v76[29] = @"D48LGC";
  v75[30] = &unk_26FCCD2C8;
  v76[30] = @"D48LGC";
  v75[31] = &unk_26FCCD2E0;
  v76[31] = @"D48LGC";
  int v47 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:32];
  v88[5] = v47;
  v87[6] = @"D93";
  v74[0] = @"D93ATL";
  v73[0] = &unk_26FCCD2F8;
  v73[1] = &unk_26FCCD310;
  v74[1] = @"D93ATL";
  v74[2] = @"D93ATL";
  v73[2] = &unk_26FCCD328;
  v73[3] = &unk_26FCCD340;
  v74[3] = @"D93ATL";
  v74[4] = @"D93ATL";
  v73[4] = &unk_26FCCD358;
  v73[5] = &unk_26FCCD370;
  v74[5] = @"D93ATL";
  v74[6] = @"D93ATL";
  v73[6] = &unk_26FCCD388;
  v73[7] = &unk_26FCCD3A0;
  v74[7] = @"D93ATL";
  v74[8] = @"D93ATL";
  v73[8] = &unk_26FCCD3B8;
  v73[9] = &unk_26FCCD3D0;
  v74[9] = @"D93ATL";
  v74[10] = @"D93ATL";
  v73[10] = &unk_26FCCD3E8;
  v73[11] = &unk_26FCCD400;
  v74[11] = @"D93ATL";
  v74[12] = @"D93ATL";
  v73[12] = &unk_26FCCD418;
  v73[13] = &unk_26FCCD430;
  v74[13] = @"D93ATL";
  v74[14] = @"D93ATL";
  v73[14] = &unk_26FCCD448;
  v73[15] = &unk_26FCCD460;
  v74[15] = @"D93ATL";
  v74[16] = @"D93ATL";
  v73[16] = &unk_26FCCD478;
  v73[17] = &unk_26FCCD490;
  v74[17] = @"D93ATL";
  v73[18] = &unk_26FCCD4A8;
  v74[18] = @"D93ATL";
  v73[19] = &unk_26FCCD4C0;
  v74[19] = @"D93ATL";
  v73[20] = &unk_26FCCD4D8;
  v74[20] = @"D93ATL";
  v73[21] = &unk_26FCCD4F0;
  v74[21] = @"D93ATL";
  v73[22] = &unk_26FCCD508;
  v74[22] = @"D93ATL";
  v73[23] = &unk_26FCCD520;
  v74[23] = @"D93ATL";
  v73[24] = &unk_26FCCD538;
  v74[24] = @"D93ATL";
  v48 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:25];
  v88[6] = v48;
  v87[7] = @"D94";
  v71[0] = &unk_26FCCD550;
  v71[1] = &unk_26FCCD568;
  v72[1] = @"D94ATL";
  v72[2] = @"D94ATL";
  v71[2] = &unk_26FCCD580;
  v71[3] = &unk_26FCCD598;
  v72[3] = @"D94ATL";
  v72[4] = @"D94ATL";
  v71[4] = &unk_26FCCD5B0;
  v71[5] = &unk_26FCCD5C8;
  v72[5] = @"D94ATL";
  v72[6] = @"D94ATL";
  v71[6] = &unk_26FCCD5E0;
  v71[7] = &unk_26FCCD5F8;
  v72[7] = @"D94ATL";
  v72[8] = @"D94ATL";
  v71[8] = &unk_26FCCD610;
  v71[9] = &unk_26FCCD628;
  v72[9] = @"D94LGC";
  v72[10] = @"D94LGC";
  v71[10] = &unk_26FCCD640;
  v71[11] = &unk_26FCCD658;
  v72[11] = @"D94LGC";
  v72[12] = @"D94LGC";
  v71[12] = &unk_26FCCD670;
  v71[13] = &unk_26FCCD688;
  v72[13] = @"D94LGC";
  v72[14] = @"D94LGC";
  v71[14] = &unk_26FCCD6A0;
  v71[15] = &unk_26FCCD6B8;
  v71[16] = &unk_26FCCD6D0;
  v71[17] = &unk_26FCCD6E8;
  v72[15] = @"D94LGC";
  v72[16] = @"D94LGC";
  v71[18] = &unk_26FCCD700;
  v71[19] = &unk_26FCCD718;
  v72[17] = @"D94LGC";
  v72[18] = @"D94LGC";
  v71[20] = &unk_26FCCD730;
  v72[0] = @"D94ATL";
  v72[19] = @"D94LGC";
  v72[20] = @"D94LGC";
  v49 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:21];
  v88[7] = v49;
  v50 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:8];

  v51 = [v65 objectForKeyedSubscript:@"DeviceType"];
  v52 = [v50 objectForKeyedSubscript:v51];
  LOBYTE(v46) = v52 == 0;

  if ((v46 & 1) == 0)
  {
    uint64_t v54 = [v65 objectForKeyedSubscript:@"DeviceType"];
    v55 = [v50 objectForKeyedSubscript:v54];

    uint64_t v56 = [v64 objectForKeyedSubscript:@"AlgoChemID"];
    v57 = [v55 objectForKeyedSubscript:v56];
    BOOL v58 = v57 == 0;

    if (!v58)
    {
      uint64_t v59 = [v64 objectForKeyedSubscript:@"AlgoChemID"];
      id v60 = [v55 objectForKeyedSubscript:v59];
      std::string::basic_string[abi:ne180100](&__dst, (void *)[v60 UTF8String], objc_msgSend(v60, "lengthOfBytesUsingEncoding:", 4));

      if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v69.__r_.__value_.__l.__data_);
      }
      std::string v69 = __dst;
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
      __dst.__r_.__value_.__s.__data_[0] = 0;
    }
  }
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v67, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
  }
  else {
    std::string v67 = v69;
  }
  ACAMUtility::ACAMParameterPack::ACAMParameterPack((uint64_t)&__dst, (ACAMUtility *)&v67, v53);
}

- (void)addToBdcOutputBuffer:(const void *)a3 :(double)a4
{
  std::string::basic_string[abi:ne180100]<0>(__p, "SBC");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = v7[40];
  if (v31 < 0) {
    operator delete(__p[0]);
  }
  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithDouble:a4];
    id v10 = [(OnDeviceACAM *)self lastBDCOutputTimestamp];
    [v10 setObject:v9 forKeyedSubscript:@"SBC"];

    id v11 = [(OnDeviceACAM *)self bdcOutputBuffer];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"SBC"];
    v13 = [(OnDeviceACAM *)self model];
    uint64_t v15 = ACAMSerialization::Serialization::createBDCSBCFromACAM(v13, v14, a4);
    [v12 addObject:v15];
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "Daily");
  v16 = std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v16) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v17 = v16[40];
  if (v31 < 0)
  {
    operator delete(__p[0]);
    if (!v17) {
      goto LABEL_12;
    }
LABEL_11:
    unint64_t v18 = [NSNumber numberWithDouble:a4];
    uint64_t v19 = [(OnDeviceACAM *)self lastBDCOutputTimestamp];
    [v19 setObject:v18 forKeyedSubscript:@"Daily"];

    [(OnDeviceACAM *)self bdcOutputBuffer];
    [(id)objc_claimAutoreleasedReturnValue() objectForKeyedSubscript:@"Daily"];
    objc_claimAutoreleasedReturnValue();
    BOOL v20 = [(OnDeviceACAM *)self model];
    ACAMSerialization::Serialization::createBDCDailyFromACAM(v20, v21, a4, v22, v23);
  }
  if (v16[40]) {
    goto LABEL_11;
  }
LABEL_12:
  std::string::basic_string[abi:ne180100]<0>(__p, "Weekly");
  uint64_t v24 = std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v24) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v25 = v24[40];
  if ((v31 & 0x80000000) == 0)
  {
    if (!v24[40]) {
      return;
    }
LABEL_17:
    v26 = [NSNumber numberWithDouble:a4];
    BOOL v27 = [(OnDeviceACAM *)self lastBDCOutputTimestamp];
    [v27 setObject:v26 forKeyedSubscript:@"Weekly"];

    [(OnDeviceACAM *)self bdcOutputBuffer];
    [(id)objc_claimAutoreleasedReturnValue() objectForKeyedSubscript:@"Weekly"];
    objc_claimAutoreleasedReturnValue();
    v28 = [(OnDeviceACAM *)self model];
    ACAMSerialization::Serialization::createBDCWeeklyFromACAM(v28, v29, a4);
  }
  operator delete(__p[0]);
  if (v25) {
    goto LABEL_17;
  }
}

- (int)runWithData:(id)a3
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v89 = a3;
  v94 = [v89 objectForKey:@"amaStreamData"];
  v90 = [v89 objectForKey:@"smcData"];
  ACAMSerialization::Deserialization::setSMCKeyDataFromDictionary((double *)&v117, (double *)([(OnDeviceACAM *)self model] + 6912), v90);
  uint64_t v4 = [v94 count];
  [(OnDeviceACAM *)self multiLog:@"%lu 1Hz data received ", v4];
  uint64_t v114 = 0;
  uint64_t v115 = 0;
  uint64_t v116 = 0;
  std::string::basic_string[abi:ne180100]<0>(v118, "SBC");
  v100[1] = 0;
  *(void *)&long long v101 = 0;
  v100[0] = &v100[1];
  std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100]<true,0>(&v120, (long long *)v118, (uint64_t)v100);
  std::string::basic_string[abi:ne180100]<0>(v110, "Daily");
  v108 = 0;
  uint64_t v109 = 0;
  v107 = &v108;
  std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100]<true,0>((std::string *)v123, (long long *)v110, (uint64_t)&v107);
  std::string::basic_string[abi:ne180100]<0>(__p, "Weekly");
  v104[0] = 0;
  v104[1] = 0;
  v103 = v104;
  std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100]<true,0>(v125, (long long *)__p, (uint64_t)&v103);
  std::unordered_map<std::string,std::set<unsigned long>>::unordered_map((uint64_t)v112, (unsigned __int8 *)&v120, 3);
  for (unint64_t i = 0; i != -144; i -= 48)
  {
    std::__tree<unsigned long>::destroy((uint64_t)&v125[i / 0x18 + 1], (void *)v125[1].__r_.__value_.__r.__words[i / 8 + 1]);
    if (SHIBYTE(v125[0].__r_.__value_.__r.__words[i / 8 + 2]) < 0) {
      operator delete(v125[i / 0x18].__r_.__value_.__l.__data_);
    }
  }
  std::__tree<unsigned long>::destroy((uint64_t)&v103, v104[0]);
  if (v106 < 0) {
    operator delete(__p[0]);
  }
  std::__tree<unsigned long>::destroy((uint64_t)&v107, v108);
  if (v111 < 0) {
    operator delete(v110[0]);
  }
  std::__tree<unsigned long>::destroy((uint64_t)v100, (void *)v100[1]);
  if (v119 < 0) {
    operator delete(v118[0]);
  }
  os_log_t v6 = [(OnDeviceACAM *)self model];
  uint64_t v91 = v4;
  if (v4)
  {
    uint64_t v97 = 0;
    uint64_t v98 = 0;
    uint64_t v7 = 0;
    uint64_t v92 = 0;
    double v8 = v6[3528];
    char v9 = 1;
    double v10 = -1.0;
    do
    {
      id v11 = [v94 objectAtIndexedSubscript:v7];
      unsigned int v12 = ACAMSerialization::Deserialization::setSmartBatteryDataFromDictionary((uint64_t)v100, v11);
      if (v102 > v8) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = 0;
      }
      unsigned int v95 = v13;
      unsigned int v96 = v12;
      if (v13)
      {
        if (!__CFADD__(v92++, 1)) {
          double v10 = v102;
        }
        uint64_t v15 = v11;
        if (v9)
        {
          memset(&v120, 0, sizeof(v120));
          std::vector<std::vector<SmartBatteryData>>::push_back[abi:ne180100](&v114, (uint64_t)&v120);
          if (v120.__r_.__value_.__r.__words[0])
          {
            v120.__r_.__value_.__l.__size_ = v120.__r_.__value_.__r.__words[0];
            operator delete(v120.__r_.__value_.__l.__data_);
          }
        }
        uint64_t v16 = v115;
        unint64_t v17 = *(void *)(v115 - 16);
        unint64_t v18 = *(void *)(v115 - 8);
        if (v17 >= v18)
        {
          uint64_t v22 = (void **)(v115 - 24);
          uint64_t v23 = *(void *)(v115 - 24);
          unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v17 - v23) >> 3);
          unint64_t v25 = v24 + 1;
          if (v24 + 1 > 0x666666666666666) {
            std::vector<OBCData>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v26 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18 - v23) >> 3);
          if (2 * v26 > v25) {
            unint64_t v25 = 2 * v26;
          }
          if (v26 >= 0x333333333333333) {
            unint64_t v27 = 0x666666666666666;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27) {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SBCData>>(v115 - 8, v27);
          }
          else {
            v28 = 0;
          }
          uint64_t v29 = (double *)&v28[40 * v24];
          long long v30 = *(_OWORD *)v100;
          long long v31 = v101;
          v29[4] = v102;
          *(_OWORD *)uint64_t v29 = v30;
          *((_OWORD *)v29 + 1) = v31;
          BOOL v33 = *(double **)(v16 - 24);
          v32 = *(double **)(v16 - 16);
          unint64_t v34 = v29;
          if (v32 != v33)
          {
            do
            {
              long long v35 = *(_OWORD *)(v32 - 5);
              long long v36 = *(_OWORD *)(v32 - 3);
              *(v34 - 1) = *(v32 - 1);
              *(_OWORD *)(v34 - 3) = v36;
              *(_OWORD *)(v34 - 5) = v35;
              v34 -= 5;
              v32 -= 5;
            }
            while (v32 != v33);
            v32 = (double *)*v22;
          }
          v21 = (char *)(v29 + 5);
          *(void *)(v16 - 24) = v34;
          *(void *)(v16 - 16) = v29 + 5;
          *(void *)(v16 - 8) = &v28[40 * v27];
          if (v32) {
            operator delete(v32);
          }
        }
        else
        {
          long long v19 = *(_OWORD *)v100;
          long long v20 = v101;
          *(double *)(v17 + 32) = v102;
          *(_OWORD *)unint64_t v17 = v19;
          *(_OWORD *)(v17 + 16) = v20;
          v21 = (char *)(v17 + 40);
        }
        *(void *)(v16 - 16) = v21;
        id v99 = [(OnDeviceACAM *)self lastBDCOutputTimestamp];
        id v93 = v94;
        v110[0] = (void *)(-1 - 0x5555555555555555 * ((v115 - v114) >> 3));
        id v11 = v15;
        std::string::basic_string[abi:ne180100]<0>(&v120, "SBC");
        uint64_t v121 = 0x4072C00000000000;
        std::string::basic_string[abi:ne180100]<0>(v122, "Daily");
        *(void *)&v123[8] = 0x40F5180000000000;
        std::string::basic_string[abi:ne180100]<0>(&v123[16], "Weekly");
        uint64_t v124 = 0x4122750000000000;
        std::unordered_map<std::string,double>::unordered_map((uint64_t)v118, (unsigned __int8 *)&v120, 3);
        for (uint64_t j = 0; j != -96; j -= 32)
        {
          if ((char)v123[j + 39] < 0) {
            operator delete(*(void **)&v123[j + 16]);
          }
        }
        long long v38 = [v93 objectAtIndexedSubscript:v7];
        long long v39 = [v38 objectForKeyedSubscript:@"Timestamp"];
        [v39 doubleValue];
        double v41 = v40;

        long long v42 = v113;
        if (v113)
        {
          char v9 = 0;
          do
          {
            if (*((char *)v42 + 39) < 0) {
              std::string::__init_copy_ctor_external(&v120, (const std::string::value_type *)v42[2], v42[3]);
            }
            else {
              std::string v120 = *(std::string *)(v42 + 2);
            }
            v43 = NSString;
            int v44 = SHIBYTE(v120.__r_.__value_.__r.__words[2]);
            std::string::size_type v45 = v120.__r_.__value_.__r.__words[0];
            uint64_t v46 = [NSString defaultCStringEncoding];
            if (v44 >= 0) {
              int v47 = &v120;
            }
            else {
              int v47 = (std::string *)v45;
            }
            v48 = [v43 stringWithCString:v47 encoding:v46];
            if (v42[7])
            {
              v49 = v42 + 6;
              v50 = (void *)v42[6];
              id v11 = v15;
              if (v50)
              {
                do
                {
                  v51 = v50;
                  v50 = (void *)v50[1];
                }
                while (v50);
              }
              else
              {
                do
                {
                  v51 = (void *)v49[2];
                  BOOL v52 = *v51 == (void)v49;
                  v49 = v51;
                }
                while (v52);
              }
              double v53 = *(double *)(*(void *)(v114 + 24 * v51[4] + 8) - 8);
            }
            else
            {
              id v11 = v15;
              uint64_t v54 = [v99 objectForKeyedSubscript:v48];
              [v54 doubleValue];
              double v53 = v55;
            }
            uint64_t v56 = std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::find<std::string>(v118, (unsigned __int8 *)&v120);
            if (!v56) {
              std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
            }
            if (v41 - v53 > *((double *)v56 + 5))
            {
              std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t **)v42 + 5, (unint64_t *)v110, (uint64_t *)v110);
              char v9 = 1;
            }

            if (SHIBYTE(v120.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v120.__r_.__value_.__l.__data_);
            }
            long long v42 = (uint64_t *)*v42;
          }
          while (v42);
        }
        else
        {
          char v9 = 0;
        }
        std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::~__hash_table((uint64_t)v118);
      }
      v98 += v96 ^ 1;
      v97 += v96 ^ v95;
      ++v7;
    }
    while (v7 != v91);
  }
  else
  {
    uint64_t v92 = 0;
    uint64_t v97 = 0;
    uint64_t v98 = 0;
    double v10 = -1.0;
  }
  [(OnDeviceACAM *)self multiLog:@"%lu valid 1Hz data found out of %lu.\n- %lu are invalid records\n- %lu have overlapping timestamp with SBC\n- %lu chunks identified\n", v92, v91, v98, v97, 0xAAAAAAAAAAAAAAABLL * ((v115 - v114) >> 3)];
  [(OnDeviceACAM *)self multiLog:@"Running OnDeviceACAM"];
  v57 = [(OnDeviceACAM *)self runTimeOptions];
  BOOL v58 = [v57 objectForKeyedSubscript:@"SaveDebugInfo"];
  int v59 = [v58 isEqual:MEMORY[0x263EFFA88]];

  if (v59)
  {
    id v60 = [(OnDeviceACAM *)self debugLogBuffer];
    v62 = OnDeviceACAMUtility::createDebugLogItem((OnDeviceACAMUtility *)@"SMC Key for Running OnDeviceACAM", v90, v61);
    [v60 addObject:v62];
  }
  if (v115 == v114) {
    goto LABEL_110;
  }
  unint64_t v63 = 0;
  v64 = "Daily";
LABEL_73:
  std::string::basic_string[abi:ne180100]<0>(v100, "SBC");
  v65 = std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(v112, (unsigned __int8 *)v100);
  if (!v65) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  for (k = (void *)*((void *)v65 + 6); k; k = (void *)*k)
  {
    unint64_t v67 = k[4];
    if (v63 >= v67)
    {
      if (v67 >= v63)
      {
        char v68 = 1;
LABEL_81:
        std::string::basic_string[abi:ne180100]<0>(&v120, "SBC");
        LOBYTE(v121) = v68;
        std::string::basic_string[abi:ne180100]<0>(v110, v64);
        std::string v69 = std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(v112, (unsigned __int8 *)v110);
        if (!v69) {
          std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
        }
        objc_super v70 = (void *)*((void *)v69 + 6);
        if (!v70)
        {
LABEL_87:
          char v72 = 0;
          goto LABEL_89;
        }
        while (1)
        {
          unint64_t v71 = v70[4];
          if (v63 >= v71)
          {
            if (v71 >= v63)
            {
              char v72 = 1;
LABEL_89:
              std::string::basic_string[abi:ne180100]<0>(v122, v64);
              v123[8] = v72;
              std::string::basic_string[abi:ne180100]<0>(&v107, "Weekly");
              v73 = std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(v112, (unsigned __int8 *)&v107);
              if (!v73) {
                std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
              }
              for (m = (void *)*((void *)v73 + 6); m; m = (void *)*m)
              {
                unint64_t v75 = m[4];
                if (v63 >= v75)
                {
                  if (v75 >= v63)
                  {
                    char v76 = 1;
                    goto LABEL_97;
                  }
                  ++m;
                }
              }
              char v76 = 0;
LABEL_97:
              std::string::basic_string[abi:ne180100]<0>(&v123[16], "Weekly");
              LOBYTE(v124) = v76;
              std::unordered_map<std::string,BOOL>::unordered_map((uint64_t)v118, (unsigned __int8 *)&v120, 3);
              for (uint64_t n = 0; n != -96; n -= 32)
              {
                if ((char)v123[n + 39] < 0) {
                  operator delete(*(void **)&v123[n + 16]);
                }
              }
              if (SHIBYTE(v109) < 0) {
                operator delete(v107);
              }
              if (v111 < 0) {
                operator delete(v110[0]);
              }
              v78 = v64;
              if (SBYTE7(v101) < 0) {
                operator delete(v100[0]);
              }
              memset(&v120, 0, sizeof(v120));
              v79 = [(OnDeviceACAM *)self runTimeOptions];
              v80 = [v79 objectForKeyedSubscript:@"SaveDebugInfo"];
              [v80 isEqual:MEMORY[0x263EFFA88]];

              v81 = [(OnDeviceACAM *)self model];
              ACAM::runOnce(v81, *(void *)(v114 + 24 * v63), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(v114 + 24 * v63 + 8) - *(void *)(v114 + 24 * v63)) >> 3));
              v82 = (ACAMPersistentStates *)v120.__r_.__value_.__r.__words[0];
              if (v120.__r_.__value_.__r.__words[0])
              {
                do
                {
                  objc_msgSend(NSString, "stringWithFormat:", @"Running result: intermediate state #%lu", 1);
                  v83 = (NSString *)objc_claimAutoreleasedReturnValue();
                  saveSnapshotIntoDebugBuffer(self, v82, v83);

                  v82 = (ACAMPersistentStates *)*((void *)v82 + 100);
                }
                while (v82);
              }
              [(OnDeviceACAM *)self addToBdcOutputBuffer:v118 :*(double *)(*(void *)(v114 + 24 * v63 + 8) - 8)];
              simpleList<ACAMPersistentStates>::clear(&v120);
              std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::~__hash_table((uint64_t)v118);
              ++v63;
              v64 = v78;
              if (v63 >= 0xAAAAAAAAAAAAAAABLL * ((v115 - v114) >> 3))
              {
LABEL_110:
                [(OnDeviceACAM *)self multiLog:@"Finished"];
                v84 = [(OnDeviceACAM *)self model];
                ACAMSerialization::Serialization::createBDCDailyFromACAM(v84, v85, v10, v86, v87);
              }
              goto LABEL_73;
            }
            ++v70;
          }
          objc_super v70 = (void *)*v70;
          if (!v70) {
            goto LABEL_87;
          }
        }
      }
      ++k;
    }
  }
  char v68 = 0;
  goto LABEL_81;
}

- (id)output
{
  v30[13] = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  uint64_t v23 = 0;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  long long __p = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  ACAMPersistentStates::retrieve((ACAMPersistentStates *)v16, (const ACAM *)[(OnDeviceACAM *)self model]);
  v3 = [(OnDeviceACAM *)self runTimeOptions];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"SaveDebugInfo"];
  int v5 = [v4 isEqual:MEMORY[0x263EFFA88]];

  if (v5) {
    [(OnDeviceACAM *)self multiLog:@"Persistent state is generated"];
  }
  v30[5] = @"savedAlgoState";
  v29[0] = @"kSavedAlgoStateOnDeviceACAMInterface";
  v30[0] = [(OnDeviceACAM *)self lastBDCOutputTimestamp];
  v29[1] = @"kSavedAlgoStateOnDeviceACAMCoreAlgo";
  v30[1] = ACAMSerialization::Serialization::createDiskStateFromPersistentState((ACAMSerialization::Serialization *)v16, v6);
  v29[2] = @"kSavedAlgoStateOnDeviceACAMDebugLog";
  uint64_t v15 = [(OnDeviceACAM *)self debugLogBuffer];
  v30[2] = deep_copy_object(v15);
  v29[3] = @"kSavedAlgoStateOnDeviceACAMRunningInfo";
  uint64_t v7 = [(OnDeviceACAM *)self runningInfo];
  v30[3] = deep_copy_object(v7);
  v29[4] = @"kSavedAlgoStateOnDeviceACAMFreshInitInfo";
  double v8 = [(OnDeviceACAM *)self freshInitInfo];
  v30[4] = deep_copy_object(v8);
  v30[9] = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:5];
  v30[6] = @"kBDCOutputData";
  char v9 = [(OnDeviceACAM *)self bdcOutputBuffer];
  v30[10] = deep_copy_object(v9);
  v30[11] = MEMORY[0x263EFFA78];
  v30[7] = @"kPowerLogData";
  v30[8] = @"kCoreAnalyticsData";
  double v10 = [(OnDeviceACAM *)self model];
  ACAMSerialization::Serialization::createCoreAnalyticsFromACAM(v10, v11, v12, v13);
}

- (void)multiLog:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F08790]);
  [v5 setDateFormat:@"YYYY-MM-dd HH:m:s.SSS"];
  os_log_t v6 = [MEMORY[0x263EFF910] now];
  uint64_t v7 = [v5 stringFromDate:v6];
  double v8 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v30];
  char v9 = [NSString stringWithFormat:@"[%@] %@", v7, v8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_248B51000, logger, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
  }
  id v11 = [(OnDeviceACAM *)self runTimeOptions];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"WriteStdOut"];
  int v13 = [v12 isEqual:MEMORY[0x263EFFA88]];

  if (v13)
  {
    id v14 = v9;
    std::string::basic_string[abi:ne180100](&buf, (void *)[v14 UTF8String], objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 4));

    uint64_t v15 = (v28 & 0x80u) == 0 ? &buf : (long long *)buf;
    uint64_t v16 = (v28 & 0x80u) == 0 ? v28 : *((void *)&buf + 1);
    uint64_t v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)v15, v16);
    std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
    long long v18 = std::locale::use_facet(&v26, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
    std::locale::~locale(&v26);
    std::ostream::put();
    std::ostream::flush();
    if ((char)v28 < 0) {
      operator delete((void *)buf);
    }
  }
  long long v19 = [(OnDeviceACAM *)self runTimeOptions];
  long long v20 = [v19 objectForKeyedSubscript:@"SaveDebugInfo"];
  int v21 = [v20 isEqual:MEMORY[0x263EFFA88]];

  if (v21)
  {
    debugLogBuffer = self->_debugLogBuffer;
    uint64_t v23 = [MEMORY[0x263EFF9D0] null];
    uint64_t v25 = OnDeviceACAMUtility::createDebugLogItem((OnDeviceACAMUtility *)v9, v23, v24);
    [(NSMutableArray *)debugLogBuffer addObject:v25];
  }
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)algoDescription
{
  return self->_algoDescription;
}

- (NSNumber)runPeriod
{
  return self->_runPeriod;
}

- (unint64_t)runType
{
  return self->_runType;
}

- (BOOL)freshInitNeeded
{
  return self->_freshInitNeeded;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void)model
{
  return self->_model;
}

- (void)setModel:(void *)a3
{
  self->_model = a3;
}

- (NSMutableDictionary)lastBDCOutputTimestamp
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastBDCOutputTimestamp:(id)a3
{
}

- (NSDictionary)bdcOutputBuffer
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBdcOutputBuffer:(id)a3
{
}

- (NSMutableArray)debugLogBuffer
{
  return self->_debugLogBuffer;
}

- (void)setDebugLogBuffer:(id)a3
{
}

- (NSDictionary)runTimeOptions
{
  return self->_runTimeOptions;
}

- (void)setRunTimeOptions:(id)a3
{
}

- (NSDictionary)freshInitInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFreshInitInfo:(id)a3
{
}

- (NSMutableArray)runningInfo
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRunningInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningInfo, 0);
  objc_storeStrong((id *)&self->_freshInitInfo, 0);
  objc_storeStrong((id *)&self->_runTimeOptions, 0);
  objc_storeStrong((id *)&self->_debugLogBuffer, 0);
  objc_storeStrong((id *)&self->_bdcOutputBuffer, 0);
  objc_storeStrong((id *)&self->_lastBDCOutputTimestamp, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_runPeriod, 0);
  objc_storeStrong((id *)&self->_algoDescription, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end