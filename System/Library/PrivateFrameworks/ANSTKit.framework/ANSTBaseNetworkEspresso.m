@interface ANSTBaseNetworkEspresso
+ (BOOL)supportsANE;
+ (id)tracingEntryFormat;
- ($C4732ECC957FA13B9B3DF4A51A95735B)network;
- ($F613A077D53D3D97A8E0FDF5BAE1891D)preprocessor;
- ($FD4688982923A924290ECB669CAF1EC2)createEsressoTensorDimension:(unint64_t *)a3 dtype:(int)a4;
- ($FD4688982923A924290ECB669CAF1EC2)getTensorByName:(const char *)a3;
- (ANSTBaseNetworkEspresso)initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5;
- (ANSTBaseNetworkEspresso)initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5 networkFileName:(id)a6;
- (ANSTBaseNetworkEspresso)initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5 networkResolution:(id)a6;
- (ANSTBaseNetworkEspresso)initWithNetworkPath:(id)a3 engine:(int64_t)a4 networkMode:(id)a5 directAccessOutputBuffer:(BOOL)a6;
- (BOOL)bindNetworkInputWithEspressoBuffer:(id *)a3 withInputName:(id)a4;
- (BOOL)bindNetworkInputWithImage:(__CVBuffer *)a3 withInputName:(id)a4;
- (BOOL)bindNetworkOutput:(const char *)a3;
- (BOOL)buildPlan;
- (BOOL)enablePreprocess;
- (BOOL)getBlobDimensionByName:(const char *)a3 andDestination:(unint64_t *)a4;
- (BOOL)initContext;
- (BOOL)initMLNetwork;
- (BOOL)initNetwork;
- (BOOL)initNetworkOutput;
- (BOOL)initPlan;
- (BOOL)isUsingANE;
- (BOOL)prepare;
- (BOOL)runNetwork;
- (BOOL)setInput:(id)a3 fromCVPixelBuffer:(__CVBuffer *)a4;
- (BOOL)setInput:(id)a3 fromRawPointer:(const void *)a4;
- (BOOL)supportFloat16IO;
- (BOOL)supportZeroCopyOutput;
- (BOOL)switchConfiguration:(id)a3;
- (BOOL)useManagedBuffers;
- (BOOL)validateNetworkOutputDimension;
- (CGSize)getResolutionByBlobName:(const char *)a3;
- (NSSet)disabledOutputSet;
- (NSString)networkResolution;
- (__CVBuffer)getOutPixelBufferByName:(const char *)a3;
- (id).cxx_construct;
- (id)_initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5 networkFileName:(id)a6 networkResolution:(id)a7;
- (id)description;
- (id)getOpsForLibrary;
- (id)networkVersion;
- (id)tracingEntry;
- (int)planPriority;
- (int64_t)engineType;
- (unint64_t)getInputChannels:(id)a3;
- (unint64_t)getInputHeight:(id)a3;
- (unint64_t)getInputLength:(id)a3;
- (unint64_t)getInputWidth:(id)a3;
- (unint64_t)getOutputChannels:(id)a3;
- (unint64_t)getOutputHeight:(id)a3;
- (unint64_t)getOutputLength:(id)a3;
- (unint64_t)getOutputRowElements:(id)a3;
- (unint64_t)getOutputWidth:(id)a3;
- (void)cleanUpOutputPixelBufferMap;
- (void)context;
- (void)dealloc;
- (void)getRawOutput:(id)a3;
- (void)plan;
- (void)setExpectedDimension:(const char *)a3 andDimension:(unint64_t *)a4;
- (void)updateOutputBlobMap;
@end

@implementation ANSTBaseNetworkEspresso

+ (BOOL)supportsANE
{
  if (qword_2691E43B0 != -1) {
    dispatch_once(&qword_2691E43B0, &unk_26FB41148);
  }
  return byte_2691E43B8;
}

