@interface NSPersistentHTTPCookie2Storage
- (NSPersistentHTTPCookie2Storage)init;
- (NSPersistentHTTPCookie2Storage)initWithPath:(id)a3;
- (NSURL)path;
- (char)initWithPath:(void *)a3 andFileName:;
- (id)getAllCookies;
- (id)getCookiesWithFilter:(id)a3;
- (void)beginTransaction;
- (void)commitTransaction;
- (void)deleteAllCookies;
- (void)deleteCookie:(id)a3;
- (void)deleteCookies:(id)a3;
- (void)deleteCookiesWithFilter:(id)a3;
- (void)setCookie:(id)a3;
- (void)setCookies:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation NSPersistentHTTPCookie2Storage

- (void).cxx_destruct
{
}

- (void)setPath:(id)a3
{
}

- (NSURL)path
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)commitTransaction
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  errmsg = 0;
  if (sqlite3_exec(self->persistentDb, "COMMIT TRANSACTION", 0, 0, &errmsg))
  {
    v2 = getCookieLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v5 = errmsg;
      _os_log_error_impl(&dword_184085000, v2, OS_LOG_TYPE_ERROR, "Error commmitting SQL transaction %s", buf, 0xCu);
    }
  }
}

- (void)beginTransaction
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  errmsg = 0;
  if (sqlite3_exec(self->persistentDb, "BEGIN TRANSACTION", 0, 0, &errmsg))
  {
    v2 = getCookieLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v5 = errmsg;
      _os_log_error_impl(&dword_184085000, v2, OS_LOG_TYPE_ERROR, "Error begining SQL transaction %s", buf, 0xCu);
    }
  }
}

- (void)setCookies:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->insertCookiesStmt) {
    goto LABEL_64;
  }
  id v50 = v4;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v5 = (id)[v4 copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
  v8 = v5;
  if (!v6) {
    goto LABEL_63;
  }
  uint64_t v51 = *(void *)v53;
  *(void *)&long long v7 = 138412290;
  long long v49 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v53 != v51) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      insertCookiesStmt = self->insertCookiesStmt;
      objc_msgSend(v10, "name", v49);
      id v12 = objc_claimAutoreleasedReturnValue();
      v13 = (const char *)[v12 UTF8String];
      v14 = [v10 name];
      BOOL v15 = sqlite3_bind_text(insertCookiesStmt, 1, v13, [v14 length], 0) == 0;

      if (!v15)
      {
        v25 = getCookieLogHandle();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_61;
        }
        *(_WORD *)buf = 0;
        v45 = "Failed to bind cookie name";
LABEL_36:
        _os_log_error_impl(&dword_184085000, v25, OS_LOG_TYPE_ERROR, v45, buf, 2u);
        goto LABEL_61;
      }
      v16 = self->insertCookiesStmt;
      id v17 = [v10 value];
      v18 = (const char *)[v17 UTF8String];
      v19 = [v10 value];
      BOOL v20 = sqlite3_bind_text(v16, 2, v18, [v19 length], 0) == 0;

      if (!v20)
      {
        v25 = getCookieLogHandle();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_61;
        }
        *(_WORD *)buf = 0;
        v45 = "Failed to bind cookie value";
        goto LABEL_36;
      }
      v21 = [v10 domain];
      if ([v21 hasPrefix:@"."])
      {
        v22 = [v10 domain];
      }
      else
      {
        v23 = [v10 domain];
        v22 = [@"." stringByAppendingString:v23];
      }
      v24 = self->insertCookiesStmt;
      v25 = v22;
      if (sqlite3_bind_text(v24, 3, (const char *)[v25 UTF8String], [v25 length], 0))
      {
        v33 = getCookieLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v46 = "Failed to bind cookie domain";
LABEL_41:
          _os_log_error_impl(&dword_184085000, v33, OS_LOG_TYPE_ERROR, v46, buf, 2u);
        }
LABEL_60:

