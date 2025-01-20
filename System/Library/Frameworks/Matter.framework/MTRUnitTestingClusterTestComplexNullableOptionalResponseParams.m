@interface MTRUnitTestingClusterTestComplexNullableOptionalResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRUnitTestingClusterSimpleStruct)nullableOptionalStructValue;
- (MTRUnitTestingClusterSimpleStruct)nullableStructValue;
- (MTRUnitTestingClusterSimpleStruct)optionalStructValue;
- (MTRUnitTestingClusterTestComplexNullableOptionalResponseParams)init;
- (MTRUnitTestingClusterTestComplexNullableOptionalResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSArray)nullableListValue;
- (NSArray)nullableOptionalListValue;
- (NSArray)optionalListValue;
- (NSNumber)nullableIntValue;
- (NSNumber)nullableIntWasNull;
- (NSNumber)nullableListWasNull;
- (NSNumber)nullableOptionalIntValue;
- (NSNumber)nullableOptionalIntWasNull;
- (NSNumber)nullableOptionalIntWasPresent;
- (NSNumber)nullableOptionalListWasNull;
- (NSNumber)nullableOptionalListWasPresent;
- (NSNumber)nullableOptionalStringWasNull;
- (NSNumber)nullableOptionalStringWasPresent;
- (NSNumber)nullableOptionalStructWasNull;
- (NSNumber)nullableOptionalStructWasPresent;
- (NSNumber)nullableStringWasNull;
- (NSNumber)nullableStructWasNull;
- (NSNumber)optionalIntValue;
- (NSNumber)optionalIntWasPresent;
- (NSNumber)optionalListWasPresent;
- (NSNumber)optionalStringWasPresent;
- (NSNumber)optionalStructWasPresent;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)nullableOptionalStringValue;
- (NSString)nullableStringValue;
- (NSString)optionalStringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setNullableIntValue:(NSNumber *)nullableIntValue;
- (void)setNullableIntWasNull:(NSNumber *)nullableIntWasNull;
- (void)setNullableListValue:(NSArray *)nullableListValue;
- (void)setNullableListWasNull:(NSNumber *)nullableListWasNull;
- (void)setNullableOptionalIntValue:(NSNumber *)nullableOptionalIntValue;
- (void)setNullableOptionalIntWasNull:(NSNumber *)nullableOptionalIntWasNull;
- (void)setNullableOptionalIntWasPresent:(NSNumber *)nullableOptionalIntWasPresent;
- (void)setNullableOptionalListValue:(NSArray *)nullableOptionalListValue;
- (void)setNullableOptionalListWasNull:(NSNumber *)nullableOptionalListWasNull;
- (void)setNullableOptionalListWasPresent:(NSNumber *)nullableOptionalListWasPresent;
- (void)setNullableOptionalStringValue:(NSString *)nullableOptionalStringValue;
- (void)setNullableOptionalStringWasNull:(NSNumber *)nullableOptionalStringWasNull;
- (void)setNullableOptionalStringWasPresent:(NSNumber *)nullableOptionalStringWasPresent;
- (void)setNullableOptionalStructValue:(MTRUnitTestingClusterSimpleStruct *)nullableOptionalStructValue;
- (void)setNullableOptionalStructWasNull:(NSNumber *)nullableOptionalStructWasNull;
- (void)setNullableOptionalStructWasPresent:(NSNumber *)nullableOptionalStructWasPresent;
- (void)setNullableStringValue:(NSString *)nullableStringValue;
- (void)setNullableStringWasNull:(NSNumber *)nullableStringWasNull;
- (void)setNullableStructValue:(MTRUnitTestingClusterSimpleStruct *)nullableStructValue;
- (void)setNullableStructWasNull:(NSNumber *)nullableStructWasNull;
- (void)setOptionalIntValue:(NSNumber *)optionalIntValue;
- (void)setOptionalIntWasPresent:(NSNumber *)optionalIntWasPresent;
- (void)setOptionalListValue:(NSArray *)optionalListValue;
- (void)setOptionalListWasPresent:(NSNumber *)optionalListWasPresent;
- (void)setOptionalStringValue:(NSString *)optionalStringValue;
- (void)setOptionalStringWasPresent:(NSNumber *)optionalStringWasPresent;
- (void)setOptionalStructValue:(MTRUnitTestingClusterSimpleStruct *)optionalStructValue;
- (void)setOptionalStructWasPresent:(NSNumber *)optionalStructWasPresent;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRUnitTestingClusterTestComplexNullableOptionalResponseParams

