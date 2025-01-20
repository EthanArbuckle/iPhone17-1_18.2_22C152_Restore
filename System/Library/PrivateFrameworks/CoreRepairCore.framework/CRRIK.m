@interface CRRIK
- (BOOL)create;
- (BOOL)createWithKeyBlob:(id)a3;
- (BOOL)verify:(id)a3 signature:(id)a4;
- (CRRIK)init;
- (CRRIK)initWithKeyBlob:(id)a3;
- (aks_ref_key_s)rk;
- (id)attestationBlob;
- (id)keyBlob;
- (id)pubKeyBlob;
- (id)sign:(id)a3;
- (void)dealloc;
- (void)purge;
- (void)setRk:(aks_ref_key_s *)a3;
@end

@implementation CRRIK

- (CRRIK)init
{
  v9.receiver = self;
  v9.super_class = (Class)CRRIK;
  v2 = [(CRRIK *)&v9 init];
  v6 = v2;
  if (v2 && !objc_msgSend_create(v2, v3, v4, v5)) {
    v7 = 0;
  }
  else {
    v7 = v6;
  }

  return v7;
}

- (CRRIK)initWithKeyBlob:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRRIK;
  uint64_t v5 = [(CRRIK *)&v11 init];
  v8 = v5;
  if (v5 && !objc_msgSend_createWithKeyBlob_(v5, v6, (uint64_t)v4, v7)) {
    objc_super v9 = 0;
  }
  else {
    objc_super v9 = v8;
  }

  return v9;
}

- (id)keyBlob
{
  uint64_t v5 = objc_msgSend_rk(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = 0;
    objc_super v9 = (uint64_t *)objc_msgSend_rk(self, v6, v7, v8);
    uint64_t v11 = sub_21FC54B74(v9, &v13);
    uint64_t v5 = 0;
    if (v11)
    {
      if (v13)
      {
        uint64_t v5 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v10, v11, v13);
      }
    }
  }
  return v5;
}

- (id)pubKeyBlob
{
  uint64_t v5 = objc_msgSend_rk(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = 0;
    objc_super v9 = objc_msgSend_rk(self, v6, v7, v8);
    uint64_t v11 = sub_21FC5499C(v9, &v13);
    uint64_t v5 = 0;
    if (v11)
    {
      if (v13)
      {
        uint64_t v5 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v10, v11, v13);
      }
    }
  }
  return v5;
}

- (id)attestationBlob
{
  if (!objc_msgSend_rk(self, a2, v2, v3))
  {
    v12 = 0;
    goto LABEL_12;
  }
  uint64_t v15 = 0;
  v16 = 0;
  uint64_t v8 = (uint64_t *)objc_msgSend_rk(self, v5, v6, v7);
  if (!sub_21FC54B80(v8, 0, 0, (uint64_t)&v16, (uint64_t)&v15) && v16 && v15)
  {
    uint64_t v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v9, (uint64_t)v16, v15);
    uint64_t v11 = v16;
    v12 = (void *)v10;
    if (!v16) {
      goto LABEL_12;
    }
LABEL_11:
    free(v11);
    v12 = (void *)v10;
    goto LABEL_12;
  }
  uint64_t v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_21FC5C9E4();
  }

  uint64_t v10 = 0;
  v12 = 0;
  uint64_t v11 = v16;
  if (v16) {
    goto LABEL_11;
  }
LABEL_12:
  return v12;
}

- (id)sign:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_rk(self, v5, v6, v7);
  if (v4 && v8)
  {
    v12 = (uint64_t *)objc_msgSend_rk(self, v9, v10, v11);
    id v13 = v4;
    uint64_t v17 = objc_msgSend_bytes(v13, v14, v15, v16);
    objc_msgSend_length(v13, v18, v19, v20);
    sub_21FC545A8(v12, 0, 0, v17);
    v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CA4C();
    }
  }
  return 0;
}