LABEL_61:
        v8 = getCookieLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_184085000, v8, OS_LOG_TYPE_ERROR, "Failed to set cookies", buf, 2u);
        }
        goto LABEL_63;
      }
      v26 = self->insertCookiesStmt;
      id v27 = [v10 path];
      v28 = (const char *)[v27 UTF8String];
      v29 = [v10 path];
      LOBYTE(v28) = sqlite3_bind_text(v26, 4, v28, [v29 length], 0) == 0;

      if ((v28 & 1) == 0)
      {
        v33 = getCookieLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v46 = "Failed to bind cookie path";
          goto LABEL_41;
        }
        goto LABEL_60;
      }
      v30 = [v10 partition];
      if (v30)
      {
        v31 = [v10 partition];
      }
      else
      {
        v31 = @"none";
      }

      v32 = self->insertCookiesStmt;
      v33 = v31;
      if (sqlite3_bind_text(v32, 5, (const char *)[v33 UTF8String], [v33 length], 0))
      {
        v47 = getCookieLogHandle();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_59;
        }
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie partition";
LABEL_58:
        _os_log_error_impl(&dword_184085000, v47, OS_LOG_TYPE_ERROR, v48, buf, 2u);
        goto LABEL_59;
      }
      if (sqlite3_bind_int(self->insertCookiesStmt, 6, [v10 secure]))
      {
        v47 = getCookieLogHandle();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_59;
        }
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie secure flag";
        goto LABEL_58;
      }
      if (sqlite3_bind_int(self->insertCookiesStmt, 7, [v10 hostOnly]))
      {
        v47 = getCookieLogHandle();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_59;
        }
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie host only flag";
        goto LABEL_58;
      }
      if (sqlite3_bind_int(self->insertCookiesStmt, 8, [v10 httpOnly]))
      {
        v47 = getCookieLogHandle();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_59;
        }
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie HTTPOnly flag";
        goto LABEL_58;
      }
      if (sqlite3_bind_int(self->insertCookiesStmt, 9, [v10 sameSite]))
      {
        v47 = getCookieLogHandle();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_59;
        }
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie sameSite";
        goto LABEL_58;
      }
      v34 = [v10 creationDate];
      [v34 timeIntervalSince1970];
      double v36 = v35;

      if (sqlite3_bind_int64(self->insertCookiesStmt, 10, vcvtmd_u64_f64(v36)))
      {
        v47 = getCookieLogHandle();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_59;
        }
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie expiration";
        goto LABEL_58;
      }
      v37 = [v10 expirationDate];
      [v37 timeIntervalSince1970];
      double v39 = v38;

      if (sqlite3_bind_int64(self->insertCookiesStmt, 11, vcvtmd_u64_f64(v39)))
      {
        v47 = getCookieLogHandle();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_59;
        }
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie expiration";
        goto LABEL_58;
      }
      v40 = [MEMORY[0x1E4F1C9C8] date];
      [v40 timeIntervalSince1970];
      double v42 = v41;

      if (sqlite3_bind_int64(self->insertCookiesStmt, 12, vcvtmd_u64_f64(v42)))
      {
        v47 = getCookieLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v48 = "Failed to bind cookie last access time";
          goto LABEL_58;
        }
LABEL_59:

        goto LABEL_60;
      }
      if (sqlite3_step(self->insertCookiesStmt) != 101)
      {
        v43 = getCookieLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = [v10 name];
          *(_DWORD *)buf = v49;
          v57 = v44;
          _os_log_error_impl(&dword_184085000, v43, OS_LOG_TYPE_ERROR, "Failed to insert cookie %@ into db", buf, 0xCu);
        }
      }
      sqlite3_reset(self->insertCookiesStmt);
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v6) {
      continue;
    }
    break;
  }
  v8 = v5;
LABEL_63:

  id v4 = v50;
LABEL_64:
}

- (void)setCookie:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(NSPersistentHTTPCookie2Storage *)self setCookies:v5];
}