- (ANSTBaseNetworkEspresso)initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5
{
  return (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkResolution_(self, a2, a3, *(void *)&a4, a5, &stru_26FB41648);
}

- (ANSTBaseNetworkEspresso)initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5 networkFileName:(id)a6
{
  return (ANSTBaseNetworkEspresso *)MEMORY[0x270F9A6D0](self, sel__initWithNetworkEngine_qualityOfService_networkName_networkFileName_networkResolution_, a3);
}

- (ANSTBaseNetworkEspresso)initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5 networkResolution:(id)a6
{
  return (ANSTBaseNetworkEspresso *)MEMORY[0x270F9A6D0](self, sel__initWithNetworkEngine_qualityOfService_networkName_networkFileName_networkResolution_, a3);
}

- (id)_initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5 networkFileName:(id)a6 networkResolution:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v26 = a6;
  id v27 = a7;
  v13 = (void *)MEMORY[0x263F086E0];
  uint64_t v14 = objc_opt_class();
  v16 = objc_msgSend_bundleForClass_(v13, v15, v14);
  v18 = objc_msgSend_pathForResource_ofType_inDirectory_(v16, v17, (uint64_t)v12, @"mlmodelc", @"Models");
  objc_storeStrong((id *)&self->_netPath, v18);
  objc_storeStrong((id *)&self->_netFileName, a6);
  self->_engineType = a3;
  HIDWORD(v20) = a4 - 9;
  LODWORD(v20) = a4 - 9;
  unsigned int v19 = v20 >> 3;
  if (v19 > 3) {
    int v21 = 0;
  }
  else {
    int v21 = dword_246D9ED40[v19];
  }
  self->_planPriority = v21;
  self->_isPrepared = 0;
  objc_storeStrong((id *)&self->_networkResolution, a7);
  v22 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    netPath = self->_netPath;
    netFileName = self->_netFileName;
    *(_DWORD *)buf = 138543618;
    v29 = netPath;
    __int16 v30 = 2114;
    v31 = netFileName;
    _os_log_impl(&dword_246D53000, v22, OS_LOG_TYPE_DEFAULT, "ANSTBaseNetworkEspresso initialized with network path %{public}@, network file name %{public}@", buf, 0x16u);
  }

  return self;
}

- (BOOL)prepare
{
  objc_msgSend_preSetup(self, a2, v2);
  int inited = objc_msgSend_initMLNetwork(self, v4, v5);
  if (inited)
  {
    objc_msgSend_postSetup(self, v6, v7);
    self->_isPrepared = 1;
  }
  return inited;
}

- (id)networkVersion
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (espresso_network_get_version())
  {
    uint64_t v2 = @"Unknown";
  }
  else
  {
    id v3 = [NSString alloc];
    uint64_t v2 = (__CFString *)objc_msgSend_initWithUTF8String_(v3, v4, (uint64_t)v6);
  }
  return v2;
}

- (BOOL)isUsingANE
{
  int v4 = objc_msgSend_supportsANE(ANSTBaseNetworkEspresso, a2, v2);
  if (v4) {
    LOBYTE(v4) = self->_engineType == 0;
  }
  return v4;
}

- ($FD4688982923A924290ECB669CAF1EC2)createEsressoTensorDimension:(unint64_t *)a3 dtype:(int)a4
{
}

- (BOOL)initMLNetwork
{
  if (!objc_msgSend_initContext(self, a2, v2)
    || !objc_msgSend_initPlan(self, v4, v5)
    || !objc_msgSend_initNetwork(self, v6, v7)
    || !objc_msgSend_buildPlan(self, v8, v9)
    || !objc_msgSend_validateNetworkOutputDimension(self, v10, v11))
  {
    return 0;
  }
  return objc_msgSend_initNetworkOutput(self, v12, v13);
}

- (BOOL)buildPlan
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_enablePreprocess) {
    objc_msgSend_initPreprocess(self, a2, v2);
  }
  int v3 = espresso_plan_build();
  if (v3)
  {
    int v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t last_error = espresso_get_last_error();
      sub_246D98478(last_error, v7);
    }
  }
  return v3 == 0;
}

- (BOOL)initContext
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int64_t engineType = self->_engineType;
  if (engineType == 2)
  {
    int v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_246D53000, v4, OS_LOG_TYPE_DEFAULT, "Using CPU", v10, 2u);
    }
  }
  else if (engineType == 1)
  {
    int v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_246D53000, v4, OS_LOG_TYPE_DEFAULT, "Using GPU", v10, 2u);
    }
  }
  else if (engineType)
  {
    int v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_246D98544(engineType, v4);
    }
  }
  else
  {
    int v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_246D53000, v4, OS_LOG_TYPE_DEFAULT, "Using ANE", v10, 2u);
    }
  }

  context = (void *)espresso_create_context();
  self->_context = context;
  if (!context)
  {
    v6 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t last_error = espresso_get_last_error();
      sub_246D984BC(last_error, v10);
    }
    goto LABEL_20;
  }
  if (espresso_context_set_low_precision_accumulation())
  {
    v6 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = espresso_get_last_error();
      sub_246D98500(v7, v10);
    }