- (MTRUnitTestingClusterTestComplexNullableOptionalResponseParams)init
{
  v34.receiver = self;
  v34.super_class = (Class)MTRUnitTestingClusterTestComplexNullableOptionalResponseParams;
  v2 = [(MTRUnitTestingClusterTestComplexNullableOptionalResponseParams *)&v34 init];
  v3 = v2;
  if (v2)
  {
    nullableIntWasNull = v2->_nullableIntWasNull;
    v2->_nullableIntWasNull = (NSNumber *)&unk_26F9C8548;

    nullableIntValue = v3->_nullableIntValue;
    v3->_nullableIntValue = 0;

    optionalIntWasPresent = v3->_optionalIntWasPresent;
    v3->_optionalIntWasPresent = (NSNumber *)&unk_26F9C8548;

    optionalIntValue = v3->_optionalIntValue;
    v3->_optionalIntValue = 0;

    nullableOptionalIntWasPresent = v3->_nullableOptionalIntWasPresent;
    v3->_nullableOptionalIntWasPresent = (NSNumber *)&unk_26F9C8548;

    nullableOptionalIntWasNull = v3->_nullableOptionalIntWasNull;
    v3->_nullableOptionalIntWasNull = 0;

    nullableOptionalIntValue = v3->_nullableOptionalIntValue;
    v3->_nullableOptionalIntValue = 0;

    nullableStringWasNull = v3->_nullableStringWasNull;
    v3->_nullableStringWasNull = (NSNumber *)&unk_26F9C8548;

    nullableStringValue = v3->_nullableStringValue;
    v3->_nullableStringValue = 0;

    optionalStringWasPresent = v3->_optionalStringWasPresent;
    v3->_optionalStringWasPresent = (NSNumber *)&unk_26F9C8548;

    optionalStringValue = v3->_optionalStringValue;
    v3->_optionalStringValue = 0;

    nullableOptionalStringWasPresent = v3->_nullableOptionalStringWasPresent;
    v3->_nullableOptionalStringWasPresent = (NSNumber *)&unk_26F9C8548;

    nullableOptionalStringWasNull = v3->_nullableOptionalStringWasNull;
    v3->_nullableOptionalStringWasNull = 0;

    nullableOptionalStringValue = v3->_nullableOptionalStringValue;
    v3->_nullableOptionalStringValue = 0;

    nullableStructWasNull = v3->_nullableStructWasNull;
    v3->_nullableStructWasNull = (NSNumber *)&unk_26F9C8548;

    nullableStructValue = v3->_nullableStructValue;
    v3->_nullableStructValue = 0;

    optionalStructWasPresent = v3->_optionalStructWasPresent;
    v3->_optionalStructWasPresent = (NSNumber *)&unk_26F9C8548;

    optionalStructValue = v3->_optionalStructValue;
    v3->_optionalStructValue = 0;

    nullableOptionalStructWasPresent = v3->_nullableOptionalStructWasPresent;
    v3->_nullableOptionalStructWasPresent = (NSNumber *)&unk_26F9C8548;

    nullableOptionalStructWasNull = v3->_nullableOptionalStructWasNull;
    v3->_nullableOptionalStructWasNull = 0;

    nullableOptionalStructValue = v3->_nullableOptionalStructValue;
    v3->_nullableOptionalStructValue = 0;

    nullableListWasNull = v3->_nullableListWasNull;
    v3->_nullableListWasNull = (NSNumber *)&unk_26F9C8548;

    nullableListValue = v3->_nullableListValue;
    v3->_nullableListValue = 0;

    optionalListWasPresent = v3->_optionalListWasPresent;
    v3->_optionalListWasPresent = (NSNumber *)&unk_26F9C8548;

    optionalListValue = v3->_optionalListValue;
    v3->_optionalListValue = 0;

    nullableOptionalListWasPresent = v3->_nullableOptionalListWasPresent;
    v3->_nullableOptionalListWasPresent = (NSNumber *)&unk_26F9C8548;

    nullableOptionalListWasNull = v3->_nullableOptionalListWasNull;
    v3->_nullableOptionalListWasNull = 0;

    nullableOptionalListValue = v3->_nullableOptionalListValue;
    v3->_nullableOptionalListValue = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestComplexNullableOptionalResponseParams);
  v7 = objc_msgSend_nullableIntWasNull(self, v5, v6);
  objc_msgSend_setNullableIntWasNull_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_nullableIntValue(self, v9, v10);
  objc_msgSend_setNullableIntValue_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_optionalIntWasPresent(self, v13, v14);
  objc_msgSend_setOptionalIntWasPresent_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_optionalIntValue(self, v17, v18);
  objc_msgSend_setOptionalIntValue_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_nullableOptionalIntWasPresent(self, v21, v22);
  objc_msgSend_setNullableOptionalIntWasPresent_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_nullableOptionalIntWasNull(self, v25, v26);
  objc_msgSend_setNullableOptionalIntWasNull_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_nullableOptionalIntValue(self, v29, v30);
  objc_msgSend_setNullableOptionalIntValue_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_nullableStringWasNull(self, v33, v34);
  objc_msgSend_setNullableStringWasNull_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_nullableStringValue(self, v37, v38);
  objc_msgSend_setNullableStringValue_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_optionalStringWasPresent(self, v41, v42);
  objc_msgSend_setOptionalStringWasPresent_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_optionalStringValue(self, v45, v46);
  objc_msgSend_setOptionalStringValue_(v4, v48, (uint64_t)v47);

  v51 = objc_msgSend_nullableOptionalStringWasPresent(self, v49, v50);
  objc_msgSend_setNullableOptionalStringWasPresent_(v4, v52, (uint64_t)v51);

  v55 = objc_msgSend_nullableOptionalStringWasNull(self, v53, v54);
  objc_msgSend_setNullableOptionalStringWasNull_(v4, v56, (uint64_t)v55);

  v59 = objc_msgSend_nullableOptionalStringValue(self, v57, v58);
  objc_msgSend_setNullableOptionalStringValue_(v4, v60, (uint64_t)v59);

  v63 = objc_msgSend_nullableStructWasNull(self, v61, v62);
  objc_msgSend_setNullableStructWasNull_(v4, v64, (uint64_t)v63);

  v67 = objc_msgSend_nullableStructValue(self, v65, v66);
  objc_msgSend_setNullableStructValue_(v4, v68, (uint64_t)v67);

  v71 = objc_msgSend_optionalStructWasPresent(self, v69, v70);
  objc_msgSend_setOptionalStructWasPresent_(v4, v72, (uint64_t)v71);

  v75 = objc_msgSend_optionalStructValue(self, v73, v74);
  objc_msgSend_setOptionalStructValue_(v4, v76, (uint64_t)v75);

  v79 = objc_msgSend_nullableOptionalStructWasPresent(self, v77, v78);
  objc_msgSend_setNullableOptionalStructWasPresent_(v4, v80, (uint64_t)v79);

  v83 = objc_msgSend_nullableOptionalStructWasNull(self, v81, v82);
  objc_msgSend_setNullableOptionalStructWasNull_(v4, v84, (uint64_t)v83);

  v87 = objc_msgSend_nullableOptionalStructValue(self, v85, v86);
  objc_msgSend_setNullableOptionalStructValue_(v4, v88, (uint64_t)v87);

  v91 = objc_msgSend_nullableListWasNull(self, v89, v90);
  objc_msgSend_setNullableListWasNull_(v4, v92, (uint64_t)v91);

  v95 = objc_msgSend_nullableListValue(self, v93, v94);
  objc_msgSend_setNullableListValue_(v4, v96, (uint64_t)v95);

  v99 = objc_msgSend_optionalListWasPresent(self, v97, v98);
  objc_msgSend_setOptionalListWasPresent_(v4, v100, (uint64_t)v99);

  v103 = objc_msgSend_optionalListValue(self, v101, v102);
  objc_msgSend_setOptionalListValue_(v4, v104, (uint64_t)v103);

  v107 = objc_msgSend_nullableOptionalListWasPresent(self, v105, v106);
  objc_msgSend_setNullableOptionalListWasPresent_(v4, v108, (uint64_t)v107);

  v111 = objc_msgSend_nullableOptionalListWasNull(self, v109, v110);
  objc_msgSend_setNullableOptionalListWasNull_(v4, v112, (uint64_t)v111);

  v115 = objc_msgSend_nullableOptionalListValue(self, v113, v114);
  objc_msgSend_setNullableOptionalListValue_(v4, v116, (uint64_t)v115);

  v119 = objc_msgSend_timedInvokeTimeoutMs(self, v117, v118);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v120, (uint64_t)v119);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: nullableIntWasNull:%@; nullableIntValue:%@; optionalIntWasPresent:%@; optionalIntValue:%@; nullableOptionalIntWasPresent:%@; nullableOptionalIntWasNull:%@; nullableOptionalIntValue:%@; nullableStringWasNull:%@; nullableStringValue:%@; optionalStringWasPresent:%@; optionalStringValue:%@; nullableOptionalStringWasPresent:%@; nullableOptionalStringWasNull:%@; nullableOptionalStringValue:%@; nullableStructWasNull:%@; nullableStructValue:%@; optionalStructWasPresent:%@; optionalStructValue:%@; nullableOptionalStructWasPresent:%@; nullableOptionalStructWasNull:%@; nullableOptionalStructValue:%@; nullableListWasNull:%@; nullableListValue:%@; optionalListWasPresent:%@; optionalListValue:%@; nullableOptionalListWasPresent:%@; nullableOptionalListWasNull:%@; nullableOptionalListValue:%@; >",
    v5,
    self->_nullableIntWasNull,
    self->_nullableIntValue,
    self->_optionalIntWasPresent,
    self->_optionalIntValue,
    self->_nullableOptionalIntWasPresent,
    self->_nullableOptionalIntWasNull,
    self->_nullableOptionalIntValue,
    self->_nullableStringWasNull,
    self->_nullableStringValue,
    self->_optionalStringWasPresent,
    self->_optionalStringValue,
    self->_nullableOptionalStringWasPresent,
    self->_nullableOptionalStringWasNull,
    self->_nullableOptionalStringValue,
    self->_nullableStructWasNull,
    self->_nullableStructValue,
    self->_optionalStructWasPresent,
    self->_optionalStructValue,
    self->_nullableOptionalStructWasPresent,
    self->_nullableOptionalStructWasNull,
    self->_nullableOptionalStructValue,
    self->_nullableListWasNull,
    self->_nullableListValue,
    self->_optionalListWasPresent,
    self->_optionalListValue,
    self->_nullableOptionalListWasPresent,
    self->_nullableOptionalListWasNull,
  v7 = self->_nullableOptionalListValue);

  return v7;
}