- (id)getCookiesWithFilter:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v13 = 0;
    goto LABEL_36;
  }
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [v4 domain];

  if (v5)
  {
    uint64_t v6 = [v4 domain];
    long long v7 = +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]((uint64_t)NSHTTPCookieStorageUtils, v6);

    v8 = [@"%" stringByAppendingString:v7];
    selectDomainCookiesStmt = self->selectDomainCookiesStmt;
    id v10 = v8;
    if (sqlite3_bind_text(selectDomainCookiesStmt, 1, (const char *)[v10 UTF8String], objc_msgSend(v10, "length"), 0))
    {
      v11 = getCookieLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v10;
        _os_log_error_impl(&dword_184085000, v11, OS_LOG_TYPE_ERROR, "Failed to bind cookie domain (%@) to the select statement", buf, 0xCu);
      }
    }
    selectAllCookiesStmt = self->selectDomainCookiesStmt;

    if (!selectAllCookiesStmt) {
      goto LABEL_20;
    }
    goto LABEL_11;
  }
  selectAllCookiesStmt = self->selectAllCookiesStmt;
  if (selectAllCookiesStmt)
  {
LABEL_11:
    while (sqlite3_step(selectAllCookiesStmt) == 100)
    {
      if (self)
      {
        v14 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(selectAllCookiesStmt, 0));
        BOOL v15 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(selectAllCookiesStmt, 1));
        v16 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(selectAllCookiesStmt, 2));
        id v17 = [[NSMutableHTTPCookie2 alloc] initWithName:v14 value:v15 domain:v16];
        v18 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(selectAllCookiesStmt, 3));
        [(NSMutableHTTPCookie2 *)v17 setPath:v18];

        v19 = sqlite3_column_text(selectAllCookiesStmt, 4);
        if (!strcmp((const char *)v19, "none"))
        {
          [(NSMutableHTTPCookie2 *)v17 setPartition:@"none"];
        }
        else
        {
          BOOL v20 = [NSString stringWithUTF8String:v19];
          [(NSMutableHTTPCookie2 *)v17 setPartition:v20];
        }
        [(NSMutableHTTPCookie2 *)v17 setSecure:sqlite3_column_int(selectAllCookiesStmt, 5) != 0];
        [(NSMutableHTTPCookie2 *)v17 setHostOnly:sqlite3_column_int(selectAllCookiesStmt, 6) != 0];
        [(NSMutableHTTPCookie2 *)v17 setHttpOnly:sqlite3_column_int(selectAllCookiesStmt, 7) != 0];
        [(NSMutableHTTPCookie2 *)v17 setSameSite:sqlite3_column_int(selectAllCookiesStmt, 8)];
        v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(selectAllCookiesStmt, 9));
        [(NSMutableHTTPCookie2 *)v17 _setCreationDate:v21];

        v22 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(selectAllCookiesStmt, 10));
        [(NSMutableHTTPCookie2 *)v17 setExpirationDate:v22];

        v23 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(selectAllCookiesStmt, 11));
        [(NSMutableHTTPCookie2 *)v17 _setLastAccessTime:v23];
      }
      else
      {
        id v17 = 0;
      }
      [v33 addObject:v17];
    }
    sqlite3_reset(selectAllCookiesStmt);
  }
LABEL_20:
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 _flags])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v24 = v33;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v25)
    {
      uint64_t v27 = *(void *)v35;
      *(void *)&long long v26 = 138412290;
      long long v32 = v26;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v4, "matchCookie:", v29, v32))
          {
            [v13 addObject:v29];
          }
          else
          {
            v30 = getCookieLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v32;
              id v40 = v29;
              _os_log_debug_impl(&dword_184085000, v30, OS_LOG_TYPE_DEBUG, "[PersistentCookieStore]: Cookie dropped since filters don't match. Cookie = %@", buf, 0xCu);
            }
          }
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v25);
    }
  }
  else
  {
    id v24 = v13;
    id v13 = v33;
  }

LABEL_36:

  return v13;
}

- (id)getAllCookies
{
  v3 = objc_alloc_init(NSHTTPCookie2LookupFilter);
  id v4 = [(NSPersistentHTTPCookie2Storage *)self getCookiesWithFilter:v3];

  return v4;
}

