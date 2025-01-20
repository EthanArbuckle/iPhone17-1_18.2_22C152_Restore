@interface BLCellularNetworkEvaluatorOperation
- (BLEvaluatorDownload)cellularDownload;
- (BUCellularIdentity)cellularIdentity;
- (id)_presentDialogRequest:(id)a3 outError:(id *)a4;
- (int64_t)evaluatorResult;
- (void)run;
- (void)setCellularDownload:(id)a3;
- (void)setCellularIdentity:(id)a3;
@end

@implementation BLCellularNetworkEvaluatorOperation

- (id)_presentDialogRequest:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v5];

  v7 = [v6 present];
  v8 = [v7 resultWithError:a4];

  return v8;
}

- (void)run
{
  v3 = +[BLCellularNetworkEvaluator evaluatorForIdentity:self->_cellularIdentity];
  int64_t v4 = (int64_t)[v3 evaluateForDownload:self->_cellularDownload];
  if (v4 == 4)
  {
    if ([(BLEvaluatorDownload *)self->_cellularDownload isAutomatic])
    {
      id v5 = BLServiceLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(BLEvaluatorDownload *)self->_cellularDownload logKey];
        unint64_t v7 = [(BLEvaluatorDownload *)self->_cellularDownload bytes];
        *(_DWORD *)buf = 138543618;
        v28 = v6;
        __int16 v29 = 2048;
        unint64_t v30 = v7;
        v8 = "[%{public}@]: Download of size %llu exceeds cellular limit, but not prompting for automatic download.";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0x16u);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
    v9 = +[BLNetworkMonitor defaultMonitor];
    unsigned __int8 v10 = [v9 isExpensive];

    id v5 = BLServiceLog();
    BOOL v11 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if ((v10 & 1) == 0)
    {
      if (v11)
      {
        id v6 = [(BLEvaluatorDownload *)self->_cellularDownload logKey];
        unint64_t v18 = [(BLEvaluatorDownload *)self->_cellularDownload bytes];
        *(_DWORD *)buf = 138543618;
        v28 = v6;
        __int16 v29 = 2048;
        unint64_t v30 = v18;
        v8 = "[%{public}@]: Download of size %llu exceeds cellular limit, but not prompting for inexpensive network.";
        goto LABEL_16;
      }
LABEL_17:
      int64_t v4 = 4;
      goto LABEL_18;
    }
    if (v11)
    {
      v12 = [(BLEvaluatorDownload *)self->_cellularDownload logKey];
      unint64_t v13 = [(BLEvaluatorDownload *)self->_cellularDownload bytes];
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      __int16 v29 = 2048;
      unint64_t v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Download of size %llu exceeds cellular limit, asking how to proceed.", buf, 0x16u);
    }
    v14 = +[BLCellularDataPromptDialogRequest dialogForDownload:self->_cellularDownload roaming:[(BUCellularIdentity *)self->_cellularIdentity isRoaming]];
    id v26 = 0;
    v15 = [(BLCellularNetworkEvaluatorOperation *)self _presentDialogRequest:v14 outError:&v26];
    id v5 = v26;
    if (v5)
    {
      v16 = BLServiceLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [(BLEvaluatorDownload *)self->_cellularDownload logKey];
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        __int16 v29 = 2114;
        unint64_t v30 = (unint64_t)v5;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Error delivering dialog request: %{public}@", buf, 0x16u);
      }
      int64_t v4 = 4;
    }
    else
    {
      if (!v15)
      {
        int64_t v4 = 4;
        goto LABEL_13;
      }
      v21 = [v15 selectedActionIdentifier];
      unsigned int v22 = [v21 isEqualToString:@"BLCellularDataPromptActionDownloadNow"];

      v16 = BLServiceLog();
      BOOL v23 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v23)
        {
          v24 = [(BLEvaluatorDownload *)self->_cellularDownload logKey];
          *(_DWORD *)buf = 138543362;
          v28 = v24;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]: We were asked to download now.  Not requiring inexpensive data.", buf, 0xCu);
        }
        int64_t v4 = 1;
      }
      else
      {
        if (v23)
        {
          v25 = [(BLEvaluatorDownload *)self->_cellularDownload logKey];
          *(_DWORD *)buf = 138543362;
          v28 = v25;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]: We were asked to download later.  Requiring inexpensive data.", buf, 0xCu);
        }
        int64_t v4 = 2;
      }
    }

LABEL_13:
LABEL_18:
  }
  v19 = BLServiceLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [(BLEvaluatorDownload *)self->_cellularDownload logKey];
    *(_DWORD *)buf = 138543618;
    v28 = v20;
    __int16 v29 = 2048;
    unint64_t v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Evaluation for download completed with result: %ld", buf, 0x16u);
  }
  self->_evaluatorResult = v4;
  self->super._success = 1;
}

- (BLEvaluatorDownload)cellularDownload
{
  return self->_cellularDownload;
}

- (void)setCellularDownload:(id)a3
{
}

- (BUCellularIdentity)cellularIdentity
{
  return self->_cellularIdentity;
}

- (void)setCellularIdentity:(id)a3
{
}

- (int64_t)evaluatorResult
{
  return self->_evaluatorResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularIdentity, 0);

  objc_storeStrong((id *)&self->_cellularDownload, 0);
}

@end