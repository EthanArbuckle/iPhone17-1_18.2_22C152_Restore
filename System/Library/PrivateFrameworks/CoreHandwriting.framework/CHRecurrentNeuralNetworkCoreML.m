@interface CHRecurrentNeuralNetworkCoreML
- (CHRecurrentNeuralNetworkCoreML)initWithModelName:(id)a3;
- (CHSingletonMLModel)model;
- (NSArray)inputNames;
- (NSArray)outputNames;
- (NSDictionary)classCounts;
- (NSDictionary)featureCounts;
- (NSString)resourcePath;
- (void)dealloc;
@end

@implementation CHRecurrentNeuralNetworkCoreML

- (CHRecurrentNeuralNetworkCoreML)initWithModelName:(id)a3
{
  uint64_t v223 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self
    || (v218.receiver = self,
        v218.super_class = (Class)CHRecurrentNeuralNetworkCoreML,
        (v5 = [(CHRecurrentNeuralNetwork *)&v218 initWithModelName:v4]) == 0))
  {
    v199 = 0;
    goto LABEL_53;
  }
  v199 = v5;
  id v197 = v4;
  id v6 = v4;
  v12 = (const char *)objc_msgSend_UTF8String(v6, v7, v8, v9, v10, v11);
  BOOL v13 = pathForResource(v12, 0, (UInt8 *)__s);
  size_t v14 = strlen(__s);
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1C4949B7C();
  }
  v18 = (void *)v14;
  if (v14 >= 0x17)
  {
    uint64_t v20 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v20 = v14 | 7;
    }
    uint64_t v21 = v20 + 1;
    v19 = (void **)operator new(v20 + 1);
    __dst[1] = v18;
    int64_t v217 = v21 | 0x8000000000000000;
    __dst[0] = v19;
    goto LABEL_11;
  }
  HIBYTE(v217) = v14;
  v19 = __dst;
  if (v14) {
LABEL_11:
  }
    memcpy(v19, __s, (size_t)v18);
  *((unsigned char *)v18 + (void)v19) = 0;
  if (v217 >= 0) {
    objc_msgSend_stringWithCString_encoding_(NSString, v15, (uint64_t)__dst, 4, v16, v17);
  }
  else {
  v198 = objc_msgSend_stringWithCString_encoding_(NSString, v15, (uint64_t)__dst[0], 4, v16, v17);
  }
  objc_storeStrong((id *)&v199->_resourcePath, v198);
  if (v198) {
    BOOL v26 = v13;
  }
  else {
    BOOL v26 = 0;
  }
  if (v26)
  {
    v27 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v22, (uint64_t)v198, v23, v24, v25);
    id v28 = objc_alloc(MEMORY[0x1E4F1E990]);
    v33 = objc_msgSend_initWithComputeUnits_(v28, v29, 0, v30, v31, v32);
    id v215 = 0;
    v36 = objc_msgSend_modelWithContentsOfURL_configuration_error_(CHSingletonMLModel, v34, (uint64_t)v27, (uint64_t)v33, (uint64_t)&v215, v35);
    v37 = v215;
    obuint64_t j = v36;
    if (v36)
    {

      objc_storeStrong((id *)&v199->_model, v36);
      objc_msgSend_array(MEMORY[0x1E4F1CA48], v38, v39, v40, v41, v42);
      id v203 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v43, v44, v45, v46, v47);
      long long v213 = 0u;
      long long v214 = 0u;
      long long v211 = 0u;
      v202 = long long v212 = 0u;
      v53 = objc_msgSend_modelDescription(v36, v48, v49, v50, v51, v52);
      v59 = objc_msgSend_inputDescriptionsByName(v53, v54, v55, v56, v57, v58);
      objc_msgSend_allKeys(v59, v60, v61, v62, v63, v64);
      id v204 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v65, (uint64_t)&v211, (uint64_t)buf, 16, v66);
      if (v71)
      {
        uint64_t v72 = *(void *)v212;
        do
        {
          for (uint64_t i = 0; i != v71; ++i)
          {
            if (*(void *)v212 != v72) {
              objc_enumerationMutation(v204);
            }
            v74 = *(void **)(*((void *)&v211 + 1) + 8 * i);
            if (objc_msgSend_hasPrefix_(v74, v67, @"input", v68, v69, v70))
            {
              objc_msgSend_addObject_(v203, v67, (uint64_t)v74, v68, v69, v70);
              v80 = objc_msgSend_modelDescription(obj, v75, v76, v77, v78, v79);
              v86 = objc_msgSend_inputDescriptionsByName(v80, v81, v82, v83, v84, v85);
              v91 = objc_msgSend_objectForKeyedSubscript_(v86, v87, (uint64_t)v74, v88, v89, v90);
              v97 = objc_msgSend_multiArrayConstraint(v91, v92, v93, v94, v95, v96);
              v103 = objc_msgSend_shape(v97, v98, v99, v100, v101, v102);
              v108 = objc_msgSend_objectAtIndex_(v103, v104, 2, v105, v106, v107);

              objc_msgSend_setObject_forKey_(v202, v109, (uint64_t)v108, (uint64_t)v74, v110, v111);
            }
          }
          uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v67, (uint64_t)&v211, (uint64_t)buf, 16, v70);
        }
        while (v71);
      }

      objc_storeStrong((id *)&v199->_inputNames, v203);
      objc_storeStrong((id *)&v199->_featureCounts, v202);
      objc_msgSend_array(MEMORY[0x1E4F1CA48], v112, v113, v114, v115, v116);
      v201 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v117, v118, v119, v120, v121);
      v200 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      long long v209 = 0u;
      long long v210 = 0u;
      long long v207 = 0u;
      long long v208 = 0u;
      v127 = objc_msgSend_modelDescription(obj, v122, v123, v124, v125, v126);
      v133 = objc_msgSend_outputDescriptionsByName(v127, v128, v129, v130, v131, v132);
      objc_msgSend_allKeys(v133, v134, v135, v136, v137, v138);
      id v205 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v205, v139, (uint64_t)&v207, (uint64_t)v219, 16, v140);
      if (v145)
      {
        uint64_t v146 = *(void *)v208;
        do
        {
          for (uint64_t j = 0; j != v145; ++j)
          {
            if (*(void *)v208 != v146) {
              objc_enumerationMutation(v205);
            }
            v148 = *(void **)(*((void *)&v207 + 1) + 8 * j);
            if (objc_msgSend_hasPrefix_(v148, v141, @"output", v142, v143, v144))
            {
              objc_msgSend_addObject_(v201, v141, (uint64_t)v148, v142, v143, v144);
              v154 = objc_msgSend_modelDescription(obj, v149, v150, v151, v152, v153);
              v160 = objc_msgSend_outputDescriptionsByName(v154, v155, v156, v157, v158, v159);
              v165 = objc_msgSend_objectForKeyedSubscript_(v160, v161, (uint64_t)v148, v162, v163, v164);
              v171 = objc_msgSend_multiArrayConstraint(v165, v166, v167, v168, v169, v170);
              v177 = objc_msgSend_shape(v171, v172, v173, v174, v175, v176);
              v182 = objc_msgSend_objectAtIndex_(v177, v178, 0, v179, v180, v181);

              objc_msgSend_setObject_forKey_(v200, v183, (uint64_t)v182, (uint64_t)v148, v184, v185);
            }
          }
          uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v205, v141, (uint64_t)&v207, (uint64_t)v219, 16, v144);
        }
        while (v145);
      }

      outputNames = v199->_outputNames;
      v199->_outputNames = v201;
      v187 = v201;

      classCounts = v199->_classCounts;
      v199->_classCounts = v200;

      v37 = v202;
      goto LABEL_50;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v189 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
    {
      v195 = objc_msgSend_localizedDescription(v37, v190, v191, v192, v193, v194);
      *(_DWORD *)buf = 138412290;
      id v221 = v195;
      _os_log_impl(&dword_1C492D000, v189, OS_LOG_TYPE_ERROR, "An error occurred when loading a model: %@", buf, 0xCu);
    }
    obuint64_t j = 0;
    id v203 = v199;
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v37 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v221 = v6;
      _os_log_impl(&dword_1C492D000, v37, OS_LOG_TYPE_ERROR, "Model not found (\"%@\")", buf, 0xCu);
    }
    obuint64_t j = 0;
    id v203 = v199;
  }
  v199 = 0;
LABEL_50:

  if (SHIBYTE(v217) < 0) {
    operator delete(__dst[0]);
  }

  id v4 = v197;
LABEL_53:

  return v199;
}

- (void)dealloc
{
  v7 = objc_msgSend_modelKey(self->_model, a2, v2, v3, v4, v5);
  objc_msgSend_releaseModelWithKey_(CHSingletonMLModel, v8, (uint64_t)v7, v9, v10, v11);

  v12.receiver = self;
  v12.super_class = (Class)CHRecurrentNeuralNetworkCoreML;
  [(CHRecurrentNeuralNetworkCoreML *)&v12 dealloc];
}

- (CHSingletonMLModel)model
{
  return self->_model;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (NSArray)inputNames
{
  return self->_inputNames;
}

- (NSDictionary)featureCounts
{
  return self->_featureCounts;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (NSDictionary)classCounts
{
  return self->_classCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classCounts, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_featureCounts, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end