- (void)deleteCookiesWithFilter:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSPersistentHTTPCookie2Storage *)self getCookiesWithFilter:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v4, "matchCookie:", v9, (void)v10)) {
          [(NSPersistentHTTPCookie2Storage *)self deleteCookie:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)deleteCookies:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[NSPersistentHTTPCookie2Storage deleteCookie:](self, "deleteCookie:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)deleteCookie:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  deleteCookiesStmt = self->deleteCookiesStmt;
  id v6 = [v4 name];
  uint64_t v7 = (const char *)[v6 UTF8String];
  long long v8 = [v4 name];
  int v9 = sqlite3_bind_text(deleteCookiesStmt, 1, v7, [v8 length], 0);

  if (v9)
  {
    long long v10 = getCookieLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v29 = 67109120;
      LODWORD(v30) = v9;
      _os_log_error_impl(&dword_184085000, v10, OS_LOG_TYPE_ERROR, "Failed to bind cookie name to the deleteStmt. r = %d", (uint8_t *)&v29, 8u);
    }
  }
  long long v11 = self->deleteCookiesStmt;
  id v12 = [v4 domain];
  uint64_t v13 = (const char *)[v12 UTF8String];
  v14 = [v4 domain];
  LOBYTE(v11) = sqlite3_bind_text(v11, 2, v13, [v14 length], 0) == 0;

  if ((v11 & 1) == 0)
  {
    uint64_t v15 = getCookieLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl(&dword_184085000, v15, OS_LOG_TYPE_ERROR, "Failed to bind cookie domain to the deleteStmt", (uint8_t *)&v29, 2u);
    }
  }
  v16 = self->deleteCookiesStmt;
  id v17 = [v4 path];
  v18 = (const char *)[v17 UTF8String];
  v19 = [v4 path];
  LOBYTE(v16) = sqlite3_bind_text(v16, 3, v18, [v19 length], 0) == 0;

  if ((v16 & 1) == 0)
  {
    BOOL v20 = getCookieLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl(&dword_184085000, v20, OS_LOG_TYPE_ERROR, "Failed to bind cookie path to the deleteStmt", (uint8_t *)&v29, 2u);
    }
  }
  uint64_t v21 = [v4 partition];
  v22 = (void *)v21;
  v23 = @"none";
  if (v21) {
    v23 = (__CFString *)v21;
  }
  id v24 = v23;

  uint64_t v25 = self->deleteCookiesStmt;
  long long v26 = v24;
  if (sqlite3_bind_text(v25, 4, (const char *)[(__CFString *)v26 UTF8String], [(__CFString *)v26 length], 0))
  {
    uint64_t v27 = getCookieLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl(&dword_184085000, v27, OS_LOG_TYPE_ERROR, "Failed to bind cookie partition to the deleteStmt", (uint8_t *)&v29, 2u);
    }
  }
  if (sqlite3_step(self->deleteCookiesStmt) != 101)
  {
    v28 = getCookieLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = 138412290;
      id v30 = v4;
      _os_log_error_impl(&dword_184085000, v28, OS_LOG_TYPE_ERROR, "Failed to delete cookie = %@", (uint8_t *)&v29, 0xCu);
    }
  }
  sqlite3_reset(self->deleteCookiesStmt);
}

- (void)deleteAllCookies
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  errmsg = 0;
  int v2 = sqlite3_exec(self->persistentDb, "DELETE FROM cookies;", 0, 0, &errmsg);
  if (v2)
  {
    int v3 = v2;
    id v4 = getCookieLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = v3;
      _os_log_error_impl(&dword_184085000, v4, OS_LOG_TYPE_ERROR, "Failed to delete all cookies. return value = %d", buf, 8u);
    }
  }
}

- (NSPersistentHTTPCookie2Storage)initWithPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 lastPathComponent];
  id v6 = [v5 stringByAppendingPathExtension:@"sqlite"];

  int v7 = [v4 URLByDeletingLastPathComponent];
  uint64_t v8 = -[NSPersistentHTTPCookie2Storage initWithPath:andFileName:]((char *)self, v7, v6);

  return (NSPersistentHTTPCookie2Storage *)v8;
}

