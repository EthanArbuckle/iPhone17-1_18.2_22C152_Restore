@interface ANSTVMTrackerEspresso
+ (ANSTVMTrackerEspresso)new;
- ($FD4688982923A924290ECB669CAF1EC2)getOutputMaskBuffer;
- (ANSTVMTrackerEspresso)init;
- (ANSTVMTrackerEspresso)initWithConfiguration:(id)a3;
- (BOOL)_setInitialMaskWithValue:(float)a3;
- (BOOL)initNetwork;
- (BOOL)runInferenceModel:(__CVBuffer *)a3;
- (BOOL)runInitializerModel:(__CVBuffer *)a3;
- (BOOL)runUpdateModel:(__CVBuffer *)a3;
- (id)_expectedMaskNetworkFileName;
- (id)_expectedMemoryNetworkFileName;
- (id)_expectedUpdateNetworkFileName;
- (id)_maskNetworkName;
- (id)_memoryNetworkName;
- (id)_updateNetworkName;
- (void)dealloc;
@end

@implementation ANSTVMTrackerEspresso

+ (ANSTVMTrackerEspresso)new
{
  result = (ANSTVMTrackerEspresso *)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTVMTrackerEspresso)init
{
  result = (ANSTVMTrackerEspresso *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTVMTrackerEspresso)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ANSTVMTrackerEspresso;
  v6 = [(ANSTVMTrackerEspresso *)&v12 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_configuration, a3),
        v7->_firstFrame = 1,
        !objc_msgSend_initNetwork(v7, v8, v9)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (BOOL)initNetwork
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  v3 = [ANSTBaseNetworkEspresso alloc];
  uint64_t v6 = objc_msgSend_networkEngineType(self->_configuration, v4, v5);
  uint64_t v9 = objc_msgSend_qualityOfService(self->_configuration, v7, v8);
  objc_super v12 = objc_msgSend__memoryNetworkName(self, v10, v11);
  v15 = objc_msgSend__expectedMemoryNetworkFileName(self, v13, v14);
  v17 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkFileName_(v3, v16, v6, v9, v12, v15);
  memoryNetwork = self->_memoryNetwork;
  self->_memoryNetwork = v17;

  int BlobDimensionByName_andDestination = objc_msgSend_prepare(self->_memoryNetwork, v19, v20);
  if (BlobDimensionByName_andDestination)
  {
    v22 = [ANSTBaseNetworkEspresso alloc];
    uint64_t v25 = objc_msgSend_networkEngineType(self->_configuration, v23, v24);
    uint64_t v28 = objc_msgSend_qualityOfService(self->_configuration, v26, v27);
    v31 = objc_msgSend__maskNetworkName(self, v29, v30);
    v34 = objc_msgSend__expectedMaskNetworkFileName(self, v32, v33);
    v36 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkFileName_(v22, v35, v25, v28, v31, v34);
    maskNetwork = self->_maskNetwork;
    self->_maskNetwork = v36;

    int BlobDimensionByName_andDestination = objc_msgSend_prepare(self->_maskNetwork, v38, v39);
    if (BlobDimensionByName_andDestination)
    {
      memset(v124, 0, sizeof(v124));
      v42 = self->_maskNetwork;
      uint64_t v43 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputHiddenTensorName, v40, v41, 0, 0, 0, 0);
      self->_hiddenStateTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v42, v44, v43);
      v45 = self->_maskNetwork;
      uint64_t v48 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkInputHiddenStateTensorName, v46, v47);
      int BlobDimensionByName_andDestination = objc_msgSend_getBlobDimensionByName_andDestination_(v45, v49, v48, v124);
      if (BlobDimensionByName_andDestination)
      {
        bzero(self->_hiddenStateTensor->var0, 4 * self->_hiddenStateTensor->var13);
        v50 = self->_maskNetwork;
        uint64_t v53 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputTensorName, v51, v52);
        self->_probTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v50, v54, v53);
        v55 = self->_maskNetwork;
        uint64_t v58 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputTensorName, v56, v57);
        int BlobDimensionByName_andDestination = objc_msgSend_getBlobDimensionByName_andDestination_(v55, v59, v58, v124);
        if (BlobDimensionByName_andDestination)
        {
          bzero(self->_probTensor->var0, 4 * self->_probTensor->var13);
          v60 = self->_maskNetwork;
          uint64_t v63 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputMattingTensorName, v61, v62);
          self->_outputMaskBuffer = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v60, v64, v63);
          v65 = self->_maskNetwork;
          uint64_t v68 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputMattingTensorName, v66, v67);
          int BlobDimensionByName_andDestination = objc_msgSend_getBlobDimensionByName_andDestination_(v65, v69, v68, v124);
          if (BlobDimensionByName_andDestination)
          {
            bzero(self->_outputMaskBuffer->var0, 4 * self->_outputMaskBuffer->var13);
            v70 = [ANSTBaseNetworkEspresso alloc];
            uint64_t v73 = objc_msgSend_networkEngineType(self->_configuration, v71, v72);
            uint64_t v76 = objc_msgSend_qualityOfService(self->_configuration, v74, v75);
            v79 = objc_msgSend__updateNetworkName(self, v77, v78);
            v82 = objc_msgSend__expectedUpdateNetworkFileName(self, v80, v81);
            v84 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkFileName_(v70, v83, v73, v76, v79, v82);
            updateNetwork = self->_updateNetwork;
            self->_updateNetwork = v84;

            int BlobDimensionByName_andDestination = objc_msgSend_prepare(self->_updateNetwork, v86, v87);
            if (BlobDimensionByName_andDestination)
            {
              v90 = self->_updateNetwork;
              uint64_t v91 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputKeyTensorName, v88, v89);
              self->_keyTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v90, v92, v91);
              v93 = self->_updateNetwork;
              uint64_t v96 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputKeyTensorName, v94, v95);
              int BlobDimensionByName_andDestination = objc_msgSend_getBlobDimensionByName_andDestination_(v93, v97, v96, v124);
              if (BlobDimensionByName_andDestination)
              {
                bzero(self->_keyTensor->var0, 4 * self->_keyTensor->var13);
                unint64_t v98 = 4 * self->_keyTensor->var11 * (unint64_t)((double)self->_keyTensor->var6 * 0.5);
                self->_keyTensorSwapSpaceSize = v98;
                self->_keyTensorSwapSpace = malloc_type_malloc(v98, 0x6264D253uLL);
                v99 = self->_updateNetwork;
                uint64_t v102 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputValueTensorName, v100, v101);
                self->_valueTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v99, v103, v102);
                v104 = self->_updateNetwork;
                uint64_t v107 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputValueTensorName, v105, v106);
                int BlobDimensionByName_andDestination = objc_msgSend_getBlobDimensionByName_andDestination_(v104, v108, v107, v124);
                if (BlobDimensionByName_andDestination)
                {
                  bzero(self->_valueTensor->var0, 4 * self->_valueTensor->var13);
                  unint64_t v109 = 4 * self->_valueTensor->var9 * (unint64_t)((double)self->_valueTensor->var4 * 0.5);
                  self->_valueTensorSwapSpaceSize = v109;
                  self->_valueTensorSwapSpace = malloc_type_malloc(v109, 0xD9557E10uLL);
                  v110 = self->_memoryNetwork;
                  uint64_t v113 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkInputMaskTensorName, v111, v112);
                  objc_msgSend_getResolutionByBlobName_(v110, v114, v113);
                  int v117 = sub_246D6843C((unint64_t)v115, (const char *)v116, &self->_initialMask);
                  if (v117)
                  {
                    int v121 = v117;
                    v122 = _ANSTLoggingGetOSLogForCategoryANSTKit();
                    if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
                      sub_246D99E48(v121, v122);
                    }

                    LOBYTE(BlobDimensionByName_andDestination) = 0;
                  }
                  else
                  {
                    LODWORD(v120) = -1.0;
                    LOBYTE(BlobDimensionByName_andDestination) = objc_msgSend__setInitialMaskWithValue_(self, v118, v119, v120);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return BlobDimensionByName_andDestination;
}

