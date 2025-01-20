@interface XRXMLProblemReportingContext
- (BOOL)passed;
- (NSFileHandle)errorFile;
- (NSURL)urlBeingParsed;
- (OS_os_log)log;
- (XRXMLProblemReportingContext)init;
- (void)reportProblemWithElement:(id)a3 failure:(id)a4;
- (void)reportWarningWithElement:(id)a3 failure:(id)a4;
- (void)setErrorFile:(id)a3;
- (void)setLog:(id)a3;
- (void)setPassed:(BOOL)a3;
- (void)setUrlBeingParsed:(id)a3;
@end

@implementation XRXMLProblemReportingContext

- (XRXMLProblemReportingContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)XRXMLProblemReportingContext;
  v2 = [(XRXMLProblemReportingContext *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_log, MEMORY[0x263EF8440]);
    v3->_passed = 1;
  }
  return v3;
}

- (void)reportProblemWithElement:(id)a3 failure:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (objc_class *)NSString;
  id v8 = a4;
  id v9 = [v7 alloc];
  v12 = [v9 initWithFormat:v10 arguments:(v8, &v45, v11)];

  if ([v12 length:v13, v14, v15, v16])
  {
    v21 = [self->_urlBeingParsed _path:v17 relativeToURL:v18];
    errorFile = self->_errorFile;
    v27 = [v6 lineAndColumnForElementStart:v23 column:v24 element:v25 line:v26];
    [errorFile writeStringWithFormat:@"%@:%@: error: %@\n", v29, v30, v21, v27, v12];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v32 = log;
      v37 = [v6 lineAndColumnForElementStart:v33 column:v34 element:v35 line:v36];
      *(_DWORD *)buf = 138412802;
      v39 = v21;
      __int16 v40 = 2112;
      v41 = v37;
      __int16 v42 = 2112;
      v43 = v12;
      _os_log_error_impl(&dword_234574000, v32, OS_LOG_TYPE_ERROR, "%@:%@: error: %@\n", buf, 0x20u);
    }
    self->_passed = 0;
  }
}

- (void)reportWarningWithElement:(id)a3 failure:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (objc_class *)NSString;
  id v8 = a4;
  id v9 = [v7 alloc];
  v12 = [v9 initWithFormat:v10 arguments:v8];

  if ([v12 length:v13, v14, v15, v16])
  {
    v21 = [self->_urlBeingParsed _path:v17 relativeToURL:v18];
    errorFile = self->_errorFile;
    v27 = [v6 lineAndColumnForElementStart:v23 column:v24 element:v25 line:v26];
    [errorFile writeStringWithFormat:@"%@:%@: warning: %@\n", v29, v30, v21, v27, v12];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v32 = log;
      v37 = [v6 lineAndColumnForElementStart:v33 column:v34 element:v35 line:v36];
      *(_DWORD *)buf = 138412802;
      v39 = v21;
      __int16 v40 = 2112;
      v41 = v37;
      __int16 v42 = 2112;
      v43 = v12;
      _os_log_error_impl(&dword_234574000, v32, OS_LOG_TYPE_ERROR, "%@:%@: warning: %@\n", buf, 0x20u);
    }
  }
}

- (NSFileHandle)errorFile
{
  return self->_errorFile;
}

- (void)setErrorFile:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSURL)urlBeingParsed
{
  return self->_urlBeingParsed;
}

- (void)setUrlBeingParsed:(id)a3
{
}

- (BOOL)passed
{
  return self->_passed;
}

- (void)setPassed:(BOOL)a3
{
  self->_passed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBeingParsed, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_errorFile, 0);
}

@end