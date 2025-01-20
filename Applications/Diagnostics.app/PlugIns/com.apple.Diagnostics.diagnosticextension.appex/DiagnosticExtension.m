@interface DiagnosticExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = +[DSMutableArchive archive];
  id v19 = v5;
  +[LogArchiveAggregator addLogTypes:238 archive:&v19 prefix:@"FieldDiagnosticsLogs"];
  id v6 = v19;

  if (v3)
  {
    v7 = [v3 objectForKey:@"shouldCreateTarBall"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      unsigned __int8 v8 = [v7 BOOLValue];

      if ((v8 & 1) == 0)
      {
        v9 = [@"FieldDiagnosticsLogs" stringByAppendingString:@".XXXXXX"];
        id v17 = 0;
        v10 = [v6 archiveAsTempDirectoryWithName:v9 error:&v17];
        id v11 = v17;

        v12 = [v10 URLByAppendingPathComponent:@"FieldDiagnosticsLogs"];
        v13 = +[DEAttachmentItem attachmentWithPathURL:v12];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  v14 = [@"FieldDiagnosticsLogs" stringByAppendingString:@".XXXXXX"];
  id v18 = 0;
  v10 = [v6 archiveAsTempFileWithTemplate:v14 suffix:@".tgz" error:&v18];
  id v11 = v18;

  v13 = +[DEAttachmentItem attachmentWithPathURL:v10];
LABEL_8:
  [v4 addObject:v13];

  if (v11)
  {
    v15 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100002FA8((uint64_t)v11, v15);
    }
  }

  return v4;
}

@end