- (MTRUnitTestingClusterTestComplexNullableOptionalResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRUnitTestingClusterTestComplexNullableOptionalResponseParams;
  v8 = [(MTRUnitTestingClusterTestComplexNullableOptionalResponseParams *)&v38 init];
  if (!v8)
  {
    uint64_t v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 4294048773, 7, error);
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
      BYTE2(buf) = 0;
      BYTE6(buf) = 0;
      BYTE8(buf) = 0;
      WORD6(buf) = 0;
      LOBYTE(v42) = 0;
      BYTE4(v42) = 0;
      char v43 = 0;
      char v44 = 0;
      char v45 = 0;
      __int16 v46 = 0;
      char v47 = 0;
      char v48 = 0;
      char v49 = 0;
      char v50 = 0;
      char v51 = 0;
      __int16 v52 = 0;
      char v53 = 0;
      char v54 = 0;
      char v55 = 0;
      char v56 = 0;
      char v57 = 0;
      __int16 v58 = 0;
      char v59 = 0;
      sub_244846458((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      long long v34 = v32;
      uint64_t v35 = v33;
      if (!v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        long long v34 = v32;
        uint64_t v35 = v33;
        if (!v32)
        {
          uint64_t v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    long long buf = v34;
    uint64_t v42 = v35;
    v11 = sub_244CB7B34((const char **)&buf, 1);
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
    if (error)
    {
      uint64_t v39 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      uint64_t v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v30 = 0;
LABEL_14:
  sub_244794634(&v37);
LABEL_16:

  return v30;
}

- (NSNumber)nullableIntWasNull
{
  return self->_nullableIntWasNull;
}

- (void)setNullableIntWasNull:(NSNumber *)nullableIntWasNull
{
}

- (NSNumber)nullableIntValue
{
  return self->_nullableIntValue;
}

- (void)setNullableIntValue:(NSNumber *)nullableIntValue
{
}

- (NSNumber)optionalIntWasPresent
{
  return self->_optionalIntWasPresent;
}

- (void)setOptionalIntWasPresent:(NSNumber *)optionalIntWasPresent
{
}

- (NSNumber)optionalIntValue
{
  return self->_optionalIntValue;
}

- (void)setOptionalIntValue:(NSNumber *)optionalIntValue
{
}

- (NSNumber)nullableOptionalIntWasPresent
{
  return self->_nullableOptionalIntWasPresent;
}

- (void)setNullableOptionalIntWasPresent:(NSNumber *)nullableOptionalIntWasPresent
{
}

- (NSNumber)nullableOptionalIntWasNull
{
  return self->_nullableOptionalIntWasNull;
}

- (void)setNullableOptionalIntWasNull:(NSNumber *)nullableOptionalIntWasNull
{
}

- (NSNumber)nullableOptionalIntValue
{
  return self->_nullableOptionalIntValue;
}

- (void)setNullableOptionalIntValue:(NSNumber *)nullableOptionalIntValue
{
}

- (NSNumber)nullableStringWasNull
{
  return self->_nullableStringWasNull;
}

- (void)setNullableStringWasNull:(NSNumber *)nullableStringWasNull
{
}

- (NSString)nullableStringValue
{
  return self->_nullableStringValue;
}

- (void)setNullableStringValue:(NSString *)nullableStringValue
{
}

- (NSNumber)optionalStringWasPresent
{
  return self->_optionalStringWasPresent;
}

- (void)setOptionalStringWasPresent:(NSNumber *)optionalStringWasPresent
{
}

- (NSString)optionalStringValue
{
  return self->_optionalStringValue;
}

- (void)setOptionalStringValue:(NSString *)optionalStringValue
{
}

- (NSNumber)nullableOptionalStringWasPresent
{
  return self->_nullableOptionalStringWasPresent;
}

- (void)setNullableOptionalStringWasPresent:(NSNumber *)nullableOptionalStringWasPresent
{
}

- (NSNumber)nullableOptionalStringWasNull
{
  return self->_nullableOptionalStringWasNull;
}

- (void)setNullableOptionalStringWasNull:(NSNumber *)nullableOptionalStringWasNull
{
}

- (NSString)nullableOptionalStringValue
{
  return self->_nullableOptionalStringValue;
}

- (void)setNullableOptionalStringValue:(NSString *)nullableOptionalStringValue
{
}

- (NSNumber)nullableStructWasNull
{
  return self->_nullableStructWasNull;
}

- (void)setNullableStructWasNull:(NSNumber *)nullableStructWasNull
{
}

- (MTRUnitTestingClusterSimpleStruct)nullableStructValue
{
  return self->_nullableStructValue;
}

- (void)setNullableStructValue:(MTRUnitTestingClusterSimpleStruct *)nullableStructValue
{
}

- (NSNumber)optionalStructWasPresent
{
  return self->_optionalStructWasPresent;
}

- (void)setOptionalStructWasPresent:(NSNumber *)optionalStructWasPresent
{
}

- (MTRUnitTestingClusterSimpleStruct)optionalStructValue
{
  return self->_optionalStructValue;
}

- (void)setOptionalStructValue:(MTRUnitTestingClusterSimpleStruct *)optionalStructValue
{
}

- (NSNumber)nullableOptionalStructWasPresent
{
  return self->_nullableOptionalStructWasPresent;
}

- (void)setNullableOptionalStructWasPresent:(NSNumber *)nullableOptionalStructWasPresent
{
}

- (NSNumber)nullableOptionalStructWasNull
{
  return self->_nullableOptionalStructWasNull;
}

- (void)setNullableOptionalStructWasNull:(NSNumber *)nullableOptionalStructWasNull
{
}

- (MTRUnitTestingClusterSimpleStruct)nullableOptionalStructValue
{
  return self->_nullableOptionalStructValue;
}

- (void)setNullableOptionalStructValue:(MTRUnitTestingClusterSimpleStruct *)nullableOptionalStructValue
{
}

- (NSNumber)nullableListWasNull
{
  return self->_nullableListWasNull;
}

- (void)setNullableListWasNull:(NSNumber *)nullableListWasNull
{
}

- (NSArray)nullableListValue
{
  return self->_nullableListValue;
}

- (void)setNullableListValue:(NSArray *)nullableListValue
{
}

- (NSNumber)optionalListWasPresent
{
  return self->_optionalListWasPresent;
}

- (void)setOptionalListWasPresent:(NSNumber *)optionalListWasPresent
{
}

- (NSArray)optionalListValue
{
  return self->_optionalListValue;
}

- (void)setOptionalListValue:(NSArray *)optionalListValue
{
}

- (NSNumber)nullableOptionalListWasPresent
{
  return self->_nullableOptionalListWasPresent;
}

- (void)setNullableOptionalListWasPresent:(NSNumber *)nullableOptionalListWasPresent
{
}

- (NSNumber)nullableOptionalListWasNull
{
  return self->_nullableOptionalListWasNull;
}

- (void)setNullableOptionalListWasNull:(NSNumber *)nullableOptionalListWasNull
{
}

- (NSArray)nullableOptionalListValue
{
  return self->_nullableOptionalListValue;
}

- (void)setNullableOptionalListValue:(NSArray *)nullableOptionalListValue
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
  objc_storeStrong((id *)&self->_nullableOptionalListValue, 0);
  objc_storeStrong((id *)&self->_nullableOptionalListWasNull, 0);
  objc_storeStrong((id *)&self->_nullableOptionalListWasPresent, 0);
  objc_storeStrong((id *)&self->_optionalListValue, 0);
  objc_storeStrong((id *)&self->_optionalListWasPresent, 0);
  objc_storeStrong((id *)&self->_nullableListValue, 0);
  objc_storeStrong((id *)&self->_nullableListWasNull, 0);
  objc_storeStrong((id *)&self->_nullableOptionalStructValue, 0);
  objc_storeStrong((id *)&self->_nullableOptionalStructWasNull, 0);
  objc_storeStrong((id *)&self->_nullableOptionalStructWasPresent, 0);
  objc_storeStrong((id *)&self->_optionalStructValue, 0);
  objc_storeStrong((id *)&self->_optionalStructWasPresent, 0);
  objc_storeStrong((id *)&self->_nullableStructValue, 0);
  objc_storeStrong((id *)&self->_nullableStructWasNull, 0);
  objc_storeStrong((id *)&self->_nullableOptionalStringValue, 0);
  objc_storeStrong((id *)&self->_nullableOptionalStringWasNull, 0);
  objc_storeStrong((id *)&self->_nullableOptionalStringWasPresent, 0);
  objc_storeStrong((id *)&self->_optionalStringValue, 0);
  objc_storeStrong((id *)&self->_optionalStringWasPresent, 0);
  objc_storeStrong((id *)&self->_nullableStringValue, 0);
  objc_storeStrong((id *)&self->_nullableStringWasNull, 0);
  objc_storeStrong((id *)&self->_nullableOptionalIntValue, 0);
  objc_storeStrong((id *)&self->_nullableOptionalIntWasNull, 0);
  objc_storeStrong((id *)&self->_nullableOptionalIntWasPresent, 0);
  objc_storeStrong((id *)&self->_optionalIntValue, 0);
  objc_storeStrong((id *)&self->_optionalIntWasPresent, 0);
  objc_storeStrong((id *)&self->_nullableIntValue, 0);

  objc_storeStrong((id *)&self->_nullableIntWasNull, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithBool_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setNullableIntWasNull_(self, v8, (uint64_t)v7);

  if (*((unsigned char *)a4 + 2))
  {
    uint64_t v10 = NSNumber;
    v11 = sub_2446D1880((unsigned char *)a4 + 2);
    v13 = objc_msgSend_numberWithUnsignedShort_(v10, v12, *(unsigned __int16 *)v11);
    objc_msgSend_setNullableIntValue_(self, v14, (uint64_t)v13);
  }
  else
  {
    objc_msgSend_setNullableIntValue_(self, v9, 0);
  }
  v16 = objc_msgSend_numberWithBool_(NSNumber, v15, *((unsigned __int8 *)a4 + 6));
  objc_msgSend_setOptionalIntWasPresent_(self, v17, (uint64_t)v16);

  if (*((unsigned char *)a4 + 8))
  {
    v19 = NSNumber;
    uint64_t v20 = sub_2446D1880((unsigned char *)a4 + 8);
    uint64_t v22 = objc_msgSend_numberWithUnsignedShort_(v19, v21, *(unsigned __int16 *)v20);
    objc_msgSend_setOptionalIntValue_(self, v23, (uint64_t)v22);
  }
  else
  {
    objc_msgSend_setOptionalIntValue_(self, v18, 0);
  }
  v25 = objc_msgSend_numberWithBool_(NSNumber, v24, *((unsigned __int8 *)a4 + 12));
  objc_msgSend_setNullableOptionalIntWasPresent_(self, v26, (uint64_t)v25);

  if (*((unsigned char *)a4 + 13))
  {
    v28 = NSNumber;
    v29 = sub_2446D18C8((unsigned char *)a4 + 13);
    v31 = objc_msgSend_numberWithBool_(v28, v30, *v29);
    objc_msgSend_setNullableOptionalIntWasNull_(self, v32, (uint64_t)v31);
  }
  else
  {
    objc_msgSend_setNullableOptionalIntWasNull_(self, v27, 0);
  }
  if (*((unsigned char *)a4 + 16))
  {
    long long v34 = NSNumber;
    uint64_t v35 = sub_2446D1880((unsigned char *)a4 + 16);
    v37 = objc_msgSend_numberWithUnsignedShort_(v34, v36, *(unsigned __int16 *)v35);
    objc_msgSend_setNullableOptionalIntValue_(self, v38, (uint64_t)v37);
  }
  else
  {
    objc_msgSend_setNullableOptionalIntValue_(self, v33, 0);
  }
  v40 = objc_msgSend_numberWithBool_(NSNumber, v39, *((unsigned __int8 *)a4 + 20));
  objc_msgSend_setNullableStringWasNull_(self, v41, (uint64_t)v40);

  if (*((unsigned char *)a4 + 24))
  {
    char v43 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 24);
    uint64_t v44 = *v43;
    uint64_t v45 = v43[1];
    id v46 = [NSString alloc];
    char v48 = objc_msgSend_initWithBytes_length_encoding_(v46, v47, v44, v45, 4);
    objc_msgSend_setNullableStringValue_(self, v49, (uint64_t)v48);

    __int16 v52 = objc_msgSend_nullableStringValue(self, v50, v51);

    if (!v52)
    {
      char v55 = &xmmword_2651945C0;
LABEL_53:
      *(_OWORD *)&retstr->mError = *v55;
      *(void *)&retstr->mLine = *((void *)v55 + 2);
      return result;
    }
  }
  else
  {
    objc_msgSend_setNullableStringValue_(self, v42, 0);
  }
  char v56 = objc_msgSend_numberWithBool_(NSNumber, v54, *((unsigned __int8 *)a4 + 48));
  objc_msgSend_setOptionalStringWasPresent_(self, v57, (uint64_t)v56);

  if (*((unsigned char *)a4 + 56))
  {
    char v59 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 56);
    uint64_t v60 = *v59;
    uint64_t v61 = v59[1];
    id v62 = [NSString alloc];
    v64 = objc_msgSend_initWithBytes_length_encoding_(v62, v63, v60, v61, 4);
    objc_msgSend_setOptionalStringValue_(self, v65, (uint64_t)v64);

    v68 = objc_msgSend_optionalStringValue(self, v66, v67);

    if (!v68)
    {
      char v55 = &xmmword_2651945D8;
      goto LABEL_53;
    }
  }
  else
  {
    objc_msgSend_setOptionalStringValue_(self, v58, 0);
  }
  uint64_t v70 = objc_msgSend_numberWithBool_(NSNumber, v69, *((unsigned __int8 *)a4 + 80));
  objc_msgSend_setNullableOptionalStringWasPresent_(self, v71, (uint64_t)v70);

  if (*((unsigned char *)a4 + 81))
  {
    v73 = NSNumber;
    uint64_t v74 = sub_2446D18C8((unsigned char *)a4 + 81);
    v76 = objc_msgSend_numberWithBool_(v73, v75, *v74);
    objc_msgSend_setNullableOptionalStringWasNull_(self, v77, (uint64_t)v76);
  }
  else
  {
    objc_msgSend_setNullableOptionalStringWasNull_(self, v72, 0);
  }
  if (*((unsigned char *)a4 + 88))
  {
    v79 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 88);
    uint64_t v80 = *v79;
    uint64_t v81 = v79[1];
    id v82 = [NSString alloc];
    v84 = objc_msgSend_initWithBytes_length_encoding_(v82, v83, v80, v81, 4);
    objc_msgSend_setNullableOptionalStringValue_(self, v85, (uint64_t)v84);

    v88 = objc_msgSend_nullableOptionalStringValue(self, v86, v87);

    if (!v88)
    {
      char v55 = &xmmword_2651945F0;
      goto LABEL_53;
    }
  }
  else
  {
    objc_msgSend_setNullableOptionalStringValue_(self, v78, 0);
  }
  uint64_t v90 = objc_msgSend_numberWithBool_(NSNumber, v89, *((unsigned __int8 *)a4 + 112));
  objc_msgSend_setNullableStructWasNull_(self, v91, (uint64_t)v90);

  if (*((unsigned char *)a4 + 120))
  {
    v93 = objc_opt_new();
    objc_msgSend_setNullableStructValue_(self, v94, (uint64_t)v93);

    v95 = NSNumber;
    v96 = sub_2446F7170((unsigned char *)a4 + 120);
    uint64_t v98 = objc_msgSend_numberWithUnsignedChar_(v95, v97, *v96);
    v101 = objc_msgSend_nullableStructValue(self, v99, v100);
    objc_msgSend_setA_(v101, v102, (uint64_t)v98);

    v103 = NSNumber;
    v104 = sub_2446F7170((unsigned char *)a4 + 120);
    uint64_t v106 = objc_msgSend_numberWithBool_(v103, v105, v104[1]);
    v109 = objc_msgSend_nullableStructValue(self, v107, v108);
    objc_msgSend_setB_(v109, v110, (uint64_t)v106);

    v111 = NSNumber;
    v112 = sub_2446F7170((unsigned char *)a4 + 120);
    uint64_t v114 = objc_msgSend_numberWithUnsignedChar_(v111, v113, v112[2]);
    v117 = objc_msgSend_nullableStructValue(self, v115, v116);
    objc_msgSend_setC_(v117, v118, (uint64_t)v114);

    v119 = sub_2446F7170((unsigned char *)a4 + 120);
    v121 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v120, *((void *)v119 + 1), *((void *)v119 + 2));
    v124 = objc_msgSend_nullableStructValue(self, v122, v123);
    objc_msgSend_setD_(v124, v125, (uint64_t)v121);

    v126 = sub_2446F7170((unsigned char *)a4 + 120);
    uint64_t v127 = *((void *)v126 + 3);
    uint64_t v128 = *((void *)v126 + 4);
    id v129 = [NSString alloc];
    v131 = objc_msgSend_initWithBytes_length_encoding_(v129, v130, v127, v128, 4);
    v134 = objc_msgSend_nullableStructValue(self, v132, v133);
    objc_msgSend_setE_(v134, v135, (uint64_t)v131);

    v138 = objc_msgSend_nullableStructValue(self, v136, v137);
    v141 = objc_msgSend_e(v138, v139, v140);

    if (!v141)
    {
      char v55 = &xmmword_265194608;
      goto LABEL_53;
    }
    v142 = NSNumber;
    v143 = sub_2446F7170((unsigned char *)a4 + 120);
    v145 = objc_msgSend_numberWithUnsignedChar_(v142, v144, v143[40]);
    v148 = objc_msgSend_nullableStructValue(self, v146, v147);
    objc_msgSend_setF_(v148, v149, (uint64_t)v145);

    v150 = NSNumber;
    LODWORD(v151) = *((_DWORD *)sub_2446F7170((unsigned char *)a4 + 120) + 11);
    v154 = objc_msgSend_numberWithFloat_(v150, v152, v153, v151);
    v157 = objc_msgSend_nullableStructValue(self, v155, v156);
    objc_msgSend_setG_(v157, v158, (uint64_t)v154);

    v159 = NSNumber;
    v160 = (double *)sub_2446F7170((unsigned char *)a4 + 120);
    v163 = objc_msgSend_numberWithDouble_(v159, v161, v162, v160[6]);
    v166 = objc_msgSend_nullableStructValue(self, v164, v165);
    objc_msgSend_setH_(v166, v167, (uint64_t)v163);

    if (sub_2446F7170((unsigned char *)a4 + 120)[56])
    {
      v170 = NSNumber;
      v171 = sub_2446F7170((unsigned char *)a4 + 120);
      v172 = sub_2446F9190(v171 + 56);
      v174 = objc_msgSend_numberWithUnsignedChar_(v170, v173, *v172);
      v177 = objc_msgSend_nullableStructValue(self, v175, v176);
      objc_msgSend_setI_(v177, v178, (uint64_t)v174);
    }
    else
    {
      v174 = objc_msgSend_nullableStructValue(self, v168, v169);
      objc_msgSend_setI_(v174, v180, 0);
    }
  }
  else
  {
    objc_msgSend_setNullableStructValue_(self, v92, 0);
  }
  v181 = objc_msgSend_numberWithBool_(NSNumber, v179, *((unsigned __int8 *)a4 + 192));
  objc_msgSend_setOptionalStructWasPresent_(self, v182, (uint64_t)v181);

  if (*((unsigned char *)a4 + 200))
  {
    v184 = objc_opt_new();
    objc_msgSend_setOptionalStructValue_(self, v185, (uint64_t)v184);

    v186 = NSNumber;
    v187 = sub_2446F7170((unsigned char *)a4 + 200);
    v189 = objc_msgSend_numberWithUnsignedChar_(v186, v188, *v187);
    v192 = objc_msgSend_optionalStructValue(self, v190, v191);
    objc_msgSend_setA_(v192, v193, (uint64_t)v189);

    v194 = NSNumber;
    v195 = sub_2446F7170((unsigned char *)a4 + 200);
    v197 = objc_msgSend_numberWithBool_(v194, v196, v195[1]);
    v200 = objc_msgSend_optionalStructValue(self, v198, v199);
    objc_msgSend_setB_(v200, v201, (uint64_t)v197);

    v202 = NSNumber;
    v203 = sub_2446F7170((unsigned char *)a4 + 200);
    v205 = objc_msgSend_numberWithUnsignedChar_(v202, v204, v203[2]);
    v208 = objc_msgSend_optionalStructValue(self, v206, v207);
    objc_msgSend_setC_(v208, v209, (uint64_t)v205);

    v210 = sub_2446F7170((unsigned char *)a4 + 200);
    v212 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v211, *((void *)v210 + 1), *((void *)v210 + 2));
    v215 = objc_msgSend_optionalStructValue(self, v213, v214);
    objc_msgSend_setD_(v215, v216, (uint64_t)v212);

    v217 = sub_2446F7170((unsigned char *)a4 + 200);
    uint64_t v218 = *((void *)v217 + 3);
    uint64_t v219 = *((void *)v217 + 4);
    id v220 = [NSString alloc];
    v222 = objc_msgSend_initWithBytes_length_encoding_(v220, v221, v218, v219, 4);
    v225 = objc_msgSend_optionalStructValue(self, v223, v224);
    objc_msgSend_setE_(v225, v226, (uint64_t)v222);

    v229 = objc_msgSend_optionalStructValue(self, v227, v228);
    v232 = objc_msgSend_e(v229, v230, v231);

    if (!v232)
    {
      char v55 = &xmmword_265194620;
      goto LABEL_53;
    }
    v233 = NSNumber;
    v234 = sub_2446F7170((unsigned char *)a4 + 200);
    v236 = objc_msgSend_numberWithUnsignedChar_(v233, v235, v234[40]);
    v239 = objc_msgSend_optionalStructValue(self, v237, v238);
    objc_msgSend_setF_(v239, v240, (uint64_t)v236);

    v241 = NSNumber;
    LODWORD(v242) = *((_DWORD *)sub_2446F7170((unsigned char *)a4 + 200) + 11);
    v245 = objc_msgSend_numberWithFloat_(v241, v243, v244, v242);
    v248 = objc_msgSend_optionalStructValue(self, v246, v247);
    objc_msgSend_setG_(v248, v249, (uint64_t)v245);

    v250 = NSNumber;
    v251 = (double *)sub_2446F7170((unsigned char *)a4 + 200);
    v254 = objc_msgSend_numberWithDouble_(v250, v252, v253, v251[6]);
    v257 = objc_msgSend_optionalStructValue(self, v255, v256);
    objc_msgSend_setH_(v257, v258, (uint64_t)v254);

    if (sub_2446F7170((unsigned char *)a4 + 200)[56])
    {
      v261 = NSNumber;
      v262 = sub_2446F7170((unsigned char *)a4 + 200);
      v263 = sub_2446F9190(v262 + 56);
      v265 = objc_msgSend_numberWithUnsignedChar_(v261, v264, *v263);
      v268 = objc_msgSend_optionalStructValue(self, v266, v267);
      objc_msgSend_setI_(v268, v269, (uint64_t)v265);
    }
    else
    {
      v265 = objc_msgSend_optionalStructValue(self, v259, v260);
      objc_msgSend_setI_(v265, v271, 0);
    }
  }
  else
  {
    objc_msgSend_setOptionalStructValue_(self, v183, 0);
  }
  v272 = objc_msgSend_numberWithBool_(NSNumber, v270, *((unsigned __int8 *)a4 + 272));
  objc_msgSend_setNullableOptionalStructWasPresent_(self, v273, (uint64_t)v272);

  if (*((unsigned char *)a4 + 273))
  {
    v275 = NSNumber;
    v276 = sub_2446D18C8((unsigned char *)a4 + 273);
    v278 = objc_msgSend_numberWithBool_(v275, v277, *v276);
    objc_msgSend_setNullableOptionalStructWasNull_(self, v279, (uint64_t)v278);
  }
  else
  {
    objc_msgSend_setNullableOptionalStructWasNull_(self, v274, 0);
  }
  if (*((unsigned char *)a4 + 280))
  {
    v281 = objc_opt_new();
    objc_msgSend_setNullableOptionalStructValue_(self, v282, (uint64_t)v281);

    v283 = NSNumber;
    v284 = sub_2446F7170((unsigned char *)a4 + 280);
    v286 = objc_msgSend_numberWithUnsignedChar_(v283, v285, *v284);
    v289 = objc_msgSend_nullableOptionalStructValue(self, v287, v288);
    objc_msgSend_setA_(v289, v290, (uint64_t)v286);

    v291 = NSNumber;
    v292 = sub_2446F7170((unsigned char *)a4 + 280);
    v294 = objc_msgSend_numberWithBool_(v291, v293, v292[1]);
    v297 = objc_msgSend_nullableOptionalStructValue(self, v295, v296);
    objc_msgSend_setB_(v297, v298, (uint64_t)v294);

    v299 = NSNumber;
    v300 = sub_2446F7170((unsigned char *)a4 + 280);
    v302 = objc_msgSend_numberWithUnsignedChar_(v299, v301, v300[2]);
    v305 = objc_msgSend_nullableOptionalStructValue(self, v303, v304);
    objc_msgSend_setC_(v305, v306, (uint64_t)v302);

    v307 = sub_2446F7170((unsigned char *)a4 + 280);
    v309 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v308, *((void *)v307 + 1), *((void *)v307 + 2));
    v312 = objc_msgSend_nullableOptionalStructValue(self, v310, v311);
    objc_msgSend_setD_(v312, v313, (uint64_t)v309);

    v314 = sub_2446F7170((unsigned char *)a4 + 280);
    uint64_t v315 = *((void *)v314 + 3);
    uint64_t v316 = *((void *)v314 + 4);
    id v317 = [NSString alloc];
    v319 = objc_msgSend_initWithBytes_length_encoding_(v317, v318, v315, v316, 4);
    v322 = objc_msgSend_nullableOptionalStructValue(self, v320, v321);
    objc_msgSend_setE_(v322, v323, (uint64_t)v319);

    v326 = objc_msgSend_nullableOptionalStructValue(self, v324, v325);
    v329 = objc_msgSend_e(v326, v327, v328);

    if (!v329)
    {
      char v55 = &xmmword_265194638;
      goto LABEL_53;
    }
    v330 = NSNumber;
    v331 = sub_2446F7170((unsigned char *)a4 + 280);
    v333 = objc_msgSend_numberWithUnsignedChar_(v330, v332, v331[40]);
    v336 = objc_msgSend_nullableOptionalStructValue(self, v334, v335);
    objc_msgSend_setF_(v336, v337, (uint64_t)v333);

    v338 = NSNumber;
    LODWORD(v339) = *((_DWORD *)sub_2446F7170((unsigned char *)a4 + 280) + 11);
    v342 = objc_msgSend_numberWithFloat_(v338, v340, v341, v339);
    v345 = objc_msgSend_nullableOptionalStructValue(self, v343, v344);
    objc_msgSend_setG_(v345, v346, (uint64_t)v342);

    v347 = NSNumber;
    v348 = (double *)sub_2446F7170((unsigned char *)a4 + 280);
    v351 = objc_msgSend_numberWithDouble_(v347, v349, v350, v348[6]);
    v354 = objc_msgSend_nullableOptionalStructValue(self, v352, v353);
    objc_msgSend_setH_(v354, v355, (uint64_t)v351);

    if (sub_2446F7170((unsigned char *)a4 + 280)[56])
    {
      v358 = NSNumber;
      v359 = sub_2446F7170((unsigned char *)a4 + 280);
      v360 = sub_2446F9190(v359 + 56);
      v362 = objc_msgSend_numberWithUnsignedChar_(v358, v361, *v360);
      v365 = objc_msgSend_nullableOptionalStructValue(self, v363, v364);
      objc_msgSend_setI_(v365, v366, (uint64_t)v362);
    }
    else
    {
      v362 = objc_msgSend_nullableOptionalStructValue(self, v356, v357);
      objc_msgSend_setI_(v362, v368, 0);
    }
  }
  else
  {
    objc_msgSend_setNullableOptionalStructValue_(self, v280, 0);
  }
  v369 = objc_msgSend_numberWithBool_(NSNumber, v367, *((unsigned __int8 *)a4 + 352));
  objc_msgSend_setNullableListWasNull_(self, v370, (uint64_t)v369);

  if (*((unsigned char *)a4 + 360))
  {
    v372 = objc_opt_new();
    v373 = sub_2446F7170((unsigned char *)a4 + 360);
    unsigned __int8 v404 = v373[72];
    if (v404) {
      char v405 = v373[73];
    }
    sub_2446D1930((uint64_t)v401, (uint64_t)v373, &v404);
    while (sub_2446D19A0((uint64_t)v401))
    {
      v375 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v374, v401[0]);
      objc_msgSend_addObject_(v372, v376, (uint64_t)v375);
    }
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    if (v402 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
    }
    else
    {
      *(_OWORD *)&retstr->mError = v402;
      *(void *)&retstr->mLine = v403;
      if (retstr->mError) {
        goto LABEL_78;
      }
    }
    objc_msgSend_setNullableListValue_(self, v374, (uint64_t)v372);
  }
  else
  {
    objc_msgSend_setNullableListValue_(self, v371, 0);
  }
  v378 = objc_msgSend_numberWithBool_(NSNumber, v377, *((unsigned __int8 *)a4 + 448));
  objc_msgSend_setOptionalListWasPresent_(self, v379, (uint64_t)v378);

  if (*((unsigned char *)a4 + 456))
  {
    v372 = objc_opt_new();
    v381 = sub_2446F7170((unsigned char *)a4 + 456);
    unsigned __int8 v404 = v381[72];
    if (v404) {
      char v405 = v381[73];
    }
    sub_2446D1930((uint64_t)v401, (uint64_t)v381, &v404);
    while (sub_2446D19A0((uint64_t)v401))
    {
      v383 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v382, v401[0]);
      objc_msgSend_addObject_(v372, v384, (uint64_t)v383);
    }
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    if (v402 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
LABEL_79:
      objc_msgSend_setOptionalListValue_(self, v382, (uint64_t)v372);

      goto LABEL_80;
    }
    *(_OWORD *)&retstr->mError = v402;
    *(void *)&retstr->mLine = v403;
    if (!retstr->mError) {
      goto LABEL_79;
    }