- (id)_memoryNetworkName
{
  return @"visegHQ_memory";
}

- (id)_updateNetworkName
{
  return @"visegHQ_mask_memory_shared";
}

- (id)_maskNetworkName
{
  return @"visegHQ_mask_memory_shared";
}

- (id)_expectedMemoryNetworkFileName
{
  p_configuration = (void **)&self->_configuration;
  if (objc_msgSend_version(self->_configuration, a2, v2) == 0x20000)
  {
    unint64_t v6 = objc_msgSend_networkResolution(*p_configuration, v4, v5);
    if (v6 < 4) {
      return off_265202FC0[v6];
    }
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT)) {
    sub_246D99EC0(p_configuration, v8, v9);
  }

  return 0;
}

- (id)_expectedUpdateNetworkFileName
{
  p_configuration = (void **)&self->_configuration;
  if (objc_msgSend_version(self->_configuration, a2, v2) == 0x20000)
  {
    unint64_t v6 = objc_msgSend_networkResolution(*p_configuration, v4, v5);
    if (v6 < 4) {
      return off_265202FE0[v6];
    }
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT)) {
    sub_246D99F60(p_configuration, v8, v9);
  }

  return 0;
}

- (id)_expectedMaskNetworkFileName
{
  p_configuration = (void **)&self->_configuration;
  if (objc_msgSend_version(self->_configuration, a2, v2) == 0x20000)
  {
    unint64_t v6 = objc_msgSend_networkResolution(*p_configuration, v4, v5);
    if (v6 < 4) {
      return off_265203000[v6];
    }
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT)) {
    sub_246D9A000(p_configuration, v8, v9);
  }

  return 0;
}

