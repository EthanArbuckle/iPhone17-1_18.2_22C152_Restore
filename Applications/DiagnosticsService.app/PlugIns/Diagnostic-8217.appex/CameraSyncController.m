@interface CameraSyncController
- (CameraSyncInputs)inputs;
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

@implementation CameraSyncController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  id v22 = 0;
  v3 = [(CameraSyncController *)self findRequestedHardwareDiagnostic:&v22];
  id v4 = v22;
  v5 = v4;
  if (!v3)
  {
    id v7 = v4;
LABEL_11:
    [(CameraSyncController *)self finishWithError:v5];
    goto LABEL_14;
  }
  id v21 = v4;
  v6 = [(CameraSyncController *)self runRequestedHardwareDiagnostic:v3 error:&v21];
  id v7 = v21;

  if (!v6)
  {
    v5 = v7;
    goto LABEL_11;
  }
  uint64_t v8 = [v6 results];
  if (v8
    && (v9 = (void *)v8,
        [v6 results],
        v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 count],
        v10,
        v9,
        v11))
  {
    v12 = [(CameraSyncController *)self processResultsForReport:v6];
    uint64_t v13 = [v12 valueForKey:@"results"];
    if (v13
      && (v14 = (void *)v13,
          [v12 valueForKey:@"errorCounters"],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      v16 = [(CameraSyncController *)self result];
      [v16 setData:v12];

      v17 = [v6 error];
      [(CameraSyncController *)self finishWithError:v17];
    }
    else
    {
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      v18 = +[NSString stringWithFormat:@"Camera Sync report is incomplete. Processed result: %@", v12];
      v24 = v18;
      v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v20 = +[NSError errorWithDomain:@"com.apple.DiagnosticsService.Diagnostic-8217.errorDomain" code:-9 userInfo:v19];

      [(CameraSyncController *)self finishWithError:v20];
      id v7 = (id)v20;
    }
  }
  else
  {
    v12 = [v6 error];
    [(CameraSyncController *)self finishWithError:v12];
  }

LABEL_14:
}

- (id)processResultsForReport:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v33 = objc_opt_new();
  v5 = [v3 dictionaryRepresentation];
  v6 = [v5 valueForKey:@"results"];

  if (v6)
  {
    id v30 = v3;
    [v5 objectForKeyedSubscript:@"results"];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v32 = *(void *)v35;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v42[0] = @"name";
          id v11 = [v10 objectForKeyedSubscript:@"name"];
          v12 = stringOrNull(v11);
          v42[1] = @"value";
          v43[0] = v12;
          uint64_t v13 = [v10 objectForKeyedSubscript:@"measurement"];
          v14 = [v13 objectForKeyedSubscript:@"value"];
          v15 = numberOrNull(v14);
          v43[1] = v15;
          v16 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
          [v33 addObject:v16];
        }
        id v8 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v8);
    }
    CFStringRef v40 = @"results";
    v41 = v33;
    v17 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    [v4 addEntriesFromDictionary:v17];

    id v3 = v30;
  }
  uint64_t v18 = [v3 auxiliaryData];
  if (v18)
  {
    v19 = (void *)v18;
    uint64_t v20 = [v3 auxiliaryData];
    uint64_t v21 = [v20 valueForKey:@"experiment"];
    if (v21)
    {
      id v22 = (void *)v21;
      NSErrorUserInfoKey v23 = [v3 auxiliaryData];
      v24 = [v23 objectForKeyedSubscript:@"experiment"];
      v25 = [v24 valueForKey:@"ErrorCounters"];

      if (!v25) {
        goto LABEL_15;
      }
      v19 = objc_opt_new();
      v26 = [v3 auxiliaryData];
      v27 = [v26 objectForKeyedSubscript:@"experiment"];
      uint64_t v20 = [v27 objectForKeyedSubscript:@"ErrorCounters"];

      [v19 addObjectsFromArray:v20];
      CFStringRef v38 = @"errorCounters";
      v39 = v20;
      v28 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      [v4 addEntriesFromDictionary:v28];
    }
  }
