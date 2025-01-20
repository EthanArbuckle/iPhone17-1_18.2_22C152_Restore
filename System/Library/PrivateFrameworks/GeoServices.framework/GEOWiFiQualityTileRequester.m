@interface GEOWiFiQualityTileRequester
+ ($D10D8C5E6DF5C70B839224840994203A)requestKind;
- (void)cancel;
- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4;
@end

@implementation GEOWiFiQualityTileRequester

+ ($D10D8C5E6DF5C70B839224840994203A)requestKind
{
  return ($D10D8C5E6DF5C70B839224840994203A)2858;
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  id v5 = a4;
  v6 = [v5 error];

  if (v6)
  {
    v7 = [v5 error];
    id v8 = 0;
    id v9 = 0;
  }
  else
  {
    id v18 = 0;
    id v19 = 0;
    unsigned __int8 v10 = [v5 didValidateEntityTagForData:&v19 entityTag:&v18];
    id v9 = v19;
    id v8 = v18;
    if (v10)
    {
      v7 = 0;
    }
    else
    {
      v11 = [v5 receivedData];

      if (v11)
      {
        uint64_t v12 = [v5 receivedData];

        uint64_t v13 = [v5 entityTag];

        v7 = 0;
        id v8 = (id)v13;
        id v9 = (id)v12;
      }
      else
      {
        v7 = +[NSError GEOErrorWithCode:-8 reason:@"unexpected empty data"];
      }
    }
  }
  (*((void (**)(void))self->_completion + 2))();
  id v14 = [(id)objc_opt_class() requestKind];
  v15 = [self->_auditToken bundleIdForNetworkAttribution];
  v16 = [v5 error];
  v17 = [v5 clientMetrics];
  +[GEONetworkEventDataRecorder recordNetworkEventDataForDataRequestKind:v14 usedBackgroundURL:&__kCFBooleanFalse requestAppIdentifier:v15 appMajorVersion:0 appMinorVersion:0 error:v16 clientMetrics:v17 additionalStates:0];
}

- (void)cancel
{
  [(GEODataURLSessionTask *)self->_task cancel];
  task = self->_task;
  self->_task = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong(&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_eTag, 0);

  objc_storeStrong((id *)&self->_tileKey, 0);
}

@end