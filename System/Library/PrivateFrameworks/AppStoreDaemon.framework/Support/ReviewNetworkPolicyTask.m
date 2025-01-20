@interface ReviewNetworkPolicyTask
- (void)main;
@end

@implementation ReviewNetworkPolicyTask

- (void)main
{
  download = self->_download;
  if (download) {
    download = objc_getProperty(download, a2, 24, 1);
  }
  id v4 = download;
  v5 = sub_100259888((uint64_t)NetworkMonitor, v4);

  BOOL suppressDialogs = self->_suppressDialogs;
  v7 = sub_100354F64();
  v54[1] = 0;
  v8 = sub_1003553B0(v7);
  id v9 = 0;

  unint64_t expensiveResult = self->_expensiveResult;
  if (!v8)
  {
    LOBYTE(v15) = suppressDialogs;
    BOOL v11 = expensiveResult > 4;
    uint64_t v25 = (1 << expensiveResult) & 0x19;
    if (!v11 && v25 != 0)
    {
      v27 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        Property = self->_download;
        if (Property) {
          Property = objc_getProperty(Property, v28, 32, 1);
        }
        id v48 = Property;
        *(_DWORD *)buf = 138412546;
        id v56 = v48;
        __int16 v57 = 2114;
        id v58 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[%@]: Unable to evaluate cellular download: %{public}@", buf, 0x16u);
      }
      self->_unint64_t expensiveResult = 4;
    }
    goto LABEL_30;
  }
  BOOL v11 = expensiveResult > 4;
  uint64_t v12 = (1 << expensiveResult) & 0x19;
  if (!v11 && v12 != 0)
  {
    v14 = sub_10023E9B0((uint64_t)ExpensiveNetworkEvaluator, v8);
    self->_unint64_t expensiveResult = sub_10023EAA0((uint64_t)v14, self->_download);
  }
  LOBYTE(v15) = suppressDialogs;
  if (suppressDialogs)
  {
LABEL_30:
    id v23 = v9;
    goto LABEL_31;
  }
  unint64_t v16 = self->_expensiveResult;
  BOOL v11 = v16 > 4;
  uint64_t v17 = (1 << v16) & 0x15;
  BOOL v18 = v11 || v17 == 0;
  if (v18 || ![v5 isExpensiveOrCellular])
  {
    LOBYTE(v15) = 0;
    goto LABEL_30;
  }
  v19 = objc_alloc_init(ExpensiveNetworkEvaluatorTask);
  v21 = v19;
  if (v19)
  {
    objc_setProperty_atomic(v19, v20, self->_download, 40);
    objc_setProperty_atomic(v21, v22, v8, 48);
  }
  v54[0] = v9;
  unsigned int v15 = [(Task *)self runSubTask:v21 returningError:v54];
  id v23 = v54[0];

  if (v15)
  {
    if (v21)
    {
      int64_t evaluatorResult = v21->_evaluatorResult;
      self->_unint64_t expensiveResult = evaluatorResult;
      if ((unint64_t)(evaluatorResult - 1) <= 1
        && (evaluatorResult & 0xFFFFFFFFFFFFFFFDLL) == 1
        && [v5 isConstrained])
      {
        self->_unint64_t constrainedResult = self->_expensiveResult;
      }
    }
    else
    {
      self->_unint64_t expensiveResult = 0;
    }
  }
  else
  {
    v45 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v51 = self->_download;
      if (v51) {
        v51 = objc_getProperty(v51, v46, 32, 1);
      }
      id v52 = v51;
      *(_DWORD *)buf = 138412546;
      id v56 = v52;
      __int16 v57 = 2114;
      id v58 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "[%@]: Unable to evaluate cellular download: %{public}@", buf, 0x16u);
    }
  }

LABEL_31:
  unint64_t constrainedResult = self->_constrainedResult;
  BOOL v11 = constrainedResult > 4;
  uint64_t v30 = (1 << constrainedResult) & 0x19;
  if (!v11 && v30 != 0)
  {
    v32 = objc_alloc_init(LowDataNetworkEvaluator);
    self->_unint64_t constrainedResult = sub_10024DD0C((uint64_t)v32, self->_download);
  }
  if ((v15 & 1) == 0)
  {
    unint64_t v33 = self->_constrainedResult;
    if (v33 <= 4 && ((1 << v33) & 0x15) != 0 && [v5 isConstrained])
    {
      v34 = objc_alloc_init(LowDataEvaluatorTask);
      v36 = v34;
      if (v34) {
        objc_setProperty_atomic(v34, v35, self->_download, 40);
      }
      id v53 = 0;
      unsigned int v37 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v36, &v53, v52);
      id v38 = v53;
      if (v37)
      {
        if (v36) {
          int64_t v39 = v36->_evaluatorResult;
        }
        else {
          int64_t v39 = 0;
        }
        self->_unint64_t constrainedResult = v39;
      }
      else
      {
        v40 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v49 = self->_download;
          if (v49) {
            v49 = objc_getProperty(v49, v41, 32, 1);
          }
          id v50 = v49;
          *(_DWORD *)buf = 138412546;
          id v56 = v50;
          __int16 v57 = 2114;
          id v58 = v38;
          _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "[%@]: Unable to evaluate low data download: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  unint64_t v42 = self->_expensiveResult;
  if (v42 > 4) {
    unint64_t v43 = 62;
  }
  else {
    unint64_t v43 = qword_1004A0FC0[v42];
  }
  self->_interfaceMask = v43;
  if (!objc_msgSend(v5, "isExpensive", v52)
    || (unint64_t v44 = self->_expensiveResult & 0xFFFFFFFFFFFFFFFDLL, v44 != 1))
  {
    if (![v5 isConstrained]
      || (unint64_t v44 = self->_constrainedResult & 0xFFFFFFFFFFFFFFFDLL, v44 != 1))
    {
      LOBYTE(v44) = ([v5 isExpensive] & 1) == 0
                 && ![v5 isConstrained];
    }
  }
  self->_accessWasUnblocked = v44;
  [(Task *)self completeWithSuccess];
}

- (void).cxx_destruct
{
}

@end