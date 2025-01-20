@interface AudioSystemController
- (id)archiveNameTemplate;
- (id)testID;
- (void)performAnalysisOnAVResult:(id)a3 fromOutput:(id)a4 withSourceSignalData:(id)a5 intoDKResult:(id)a6 error:(id)a7;
@end

@implementation AudioSystemController

- (void)performAnalysisOnAVResult:(id)a3 fromOutput:(id)a4 withSourceSignalData:(id)a5 intoDKResult:(id)a6 error:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Calculating peak dB values for result %@", buf, 0xCu);
  }

  v16 = [(AudioSystemCommon *)self inputs];
  unsigned int v17 = [v16 isUsingDBValuesFromSystem];

  if (!v17)
  {
    v19 = [v11 data];
    id v23 = v14;
    v18 = +[AudioCrossCorrelation calculatePeakDBValueWithSourceSignalData:v12 resultSignalData:v19 error:&v23];
    id v20 = v23;

    id v14 = v20;
    if (v18) {
      goto LABEL_5;
    }
LABEL_7:
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"Failed to generate DB Value.";
    v21 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v22 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-65 userInfo:v21];

    [(AudioSystemCommon *)self failedToExecuteWithError:v22];
    goto LABEL_8;
  }
  [v11 correlationValue];
  v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  if (!v18) {
    goto LABEL_7;
  }
LABEL_5:
  [v13 setDbValue:v18];
LABEL_8:
}

- (id)archiveNameTemplate
{
  return @"com.apple.Diagnostics.8079.XXXXXXXX";
}

- (id)testID
{
  return &off_100011000;
}

@end