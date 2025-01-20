@interface CHEncoderDecoderNetwork
- (CHEncoderDecoderNetwork)initWithModelNames:(id)a3 decoderName:(id)a4;
- (CHSingletonMLModel)decoderModel;
- (CHSingletonMLModel)encoderModel;
- (FeatureArray)_extractFeaturesFromDrawing:(SEL)a3 error:(id)a4;
- (NSArray)codeMap;
- (NSArray)recognitionLocales;
- (NSSet)activeAlphabet;
- (NSSet)declaredVariables;
- (NSSet)definedMathFunctionNameSet;
- (float)segmentationAttThreshold;
- (id)_bestPathTokensFromDecodingStates:(const void *)a3 drawing:(id)a4 codemap:(const void *)a5;
- (id)getListOfCommonVariablesForGraphing;
- (id)loadCodemap:(id)a3;
- (id)loadModel:(id)a3;
- (id)recognizeDrawing:(id)a3 beamSize:(int64_t)a4 shouldCancel:(id)a5;
- (int)getIndexInCodemap:(id)a3;
- (int64_t)encoderCompressionFactor;
- (int64_t)enlargeSingleDotBy;
- (int64_t)eosIndex;
- (int64_t)maxInputHeight;
- (int64_t)maxInputWidth;
- (int64_t)minInputHeight;
- (int64_t)minInputWidth;
- (int64_t)numInputChannels;
- (int64_t)numOutputClasses;
- (int64_t)padToMultipleOf;
- (int64_t)renderSymbolSize;
- (vector<std::vector<std::unordered_map<int,)_createCompressedInputImage:()std:(int>>>> *__return_ptr)retstr :(CHEncoderDecoderNetwork *)self allocator<std:(SEL)a3 :(const void *)a4 vector<std::unordered_map<int;
- (void)dealloc;
- (void)filterOutAlternatives:(void *)a3 codemap:(const void *)a4;
- (void)setActiveAlphabet:(id)a3;
- (void)setDeclaredVariables:(id)a3;
- (void)setDefinedMathFunctionNameSet:(id)a3;
- (void)setRecognitionLocales:(id)a3;
- (void)setUpDecoderConfusableAlternatives:(void *)a3;
- (void)setUpDecoderOutOfAlphabetAlternatives:(void *)a3;
- (void)setUpMathDecoder:(void *)a3 imageCompressed:(void *)a4;
@end

@implementation CHEncoderDecoderNetwork

- (CHEncoderDecoderNetwork)initWithModelNames:(id)a3 decoderName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v48.receiver = self;
  v48.super_class = (Class)CHEncoderDecoderNetwork;
  v8 = [(CHEncoderDecoderNetwork *)&v48 init];
  v13 = v8;
  if (v8)
  {
    uint64_t v14 = objc_msgSend_loadModel_(v8, v9, (uint64_t)v6, v10, v11, v12);
    encoderModel = v13->_encoderModel;
    v13->_encoderModel = (CHSingletonMLModel *)v14;

    uint64_t v20 = objc_msgSend_loadModel_(v13, v16, (uint64_t)v7, v17, v18, v19);
    decoderModel = v13->_decoderModel;
    v13->_decoderModel = (CHSingletonMLModel *)v20;

    uint64_t v26 = objc_msgSend_loadCodemap_(v13, v22, (uint64_t)v6, v23, v24, v25);
    codeMap = v13->_codeMap;
    v13->_codeMap = (NSArray *)v26;

    v33 = objc_msgSend_codeMap(v13, v28, v29, v30, v31, v32);
    v13->_eosIndex = objc_msgSend_indexOfObject_(v33, v34, @"<EOS>", v35, v36, v37);

    if (v13->_eosIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v43 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        v47[0] = 0;
        _os_log_impl(&dword_1C492D000, v43, OS_LOG_TYPE_FAULT, "<EOS> symbol not found in codemap", (uint8_t *)v47, 2u);
      }
    }
    *(_OWORD *)&v13->_renderSymbolSize = xmmword_1C4C45190;
    *(_OWORD *)&v13->_maxInputHeight = xmmword_1C4C451A0;
    *(_OWORD *)&v13->_maxInputWidth = xmmword_1C4C451B0;
    *(_OWORD *)&v13->_enlargeSingleDotBy = xmmword_1C4C3B460;
    v13->_numOutputClasses = objc_msgSend_count(v13->_codeMap, v38, v39, v40, v41, v42);
    v13->_segmentationAttThreshold = 0.01;
    v13->_encoderCompressionFactor = 32;
    activeAlphabet = v13->_activeAlphabet;
    v13->_activeAlphabet = 0;

    declaredVariables = v13->_declaredVariables;
    v13->_declaredVariables = 0;
  }
  return v13;
}

- (void)dealloc
{
  id v7 = objc_msgSend_encoderModel(self, a2, v2, v3, v4, v5);
  v13 = objc_msgSend_modelKey(v7, v8, v9, v10, v11, v12);
  objc_msgSend_releaseModelWithKey_(CHSingletonMLModel, v14, (uint64_t)v13, v15, v16, v17);

  uint64_t v23 = objc_msgSend_decoderModel(self, v18, v19, v20, v21, v22);
  uint64_t v29 = objc_msgSend_modelKey(v23, v24, v25, v26, v27, v28);
  objc_msgSend_releaseModelWithKey_(CHSingletonMLModel, v30, (uint64_t)v29, v31, v32, v33);

  v34.receiver = self;
  v34.super_class = (Class)CHEncoderDecoderNetwork;
  [(CHEncoderDecoderNetwork *)&v34 dealloc];
}

- (id)getListOfCommonVariablesForGraphing
{
  return &unk_1F203DE60;
}

- (id)loadModel:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v9 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6, v7, v8);
  pathForResource(v9, 0, (UInt8 *)__s);
  size_t v10 = strlen(__s);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1C4949B7C();
  }
  uint64_t v14 = (void *)v10;
  if (v10 >= 0x17)
  {
    uint64_t v16 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v16 = v10 | 7;
    }
    uint64_t v17 = v16 + 1;
    uint64_t v15 = (void **)operator new(v16 + 1);
    __dst[1] = v14;
    int64_t v44 = v17 | 0x8000000000000000;
    __dst[0] = v15;
    goto LABEL_8;
  }
  HIBYTE(v44) = v10;
  uint64_t v15 = __dst;
  if (v10) {
LABEL_8:
  }
    memcpy(v15, __s, (size_t)v14);
  *((unsigned char *)v14 + (void)v15) = 0;
  if (v44 >= 0) {
    objc_msgSend_stringWithCString_encoding_(NSString, v11, (uint64_t)__dst, 4, v12, v13);
  }
  else {
  uint64_t v18 = objc_msgSend_stringWithCString_encoding_(NSString, v11, (uint64_t)__dst[0], 4, v12, v13);
  }
  uint64_t v23 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v19, (uint64_t)v18, v20, v21, v22);
  id v24 = objc_alloc(MEMORY[0x1E4F1E990]);
  uint64_t v29 = objc_msgSend_initWithComputeUnits_(v24, v25, 0, v26, v27, v28);
  id v42 = 0;
  uint64_t v32 = objc_msgSend_modelWithContentsOfURL_configuration_error_(CHSingletonMLModel, v30, (uint64_t)v23, (uint64_t)v29, (uint64_t)&v42, v31);
  id v33 = v42;
  if (!v32)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    objc_super v34 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      uint64_t v40 = objc_msgSend_localizedDescription(v33, v35, v36, v37, v38, v39);
      *(_DWORD *)buf = 138412546;
      id v46 = v3;
      __int16 v47 = 2112;
      objc_super v48 = v40;
      _os_log_impl(&dword_1C492D000, v34, OS_LOG_TYPE_FAULT, "Error loading model %@: %@", buf, 0x16u);
    }
  }

  if (SHIBYTE(v44) < 0) {
    operator delete(__dst[0]);
  }

  return v32;
}

- (id)loadCodemap:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v9 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6, v7, v8);
  pathForResource(v9, 0, (UInt8 *)__s);
  size_t v10 = strlen(__s);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1C4949B7C();
  }
  uint64_t v14 = (void *)v10;
  if (v10 >= 0x17)
  {
    uint64_t v16 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v16 = v10 | 7;
    }
    uint64_t v17 = v16 + 1;
    uint64_t v15 = (void **)operator new(v16 + 1);
    __dst[1] = v14;
    int64_t v65 = v17 | 0x8000000000000000;
    __dst[0] = v15;
    goto LABEL_8;
  }
  HIBYTE(v65) = v10;
  uint64_t v15 = __dst;
  if (v10) {
LABEL_8:
  }
    memcpy(v15, __s, (size_t)v14);
  *((unsigned char *)v14 + (void)v15) = 0;
  if (v65 >= 0) {
    objc_msgSend_stringWithCString_encoding_(NSString, v11, (uint64_t)__dst, 4, v12, v13);
  }
  else {
  uint64_t v18 = objc_msgSend_stringWithCString_encoding_(NSString, v11, (uint64_t)__dst[0], 4, v12, v13);
  }
  id v24 = objc_msgSend_stringByDeletingLastPathComponent(v18, v19, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_stringByAppendingPathComponent_(v24, v25, @"codemap.json.lzfse", v26, v27, v28);

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], v30, (uint64_t)v29, v31, v32, v33);
  objc_super v34 = (NSData *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = NSString;
  uint64_t v40 = objc_msgSend_stringByAppendingString_(v29, v36, @".size", v37, v38, v39);
  v43 = objc_msgSend_stringWithContentsOfFile_encoding_error_(v35, v41, (uint64_t)v40, 4, 0, v42);

  if (!v43)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v49 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_1C492D000, v49, OS_LOG_TYPE_FAULT, "Failed to load math codemap size", v63, 2u);
    }
  }
  uint64_t v50 = objc_msgSend_integerValue(v43, v44, v45, v46, v47, v48);
  v53 = uncompressLZFSEData(v34, v50);
  if (!v53)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v54 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_1C492D000, v54, OS_LOG_TYPE_FAULT, "Failed to load math codemap", v63, 2u);
    }
  }
  v59 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v51, (uint64_t)v53, 1, 0, v52);
  if (!v59)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v60 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_1C492D000, v60, OS_LOG_TYPE_FAULT, "Failed to parse the JSON math codemap", v63, 2u);
    }
  }
  v61 = objc_msgSend_objectForKeyedSubscript_(v59, v55, @"codemap", v56, v57, v58);

  if (SHIBYTE(v65) < 0) {
    operator delete(__dst[0]);
  }

  return v61;
}

