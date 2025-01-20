@interface MTRScenesManagementClusterViewSceneResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRScenesManagementClusterViewSceneResponseParams)init;
- (MTRScenesManagementClusterViewSceneResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (NSArray)extensionFieldSets;
- (NSNumber)groupID;
- (NSNumber)sceneID;
- (NSNumber)status;
- (NSNumber)transitionTime;
- (NSString)sceneName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setExtensionFieldSets:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setSceneID:(id)a3;
- (void)setSceneName:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTransitionTime:(id)a3;
@end

@implementation MTRScenesManagementClusterViewSceneResponseParams

- (MTRScenesManagementClusterViewSceneResponseParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRScenesManagementClusterViewSceneResponseParams;
  v2 = [(MTRScenesManagementClusterViewSceneResponseParams *)&v11 init];
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_26F9C8548;

    groupID = v3->_groupID;
    v3->_groupID = (NSNumber *)&unk_26F9C8548;

    sceneID = v3->_sceneID;
    v3->_sceneID = (NSNumber *)&unk_26F9C8548;

    transitionTime = v3->_transitionTime;
    v3->_transitionTime = 0;

    sceneName = v3->_sceneName;
    v3->_sceneName = 0;

    extensionFieldSets = v3->_extensionFieldSets;
    v3->_extensionFieldSets = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRScenesManagementClusterViewSceneResponseParams);
  v7 = objc_msgSend_status(self, v5, v6);
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_groupID(self, v9, v10);
  objc_msgSend_setGroupID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_sceneID(self, v13, v14);
  objc_msgSend_setSceneID_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_transitionTime(self, v17, v18);
  objc_msgSend_setTransitionTime_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_sceneName(self, v21, v22);
  objc_msgSend_setSceneName_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_extensionFieldSets(self, v25, v26);
  objc_msgSend_setExtensionFieldSets_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: status:%@; groupID:%@; sceneID:%@; transitionTime:%@; sceneName:%@; extensionFieldSets:%@; >",
    v5,
    self->_status,
    self->_groupID,
    self->_sceneID,
    self->_transitionTime,
    self->_sceneName,
  v7 = self->_extensionFieldSets);

  return v7;
}

- (MTRScenesManagementClusterViewSceneResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MTRScenesManagementClusterViewSceneResponseParams;
  v8 = [(MTRScenesManagementClusterViewSceneResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 98, 1, a4);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      LOBYTE(buf) = 0;
      WORD1(buf) = 0;
      BYTE4(buf) = 0;
      BYTE8(buf) = 0;
      LOBYTE(v42) = 0;
      char v43 = 0;
      sub_2448119D4((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      long long v34 = v32;
      uint64_t v35 = v33;
      if (!v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        long long v34 = v32;
        uint64_t v35 = v33;
        if (!v32)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    long long buf = v34;
    uint64_t v42 = v35;
    objc_super v11 = sub_244CB7B34((const char **)&buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    uint64_t v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = v13;
      uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v21 = v13;
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_244CC4DE0(0, 1);
    }
    if (a4)
    {
      uint64_t v39 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      uint64_t v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v37);
LABEL_16:

  return v30;
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSNumber)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(id)a3
{
}

- (NSString)sceneName
{
  return self->_sceneName;
}

- (void)setSceneName:(id)a3
{
}

- (NSArray)extensionFieldSets
{
  return self->_extensionFieldSets;
}

- (void)setExtensionFieldSets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionFieldSets, 0);
  objc_storeStrong((id *)&self->_sceneName, 0);
  objc_storeStrong((id *)&self->_transitionTime, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setStatus_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v9, *((unsigned __int16 *)a4 + 1));
  objc_msgSend_setGroupID_(self, v11, (uint64_t)v10);

  v13 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v12, *((unsigned __int8 *)a4 + 4));
  objc_msgSend_setSceneID_(self, v14, (uint64_t)v13);

  if (*((unsigned char *)a4 + 8))
  {
    v16 = NSNumber;
    uint64_t v17 = sub_2446F12CC((unsigned char *)a4 + 8);
    v19 = objc_msgSend_numberWithUnsignedInt_(v16, v18, *(unsigned int *)v17);
    objc_msgSend_setTransitionTime_(self, v20, (uint64_t)v19);
  }
  else
  {
    objc_msgSend_setTransitionTime_(self, v15, 0);
  }
  if (*((unsigned char *)a4 + 16))
  {
    uint64_t v22 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 16);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    id v25 = [NSString alloc];
    v27 = objc_msgSend_initWithBytes_length_encoding_(v25, v26, v23, v24, 4);
    objc_msgSend_setSceneName_(self, v28, (uint64_t)v27);

    v31 = objc_msgSend_sceneName(self, v29, v30);

    if (!v31)
    {
      *(_OWORD *)&retstr->mError = xmmword_265194158;
      *(void *)&retstr->mLine = 14336;
      return result;
    }
  }
  else
  {
    objc_msgSend_setSceneName_(self, v21, 0);
  }
  int v35 = *((unsigned __int8 *)a4 + 40);
  long long v34 = (char *)a4 + 40;
  if (!v35)
  {
    result = (ChipError *)objc_msgSend_setExtensionFieldSets_(self, v33, 0);
LABEL_51:
    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 14421;
    return result;
  }
  v100 = objc_opt_new();
  v36 = sub_2446F7170(v34);
  LOBYTE(v102) = v36[72];
  if ((_BYTE)v102) {
    BYTE1(v102) = v36[73];
  }
  sub_2447956C4((uint64_t)&v113, (uint64_t)v36, (unsigned __int8 *)&v102);
  v99 = retstr;
  while (1)
  {
    if (!sub_24479574C((uint64_t)&v113))
    {
      retstr = v99;
      *(void *)&v99->mError = 0;
      v99->mFile = 0;
      *(void *)&v99->mLine = 0;
      if (v117 == 33)
      {
        v99->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        v99->mLine = 147;
        v98 = self;
      }
      else
      {
        *(_OWORD *)&v99->mError = v117;
        *(void *)&v99->mLine = v118;
        v98 = self;
        if (v99->mError) {
          goto LABEL_53;
        }
      }
      objc_msgSend_setExtensionFieldSets_(v98, v37, (uint64_t)v100);

      goto LABEL_51;
    }
    objc_super v38 = objc_opt_new();
    v40 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v39, v113);
    v101 = v38;
    objc_msgSend_setClusterID_(v38, v41, (uint64_t)v40);

    uint64_t v42 = objc_opt_new();
    v119[0] = v115;
    if (v115) {
      v119[1] = v116;
    }
    sub_244795864((uint64_t)&v102, (uint64_t)&v114, v119);
    while (sub_2447958F8((uint64_t)&v102))
    {
      uint64_t v44 = objc_opt_new();
      v46 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v45, v102);
      objc_msgSend_setAttributeID_(v44, v47, (uint64_t)v46);

      if (v103[0])
      {
        v49 = NSNumber;
        v50 = sub_2446F9190(v103);
        v52 = objc_msgSend_numberWithUnsignedChar_(v49, v51, *v50);
        objc_msgSend_setValueUnsigned8_(v44, v53, (uint64_t)v52);
      }
      else
      {
        objc_msgSend_setValueUnsigned8_(v44, v48, 0);
      }
      if (v104[0])
      {
        v55 = NSNumber;
        v56 = sub_2446F9190(v104);
        v58 = objc_msgSend_numberWithChar_(v55, v57, (char)*v56);
        objc_msgSend_setValueSigned8_(v44, v59, (uint64_t)v58);
      }
      else
      {
        objc_msgSend_setValueSigned8_(v44, v54, 0);
      }
      if (v105[0])
      {
        v61 = NSNumber;
        v62 = sub_2446D1880(v105);
        v64 = objc_msgSend_numberWithUnsignedShort_(v61, v63, *(unsigned __int16 *)v62);
        objc_msgSend_setValueUnsigned16_(v44, v65, (uint64_t)v64);
      }
      else
      {
        objc_msgSend_setValueUnsigned16_(v44, v60, 0);
      }
      if (v106[0])
      {
        v67 = NSNumber;
        v68 = sub_24471C2FC(v106);
        v70 = objc_msgSend_numberWithShort_(v67, v69, *(__int16 *)v68);
        objc_msgSend_setValueSigned16_(v44, v71, (uint64_t)v70);
      }
      else
      {
        objc_msgSend_setValueSigned16_(v44, v66, 0);
      }
      if (v107[0])
      {
        v73 = NSNumber;
        v74 = sub_2446F12CC(v107);
        v76 = objc_msgSend_numberWithUnsignedInt_(v73, v75, *(unsigned int *)v74);
        objc_msgSend_setValueUnsigned32_(v44, v77, (uint64_t)v76);
      }
      else
      {
        objc_msgSend_setValueUnsigned32_(v44, v72, 0);
      }
      if (v108[0])
      {
        v79 = NSNumber;
        v80 = sub_2446F12CC(v108);
        v82 = objc_msgSend_numberWithInt_(v79, v81, *(unsigned int *)v80);
        objc_msgSend_setValueSigned32_(v44, v83, (uint64_t)v82);
      }
      else
      {
        objc_msgSend_setValueSigned32_(v44, v78, 0);
      }
      if (v109[0])
      {
        v85 = NSNumber;
        v86 = (uint64_t *)sub_2446F7170(v109);
        v88 = objc_msgSend_numberWithUnsignedLongLong_(v85, v87, *v86);
        objc_msgSend_setValueUnsigned64_(v44, v89, (uint64_t)v88);
      }
      else
      {
        objc_msgSend_setValueUnsigned64_(v44, v84, 0);
      }
      if (v110[0])
      {
        v91 = NSNumber;
        v92 = (uint64_t *)sub_2446F7170(v110);
        v94 = objc_msgSend_numberWithLongLong_(v91, v93, *v92);
        objc_msgSend_setValueSigned64_(v44, v95, (uint64_t)v94);
      }
      else
      {
        objc_msgSend_setValueSigned64_(v44, v90, 0);
      }
      objc_msgSend_addObject_(v42, v96, (uint64_t)v44);
    }
    *(void *)&v99->mError = 0;
    v99->mFile = 0;
    *(void *)&v99->mLine = 0;
    if (v111 == 33)
    {
      v99->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      v99->mLine = 147;
      goto LABEL_45;
    }
    *(_OWORD *)&v99->mError = v111;
    *(void *)&v99->mLine = v112;
    if (v99->mError) {
      break;
    }
LABEL_45:
    objc_msgSend_setAttributeValueList_(v101, v43, (uint64_t)v42);

    objc_msgSend_addObject_(v100, v97, (uint64_t)v101);
  }

LABEL_53:
  return result;
}

@end