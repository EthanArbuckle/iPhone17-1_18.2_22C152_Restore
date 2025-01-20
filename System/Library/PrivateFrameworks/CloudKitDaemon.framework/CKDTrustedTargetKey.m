@interface CKDTrustedTargetKey
- (CKDTrustedTargetKey)init;
- (NSData)key;
- (id)decrypt:(id)a3;
- (id)encrypt:(id)a3;
@end

@implementation CKDTrustedTargetKey

- (CKDTrustedTargetKey)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CKDTrustedTargetKey;
  v2 = [(CKDTrustedTargetKey *)&v15 init];
  if (v2)
  {
    uint64_t v3 = ccrng();
    if (v3)
    {
      v4 = (uint64_t (**)(void, uint64_t, void *))v3;
      v5 = malloc_type_malloc(0x20uLL, 0x9F9B537EuLL);
      int v6 = (*v4)(v4, 32, v5);
      if (v6)
      {
        int v7 = v6;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v8 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v17 = v7;
          _os_log_fault_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_FAULT, "Failed to generate random number with error code %d", buf, 8u);
        }
        free(v5);
      }
      else
      {
        id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v12 = objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v10, v11, (uint64_t)v5, 32, 1);
        key = v2->_key;
        v2->_key = (NSData *)v12;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v9 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_FAULT, "Failed to create random number generator", buf, 2u);
      }
    }
  }
  return v2;
}

- (id)encrypt:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!objc_msgSend_length(v4, v5, v6))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v22 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_ERROR, "Trying to encrypt a zero-length data", buf, 2u);
    }
    goto LABEL_21;
  }
  uint64_t v9 = objc_msgSend_length(v4, v7, v8);
  id v10 = v4;
  objc_msgSend_bytes(v10, v11, v12);
  v13 = malloc_type_malloc(v9 + 32, 0x6662B84CuLL);
  if (!v13)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v23 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_FAULT, "Could not malloc bytes to encrypt data", buf, 2u);
    }
    goto LABEL_21;
  }
  v14 = v13;
  objc_super v15 = (uint64_t (**)(void, uint64_t, void *))ccrng();
  if (!v15)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v24 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v19 = "Failed to create random number generator";
    v20 = v24;
    uint32_t v21 = 2;
    goto LABEL_27;
  }
  int v16 = (*v15)(v15, 16, v14);
  if (v16)
  {
    int v17 = v16;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 67109120;
    int v41 = v17;
    v19 = "Failed to generate random number with error code %d";
    v20 = v18;
    uint32_t v21 = 8;
LABEL_27:
    _os_log_fault_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_FAULT, v19, buf, v21);
LABEL_20:
    free(v14);
LABEL_21:
    v25 = 0;
    goto LABEL_22;
  }
  uint64_t v27 = ccaes_gcm_encrypt_mode();
  v39[1] = v39;
  MEMORY[0x1F4188790](v27);
  v30 = objc_msgSend_key(self, v28, v29);
  objc_msgSend_length(v30, v31, v32);
  objc_msgSend_key(self, v33, v34);
  id v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_bytes(v35, v36, v37);
  ccgcm_init();

  ccgcm_set_iv();
  ccgcm_update();
  ccgcm_finalize();
  ccgcm_context_size();
  cc_clear();
  v25 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v38, (uint64_t)v14, v9 + 32, 1);
LABEL_22:

  return v25;
}

- (id)decrypt:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)objc_msgSend_length(v4, v5, v6) <= 0x1F)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v9 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_ERROR, "Trying to decrypt a zero-length data", buf, 2u);
    }
LABEL_17:
    v31 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = objc_msgSend_length(v4, v7, v8);
  id v11 = v4;
  objc_msgSend_bytes(v11, v12, v13);
  uint64_t v14 = v10 - 32;
  objc_super v15 = malloc_type_malloc(v10 - 32, 0x8B4AB1F6uLL);
  if (!v15)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v32 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_FAULT, "Could not malloc bytes to decrypt data", buf, 2u);
    }
    goto LABEL_17;
  }
  int v16 = v15;
  uint64_t v17 = ccaes_gcm_decrypt_mode();
  MEMORY[0x1F4188790](v17);
  v20 = objc_msgSend_key(self, v18, v19);
  objc_msgSend_length(v20, v21, v22);
  objc_msgSend_key(self, v23, v24);
  id v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_bytes(v25, v26, v27);
  ccgcm_init();

  ccgcm_set_iv();
  ccgcm_update();
  ccgcm_finalize();
  int v28 = cc_cmp_safe();
  ccgcm_context_size();
  cc_clear();
  if (v28)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v30 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v34 = 0;
      _os_log_error_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_ERROR, "Tag did not match when decrypting", v34, 2u);
    }
    free(v16);
    v31 = 0;
  }
  else
  {
    v31 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v29, (uint64_t)v16, v14, 1);
  }
LABEL_19:

  return v31;
}

- (NSData)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end