- (void)setUpMathDecoder:(void *)a3 imageCompressed:(void *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_msgSend_segmentationAttThreshold(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  sub_1C4ABFA3C();
}

- (int)getIndexInCodemap:(id)a3
{
  id v4 = a3;
  size_t v10 = objc_msgSend_codeMap(self, v5, v6, v7, v8, v9);
  int v15 = objc_msgSend_indexOfObject_(v10, v11, (uint64_t)v4, v12, v13, v14);

  return v15;
}

- (void)setUpDecoderOutOfAlphabetAlternatives:(void *)a3
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)v133 = 0u;
  *(_OWORD *)v134 = 0u;
  int v135 = 1065353216;
  *(_OWORD *)v130 = 0u;
  *(_OWORD *)v131 = 0u;
  int v132 = 1065353216;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F203DE78, a2, (uint64_t)&v126, (uint64_t)v136, 16, v3);
  if (v9)
  {
    uint64_t v10 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v127 != v10) {
          objc_enumerationMutation(&unk_1F203DE78);
        }
        uint64_t v12 = *(void *)(*((void *)&v126 + 1) + 8 * i);
        int IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v5, @"0", v6, v7, v8);
        int v125 = objc_msgSend_getIndexInCodemap_(self, v14, v12, v15, v16, v17);
        uint64_t v22 = sub_1C4BFECBC((uint64_t *)v133, v125, &v125);
        uint64_t v23 = (_DWORD *)v22[3];
        id v24 = (_DWORD *)v22[5];
        if (v24 == v23)
        {
          if (v24)
          {
            v22[4] = v24;
            operator delete(v24);
            v22[3] = 0;
            v22[4] = 0;
            v22[5] = 0;
          }
          uint64_t v23 = operator new(4uLL);
          v22[4] = v23;
          uint64_t v25 = v22 + 4;
          *(v25 - 1) = v23;
          v25[1] = v23 + 1;
        }
        else
        {
          uint64_t v25 = v22 + 4;
        }
        *uint64_t v23 = IndexInCodemap;
        *uint64_t v25 = v23 + 1;
        int v26 = objc_msgSend_getIndexInCodemap_(self, v18, v12, v19, v20, v21);
        sub_1C4BFF184((uint64_t)v130, v26, v26);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F203DE78, v5, (uint64_t)&v126, (uint64_t)v136, 16, v8);
    }
    while (v9);
  }
  int v27 = objc_msgSend_getIndexInCodemap_(self, v5, @"f", v6, v7, v8);
  int v125 = objc_msgSend_getIndexInCodemap_(self, v28, @"\\int", v29, v30, v31);
  uint64_t v36 = sub_1C4BFECBC((uint64_t *)v133, v125, &v125);
  uint64_t v37 = (_DWORD *)v36[3];
  uint64_t v38 = (_DWORD *)v36[5];
  if (v38 == v37)
  {
    if (v38)
    {
      v36[4] = v38;
      operator delete(v38);
      v36[3] = 0;
      v36[4] = 0;
      v36[5] = 0;
    }
    uint64_t v37 = operator new(4uLL);
    v36[4] = v37;
    uint64_t v39 = v36 + 4;
    *(v39 - 1) = v37;
    v39[1] = v37 + 1;
  }
  else
  {
    uint64_t v39 = v36 + 4;
  }
  *uint64_t v37 = v27;
  *uint64_t v39 = v37 + 1;
  int v40 = objc_msgSend_getIndexInCodemap_(self, v32, @"1", v33, v34, v35);
  int v125 = objc_msgSend_getIndexInCodemap_(self, v41, @"\\setminus", v42, v43, v44);
  v49 = sub_1C4BFECBC((uint64_t *)v133, v125, &v125);
  uint64_t v50 = (_DWORD *)v49[3];
  v51 = (_DWORD *)v49[5];
  if (v51 == v50)
  {
    if (v51)
    {
      v49[4] = v51;
      operator delete(v51);
      v49[3] = 0;
      v49[4] = 0;
      v49[5] = 0;
    }
    uint64_t v50 = operator new(4uLL);
    v49[4] = v50;
    uint64_t v52 = v49 + 4;
    *(v52 - 1) = v50;
    v52[1] = v50 + 1;
  }
  else
  {
    uint64_t v52 = v49 + 4;
  }
  *uint64_t v50 = v40;
  *uint64_t v52 = v50 + 1;
  int v53 = objc_msgSend_getIndexInCodemap_(self, v45, @"("), v46, v47, v48;
  int v125 = objc_msgSend_getIndexInCodemap_(self, v54, @"\\lbrack", v55, v56, v57);
  v62 = sub_1C4BFECBC((uint64_t *)v133, v125, &v125);
  v63 = (_DWORD *)v62[3];
  v64 = (_DWORD *)v62[5];
  if (v64 == v63)
  {
    if (v64)
    {
      v62[4] = v64;
      operator delete(v64);
      v62[3] = 0;
      v62[4] = 0;
      v62[5] = 0;
    }
    v63 = operator new(4uLL);
    v62[4] = v63;
    int64_t v65 = v62 + 4;
    *(v65 - 1) = v63;
    v65[1] = v63 + 1;
  }
  else
  {
    int64_t v65 = v62 + 4;
  }
  _DWORD *v63 = v53;
  *int64_t v65 = v63 + 1;
  int v66 = objc_msgSend_getIndexInCodemap_(self, v58, @""), v59, v60, v61);
  int v125 = objc_msgSend_getIndexInCodemap_(self, v67, @"\\rbrack", v68, v69, v70);
  v75 = sub_1C4BFECBC((uint64_t *)v133, v125, &v125);
  v76 = (_DWORD *)v75[3];
  v77 = (_DWORD *)v75[5];
  if (v77 == v76)
  {
    if (v77)
    {
      v75[4] = v77;
      operator delete(v77);
      v75[3] = 0;
      v75[4] = 0;
      v75[5] = 0;
    }
    v76 = operator new(4uLL);
    v75[4] = v76;
    v78 = v75 + 4;
    *(v78 - 1) = v76;
    v78[1] = v76 + 1;
  }
  else
  {
    v78 = v75 + 4;
  }
  _DWORD *v76 = v66;
  void *v78 = v76 + 1;
  int v79 = objc_msgSend_getIndexInCodemap_(self, v71, @"\\lbrack", v72, v73, v74);
  sub_1C4BFF184((uint64_t)v130, v79, v79);
  int v84 = objc_msgSend_getIndexInCodemap_(self, v80, @"\\rbrack", v81, v82, v83);
  sub_1C4BFF184((uint64_t)v130, v84, v84);
  int v89 = objc_msgSend_getIndexInCodemap_(self, v85, @"\\sum", v86, v87, v88);
  int v125 = objc_msgSend_getIndexInCodemap_(self, v90, @"\\Sigma", v91, v92, v93);
  v98 = sub_1C4BFECBC((uint64_t *)v133, v125, &v125);
  v99 = (_DWORD *)v98[3];
  v100 = (_DWORD *)v98[5];
  if (v100 == v99)
  {
    if (v100)
    {
      v98[4] = v100;
      operator delete(v100);
      v98[3] = 0;
      v98[4] = 0;
      v98[5] = 0;
    }
    v99 = operator new(4uLL);
    v98[4] = v99;
    v101 = v98 + 4;
    *(v101 - 1) = v99;
    v101[1] = v99 + 1;
  }
  else
  {
    v101 = v98 + 4;
  }
  _DWORD *v99 = v89;
  void *v101 = v99 + 1;
  int v102 = objc_msgSend_getIndexInCodemap_(self, v94, @"\\prod", v95, v96, v97);
  int v125 = objc_msgSend_getIndexInCodemap_(self, v103, @"\\Pi", v104, v105, v106);
  v107 = sub_1C4BFECBC((uint64_t *)v133, v125, &v125);
  v108 = (_DWORD *)v107[3];
  v109 = (_DWORD *)v107[5];
  if (v109 == v108)
  {
    if (v109)
    {
      v107[4] = v109;
      operator delete(v109);
      v107[3] = 0;
      v107[4] = 0;
      v107[5] = 0;
    }
    v108 = operator new(4uLL);
    v107[4] = v108;
    v110 = v107 + 4;
    *(v110 - 1) = v108;
    v110[1] = v108 + 1;
  }
  else
  {
    v110 = v107 + 4;
  }
  _DWORD *v108 = v102;
  void *v110 = v108 + 1;
  sub_1C4ACC244((uint64_t)v122, (uint64_t)v130);
  if ((char *)a3 + 560 != (char *)v133)
  {
    *((_DWORD *)a3 + 148) = v135;
    sub_1C4ACB9AC((void *)a3 + 70, (void *)v134[0], 0);
  }
  if ((char *)a3 + 600 != (char *)v122)
  {
    *((_DWORD *)a3 + 158) = v124;
    sub_1C4ACC11C((void *)a3 + 75, (uint64_t *)__p, 0);
  }
  v111 = __p;
  if (__p)
  {
    do
    {
      v112 = (void *)*v111;
      operator delete(v111);
      v111 = v112;
    }
    while (v112);
  }
  v113 = v122[0];
  v122[0] = 0;
  if (v113) {
    operator delete(v113);
  }
  v114 = v131[0];
  if (v131[0])
  {
    do
    {
      v115 = (void *)*v114;
      operator delete(v114);
      v114 = v115;
    }
    while (v115);
  }
  v116 = v130[0];
  v130[0] = 0;
  if (v116) {
    operator delete(v116);
  }
  v117 = v134[0];
  if (v134[0])
  {
    do
    {
      v119 = (void *)*v117;
      v120 = (void *)v117[3];
      if (v120)
      {
        v117[4] = v120;
        operator delete(v120);
      }
      operator delete(v117);
      v117 = v119;
    }
    while (v119);
  }
  v118 = v133[0];
  v133[0] = 0;
  if (v118) {
    operator delete(v118);
  }
}