LABEL_20:

    return 0;
  }
  return 1;
}

- (BOOL)initPlan
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan)
  {
    int v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t last_error = espresso_get_last_error();
      sub_246D985D0(last_error, v8);
    }
    goto LABEL_7;
  }
  if (espresso_plan_set_priority())
  {
    int v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = espresso_get_last_error();
      sub_246D98614(v5, v8);
    }
LABEL_7:

    return 0;
  }
  return 1;
}

- (BOOL)initNetwork
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  netPath = self->_netPath;
  if (netPath)
  {
    objc_msgSend_stringByAppendingPathComponent_(netPath, a2, (uint64_t)self->_netFileName);
    int v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v4, v5, v6);
    int v9 = espresso_plan_add_network();
    if (v9)
    {
      v10 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v22 = self->_netPath;
        int v23 = 138543874;
        v24 = v22;
        __int16 v25 = 1024;
        int v26 = v9;
        __int16 v27 = 2082;
        uint64_t last_error = espresso_get_last_error();
        _os_log_fault_impl(&dword_246D53000, v10, OS_LOG_TYPE_FAULT, "%{public}@: espresso_plan_add_network failed with status %d (%{public}s)", (uint8_t *)&v23, 0x1Cu);
      }
    }
    else
    {
      networkResolution = self->_networkResolution;
      if (!networkResolution
        || (objc_msgSend_isEqualToString_(networkResolution, v7, (uint64_t)&stru_26FB41648) & 1) != 0
        || (objc_msgSend_UTF8String(self->_networkResolution, v7, v8),
            !espresso_network_select_configuration()))
      {
        objc_msgSend_updateOutputBlobMap(self, v7, v8);
        BOOL v18 = 1;
        goto LABEL_9;
      }
      v10 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = espresso_get_last_error();
        sub_246D986D0(v21, &v23);
      }
    }
  }
  else
  {
    int v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D98658(v4, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  BOOL v18 = 0;
LABEL_9:

  return v18;
}

- (void)updateOutputBlobMap
{
  p_outputBufferMap = &self->_outputBufferMap;
  sub_246D59144((uint64_t)&self->_outputBufferMap);
  uint64_t output_blob_name = espresso_get_output_blob_name();
  if (output_blob_name)
  {
    int v4 = (char *)output_blob_name;
    uint64_t v5 = 1;
    do
    {
      sub_246D58EA4(v8, v4);
      uint64_t v7 = 0;
      memset(v6, 0, sizeof(v6));
      sub_246D591E8((uint64_t)p_outputBufferMap, (unsigned __int8 *)v8, (uint64_t)v8, (uint64_t)v6);
      if (v9 < 0) {
        operator delete(v8[0]);
      }
      int v4 = (char *)espresso_get_output_blob_name();
      ++v5;
    }
    while (v4);
  }
}

- (BOOL)validateNetworkOutputDimension
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  next = (char *)self->_expectedDimensions.__table_.__p1_.__value_.__next_;
  if (!next) {
    return 1;
  }
  while (1)
  {
    memset(v9, 0, sizeof(v9));
    uint64_t v4 = (uint64_t)(next + 16);
    if (next[39] < 0) {
      uint64_t v4 = *((void *)next + 2);
    }
    objc_msgSend_getBlobDimensionByName_andDestination_(self, a2, v4, v9);
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      v6 &= *(void *)((char *)v9 + v5) == *(void *)(*((void *)next + 5) + v5);
      v5 += 8;
    }
    while (v5 != 32);
    if ((v6 & 1) == 0) {
      break;
    }
    next = *(char **)next;
    if (!next) {
      return 1;
    }
  }
  uint64_t v8 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_246D98714(next + 39, (void *)next + 2, v8);
  }

  return 0;
}