- (char)initWithPath:(void *)a3 andFileName:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)NSPersistentHTTPCookie2Storage;
    a1 = (char *)objc_msgSendSuper2(&v24, sel_init);
    if (a1)
    {
      int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v7 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:0];

      [v5 setResourceValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1C630] error:0];
      uint64_t v8 = [v5 URLByAppendingPathComponent:v6 isDirectory:0];
      objc_storeStrong((id *)a1 + 7, v8);
      id v9 = v8;
      long long v10 = getCookieLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_184085000, v10, OS_LOG_TYPE_DEFAULT, "*** Persistant cookie storage at path %@", buf, 0xCu);
      }

      id v11 = v9;
      id v12 = (const char *)[v11 fileSystemRepresentation];
      if (volumeSupportsFileProtection(v12)) {
        int v13 = 3145734;
      }
      else {
        int v13 = 6;
      }
      v14 = (sqlite3 **)(a1 + 8);
      int v15 = sqlite3_open_v2(v12, (sqlite3 **)a1 + 1, v13, 0);
      if (v15)
      {
        v16 = getCookieLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v11;
          _os_log_fault_impl(&dword_184085000, v16, OS_LOG_TYPE_FAULT, "Failed to open sql file. Error = %d. Path of the cookie file = %@", buf, 0x12u);
        }
      }
      else
      {
        *(void *)buf = 0;
        sqlite3_busy_timeout(*v14, 1000);
        if (!sqlite3_exec(*v14, "CREATE TABLE IF NOT EXISTS cookies(       name text NOT NULL,        value text NOT NULL,        domain text NOT NULL,        path text NOT NULL,        partition text NOT NULL,        is_secure int NOT NULL,        is_hostOnly int NOT NULL,        is_httponly int NOT NULL,        same_site int NOT NULL,        creation_time int NOT NULL,        expires_time int NOT NULL,        last_access_time int NOT NULL,        UNIQUE(domain, path, name, partition)       );",
                0,
                0,
                (char **)buf))
        {
          if (sqlite3_prepare(*((sqlite3 **)a1 + 1), "INSERT OR REPLACE INTO cookies(name, value, domain, path, partition,is_secure,     is_hostOnly, is_httpOnly, same_site, creation_time, expires_time, last_access_time)     values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 214, (sqlite3_stmt **)a1 + 2, 0))
          {
            BOOL v20 = getCookieLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)uint64_t v25 = 0;
              _os_log_error_impl(&dword_184085000, v20, OS_LOG_TYPE_ERROR, "Failed to init the insert statement", v25, 2u);
            }
          }
          if (sqlite3_prepare(*((sqlite3 **)a1 + 1), "SELECT * from cookies WHERE domain like ? AND expires_time > strftime('%s','now')", 81, (sqlite3_stmt **)a1 + 3, 0))
          {
            uint64_t v21 = getCookieLogHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)uint64_t v25 = 0;
              _os_log_error_impl(&dword_184085000, v21, OS_LOG_TYPE_ERROR, "Failed to init the selectDomainCookiesStmt statement", v25, 2u);
            }
          }
          if (sqlite3_prepare(*((sqlite3 **)a1 + 1), "SELECT * from cookies", 21, (sqlite3_stmt **)a1 + 4, 0))
          {
            v22 = getCookieLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)uint64_t v25 = 0;
              _os_log_error_impl(&dword_184085000, v22, OS_LOG_TYPE_ERROR, "Failed to init the selectAllCookiesStmt statement", v25, 2u);
            }
          }
          if (sqlite3_prepare(*((sqlite3 **)a1 + 1), "DELETE FROM cookies WHERE name = ? AND domain = ? AND path = ? AND partition = ?", 80, (sqlite3_stmt **)a1 + 5, 0))
          {
            v23 = getCookieLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)uint64_t v25 = 0;
              _os_log_error_impl(&dword_184085000, v23, OS_LOG_TYPE_ERROR, "Failed to init the deleteCookiesStmt statement", v25, 2u);
            }
          }
          v18 = v11;
          goto LABEL_18;
        }
        v16 = getCookieLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v25 = 0;
          _os_log_error_impl(&dword_184085000, v16, OS_LOG_TYPE_ERROR, "Failed to create schema", v25, 2u);
        }
      }

      id v17 = getCookieLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v11;
        _os_log_error_impl(&dword_184085000, v17, OS_LOG_TYPE_ERROR, "Failed to open the schema at %@", buf, 0xCu);
      }

      v18 = a1;
      a1 = 0;
LABEL_18:
    }
  }

  return a1;
}

- (NSPersistentHTTPCookie2Storage)init
{
  v11.receiver = self;
  v11.super_class = (Class)NSPersistentHTTPCookie2Storage;
  int v2 = [(NSPersistentHTTPCookie2Storage *)&v11 init];
  if (v2)
  {
    int v3 = [MEMORY[0x1E4F28B50] mainBundle];
    id v4 = [v3 bundleIdentifier];

    if (!v4)
    {
      id v4 = [NSString stringWithCString:*(void *)_CFGetProgname() encoding:4];
    }
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [v5 URLsForDirectory:5 inDomains:1];
    int v7 = [v6 firstObject];
    uint64_t v8 = [v7 URLByAppendingPathComponent:@"HTTPStorages" isDirectory:1];
    id v9 = [v8 URLByAppendingPathComponent:v4 isDirectory:1];

    int v2 = -[NSPersistentHTTPCookie2Storage initWithPath:andFileName:]((char *)v2, v9, @"httpstorages.sqlite");
  }
  return v2;
}

@end