- (BOOL)verify:(id)a3 signature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_rk(self, v8, v9, v10);
  BOOL v15 = 0;
  if (v7 && v6 && v11)
  {
    uint64_t v16 = objc_msgSend_rk(self, v12, v13, v14);
    id v17 = v6;
    uint64_t v21 = objc_msgSend_bytes(v17, v18, v19, v20);
    uint64_t v25 = objc_msgSend_length(v17, v22, v23, v24);
    id v26 = v7;
    uint64_t v30 = objc_msgSend_bytes(v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_length(v26, v31, v32, v33);
    if (sub_21FC5472C(v16, 0, 0, v21, v25, v30, v34))
    {
      v35 = handleForCategory(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_21FC5CAEC();
      }

      BOOL v15 = 0;
    }
    else
    {
      BOOL v15 = 1;
    }
  }

  return v15;
}

- (void)dealloc
{
  objc_msgSend_purge(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CRRIK;
  [(CRRIK *)&v5 dealloc];
}

- (BOOL)create
{
  uint64_t v32 = 1;
  uint64_t v33 = 0;
  uint64_t v30 = 0;
  v31 = 0;
  uint64_t v29 = 0;
  uint64_t v3 = (void *)MGCopyAnswer();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CB54(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_12;
  }
  if (objc_msgSend_BOOLValue(v3, v4, v5, v6)) {
    unsigned int v7 = 5;
  }
  else {
    unsigned int v7 = 4;
  }
  uint64_t v8 = (void **)sub_21FC53B04(0);
  v31 = v8;
  if (!v8)
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CB8C(v11, v21, v22, v23, v24, v25, v26, v27);
    }
LABEL_12:

    BOOL v19 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = v8;
  if (sub_21FC53D78(v8, 9, &v32))
  {
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CC94();
    }
  }
  else if (sub_21FC53DF0(v9, &v30, (size_t *)&v29))
  {
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CC2C();
    }
  }
  else
  {
    if (!sub_21FC53E58(-1, 13, v7, (uint64_t)v30, v29, (void ***)&v33))
    {
      self->_rk = v33;
      uint64_t v33 = 0;
      uint64_t v10 = handleForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, "RIK created successfully", v28, 2u);
      }
      BOOL v19 = 1;
      goto LABEL_27;
    }
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CBC4();
    }
  }
  BOOL v19 = 0;
LABEL_27:

  sub_21FC53DF4(&v31);
LABEL_13:
  if (v30) {
    free(v30);
  }
  if (v33) {
    sub_21FC54088((uint64_t *)&v33);
  }

  return v19;
}

- (BOOL)createWithKeyBlob:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v20 = 0;
  if (v4)
  {
    id v6 = v4;
    uint64_t v10 = (const void *)objc_msgSend_bytes(v6, v7, v8, v9);
    size_t v14 = objc_msgSend_length(v6, v11, v12, v13);
    int v15 = sub_21FC5413C(-1, v10, v14, (uint64_t *)&v20);
    BOOL v16 = v15 == 0;
    if (v15)
    {
      uint64_t v17 = handleForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_21FC5CCFC();
      }
    }
    else
    {
      self->_rk = v20;
      uint64_t v20 = 0;
      uint64_t v17 = handleForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v19 = 0;
        _os_log_impl(&dword_21FBF2000, v17, OS_LOG_TYPE_DEFAULT, "RIK created successfully", v19, 2u);
      }
    }

    if (v20) {
      sub_21FC54088((uint64_t *)&v20);
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)purge
{
  if (objc_msgSend_rk(self, a2, v2, v3))
  {
    sub_21FC54088((uint64_t *)&self->_rk);
    MEMORY[0x270F9A6D0](self, sel_setRk_, 0, v5);
  }
}

- (aks_ref_key_s)rk
{
  return self->_rk;
}

- (void)setRk:(aks_ref_key_s *)a3
{
  self->_rk = a3;
}

@end