- (void)setExpectedDimension:(const char *)a3 andDimension:(unint64_t *)a4
{
  v10[0] = 0;
  v10[1] = 0;
  uint64_t v11 = 0;
  sub_246D59034(v10, a4, (uint64_t)(a4 + 4), 4uLL);
  sub_246D58EA4(__p, (char *)a3);
  uint64_t v12 = __p;
  char v6 = sub_246D59CB8((uint64_t)&self->_expectedDimensions, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v12);
  uint64_t v7 = (void *)*((void *)v6 + 5);
  if (v7)
  {
    *((void *)v6 + 6) = v7;
    operator delete(v7);
    *((void *)v6 + 5) = 0;
    *((void *)v6 + 6) = 0;
    *((void *)v6 + 7) = 0;
  }
  *(_OWORD *)(v6 + 40) = *(_OWORD *)v10;
  *((void *)v6 + 7) = v11;
  v10[1] = 0;
  uint64_t v11 = 0;
  v10[0] = 0;
  if (v9 < 0)
  {
    operator delete(__p[0]);
    if (v10[0])
    {
      v10[1] = v10[0];
      operator delete(v10[0]);
    }
  }
}

- (BOOL)getBlobDimensionByName:(const char *)a3 andDestination:(unint64_t *)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int blob_dimensions = espresso_network_query_blob_dimensions();
  if (blob_dimensions)
  {
    char v6 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t last_error = espresso_get_last_error();
      sub_246D987A4((uint64_t)a3, last_error, v9);
    }
  }
  return blob_dimensions == 0;
}

- (BOOL)initNetworkOutput
{
  for (i = (char *)self->_outputBufferMap.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    uint64_t v4 = i + 16;
    if (i[39] < 0) {
      uint64_t v4 = (void *)*v4;
    }
    objc_msgSend_bindNetworkOutput_(self, a2, (uint64_t)v4);
  }
  return 1;
}

- (BOOL)bindNetworkInputWithImage:(__CVBuffer *)a3 withInputName:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a4;
  objc_msgSend_UTF8String(v4, v5, v6);
  int v7 = espresso_network_bind_cvpixelbuffer();
  if (v7)
  {
    uint64_t v8 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = v4;
      uint64_t v12 = objc_msgSend_UTF8String(v9, v10, v11);
      uint64_t last_error = espresso_get_last_error();
      sub_246D987EC(v12, last_error, v15);
    }
  }
  return v7 == 0;
}

- (BOOL)bindNetworkInputWithEspressoBuffer:(id *)a3 withInputName:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a4;
  objc_msgSend_UTF8String(v4, v5, v6);
  int v7 = espresso_network_bind_buffer();
  if (v7)
  {
    uint64_t v8 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = v4;
      uint64_t v12 = objc_msgSend_UTF8String(v9, v10, v11);
      uint64_t last_error = espresso_get_last_error();
      sub_246D98834(v12, last_error, v15);
    }
  }
  return v7 == 0;
}

- (BOOL)bindNetworkOutput:(const char *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  disabledOutputSet = self->_disabledOutputSet;
  uint64_t v6 = objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)a3);
  LOBYTE(disabledOutputSet) = objc_msgSend_containsObject_(disabledOutputSet, v7, (uint64_t)v6);

  if ((disabledOutputSet & 1) == 0)
  {
    sub_246D58EA4(__p, (char *)a3);
    if (!sub_246D5A5E4(&self->_outputBufferMap.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p)) {
      sub_246D5A010("unordered_map::at: key not found");
    }
    if (v12 < 0) {
      operator delete(__p[0]);
    }
    if (!espresso_network_bind_buffer()) {
      return 1;
    }
    uint64_t v8 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t last_error = espresso_get_last_error();
      sub_246D9887C(last_error, __p);
    }
  }
  return 0;
}

- ($FD4688982923A924290ECB669CAF1EC2)getTensorByName:(const char *)a3
{
  p_outputBufferMap = &self->_outputBufferMap;
  sub_246D58EA4(__p, (char *)a3);
  uint64_t v8 = __p;
  id v4 = sub_246D5A0A0((uint64_t)p_outputBufferMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v8);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return ($FD4688982923A924290ECB669CAF1EC2 *)(v4 + 40);
}

- (__CVBuffer)getOutPixelBufferByName:(const char *)a3
{
  p_outputPixelBufMap = &self->_outputPixelBufMap;
  sub_246D58EA4(__p, (char *)a3);
  uint64_t v8 = __p;
  id v4 = (__CVBuffer *)*((void *)sub_246D5A358((uint64_t)p_outputPixelBufMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v8)+ 5);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return v4;
}

