@interface HAPTLVBase
- (BOOL)_parseFields:(id)a3;
- (BOOL)_parseFromTLVData;
- (BOOL)_parseMandatory:(id)a3 optional:(id)a4;
- (HAPTLVBase)initWithTLVData:(id)a3;
- (NSData)tlvDatablob;
- (id)_parseArray:(id)a3 result:(id *)a4 objectCreator:(id)a5;
@end

@implementation HAPTLVBase

- (void).cxx_destruct
{
}

- (NSData)tlvDatablob
{
  return self->_tlvDatablob;
}

- (id)_parseArray:(id)a3 result:(id *)a4 objectCreator:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a5;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = v7[2](v7, *(void *)(*((void *)&v18 + 1) + 8 * v13));
      if (!v14) {
        break;
      }
      v15 = (void *)v14;
      objc_msgSend(v8, "addObject:", v14, (void)v18);

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v16 = (void *)[v8 copy];

  return v16;
}

- (BOOL)_parseMandatory:(id)a3 optional:(id)a4
{
  id v6 = a4;
  LOBYTE(a3) = [(HAPTLVBase *)self _parseFields:a3];
  [(HAPTLVBase *)self _parseFields:v6];

  return (char)a3;
}

- (BOOL)_parseFields:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61 = self;
  v5 = [(HAPTLVBase *)self tlvDatablob];
  id v6 = +[HAPTLVParser parserWithData:v5];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (!v8)
  {
    char v10 = 1;
    goto LABEL_56;
  }
  uint64_t v9 = v8;
  char v10 = 1;
  uint64_t v11 = *(void *)v66;
  v60 = v6;
  id v62 = v7;
  uint64_t v63 = *(void *)v66;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v66 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void **)(*((void *)&v65 + 1) + 8 * v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        v15 = objc_msgSend(v6, "parseResponseForNumber:", objc_msgSend(v14, "tlvid"));
        if (v15) {
          goto LABEL_36;
        }
        uint64_t v16 = MEMORY[0x1D944E080]();
        v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          long long v18 = HMFGetLogIdentifier();
          long long v19 = [v14 name];
          uint64_t v20 = [v14 tlvid];
          long long v21 = [(HAPTLVBase *)v61 tlvDatablob];
          *(_DWORD *)buf = 138544130;
          v70 = v18;
          __int16 v71 = 2112;
          v72 = v19;
          __int16 v73 = 2048;
          uint64_t v74 = v20;
          __int16 v75 = 2112;
          v76 = v21;
          _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse number for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

          id v7 = v62;
          id v6 = v60;
        }
        goto LABEL_27;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        v15 = objc_msgSend(v6, "parseResponseForUInt8:", objc_msgSend(v14, "tlvid"));
        if (v15) {
          goto LABEL_36;
        }
        uint64_t v16 = MEMORY[0x1D944E080]();
        v17 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        v22 = HMFGetLogIdentifier();
        uint64_t v23 = [v14 name];
        uint64_t v24 = [v14 tlvid];
        v25 = [(HAPTLVBase *)v61 tlvDatablob];
        *(_DWORD *)buf = 138544130;
        v70 = v22;
        __int16 v71 = 2112;
        v72 = v23;
        __int16 v73 = 2048;
        uint64_t v74 = v24;
        id v6 = v60;
        __int16 v75 = 2112;
        v76 = v25;
        v26 = v17;
        v27 = "%{public}@Failed to parse uint8 for tlv: %@ with ID: %tu (%@)";
        goto LABEL_26;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        v15 = objc_msgSend(v6, "parseResponseForUInt16:", objc_msgSend(v14, "tlvid"));
        if (v15) {
          goto LABEL_36;
        }
        uint64_t v16 = MEMORY[0x1D944E080]();
        v17 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        v22 = HMFGetLogIdentifier();
        uint64_t v23 = [v14 name];
        uint64_t v28 = [v14 tlvid];
        v25 = [(HAPTLVBase *)v61 tlvDatablob];
        *(_DWORD *)buf = 138544130;
        v70 = v22;
        __int16 v71 = 2112;
        v72 = v23;
        __int16 v73 = 2048;
        uint64_t v74 = v28;
        id v6 = v60;
        __int16 v75 = 2112;
        v76 = v25;
        v26 = v17;
        v27 = "%{public}@Failed to parse uint16 for tlv: %@ with ID: %tu (%@)";
        goto LABEL_26;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        v15 = objc_msgSend(v6, "parseResponseForString:", objc_msgSend(v14, "tlvid"));
        if (v15) {
          goto LABEL_36;
        }
        uint64_t v16 = MEMORY[0x1D944E080]();
        v17 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        v22 = HMFGetLogIdentifier();
        uint64_t v23 = [v14 name];
        uint64_t v29 = [v14 tlvid];
        v25 = [(HAPTLVBase *)v61 tlvDatablob];
        *(_DWORD *)buf = 138544130;
        v70 = v22;
        __int16 v71 = 2112;
        v72 = v23;
        __int16 v73 = 2048;
        uint64_t v74 = v29;
        id v6 = v60;
        __int16 v75 = 2112;
        v76 = v25;
        v26 = v17;
        v27 = "%{public}@Failed to parse String for tlv: %@ with ID: %tu (%@)";
        goto LABEL_26;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        v15 = objc_msgSend(v6, "parseResponseForData:", objc_msgSend(v14, "tlvid"));
        if (v15) {
          goto LABEL_36;
        }
        uint64_t v16 = MEMORY[0x1D944E080]();
        v17 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        v22 = HMFGetLogIdentifier();
        uint64_t v23 = [v14 name];
        uint64_t v30 = [v14 tlvid];
        v25 = [(HAPTLVBase *)v61 tlvDatablob];
        *(_DWORD *)buf = 138544130;
        v70 = v22;
        __int16 v71 = 2112;
        v72 = v23;
        __int16 v73 = 2048;
        uint64_t v74 = v30;
        id v6 = v60;
        __int16 v75 = 2112;
        v76 = v25;
        v26 = v17;
        v27 = "%{public}@Failed to parse Data for tlv: %@ with ID: %tu (%@)";