- (void)setUpDecoderConfusableAlternatives:(void *)a3
{
  uint64_t v341 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)__n = 0u;
  *(_OWORD *)v306 = 0u;
  int v307 = 1065353216;
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, a2, @"1", v3, v4, v5);
  DWORD1(v326) = 1028443341;
  DWORD2(v326) = objc_msgSend_getIndexInCodemap_(self, v8, @"l", v9, v10, v11);
  HIDWORD(v326) = 1008981770;
  LODWORD(v327) = objc_msgSend_getIndexInCodemap_(self, v12, @"I", v13, v14, v15);
  DWORD1(v327) = 1008981770;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v16, @"|", v17, v18, v19);
  uint64_t v20 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v20 + 3), (char *)&v326, (char *)&v327 + 8, 3uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v21, @"|", v22, v23, v24);
  DWORD1(v326) = 1008981770;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v25, @"1", v26, v27, v28);
  uint64_t v29 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v29 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v30, @"1", v31, v32, v33);
  DWORD1(v326) = 1008981770;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v34, @"/", v35, v36, v37);
  uint64_t v38 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v38 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v39, @".", v40, v41, v42);
  DWORD1(v326) = 1022739087;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v43, @"\\cdot", v44, v45, v46);
  uint64_t v47 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v47 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v48, @"\\cdot", v49, v50, v51);
  DWORD1(v326) = 1008981770;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v52, @".", v53, v54, v55);
  uint64_t v56 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v56 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v57, @".", v58, v59, v60);
  DWORD1(v326) = 1022739087;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v61, @",", v62, v63, v64);
  int64_t v65 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v65 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v66, @",", v67, v68, v69);
  DWORD1(v326) = 1008981770;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v70, @".", v71, v72, v73);
  uint64_t v74 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v74 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v75, @"2", v76, v77, v78);
  DWORD1(v326) = 1008981770;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v79, @"z", v80, v81, v82);
  uint64_t v83 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v83 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v84, @"2", v85, v86, v87);
  DWORD1(v326) = 1008981770;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v88, @"Z", v89, v90, v91);
  uint64_t v92 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v92 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v93, @"5", v94, v95, v96);
  DWORD1(v326) = 1008981770;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v97, @"s", v98, v99, v100);
  v101 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v101 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v102, @"5", v103, v104, v105);
  DWORD1(v326) = 1008981770;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v106, @"S", v107, v108, v109);
  v110 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v110 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v111, @"s", v112, v113, v114);
  DWORD1(v326) = 1000593162;
  DWORD2(v326) = objc_msgSend_getIndexInCodemap_(self, v115, @"S", v116, v117, v118);
  HIDWORD(v326) = 1000593162;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v119, @"5", v120, v121, v122);
  v123 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v123 + 3), (char *)&v326, (char *)&v327, 2uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v124, @"6", v125, v126, v127);
  DWORD1(v326) = 1022739087;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v128, @"b", v129, v130, v131);
  int v132 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v132 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v133, @"b", v134, v135, v136);
  DWORD1(v326) = 1000593162;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v137, @"6", v138, v139, v140);
  v141 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v141 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v142, @"9", v143, v144, v145);
  DWORD1(v326) = 1008981770;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v146, @"g", v147, v148, v149);
  v150 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v150 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  LODWORD(v326) = objc_msgSend_getIndexInCodemap_(self, v151, @"g", v152, v153, v154);
  DWORD1(v326) = 1000593162;
  LODWORD(v302) = objc_msgSend_getIndexInCodemap_(self, v155, @"9", v156, v157, v158);
  v159 = sub_1C4BFF46C((uint64_t)__n, (int)v302, &v302);
  sub_1C4BFF780((uint64_t)(v159 + 3), (char *)&v326, (char *)&v326 + 8, 1uLL);
  int IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v160, @"1", v161, v162, v163);
  int v322 = objc_msgSend_getIndexInCodemap_(self, v164, @"|", v165, v166, v167);
  int v323 = objc_msgSend_getIndexInCodemap_(self, v168, @"I", v169, v170, v171);
  int v324 = objc_msgSend_getIndexInCodemap_(self, v172, @"l", v173, v174, v175);
  int v325 = objc_msgSend_getIndexInCodemap_(self, v176, @"/", v177, v178, v179);
  long long v326 = 0u;
  long long v327 = 0u;
  int v328 = 1065353216;
  sub_1C4ACB434((uint64_t)&v326, &IndexInCodemap, &IndexInCodemap);
  sub_1C4ACB434((uint64_t)&v326, &v322, &v322);
  sub_1C4ACB434((uint64_t)&v326, &v323, &v323);
  sub_1C4ACB434((uint64_t)&v326, &v324, &v324);
  sub_1C4ACB434((uint64_t)&v326, &v325, &v325);
  int v318 = objc_msgSend_getIndexInCodemap_(self, v180, @"2", v181, v182, v183);
  int v319 = objc_msgSend_getIndexInCodemap_(self, v184, @"z", v185, v186, v187);
  int v320 = objc_msgSend_getIndexInCodemap_(self, v188, @"Z", v189, v190, v191);
  long long v329 = 0u;
  long long v330 = 0u;
  int v331 = 1065353216;
  sub_1C4ACB434((uint64_t)&v329, &v318, &v318);
  sub_1C4ACB434((uint64_t)&v329, &v319, &v319);
  sub_1C4ACB434((uint64_t)&v329, &v320, &v320);
  int v315 = objc_msgSend_getIndexInCodemap_(self, v192, @"5", v193, v194, v195);
  int v316 = objc_msgSend_getIndexInCodemap_(self, v196, @"s", v197, v198, v199);
  int v317 = objc_msgSend_getIndexInCodemap_(self, v200, @"S", v201, v202, v203);
  long long v332 = 0u;
  long long v333 = 0u;
  int v334 = 1065353216;
  sub_1C4ACB434((uint64_t)&v332, &v315, &v315);
  sub_1C4ACB434((uint64_t)&v332, &v316, &v316);
  sub_1C4ACB434((uint64_t)&v332, &v317, &v317);
  int v313 = objc_msgSend_getIndexInCodemap_(self, v204, @"6", v205, v206, v207);
  int v314 = objc_msgSend_getIndexInCodemap_(self, v208, @"b", v209, v210, v211);
  long long v335 = 0u;
  long long v336 = 0u;
  int v337 = 1065353216;
  sub_1C4ACB434((uint64_t)&v335, &v313, &v313);
  sub_1C4ACB434((uint64_t)&v335, &v314, &v314);
  int v310 = objc_msgSend_getIndexInCodemap_(self, v212, @"9", v213, v214, v215);
  int v311 = objc_msgSend_getIndexInCodemap_(self, v216, @"g", v217, v218, v219);
  int v312 = objc_msgSend_getIndexInCodemap_(self, v220, @"q", v221, v222, v223);
  long long v338 = 0u;
  long long __p = 0u;
  int v340 = 1065353216;
  sub_1C4ACB434((uint64_t)&v338, &v310, &v310);
  sub_1C4ACB434((uint64_t)&v338, &v311, &v311);
  sub_1C4ACB434((uint64_t)&v338, &v312, &v312);
  v302 = 0;
  v303 = 0;
  v304 = 0;
  v308 = &v302;
  char v309 = 0;
  v224 = (char *)operator new(0xC8uLL);
  v302 = v224;
  v303 = v224;
  int8x8_t v225 = (int8x8_t)(v224 + 200);
  v304 = v224 + 200;
  sub_1C4ACC244((uint64_t)v224, (uint64_t)&v326);
  sub_1C4ACC244((uint64_t)(v224 + 40), (uint64_t)&v329);
  sub_1C4ACC244((uint64_t)(v224 + 80), (uint64_t)&v332);
  sub_1C4ACC244((uint64_t)(v224 + 120), (uint64_t)&v335);
  sub_1C4ACC244((uint64_t)(v224 + 160), (uint64_t)&v338);
  v303 = v224 + 200;
  v226 = (int8x8_t *)__p;
  if ((void)__p)
  {
    do
    {
      int8x8_t v225 = *v226;
      operator delete(v226);
      v226 = (int8x8_t *)v225;
    }
    while (v225);
  }
  v227 = (void *)v338;
  *(void *)&long long v338 = 0;
  if (v227) {
    operator delete(v227);
  }
  v228 = (int8x8_t *)v336;
  if ((void)v336)
  {
    do
    {
      int8x8_t v225 = *v228;
      operator delete(v228);
      v228 = (int8x8_t *)v225;
    }
    while (v225);
  }
  v229 = (void *)v335;
  *(void *)&long long v335 = 0;
  if (v229) {
    operator delete(v229);
  }
  v230 = (int8x8_t *)v333;
  if ((void)v333)
  {
    do
    {
      int8x8_t v225 = *v230;
      operator delete(v230);
      v230 = (int8x8_t *)v225;
    }
    while (v225);
  }
  v231 = (void *)v332;
  *(void *)&long long v332 = 0;
  if (v231) {
    operator delete(v231);
  }
  v232 = (int8x8_t *)v330;
  if ((void)v330)
  {
    do
    {
      int8x8_t v225 = *v232;
      operator delete(v232);
      v232 = (int8x8_t *)v225;
    }
    while (v225);
  }
  v233 = (void *)v329;
  *(void *)&long long v329 = 0;
  if (v233) {
    operator delete(v233);
  }
  v234 = (int8x8_t *)v327;
  if ((void)v327)
  {
    do
    {
      int8x8_t v225 = *v234;
      operator delete(v234);
      v234 = (int8x8_t *)v225;
    }
    while (v225);
  }
  v235 = (void *)v326;
  *(void *)&long long v326 = 0;
  if (v235) {
    operator delete(v235);
  }
  *(_OWORD *)v299 = 0u;
  *(_OWORD *)v300 = 0u;
  float v301 = *(float *)&v307;
  size_t prime = __n[1];
  if (__n[1] == 1)
  {
    size_t prime = 2;
LABEL_23:
    sub_1C4949C24((uint64_t)v299, prime);
    goto LABEL_24;
  }
  if ((__n[1] & (__n[1] - 1)) != 0)
  {
    size_t prime = std::__next_prime(__n[1]);
    int8x8_t v225 = (int8x8_t)v299[1];
    BOOL v277 = (void *)prime >= v299[1];
    if ((void *)prime > v299[1]) {
      goto LABEL_23;
    }
  }
  else
  {
    int8x8_t v225 = 0;
    BOOL v277 = 1;
    if (__n[1]) {
      goto LABEL_23;
    }
  }
  if (!v277)
  {
    unint64_t v293 = vcvtps_u32_f32((float)(unint64_t)v300[1] / v301);
    if (*(void *)&v225 < 3uLL || (uint8x8_t v294 = (uint8x8_t)vcnt_s8(v225), v294.i16[0] = vaddlv_u8(v294), v294.u32[0] > 1uLL))
    {
      unint64_t v293 = std::__next_prime(v293);
    }
    else
    {
      uint64_t v295 = 1 << -(char)__clz(v293 - 1);
      if (v293 >= 2) {
        unint64_t v293 = v295;
      }
    }
    if (prime <= v293) {
      size_t prime = v293;
    }
    if (prime < *(void *)&v225) {
      goto LABEL_23;
    }
  }
