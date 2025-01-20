@interface SGSqliteExitOnDeviceLockErrorHandler
- (BOOL)handleSqliteError:(int)a3 error:(id)a4 onError:(id)a5 db:(id)a6;
- (SGSqliteExitOnDeviceLockErrorHandler)initWithExitCode:(int)a3;
- (void)exitOnErrorIndicatingIOError:(int)a3;
@end

@implementation SGSqliteExitOnDeviceLockErrorHandler

- (void)exitOnErrorIndicatingIOError:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = sqlite3_errstr(a3);
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "Exiting due to SQLite error: %s", (uint8_t *)&v6, 0xCu);
  }

  SGDExit(self->_exitCode);
}

- (BOOL)handleSqliteError:(int)a3 error:(id)a4 onError:(id)a5 db:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((int)v8 > 3593)
  {
    if ((int)v8 > 5385)
    {
      if ((int)v8 > 6409)
      {
        if ((int)v8 > 6921)
        {
          if (v8 != 6922)
          {
            if (v8 != 7178) {
              goto LABEL_78;
            }
            goto LABEL_75;
          }
LABEL_74:
          [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_75:
          [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
          goto LABEL_76;
        }
        if (v8 != 6410)
        {
          if (v8 != 6666) {
            goto LABEL_78;
          }
          goto LABEL_73;
        }
LABEL_72:
        [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_73:
        [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
        goto LABEL_74;
      }
      if ((int)v8 > 5897)
      {
        if (v8 != 5898)
        {
          if (v8 != 6154) {
            goto LABEL_78;
          }
          goto LABEL_71;
        }
LABEL_70:
        [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_71:
        [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
        goto LABEL_72;
      }
      if (v8 != 5386)
      {
        if (v8 != 5642) {
          goto LABEL_78;
        }
        goto LABEL_69;
      }
LABEL_68:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_69:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
      goto LABEL_70;
    }
    if ((int)v8 > 4361)
    {
      if ((int)v8 > 4873)
      {
        if (v8 != 4874)
        {
          if (v8 != 5130) {
            goto LABEL_78;
          }
          goto LABEL_67;
        }
LABEL_66:
        [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_67:
        [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
        goto LABEL_68;
      }
      if (v8 != 4362)
      {
        if (v8 != 4618) {
          goto LABEL_78;
        }
        goto LABEL_65;
      }
LABEL_64:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_65:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
      goto LABEL_66;
    }
    if (v8 != 3594)
    {
      if (v8 != 3850)
      {
        if (v8 != 4106) {
          goto LABEL_78;
        }
        goto LABEL_63;
      }
LABEL_62:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_63:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
      goto LABEL_64;
    }
LABEL_61:
    [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
    goto LABEL_62;
  }
  if ((int)v8 > 1545)
  {
    if ((int)v8 > 2569)
    {
      if ((int)v8 > 3081)
      {
        if (v8 != 3082)
        {
          if (v8 != 3338) {
            goto LABEL_78;
          }
          goto LABEL_60;
        }
LABEL_59:
        [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_60:
        [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
        goto LABEL_61;
      }
      if (v8 != 2570)
      {
        if (v8 != 2826) {
          goto LABEL_78;
        }
        goto LABEL_58;
      }
LABEL_57:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_58:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
      goto LABEL_59;
    }
    if ((int)v8 > 2057)
    {
      if (v8 != 2058)
      {
        if (v8 != 2314) {
          goto LABEL_78;
        }
        goto LABEL_56;
      }
LABEL_55:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_56:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
      goto LABEL_57;
    }
    if (v8 != 1546)
    {
      if (v8 != 1802) {
        goto LABEL_78;
      }
      goto LABEL_54;
    }
LABEL_53:
    [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_54:
    [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
    goto LABEL_55;
  }
  if ((int)v8 > 521)
  {
    if ((int)v8 > 1033)
    {
      if (v8 != 1034)
      {
        if (v8 != 1290) {
          goto LABEL_78;
        }
        goto LABEL_52;
      }
LABEL_51:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_52:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
      goto LABEL_53;
    }
    if (v8 != 522)
    {
      if (v8 != 778) {
        goto LABEL_78;
      }
      goto LABEL_37;
    }
LABEL_36:
    [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
LABEL_37:
    [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
    goto LABEL_51;
  }
  switch(v8)
  {
    case 0xD:
LABEL_77:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
      break;
    case 0x1A:
LABEL_76:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:v8];
      goto LABEL_77;
    case 0x10A:
      [(SGSqliteExitOnDeviceLockErrorHandler *)self exitOnErrorIndicatingIOError:266];
      goto LABEL_36;
  }
LABEL_78:
  v15.receiver = self;
  v15.super_class = (Class)SGSqliteExitOnDeviceLockErrorHandler;
  BOOL v13 = [(_PASSqliteDefaultErrorHandler *)&v15 handleSqliteError:v8 error:v10 onError:v11 db:v12];

  return v13;
}

- (SGSqliteExitOnDeviceLockErrorHandler)initWithExitCode:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGSqliteExitOnDeviceLockErrorHandler;
  result = [(SGSqliteExitOnDeviceLockErrorHandler *)&v5 init];
  if (result) {
    result->_exitCode = a3;
  }
  return result;
}

@end