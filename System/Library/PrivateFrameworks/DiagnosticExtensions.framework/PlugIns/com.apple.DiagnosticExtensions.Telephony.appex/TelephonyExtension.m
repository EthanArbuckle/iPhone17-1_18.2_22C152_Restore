@interface TelephonyExtension
- (TelephonyExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (void)addToAttachmentList:(id)a3;
- (void)addToAttachmentList:(id)a3 allowDelete:(id)a4;
- (void)dealloc;
- (void)setupWithParameters:(id)a3;
- (void)teardownWithParameters:(id)a3;
- (void)validateCommands:(id)a3;
@end

@implementation TelephonyExtension

- (TelephonyExtension)init
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[TelephonyExtension init]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  v11.receiver = self;
  v11.super_class = (Class)TelephonyExtension;
  v4 = [(TelephonyExtension *)&v11 init];
  v5 = v4;
  if (v4)
  {
    if (capabilities::radio::radioUnknown((capabilities::radio *)v4))
    {
      fBasebandLogDEHelper = v5->fBasebandLogDEHelper;
      v5->fBasebandLogDEHelper = 0;

      v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Radio not supported", buf, 2u);
      }
    }
    else
    {
      v8 = objc_alloc_init(BasebandLogDEHelper);
      v9 = v5->fBasebandLogDEHelper;
      v5->fBasebandLogDEHelper = v8;
    }
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[TelephonyExtension dealloc]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)TelephonyExtension;
  [(TelephonyExtension *)&v4 dealloc];
}

- (void)setupWithParameters:(id)a3
{
  id v4 = a3;
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[TelephonyExtension setupWithParameters:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }
  if (self->fBasebandLogDEHelper)
  {
    if ((TelephonyUtilIsInternalBuild() & 1) == 0
      && ![self->fBasebandLogDEHelper checkifDefaultBasebandProfileInstalled])
    {
      v6 = +[NSString stringWithUTF8String:"/System/Library/PrivateFrameworks/DiagnosticExtensions.framework/PlugIns/com.apple.DiagnosticExtensions.Telephony.appex/basebandlog.plist"];
      [self->fBasebandLogDEHelper enableBasebandLog:v6];
    }
  }
  else
  {
    v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_ERROR, "No BasebanadLog DE Helper", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)teardownWithParameters:(id)a3
{
  id v4 = a3;
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[TelephonyExtension teardownWithParameters:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  if ((TelephonyUtilIsInternalBuild() & 1) == 0
    && ![self->fBasebandLogDEHelper checkifDefaultBasebandProfileInstalled])
  {
    [self->fBasebandLogDEHelper disableBasebandLog];
  }
}

- (void)validateCommands:(id)a3
{
  id v3 = a3;
  id v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[TelephonyExtension validateCommands:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }
  v5 = [v3 valueForKey:@"DEExtensionHostAppKey"];
  int v6 = [v3 valueForKey:@"CellularExtensionCommandKey"];
  v7 = [v3 valueForKey:@"CellularExtensionFindLogsKey"];
  if (v6)
  {
    unsigned int v8 = [(__CFString *)v6 isEqualToString:@"attach"];
    if (v7) {
      unsigned int v9 = 0;
    }
    else {
      unsigned int v9 = v8;
    }
    if (v9 == 1)
    {
      __int16 v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "CellularExtensionCommandKey is 'attach' but no CellularExtensionFindLogsKey provided, will attach the last log dump", (uint8_t *)&v12, 2u);
      }
      v7 = @"basebandLogLastDumped";
    }
  }
  else if ([v5 isEqualToString:@"com.apple.symptomsd"])
  {

    v7 = @"basebandLogLastDumped";
    int v6 = @"attach";
  }
  else
  {
    id v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "CellularExtensionCommandKey is null, will attach the last dumped log and new dump", (uint8_t *)&v12, 2u);
    }

    v7 = @"basebandLogPrevious";
    int v6 = @"dump_attach";
  }
  [v3 setValue:v6 forKey:@"CellularExtensionCommandKey"];
  [v3 setValue:v7 forKey:@"CellularExtensionFindLogsKey"];
}

