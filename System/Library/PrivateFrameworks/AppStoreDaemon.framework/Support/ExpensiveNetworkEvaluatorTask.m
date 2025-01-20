@interface ExpensiveNetworkEvaluatorTask
- (void)main;
@end

@implementation ExpensiveNetworkEvaluatorTask

- (void)main
{
  v3 = sub_10023E9B0((uint64_t)ExpensiveNetworkEvaluator, self->_cellularIdentity);
  int64_t v5 = sub_10023EAA0((uint64_t)v3, self->_cellularDownload);
  if (v5 == 4)
  {
    cellularDownload = self->_cellularDownload;
    if (cellularDownload) {
      cellularDownload = objc_getProperty(cellularDownload, v4, 24, 1);
    }
    id v7 = cellularDownload;
    v8 = sub_100259888((uint64_t)NetworkMonitor, v7);

    v9 = self->_cellularDownload;
    if (v9 && v9->_automatic)
    {
      v11 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        Property = self->_cellularDownload;
        if (Property) {
          Property = objc_getProperty(Property, v24, 32, 1);
        }
        id v26 = Property;
        v27 = v26;
        v28 = self->_cellularDownload;
        if (v28) {
          v28 = (EvaluatorDownload *)v28->_bytes;
        }
        *(_DWORD *)buf = 138412546;
        id v47 = v26;
        __int16 v48 = 2048;
        int64_t v49 = (int64_t)v28;
        v29 = "[%@]: Download of size %{iec-bytes}llu exceeds cellular limit, but not prompting for automatic download.";
        goto LABEL_33;
      }
    }
    else
    {
      unsigned __int8 v10 = [v8 isExpensiveOrCellular];
      v11 = ASDLogHandleForCategory();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          v14 = self->_cellularDownload;
          if (v14) {
            v14 = objc_getProperty(v14, v13, 32, 1);
          }
          id v15 = v14;
          v16 = v15;
          v17 = self->_cellularDownload;
          if (v17) {
            v17 = (EvaluatorDownload *)v17->_bytes;
          }
          *(_DWORD *)buf = 138412546;
          id v47 = v15;
          __int16 v48 = 2048;
          int64_t v49 = (int64_t)v17;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%@]: Download of size %{iec-bytes}llu exceeds cellular limit, asking how to proceed.", buf, 0x16u);
        }
        v18 = sub_1003DDE24((uint64_t)CellularDataPromptDialogRequest, self->_cellularDownload, (int)[(ASDCellularIdentity *)self->_cellularIdentity isRoaming]);
        id v45 = 0;
        v19 = sub_10033CBA4((uint64_t)InteractiveRequestPresenter, v18, &v45);
        v11 = v45;
        if (v11)
        {
          v20 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v22 = self->_cellularDownload;
            if (v22) {
              v22 = objc_getProperty(v22, v21, 32, 1);
            }
            id v23 = v22;
            *(_DWORD *)buf = 138412546;
            id v47 = v23;
            __int16 v48 = 2114;
            int64_t v49 = (int64_t)v11;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%@]: Error delivering dialog request: %{public}@", buf, 0x16u);
          }
          int64_t v5 = 4;
        }
        else
        {
          if (!v19)
          {
            int64_t v5 = 4;
            goto LABEL_20;
          }
          v37 = [v19 selectedActionIdentifier];
          unsigned int v38 = [v37 isEqualToString:@"CelularDataPromptActionDownloadNow"];

          v20 = ASDLogHandleForCategory();
          BOOL v39 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          if (v38)
          {
            if (v39)
            {
              v41 = self->_cellularDownload;
              if (v41) {
                v41 = objc_getProperty(v41, v40, 32, 1);
              }
              id v42 = v41;
              *(_DWORD *)buf = 138412290;
              id v47 = v42;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%@]: We were asked to download now.  Not requiring inexpensive data.", buf, 0xCu);
            }
            int64_t v5 = 1;
          }
          else
          {
            if (v39)
            {
              v43 = self->_cellularDownload;
              if (v43) {
                v43 = objc_getProperty(v43, v40, 32, 1);
              }
              id v44 = v43;
              *(_DWORD *)buf = 138412290;
              id v47 = v44;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%@]: We were asked to download later.  Requiring inexpensive data.", buf, 0xCu);
            }
            int64_t v5 = 2;
          }
        }

LABEL_20:
LABEL_35:

        goto LABEL_36;
      }
      if (v12)
      {
        v30 = self->_cellularDownload;
        if (v30) {
          v30 = objc_getProperty(v30, v13, 32, 1);
        }
        id v31 = v30;
        v27 = v31;
        v32 = self->_cellularDownload;
        if (v32) {
          v32 = (EvaluatorDownload *)v32->_bytes;
        }
        *(_DWORD *)buf = 138412546;
        id v47 = v31;
        __int16 v48 = 2048;
        int64_t v49 = (int64_t)v32;
        v29 = "[%@]: Download of size %{iec-bytes}llu exceeds cellular limit, but not prompting for inexpensive network.";
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
      }
    }
    int64_t v5 = 4;
    goto LABEL_35;
  }
LABEL_36:
  v33 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v35 = self->_cellularDownload;
    if (v35) {
      v35 = objc_getProperty(v35, v34, 32, 1);
    }
    id v36 = v35;
    *(_DWORD *)buf = 138412546;
    id v47 = v36;
    __int16 v48 = 2048;
    int64_t v49 = v5;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%@]: Evaluation for download completed with result: %ld", buf, 0x16u);
  }
  self->_evaluatorResult = v5;
  [(Task *)self completeWithSuccess];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularIdentity, 0);
  objc_storeStrong((id *)&self->_cellularDownload, 0);
}

@end