@interface CRAuthRepairInspector
+ (BOOL)wasRepaired:(BOOL *)a3;
+ (unint64_t)_getStatus;
+ (unint64_t)getStatus;
@end

@implementation CRAuthRepairInspector

+ (unint64_t)getStatus
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = sub_23993FC14(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_239937000, v2, OS_LOG_TYPE_DEFAULT, "Validating repair status", (uint8_t *)&v6, 2u);
  }

  unint64_t v3 = +[CRAuthRepairInspector _getStatus];
  v4 = sub_23993FC14(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = v3;
    _os_log_impl(&dword_239937000, v4, OS_LOG_TYPE_DEFAULT, "Repair status: %llu", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

+ (unint64_t)_getStatus
{
  char v7 = 0;
  v2 = +[CRFDRUtils findUnsealedDataWithError:0];
  if ([v2 count])
  {
    unint64_t v3 = 3;
  }
  else
  {
    BOOL v4 = +[CRAuthRepairInspector wasRepaired:&v7];
    uint64_t v5 = 1;
    if (v4) {
      uint64_t v5 = 2;
    }
    if (v7) {
      unint64_t v3 = v5;
    }
    else {
      unint64_t v3 = 0;
    }
  }

  return v3;
}

+ (BOOL)wasRepaired:(BOOL *)a3
{
  uint64_t v5 = 0;
  BOOL result = +[CRFDRUtils isDcSignedSealingManifest:&v5];
  if (a3) {
    *a3 = v5 == 0;
  }
  return result;
}

@end