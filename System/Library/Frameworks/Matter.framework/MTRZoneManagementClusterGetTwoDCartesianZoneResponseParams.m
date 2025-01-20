@interface MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams)init;
- (MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (NSArray)zones;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setZones:(id)a3;
@end

@implementation MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams

- (MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams;
  v4 = [(MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    zones = v4->_zones;
    v4->_zones = (NSArray *)v5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams);
  v7 = objc_msgSend_zones(self, v5, v6);
  objc_msgSend_setZones_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: zones:%@ >", v5, self->_zones);;

  return v7;
}

- (MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams;
  objc_super v8 = [(MTRZoneManagementClusterGetTwoDCartesianZoneResponseParams *)&v39 init];
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 1360, 4, a4);
  if (v38)
  {
    sub_244CB3988((uint64_t)v37);
    sub_244CB39B8((uint64_t)v37, *((void *)v38 + 1), *((void *)v38 + 3));
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    sub_244CB54B4((uint64_t)v37, 256, &v35);
    if (!v35)
    {
      sub_244CB3988((uint64_t)&buf);
      char v44 = 0;
      sub_244CB39B8(v9, 0, 0);
      sub_24483B258((uint64_t)&buf, (uint64_t)v37, (uint64_t)&v33);
      long long v35 = v33;
      uint64_t v36 = v34;
      if (!v33)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v10, (uint64_t)&buf);
        long long v35 = v33;
        uint64_t v36 = v34;
        if (!v33)
        {
          v31 = v8;
          goto LABEL_14;
        }
      }
    }
    v11 = NSString;
    long long buf = v35;
    uint64_t v43 = v36;
    v12 = sub_244CB7B34((const char **)&buf, 1);
    v14 = objc_msgSend_stringWithFormat_(v11, v13, @"Command payload decoding failed: %s", v12);
    v15 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = v14;
      uint64_t v19 = objc_msgSend_UTF8String(v16, v17, v18);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v22 = v14;
      objc_msgSend_UTF8String(v22, v23, v24);
      sub_244CC4DE0(0, 1);
    }
    if (a4)
    {
      uint64_t v40 = *MEMORY[0x263F08338];
      v25 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v20, v21);
      v27 = objc_msgSend_localizedStringForKey_value_table_(v25, v26, (uint64_t)v14, &stru_26F969DC8, 0);
      v41 = v27;
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v41, &v40, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"MTRErrorDomain", 13, v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v31 = 0;
LABEL_14:
  sub_244794634(&v38);
LABEL_16:

  return v31;
}

- (NSArray)zones
{
  return self->_zones;
}

- (void)setZones:(id)a3
{
}

- (void).cxx_destruct
{
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v46 = self;
  id v6 = objc_opt_new();
  LOBYTE(v47[0]) = *((unsigned char *)a4 + 72);
  if (LOBYTE(v47[0])) {
    HIBYTE(v47[0]) = *((unsigned char *)a4 + 73);
  }
  sub_244797F6C((uint64_t)v50, (uint64_t)a4, (unsigned __int8 *)v47);
  while (1)
  {
    if (!sub_244798000((uint64_t)v50))
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      if (v56 == 33)
      {
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        retstr->mLine = 147;
      }
      else
      {
        *(_OWORD *)&retstr->mError = v56;
        *(void *)&retstr->mLine = v57;
        if (retstr->mError) {
          goto LABEL_27;
        }
      }
      objc_msgSend_setZones_(v46, v7, (uint64_t)v6, v46);

      retstr->mError = 0;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 32282;
      return result;
    }
    objc_super v8 = objc_opt_new();
    uint64_t v9 = v50[0];
    uint64_t v10 = v50[1];
    id v11 = [NSString alloc];
    v13 = objc_msgSend_initWithBytes_length_encoding_(v11, v12, v9, v10, 4);
    objc_msgSend_setName_(v8, v14, (uint64_t)v13);

    v17 = objc_msgSend_name(v8, v15, v16);

    if (!v17) {
      break;
    }
    uint64_t v19 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v18, v51);
    objc_msgSend_setUse_(v8, v20, (uint64_t)v19);

    uint64_t v21 = objc_opt_new();
    v58[0] = v53;
    if (v53) {
      v58[1] = v54;
    }
    sub_244798128((uint64_t)v47, (uint64_t)&v52, v58);
    while (sub_244798198((uint64_t)v47))
    {
      v23 = v6;
      uint64_t v24 = objc_opt_new();
      v26 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v25, v47[0]);
      objc_msgSend_setX_(v24, v27, (uint64_t)v26);

      v29 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v28, v47[1]);
      objc_msgSend_setY_(v24, v30, (uint64_t)v29);

      objc_msgSend_addObject_(v21, v31, (uint64_t)v24);
      id v6 = v23;
    }
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    if (v48 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
    }
    else
    {
      *(_OWORD *)&retstr->mError = v48;
      *(void *)&retstr->mLine = v49;
      if (retstr->mError)
      {

        goto LABEL_26;
      }
    }
    objc_msgSend_setVertices_(v8, v22, (uint64_t)v21, v46);

    if (v55[0])
    {
      long long v33 = (uint64_t *)sub_2446D18A4(v55);
      uint64_t v34 = *v33;
      uint64_t v35 = v33[1];
      id v36 = [NSString alloc];
      v38 = objc_msgSend_initWithBytes_length_encoding_(v36, v37, v34, v35, 4);
      objc_msgSend_setColor_(v8, v39, (uint64_t)v38);

      v42 = objc_msgSend_color(v8, v40, v41);

      if (!v42)
      {
        char v44 = &xmmword_265194560;
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend_setColor_(v8, v32, 0);
    }
    objc_msgSend_addObject_(v6, v43, (uint64_t)v8);
  }
  char v44 = &xmmword_265194548;
LABEL_22:
  *(_OWORD *)&retstr->mError = *v44;
  *(void *)&retstr->mLine = *((void *)v44 + 2);
LABEL_26:

LABEL_27:
  return result;
}

@end