LABEL_78:

    return result;
  }
  objc_msgSend_setOptionalListValue_(self, v380, 0);
LABEL_80:
  v386 = objc_msgSend_numberWithBool_(NSNumber, v385, *((unsigned __int8 *)a4 + 544));
  objc_msgSend_setNullableOptionalListWasPresent_(self, v387, (uint64_t)v386);

  if (*((unsigned char *)a4 + 545))
  {
    v389 = NSNumber;
    v390 = sub_2446D18C8((unsigned char *)a4 + 545);
    v392 = objc_msgSend_numberWithBool_(v389, v391, *v390);
    objc_msgSend_setNullableOptionalListWasNull_(self, v393, (uint64_t)v392);
  }
  else
  {
    objc_msgSend_setNullableOptionalListWasNull_(self, v388, 0);
  }
  if (*((unsigned char *)a4 + 552))
  {
    v395 = (char *)a4 + 552;
    v396 = objc_opt_new();
    v397 = sub_2446F7170(v395);
    unsigned __int8 v404 = v397[72];
    if (v404) {
      char v405 = v397[73];
    }
    sub_2446D1930((uint64_t)v401, (uint64_t)v397, &v404);
    while (sub_2446D19A0((uint64_t)v401))
    {
      v399 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v398, v401[0]);
      objc_msgSend_addObject_(v396, v400, (uint64_t)v399);
    }
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    if (v402 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
    }
    else
    {
      *(_OWORD *)&retstr->mError = v402;
      *(void *)&retstr->mLine = v403;
      if (retstr->mError)
      {

        return result;
      }
    }
    objc_msgSend_setNullableOptionalListValue_(self, v398, (uint64_t)v396);
  }
  else
  {
    result = (ChipError *)objc_msgSend_setNullableOptionalListValue_(self, v394, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 37727;
  return result;
}

@end