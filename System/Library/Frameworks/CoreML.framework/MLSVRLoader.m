@interface MLSVRLoader
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
@end

@implementation MLSVRLoader

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = [[MLSVREngine alloc] initWithSpecification:a3 error:a5];
  if (v8)
  {
    id v9 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
    v10 = [[MLSupportVectorRegressor alloc] initWithEngine:v8 description:v9 configuration:v7 error:a5];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end