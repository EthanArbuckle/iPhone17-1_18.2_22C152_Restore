@interface _MBLLoadMessageJob
+ (OS_os_log)signpostLog;
+ (id)log;
- (MFMailMessage)message;
- (id)initForMessage:(id)a3 forMBLMailbox:(id)a4;
- (unint64_t)signpostID;
- (void)run;
@end

@implementation _MBLLoadMessageJob

+ (OS_os_log)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049CF4;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B990 != -1) {
    dispatch_once(&qword_10016B990, block);
  }
  v2 = (void *)qword_10016B988;

  return (OS_os_log *)v2;
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049E5C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B9A0 != -1) {
    dispatch_once(&qword_10016B9A0, block);
  }
  v2 = (void *)qword_10016B998;

  return v2;
}

- (void)run
{
  v3 = +[MFPowerController sharedInstance];
  os_signpost_id_t v4 = [(MFMailMessage *)self->_message account];
  [v3 retainAssertionWithIdentifier:@"com.apple.mobilemail.messagebodyloader_job.message" withAccount:v4];

  v5 = [(MFMailMessage *)self->_message messageStore];
  LODWORD(v4) = [v5 shouldDownloadBodyDataForMessage:self->_message];

  if (v4)
  {
    id v6 = objc_alloc((Class)MFMessageLoadingContext);
    message = self->_message;
    v8 = +[MessageBodyLoader attachmentManager];
    id v9 = [v6 initWithMessage:message attachmentManager:v8];

    v10 = +[EFScheduler immediateScheduler];
    [v9 load:1 scheduler:v10];

    v11 = +[CPAggregateDictionary sharedAggregateDictionary];
    [v11 incrementKey:@"com.apple.mobilemail.receievedMessagesLoadedKey"];
  }
  if ([(MFMailMessage *)self->_message shouldSetSummary])
  {
    v12 = +[_MBLLoadMessageJob signpostLog];
    os_signpost_id_t v13 = [(_MBLLoadMessageJob *)self signpostID];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = [(MFMailMessage *)self->_message messageID];
      int v32 = 138412290;
      v33 = v14;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MBL COPY SUMMARY", "Message=%@", (uint8_t *)&v32, 0xCu);
    }
    v15 = +[MessageBodyLoader copySummaryForMessage:self->_message downloadIfNecessary:1];
    v16 = +[_MBLLoadMessageJob signpostLog];
    os_signpost_id_t v17 = [(_MBLLoadMessageJob *)self signpostID];
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(v32) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v17, "MBL COPY SUMMARY", (const char *)&unk_10012893E, (uint8_t *)&v32, 2u);
    }

    v18 = +[MFActivityMonitor currentMonitor];
    v19 = [v18 error];
    if (v19)
    {
    }
    else
    {
      v20 = +[MFActivityMonitor currentMonitor];
      unsigned __int8 v21 = [v20 shouldCancel];

      if (v21) {
        goto LABEL_26;
      }
      v22 = &stru_10013ED08;
      if (v15) {
        v22 = v15;
      }
      v23 = v22;

      v24 = +[_MBLLoadMessageJob signpostLog];
      os_signpost_id_t v25 = [(_MBLLoadMessageJob *)self signpostID];
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        v26 = [(MFMailMessage *)self->_message messageID];
        int v32 = 138412290;
        v33 = v26;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "MBL WRITE SUMMARY", "Message=%@", (uint8_t *)&v32, 0xCu);
      }
      [(MFMailMessage *)self->_message setSummary:v23];
      v27 = +[_MBLLoadMessageJob signpostLog];
      os_signpost_id_t v28 = [(_MBLLoadMessageJob *)self signpostID];
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        LOWORD(v32) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, v28, "MBL WRITE SUMMARY", (const char *)&unk_10012893E, (uint8_t *)&v32, 2u);
      }

      if (![(__CFString *)v23 length]
        || ([(MFMailMessage *)self->_message messageFlags] & 1) != 0
        || ([(MFMailMessage *)self->_message mailbox],
            v29 = objc_claimAutoreleasedReturnValue(),
            unint64_t v30 = (unint64_t)[v29 mailboxType],
            v29,
            (v30 & 0xFFFFFFFFFFFFFFFDLL) == 1))
      {
        v15 = v23;
        goto LABEL_26;
      }
      v18 = +[MessageAddressScanner sharedInstance];
      [v18 scanSummary:v23 forMessage:self->_message];
      v15 = v23;
    }

LABEL_26:
  }
  v31 = +[MFPowerController sharedInstance];
  [v31 releaseAssertionWithIdentifier:@"com.apple.mobilemail.messagebodyloader_job.message"];
}

- (id)initForMessage:(id)a3 forMBLMailbox:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MBLLoadMessageJob;
  id v9 = [(_MBLLoadMessageJob *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    objc_storeWeak(p_isa + 1, v8);
  }

  return p_isa;
}

- (MFMailMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_destroyWeak(&self->_messageBodyLoader);
}

@end