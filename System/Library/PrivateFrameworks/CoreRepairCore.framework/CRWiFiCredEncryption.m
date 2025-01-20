@interface CRWiFiCredEncryption
+ (id)decryptUserData:(id)a3;
+ (id)encryptUserData:(id)a3;
@end

@implementation CRWiFiCredEncryption

+ (id)encryptUserData:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v3 = a3;
  arc4random_buf(__buf, 0x10uLL);
  v5 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v4, (uint64_t)__buf, 16);
  if (v5)
  {
    v9 = sub_21FC51234();
    if (v9)
    {
      v10 = (void *)MEMORY[0x263EFF990];
      uint64_t v11 = objc_msgSend_length(v3, v6, v7, v8);
      v14 = objc_msgSend_dataWithLength_(v10, v12, v11, v13);
      v17 = objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v15, 16, v16);
      v18 = v9;
      objc_msgSend_bytes(v18, v19, v20, v21);
      objc_msgSend_length(v18, v22, v23, v24);
      v90 = v5;
      id v25 = v5;
      objc_msgSend_bytes(v25, v26, v27, v28);
      objc_msgSend_length(v25, v29, v30, v31);
      id v91 = v3;
      id v32 = v3;
      objc_msgSend_bytes(v32, v33, v34, v35);
      uint64_t v39 = objc_msgSend_length(v32, v36, v37, v38);
      v40 = v14;
      uint64_t v44 = objc_msgSend_mutableBytes(v40, v41, v42, v43);
      id v45 = v17;
      uint64_t v89 = objc_msgSend_mutableBytes(v45, v46, v47, v48);
      uint64_t v88 = v39;
      uint64_t v49 = CCCryptorGCMOneshotEncrypt();
      v50 = v18;
      v54 = objc_msgSend_mutableBytes(v50, v51, v52, v53, v88, v44, v89, 16);
      rsize_t v58 = objc_msgSend_length(v50, v55, v56, v57);
      memset_s(v54, 0x20uLL, 0, v58);
      if (v49)
      {
        v62 = handleForCategory(0);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          sub_21FC68A90(v49, v62, v63, v64, v65, v66, v67, v68);
        }
        v69 = 0;
      }
      else
      {
        v70 = (void *)MEMORY[0x263EFF990];
        uint64_t v71 = objc_msgSend_length(v25, v59, v60, v61);
        uint64_t v75 = objc_msgSend_length(v40, v72, v73, v74);
        v62 = objc_msgSend_dataWithCapacity_(v70, v76, v71 + v75 + 16, v77);
        objc_msgSend_appendData_(v62, v78, (uint64_t)v45, v79);
        objc_msgSend_appendData_(v62, v80, (uint64_t)v25, v81);
        objc_msgSend_appendData_(v62, v82, (uint64_t)v40, v83);
        v69 = objc_msgSend_copy(v62, v84, v85, v86);
      }
      v5 = v90;
      id v3 = v91;
    }
    else
    {
      v40 = handleForCategory(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_21FC68A5C();
      }
      v69 = 0;
    }
  }
  else
  {
    v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC68A28();
    }
    v69 = 0;
  }

  return v69;
}

+ (id)decryptUserData:(id)a3
{
  id v3 = a3;
  if ((unint64_t)objc_msgSend_length(v3, v4, v5, v6) > 0x1F)
  {
    uint64_t v8 = objc_msgSend_subdataWithRange_(v3, v7, 0, 16);
    uint64_t v11 = objc_msgSend_subdataWithRange_(v3, v10, 16, 16);
    uint64_t v15 = objc_msgSend_length(v3, v12, v13, v14);
    v17 = objc_msgSend_subdataWithRange_(v3, v16, 32, v15 - 32);
    uint64_t v21 = sub_21FC51234();
    if (v21)
    {
      v22 = (void *)MEMORY[0x263EFF990];
      uint64_t v23 = objc_msgSend_length(v17, v18, v19, v20);
      v26 = objc_msgSend_dataWithLength_(v22, v24, v23, v25);
      id v27 = v21;
      objc_msgSend_bytes(v27, v28, v29, v30);
      objc_msgSend_length(v27, v31, v32, v33);
      uint64_t v81 = v11;
      id v34 = v11;
      objc_msgSend_bytes(v34, v35, v36, v37);
      objc_msgSend_length(v34, v38, v39, v40);
      v80 = v17;
      id v41 = v17;
      objc_msgSend_bytes(v41, v42, v43, v44);
      uint64_t v48 = objc_msgSend_length(v41, v45, v46, v47);
      uint64_t v49 = v26;
      uint64_t v53 = objc_msgSend_mutableBytes(v49, v50, v51, v52);
      v54 = v8;
      uint64_t v79 = objc_msgSend_bytes(v54, v55, v56, v57);
      uint64_t v58 = CCCryptorGCMOneshotDecrypt();
      id v59 = v27;
      uint64_t v63 = objc_msgSend_mutableBytes(v59, v60, v61, v62, v48, v53, v79, 16);
      rsize_t v67 = objc_msgSend_length(v59, v64, v65, v66);
      memset_s(v63, 0x20uLL, 0, v67);
      if (v58)
      {
        uint64_t v71 = handleForCategory(0);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          sub_21FC68BD0(v58, v71, v72, v73, v74, v75, v76, v77);
        }

        uint64_t v49 = 0;
      }
      v17 = v80;
      uint64_t v11 = v81;
      v9 = objc_msgSend_copy(v49, v68, v69, v70);
    }
    else
    {
      uint64_t v49 = handleForCategory(0);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_21FC68A5C();
      }
      v9 = 0;
    }
  }
  else
  {
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC68B9C();
    }
    v9 = 0;
  }

  return v9;
}

@end