LABEL_24:
  v237 = (int *)v306[0];
  if (v306[0])
  {
    unint64_t v238 = (unint64_t)v299[1];
    do
    {
      int8x8_t v239 = (int8x8_t)v237[4];
      if (v238)
      {
        uint8x8_t v240 = (uint8x8_t)vcnt_s8((int8x8_t)v238);
        v240.i16[0] = vaddlv_u8(v240);
        if (v240.u32[0] > 1uLL)
        {
          int8x8_t v225 = (int8x8_t)v237[4];
          if (v238 <= *(void *)&v239) {
            int8x8_t v225 = (int8x8_t)(*(void *)&v239 % v238);
          }
        }
        else
        {
          int8x8_t v225 = (int8x8_t)((v238 - 1) & *(void *)&v239);
        }
        v241 = (uint64_t **)*((void *)v299[0] + *(void *)&v225);
        if (v241)
        {
          v242 = *v241;
          if (v242)
          {
            if (v240.u32[0] < 2uLL)
            {
              while (1)
              {
                unint64_t v244 = v242[1];
                if (v244 == *(void *)&v239)
                {
                  if (*((_DWORD *)v242 + 4) == v239.i32[0]) {
                    goto LABEL_88;
                  }
                }
                else if ((v244 & (v238 - 1)) != *(void *)&v225)
                {
                  goto LABEL_46;
                }
                v242 = (uint64_t *)*v242;
                if (!v242) {
                  goto LABEL_46;
                }
              }
            }
            do
            {
              unint64_t v243 = v242[1];
              if (v243 == *(void *)&v239)
              {
                if (*((_DWORD *)v242 + 4) == v239.i32[0]) {
                  goto LABEL_88;
                }
              }
              else
              {
                if (v243 >= v238) {
                  v243 %= v238;
                }
                if (v243 != *(void *)&v225) {
                  break;
                }
              }
              v242 = (uint64_t *)*v242;
            }
            while (v242);
          }
        }
      }
LABEL_46:
      v245 = operator new(0x30uLL);
      *(void *)&long long v326 = v245;
      *((void *)&v326 + 1) = v300;
      LOBYTE(v327) = 0;
      void *v245 = 0;
      v245[1] = v239;
      int v246 = v237[4];
      v245[3] = 0;
      *((_DWORD *)v245 + 4) = v246;
      v245[4] = 0;
      v245[5] = 0;
      v248 = (unsigned char *)*((void *)v237 + 3);
      v247 = (unsigned char *)*((void *)v237 + 4);
      uint64_t v249 = v247 - v248;
      if (v247 != v248)
      {
        if (v249 < 0) {
          sub_1C494A220();
        }
        v250 = (char *)operator new(v247 - v248);
        v245[3] = v250;
        v245[4] = v250;
        v245[5] = &v250[8 * (v249 >> 3)];
        size_t v251 = v249 & 0xFFFFFFFFFFFFFFF8;
        memcpy(v250, v248, v251);
        v245[4] = &v250[v251];
      }
      LOBYTE(v327) = 1;
      float v252 = (float)((unint64_t)v300[1] + 1);
      if (v238 && (float)(v301 * (float)v238) >= v252)
      {
        v253 = (void *)*((void *)v299[0] + *(void *)&v225);
        v254 = (void *)v326;
        if (v253) {
          goto LABEL_52;
        }
      }
      else
      {
        BOOL v255 = (v238 & (v238 - 1)) != 0;
        if (v238 < 3) {
          BOOL v255 = 1;
        }
        unint64_t v256 = v255 | (2 * v238);
        unint64_t v257 = vcvtps_u32_f32(v252 / v301);
        if (v256 <= v257) {
          size_t v258 = v257;
        }
        else {
          size_t v258 = v256;
        }
        if (v258 == 1)
        {
          size_t v258 = 2;
        }
        else if ((v258 & (v258 - 1)) != 0)
        {
          size_t v258 = std::__next_prime(v258);
          unint64_t v238 = (unint64_t)v299[1];
        }
        if (v258 > v238) {
          goto LABEL_63;
        }
        if (v258 < v238)
        {
          unint64_t v259 = vcvtps_u32_f32((float)(unint64_t)v300[1] / v301);
          if (v238 < 3
            || (uint8x8_t v260 = (uint8x8_t)vcnt_s8((int8x8_t)v238), v260.i16[0] = vaddlv_u8(v260), v260.u32[0] > 1uLL))
          {
            unint64_t v259 = std::__next_prime(v259);
          }
          else
          {
            uint64_t v261 = 1 << -(char)__clz(v259 - 1);
            if (v259 >= 2) {
              unint64_t v259 = v261;
            }
          }
          if (v258 <= v259) {
            size_t v258 = v259;
          }
          if (v258 < v238) {
LABEL_63:
          }
            sub_1C4949C24((uint64_t)v299, v258);
        }
        unint64_t v238 = (unint64_t)v299[1];
        unint64_t v262 = (unint64_t)v299[1] - 1;
        if (((unint64_t)v299[1] & ((unint64_t)v299[1] - 1)) != 0)
        {
          if (v299[1] <= (void *)*(void *)&v239)
          {
            int8x8_t v225 = (int8x8_t)(*(void *)&v239 % (unint64_t)v299[1]);
            v253 = (void *)*((void *)v299[0] + *(void *)&v239 % (unint64_t)v299[1]);
            v254 = (void *)v326;
            if (v253)
            {
LABEL_52:
              void *v254 = *v253;
              void *v253 = v326;
              goto LABEL_87;
            }
          }
          else
          {
            int8x8_t v225 = v239;
            v253 = (void *)*((void *)v299[0] + *(void *)&v239);
            v254 = (void *)v326;
            if (v253) {
              goto LABEL_52;
            }
          }
        }
        else
        {
          int8x8_t v225 = (int8x8_t)(v262 & *(void *)&v239);
          v253 = (void *)*((void *)v299[0] + (v262 & *(void *)&v239));
          v254 = (void *)v326;
          if (v253) {
            goto LABEL_52;
          }
        }
      }
      void *v254 = v300[0];
      v300[0] = (void *)v326;
      *((void *)v299[0] + *(void *)&v225) = v300;
      if (*(void *)v326)
      {
        unint64_t v263 = *(void *)(*(void *)v326 + 8);
        if ((v238 & (v238 - 1)) != 0)
        {
          if (v263 >= v238) {
            v263 %= v238;
          }
        }
        else
        {
          v263 &= v238 - 1;
        }
        *((void *)v299[0] + v263) = v326;
      }
LABEL_87:
      ++v300[1];
LABEL_88:
      v237 = *(int **)v237;
    }
    while (v237);
  }
  v296 = 0;
  v297 = 0;
  v298 = 0;
  v264 = (char *)v302;
  v265 = v303;
  *(void *)&long long v326 = &v296;
  BYTE8(v326) = 0;
  int64_t v266 = v303 - (unsigned char *)v302;
  if (v303 != v302)
  {
    unint64_t v267 = 0xCCCCCCCCCCCCCCCDLL * (v266 >> 3);
    if (v267 >= 0x666666666666667) {
      sub_1C494A220();
    }
    v268 = (char *)operator new(v266);
    uint64_t v269 = 0;
    v296 = v268;
    v297 = v268;
    v298 = &v268[40 * v267];
    do
    {
      sub_1C4ACC244((uint64_t)&v268[v269], (uint64_t)&v264[v269]);
      v269 += 40;
    }
    while (&v264[v269] != v265);
    v297 = &v268[v269];
  }
  sub_1C4ABFD00((uint64_t)a3, (uint64_t)v299, (uint64_t *)&v296);
  v270 = (char *)v296;
  if (v296)
  {
    v271 = v297;
    v272 = v296;
    if (v297 != v296)
    {
      do
      {
        v273 = (void *)*((void *)v271 - 3);
        if (v273)
        {
          do
          {
            v274 = (void *)*v273;
            operator delete(v273);
            v273 = v274;
          }
          while (v274);
        }
        v276 = (void *)*((void *)v271 - 5);
        v271 -= 40;
        v275 = v276;
        *(void *)v271 = 0;
        if (v276) {
          operator delete(v275);
        }
      }
      while (v271 != v270);
      v272 = v296;
    }
    v297 = v270;
    operator delete(v272);
  }
  v278 = v300[0];
  if (v300[0])
  {
    do
    {
      v283 = (void *)*v278;
      v284 = (void *)v278[3];
      if (v284)
      {
        v278[4] = v284;
        operator delete(v284);
      }
      operator delete(v278);
      v278 = v283;
    }
    while (v283);
  }
  v279 = v299[0];
  v299[0] = 0;
  if (v279) {
    operator delete(v279);
  }
  v280 = (char *)v302;
  if (v302)
  {
    v281 = v303;
    v282 = v302;
    if (v303 != v302)
    {
      do
      {
        v285 = (void *)*((void *)v281 - 3);
        if (v285)
        {
          do
          {
            v286 = (void *)*v285;
            operator delete(v285);
            v285 = v286;
          }
          while (v286);
        }
        v288 = (void *)*((void *)v281 - 5);
        v281 -= 40;
        v287 = v288;
        *(void *)v281 = 0;
        if (v288) {
          operator delete(v287);
        }
      }
      while (v281 != v280);
      v282 = v302;
    }
    v303 = v280;
    operator delete(v282);
  }
  v289 = v306[0];
  if (v306[0])
  {
    do
    {
      v291 = (void *)*v289;
      v292 = (void *)v289[3];
      if (v292)
      {
        v289[4] = v292;
        operator delete(v292);
      }
      operator delete(v289);
      v289 = v291;
    }
    while (v291);
  }
  v290 = (void *)__n[0];
  __n[0] = 0;
  if (v290) {
    operator delete(v290);
  }
}

