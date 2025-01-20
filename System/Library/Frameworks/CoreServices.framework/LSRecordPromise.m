@interface LSRecordPromise
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (LSRecordPromise)init;
- (LSRecordPromise)initWithCoder:(id)a3;
- (LSRecordPromise)initWithRecord:(id)a3 error:(id *)a4;
- (id)_initWithRecord:(id)a3;
- (id)fulfillReturningError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSRecordPromise

+ (id)new
{
}

- (LSRecordPromise)init
{
}

- (LSRecordPromise)initWithRecord:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LSRecord.mm", 795, @"Invalid parameter not satisfying: %@", @"record != nil" object file lineNumber description];
  }
  os_unfair_recursive_lock_lock_with_options();
  if (*((void *)a3 + 2))
  {
    v7 = [(LSRecordPromise *)self _initWithRecord:a3];
  }
  else
  {
    if (a4)
    {
      uint64_t v12 = *MEMORY[0x1E4F28228];
      v13[0] = @"provided record was not attached";
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[LSRecordPromise initWithRecord:error:]", 800, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v7;
}

- (id)fulfillReturningError:(id *)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v5 = self->_db;
  id v29 = 0;
  v30 = v5;
  v26 = 0;
  id v27 = 0;
  char v28 = 0;
  if (_LSSetLocalDatabaseIfNewer(self->_db))
  {
    v6 = (LaunchServices::Record *)&v30;
  }
  else
  {
    v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "database in LSRecordPromise is out of date. Using current database.", buf, 2u);
    }

    +[_LSDServiceDomain defaultServiceDomain]();
    v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v6 = (LaunchServices::Record *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v8, 0);

    if (!v6)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v18, 0);

      if (!v19)
      {
        id v11 = v29;
        if (a3) {
          goto LABEL_16;
        }
        goto LABEL_18;
      }
      id v11 = 0;
LABEL_15:
      if (a3)
      {
LABEL_16:
        id v11 = v11;
        v13 = 0;
        *a3 = v11;
        goto LABEL_19;
      }
LABEL_18:
      v13 = 0;
      goto LABEL_19;
    }
  }
  pi = self->_pi;
  id v24 = 0;
  v10 = _LSCheckRecordPISizeAndVersionReturningPIInnerBytes(pi, &v24);
  id v11 = v24;
  if (!v10) {
    goto LABEL_15;
  }
  SubclassForTable = (objc_class *)LaunchServices::Record::findSubclassForTable(v6, (LSContext *)*((unsigned int *)v10 + 2));
  if (!SubclassForTable)
  {
    uint64_t v31 = *MEMORY[0x1E4F28228];
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"bogus table %d", *((unsigned int *)v10 + 2));
    v32[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    uint64_t v17 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10810, (uint64_t)"-[LSRecordPromise fulfillReturningError:]", 839, v16);

    id v11 = (id)v17;
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v13 = (void *)[[SubclassForTable alloc] _initWithContext:v6 persistentIdentifier:self->_pi];
  if (!v13)
  {
    uint64_t v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[LSRecordPromise fulfillReturningError:]", 835, 0);

    id v11 = (id)v14;
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
LABEL_19:
  id v20 = v13;
  if (v26 && v28) {
    _LSContextDestroy(v26);
  }
  id v21 = v27;
  v26 = 0;
  id v27 = 0;

  char v28 = 0;
  id v22 = v29;
  id v29 = 0;

  return v20;
}

- (id)_initWithRecord:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)LSRecordPromise;
  v5 = [(LSRecordPromise *)&v14 init];
  if (v5)
  {
    id v6 = a3;
    os_unfair_recursive_lock_lock_with_options();
    v7 = (id *)v6;
    v8 = v7;
    id v9 = v7[2];
    if ((*((unsigned char *)v7 + 31) & 0x40) == 0 && !v9) {
      __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v7, a2);
    }
    if (v9)
    {
      CSStoreGetUnit();
      id v10 = v8[2];
    }
    else
    {
      id v10 = 0;
    }

    os_unfair_recursive_lock_unlock();
    objc_storeStrong((id *)&v5->_db, v10);
    uint64_t v11 = [v8 persistentIdentifier];
    pi = v5->_pi;
    v5->_pi = (NSData *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (LaunchServices::Record::checkForExfiltrationRisk((LaunchServices::Record *)a3, (NSCoder *)a2))
  {
    uint64_t v9 = *MEMORY[0x1E4F28228];
    v10[0] = @"This process may not encode instances of LSRecordPromise. This class is only for use by InstallCoordination.";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v6 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[LSRecordPromise encodeWithCoder:]", 883, v5);
    [a3 failWithError:v6];
  }
  else
  {
    [a3 encodeObject:self->_db->store forKey:@"store"];
    v7 = _LSDatabaseGetNode((uint64_t)self->_db);
    [a3 encodeObject:v7 forKey:@"node"];

    [a3 encodeBool:((unint64_t)_LSDatabaseGetSessionKey((uint64_t)self->_db) >> 32) & 1 forKey:@"systemSession"];
    [a3 encodeInt64:_LSDatabaseGetSessionKey((uint64_t)self->_db) forKey:@"userID"];
    pi = self->_pi;
    [a3 encodeObject:pi forKey:@"persistentIdentifier"];
  }
}

- (LSRecordPromise)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)LSRecordPromise;
  v4 = [(LSRecordPromise *)&v16 init];
  if (!v4) {
    return 0;
  }
  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", _CSStoreGetXPCClass(), @"store");
  v5 = (const void *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"node");
  unsigned int v7 = [a3 decodeInt64ForKey:@"userID"];
  if ([a3 decodeBoolForKey:@"systemSession"]) {
    uint64_t v8 = 0x100000000;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"persistentIdentifier");
  id v10 = (void *)v9;
  if (v5 && v6 && v9)
  {
    id v15 = 0;
    uint64_t v11 = _LSDatabaseCreate(v6, v8 & 0xFFFFFFFF00000000 | v7, v5, &v15);
    id v12 = v15;
    if (v11)
    {
      objc_storeStrong((id *)&v4->_db, v11);
      objc_storeStrong((id *)&v4->_pi, v10);
    }
    else
    {
      [a3 failWithError:v12];

      v4 = 0;
    }

    goto LABEL_15;
  }
  objc_super v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4865, (uint64_t)"-[LSRecordPromise initWithCoder:]", 917, 0);
  [a3 failWithError:v14];

  v4 = 0;
  result = 0;
  if (v5)
  {
LABEL_15:
    CFRelease(v5);
    return v4;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pi, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end