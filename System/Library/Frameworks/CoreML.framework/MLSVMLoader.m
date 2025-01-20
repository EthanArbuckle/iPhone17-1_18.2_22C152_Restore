@interface MLSVMLoader
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
@end

@implementation MLSVMLoader

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 401)
  {
    v8 = [[MLSVMEngine alloc] initWithSpecification:a3 error:a5];
    if (v8)
    {
      id v9 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
      int v10 = *(_DWORD *)(*(void *)a3 + 44);
      if ((v10 - 400) < 5 || v10 == 200) {
        v11 = [[MLSupportVectorClassifier alloc] initWithEngine:v8 description:v9 configuration:v7 error:a5];
      }
      else {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:@"Interface type is not an Support Vector Classifier"];
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end