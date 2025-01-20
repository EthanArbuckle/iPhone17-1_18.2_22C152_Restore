@interface MTRUnitTestingClusterTestStructArrayArgumentResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRUnitTestingClusterTestStructArrayArgumentResponseParams)init;
- (MTRUnitTestingClusterTestStructArrayArgumentResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSArray)arg1;
- (NSArray)arg2;
- (NSArray)arg3;
- (NSArray)arg4;
- (NSNumber)arg5;
- (NSNumber)arg6;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArg1:(NSArray *)arg1;
- (void)setArg2:(NSArray *)arg2;
- (void)setArg3:(NSArray *)arg3;
- (void)setArg4:(NSArray *)arg4;
- (void)setArg5:(NSNumber *)arg5;
- (void)setArg6:(NSNumber *)arg6;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRUnitTestingClusterTestStructArrayArgumentResponseParams

- (MTRUnitTestingClusterTestStructArrayArgumentResponseParams)init
{
  v23.receiver = self;
  v23.super_class = (Class)MTRUnitTestingClusterTestStructArrayArgumentResponseParams;
  v4 = [(MTRUnitTestingClusterTestStructArrayArgumentResponseParams *)&v23 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    arg1 = v4->_arg1;
    v4->_arg1 = (NSArray *)v5;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8);
    arg2 = v4->_arg2;
    v4->_arg2 = (NSArray *)v9;

    uint64_t v13 = objc_msgSend_array(MEMORY[0x263EFF8C0], v11, v12);
    arg3 = v4->_arg3;
    v4->_arg3 = (NSArray *)v13;

    uint64_t v17 = objc_msgSend_array(MEMORY[0x263EFF8C0], v15, v16);
    arg4 = v4->_arg4;
    v4->_arg4 = (NSArray *)v17;

    arg5 = v4->_arg5;
    v4->_arg5 = (NSNumber *)&unk_26F9C8548;

    arg6 = v4->_arg6;
    v4->_arg6 = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestStructArrayArgumentResponseParams);
  v7 = objc_msgSend_arg1(self, v5, v6);
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_arg2(self, v9, v10);
  objc_msgSend_setArg2_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_arg3(self, v13, v14);
  objc_msgSend_setArg3_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_arg4(self, v17, v18);
  objc_msgSend_setArg4_(v4, v20, (uint64_t)v19);

  objc_super v23 = objc_msgSend_arg5(self, v21, v22);
  objc_msgSend_setArg5_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_arg6(self, v25, v26);
  objc_msgSend_setArg6_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: arg1:%@; arg2:%@; arg3:%@; arg4:%@; arg5:%@; arg6:%@; >",
    v5,
    self->_arg1,
    self->_arg2,
    self->_arg3,
    self->_arg4,
    self->_arg5,
  v7 = self->_arg6);

  return v7;
}

- (MTRUnitTestingClusterTestStructArrayArgumentResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v41.receiver = self;
  v41.super_class = (Class)MTRUnitTestingClusterTestStructArrayArgumentResponseParams;
  uint64_t v8 = [(MTRUnitTestingClusterTestStructArrayArgumentResponseParams *)&v41 init];
  if (!v8)
  {
    v33 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 4294048773, 3, error);
  if (v40)
  {
    sub_244CB3988((uint64_t)v39);
    sub_244CB39B8((uint64_t)v39, *((void *)v40 + 1), *((void *)v40 + 3));
    long long v37 = 0uLL;
    uint64_t v38 = 0;
    sub_244CB54B4((uint64_t)v39, 256, &v37);
    if (!v37)
    {
      sub_244CB3988((uint64_t)&buf);
      char v46 = 0;
      sub_244CB39B8((uint64_t)&buf, 0, 0);
      sub_244CB3988((uint64_t)v47);
      v47[72] = 0;
      sub_244CB39B8(v9, 0, 0);
      sub_244CB3988((uint64_t)v48);
      v48[72] = 0;
      sub_244CB39B8(v10, 0, 0);
      sub_244CB3988((uint64_t)v49);
      v49[72] = 0;
      sub_244CB39B8(v11, 0, 0);
      __int16 v50 = 0;
      sub_244845100((uint64_t)&buf, (uint64_t)v39, (uint64_t)&v35);
      long long v37 = v35;
      uint64_t v38 = v36;
      if (!v35)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v12, (uint64_t)&buf);
        long long v37 = v35;
        uint64_t v38 = v36;
        if (!v35)
        {
          v33 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v13 = NSString;
    long long buf = v37;
    uint64_t v45 = v38;
    uint64_t v14 = sub_244CB7B34((const char **)&buf, 1);
    uint64_t v16 = objc_msgSend_stringWithFormat_(v13, v15, @"Command payload decoding failed: %s", v14);
    uint64_t v17 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = v16;
      uint64_t v21 = objc_msgSend_UTF8String(v18, v19, v20);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v24 = v16;
      objc_msgSend_UTF8String(v24, v25, v26);
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      uint64_t v42 = *MEMORY[0x263F08338];
      v27 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v22, v23);
      v29 = objc_msgSend_localizedStringForKey_value_table_(v27, v28, (uint64_t)v16, &stru_26F969DC8, 0);
      v43 = v29;
      v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)&v43, &v42, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v32, @"MTRErrorDomain", 13, v31);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  v33 = 0;
