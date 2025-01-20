@interface BLReviewNetworkPolicyOperation
- (BLCellularNetworkEvaluatorOperation)cellularNetworkEvaluatorOperation;
- (BLEvaluatorDownload)download;
- (BLReviewNetworkPolicyOperation)initWithDownload:(id)a3;
- (BOOL)suppressDialogs;
- (BUCellularIdentity)cellularIdentity;
- (int64_t)cellularResult;
- (void)run;
- (void)setCellularIdentity:(id)a3;
- (void)setCellularNetworkEvaluatorOperation:(id)a3;
- (void)setCellularResult:(int64_t)a3;
- (void)setDownload:(id)a3;
- (void)setSuppressDialogs:(BOOL)a3;
@end

@implementation BLReviewNetworkPolicyOperation

- (BLReviewNetworkPolicyOperation)initWithDownload:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLReviewNetworkPolicyOperation;
  id v6 = [(BLOperation *)&v9 init];
  v7 = (BLReviewNetworkPolicyOperation *)v6;
  if (v6) {
    objc_storeStrong((id *)v6 + 11, a3);
  }

  return v7;
}

- (void)run
{
  v3 = +[BLNetworkMonitor defaultMonitor];
  int v4 = *((unsigned __int8 *)&self->super._success + 1);
  download = self->_download;
  if (download)
  {
    id v6 = download;
    v7 = 0;
LABEL_5:
    unint64_t v10 = *(void *)&self->_suppressDialogs;
    BOOL v11 = v10 > 4;
    uint64_t v12 = (1 << v10) & 0x19;
    if (!v11 && v12 != 0)
    {
      v14 = +[BLCellularNetworkEvaluator evaluatorForIdentity:v6];
      *(void *)&self->_suppressDialogs = [v14 evaluateForDownload:self->_cellularResult];
    }
    if (v4
      || ((v15 = *(void *)&self->_suppressDialogs, BOOL v11 = v15 > 4, v16 = (1 << v15) & 0x15, !v11)
        ? (BOOL v17 = v16 == 0)
        : (BOOL v17 = 1),
          v17 || ![v3 isExpensive]))
    {
      id v9 = v7;
    }
    else
    {
      cellularIdentity = self->_cellularIdentity;
      if (cellularIdentity) {
        v19 = cellularIdentity;
      }
      else {
        v19 = objc_alloc_init(BLCellularNetworkEvaluatorOperation);
      }
      v25 = v19;
      [(BLCellularNetworkEvaluatorOperation *)v19 setCellularDownload:self->_cellularResult];
      [(BLCellularNetworkEvaluatorOperation *)v25 setCellularIdentity:v6];
      id v29 = v7;
      unsigned int v26 = [(BLOperation *)self runSubOperation:v25 returningError:&v29];
      id v9 = v29;

      if (v26)
      {
        *(void *)&self->_suppressDialogs = [(BLCellularNetworkEvaluatorOperation *)v25 evaluatorResult];
      }
      else
      {
        v27 = BLServiceLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = [self->_cellularResult logKey];
          *(_DWORD *)buf = 138543618;
          v32 = v28;
          __int16 v33 = 2112;
          id v34 = v9;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[%{public}@]: Unable to evaluate cellular download:  %@", buf, 0x16u);
        }
      }
    }
    goto LABEL_12;
  }
  v8 = +[BLNetworkMonitor defaultMonitor];
  id v30 = 0;
  id v6 = (BLEvaluatorDownload *)[v8 copyCellularNetworkIdentityWithError:&v30];
  id v9 = v30;

  if (v6)
  {
    v7 = v9;
    goto LABEL_5;
  }
  unint64_t v20 = *(void *)&self->_suppressDialogs;
  BOOL v11 = v20 > 4;
  uint64_t v21 = (1 << v20) & 0x19;
  if (v11 || v21 == 0)
  {
    id v6 = 0;
  }
  else
  {
    v23 = BLServiceLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [self->_cellularResult logKey];
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%{public}@]: Unable to evaluate cellular download:  %@", buf, 0x16u);
    }
    id v6 = 0;
    *(void *)&self->_suppressDialogs = 4;
  }
LABEL_12:
  self->super._success = 1;
}

- (int64_t)cellularResult
{
  return *(void *)&self->_suppressDialogs;
}

- (void)setCellularResult:(int64_t)a3
{
  *(void *)&self->_suppressDialogs = a3;
}

- (BOOL)suppressDialogs
{
  return *(&self->super._success + 1);
}

- (void)setSuppressDialogs:(BOOL)a3
{
  *(&self->super._success + 1) = a3;
}

- (BLEvaluatorDownload)download
{
  return (BLEvaluatorDownload *)self->_cellularResult;
}

- (void)setDownload:(id)a3
{
}

- (BUCellularIdentity)cellularIdentity
{
  return (BUCellularIdentity *)self->_download;
}

- (void)setCellularIdentity:(id)a3
{
}

- (BLCellularNetworkEvaluatorOperation)cellularNetworkEvaluatorOperation
{
  return (BLCellularNetworkEvaluatorOperation *)self->_cellularIdentity;
}

- (void)setCellularNetworkEvaluatorOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularIdentity, 0);
  objc_storeStrong((id *)&self->_download, 0);

  objc_storeStrong((id *)&self->_cellularResult, 0);
}

@end