- (id)recognizeDrawing:(id)a3 beamSize:(int64_t)a4 shouldCancel:(id)a5
{
  int v89 = a4;
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v91 = a3;
  uint64_t v92 = (uint64_t (**)(void))a5;
  id v104 = 0;
  objc_msgSend__extractFeaturesFromDrawing_error_(self, v7, (uint64_t)v91, (uint64_t)&v104, v8, v9);
  id v90 = v104;
  if (v90)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v14 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = objc_msgSend_localizedDescription(v90, v15, v16, v17, v18, v19);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_FAULT, "An error occurred in the math model when extracting features: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v92 && (v92[2]() & 1) != 0)
  {
    uint64_t v21 = 0;
    uint64_t v22 = v108;
    if (v108) {
      goto LABEL_74;
    }
    goto LABEL_75;
  }
  objc_msgSend__createCompressedInputImage_(self, v10, (uint64_t)v105, v11, v12, v13);
  uint64_t v100 = 0;
  v101 = 0;
  unint64_t v102 = 0;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v93 = self->_codeMap;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v23, (uint64_t)&v96, (uint64_t)v116, 16, v24);
  if (!v25) {
    goto LABEL_55;
  }
  uint64_t v26 = *(void *)v97;
  uint64_t v27 = self;
  do
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v97 != v26) {
        objc_enumerationMutation(v93);
      }
      id v33 = *(id *)(*((void *)&v96 + 1) + 8 * i);
      uint64_t v39 = (const char *)objc_msgSend_UTF8String(v33, v34, v35, v36, v37, v38);
      uint64_t v40 = v39;
      uint64_t v41 = v101;
      if ((unint64_t)v101 < v102)
      {
        size_t v42 = strlen(v39);
        if (v42 > 0x7FFFFFFFFFFFFFF7) {
          sub_1C4949B7C();
        }
        size_t v43 = v42;
        if (v42 < 0x17)
        {
          *((unsigned char *)v101 + 23) = v42;
          uint64_t v29 = v41;
          if (v42) {
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v44 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v42 | 7) != 0x17) {
            uint64_t v44 = v42 | 7;
          }
          uint64_t v45 = v44 + 1;
          uint64_t v29 = operator new(v44 + 1);
          v41[1] = (void *)v43;
          v41[2] = (void *)(v45 | 0x8000000000000000);
          *uint64_t v41 = v29;
LABEL_15:
          memmove(v29, v40, v43);
        }
        *((unsigned char *)v29 + v43) = 0;
        uint64_t v32 = v41 + 3;
        self = v27;
        goto LABEL_17;
      }
      unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (unsigned char *)v100) >> 3);
      unint64_t v47 = v46 + 1;
      if (v46 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_1C494A220();
      }
      if (0x5555555555555556 * ((uint64_t)(v102 - (void)v100) >> 3) > v47) {
        unint64_t v47 = 0x5555555555555556 * ((uint64_t)(v102 - (void)v100) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v102 - (void)v100) >> 3) >= 0x555555555555555) {
        unint64_t v48 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v48 = v47;
      }
      v115 = &v102;
      if (v48)
      {
        if (v48 > 0xAAAAAAAAAAAAAAALL) {
          sub_1C4949AA8();
        }
        uint64_t v49 = (char *)operator new(24 * v48);
      }
      else
      {
        uint64_t v49 = 0;
      }
      uint64_t v50 = &v49[24 * v46];
      *(void *)&long long buf = v49;
      *((void *)&buf + 1) = v50;
      uint64_t v113 = v50;
      uint64_t v114 = &v49[24 * v48];
      size_t v51 = strlen(v40);
      if (v51 > 0x7FFFFFFFFFFFFFF7) {
        sub_1C4949B7C();
      }
      size_t v52 = v51;
      if (v51 >= 0x17)
      {
        uint64_t v58 = (v51 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v51 | 7) != 0x17) {
          uint64_t v58 = v51 | 7;
        }
        uint64_t v59 = v58 + 1;
        uint64_t v60 = (char *)operator new(v58 + 1);
        *((void *)v50 + 1) = v52;
        *((void *)v50 + 2) = v59 | 0x8000000000000000;
        *(void *)uint64_t v50 = v60;
        uint64_t v50 = v60;
      }
      else
      {
        v50[23] = v51;
        if (!v51)
        {
          *uint64_t v50 = 0;
          uint64_t v53 = (char *)*((void *)&buf + 1);
          uint64_t v32 = (void **)(v113 + 24);
          uint64_t v54 = (void **)v100;
          uint64_t v55 = v101;
          if (v101 == v100) {
            goto LABEL_51;
          }
          goto LABEL_40;
        }
      }
      memmove(v50, v40, v52);
      v50[v52] = 0;
      uint64_t v53 = (char *)*((void *)&buf + 1);
      uint64_t v32 = (void **)(v113 + 24);
      uint64_t v54 = (void **)v100;
      uint64_t v55 = v101;
      if (v101 == v100)
      {
LABEL_51:
        uint64_t v100 = v53;
        v101 = v32;
        unint64_t v102 = (unint64_t)v114;
        self = v27;
        goto LABEL_52;
      }
LABEL_40:
      self = v27;
      do
      {
        long long v56 = *(_OWORD *)(v55 - 3);
        *((void *)v53 - 1) = *(v55 - 1);
        *(_OWORD *)(v53 - 24) = v56;
        v53 -= 24;
        *(v55 - 2) = 0;
        *(v55 - 1) = 0;
        *(v55 - 3) = 0;
        v55 -= 3;
      }
      while (v55 != v54);
      uint64_t v55 = (void **)v100;
      uint64_t v57 = v101;
      uint64_t v100 = v53;
      v101 = v32;
      unint64_t v102 = (unint64_t)v114;
      while (v57 != v55)
      {
        if (*((char *)v57 - 1) < 0) {
          operator delete(*(v57 - 3));
        }
        v57 -= 3;
      }
LABEL_52:
      if (v55) {
        operator delete(v55);
      }
LABEL_17:
      v101 = v32;
    }
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v30, (uint64_t)&v96, (uint64_t)v116, 16, v31);
  }
  while (v25);
LABEL_55:

  objc_msgSend_segmentationAttThreshold(self, v61, v62, v63, v64, v65);
  sub_1C4ABF2EC((uint64_t *)&buf, (uint64_t *)&v100, v66);
  objc_msgSend_setUpMathDecoder_imageCompressed_(self, v67, (uint64_t)&buf, (uint64_t)v103, v68, v69);
  uint64_t v70 = MEMORY[0x1C8786E90](v92);
  v110[0] = &unk_1F2010FD0;
  v110[1] = v70;
  v111 = v110;
  int v76 = objc_msgSend_strokeCount(v91, v71, v72, v73, v74, v75);
  sub_1C4AC2C8C((uint64_t)&buf, self, v76, (uint64_t)v105, v103, v89, (uint64_t)v110, &__p);
  objc_msgSend_filterOutAlternatives_codemap_(self, v77, (uint64_t)&__p, (uint64_t)&v100, v78, v79);
  uint64_t v21 = objc_msgSend__bestPathTokensFromDecodingStates_drawing_codemap_(self, v80, (uint64_t)&__p, (uint64_t)v91, (uint64_t)&v100, v81);
  uint64_t v82 = __p;
  if (__p)
  {
    uint64_t v83 = (uint64_t)v95;
    int v84 = __p;
    if (v95 != __p)
    {
      do
        uint64_t v83 = sub_1C4AC89C8(v83 - 248);
      while ((void *)v83 != v82);
      int v84 = __p;
    }
    uint64_t v95 = v82;
    operator delete(v84);
  }
  if (v111 == v110)
  {
    (*(void (**)(void *))(v110[0] + 32))(v110);
    sub_1C4BFE924((uint64_t)&buf);
    uint64_t v85 = (void **)v100;
    if (!v100) {
      goto LABEL_73;
    }
    goto LABEL_66;
  }
  if (v111) {
    (*(void (**)(void))(*v111 + 40))();
  }
  sub_1C4BFE924((uint64_t)&buf);
  uint64_t v85 = (void **)v100;
  if (v100)
  {
LABEL_66:
    uint64_t v86 = v101;
    uint64_t v87 = v85;
    if (v101 != v85)
    {
      do
      {
        if (*((char *)v86 - 1) < 0) {
          operator delete(*(v86 - 3));
        }
        v86 -= 3;
      }
      while (v86 != v85);
      uint64_t v87 = v100;
    }
    v101 = v85;
    operator delete(v87);
  }
LABEL_73:
  *(void *)&long long buf = v103;
  sub_1C4BFFAC8((void ***)&buf);
  uint64_t v22 = v108;
  if (v108)
  {
LABEL_74:
    uint64_t v109 = v22;
    operator delete(v22);
  }
LABEL_75:
  if (v106)
  {
    uint64_t v107 = v106;
    operator delete(v106);
  }
  if (v105[0])
  {
    v105[1] = v105[0];
    operator delete(v105[0]);
  }

  return v21;
}

- (FeatureArray)_extractFeaturesFromDrawing:(SEL)a3 error:(id)a4
{
  uint64_t v7 = (CoreHandwriting *)a4;
  uint64_t v13 = objc_msgSend_renderSymbolSize(self, v8, v9, v10, v11, v12);
  int v19 = objc_msgSend_minInputHeight(self, v14, v15, v16, v17, v18);
  int v25 = objc_msgSend_maxInputHeight(self, v20, v21, v22, v23, v24);
  char v47 = 1;
  int v49 = v19;
  int v50 = objc_msgSend_minInputWidth(self, v26, v27, v28, v29, v30);
  int v51 = v25;
  int v52 = objc_msgSend_maxInputWidth(self, v31, v32, v33, v34, v35);
  unint64_t v46 = &unk_1F2012218;
  uint64_t v53 = v13;
  int32x2_t v48 = vmovn_s64(*(int64x2_t *)&self->_padToMultipleOf);
  CoreHandwriting::drawingToInk(v7, MEMORY[0x1E4F1DAD8], (uint64_t *)&v43);
  CoreHandwriting::InkToImageBaseFeatureExtractionStep::process((CoreHandwriting::InkToImageBaseFeatureExtractionStep *)&v46, (double ***)&v43, retstr);
  if (__p) {
    operator delete(__p);
  }
  uint64_t v36 = (char *)v43;
  if (v43)
  {
    uint64_t v37 = v44;
    uint64_t v38 = v43;
    if (v44 != v43)
    {
      uint64_t v39 = v44;
      do
      {
        uint64_t v41 = (void *)*((void *)v39 - 3);
        v39 -= 24;
        uint64_t v40 = v41;
        if (v41)
        {
          *((void *)v37 - 2) = v40;
          operator delete(v40);
        }
        uint64_t v37 = v39;
      }
      while (v39 != v36);
      uint64_t v38 = v43;
    }
    uint64_t v44 = v36;
    operator delete(v38);
  }

  return result;
}