LABEL_14:
  sub_244794634(&v40);
LABEL_16:

  return v33;
}

- (NSArray)arg1
{
  return self->_arg1;
}

- (void)setArg1:(NSArray *)arg1
{
}

- (NSArray)arg2
{
  return self->_arg2;
}

- (void)setArg2:(NSArray *)arg2
{
}

- (NSArray)arg3
{
  return self->_arg3;
}

- (void)setArg3:(NSArray *)arg3
{
}

- (NSArray)arg4
{
  return self->_arg4;
}

- (void)setArg4:(NSArray *)arg4
{
}

- (NSNumber)arg5
{
  return self->_arg5;
}

- (void)setArg5:(NSNumber *)arg5
{
}

- (NSNumber)arg6
{
  return self->_arg6;
}

- (void)setArg6:(NSNumber *)arg6
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_arg6, 0);
  objc_storeStrong((id *)&self->_arg5, 0);
  objc_storeStrong((id *)&self->_arg4, 0);
  objc_storeStrong((id *)&self->_arg3, 0);
  objc_storeStrong((id *)&self->_arg2, 0);

  objc_storeStrong((id *)&self->_arg1, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_opt_new();
  LOBYTE(v206) = *((unsigned char *)a4 + 72);
  if ((_BYTE)v206) {
    BYTE1(v206) = *((unsigned char *)a4 + 73);
  }
  v203 = self;
  v204 = v7;
  sub_244798610((uint64_t)&v215, (uint64_t)a4, (unsigned __int8 *)&v206);
  uint64_t v8 = off_265192000;
LABEL_4:
  if (sub_244798704((uint64_t)&v215))
  {
    uint64_t v10 = v8;
    uint64_t v11 = objc_opt_new();
    uint64_t v13 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v12, v215);
    objc_msgSend_setA_(v11, v14, (uint64_t)v13);

    uint64_t v16 = objc_msgSend_numberWithBool_(NSNumber, v15, v216);
    objc_msgSend_setB_(v11, v17, (uint64_t)v16);

    id v18 = objc_opt_new();
    objc_msgSend_setC_(v11, v19, (uint64_t)v18);

    uint64_t v21 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v20, v218);
    id v24 = objc_msgSend_c(v11, v22, v23);
    objc_msgSend_setA_(v24, v25, (uint64_t)v21);

    v27 = objc_msgSend_numberWithBool_(NSNumber, v26, BYTE1(v218));
    uint64_t v30 = objc_msgSend_c(v11, v28, v29);
    objc_msgSend_setB_(v30, v31, (uint64_t)v27);

    v33 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v32, BYTE2(v218));
    uint64_t v36 = objc_msgSend_c(v11, v34, v35);
    objc_msgSend_setC_(v36, v37, (uint64_t)v33);

    v39 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v38, *((uint64_t *)&v218 + 1), v219);
    uint64_t v42 = objc_msgSend_c(v11, v40, v41);
    objc_msgSend_setD_(v42, v43, (uint64_t)v39);

    uint64_t v44 = v220;
    uint64_t v45 = v221;
    id v46 = [NSString alloc];
    v48 = objc_msgSend_initWithBytes_length_encoding_(v46, v47, v44, v45, 4);
    uint64_t v51 = objc_msgSend_c(v11, v49, v50);
    objc_msgSend_setE_(v51, v52, (uint64_t)v48);

    v55 = objc_msgSend_c(v11, v53, v54);
    v58 = objc_msgSend_e(v55, v56, v57);

    if (v58)
    {
      v60 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v59, LOBYTE(v222));
      v63 = objc_msgSend_c(v11, v61, v62);
      objc_msgSend_setF_(v63, v64, (uint64_t)v60);

      LODWORD(v65) = HIDWORD(v222);
      v68 = objc_msgSend_numberWithFloat_(NSNumber, v66, v67, v65);
      v71 = objc_msgSend_c(v11, v69, v70);
      objc_msgSend_setG_(v71, v72, (uint64_t)v68);

      v75 = objc_msgSend_numberWithDouble_(NSNumber, v73, v74, v223);
      v78 = objc_msgSend_c(v11, v76, v77);
      objc_msgSend_setH_(v78, v79, (uint64_t)v75);

      if ((_BYTE)v224)
      {
        v82 = NSNumber;
        v83 = sub_2446F9190(&v224);
        v85 = objc_msgSend_numberWithUnsignedChar_(v82, v84, *v83);
        v88 = objc_msgSend_c(v11, v86, v87);
        objc_msgSend_setI_(v88, v89, (uint64_t)v85);
      }
      else
      {
        v85 = objc_msgSend_c(v11, v80, v81);
        objc_msgSend_setI_(v85, v90, 0);
      }

      v91 = objc_opt_new();
      unsigned __int8 v239 = v226;
      if (v226) {
        char v240 = v227;
      }
      sub_24479898C((uint64_t)&v206, (uint64_t)&v224 + 8, &v239);
      while (1)
      {
        if (!sub_244798A20((uint64_t)&v206))
        {
          *(void *)&retstr->mError = 0;
          retstr->mFile = 0;
          *(void *)&retstr->mLine = 0;
          if (v213 == 33)
          {
            retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
            retstr->mLine = 147;
          }
          else
          {
            *(_OWORD *)&retstr->mError = v213;
            *(void *)&retstr->mLine = v214;
            if (retstr->mError) {
              goto LABEL_47;
            }
          }
          objc_msgSend_setD_(v11, v92, (uint64_t)v91, v203);

          v91 = objc_opt_new();
          unsigned __int8 v239 = v229;
          if (v229) {
            char v240 = v230;
          }
          sub_2446D1930((uint64_t)&v206, (uint64_t)&v228, &v239);
          while (sub_244798ADC(&v206))
          {
            v135 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v134, v206);
            objc_msgSend_addObject_(v91, v136, (uint64_t)v135);
          }
          *(void *)&retstr->mError = 0;
          retstr->mFile = 0;
          *(void *)&retstr->mLine = 0;
          if (*(_DWORD *)v207 == 33)
          {
            retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
            retstr->mLine = 147;
          }
          else
          {
            *(_OWORD *)&retstr->mError = *(_OWORD *)v207;
            *(void *)&retstr->mLine = *(void *)&v207[16];
            if (retstr->mError) {
              goto LABEL_47;
            }
          }
          objc_msgSend_setE_(v11, v134, (uint64_t)v91);

          v91 = objc_opt_new();
          unsigned __int8 v239 = v232;
          if (v232) {
            char v240 = v233;
          }
          sub_244797544((uint64_t)&v206, (uint64_t)&v231, &v239);
          while (sub_244798B84((uint64_t)&v206))
          {
            v138 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v137, v206, *(void *)v207);
            objc_msgSend_addObject_(v91, v139, (uint64_t)v138);
          }
          *(void *)&retstr->mError = 0;
          retstr->mFile = 0;
          *(void *)&retstr->mLine = 0;
          if (*(_DWORD *)&v207[8] == 33)
          {
            retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
            retstr->mLine = 147;
          }
          else
          {
            *(_OWORD *)&retstr->mError = *(_OWORD *)&v207[8];
            *(void *)&retstr->mLine = v208;
            if (retstr->mError) {
              goto LABEL_47;
            }
          }
          objc_msgSend_setF_(v11, v137, (uint64_t)v91);

          v91 = objc_opt_new();
          unsigned __int8 v239 = v235;
          if (v235) {
            char v240 = v236;
          }
          sub_2446D1930((uint64_t)&v206, (uint64_t)&v234, &v239);
          while (sub_2447959C0((uint64_t)&v206))
          {
            v141 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v140, v206);
            objc_msgSend_addObject_(v91, v142, (uint64_t)v141);
          }
          *(void *)&retstr->mError = 0;
          retstr->mFile = 0;
          *(void *)&retstr->mLine = 0;
          if (*(_DWORD *)v207 == 33)
          {
            retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
            retstr->mLine = 147;
          }
          else
          {
            *(_OWORD *)&retstr->mError = *(_OWORD *)v207;
            *(void *)&retstr->mLine = *(void *)&v207[16];
            if (retstr->mError) {
              goto LABEL_47;
            }
          }
          objc_msgSend_setG_(v11, v140, (uint64_t)v91);

          objc_msgSend_addObject_(v204, v143, (uint64_t)v11);
          v7 = v204;
          uint64_t v8 = v10;
          goto LABEL_4;
        }
        v93 = objc_opt_new();
        v95 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v94, v206);
        objc_msgSend_setA_(v93, v96, (uint64_t)v95);

        v98 = objc_msgSend_numberWithBool_(NSNumber, v97, BYTE1(v206));
        objc_msgSend_setB_(v93, v99, (uint64_t)v98);

        v101 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v100, BYTE2(v206));
        objc_msgSend_setC_(v93, v102, (uint64_t)v101);

        v104 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v103, *(uint64_t *)v207, *(void *)&v207[8]);
        objc_msgSend_setD_(v93, v105, (uint64_t)v104);

        uint64_t v107 = *(void *)&v207[16];
        uint64_t v106 = v208;
        id v108 = [NSString alloc];
        v110 = objc_msgSend_initWithBytes_length_encoding_(v108, v109, v107, v106, 4);
        objc_msgSend_setE_(v93, v111, (uint64_t)v110);

        v114 = objc_msgSend_e(v93, v112, v113);

        if (!v114) {
          break;
        }
        v116 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v115, v209);
        objc_msgSend_setF_(v93, v117, (uint64_t)v116);

        LODWORD(v118) = v210;
        v121 = objc_msgSend_numberWithFloat_(NSNumber, v119, v120, v118);
        objc_msgSend_setG_(v93, v122, (uint64_t)v121);

        v125 = objc_msgSend_numberWithDouble_(NSNumber, v123, v124, v211);
        objc_msgSend_setH_(v93, v126, (uint64_t)v125);

        if (v212[0])
        {
          v128 = NSNumber;
          v129 = sub_2446F9190(v212);
          v131 = objc_msgSend_numberWithUnsignedChar_(v128, v130, *v129);
          objc_msgSend_setI_(v93, v132, (uint64_t)v131);
        }
        else
        {
          objc_msgSend_setI_(v93, v127, 0);
        }
        objc_msgSend_addObject_(v91, v133, (uint64_t)v93, v203);
      }
      *(_OWORD *)&retstr->mError = xmmword_265194590;
      *(void *)&retstr->mLine = 36242;

