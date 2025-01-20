@interface BRCGenerationID
+ (BOOL)supportsSecureCoding;
+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4;
+ (id)newFromSqliteValue:(sqlite3_value *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFSGenerationID:(unsigned int)a3;
- (BOOL)isEqualToGenerationID:(id)a3 orSignature:(id)a4;
- (BRCGenerationID)initWithCoder:(id)a3;
- (BRCGenerationID)initWithFSGenerationID:(unsigned int)a3;
- (BRCGenerationID)initWithRelativePath:(id)a3;
- (BRCGenerationID)initWithSignature:(const void *)a3 length:(unint64_t)a4;
- (NSData)signature;
- (NSNumber)fsGenerationID;
- (NSString)generationIDString;
- (const)UTF8String;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
@end

@implementation BRCGenerationID

- (NSNumber)fsGenerationID
{
  if (self->_generationID)
  {
    v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  }
  else
  {
    v2 = 0;
  }
  return (NSNumber *)v2;
}

- (NSString)generationIDString
{
  if (self->_generationID)
  {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%u", self->_generationID);
  }
  else
  {
    signature = self->_signature;
    if (signature)
    {
      objc_msgSend(NSString, "brc_hexadecimalStringWithBytes:length:", -[NSData bytes](signature, "bytes"), -[NSData length](self->_signature, "length"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = @"<undef>";
    }
  }
  return (NSString *)v3;
}

- (const)UTF8String
{
  id v2 = [(BRCGenerationID *)self generationIDString];
  v3 = (const char *)[v2 UTF8String];

  return v3;
}

- (BRCGenerationID)initWithSignature:(const void *)a3 length:(unint64_t)a4
{
  v4 = (BRCGenerationID *)a4;
  if (a4)
  {
    v10.receiver = self;
    v10.super_class = (Class)BRCGenerationID;
    v6 = [(BRCGenerationID *)&v10 init];
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:v4];
      signature = v6->_signature;
      v6->_signature = (NSData *)v7;
    }
    self = v6;
    v4 = self;
  }

  return v4;
}

- (BRCGenerationID)initWithFSGenerationID:(unsigned int)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCGenerationID;
    v4 = [(BRCGenerationID *)&v7 init];
    if (v4) {
      v4->_generationID = a3;
    }
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BRCGenerationID)initWithRelativePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fsGenerationID];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__53;
  v23 = __Block_byref_object_dispose__53;
  id v24 = 0;
  if (v5)
  {
    self = [(BRCGenerationID *)self initWithFSGenerationID:v5];
    v6 = self;
  }
  else if ([v4 isSymLink])
  {
    v6 = 0;
  }
  else
  {
    objc_super v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(BRCGenerationID *)(uint64_t)v4 initWithRelativePath:v8];
    }

    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __40__BRCGenerationID_initWithRelativePath___block_invoke;
    v16 = &unk_1E699B790;
    v18 = &v19;
    id v17 = v4;
    [v17 performOnOpenFileDescriptor:&v13 error:0];
    v9 = (void *)v20[5];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = objc_msgSend(v10, "bytes", v13, v14, v15, v16);
      self = -[BRCGenerationID initWithSignature:length:](self, "initWithSignature:length:", v11, [(id)v20[5] length]);
      v6 = self;
    }
    else
    {
      v6 = 0;
    }
  }
  _Block_object_dispose(&v19, 8);

  return v6;
}

uint64_t __40__BRCGenerationID_initWithRelativePath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1A3B8] signatureWithFileDescriptor:a2 error:&v12];
  id v4 = v12;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v7 = 0;
  }
  else
  {
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Checksumming failed at %@: %@%@", buf, 0x20u);
    }

    uint64_t v7 = 0xFFFFFFFFLL;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t generationID = self->_generationID;
  id v5 = a3;
  [v5 encodeInt32:generationID forKey:@"g"];
  [v5 encodeObject:self->_signature forKey:@"s"];
}

- (BRCGenerationID)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCGenerationID;
  id v5 = [(BRCGenerationID *)&v9 init];
  if (v5)
  {
    v5->_uint64_t generationID = [v4 decodeInt32ForKey:@"g"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v6;
  }
  return v5;
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  int v5 = sqlite3_value_type(a3);
  id v6 = objc_alloc((Class)a1);
  if (v5 == 4)
  {
    uint64_t v7 = sqlite3_value_blob(a3);
    uint64_t v8 = sqlite3_value_bytes(a3);
    return (id)[v6 initWithSignature:v7 length:v8];
  }
  else
  {
    sqlite3_int64 v10 = sqlite3_value_int64(a3);
    return (id)[v6 initWithFSGenerationID:v10];
  }
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  int v7 = sqlite3_column_type(a3, a4);
  id v8 = objc_alloc((Class)a1);
  if (v7 == 4)
  {
    objc_super v9 = sqlite3_column_blob(a3, a4);
    uint64_t v10 = sqlite3_column_bytes(a3, a4);
    return (id)[v8 initWithSignature:v9 length:v10];
  }
  else
  {
    sqlite3_int64 v12 = sqlite3_column_int64(a3, a4);
    return (id)[v8 initWithFSGenerationID:v12];
  }
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  sqlite3_int64 generationID = self->_generationID;
  if (generationID)
  {
    sqlite3_bind_int64(a3, a4, generationID);
  }
  else
  {
    signature = self->_signature;
    if (signature)
    {
      objc_super v9 = [(NSData *)signature bytes];
      int v10 = [(NSData *)self->_signature length];
      sqlite3_bind_blob(a3, a4, v9, v10, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      sqlite3_bind_null(a3, a4);
    }
  }
}

- (unint64_t)hash
{
  return self->_generationID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(BRCGenerationID *)self isEqualToGenerationID:v4 orSignature:0];

  return v5;
}

- (BOOL)isEqualToGenerationID:(id)a3 orSignature:(id)a4
{
  id v6 = (id *)a3;
  id v7 = a4;
  unsigned int generationID = self->_generationID;
  if (!generationID)
  {
    signature = self->_signature;
    if (signature)
    {
      if (v6)
      {
        if (objc_msgSend(v6[2], "isEqualToData:"))
        {
          char v9 = 1;
          goto LABEL_11;
        }
        signature = self->_signature;
      }
      char v9 = [v7 isEqualToData:signature];
      goto LABEL_11;
    }
LABEL_8:
    char v9 = 0;
    goto LABEL_11;
  }
  if (!v6) {
    goto LABEL_8;
  }
  char v9 = generationID == *((_DWORD *)v6 + 2);
LABEL_11:

  return v9;
}

- (BOOL)isEqualToFSGenerationID:(unsigned int)a3
{
  unsigned int generationID = self->_generationID;
  return generationID && generationID == a3;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
}

- (void)initWithRelativePath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Checksumming R/W mmaped file at %@%@", (uint8_t *)&v3, 0x16u);
}

@end