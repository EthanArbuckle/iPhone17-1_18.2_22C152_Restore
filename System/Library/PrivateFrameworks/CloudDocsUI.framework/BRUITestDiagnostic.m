@interface BRUITestDiagnostic
- (BOOL)writeToDiskWithError:(id *)a3;
- (BRUITestDiagnostic)initWithOutputDirectoryPath:(id)a3;
- (void)addDiagnosticData:(id)a3 forFilename:(id)a4;
- (void)addDiagnosticData:(id)a3 forFilename:(id)a4 sectionName:(id)a5;
@end

@implementation BRUITestDiagnostic

- (BRUITestDiagnostic)initWithOutputDirectoryPath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRUITestDiagnostic;
  v6 = [(BRUITestDiagnostic *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDirectoryPath, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    diagnosticDataBySectionName = v7->_diagnosticDataBySectionName;
    v7->_diagnosticDataBySectionName = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)addDiagnosticData:(id)a3 forFilename:(id)a4
{
}

- (void)addDiagnosticData:(id)a3 forFilename:(id)a4 sectionName:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (__CFString *)a5;
  if (v9) {
    v10 = v9;
  }
  else {
    v10 = @"_kBRUITestDiagnosticDefaultSectionName";
  }
  objc_super v11 = [(NSMutableDictionary *)self->_diagnosticDataBySectionName objectForKeyedSubscript:v10];
  if (!v11)
  {
    objc_super v11 = [MEMORY[0x263EFF9A0] dictionary];
    [(NSMutableDictionary *)self->_diagnosticDataBySectionName setObject:v11 forKeyedSubscript:v10];
  }
  [v11 setObject:v12 forKeyedSubscript:v8];
}

- (BOOL)writeToDiskWithError:(id *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = self->_outputDirectoryPath;
  id v49 = 0;
  v39 = v5;
  char v7 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v49];
  id v8 = v49;
  v9 = v8;
  if (v7) {
    goto LABEL_4;
  }
  v10 = [v8 domain];
  if (([v10 isEqualToString:*MEMORY[0x263F07F70]] & 1) == 0)
  {

LABEL_28:
    BOOL v30 = 0;
    if (a3) {
      *a3 = v9;
    }
    goto LABEL_32;
  }
  uint64_t v11 = [v9 code];

  if (v11 != 516) {
    goto LABEL_28;
  }
LABEL_4:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v12 = self->_diagnosticDataBySectionName;
  uint64_t v34 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v34)
  {
    uint64_t v13 = *(void *)v46;
    v40 = a3;
    v37 = v9;
    v38 = v6;
    uint64_t v32 = *(void *)v46;
    v33 = self;
    v36 = v12;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v12);
        }
        uint64_t v35 = v14;
        v15 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
        int v16 = [v15 isEqualToString:@"_kBRUITestDiagnosticDefaultSectionName"];
        if (v16)
        {
          v17 = v6;
        }
        else
        {
          v17 = [(NSString *)v6 stringByAppendingPathComponent:v15];
        }
        v18 = v17;
        v19 = [(NSMutableDictionary *)self->_diagnosticDataBySectionName objectForKeyedSubscript:v15];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          int v23 = 0;
          uint64_t v24 = *(void *)v42;
          while (2)
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v42 != v24) {
                objc_enumerationMutation(v20);
              }
              uint64_t v26 = *(void *)(*((void *)&v41 + 1) + 8 * i);
              if (((v16 | v23) & 1) == 0)
              {
                if (![v39 createDirectoryAtPath:v18 withIntermediateDirectories:0 attributes:0 error:a3])goto LABEL_26; {
                int v23 = 1;
                }
                a3 = v40;
              }
              v27 = [v20 objectForKeyedSubscript:v26];
              v28 = [(NSString *)v18 stringByAppendingPathComponent:v26];
              int v29 = [v27 writeToFile:v28 options:1 error:a3];

              if (!v29)
              {
LABEL_26:

                BOOL v30 = 0;
                v9 = v37;
                v6 = v38;
                id v12 = v36;
                goto LABEL_31;
              }
              a3 = v40;
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v50 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        uint64_t v14 = v35 + 1;
        v9 = v37;
        v6 = v38;
        uint64_t v13 = v32;
        self = v33;
        id v12 = v36;
      }
      while (v35 + 1 != v34);
      BOOL v30 = 1;
      uint64_t v34 = [(NSMutableDictionary *)v36 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v34);
  }
  else
  {
    BOOL v30 = 1;
  }
LABEL_31:

LABEL_32:
  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticDataBySectionName, 0);

  objc_storeStrong((id *)&self->_outputDirectoryPath, 0);
}

@end