- (CGSize)getResolutionByBlobName:(const char *)a3
{
  v5[4] = *MEMORY[0x263EF8340];
  objc_msgSend_getBlobDimensionByName_andDestination_(self, a2, (uint64_t)a3, v5);
  double v3 = (double)v5[0];
  double v4 = (double)v5[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)switchConfiguration:(id)a3
{
  id v4 = a3;
  char v7 = objc_msgSend_networkResolution(self, v5, v6);
  char isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)v4);

  if (isEqualToString) {
    goto LABEL_2;
  }
  objc_msgSend_cleanUpOutputPixelBufferMap(self, v10, v11);
  objc_msgSend_plan(self, v13, v14);
  espresso_plan_build_clean();
  id v15 = v4;
  objc_msgSend_UTF8String(v15, v16, v17);
  if (espresso_network_select_configuration())
  {
    unint64_t v20 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_246D98A28((uint64_t)self, v20);
    }

    goto LABEL_18;
  }
  objc_msgSend_updateOutputBlobMap(self, v18, v19);
  if ((objc_msgSend_buildPlan(self, v21, v22) & 1) == 0)
  {
    __int16 v27 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_246D989B0(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_17;
  }
  if ((objc_msgSend_validateNetworkOutputDimension(self, v23, v24) & 1) == 0)
  {
    __int16 v27 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_246D98938(v27, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_17;
  }
  if ((objc_msgSend_initNetworkOutput(self, v25, v26) & 1) == 0)
  {
    __int16 v27 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_246D988C0(v27, v42, v43, v44, v45, v46, v47, v48);
    }
LABEL_17:

LABEL_18:
    BOOL v12 = 0;
    goto LABEL_19;
  }
  objc_storeStrong((id *)&self->_networkResolution, v15);
LABEL_2:
  BOOL v12 = 1;
LABEL_19:

  return v12;
}

- (unint64_t)getInputChannels:(id)a3
{
  id v3 = a3;
  objc_msgSend_UTF8String(v3, v4, v5);
  if (espresso_network_query_blob_dimensions()) {
    unint64_t v6 = -1;
  }
  else {
    unint64_t v6 = v8;
  }

  return v6;
}

- (unint64_t)getInputHeight:(id)a3
{
  id v3 = a3;
  objc_msgSend_UTF8String(v3, v4, v5);
  if (espresso_network_query_blob_dimensions()) {
    unint64_t v6 = -1;
  }
  else {
    unint64_t v6 = v8;
  }

  return v6;
}

- (unint64_t)getInputWidth:(id)a3
{
  id v3 = a3;
  objc_msgSend_UTF8String(v3, v4, v5);
  if (espresso_network_query_blob_dimensions()) {
    unint64_t v6 = -1;
  }
  else {
    unint64_t v6 = v8;
  }

  return v6;
}

- (unint64_t)getInputLength:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_246D58EA4(__p, v7);
  id v15 = __p;
  sub_246D5A0A0((uint64_t)&self->_input_espresso_buffer, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v15);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  id v15 = 0;
  uint64_t v8 = espresso_buffer_unpack_tensor_shape();
  if (v8)
  {
    id v9 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246D98AB8((uint64_t)v4, v8, v9);
    }

    unint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = v15;
    if (v15)
    {
      BOOL v12 = __p;
      unint64_t v10 = 1;
      do
      {
        uint64_t v13 = (uint64_t)*v12++;
        v10 *= v13;
        uint64_t v11 = (void **)((char *)v11 - 1);
      }
      while (v11);
    }
    else
    {
      unint64_t v10 = 1;
    }
  }

  return v10;
}

- (unint64_t)getOutputChannels:(id)a3
{
  id v3 = a3;
  objc_msgSend_UTF8String(v3, v4, v5);
  if (espresso_network_query_blob_dimensions()) {
    unint64_t v6 = -1;
  }
  else {
    unint64_t v6 = v8;
  }

  return v6;
}