- (BOOL)runInitializerModel:(__CVBuffer *)a3
{
  int v4 = objc_msgSend_setInput_fromCVPixelBuffer_(self->_memoryNetwork, a2, kANSTVMTrackerNetworkInputTensorName, a3);
  if (v4)
  {
    int v4 = objc_msgSend_setInput_fromCVPixelBuffer_(self->_memoryNetwork, v5, kANSTVMTrackerNetworkInputMaskTensorName, self->_initialMask);
    if (v4)
    {
      int v4 = objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_memoryNetwork, v6, (uint64_t)self->_hiddenStateTensor, kANSTVMTrackerNetworkInputHiddenStateTensorName);
      if (v4)
      {
        int v4 = objc_msgSend_runNetwork(self->_memoryNetwork, v7, v8);
        if (v4)
        {
          memoryNetwork = self->_memoryNetwork;
          uint64_t v12 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputKeyTensorName, v9, v10);
          TensorByName = (const void **)objc_msgSend_getTensorByName_(memoryNetwork, v13, v12);
          memcpy(self->_keyTensor->var0, *TensorByName, 4 * self->_keyTensor->var13);
          v15 = self->_memoryNetwork;
          uint64_t v18 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputValueTensorName, v16, v17);
          uint64_t v20 = (const void **)objc_msgSend_getTensorByName_(v15, v19, v18);
          memcpy(self->_valueTensor->var0, *v20, 4 * self->_valueTensor->var13);
          v21 = self->_memoryNetwork;
          uint64_t v24 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputHiddenTensorName, v22, v23);
          v26 = (const void **)objc_msgSend_getTensorByName_(v21, v25, v24);
          memcpy(self->_hiddenStateTensor->var0, *v26, 4 * self->_hiddenStateTensor->var13);
          self->_firstFrame = 0;
          LOBYTE(v4) = 1;
        }
      }
    }
  }
  return v4;
}

- (BOOL)runInferenceModel:(__CVBuffer *)a3
{
  if (!self->_firstFrame)
  {
    unint64_t v6 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_246D53000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ANSTVMTrackerEspresso_runInferenceModel", (const char *)&unk_246DA093E, buf, 2u);
    }

    if (objc_msgSend_setInput_fromCVPixelBuffer_(self->_maskNetwork, v8, kANSTVMTrackerNetworkInputTensorName, a3)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_maskNetwork, v9, (uint64_t)self->_outputMaskBuffer, kANSTVMTrackerNetworkInputMattingTensorName)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_maskNetwork, v10, (uint64_t)self->_probTensor, kANSTVMTrackerNetworkInputProbTensorName)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_maskNetwork, v11, (uint64_t)self->_keyTensor, kANSTVMTrackerNetworkInputKeyTensorName)
      && objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_maskNetwork, v12, (uint64_t)self->_valueTensor, kANSTVMTrackerNetworkInputValueTensorName)&& (objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_maskNetwork, v13, (uint64_t)self->_hiddenStateTensor, kANSTVMTrackerNetworkInputHiddenStateTensorName) & 1) != 0)
    {
      if (objc_msgSend_runNetwork(self->_maskNetwork, v14, v15))
      {
        maskNetwork = self->_maskNetwork;
        uint64_t v19 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputMattingTensorName, v16, v17);
        self->_outputMaskBuffer = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(maskNetwork, v20, v19);
        v21 = self->_maskNetwork;
        uint64_t v24 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputTensorName, v22, v23);
        self->_probTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v21, v25, v24);
        v26 = self->_maskNetwork;
        uint64_t v29 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputHiddenTensorName, v27, v28);
        self->_hiddenStateTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v26, v30, v29);
        self->_firstFrame = 0;
        os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v6, self);

        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
        {
          *(_WORD *)v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_246D53000, v6, OS_SIGNPOST_INTERVAL_END, v31, "ANSTVMTrackerEspresso_runInferenceModel", (const char *)&unk_246DA093E, v35, 2u);
        }
        BOOL v3 = 1;
        goto LABEL_22;
      }
      os_signpost_id_t v32 = os_signpost_id_make_with_pointer(v6, self);

      if (v32 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v6))
      {
LABEL_21:
        BOOL v3 = 0;
LABEL_22:

        return v3;
      }
      __int16 v36 = 0;
      uint64_t v33 = (uint8_t *)&v36;
    }
    else
    {
      os_signpost_id_t v32 = os_signpost_id_make_with_pointer(v6, self);

      if (v32 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v6)) {
        goto LABEL_21;
      }
      *(_WORD *)v37 = 0;
      uint64_t v33 = v37;
    }
    _os_signpost_emit_with_name_impl(&dword_246D53000, v6, OS_SIGNPOST_INTERVAL_END, v32, "ANSTVMTrackerEspresso_runInferenceModel", (const char *)&unk_246DA093E, v33, 2u);
    goto LABEL_21;
  }
  return 0;
}

