@interface MLE5ExecutionStreamOperationPoolFactory
+ (id)createPoolFromLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 modelConfiguration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8;
@end

@implementation MLE5ExecutionStreamOperationPoolFactory

+ (id)createPoolFromLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 modelConfiguration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if ([v15 hasEnumeratedShapeInputs])
  {
    v18 = off_1E59A2980;
  }
  else
  {
    int v19 = [v15 hasRangeShapeInputs];
    v18 = off_1E59A2990;
    if (v19) {
      v18 = off_1E59A2988;
    }
  }
  v20 = (void *)[objc_alloc(*v18) initWithProgramLibrary:v13 functionName:v14 modelDescription:v15 configuration:v16 modelSignpostId:a7 compilerVersionInfo:v17];

  return v20;
}

@end