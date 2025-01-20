@interface _EARmil2BnnsCompiler
+ (BOOL)validateBnnsIr:(id)a3;
+ (void)compileWithModelMilPath:(id)a3 bnnsIrOutPath:(id)a4 milConfigPath:(id)a5 errorOut:(id *)a6;
+ (void)initialize;
@end

@implementation _EARmil2BnnsCompiler

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

+ (void)compileWithModelMilPath:(id)a3 bnnsIrOutPath:(id)a4 milConfigPath:(id)a5 errorOut:(id *)a6
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10)
    {
      v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v13 = [v12 fileExistsAtPath:v9];

      if (v13)
      {
        objc_msgSend(v9, "ear_toString");
        objc_msgSend(v10, "ear_toString");
        if (v11)
        {
          objc_msgSend(v11, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          uint64_t v25 = 0;
        }
        BOOL v20 = kaldi::quasar::onDeviceMil2BnnsCompile(&v28, (uint64_t)&v26, (uint64_t)__p);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        if (v27 < 0) {
          operator delete(v26);
        }
        if (v29 < 0) {
          operator delete((void *)v28);
        }
        v21 = @"mil2Bnns compilation failed with unknown error";
        if (v20) {
          v21 = &stru_1F0A64AB0;
        }
        v22 = v21;
        v15 = v22;
        if (!a6 || v20) {
          goto LABEL_25;
        }
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v30 = *MEMORY[0x1E4F28568];
        v31 = v22;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        v17 = [v23 errorWithDomain:@"com.apple.siri.quasar.mil2BnnsCompilation" code:3 userInfo:v16];
LABEL_24:
        *a6 = v17;

LABEL_25:
        goto LABEL_26;
      }
      if (a6)
      {
        v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = *MEMORY[0x1E4F28568];
        v15 = [NSString stringWithFormat:@"bnns.mil file is not found"];
        v33 = v15;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        v17 = [v19 errorWithDomain:@"com.apple.siri.quasar.mil2BnnsCompilation" code:0 userInfo:v16];
        goto LABEL_24;
      }
    }
    else if (a6)
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      v15 = [NSString stringWithFormat:@".bnns.Ir out specified is nil"];
      v35 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      v17 = [v18 errorWithDomain:@"com.apple.siri.quasar.mil2BnnsCompilation" code:2 userInfo:v16];
      goto LABEL_24;
    }
  }
  else if (a6)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v15 = [NSString stringWithFormat:@".bnns.mil file nil"];
    v37[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    v17 = [v14 errorWithDomain:@"com.apple.siri.quasar.mil2BnnsCompilation" code:1 userInfo:v16];
    goto LABEL_24;
  }
LABEL_26:
}

+ (BOOL)validateBnnsIr:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v8 = 0;
  }
  char v5 = kaldi::quasar::validateBnnsIr((uint64_t)__p);
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

@end