- (id)attachmentList
{
  fAttachmentsList = self->fAttachmentsList;
  if (fAttachmentsList && [(NSMutableArray *)fAttachmentsList count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithArray:self->fAttachmentsList];
    [(NSMutableArray *)self->fAttachmentsList removeAllObjects];
    v5 = v4;
  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  return v5;
}

- (void)addToAttachmentList:(id)a3
{
}

- (void)addToAttachmentList:(id)a3 allowDelete:(id)a4
{
  id v5 = a3;
  id v22 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v6)
  {
    uint64_t v23 = *(void *)v31;
    *(void *)&long long v7 = 138412546;
    long long v20 = v7;
    do
    {
      id v24 = v6;
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        __int16 v10 = self->fAttachmentsList;
        id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v27;
LABEL_8:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v13), "path", v20);
            v15 = [v14 lastPathComponent];
            unsigned __int8 v16 = [v9 containsString:v15];

            if (v16) {
              break;
            }
            if (v11 == (id)++v13)
            {
              id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v26 objects:v38 count:16];
              if (v11) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          __int16 v10 = +[DEAttachmentItem attachmentWithPath:v9];
          [(NSMutableArray *)v10 setDeleteOnAttach:v22];
          if ([v9 hasSuffix:@"tar.gz"]) {
            v17 = &__kCFBooleanFalse;
          }
          else {
            v17 = &__kCFBooleanTrue;
          }
          -[NSMutableArray setShouldCompress:](v10, "setShouldCompress:", v17, v20);
          [(NSMutableArray *)self->fAttachmentsList addObject:v10];
          v18 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v19 = [v22 intValue];
            *(_DWORD *)buf = v20;
            v35 = v9;
            __int16 v36 = 1024;
            unsigned int v37 = v19;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "Attaching file: %@, deleteOnAttach: %d", buf, 0x12u);
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v6);
  }
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = (char *)a3;
  id v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[TelephonyExtension attachmentsForParameters:]";
    __int16 v41 = 2112;
    v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  fBasebandLogDEHelper = self->fBasebandLogDEHelper;
  if (!fBasebandLogDEHelper)
  {
    unsigned __int8 v16 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      v18 = &__NSArray0__struct;
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v17 = "No BasebanadLog DE Helper";
LABEL_34:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_13;
  }
  if (![fBasebandLogDEHelper checkifBasebandTraceEnabled])
  {
    unsigned __int8 v16 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v17 = "Baseband trace is not enabled";
    goto LABEL_34;
  }
  [self->fBasebandLogDEHelper start];
  long long v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fAttachmentsList = self->fAttachmentsList;
  self->fAttachmentsList = v7;

  [(TelephonyExtension *)self validateCommands:v4];
  unsigned int v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "After command validation: %@", buf, 0xCu);
  }
  __int16 v10 = [v4 valueForKey:@"DEExtensionHostAppKey"];
  id v11 = [v4 valueForKey:@"CellularExtensionCommandKey"];
  v38 = [v4 valueForKey:@"CellularExtensionFindLogsKey"];
  uint64_t v12 = [v4 valueForKey:@"CellularExtensionSnapshotOsLogKey"];
  id v13 = [v12 BOOLValue];

  v14 = [v4 valueForKey:@"CellularExtensionDumpReasonKey"];
  if (v10)
  {
    if ([v11 isEqualToString:@"dump"])
    {
      id v15 = [self->fBasebandLogDEHelper dumpTelephonyLogs:v10 :v13 :v14];
    }
    else if ([v11 isEqualToString:@"dump_attach"])
    {
      if ([v38 isEqualToString:@"basebandLogPrevious"])
      {
        long long v20 = [self->fBasebandLogDEHelper dumpTelephonyLogs:v10 :v13 :v14];
        v21 = [self->fBasebandLogDEHelper previousDumpTimestamp:v20];
        if (v21)
        {
          id v22 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
          if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v21;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "Attaching the previous dump: %@", buf, 0xCu);
          }
          uint64_t v23 = [self->fBasebandLogDEHelper collectAttachments:v21];
          [(TelephonyExtension *)self addToAttachmentList:v23 allowDelete:&__kCFBooleanFalse];
        }
        else
        {
          long long v33 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
          if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v33, OS_LOG_TYPE_DEFAULT, "No previous dump found", buf, 2u);
          }
        }
        v34 = [self->fBasebandLogDEHelper collectAttachments:v20];
        [(TelephonyExtension *)self addToAttachmentList:v34];
      }
      else
      {
        long long v29 = self->fBasebandLogDEHelper;
        if (v38)
        {
          long long v30 = -[BasebandLogDEHelper collectAttachments:](self->fBasebandLogDEHelper, "collectAttachments:");
          [(TelephonyExtension *)self addToAttachmentList:v30 allowDelete:&__kCFBooleanFalse];

          long long v29 = self->fBasebandLogDEHelper;
        }
        long long v20 = [(BasebandLogDEHelper *)v29 dumpTelephonyLogs:v10 :v13 :v14];
        v21 = [(BasebandLogDEHelper *)v29 collectAttachments:v20];
        [(TelephonyExtension *)self addToAttachmentList:v21];
      }

      v35 = [self->fBasebandLogDEHelper collectAttachments:@"Crash"];
      [(TelephonyExtension *)self addToAttachmentList:v35];
    }
    else if ([v11 isEqualToString:@"dumpWithBasebandReset"])
    {
      if (v38)
      {
        id v24 = [self->fBasebandLogDEHelper collectAttachments:v38];
        [(TelephonyExtension *)self addToAttachmentList:v24 allowDelete:&__kCFBooleanFalse];
      }
      v25 = [self->fBasebandLogDEHelper collectAttachments:@"Crash"];
      [(TelephonyExtension *)self addToAttachmentList:v25];

      long long v26 = self->fBasebandLogDEHelper;
      long long v27 = [(BasebandLogDEHelper *)v26 dumpLogWithBasebandReset:v10 :v14];
      long long v28 = [(BasebandLogDEHelper *)v26 collectAttachments:v27];
      [(TelephonyExtension *)self addToAttachmentList:v28];
    }
    else if ([v11 isEqualToString:@"attach"])
    {
      if (v38)
      {
        long long v31 = [self->fBasebandLogDEHelper collectAttachments:v38];
        [(TelephonyExtension *)self addToAttachmentList:v31 allowDelete:&__kCFBooleanFalse];
      }
    }
    else
    {
      long long v32 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "Command [%@] is not supported", buf, 0xCu);
      }
    }
    __int16 v36 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_LOG_TYPE_DEFAULT, "Telephony Diagnostic Extension completed.", buf, 2u);
    }
    [self->fBasebandLogDEHelper stop];
    v18 = [(TelephonyExtension *)self attachmentList];
  }
  else
  {
    unsigned int v19 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "Host info is null", buf, 2u);
    }
    v18 = &__NSArray0__struct;
  }

LABEL_46:
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fBasebandLogDEHelper, 0);
  objc_storeStrong((id *)&self->fAttachmentsList, 0);
}

@end