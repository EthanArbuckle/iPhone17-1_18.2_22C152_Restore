@interface PearlErrorDataController
- (PearlErrorDataInputs)inputs;
- (id)findRequestedHardwareDiagnostic:(id *)a3;
- (id)processResultsForReport:(id)a3;
- (id)retrieveAssetByName:(id)a3 error:(id *)a4;
- (id)runRequestedHardwareDiagnostic:(id)a3 error:(id *)a4;
- (id)workingDirectory;
- (void)finishWithError:(id)a3;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation PearlErrorDataController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  id v16 = 0;
  v3 = [(PearlErrorDataController *)self findRequestedHardwareDiagnostic:&v16];
  id v4 = v16;
  v5 = v4;
  if (!v3)
  {
    id v7 = v4;
LABEL_9:
    [(PearlErrorDataController *)self finishWithError:v5];
    goto LABEL_10;
  }
  id v15 = v4;
  v6 = [(PearlErrorDataController *)self runRequestedHardwareDiagnostic:v3 error:&v15];
  id v7 = v15;

  if (!v6)
  {
    v5 = v7;
    goto LABEL_9;
  }
  uint64_t v8 = [v6 results];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [v6 results];
    id v11 = [v10 count];

    if (v11)
    {
      v12 = [(PearlErrorDataController *)self processResultsForReport:v6];
      v13 = [(PearlErrorDataController *)self result];
      [v13 setData:v12];
    }
  }
  v14 = [v6 error];
  [(PearlErrorDataController *)self finishWithError:v14];

LABEL_10:
}

- (id)processResultsForReport:(id)a3
{
  id v3 = a3;
  v21 = objc_opt_new();
  v18 = v3;
  id v4 = [v3 dictionaryRepresentation];
  v5 = [v4 objectForKeyedSubscript:@"results"];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v28[0] = @"name";
        v10 = [v9 objectForKeyedSubscript:@"name"];
        id v11 = stringOrNull(v10);
        v28[1] = @"value";
        v29[0] = v11;
        v12 = [v9 objectForKeyedSubscript:@"measurement"];
        v13 = [v12 objectForKeyedSubscript:@"value"];
        v14 = numberOrNull(v13);
        v29[1] = v14;
        id v15 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
        [v21 addObject:v15];
      }
      id v7 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v7);
  }

  CFStringRef v26 = @"results";
  v27 = v21;
  id v16 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

  return v16;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100002D48((uint64_t)v4, v5);
    }

    id v6 = [v4 domain];
    unsigned int v7 = [v6 isEqualToString:@"com.apple.DiagnosticsService.Diagnostic-8068.errorDomain"];

    if (v7)
    {
      uint64_t v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
      v9 = [(PearlErrorDataController *)self result];
      [v9 setStatusCode:v8];
    }
    else
    {
      id v11 = [v4 domain];
      unsigned int v12 = [v11 isEqualToString:HDErrorDomain];

      if (v12)
      {
        v13 = [(PearlErrorDataController *)self result];
        uint64_t v8 = v13;
        v14 = &off_100004440;
      }
      else
      {
        id v15 = [v4 domain];
        unsigned int v16 = [v15 isEqualToString:HDIOReportErrorDomain];

        if (v16)
        {
          v13 = [(PearlErrorDataController *)self result];
          uint64_t v8 = v13;
          v14 = &off_100004458;
        }
        else
        {
          v17 = [v4 domain];
          unsigned int v18 = [v17 isEqualToString:HDCapturePlugInErrorDomain];

          if (v18)
          {
            id v19 = [v4 code];
            v13 = [(PearlErrorDataController *)self result];
            uint64_t v8 = v13;
            if (v19 == (id)213) {
              v14 = &off_100004470;
            }
            else {
              v14 = &off_100004488;
            }
          }
          else
          {
            v13 = [(PearlErrorDataController *)self result];
            uint64_t v8 = v13;
            v14 = &off_1000044A0;
          }
        }
      }
      [v13 setStatusCode:v14];
    }

    v27[0] = @"code";
    uint64_t v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    v28[0] = v20;
    v27[1] = @"domain";
    v21 = [v4 domain];
    v28[1] = v21;
    v27[2] = @"description";
    long long v22 = [v4 localizedDescription];
    void v28[2] = v22;
    v10 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

    long long v23 = [(PearlErrorDataController *)self result];
    long long v24 = [v23 data];
    long long v25 = +[NSMutableDictionary dictionaryWithDictionary:v24];

    [v25 setObject:v10 forKeyedSubscript:@"error"];
    CFStringRef v26 = [(PearlErrorDataController *)self result];
    [v26 setData:v25];
  }
  else
  {
    v10 = [(PearlErrorDataController *)self result];
    [v10 setStatusCode:&off_1000044B8];
  }

  [(PearlErrorDataController *)self setFinished:1];
}

- (id)findRequestedHardwareDiagnostic:(id *)a3
{
  v5 = +[HDLab defaultLab];
  id v6 = [(PearlErrorDataController *)self inputs];
  unsigned int v7 = [v6 testType];
  id v8 = [v7 unsignedIntegerValue];

  if (v8 == (id)1) {
    CFStringRef v9 = @"PearlFaultDiagnostic";
  }
  else {
    CFStringRef v9 = @"PearlIOReportDiagnostic";
  }
  v10 = [v5 availableDiagnostics];
  id v11 = [v10 objectForKeyedSubscript:v9];

  if (a3 && !v11)
  {
    unsigned int v12 = +[NSString stringWithFormat:@"Could not find requested hardware diagnostic (%@).", v9, NSLocalizedDescriptionKey];
    unsigned int v16 = v12;
    v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    *a3 = +[NSError errorWithDomain:@"com.apple.DiagnosticsService.Diagnostic-8068.errorDomain" code:-1 userInfo:v13];
  }

  return v11;
}

- (id)runRequestedHardwareDiagnostic:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [(PearlErrorDataController *)self inputs];
  id v8 = [v7 testType];
  id v9 = [v8 unsignedIntegerValue];

  if (v9 == (id)1)
  {
    v29[0] = HDDiagnosticAnalysisParametersKey;
    CFStringRef v27 = @"frameCount";
    long long v22 = [(PearlErrorDataController *)self inputs];
    v21 = [v22 frameCount];
    v28 = v21;
    v10 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v30[0] = v10;
    v29[1] = HDDiagnosticExperimentParametersKey;
    v25[0] = @"frameCount";
    id v11 = [(PearlErrorDataController *)self inputs];
    unsigned int v12 = [v11 frameCount];
    v25[1] = @"timeout";
    v26[0] = v12;
    v13 = [(PearlErrorDataController *)self inputs];
    v14 = [v13 timeout];
    v26[1] = v14;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    v30[1] = v15;
    unsigned int v16 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  }
  else
  {
    unsigned int v16 = &__NSDictionary0__struct;
  }
  uint64_t v17 = [v6 runWithParameters:v16 host:self error:a4];
  unsigned int v18 = (void *)v17;
  if (a4 && !v17)
  {
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"No report, nor error were retrieved.";
    id v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    *a4 = +[NSError errorWithDomain:@"com.apple.DiagnosticsService.Diagnostic-8068.errorDomain" code:-3 userInfo:v19];
  }

  return v18;
}

- (id)retrieveAssetByName:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)workingDirectory
{
  v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingString:@"com.apple.DiagnosticsService.Diagnostic-8068"];
  id v4 = +[NSURL fileURLWithPath:v3];

  return v4;
}

- (PearlErrorDataInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end