- (vector<std::vector<std::unordered_map<int,)_createCompressedInputImage:()std:(int>>>> *__return_ptr)retstr :(CHEncoderDecoderNetwork *)self allocator<std:(SEL)a3 :(const void *)a4 vector<std::unordered_map<int
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  unint64_t v9 = **(void **)a4;
  unint64_t v10 = objc_msgSend_encoderCompressionFactor(self, a3, (uint64_t)a4, v4, v5, v6);
  unint64_t v11 = *(void *)(*(void *)a4 + 8);
  unint64_t v17 = objc_msgSend_encoderCompressionFactor(self, v12, v13, v14, v15, v16);
  unint64_t v18 = v9 / v10;
  var0 = (void **)retstr->var0;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)retstr->var2.var0 - (char *)retstr->var0) >> 3) < (int)v18)
  {
    if (((v18 << 32) & 0x8000000000000000) != 0) {
      sub_1C494A220();
    }
    var1 = (char *)retstr->var1;
    uint64_t v21 = (char *)operator new(24 * (int)v18);
    uint64_t v22 = &v21[24 * (int)v18];
    uint64_t v23 = &v21[24 * ((var1 - (char *)var0) / 24)];
    if (var1 == (char *)var0)
    {
      retstr->var0 = v23;
      retstr->var1 = v23;
      retstr->var2.var0 = v22;
      if (var0) {
LABEL_21:
      }
        operator delete(var0);
    }
    else
    {
      uint64_t v24 = &v21[24 * ((var1 - (char *)var0) / 24)];
      do
      {
        long long v25 = *(_OWORD *)(var1 - 24);
        var1 -= 24;
        *(_OWORD *)(v24 - 24) = v25;
        v24 -= 24;
        *((void *)v24 + 2) = *((void *)var1 + 2);
        *(void *)var1 = 0;
        *((void *)var1 + 1) = 0;
        *((void *)var1 + 2) = 0;
      }
      while (var1 != (char *)var0);
      var0 = (void **)retstr->var0;
      uint64_t v26 = (void **)retstr->var1;
      retstr->var0 = v24;
      retstr->var1 = v23;
      retstr->var2.var0 = v22;
      if (v26 != var0)
      {
        unint64_t v188 = v11;
        uint64_t v27 = v26;
        do
        {
          uint64_t v30 = *(v27 - 3);
          v27 -= 3;
          uint64_t v29 = v30;
          if (v30)
          {
            uint64_t v31 = *(v26 - 2);
            uint64_t v28 = v29;
            if (v31 != v29)
            {
              do
              {
                uint64_t v32 = (void *)*(v31 - 3);
                if (v32)
                {
                  do
                  {
                    uint64_t v33 = (void *)*v32;
                    operator delete(v32);
                    uint64_t v32 = v33;
                  }
                  while (v33);
                }
                uint64_t v35 = (void *)*(v31 - 5);
                v31 -= 5;
                uint64_t v34 = v35;
                *uint64_t v31 = 0;
                if (v35) {
                  operator delete(v34);
                }
              }
              while (v31 != v29);
              uint64_t v28 = *v27;
            }
            *(v26 - 2) = v29;
            operator delete(v28);
          }
          uint64_t v26 = v27;
        }
        while (v27 != var0);
        unint64_t v11 = v188;
      }
      if (var0) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v36 = (int *)operator new(0x10uLL);
  size_t v42 = v36;
  *(void *)uint64_t v36 = 0;
  *((void *)v36 + 1) = 0;
  if ((int)v18 >= 1)
  {
    uint64_t v43 = 0;
    unint64_t v178 = v11 / v17;
    unint64_t v179 = (v11 / v17) << 32;
    uint64_t v187 = (v11 / v17);
    int v176 = v11 / v17;
    uint64_t v177 = v18;
    uint64_t v44 = v36 + 2;
    uint64_t v189 = v36 + 2;
    do
    {
      long long __p = 0;
      uint64_t v195 = 0;
      v196 = 0;
      if (v179)
      {
        if ((v179 & 0x8000000000000000) != 0) {
          sub_1C494A220();
        }
        long long __p = operator new(40 * v176);
        uint64_t v195 = (char *)__p;
        v196 = (char *)__p + 40 * v176;
      }
      if ((int)v178 >= 1)
      {
        for (uint64_t i = 0; i != v187; ++i)
        {
          uint64_t v47 = 0;
          *(_OWORD *)__n = 0u;
          *(_OWORD *)v192 = 0u;
          int v193 = 1065353216;
          while (objc_msgSend_encoderCompressionFactor(self, (const char *)v37, (uint64_t)v38, v39, v40, v41) > v47)
          {
            for (uint64_t j = 0;
                  objc_msgSend_encoderCompressionFactor(self, (const char *)v37, (uint64_t)v38, v39, v40, v41) > j;
                  ++j)
            {
              *(void *)size_t v42 = v47
                             + objc_msgSend_encoderCompressionFactor(self, (const char *)v37, (uint64_t)v38, v39, v40, v41)* v43;
              unint64_t v55 = j + objc_msgSend_encoderCompressionFactor(self, v50, v51, v52, v53, v54) * i;
              *((void *)v42 + 1) = v55;
              if (*(void *)v42 >= **(void **)a4 || v55 >= *(void *)(*(void *)a4 + 8)) {
                continue;
              }
              uint64_t v57 = (char *)*((void *)a4 + 3);
              long long v56 = (char *)*((void *)a4 + 4);
              if ((unint64_t)(v56 - v57) > 0x10) {
                long long v56 = v57 + 16;
              }
              if (v57 == v56)
              {
                uint64_t v63 = (float *)*((void *)a4 + 6);
                if (*v63 <= 0.0) {
                  continue;
                }
                int v190 = 0;
                int v64 = (int)(float)(*v63 + -1.0);
                int v190 = v64;
                unint64_t v65 = __n[1];
                if (!__n[1]) {
                  goto LABEL_37;
                }
                goto LABEL_62;
              }
              unint64_t v58 = v56 - v57 - 8;
              unint64_t v59 = v58 >> 3;
              if (v58 < 8)
              {
                int v60 = 0;
                uint64_t v61 = v42;
                uint64_t v62 = (char *)*((void *)a4 + 3);
                do
                {
LABEL_54:
                  int v73 = *(_DWORD *)v62;
                  v62 += 8;
                  int v72 = v73;
                  int v74 = *v61;
                  v61 += 2;
                  v60 += v74 * v72;
                }
                while (v62 != v56);
                goto LABEL_55;
              }
              int v66 = 0;
              int v67 = 0;
              uint64_t v68 = (v59 + 1) & 0x3FFFFFFFFFFFFFFELL;
              uint64_t v61 = &v42[2 * v68];
              uint64_t v62 = &v57[8 * v68];
              uint64_t v69 = (unsigned int *)(v57 + 8);
              uint64_t v37 = v68;
              uint64_t v38 = v44;
              do
              {
                uint64_t v39 = *(v69 - 2);
                unsigned int v70 = *v69;
                v69 += 4;
                uint64_t v40 = v70;
                uint64_t v41 = *(v38 - 2);
                int v71 = *v38;
                v38 += 4;
                v66 += v41 * v39;
                v67 += v71 * v40;
                v37 -= 2;
              }
              while (v37);
              int v60 = v67 + v66;
              if (v59 + 1 != v68) {
                goto LABEL_54;
              }
LABEL_55:
              uint64_t v75 = *((void *)a4 + 6);
              if (*(float *)(v75 + 4 * v60) <= 0.0) {
                continue;
              }
              int v76 = 0;
              int v190 = 0;
              uint64_t v77 = v42;
              if (v58 < 8) {
                goto LABEL_210;
              }
              int v78 = 0;
              int v79 = 0;
              unint64_t v80 = v59 + 1;
              uint64_t v81 = 2 * (v80 & 0x3FFFFFFFFFFFFFFELL);
              uint64_t v77 = &v42[v81];
              uint64_t v82 = &v57[v81 * 4];
              uint64_t v83 = (int *)(v57 + 8);
              uint64_t v84 = v80 & 0x3FFFFFFFFFFFFFFELL;
              uint64_t v85 = v44;
              do
              {
                int v86 = *(v83 - 2);
                int v88 = *v83;
                v83 += 4;
                int v87 = v88;
                int v89 = *(v85 - 2);
                int v90 = *v85;
                v85 += 4;
                v78 += v89 * v86;
                v79 += v90 * v87;
                v84 -= 2;
              }
              while (v84);
              int v76 = v79 + v78;
              uint64_t v57 = v82;
              if (v80 != (v80 & 0x3FFFFFFFFFFFFFFELL))
              {
LABEL_210:
                do
                {
                  int v92 = *(_DWORD *)v57;
                  v57 += 8;
                  int v91 = v92;
                  int v93 = *v77;
                  v77 += 2;
                  v76 += v93 * v91;
                }
                while (v57 != v56);
              }
              int v64 = (int)(float)(*(float *)(v75 + 4 * v76) + -1.0);
              int v190 = v64;
              unint64_t v65 = __n[1];
              if (!__n[1]) {
                goto LABEL_37;
              }
LABEL_62:
              uint8x8_t v94 = (uint8x8_t)vcnt_s8((int8x8_t)v65);
              v94.i16[0] = vaddlv_u8(v94);
              if (v94.u32[0] > 1uLL)
              {
                unint64_t v95 = v64;
                if (v65 <= v64) {
                  unint64_t v95 = v64 % v65;
                }
              }
              else
              {
                unint64_t v95 = (v65 - 1) & v64;
              }
              long long v96 = *(uint64_t ***)(__n[0] + 8 * v95);
              if (v96)
              {
                long long v97 = *v96;
                if (v97)
                {
                  if (v94.u32[0] < 2uLL)
                  {
                    unint64_t v98 = v65 - 1;
                    while (1)
                    {
                      uint64_t v100 = v97[1];
                      if (v100 == v64)
                      {
                        if (*((_DWORD *)v97 + 4) == v64) {
                          goto LABEL_38;
                        }
                      }
                      else if ((v100 & v98) != v95)
                      {
                        goto LABEL_37;
                      }
                      long long v97 = (uint64_t *)*v97;
                      if (!v97) {
                        goto LABEL_37;
                      }
                    }
                  }
                  do
                  {
                    unint64_t v99 = v97[1];
                    if (v99 == v64)
                    {
                      if (*((_DWORD *)v97 + 4) == v64) {
                        goto LABEL_38;
                      }
                    }
                    else
                    {
                      if (v99 >= v65) {
                        v99 %= v65;
                      }
                      if (v99 != v95) {
                        break;
                      }
                    }
                    long long v97 = (uint64_t *)*v97;
                  }
                  while (v97);
                }
              }
LABEL_37:
              uint64_t v197 = &v190;
              *((_DWORD *)sub_1C4ACC388((uint64_t)__n, &v190, (uint64_t)&unk_1C4C39B40, &v197) + 5) = 0;
LABEL_38:
              uint64_t v197 = &v190;
              int v49 = sub_1C4ACC388((uint64_t)__n, &v190, (uint64_t)&unk_1C4C39B40, &v197);
              ++*((_DWORD *)v49 + 5);
            }
            ++v47;
          }
          v101 = v195;
          if (v195 >= v196)
          {
            unint64_t v105 = 0xCCCCCCCCCCCCCCCDLL * ((v195 - (unsigned char *)__p) >> 3);
            unint64_t v106 = v105 + 1;
            if (v105 + 1 > 0x666666666666666) {
              sub_1C494A220();
            }
            if (0x999999999999999ALL * ((v196 - (unsigned char *)__p) >> 3) > v106) {
              unint64_t v106 = 0x999999999999999ALL * ((v196 - (unsigned char *)__p) >> 3);
            }
            if (0xCCCCCCCCCCCCCCCDLL * ((v196 - (unsigned char *)__p) >> 3) >= 0x333333333333333) {
              unint64_t v107 = 0x666666666666666;
            }
            else {
              unint64_t v107 = v106;
            }
            p_var2 = (__compressed_pair<std::vector<std::unordered_map<int, int>> *, std::allocator<std::vector<std::unordered_map<int, int>>>> *)&v196;
            if (v107)
            {
              if (v107 > 0x666666666666666) {
                sub_1C4949AA8();
              }
              uint64_t v108 = (int *)operator new(40 * v107);
            }
            else
            {
              uint64_t v108 = 0;
            }
            uint64_t v111 = (uint64_t)&v108[10 * v105];
            uint64_t v197 = v108;
            uint64_t v198 = (char *)v111;
            uint64_t v199 = (int *)v111;
            v200 = &v108[10 * v107];
            *(_OWORD *)uint64_t v111 = 0u;
            *(_OWORD *)(v111 + 16) = 0u;
            *(_DWORD *)(v111 + 32) = v193;
            size_t prime = __n[1];
            if (__n[1] == 1)
            {
              size_t prime = 2;
              goto LABEL_104;
            }
            if ((__n[1] & (__n[1] - 1)) != 0)
            {
              size_t prime = std::__next_prime(__n[1]);
              int8x8_t v127 = *(int8x8_t *)(v111 + 8);
              BOOL v128 = prime >= *(void *)&v127;
              if (prime > *(void *)&v127) {
                goto LABEL_104;
              }
            }
            else
            {
              int8x8_t v127 = 0;
              BOOL v128 = 1;
              if (__n[1]) {
                goto LABEL_104;
              }
            }
            if (!v128)
            {
              unint64_t v140 = vcvtps_u32_f32((float)*(unint64_t *)(v111 + 24) / *(float *)(v111 + 32));
              if (*(void *)&v127 < 3uLL
                || (uint8x8_t v141 = (uint8x8_t)vcnt_s8(v127), v141.i16[0] = vaddlv_u8(v141), v141.u32[0] > 1uLL))
              {
                unint64_t v140 = std::__next_prime(v140);
              }
              else
              {
                uint64_t v142 = 1 << -(char)__clz(v140 - 1);
                if (v140 >= 2) {
                  unint64_t v140 = v142;
                }
              }
              if (prime <= v140) {
                size_t prime = v140;
              }
              if (prime < *(void *)&v127) {
LABEL_104:
              }
                sub_1C4949C24(v111, prime);
            }
            uint64_t v113 = v192[0];
            if (v192[0])
            {
              do
              {
                sub_1C4C00040(v111, v113[4], *((void *)v113 + 2));
                uint64_t v113 = *(_DWORD **)v113;
              }
              while (v113);
            }
            v115 = (int *)__p;
            uint64_t v114 = (int *)v195;
            uint64_t v116 = v198;
            uint64_t v117 = v199;
            if (v195 == __p)
            {
              uint64_t v126 = (int *)v195;
            }
            else
            {
              uint64_t v118 = 0;
              do
              {
                uint64_t v120 = &v116[v118 * 4];
                uint64_t v121 = &v114[v118];
                uint64_t v122 = *(void *)&v114[v118 - 10];
                *((void *)v121 - 5) = 0;
                *((void *)v120 - 5) = v122;
                *((void *)v120 - 4) = *(void *)&v114[v118 - 8];
                *((void *)v121 - 4) = 0;
                uint64_t v123 = *(void *)&v114[v118 - 6];
                *(void *)&v116[v118 * 4 - 24] = v123;
                uint64_t v124 = *(void *)&v114[v118 - 4];
                *((void *)v120 - 2) = v124;
                uint64_t v37 = v114[v118 - 2];
                *((_DWORD *)v120 - 2) = v37;
                if (v124)
                {
                  unint64_t v119 = *(void *)(v123 + 8);
                  unint64_t v125 = *((void *)v120 - 4);
                  if ((v125 & (v125 - 1)) != 0)
                  {
                    if (v119 >= v125) {
                      v119 %= v125;
                    }
                  }
                  else
                  {
                    v119 &= v125 - 1;
                  }
                  *(void *)(v122 + 8 * v119) = &v116[v118 * 4 - 24];
                  *(void *)&v114[v118 - 6] = 0;
                  *(void *)&v114[v118 - 4] = 0;
                }
                v118 -= 10;
              }
              while (&v114[v118] != v115);
              uint64_t v126 = (int *)__p;
              uint64_t v114 = (int *)v195;
              v116 += v118 * 4;
            }
            id v104 = (char *)(v117 + 10);
            long long __p = v116;
            uint64_t v195 = (char *)(v117 + 10);
            uint64_t v129 = v196;
            v196 = (char *)v200;
            v200 = (int *)v129;
            uint64_t v197 = v126;
            uint64_t v198 = (char *)v126;
            if (v114 != v126)
            {
              v184 = (char *)(v117 + 10);
              do
              {
                uint64_t v130 = (void **)(v114 - 10);
                uint64_t v199 = v114 - 10;
                uint64_t v131 = (void *)*((void *)v114 - 3);
                if (v131)
                {
                  do
                  {
                    int v132 = (void *)*v131;
                    operator delete(v131);
                    uint64_t v131 = v132;
                  }
                  while (v132);
                }
                v133 = *v130;
                *uint64_t v130 = 0;
                if (v133) {
                  operator delete(v133);
                }
                uint64_t v114 = v199;
              }
              while (v199 != v126);
              uint64_t v114 = v197;
              id v104 = v184;
            }
            if (v114) {
              operator delete(v114);
            }
            goto LABEL_131;
          }
          *(_OWORD *)uint64_t v195 = 0u;
          v101[1] = 0u;
          *((_DWORD *)v101 + 8) = v193;
          size_t v102 = __n[1];
          if (__n[1] == 1)
          {
            size_t v102 = 2;
            goto LABEL_85;
          }
          if ((__n[1] & (__n[1] - 1)) != 0)
          {
            size_t v102 = std::__next_prime(__n[1]);
            int8x8_t v109 = *(int8x8_t *)((char *)v101 + 8);
            BOOL v110 = v102 >= *(void *)&v109;
            if (v102 > *(void *)&v109) {
              goto LABEL_85;
            }
          }
          else
          {
            int8x8_t v109 = 0;
            BOOL v110 = 1;
            if (__n[1]) {
              goto LABEL_85;
            }
          }
          if (!v110)
          {
            unint64_t v137 = vcvtps_u32_f32((float)*((unint64_t *)v101 + 3) / *((float *)v101 + 8));
            if (*(void *)&v109 < 3uLL
              || (uint8x8_t v138 = (uint8x8_t)vcnt_s8(v109), v138.i16[0] = vaddlv_u8(v138), v138.u32[0] > 1uLL))
            {
              unint64_t v137 = std::__next_prime(v137);
            }
            else
            {
              uint64_t v139 = 1 << -(char)__clz(v137 - 1);
              if (v137 >= 2) {
                unint64_t v137 = v139;
              }
            }
            if (v102 <= v137) {
              size_t v102 = v137;
            }
            if (v102 < *(void *)&v109) {
LABEL_85:
            }
              sub_1C4949C24((uint64_t)v101, v102);
          }
          uint64_t v103 = v192[0];
          if (v192[0])
          {
            do
            {
              sub_1C4C00040((uint64_t)v101, v103[4], *((void *)v103 + 2));
              uint64_t v103 = *(_DWORD **)v103;
            }
            while (v103);
          }
          id v104 = (char *)v101 + 40;
LABEL_131:
          uint64_t v195 = v104;
          uint64_t v134 = v192[0];
          if (v192[0])
          {
            do
            {
              uint64_t v135 = (void *)*v134;
              operator delete(v134);
              uint64_t v134 = v135;
            }
            while (v135);
          }
          uint64_t v136 = (void *)__n[0];
          __n[0] = 0;
          if (v136) {
            operator delete(v136);
          }
          uint64_t v44 = v189;
        }
      }
      uint64_t v143 = retstr;
      uint64_t v145 = (char *)retstr->var1;
      uint64_t v144 = (char *)retstr->var2.var0;
      if (v145 >= v144)
      {
        unint64_t v147 = 0xAAAAAAAAAAAAAAABLL * ((v145 - (char *)retstr->var0) >> 3);
        unint64_t v148 = v147 + 1;
        if (v147 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_1C494A220();
        }
        v150 = __p;
        uint64_t v149 = v195;
        unint64_t v151 = 0xAAAAAAAAAAAAAAABLL * ((v144 - (char *)retstr->var0) >> 3);
        if (2 * v151 > v148) {
          unint64_t v148 = 2 * v151;
        }
        if (v151 >= 0x555555555555555) {
          unint64_t v152 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v152 = v148;
        }
        p_var2 = &retstr->var2;
        if (v152)
        {
          uint64_t v185 = v195;
          if (v152 > 0xAAAAAAAAAAAAAAALL) {
            sub_1C4949AA8();
          }
          uint64_t v153 = (int *)operator new(24 * v152);
          uint64_t v149 = v185;
        }
        else
        {
          uint64_t v153 = 0;
        }
        uint64_t v154 = &v153[6 * v147];
        uint64_t v197 = v153;
        uint64_t v198 = (char *)v154;
        uint64_t v199 = v154;
        v200 = &v153[6 * v152];
        *((void *)v154 + 1) = 0;
        *((void *)v154 + 2) = 0;
        *(void *)uint64_t v154 = 0;
        sub_1C4C00328((uint64_t)v154, (uint64_t)v150, (uint64_t)v149, 0xCCCCCCCCCCCCCCCDLL * ((v149 - v150) >> 3));
        v155 = v198;
        v146 = v199 + 6;
        uint64_t v143 = retstr;
        uint64_t v157 = (void **)retstr->var0;
        uint64_t v156 = (void **)retstr->var1;
        if (v156 == retstr->var0)
        {
          retstr->var0 = v198;
          retstr->var1 = v146;
          retstr->var2.var0 = v200;
          if (!v156) {
            goto LABEL_189;
          }
        }
        else
        {
          do
          {
            *((void *)v155 - 3) = 0;
            *((void *)v155 - 2) = 0;
            v155 -= 24;
            *((void *)v155 + 2) = 0;
            long long v158 = *(_OWORD *)(v156 - 3);
            v156 -= 3;
            *(_OWORD *)v155 = v158;
            *((void *)v155 + 2) = v156[2];
            *uint64_t v156 = 0;
            v156[1] = 0;
            v156[2] = 0;
          }
          while (v156 != v157);
          uint64_t v156 = (void **)retstr->var0;
          v159 = (void **)retstr->var1;
          retstr->var0 = v155;
          retstr->var1 = v146;
          retstr->var2.var0 = v200;
          if (v159 != v156)
          {
            v160 = v159;
            uint64_t v181 = v146;
            uint64_t v182 = v156;
            do
            {
              uint64_t v163 = *(v160 - 3);
              v160 -= 3;
              uint64_t v162 = v163;
              if (v163)
              {
                uint64_t v186 = v160;
                v164 = *(v159 - 2);
                uint64_t v161 = v162;
                if (v164 != v162)
                {
                  uint64_t v183 = v159;
                  do
                  {
                    uint64_t v165 = (void *)*(v164 - 3);
                    if (v165)
                    {
                      do
                      {
                        uint64_t v166 = (void *)*v165;
                        operator delete(v165);
                        uint64_t v165 = v166;
                      }
                      while (v166);
                    }
                    v168 = (void *)*(v164 - 5);
                    v164 -= 5;
                    uint64_t v167 = v168;
                    void *v164 = 0;
                    if (v168) {
                      operator delete(v167);
                    }
                  }
                  while (v164 != v162);
                  uint64_t v161 = *v186;
                  v146 = v181;
                  v159 = v183;
                }
                *(v159 - 2) = v162;
                operator delete(v161);
                uint64_t v156 = v182;
                v160 = v186;
              }
              v159 = v160;
            }
            while (v160 != v156);
            uint64_t v143 = retstr;
          }
          if (!v156) {
            goto LABEL_189;
          }
        }
        operator delete(v156);
      }
      else
      {
        *(void *)uint64_t v145 = 0;
        *((void *)v145 + 1) = 0;
        *((void *)v145 + 2) = 0;
        sub_1C4C00328((uint64_t)v145, (uint64_t)__p, (uint64_t)v195, 0xCCCCCCCCCCCCCCCDLL * ((v195 - (unsigned char *)__p) >> 3));
        v146 = v145 + 24;
        retstr->var1 = v146;
      }
LABEL_189:
      v143->var1 = v146;
      uint64_t v169 = (char *)__p;
      if (__p)
      {
        uint64_t v170 = v195;
        uint64_t v45 = __p;
        if (v195 != __p)
        {
          do
          {
            uint64_t v171 = (void *)*((void *)v170 - 3);
            if (v171)
            {
              do
              {
                v172 = (void *)*v171;
                operator delete(v171);
                uint64_t v171 = v172;
              }
              while (v172);
            }
            uint64_t v174 = (void *)*((void *)v170 - 5);
            v170 -= 40;
            uint64_t v173 = v174;
            *(void *)uint64_t v170 = 0;
            if (v174) {
              operator delete(v173);
            }
          }
          while (v170 != v169);
          uint64_t v45 = __p;
          uint64_t v44 = v189;
        }
        uint64_t v195 = v169;
        operator delete(v45);
      }
      ++v43;
    }
    while (v43 != v177);
  }
  operator delete(v42);
  return result;
}

- (void)filterOutAlternatives:(void *)a3 codemap:(const void *)a4
{
  uint64_t v4 = *(void *)a3;
  uint64_t v5 = *((void *)a3 + 1);
  uint64_t v6 = v5 - *(void *)a3;
  if (v5 != *(void *)a3)
  {
    uint64_t v8 = *(void *)(v4 + 80) - *(void *)(v4 + 72);
    if (v8)
    {
      double v9 = *(float *)(v4 + 192);
      float v10 = v9 / pow((double)(unint64_t)(v8 >> 2), 0.330993);
      if (v6 < 249) {
        return;
      }
    }
    else
    {
      float v10 = *(float *)(v4 + 192);
      if (v6 < 249) {
        return;
      }
    }
    float v11 = v10 + -2.30258509;
    int64_t v12 = v6 / 0xF8uLL;
    unint64_t v13 = 248 * (v6 / 0xF8uLL) - 248;
    do
    {
      uint64_t v15 = *(void *)a3;
      uint64_t v16 = *(void *)a3 + 248 * (v12 - 1);
      uint64_t v17 = *(void *)(v16 + 80) - *(void *)(v16 + 72);
      if (v17)
      {
        double v18 = *(float *)(v16 + 192);
        float v19 = v18 / pow((double)(unint64_t)(v17 >> 2), 0.330993);
        if (v19 < v11) {
          goto LABEL_12;
        }
      }
      else if (*(float *)(v16 + 192) < v11)
      {
LABEL_12:
        if (v15 + 248 * v12 == v5)
        {
          uint64_t v20 = v16;
        }
        else
        {
          uint64_t v20 = v15 + v13;
          do
          {
            sub_1C4ACFB98(v16, v16 + 248);
            v20 += 248;
            uint64_t v21 = v16 + 496;
            v16 += 248;
          }
          while (v21 != v5);
          uint64_t v5 = *((void *)a3 + 1);
        }
        while (v5 != v20)
        {
          v5 -= 248;
          sub_1C4AC89C8(v5);
        }
        *((void *)a3 + 1) = v20;
        uint64_t v5 = v20;
      }
      v13 -= 248;
    }
    while (v12-- > 2);
  }
}

- (id)_bestPathTokensFromDecodingStates:(const void *)a3 drawing:(id)a4 codemap:(const void *)a5
{
  id v59 = a4;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  id v61 = (id)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = sub_1C4BFE5D8;
  v63[3] = &unk_1E64E4FD0;
  unint64_t v65 = a5;
  id v60 = v59;
  id v64 = v60;
  uint64_t v16 = (void (**)(void, void, void, void, __n128))MEMORY[0x1C8786E90](v63);
  uint64_t v17 = *(void *)a3;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    unint64_t v18 = 0;
    do
    {
      float v19 = (void *)(v17 + 248 * v18);
      uint64_t v20 = (uint64_t)(v19[10] - v19[9]) >> 2;
      if (v20 != 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19[7] - v19[6]) >> 3))
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v21 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1C492D000, v21, OS_LOG_TYPE_FAULT, "Predicted sequence and segmentation have different length", buf, 2u);
        }

        uint64_t v20 = (uint64_t)(*(void *)(*(void *)a3 + 248 * v18 + 80) - *(void *)(*(void *)a3 + 248 * v18 + 72)) >> 2;
      }
      uint64_t v26 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v12, v20, v13, v14, v15);
      uint64_t v28 = *(void *)a3;
      if ((int)((*(void *)(*(void *)a3 + 248 * v18 + 80) - *(void *)(*(void *)a3 + 248 * v18 + 72)) >> 2) >= 1)
      {
        uint64_t v29 = 0;
        do
        {
          uint64_t v30 = v28 + 248 * v18;
          uint64_t v33 = *(void *)(v30 + 176);
          uint64_t v31 = v30 + 176;
          uint64_t v32 = v33;
          v27.n128_u64[0] = 0;
          if (!v33) {
            goto LABEL_22;
          }
          uint64_t v34 = v31;
          uint64_t v35 = v32;
          do
          {
            uint64_t v36 = *(int *)(v35 + 28);
            BOOL v37 = v29 <= v36;
            if (v29 <= v36) {
              uint64_t v38 = (uint64_t *)v35;
            }
            else {
              uint64_t v38 = (uint64_t *)(v35 + 8);
            }
            if (v37) {
              uint64_t v34 = v35;
            }
            uint64_t v35 = *v38;
          }
          while (*v38);
          if (v34 != v31 && v29 >= *(int *)(v34 + 28))
          {
            uint64_t v45 = v31;
            do
            {
              uint64_t v46 = *(int *)(v32 + 28);
              BOOL v47 = v29 <= v46;
              if (v29 <= v46) {
                int32x2_t v48 = (uint64_t *)v32;
              }
              else {
                int32x2_t v48 = (uint64_t *)(v32 + 8);
              }
              if (v47) {
                uint64_t v45 = v32;
              }
              uint64_t v32 = *v48;
            }
            while (*v48);
            if (v45 == v31 || v29 < *(int *)(v45 + 28)) {
              uint64_t v45 = v31;
            }
            uint64_t v49 = *(void *)a5 + 24 * *(int *)(v45 + 32);
            if (*(char *)(v49 + 23) < 0) {
              uint64_t v49 = *(void *)v49;
            }
            uint64_t v39 = objc_msgSend_stringWithUTF8String_(NSString, v22, v49, v23, v24, v25, 0.0);
            uint64_t v28 = *(void *)a3;
            uint64_t v50 = *(void *)a3 + 248 * v18;
            uint64_t v53 = *(void *)(v50 + 176);
            uint64_t v51 = v50 + 176;
            uint64_t v52 = v53;
            if (!v53) {
              goto LABEL_49;
            }
            uint64_t v54 = v51;
            do
            {
              uint64_t v55 = *(int *)(v52 + 28);
              BOOL v56 = v29 <= v55;
              if (v29 <= v55) {
                uint64_t v57 = (uint64_t *)v52;
              }
              else {
                uint64_t v57 = (uint64_t *)(v52 + 8);
              }
              if (v56) {
                uint64_t v54 = v52;
              }
              uint64_t v52 = *v57;
            }
            while (*v57);
            if (v54 == v51 || v29 < *(int *)(v54 + 28)) {
LABEL_49:
            }
              uint64_t v54 = v51;
            v27.n128_f64[0] = *(float *)(v54 + 36);
          }
          else
          {
LABEL_22:
            uint64_t v39 = 0;
          }
          uint64_t v40 = ((void (**)(void, unint64_t, uint64_t, void *, __n128))v16)[2](v16, v28 + 248 * v18, v29, v39, v27);
          objc_msgSend_addObject_(v26, v41, (uint64_t)v40, v42, v43, v44);

          ++v29;
          uint64_t v28 = *(void *)a3;
        }
        while (v29 < (int)((*(void *)(*(void *)a3 + 248 * v18 + 80) - *(void *)(*(void *)a3 + 248 * v18 + 72)) >> 2));
      }
      objc_msgSend_addObject_(v61, v22, (uint64_t)v26, v23, v24, v25);

      ++v18;
      uint64_t v17 = *(void *)a3;
    }
    while (v18 < 0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
  }

  return v61;
}

