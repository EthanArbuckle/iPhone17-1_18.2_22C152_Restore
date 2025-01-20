@interface DESRecordSet(MLRTask)
+ (id)recordSetForTask:()MLRTask;
@end

@implementation DESRecordSet(MLRTask)

+ (id)recordSetForTask:()MLRTask
{
  id v3 = a3;
  v4 = [v3 DESTask];

  if (v4)
  {
    v5 = [v3 DESTask];
    uint64_t v6 = [v5 matchingRecordSet];
LABEL_5:
    v9 = (void *)v6;

    goto LABEL_7;
  }
  v7 = [v3 internalTask];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [v3 internalTask];
    uint64_t v6 = [v5 recordSet];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

@end