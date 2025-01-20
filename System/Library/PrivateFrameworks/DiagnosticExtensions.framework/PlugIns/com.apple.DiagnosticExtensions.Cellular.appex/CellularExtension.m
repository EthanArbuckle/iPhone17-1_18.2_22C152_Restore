@interface CellularExtension
- (CellularExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (void)addToAttachmentList:(id)a3;
- (void)addToAttachmentList:(id)a3 allowDelete:(id)a4;
- (void)dealloc;
- (void)validateCommands:(id)a3;
@end

@implementation CellularExtension

- (CellularExtension)init
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Cellular Diagnostic Extension init", buf, 2u);
  }
  v14.receiver = self;
  v14.super_class = (Class)CellularExtension;
  v4 = [(CellularExtension *)&v14 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (capabilities::radio::radioUnknown((capabilities::radio *)v4))
  {
    fAttachmentsList = v5->fAttachmentsList;
    v5->fAttachmentsList = 0;

    fBasebandLogDEHelper = v5->fBasebandLogDEHelper;
    v5->fBasebandLogDEHelper = 0;

    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Radio not supported", buf, 2u);
    }
    return v5;
  }
  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v11 = v5->fAttachmentsList;
  v5->fAttachmentsList = v10;

  v12 = objc_alloc_init(BasebandLogDEHelper);
  v13 = v5->fBasebandLogDEHelper;
  v5->fBasebandLogDEHelper = v12;

  return v5;
}

- (void)dealloc
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Cellular Diagnostic Extension dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)CellularExtension;
  [(CellularExtension *)&v4 dealloc];
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
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v10 = self->fAttachmentsList;
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
            objc_super v14 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v13), "path", v20);
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

          v10 = +[DEAttachmentItem attachmentWithPath:v9];
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

- (void)validateCommands:(id)a3
{
  id v3 = a3;
  int IsInternalBuild = TelephonyUtilIsInternalBuild();
  id v5 = [v3 valueForKey:@"DEExtensionHostAppKey"];
  id v6 = [v3 valueForKey:@"CellularExtensionCommandKey"];
  long long v7 = [v3 valueForKey:@"CellularExtensionFindLogsKey"];
  v8 = [v3 valueForKey:@"CellularExtensionSnapshotOsLogKey"];
  if (v6)
  {
LABEL_7:
    if (!IsInternalBuild) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }
  if (![v5 isEqualToString:@"Feedback Assistant"])
  {
    if (![v5 isEqualToString:@"com.apple.symptomsd"])
    {
      v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "CellularExtensionCommandKey is null, will attach the last dumped log and new dump", buf, 2u);
      }

      long long v7 = @"basebandLogPrevious";
      id v6 = @"dump_attach";
      if (!IsInternalBuild) {
        goto LABEL_15;
      }
      goto LABEL_8;
    }

    long long v7 = @"basebandLogLastDumped";
    id v6 = @"attach";
    goto LABEL_7;
  }

  long long v7 = @"basebandLogLastDumped";
  id v6 = @"runBasebandDiagnostics";
  if (!IsInternalBuild)
  {
LABEL_15:
    unsigned int v11 = [(__CFString *)v6 isEqualToString:@"attach"];
    if (v7) {
      unsigned int v12 = 0;
    }
    else {
      unsigned int v12 = v11;
    }
    if (v12 == 1)
    {
      uint64_t v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_ERROR, "CellularExtensionCommandKey is 'attach' but no CellularExtensionFindLogsKey provided, will attach the last log dump", v15, 2u);
      }
      long long v7 = @"basebandLogLastDumped";
    }
    goto LABEL_22;
  }
LABEL_8:
  if (![(__CFString *)v6 isEqualToString:@"runBasebandDiagnostics"]) {
    goto LABEL_15;
  }
  v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unsigned __int8 v16 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "Baseband diagnostics is not allowed for internal build, will dump and attach the log", v16, 2u);
  }

  id v6 = @"dump_attach";
