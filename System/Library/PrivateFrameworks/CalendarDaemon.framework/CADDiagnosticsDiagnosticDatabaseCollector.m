@interface CADDiagnosticsDiagnosticDatabaseCollector
- (BOOL)collectDiagnosticsDatabase:(id)a3;
- (void)collect:(id)a3;
- (void)determineExpectedOutputFiles:(id)a3;
@end

@implementation CADDiagnosticsDiagnosticDatabaseCollector

- (void)determineExpectedOutputFiles:(id)a3
{
  id v7 = a3;
  if (CalendarDiagnosticsLibraryCore())
  {
    if ([v7 redactLogs]) {
      v4 = @"Diagnostics-redacted.db.gz";
    }
    else {
      v4 = @"Diagnostics.db.gz";
    }
    v5 = [v7 temporaryFileForName:v4];
    outputURL = self->_outputURL;
    self->_outputURL = v5;

    [v7 setStatus:0 forFile:self->_outputURL];
  }
  else
  {
    [v7 logError:@"CalendarDiagnostics not loaded; no diagnostics database will be attached"];
  }
}

- (void)collect:(id)a3
{
  id v5 = a3;
  if ([(CADDiagnosticsDiagnosticDatabaseCollector *)self collectDiagnosticsDatabase:v5]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }
  [v5 setStatus:v4 forFile:self->_outputURL];
}

- (BOOL)collectDiagnosticsDatabase:(id)a3
{
  id v4 = a3;
  if (CalendarDiagnosticsLibraryCore())
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    id v5 = (void *)getCalDiagObfuscatorClass_softClass;
    uint64_t v24 = getCalDiagObfuscatorClass_softClass;
    if (!getCalDiagObfuscatorClass_softClass)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __getCalDiagObfuscatorClass_block_invoke;
      v20[3] = &unk_1E624EC50;
      v20[4] = &v21;
      __getCalDiagObfuscatorClass_block_invoke((uint64_t)v20);
      id v5 = (void *)v22[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v21, 8);
    if (v6)
    {
      id v7 = [(NSURL *)self->_outputURL lastPathComponent];
      v8 = [v7 stringByDeletingPathExtension];

      v9 = [v4 temporaryFileForName:v8];
      v10 = objc_msgSend((id)objc_msgSend(v6, "alloc"), "initWithTargetDatabase:", v9);
      if ([v4 redactLogs])
      {
        uint64_t v19 = 0;
        v11 = (id *)&v19;
        int v12 = [v10 obfuscateWithContext:v4 error:&v19];
      }
      else
      {
        uint64_t v18 = 0;
        v11 = (id *)&v18;
        int v12 = [v10 copyWithoutObfuscatingWithContext:v4 error:&v18];
      }
      int v15 = v12;
      id v16 = *v11;
      if (![v4 canceled] && v15)
      {
        if (+[CADDiagnosticsUtils compressFileAt:v9 to:self->_outputURL context:v4])
        {
          [v4 deleteTemporaryFile:v9];
          BOOL v14 = 1;
LABEL_17:

          goto LABEL_18;
        }
        [v4 deleteTemporaryFile:self->_outputURL];
      }
      [v4 deleteTemporaryFile:v9];
      [v4 log:@"Error attaching diagnostics database. Diagnostics database will NOT be attached: %@", v16];
      BOOL v14 = 0;
      goto LABEL_17;
    }
    v13 = @"CalDiagObfuscator not loaded; no diagnostics database will be attached";
  }
  else
  {
    v13 = @"CalendarDiagnostics not loaded; no diagnostics database will be attached";
  }
  [v4 logError:v13];
  BOOL v14 = 0;
LABEL_18:

  return v14;
}

- (void).cxx_destruct
{
}

@end