- (unint64_t)getOutputHeight:(id)a3
{
  id v4 = a3;
  char v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_246D58EA4(__p, v7);
  BOOL v12 = __p;
  unint64_t v8 = *((void *)sub_246D5A0A0((uint64_t)&self->_outputBufferMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v12)+ 16);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (unint64_t)getOutputRowElements:(id)a3
{
  id v4 = a3;
  char v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_246D58EA4(__p, v7);
  BOOL v12 = __p;
  unint64_t v8 = *((void *)sub_246D5A0A0((uint64_t)&self->_outputBufferMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v12)+ 15);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (unint64_t)getOutputWidth:(id)a3
{
  id v4 = a3;
  char v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_246D58EA4(__p, v7);
  BOOL v12 = __p;
  unint64_t v8 = *((void *)sub_246D5A0A0((uint64_t)&self->_outputBufferMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v12)+ 15);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (void)getRawOutput:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_UTF8String(v4, v5, v6);
  id v9 = *(void **)objc_msgSend_getTensorByName_(self, v8, v7);

  return v9;
}

- (unint64_t)getOutputLength:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_UTF8String(v4, v5, v6);
  objc_msgSend_getTensorByName_(self, v8, v7);
  uint64_t v9 = espresso_buffer_unpack_tensor_shape();
  if (v9)
  {
    unint64_t v10 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_246D98B44((uint64_t)v4, v9, v10);
    }

    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v11 = 1;
  }

  return v11;
}

- (id)getOpsForLibrary
{
  uint64_t v2 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_246D98BD0(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return 0;
}

- (BOOL)runNetwork
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = espresso_plan_execute_sync();
  if (v3)
  {
    uint64_t v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      netPath = self->_netPath;
      int v7 = 138543874;
      uint64_t v8 = netPath;
      __int16 v9 = 1024;
      int v10 = v3;
      __int16 v11 = 2082;
      uint64_t last_error = espresso_get_last_error();
      _os_log_fault_impl(&dword_246D53000, v4, OS_LOG_TYPE_FAULT, "%{public}@: espresso_plan_execute_sync failed with status %d (%{public}s)", (uint8_t *)&v7, 0x1Cu);
    }
  }
  return v3 == 0;
}

- (BOOL)setInput:(id)a3 fromCVPixelBuffer:(__CVBuffer *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_isPrepared)
  {
    if (CVPixelBufferGetPixelFormatType(a4) == 1111970369 || CVPixelBufferGetPixelFormatType(a4) == 1278226488)
    {
      char v8 = objc_msgSend_bindNetworkInputWithImage_withInputName_(self, v7, (uint64_t)a4, v6);
    }
    else
    {
      id v17 = v6;
      unint64_t v20 = (char *)objc_msgSend_UTF8String(v17, v18, v19);
      sub_246D58EA4(__p, v20);
      if (sub_246D5A5E4(&self->_input_espresso_buffer.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p)) {
        goto LABEL_9;
      }
      v37.i64[0] = (uint64_t)__p;
      *((_DWORD *)sub_246D5A6E8((uint64_t)&self->_input_espresso_buffer, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v37)+ 50) = 65568;
      id v24 = v17;
      uint64_t v27 = objc_msgSend_UTF8String(v24, v25, v26);
      objc_msgSend_getBlobDimensionByName_andDestination_(self, v28, v27, &v37);
      int8x16_t v35 = vextq_s8(v38, v38, 8uLL);
      int8x16_t v36 = vextq_s8(v37, v37, 8uLL);
      v34[0] = (long long *)__p;
      sub_246D5A6E8((uint64_t)&self->_input_espresso_buffer, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, v34);
      if (!espresso_buffer_pack_tensor_shape())
      {
LABEL_9:
        CVPixelBufferLockBaseAddress(a4, 0);
        BaseAddress = CVPixelBufferGetBaseAddress(a4);
        v37.i64[0] = (uint64_t)__p;
        *((void *)sub_246D5A6E8((uint64_t)&self->_input_espresso_buffer, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v37)+ 5) = BaseAddress;
        v37.i64[0] = (uint64_t)__p;
        uint64_t v22 = sub_246D5A6E8((uint64_t)&self->_input_espresso_buffer, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v37);
        char v8 = objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self, v23, (uint64_t)(v22 + 40), v17);
        CVPixelBufferUnlockBaseAddress(a4, 0);
      }
      else
      {
        uint64_t v29 = _ANSTLoggingGetOSLogForCategoryANSTKit();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t last_error = espresso_get_last_error();
          sub_246D98CC0(last_error, v34);
        }

        char v8 = 0;
      }
      if (v33 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    __int16 v9 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246D98C48(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    char v8 = 0;
  }

  return v8;
}