- (BOOL)runUpdateModel:(__CVBuffer *)a3
{
  if (!self->_firstFrame)
  {
    unint64_t v6 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_246D53000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ANSTVMTrackerEspresso_runUpdateModel", (const char *)&unk_246DA093E, buf, 2u);
    }

    if (objc_msgSend_setInput_fromCVPixelBuffer_(self->_updateNetwork, v8, kANSTVMTrackerNetworkInputTensorName, a3)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_updateNetwork, v9, (uint64_t)self->_outputMaskBuffer, kANSTVMTrackerNetworkInputMattingTensorName)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_updateNetwork, v10, (uint64_t)self->_probTensor, kANSTVMTrackerNetworkInputProbTensorName)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_updateNetwork, v11, (uint64_t)self->_keyTensor, kANSTVMTrackerNetworkInputKeyTensorName)
      && objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_updateNetwork, v12, (uint64_t)self->_valueTensor, kANSTVMTrackerNetworkInputValueTensorName)&& (objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_updateNetwork, v13, (uint64_t)self->_hiddenStateTensor, kANSTVMTrackerNetworkInputHiddenStateTensorName) & 1) != 0)
    {
      if (objc_msgSend_runNetwork(self->_updateNetwork, v14, v15))
      {
        updateNetwork = self->_updateNetwork;
        uint64_t v19 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputHiddenTensorName, v16, v17);
        TensorByName = (const void **)objc_msgSend_getTensorByName_(updateNetwork, v20, v19);
        memcpy(self->_hiddenStateTensor->var0, *TensorByName, 4 * self->_hiddenStateTensor->var13);
        v22 = self->_updateNetwork;
        uint64_t v25 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputMattingTensorName, v23, v24);
        uint64_t v27 = (const void **)objc_msgSend_getTensorByName_(v22, v26, v25);
        memcpy(self->_outputMaskBuffer->var0, *v27, 4 * self->_outputMaskBuffer->var13);
        uint64_t v28 = self->_updateNetwork;
        uint64_t v31 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputTensorName, v29, v30);
        uint64_t v33 = (const void **)objc_msgSend_getTensorByName_(v28, v32, v31);
        memcpy(self->_probTensor->var0, *v33, 4 * self->_probTensor->var13);
        v34 = self->_updateNetwork;
        uint64_t v37 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputKeyTensorName, v35, v36);
        self->_keyTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v34, v38, v37);
        uint64_t v39 = self->_updateNetwork;
        uint64_t v42 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputValueTensorName, v40, v41);
        valueTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v39, v43, v42);
        self->_valueTensor = valueTensor;
        keyTensor = self->_keyTensor;
        if (keyTensor->var8)
        {
          unint64_t v46 = 0;
          do
          {
            if (keyTensor->var7)
            {
              unint64_t v47 = 0;
              do
              {
                uint64_t v48 = (char *)keyTensor->var0 + 4 * keyTensor->var13 * v46 + 4 * keyTensor->var12 * v47;
                size_t keyTensorSwapSpaceSize = self->_keyTensorSwapSpaceSize;
                v50 = &v48[keyTensorSwapSpaceSize];
                memcpy(self->_keyTensorSwapSpace, &v48[keyTensorSwapSpaceSize], keyTensorSwapSpaceSize);
                memcpy(v50, v48, self->_keyTensorSwapSpaceSize);
                memcpy(v48, self->_keyTensorSwapSpace, self->_keyTensorSwapSpaceSize);
                ++v47;
                keyTensor = self->_keyTensor;
              }
              while (v47 < keyTensor->var7);
            }
            ++v46;
          }
          while (v46 < keyTensor->var8);
          valueTensor = self->_valueTensor;
        }
        if (valueTensor->var8)
        {
          unint64_t v51 = 0;
          do
          {
            if (valueTensor->var7)
            {
              unint64_t v52 = 0;
              do
              {
                if (valueTensor->var6)
                {
                  unint64_t v53 = 0;
                  do
                  {
                    if (valueTensor->var5)
                    {
                      unint64_t v54 = 0;
                      do
                      {
                        v55 = (char *)valueTensor->var0
                            + 4 * valueTensor->var13 * v51
                            + 4 * valueTensor->var12 * v52
                            + 4 * valueTensor->var11 * v53
                            + 4 * valueTensor->var10 * v54;
                        size_t valueTensorSwapSpaceSize = self->_valueTensorSwapSpaceSize;
                        uint64_t v57 = &v55[valueTensorSwapSpaceSize];
                        memcpy(self->_valueTensorSwapSpace, &v55[valueTensorSwapSpaceSize], valueTensorSwapSpaceSize);
                        memcpy(v57, v55, self->_valueTensorSwapSpaceSize);
                        memcpy(v55, self->_valueTensorSwapSpace, self->_valueTensorSwapSpaceSize);
                        ++v54;
                        valueTensor = self->_valueTensor;
                      }
                      while (v54 < valueTensor->var5);
                    }
                    ++v53;
                  }
                  while (v53 < valueTensor->var6);
                }
                ++v52;
              }
              while (v52 < valueTensor->var7);
            }
            ++v51;
          }
          while (v51 < valueTensor->var8);
        }
        self->_firstFrame = 0;
        os_signpost_id_t v58 = os_signpost_id_make_with_pointer(v6, self);

        if (v58 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v6))
        {
          v63[0] = 0;
          _os_signpost_emit_with_name_impl(&dword_246D53000, v6, OS_SIGNPOST_INTERVAL_END, v58, "ANSTVMTrackerEspresso_runUpdateModel", (const char *)&unk_246DA093E, (uint8_t *)v63, 2u);
        }
        BOOL v3 = 1;
        goto LABEL_41;
      }
      os_signpost_id_t v59 = os_signpost_id_make_with_pointer(v6, self);

      if (v59 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v6))
      {
LABEL_40:
        BOOL v3 = 0;
LABEL_41:

        return v3;
      }
      __int16 v64 = 0;
      v60 = "ANSTVMTrackerEspresso_runUpdateModel";
      v61 = (uint8_t *)&v64;
    }
    else
    {
      os_signpost_id_t v59 = os_signpost_id_make_with_pointer(v6, self);

      if (v59 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v6)) {
        goto LABEL_40;
      }
      *(_WORD *)v65 = 0;
      v60 = "ANSTVMTrackerEspresso_runInferenceModel";
      v61 = v65;
    }
    _os_signpost_emit_with_name_impl(&dword_246D53000, v6, OS_SIGNPOST_INTERVAL_END, v59, v60, (const char *)&unk_246DA093E, v61, 2u);
    goto LABEL_40;
  }
  return 0;
}

