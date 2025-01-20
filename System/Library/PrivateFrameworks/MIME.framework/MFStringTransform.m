@interface MFStringTransform
+ (id)identityTransform;
- (MFStringTransform)init;
- (MFStringTransform)initWithSoftBankHexData:(id)a3;
- (id)_init;
- (void)dealloc;
@end

@implementation MFStringTransform

- (MFStringTransform)init
{
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MFStringTransform;
  return [(MFStringTransform *)&v3 init];
}

- (MFStringTransform)initWithSoftBankHexData:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MFStringTransform;
  v5 = [(MFStringTransform *)&v27 init];
  if (!v5) {
    goto LABEL_37;
  }
  id v6 = v4;
  v7 = (void *)MEMORY[0x1B3E87F20]();
  if (!v6)
  {
    id v12 = 0;
    goto LABEL_16;
  }
  *(void *)v29 = 0;
  v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:v29];
  id v9 = *(id *)v29;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = [v8 count];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v11;
        _os_log_impl(&dword_1AFB03000, v10, OS_LOG_TYPE_INFO, "MFStringTransform: Found %u hex values.", buf, 8u);
      }

      id v12 = v8;
      goto LABEL_15;
    }
    v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      [(MFStringTransform *)v14 initWithSoftBankHexData:v13];
    }
  }
  else
  {
    v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MFStringTransform initWithSoftBankHexData:]((uint64_t)v9, v13);
    }
  }

  id v12 = 0;
LABEL_15:

LABEL_16:

  id v15 = v12;
  v16 = (void *)MEMORY[0x1B3E87F20]();
  if (!v15)
  {
    v18 = 0;
    goto LABEL_33;
  }
  if ([v15 count])
  {
    if ((unint64_t)[v15 count] < 0x186A1)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", 20 * objc_msgSend(v15, "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      *(_OWORD *)buf = 0u;
      long long v35 = 0u;
      v17 = v15;
      uint64_t v19 = [v17 countByEnumeratingWithState:buf objects:v29 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v17);
            }
            [v18 appendFormat:@"\\u%@ > \\ufffd; ", *(void *)(*(void *)&buf[8] + 8 * i)];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:buf objects:v29 count:16];
        }
        while (v19);
      }
      goto LABEL_32;
    }
    v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MFStringTransform initWithSoftBankHexData:]();
    }
  }
  else
  {
    v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1AFB03000, v17, OS_LOG_TYPE_INFO, "MFStringTransform: Empty hex values found.", v29, 2u);
    }
  }
  v18 = 0;
LABEL_32:

LABEL_33:

  id v22 = v18;
  v23 = (void *)MEMORY[0x1B3E87F20]();
  if (v22)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&long long v35 = 0x2020000000;
    *((void *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(void *)v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __createTransliterator_block_invoke;
    v32 = &unk_1E5F89B50;
    v33 = buf;
    withMutableCharacters(v22, v29);
    v24 = *(void ***)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v24 = 0;
  }

  v5->_underlying = v24;
  if (!v5->_underlying)
  {
    v25 = 0;
    goto LABEL_39;
  }
LABEL_37:
  v25 = v5;
LABEL_39:

  return v25;
}

- (void)dealloc
{
  if (self->_underlying)
  {
    utrans_close();
    self->_underlying = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)MFStringTransform;
  [(MFStringTransform *)&v3 dealloc];
}

+ (id)identityTransform
{
  id v2 = [[MFStringTransform alloc] _init];
  return v2;
}

- (void)initWithSoftBankHexData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AFB03000, v0, v1, "MFStringTransform: Number of hex values out of bounds.", v2, v3, v4, v5, v6);
}

- (void)initWithSoftBankHexData:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB03000, a2, OS_LOG_TYPE_ERROR, "MFStringTransform: Unable to parse hex values data: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithSoftBankHexData:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v5 = a1;
  _os_log_error_impl(&dword_1AFB03000, a3, OS_LOG_TYPE_ERROR, "MFStringTransform: hex values of unexpected type '%{public}@'.", (uint8_t *)a2, 0xCu);
}

@end