- (CHSingletonMLModel)encoderModel
{
  return self->_encoderModel;
}

- (CHSingletonMLModel)decoderModel
{
  return self->_decoderModel;
}

- (NSArray)codeMap
{
  return self->_codeMap;
}

- (int64_t)eosIndex
{
  return self->_eosIndex;
}

- (float)segmentationAttThreshold
{
  return self->_segmentationAttThreshold;
}

- (int64_t)encoderCompressionFactor
{
  return self->_encoderCompressionFactor;
}

- (int64_t)renderSymbolSize
{
  return self->_renderSymbolSize;
}

- (int64_t)minInputHeight
{
  return self->_minInputHeight;
}

- (int64_t)maxInputHeight
{
  return self->_maxInputHeight;
}

- (int64_t)minInputWidth
{
  return self->_minInputWidth;
}

- (int64_t)maxInputWidth
{
  return self->_maxInputWidth;
}

- (int64_t)padToMultipleOf
{
  return self->_padToMultipleOf;
}

- (int64_t)enlargeSingleDotBy
{
  return self->_enlargeSingleDotBy;
}

- (int64_t)numInputChannels
{
  return self->_numInputChannels;
}

- (int64_t)numOutputClasses
{
  return self->_numOutputClasses;
}

- (NSSet)definedMathFunctionNameSet
{
  return self->_definedMathFunctionNameSet;
}

- (void)setDefinedMathFunctionNameSet:(id)a3
{
}

- (NSArray)recognitionLocales
{
  return self->_recognitionLocales;
}

- (void)setRecognitionLocales:(id)a3
{
}

- (NSSet)activeAlphabet
{
  return self->_activeAlphabet;
}

- (void)setActiveAlphabet:(id)a3
{
}

- (NSSet)declaredVariables
{
  return self->_declaredVariables;
}

- (void)setDeclaredVariables:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declaredVariables, 0);
  objc_storeStrong((id *)&self->_activeAlphabet, 0);
  objc_storeStrong((id *)&self->_recognitionLocales, 0);
  objc_storeStrong((id *)&self->_definedMathFunctionNameSet, 0);
  objc_storeStrong((id *)&self->_codeMap, 0);
  objc_storeStrong((id *)&self->_decoderModel, 0);
  objc_storeStrong((id *)&self->_encoderModel, 0);
}

@end