- (BOOL)_setInitialMaskWithValue:(float)a3
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(self->_initialMask);
  if (PixelFormatType == 1278226534)
  {
    CVPixelBufferLockBaseAddress(self->_initialMask, 0);
    size_t Width = CVPixelBufferGetWidth(self->_initialMask);
    size_t Height = CVPixelBufferGetHeight(self->_initialMask);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(self->_initialMask);
    BaseAddress = (float *)CVPixelBufferGetBaseAddress(self->_initialMask);
    if (Height)
    {
      for (uint64_t i = 0; i != Height; ++i)
      {
        if (Width)
        {
          for (uint64_t j = 0; j != Width; ++j)
            BaseAddress[j] = a3;
        }
        BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
      }
    }
    CVPixelBufferUnlockBaseAddress(self->_initialMask, 0);
  }
  return PixelFormatType == 1278226534;
}

- ($FD4688982923A924290ECB669CAF1EC2)getOutputMaskBuffer
{
  return self->_outputMaskBuffer;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_initialMask);
  self->_initialMask = 0;
  free(self->_keyTensorSwapSpace);
  self->_keyTensorSwapSpace = 0;
  free(self->_valueTensorSwapSpace);
  self->_valueTensorSwapSpace = 0;
  v3.receiver = self;
  v3.super_class = (Class)ANSTVMTrackerEspresso;
  [(ANSTVMTrackerEspresso *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_updateNetwork, 0);
  objc_storeStrong((id *)&self->_maskNetwork, 0);
  objc_storeStrong((id *)&self->_memoryNetwork, 0);
}

@end