- (BOOL)setInput:(id)a3 fromRawPointer:(const void *)a4
{
  id v6 = a3;
  int v7 = v6;
  if (self->_isPrepared)
  {
    id v8 = v6;
    uint64_t v11 = (char *)objc_msgSend_UTF8String(v8, v9, v10);
    sub_246D58EA4(__p, v11);
    uint64_t v12 = sub_246D5A5E4(&self->_input_espresso_buffer.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
    BOOL v13 = v12 != 0;
    if (v12)
    {
      *((void *)v12 + 5) = a4;
    }
    else
    {
      uint64_t v22 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_246D98D7C((uint64_t)v8, v22);
      }
    }
    if (v25 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    uint64_t v14 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_246D98D04(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (ANSTBaseNetworkEspresso)initWithNetworkPath:(id)a3 engine:(int64_t)a4 networkMode:(id)a5 directAccessOutputBuffer:(BOOL)a6
{
  return 0;
}

- (void)cleanUpOutputPixelBufferMap
{
  for (CVPixelBufferRef i = (CVPixelBufferRef)self->_outputPixelBufMap.__table_.__p1_.__value_.__next_; i; CVPixelBufferRef i = *(CVPixelBufferRef *)i)
    CVPixelBufferRelease(*((CVPixelBufferRef *)i + 5));
  sub_246D59144((uint64_t)&self->_outputPixelBufMap);
}

- (BOOL)supportFloat16IO
{
  return 0;
}

- (BOOL)supportZeroCopyOutput
{
  return 0;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  objc_msgSend_cleanUpOutputPixelBufferMap(self, v3, v4);
  v5.receiver = self;
  v5.super_class = (Class)ANSTBaseNetworkEspresso;
  [(ANSTBaseNetworkEspresso *)&v5 dealloc];
}

- (id)description
{
  int v3 = objc_msgSend_tracingEntry(self, a2, v2);
  id v6 = objc_msgSend_description(v3, v4, v5);

  return v6;
}

- (id)tracingEntry
{
  v14[5] = *MEMORY[0x263EF8340];
  v14[0] = self->_netPath;
  v13[0] = @"netPath";
  v13[1] = @"engineType";
  int v3 = objc_msgSend_numberWithInteger_(NSNumber, a2, self->_engineType);
  v14[1] = v3;
  v13[2] = @"enablePreprocess";
  uint64_t v5 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_enablePreprocess);
  v14[2] = v5;
  v13[3] = @"networkVersion";
  id v8 = objc_msgSend_networkVersion(self, v6, v7);
  v13[4] = @"networkMode";
  networkResolution = self->_networkResolution;
  v14[3] = v8;
  v14[4] = networkResolution;
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v14, v13, 5);

  return v11;
}

+ (id)tracingEntryFormat
{
  if (qword_2691E43C0 != -1) {
    dispatch_once(&qword_2691E43C0, &unk_26FB41188);
  }
  uint64_t v2 = (void *)qword_2691E43C8;
  return v2;
}

- (void)context
{
  return self->_context;
}

- (void)plan
{
  return self->_plan;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  uint64_t v2 = *(void *)&self->_network.network_index;
  plan = self->_network.plan;
  result.var1 = v2;
  result.var0 = plan;
  return result;
}

- (int64_t)engineType
{
  return self->_engineType;
}

- (int)planPriority
{
  return self->_planPriority;
}

- ($F613A077D53D3D97A8E0FDF5BAE1891D)preprocessor
{
  *($9DF72902E0F602464F2F248C9389BF3B *)retstr = *($9DF72902E0F602464F2F248C9389BF3B *)((char *)self + 248);
  return self;
}

- (BOOL)enablePreprocess
{
  return self->_enablePreprocess;
}

- (NSString)networkResolution
{
  return self->_networkResolution;
}

- (BOOL)useManagedBuffers
{
  return self->_useManagedBuffers;
}

- (NSSet)disabledOutputSet
{
  return self->_disabledOutputSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledOutputSet, 0);
  objc_storeStrong((id *)&self->_networkResolution, 0);
  sub_246D5AAF8((uint64_t)&self->_input_espresso_buffer);
  sub_246D5AB34((uint64_t)&self->_expectedDimensions);
  sub_246D5AAF8((uint64_t)&self->_outputPixelBufMap);
  sub_246D5AAF8((uint64_t)&self->_outputBufferMap);
  objc_storeStrong((id *)&self->_netFileName, 0);
  objc_storeStrong((id *)&self->_netPath, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  return self;
}

@end