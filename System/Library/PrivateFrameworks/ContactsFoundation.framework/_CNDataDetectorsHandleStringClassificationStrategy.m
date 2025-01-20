@interface _CNDataDetectorsHandleStringClassificationStrategy
+ (id)assistedDataDetectorsStrategy;
+ (id)dataDetectorsStrategy;
- (unint64_t)classificationOfHandleString:(id)a3;
@end

@implementation _CNDataDetectorsHandleStringClassificationStrategy

+ (id)dataDetectorsStrategy
{
  v2 = objc_alloc_init(_CNDataDetectorsHandleStringClassificationStrategy);

  return v2;
}

+ (id)assistedDataDetectorsStrategy
{
  v2 = objc_alloc_init(_CNAssistedDataDetectorsHandleStringClassificationStrategy);

  return v2;
}

- (unint64_t)classificationOfHandleString:(id)a3
{
  v3 = +[CNObservable scannerResultsInString:a3];
  v4 = [v3 value];

  if ([v4 count] == 1)
  {
    v5 = [v4 firstObject];
    v6 = [v5 type];
    char v7 = [v6 isEqual:*MEMORY[0x1E4F5EFF8]];

    if (v7)
    {
      unint64_t v8 = 1;
    }
    else
    {
      v9 = [v5 type];
      char v10 = [v9 isEqual:*MEMORY[0x1E4F5F088]];

      if ((v10 & 1) != 0
        || ([v5 type],
            v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = [v11 isEqual:*MEMORY[0x1E4F5F098]],
            v11,
            (v12 & 1) != 0))
      {
        unint64_t v8 = 2;
      }
      else
      {
        v13 = [v5 type];
        int v14 = [v13 isEqual:*MEMORY[0x1E4F5F0F8]];

        if (v14) {
          unint64_t v8 = 2;
        }
        else {
          unint64_t v8 = 0;
        }
      }
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

@end