LABEL_47:
    }
    else
    {
      *(_OWORD *)&retstr->mError = xmmword_265194578;
      *(void *)&retstr->mLine = 36218;
    }

    v7 = v204;
    goto LABEL_49;
  }
  *(void *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  if (v237 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
    v145 = v203;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v237;
    *(void *)&retstr->mLine = v238;
    v145 = v203;
    if (retstr->mError) {
      goto LABEL_49;
    }
  }
  objc_msgSend_setArg1_(v145, v9, (uint64_t)v7, v203);

  uint64_t v146 = objc_opt_new();
  LOBYTE(v206) = *((unsigned char *)a4 + 152);
  if ((_BYTE)v206) {
    BYTE1(v206) = *((unsigned char *)a4 + 153);
  }
  v205 = (void *)v146;
  sub_24479898C((uint64_t)&v215, (uint64_t)a4 + 80, (unsigned __int8 *)&v206);
  while (sub_244798A20((uint64_t)&v215))
  {
    v148 = objc_opt_new();
    v150 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v149, v215);
    objc_msgSend_setA_(v148, v151, (uint64_t)v150);

    v153 = objc_msgSend_numberWithBool_(NSNumber, v152, v216);
    objc_msgSend_setB_(v148, v154, (uint64_t)v153);

    v156 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v155, v217);
    objc_msgSend_setC_(v148, v157, (uint64_t)v156);

    v159 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v158, v218, *((void *)&v218 + 1));
    objc_msgSend_setD_(v148, v160, (uint64_t)v159);

    uint64_t v161 = v219;
    uint64_t v162 = v220;
    id v163 = [NSString alloc];
    v165 = objc_msgSend_initWithBytes_length_encoding_(v163, v164, v161, v162, 4);
    objc_msgSend_setE_(v148, v166, (uint64_t)v165);

    v169 = objc_msgSend_e(v148, v167, v168);

    if (!v169)
    {
      *(_OWORD *)&retstr->mError = xmmword_2651945A8;
      *(void *)&retstr->mLine = 36329;

      v189 = v205;
LABEL_68:

      return result;
    }
    v171 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v170, v221);
    objc_msgSend_setF_(v148, v172, (uint64_t)v171);

    LODWORD(v173) = HIDWORD(v221);
    v176 = objc_msgSend_numberWithFloat_(NSNumber, v174, v175, v173);
    objc_msgSend_setG_(v148, v177, (uint64_t)v176);

    v180 = objc_msgSend_numberWithDouble_(NSNumber, v178, v179, v222);
    objc_msgSend_setH_(v148, v181, (uint64_t)v180);

    if (LOBYTE(v223))
    {
      v183 = NSNumber;
      v184 = sub_2446F9190(&v223);
      v186 = objc_msgSend_numberWithUnsignedChar_(v183, v185, *v184);
      objc_msgSend_setI_(v148, v187, (uint64_t)v186);
    }
    else
    {
      objc_msgSend_setI_(v148, v182, 0);
    }
    objc_msgSend_addObject_(v205, v188, (uint64_t)v148);
  }
  *(void *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  if (v224 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
    v189 = v205;
    v190 = a4;
    objc_msgSend_setArg2_(v145, v147, (uint64_t)v205);
  }
  else
  {
    *(_OWORD *)&retstr->mError = v224;
    *(void *)&retstr->mLine = v225;
    v189 = v205;
    v190 = a4;
    if (retstr->mError) {
      goto LABEL_68;
    }
    objc_msgSend_setArg2_(v145, v147, (uint64_t)v205);
  }

  v7 = objc_opt_new();
  LOBYTE(v206) = v190[232];
  if ((_BYTE)v206) {
    BYTE1(v206) = v190[233];
  }
  sub_2446D1930((uint64_t)&v215, (uint64_t)(v190 + 160), (unsigned __int8 *)&v206);
  while (sub_2446D19A0((uint64_t)&v215))
  {
    v192 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v191, v215);
    objc_msgSend_addObject_(v7, v193, (uint64_t)v192);
  }
  *(void *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  if (v218 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v218;
    *(void *)&retstr->mLine = v219;
    if (retstr->mError) {
      goto LABEL_49;
    }
  }
  objc_msgSend_setArg3_(v145, v191, (uint64_t)v7);

  v7 = objc_opt_new();
  LOBYTE(v206) = v190[312];
  if ((_BYTE)v206) {
    BYTE1(v206) = v190[313];
  }
  sub_2446D1930((uint64_t)&v215, (uint64_t)(v190 + 240), (unsigned __int8 *)&v206);
  while (sub_244798C5C((uint64_t)&v215))
  {
    v195 = objc_msgSend_numberWithBool_(NSNumber, v194, v215);
    objc_msgSend_addObject_(v7, v196, (uint64_t)v195);
  }
  *(void *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  if (v218 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
LABEL_86:
    objc_msgSend_setArg4_(v145, v194, (uint64_t)v7);

    v198 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v197, v190[320]);
    objc_msgSend_setArg5_(v145, v199, (uint64_t)v198);

    v201 = objc_msgSend_numberWithBool_(NSNumber, v200, v190[321]);
    objc_msgSend_setArg6_(v145, v202, (uint64_t)v201);

    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 36389;
    return result;
  }
  *(_OWORD *)&retstr->mError = v218;
  *(void *)&retstr->mLine = v219;
  if (!retstr->mError) {
    goto LABEL_86;
  }
LABEL_49:

  return result;
}

@end