LABEL_26:
        _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x2Au);

        id v7 = v62;
LABEL_27:

        v31 = (void *)v16;
        goto LABEL_28;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = v13;
        uint64_t v33 = objc_msgSend(v6, "parseResponseForArray:", objc_msgSend(v32, "tlvid"));
        if (v33)
        {
          v34 = (void *)v33;
          v35 = [v32 objectCreator];

          if (!v35)
          {
            [v32 setField:v34];

            id v7 = v62;
            uint64_t v11 = v63;
            goto LABEL_38;
          }
          id v64 = v34;
          v36 = [v32 objectCreator];
          v37 = [(HAPTLVBase *)v61 _parseArray:v34 result:&v64 objectCreator:v36];
          id v38 = v64;

          if (v37)
          {
            [v32 setField:v37];
          }
          else
          {
            v51 = (void *)MEMORY[0x1D944E080]();
            v52 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v53 = v59 = v51;
              v54 = [v32 name];
              uint64_t v55 = [v32 tlvid];
              v56 = [(HAPTLVBase *)v61 tlvDatablob];
              *(_DWORD *)buf = 138544130;
              v70 = v53;
              __int16 v71 = 2112;
              v72 = v54;
              __int16 v73 = 2048;
              uint64_t v74 = v55;
              id v6 = v60;
              __int16 v75 = 2112;
              v76 = v56;
              _os_log_impl(&dword_1D4758000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to construct array for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

              v51 = v59;
            }

            char v10 = 0;
          }
          id v7 = v62;
        }
        else
        {
          v39 = (void *)MEMORY[0x1D944E080]();
          v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = HMFGetLogIdentifier();
            v42 = [v32 name];
            uint64_t v43 = [v32 tlvid];
            v44 = [(HAPTLVBase *)v61 tlvDatablob];
            *(_DWORD *)buf = 138544130;
            v70 = v41;
            __int16 v71 = 2112;
            v72 = v42;
            __int16 v73 = 2048;
            uint64_t v74 = v43;
            id v6 = v60;
            __int16 v75 = 2112;
            v76 = v44;
            _os_log_impl(&dword_1D4758000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Array for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

            id v7 = v62;
          }

          char v10 = 0;
        }
        uint64_t v11 = v63;
        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_39;
      }
      id v14 = v13;
      v15 = objc_msgSend(v6, "parseResponseForUUID:", objc_msgSend(v14, "tlvid"));
      if (v15)
      {
LABEL_36:
        [v14 setField:v15];
        goto LABEL_37;
      }
      uint64_t v45 = MEMORY[0x1D944E080]();
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = HMFGetLogIdentifier();
        v48 = [v14 name];
        uint64_t v49 = [v14 tlvid];
        v50 = [(HAPTLVBase *)v61 tlvDatablob];
        *(_DWORD *)buf = 138544130;
        v70 = v47;
        __int16 v71 = 2112;
        v72 = v48;
        __int16 v73 = 2048;
        uint64_t v74 = v49;
        id v6 = v60;
        __int16 v75 = 2112;
        v76 = v50;
        _os_log_impl(&dword_1D4758000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse UUID for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

        id v7 = v62;
      }

      v31 = (void *)v45;
LABEL_28:
      char v10 = 0;
      uint64_t v11 = v63;
LABEL_37:

LABEL_38:
LABEL_39:
      ++v12;
    }
    while (v9 != v12);
    uint64_t v57 = [v7 countByEnumeratingWithState:&v65 objects:v77 count:16];
    uint64_t v9 = v57;
  }
  while (v57);
LABEL_56:

  return v10 & 1;
}

- (BOOL)_parseFromTLVData
{
  return 0;
}

- (HAPTLVBase)initWithTLVData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HAPTLVBase;
  id v6 = [(HAPTLVBase *)&v10 init];
  id v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_tlvDatablob, a3), ![(HAPTLVBase *)v7 _parseFromTLVData])) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }

  return v8;
}

@end