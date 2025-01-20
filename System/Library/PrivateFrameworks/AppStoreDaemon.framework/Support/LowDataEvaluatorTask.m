@interface LowDataEvaluatorTask
- (void)main;
@end

@implementation LowDataEvaluatorTask

- (void)main
{
  v3 = objc_alloc_init(LowDataNetworkEvaluator);
  int64_t v5 = sub_10024DD0C((uint64_t)v3, self->_cellularDownload);
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
      v12 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        Property = self->_cellularDownload;
        if (Property) {
          Property = objc_getProperty(Property, v17, 32, 1);
        }
        id v19 = Property;
        *(_DWORD *)buf = 138412290;
        id v37 = v19;
        v20 = "[%@]: Requires unconstrained network, but not prompting for automatic download.";
        goto LABEL_23;
      }
    }
    else
    {
      if ([v8 isConstrained])
      {
        v10 = sub_1003A65B4((uint64_t)LowDataModePromptDialogRequest, self->_cellularDownload);
        id v35 = 0;
        v11 = sub_10033CBA4((uint64_t)InteractiveRequestPresenter, v10, &v35);
        v12 = v35;
        if (v12)
        {
          v13 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v15 = self->_cellularDownload;
            if (v15) {
              v15 = objc_getProperty(v15, v14, 32, 1);
            }
            id v16 = v15;
            *(_DWORD *)buf = 138412546;
            id v37 = v16;
            __int16 v38 = 2114;
            int64_t v39 = (int64_t)v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@]: Error delivering dialog request: %{public}@", buf, 0x16u);
          }
          int64_t v5 = 4;
        }
        else
        {
          if (!v11)
          {
            int64_t v5 = 4;
            goto LABEL_14;
          }
          v27 = [v11 selectedActionIdentifier];
          unsigned int v28 = [v27 isEqualToString:@"LowDataModePromptActionDownload"];

          v13 = ASDLogHandleForCategory();
          BOOL v29 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          if (v28)
          {
            if (v29)
            {
              v31 = self->_cellularDownload;
              if (v31) {
                v31 = objc_getProperty(v31, v30, 32, 1);
              }
              id v32 = v31;
              *(_DWORD *)buf = 138412290;
              id v37 = v32;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@]: We were asked to download now. Ignoring constrained network.", buf, 0xCu);
            }
            int64_t v5 = 1;
          }
          else
          {
            if (v29)
            {
              v33 = self->_cellularDownload;
              if (v33) {
                v33 = objc_getProperty(v33, v30, 32, 1);
              }
              id v34 = v33;
              *(_DWORD *)buf = 138412290;
              id v37 = v34;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@]: We were asked to cancel download. Denying network access.", buf, 0xCu);
            }
            int64_t v5 = 2;
          }
        }

LABEL_14:
LABEL_25:

        goto LABEL_26;
      }
      v12 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_cellularDownload;
        if (v22) {
          v22 = objc_getProperty(v22, v21, 32, 1);
        }
        id v19 = v22;
        *(_DWORD *)buf = 138412290;
        id v37 = v19;
        v20 = "[%@]: Requires unconstrained network, but not prompting for current network.";
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
      }
    }
    int64_t v5 = 4;
    goto LABEL_25;
  }
LABEL_26:
  v23 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v25 = self->_cellularDownload;
    if (v25) {
      v25 = objc_getProperty(v25, v24, 32, 1);
    }
    id v26 = v25;
    *(_DWORD *)buf = 138412546;
    id v37 = v26;
    __int16 v38 = 2048;
    int64_t v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%@]: Evaluation for download completed with result: %ld", buf, 0x16u);
  }
  self->_evaluatorResult = v5;
  [(Task *)self completeWithSuccess];
}

- (void).cxx_destruct
{
}

@end