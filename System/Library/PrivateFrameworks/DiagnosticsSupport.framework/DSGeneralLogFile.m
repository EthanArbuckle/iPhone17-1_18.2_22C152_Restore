@interface DSGeneralLogFile
- (BOOL)enumerateLogLinesWithIDs:(id)a3 usingBlock:(id)a4;
- (BOOL)parseDetailsWithURL:(id)a3;
- (BOOL)parseHeadersWithLine:(id)a3;
- (DSGeneralLogFile)initWithURL:(id)a3;
- (NSDate)logStartDate;
- (NSDate)restoreDate;
- (NSDate)updateDate;
- (NSString)currentOSVersion;
- (NSString)hardwareModel;
- (NSString)serialNumber;
- (NSURL)url;
- (int)logVersion;
@end

@implementation DSGeneralLogFile

- (DSGeneralLogFile)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSGeneralLogFile;
  v6 = [(DSGeneralLogFile *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    if (![(DSGeneralLogFile *)v7 parseDetailsWithURL:v5])
    {

      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)parseDetailsWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  id v5 = [v4 path];
  v6 = +[DSTextFile textFileWithPath:v5];

  if (v6)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __40__DSGeneralLogFile_parseDetailsWithURL___block_invoke;
    v9[3] = &unk_264930A98;
    objc_copyWeak(&v10, &location);
    v9[4] = &v12;
    [v6 enumerateUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v7 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __40__DSGeneralLogFile_parseDetailsWithURL___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a4 == 2)
    {
      v11 = [[DSLogLine alloc] initWithLine:v7];
      uint64_t v12 = v11;
      if (v11)
      {
        uint64_t v13 = [(DSLogLine *)v11 date];
        uint64_t v14 = (void *)WeakRetained[5];
        WeakRetained[5] = v13;
      }
      else
      {
        char v15 = DiagnosticLogHandleForCategory(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = WeakRetained[2];
          int v17 = 138412290;
          uint64_t v18 = v16;
          _os_log_impl(&dword_22CA94000, v15, OS_LOG_TYPE_DEFAULT, "Log appears to be empty: %@", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    else if (a4 == 1)
    {
      id v10 = objc_loadWeakRetained((id *)(a1 + 40));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v10 parseHeadersWithLine:v7];
    }
    else
    {
      [v8 end];
    }
  }
}

- (BOOL)parseHeadersWithLine:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  id v31 = 0;
  id v5 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v31];
  id v6 = v31;
  if (v5)
  {
    id v7 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", @"installed", @"model", @"os_build", @"serial", @"updated", @"version", 0);
    id v8 = (void *)MEMORY[0x263EFFA08];
    objc_super v9 = [v5 allKeys];
    id v10 = [v8 setWithArray:v9];

    [v7 minusSet:v10];
    uint64_t v11 = [v7 count];
    BOOL v12 = v11 == 0;
    if (v11)
    {
      uint64_t v13 = DiagnosticLogHandleForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[DSGeneralLogFile parseHeadersWithLine:]((uint64_t)self, v13);
      }
    }
    else
    {
      uint64_t v14 = +[DSDateFormatter sharedFormatter];
      char v15 = [v14 formatterWithType:2];
      uint64_t v16 = [v5 objectForKeyedSubscript:@"installed"];
      int v17 = [v15 dateFromString:v16];
      restoreDate = self->_restoreDate;
      self->_restoreDate = v17;

      uint64_t v19 = [v5 objectForKeyedSubscript:@"model"];
      hardwareModel = self->_hardwareModel;
      self->_hardwareModel = v19;

      v21 = [v5 objectForKeyedSubscript:@"os_build"];
      currentOSVersion = self->_currentOSVersion;
      self->_currentOSVersion = v21;

      v23 = [v5 objectForKeyedSubscript:@"serial"];
      serialNumber = self->_serialNumber;
      self->_serialNumber = v23;

      v25 = +[DSDateFormatter sharedFormatter];
      v26 = [v25 formatterWithType:2];
      v27 = [v5 objectForKeyedSubscript:@"updated"];
      v28 = [v26 dateFromString:v27];
      updateDate = self->_updateDate;
      self->_updateDate = v28;

      uint64_t v13 = [v5 objectForKeyedSubscript:@"version"];
      self->_logVersion = [v13 intValue];
    }
  }
  else
  {
    id v7 = DiagnosticLogHandleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(DSGeneralLogFile *)(uint64_t)self parseHeadersWithLine:v7];
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)enumerateLogLinesWithIDs:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v8 = [(DSGeneralLogFile *)self url];
  objc_super v9 = [v8 path];
  id v10 = +[DSTextFile textFileWithPath:v9];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__DSGeneralLogFile_enumerateLogLinesWithIDs_usingBlock___block_invoke;
  v14[3] = &unk_264930AC0;
  id v11 = v6;
  id v15 = v11;
  int v17 = &v18;
  id v12 = v7;
  id v16 = v12;
  [v10 enumerateUsingBlock:v14];
  LOBYTE(v8) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v8;
}

void __56__DSGeneralLogFile_enumerateLogLinesWithIDs_usingBlock___block_invoke(void *a1, void *a2, void *a3, unint64_t a4)
{
  id v14 = a2;
  id v7 = a3;
  uint64_t v8 = [v14 length];
  if (a4 >= 2 && v8)
  {
    objc_super v9 = (void *)MEMORY[0x230F72B40]();
    id v10 = [[DSLogLine alloc] initWithLine:v14];
    id v11 = v10;
    if (v10)
    {
      id v12 = (void *)a1[4];
      uint64_t v13 = [(DSLogLine *)v10 type];
      LODWORD(v12) = [v12 containsObject:v13];

      if (v12) {
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
      }
    }
  }
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    [v7 end];
  }
}

- (NSURL)url
{
  return self->_url;
}

- (NSDate)restoreDate
{
  return self->_restoreDate;
}

- (NSDate)updateDate
{
  return self->_updateDate;
}

- (NSDate)logStartDate
{
  return self->_logStartDate;
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (NSString)currentOSVersion
{
  return self->_currentOSVersion;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (int)logVersion
{
  return self->_logVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_currentOSVersion, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_logStartDate, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_restoreDate, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)parseHeadersWithLine:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_22CA94000, log, OS_LOG_TYPE_ERROR, "Could not parse header for %@ error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)parseHeadersWithLine:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_22CA94000, a2, OS_LOG_TYPE_ERROR, "One or more required keys are missing in the header for %@", (uint8_t *)&v3, 0xCu);
}

@end