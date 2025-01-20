@interface IMKeyValueCollectionUserDefaultsStorage
- (IMKeyValueCollectionUserDefaultsStorage)init;
- (IMKeyValueCollectionUserDefaultsStorage)initWithDomain:(id)a3;
- (NSString)description;
- (NSString)domain;
- (id)_actuallyReadObjectForKey:(id)a3;
- (id)_decodeData:(id)a3 forKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (id)setWithMutableClassIfApplicableFor:(Class)a3;
- (void)_actuallyWriteObject:(id)a3 forKey:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation IMKeyValueCollectionUserDefaultsStorage

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(IMKeyValueCollectionUserDefaultsStorage *)self _actuallyReadObjectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(IMKeyValueCollectionUserDefaultsStorage *)self _decodeData:v5 forKey:v4];
  }
  else
  {
    id v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (id)_actuallyReadObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(IMKeyValueCollectionUserDefaultsStorage *)self domain];
  id v6 = IMGetCachedDomainValueForKey();

  return v6;
}

- (NSString)domain
{
  return self->_domain;
}

- (IMKeyValueCollectionUserDefaultsStorage)init
{
  return 0;
}

- (IMKeyValueCollectionUserDefaultsStorage)initWithDomain:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMKeyValueCollectionUserDefaultsStorage;
  v5 = [(IMKeyValueCollectionUserDefaultsStorage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;
  }
  return v5;
}

- (id)_decodeData:(id)a3 forKey:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_super v9 = [v7 stringByAppendingString:@"_class"];
  v10 = [(IMKeyValueCollectionUserDefaultsStorage *)self _actuallyReadObjectForKey:v9];

  id v11 = v8;
  if (!v10) {
    goto LABEL_29;
  }
  id v26 = 0;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:&v26];
  id v13 = v26;
  if (objc_opt_respondsToSelector())
  {
    [v12 _enableStrictSecureDecodingMode];
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "strict-decoding 025 _enableStrictSecureDecodingMode called", buf, 2u);
      }
    }
  }
  Class v15 = NSClassFromString(v10);
  if (!v15)
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v10;
        __int16 v29 = 2112;
        id v30 = v7;
        _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "Failed to inflate class of type: %@ for key %@", buf, 0x16u);
      }
    }
    v21 = 0;
    id v11 = v8;
    goto LABEL_31;
  }
  v16 = [(IMKeyValueCollectionUserDefaultsStorage *)self setWithMutableClassIfApplicableFor:v15];
  uint64_t v17 = *MEMORY[0x1E4F284E8];
  id v25 = 0;
  id v11 = [v12 decodeTopLevelObjectOfClasses:v16 forKey:v17 error:&v25];
  id v18 = v25;

  if (v13)
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = (NSString *)v13;
        _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Failed to unarchive data. Error: %@", buf, 0xCu);
      }
LABEL_26:
    }
  }
  else
  {
    if (!v18)
    {
      char v23 = 1;
      goto LABEL_28;
    }
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v28 = v10;
        __int16 v29 = 2112;
        id v30 = v7;
        __int16 v31 = 2112;
        id v32 = v18;
        _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "decodeTopLevelObjectOfClasses object of type: %@ for key %@ failed with error: %@", buf, 0x20u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "strict-decoding 025 _enableStrictSecureDecodingMode called", buf, 2u);
      }
      goto LABEL_26;
    }
  }
  char v23 = 0;
LABEL_28:

  if (v23)
  {
LABEL_29:
    id v11 = v11;
    v21 = v11;
    goto LABEL_31;
  }
  v21 = 0;
LABEL_31:

  return v21;
}

- (void)_actuallyWriteObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMKeyValueCollectionUserDefaultsStorage *)self domain];
  IMSetDomainValueForKey();
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = v17;
  id v8 = v6;
  if (v17 && (int v9 = objc_msgSend(v17, "isArchivable_im"), v7 = v17, !v9))
  {
    v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v17 requiringSecureCoding:0 error:0];
    if (!v10) {
      goto LABEL_7;
    }
    v14 = (objc_class *)objc_opt_class();
    Class v15 = NSStringFromClass(v14);
    v16 = [v8 stringByAppendingString:@"_class"];
    [(IMKeyValueCollectionUserDefaultsStorage *)self _actuallyWriteObject:v15 forKey:v16];

    id v11 = self;
    v12 = v10;
    id v13 = v8;
  }
  else
  {
    [(IMKeyValueCollectionUserDefaultsStorage *)self _actuallyWriteObject:v7 forKey:v8];
    v10 = [v8 stringByAppendingString:@"_class"];
    id v11 = self;
    v12 = 0;
    id v13 = v10;
  }
  [(IMKeyValueCollectionUserDefaultsStorage *)v11 _actuallyWriteObject:v12 forKey:v13];
LABEL_7:
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_alloc((Class)objc_opt_class());

  return (id)MEMORY[0x1F4181798](v3, sel_initWithDomain_);
}

- (NSString)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)IMKeyValueCollectionUserDefaultsStorage;
  id v4 = [(IMKeyValueCollectionUserDefaultsStorage *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ domain:%@]", v4, self->_domain];

  return (NSString *)v5;
}

- (id)setWithMutableClassIfApplicableFor:(Class)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = 0;
    id v6 = v4;
    Class v7 = (Class)v5;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    if (isKindOfClass)
    {
      a3 = (Class)objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v6 = v11;
    Class v7 = a3;
  }
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, v12, v13);

  return v8;
}

- (void).cxx_destruct
{
}

@end