LABEL_22:
  [v3 setValue:v6 forKey:@"CellularExtensionCommandKey"];
  [v3 setValue:v7 forKey:@"CellularExtensionFindLogsKey"];
  if (!v8)
  {
    objc_super v14 = &off_1000314A0;
    if (([v5 isEqualToString:@"com.apple.symptomsd"] & 1) == 0
      && ![v5 isEqualToString:@"Feedback Assistant"])
    {
      objc_super v14 = &off_1000314B8;
    }
    [v3 setValue:v14 forKey:@"CellularExtensionSnapshotOsLogKey"];
  }
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (self->fBasebandLogDEHelper)
  {
    id v5 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v4];
    id v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Cellular Diagnostic Extension started w/ %@", buf, 0xCu);
    }
    [(CellularExtension *)self validateCommands:v5];
    long long v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "After command validation: %@", buf, 0xCu);
    }
    [self->fBasebandLogDEHelper start];
    v8 = [v5 valueForKey:@"DEExtensionHostAppKey"];
    v9 = [v5 valueForKey:@"CellularExtensionCommandKey"];
    v44 = [v5 valueForKey:@"CellularExtensionFindLogsKey"];
    v10 = [v5 valueForKey:@"CellularExtensionSnapshotOsLogKey"];
    id v11 = [v10 BOOLValue];

    unsigned int v12 = [v5 valueForKey:@"CellularExtensionDumpReasonKey"];
    if (!v8)
    {
      v21 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_ERROR, "Host info is null", buf, 2u);
      }
      long long v20 = &__NSArray0__struct;
      goto LABEL_52;
    }
    if ([v9 isEqualToString:@"runBasebandDiagnostics"])
    {
      if (v44)
      {
        uint64_t v13 = [self->fBasebandLogDEHelper collectAttachments:v44];
        [(CellularExtension *)self addToAttachmentList:v13 allowDelete:&__kCFBooleanFalse];
      }
      unsigned __int8 v14 = [self->fBasebandLogDEHelper checkifBasebandTraceEnabled];
      if ((v14 & 1) == 0) {
        [self->fBasebandLogDEHelper installDELoggingProfile];
      }
      [self->fBasebandLogDEHelper triggerBasebandDiagnostics];
      v15 = [self->fBasebandLogDEHelper collectAttachments:@"Crash"];
      [(CellularExtension *)self addToAttachmentList:v15];

      fBasebandLogDEHelper = self->fBasebandLogDEHelper;
      v17 = [fBasebandLogDEHelper dumpTelephonyLogs:v8 :v11 :v12];
      v18 = [fBasebandLogDEHelper collectAttachments:v17];
      [(CellularExtension *)self addToAttachmentList:v18];

      if (v14) {
        goto LABEL_49;
      }
    }
    else
    {
      if ([v9 isEqualToString:@"start"])
      {
        if (![self->fBasebandLogDEHelper checkifDefaultBasebandProfileInstalled])[self->fBasebandLogDEHelper installDELoggingProfile]; {
        goto LABEL_49;
        }
      }
      if ([v9 isEqualToString:@"dump"])
      {
        id v22 = [self->fBasebandLogDEHelper dumpTelephonyLogs:v8 :v11 :v12];
        goto LABEL_49;
      }
      if ([v9 isEqualToString:@"dump_attach"])
      {
        if ([v44 isEqualToString:@"basebandLogPrevious"])
        {
          uint64_t v23 = [self->fBasebandLogDEHelper dumpTelephonyLogs:v8 :v11 :v12];
          id v24 = [self->fBasebandLogDEHelper previousDumpTimestamp:v23];
          if (v24)
          {
            v25 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
            if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v46 = v24;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_DEFAULT, "Attaching the previous dump: %@", buf, 0xCu);
            }
            long long v26 = [self->fBasebandLogDEHelper collectAttachments:v24];
            [(CellularExtension *)self addToAttachmentList:v26 allowDelete:&__kCFBooleanFalse];
          }
          else
          {
            v38 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
            if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v38, OS_LOG_TYPE_DEFAULT, "No previous dump found", buf, 2u);
            }
          }
          v39 = [self->fBasebandLogDEHelper collectAttachments:v23];
          [(CellularExtension *)self addToAttachmentList:v39];
        }
        else
        {
          long long v32 = self->fBasebandLogDEHelper;
          if (v44)
          {
            long long v33 = -[BasebandLogDEHelper collectAttachments:](self->fBasebandLogDEHelper, "collectAttachments:");
            [(CellularExtension *)self addToAttachmentList:v33 allowDelete:&__kCFBooleanFalse];

            long long v32 = self->fBasebandLogDEHelper;
          }
          uint64_t v23 = [(BasebandLogDEHelper *)v32 dumpTelephonyLogs:v8 :v11 :v12];
          id v24 = [(BasebandLogDEHelper *)v32 collectAttachments:v23];
          [(CellularExtension *)self addToAttachmentList:v24];
        }

        v40 = [self->fBasebandLogDEHelper collectAttachments:@"Crash"];
        [(CellularExtension *)self addToAttachmentList:v40];

        goto LABEL_49;
      }
      if ([v9 isEqualToString:@"dumpWithBasebandReset"])
      {
        if (v44)
        {
          long long v27 = [self->fBasebandLogDEHelper collectAttachments:v44];
          [(CellularExtension *)self addToAttachmentList:v27 allowDelete:&__kCFBooleanFalse];
        }
        long long v28 = [self->fBasebandLogDEHelper collectAttachments:@"Crash"];
        [(CellularExtension *)self addToAttachmentList:v28];

        long long v29 = self->fBasebandLogDEHelper;
        long long v30 = [(BasebandLogDEHelper *)v29 dumpLogWithBasebandReset:v8 :v12];
        long long v31 = [(BasebandLogDEHelper *)v29 collectAttachments:v30];
        [(CellularExtension *)self addToAttachmentList:v31];

        goto LABEL_49;
      }
      if ([v9 isEqualToString:@"attach"])
      {
        if (v44)
        {
          v34 = [self->fBasebandLogDEHelper collectAttachments:v44];
          [(CellularExtension *)self addToAttachmentList:v34 allowDelete:&__kCFBooleanFalse];
        }
        goto LABEL_49;
      }
      if (![v9 isEqualToString:@"finish"])
      {
        v43 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v9;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_DEFAULT, "Command [%@] is not supported", buf, 0xCu);
        }
        goto LABEL_49;
      }
      id v35 = [self->fBasebandLogDEHelper dumpTelephonyLogs:v8 :v11 :v12];
      __int16 v36 = [self->fBasebandLogDEHelper collectAttachments:@"Crash"];
      [(CellularExtension *)self addToAttachmentList:v36];

      unsigned int v37 = [self->fBasebandLogDEHelper collectAttachments:@"BasebandSnapshotFolder"];
      [(CellularExtension *)self addToAttachmentList:v37];

      if ([self->fBasebandLogDEHelper checkifDefaultBasebandProfileInstalled])
      {
LABEL_49:
        v41 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v41, OS_LOG_TYPE_DEFAULT, "Cellular Diagnostic Extension completed.", buf, 2u);
        }
        [self->fBasebandLogDEHelper stop];
        long long v20 = [(CellularExtension *)self attachmentList];
LABEL_52:

        goto LABEL_53;
      }
    }
    [self->fBasebandLogDEHelper uninstallDELoggingProfile];
    goto LABEL_49;
  }
  unsigned int v19 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "No BasebanadLog DE Helper", buf, 2u);
  }
  long long v20 = &__NSArray0__struct;
LABEL_53:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fBasebandLogDEHelper, 0);
  objc_storeStrong((id *)&self->fAttachmentsList, 0);
}

@end