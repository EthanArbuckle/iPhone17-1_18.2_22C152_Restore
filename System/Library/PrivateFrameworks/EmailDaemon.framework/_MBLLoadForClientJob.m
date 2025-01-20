@interface _MBLLoadForClientJob
+ (OS_os_log)signpostLog;
+ (id)log;
- (MBLSingleMessageClient)client;
- (id)initForClient:(id)a3 forMBLMailbox:(id)a4;
- (unint64_t)signpostID;
- (void)run;
@end

@implementation _MBLLoadForClientJob

+ (OS_os_log)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A5D0;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B9B0 != -1) {
    dispatch_once(&qword_10016B9B0, block);
  }
  v2 = (void *)qword_10016B9A8;

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
  block[2] = sub_10004A738;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B9C0 != -1) {
    dispatch_once(&qword_10016B9C0, block);
  }
  v2 = (void *)qword_10016B9B8;

  return v2;
}

- (void)run
{
  v3 = +[MFActivityMonitor currentMonitor];
  os_signpost_id_t v4 = [(MBLSingleMessageClient *)self->_client message];
  unsigned int v5 = [(MBLSingleMessageClient *)self->_client wantsContentsOfType:0];
  unsigned int v6 = [(MBLSingleMessageClient *)self->_client wantsContentsOfType:1];
  unsigned int v7 = [(MBLSingleMessageClient *)self->_client wantsContentsOfType:2];
  v8 = +[NSString stringWithFormat:@"com.apple.mobilemail.messagebodyloader_job.client.%@", objc_opt_class()];
  v9 = +[MFPowerController sharedInstance];
  v10 = [v4 account];
  [v9 retainAssertionWithIdentifier:v8 withAccount:v10];

  if ((v5 | v7) == 1)
  {
    v11 = [v4 summary];
    if (v11)
    {
      BOOL v39 = 0;
    }
    else
    {
      v12 = +[_MBLLoadForClientJob signpostLog];
      os_signpost_id_t v13 = [(_MBLLoadForClientJob *)self signpostID];
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        v14 = [v4 messageID];
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = (uint64_t)v14;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MBL COPY SUMMARY", "Message=%@", buf, 0xCu);
      }
      v11 = +[MessageBodyLoader copySummaryForMessage:v4 downloadIfNecessary:1];
      v15 = +[_MBLLoadForClientJob signpostLog];
      os_signpost_id_t v16 = [(_MBLLoadForClientJob *)self signpostID];
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v16, "MBL COPY SUMMARY", (const char *)&unk_10012893E, buf, 2u);
      }

      BOOL v39 = [(__CFString *)v11 length] != 0;
    }
    v17 = [v3 error];
    unsigned int v18 = [v3 shouldCancel];
    if (v17) {
      char v19 = v18;
    }
    else {
      char v19 = 1;
    }
    if (v19)
    {
      if (v18) {
        goto LABEL_33;
      }
LABEL_19:
      if ([v4 shouldSetSummary])
      {
        v22 = &stru_10013ED08;
        if (v11) {
          v22 = v11;
        }
        v23 = v22;

        v24 = +[_MBLLoadForClientJob signpostLog];
        os_signpost_id_t v25 = [(_MBLLoadForClientJob *)self signpostID];
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          uint64_t v26 = [v4 messageID];
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = v26;
          v38 = (void *)v26;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "MBL WRITE SUMMARY", "Message=%@", buf, 0xCu);
        }
        [v4 setSummary:v23];
        v27 = +[_MBLLoadForClientJob signpostLog];
        os_signpost_id_t v28 = [(_MBLLoadForClientJob *)self signpostID];
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, v28, "MBL WRITE SUMMARY", (const char *)&unk_10012893E, buf, 2u);
        }

        v11 = v23;
      }
      [(MBLSingleMessageClient *)self->_client notifyContentsAvailable:v11 forMessage:v4];
      if ((v7 & 1) != 0 || v39 && ([v4 messageFlags] & 1) == 0)
      {
        v29 = [v4 mailbox];
        unint64_t v30 = (unint64_t)[v29 mailboxType];

        if ((v30 & 0xFFFFFFFFFFFFFFFDLL) != 1)
        {
          v31 = +[MessageAddressScanner sharedInstance];
          [v31 scanSummary:v11 forMessage:v4];
        }
      }
      goto LABEL_34;
    }
    v20 = [v17 domain];
    if ([MFMessageErrorDomain isEqualToString:v20])
    {
      BOOL v21 = [v17 code] == (id)1036;

      if (v21) {
        goto LABEL_19;
      }
    }
    else
    {
    }
LABEL_33:
    [(MBLSingleMessageClient *)self->_client notifyContentsUnavailableForMessage:v4 error:v17];
LABEL_34:
  }
  if (v6)
  {
    id v32 = objc_alloc((Class)MFMessageLoadingContext);
    v33 = +[MessageBodyLoader attachmentManager];
    id v34 = [v32 initWithMessage:v4 attachmentManager:v33];

    v35 = +[EFScheduler immediateScheduler];
    [v34 load:1 scheduler:v35];

    if ([v3 shouldCancel])
    {
      v36 = [v3 error];
      [(MBLSingleMessageClient *)self->_client notifyFullMessageContentsUnavailableForMessage:v4 error:v36];
    }
    else
    {
      [(MBLSingleMessageClient *)self->_client notifyFullMessageContentsAvailableForMessage:v4];
    }
  }
  v37 = +[MFPowerController sharedInstance];
  [v37 releaseAssertionWithIdentifier:v8];
}

- (id)initForClient:(id)a3 forMBLMailbox:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MBLLoadForClientJob;
  v9 = [(_MBLLoadForClientJob *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeWeak(p_isa + 1, v8);
  }

  return p_isa;
}

- (MBLSingleMessageClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);

  objc_destroyWeak(&self->_messageBodyLoader);
}

@end