LABEL_15:

  return v4;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100002C58((uint64_t)v4, v5);
    }

    v6 = [v4 domain];
    unsigned int v7 = [v6 isEqualToString:@"com.apple.DiagnosticsService.Diagnostic-8217.errorDomain"];

    if (v7)
    {
      id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
      v9 = [(CameraSyncController *)self result];
      [v9 setStatusCode:v8];
    }
    else
    {
      id v11 = [v4 domain];
      unsigned int v12 = [v11 isEqualToString:HDErrorDomain];

      if (v12)
      {
        uint64_t v13 = [(CameraSyncController *)self result];
        id v8 = v13;
        v14 = &off_100004488;
      }
      else
      {
        v15 = [v4 domain];
        unsigned int v16 = [v15 isEqualToString:HDIOReportErrorDomain];

        if (v16)
        {
          uint64_t v13 = [(CameraSyncController *)self result];
          id v8 = v13;
          v14 = &off_1000044A0;
        }
        else
        {
          v17 = [v4 domain];
          unsigned int v18 = [v17 isEqualToString:HDCapturePlugInErrorDomain];

          if (v18)
          {
            id v19 = [v4 code];
            uint64_t v13 = [(CameraSyncController *)self result];
            id v8 = v13;
            if (v19 == (id)213) {
              v14 = &off_1000044B8;
            }
            else {
              v14 = &off_1000044D0;
            }
          }
          else
          {
            uint64_t v13 = [(CameraSyncController *)self result];
            id v8 = v13;
            v14 = &off_1000044E8;
          }
        }
      }
      [v13 setStatusCode:v14];
    }

    v27[0] = @"code";
    uint64_t v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    v28[0] = v20;
    v27[1] = @"domain";
    uint64_t v21 = [v4 domain];
    v28[1] = v21;
    v27[2] = @"description";
    id v22 = [v4 localizedDescription];
    v28[2] = v22;
    v10 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

    NSErrorUserInfoKey v23 = [(CameraSyncController *)self result];
    v24 = [v23 data];
    v25 = +[NSMutableDictionary dictionaryWithDictionary:v24];

    [v25 setObject:v10 forKeyedSubscript:@"error"];
    v26 = [(CameraSyncController *)self result];
    [v26 setData:v25];
  }
  else
  {
    v10 = [(CameraSyncController *)self result];
    [v10 setStatusCode:&off_100004500];
  }

  [(CameraSyncController *)self setFinished:1];
}

- (id)findRequestedHardwareDiagnostic:(id *)a3
{
  v5 = +[HDLab defaultLab];
  v6 = [(CameraSyncController *)self inputs];
  unsigned int v7 = [v6 type];
  id v8 = [v7 unsignedIntegerValue];

  if (v8)
  {
    if (v8 != (id)1)
    {
      v14 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100002CD0(self, v14);
      }

      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      unsigned int v12 = [(CameraSyncController *)self inputs];
      uint64_t v13 = [v12 type];
      v15 = +[NSString stringWithFormat:@"Unrecognized camera sync group with type (%@).", v13];
      uint64_t v21 = v15;
      unsigned int v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      *a3 = +[NSError errorWithDomain:@"com.apple.DiagnosticsService.Diagnostic-8217.errorDomain" code:-10 userInfo:v16];

      goto LABEL_11;
    }
    CFStringRef v9 = @"CameraSyncDiagnostic.Back";
  }
  else
  {
    CFStringRef v9 = @"CameraSyncDiagnostic.Front";
  }
  v10 = [v5 availableDiagnostics];
  id v11 = [v10 objectForKeyedSubscript:v9];

  if (a3 && !v11)
  {
    unsigned int v12 = +[NSString stringWithFormat:@"Could not find requested hardware diagnostic (%@).", v9, NSLocalizedDescriptionKey];
    id v19 = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    *a3 = +[NSError errorWithDomain:@"com.apple.DiagnosticsService.Diagnostic-8217.errorDomain" code:-1 userInfo:v13];
LABEL_11:

    id v11 = 0;
  }

  return v11;
}

- (id)runRequestedHardwareDiagnostic:(id)a3 error:(id *)a4
{
  uint64_t v18 = HDDiagnosticExperimentParametersKey;
  CFStringRef v16 = @"duration";
  id v6 = a3;
  unsigned int v7 = [(CameraSyncController *)self inputs];
  id v8 = [v7 duration];
  v17 = v8;
  CFStringRef v9 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v19 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  id v11 = [v6 runWithParameters:v10 host:self error:a4];

  if (a4 && !v11)
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"No report, nor error were retrieved.";
    unsigned int v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    *a4 = +[NSError errorWithDomain:@"com.apple.DiagnosticsService.Diagnostic-8217.errorDomain" code:-3 userInfo:v12];
  }

  return v11;
}

- (id)retrieveAssetByName:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)workingDirectory
{
  v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingString:@"com.apple.DiagnosticsService-8217"];
  id v4 = +[NSURL fileURLWithPath:v3];

  return v4;
}

- (CameraSyncInputs)inputs
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