@interface FPGSStorageManager
- (FPGSStorageManager)init;
- (id)permanentStorageForItemAtURL:(id)a3 allocateIfNone:(BOOL)a4 error:(id *)a5;
- (id)permanentStorageForItemWithDocID:(unsigned int)a3 deviceID:(int)a4 allocateIfNone:(BOOL)a5 error:(id *)a6;
@end

@implementation FPGSStorageManager

- (FPGSStorageManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FPGSStorageManager;
  v2 = [(FPGSStorageManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    gs = v2->_gs;
    v2->_gs = (GSStorageManager *)v3;
  }
  return v2;
}

- (id)permanentStorageForItemAtURL:(id)a3 allocateIfNone:(BOOL)a4 error:(id *)a5
{
  gs = self->_gs;
  id v13 = 0;
  v7 = [(GSStorageManager *)gs permanentStorageForItemAtURL:a3 allocateIfNone:a4 error:&v13];
  id v8 = v13;
  v9 = v8;
  if (v7)
  {
    id v10 = v7;
  }
  else if (a5)
  {
    if (v8)
    {
      *a5 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", 22);
      id v12 = objc_claimAutoreleasedReturnValue();
      *a5 = v12;
    }
  }

  return v7;
}

- (id)permanentStorageForItemWithDocID:(unsigned int)a3 deviceID:(int)a4 allocateIfNone:(BOOL)a5 error:(id *)a6
{
  gs = self->_gs;
  id v14 = 0;
  id v8 = [(GSStorageManager *)gs permanentStorageForItemWithDocID:*(void *)&a3 deviceID:*(void *)&a4 allocateIfNone:a5 error:&v14];
  id v9 = v14;
  id v10 = v9;
  if (v8)
  {
    id v11 = v8;
  }
  else if (a6)
  {
    if (v9)
    {
      *a6 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", 22);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a6 = v13;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end