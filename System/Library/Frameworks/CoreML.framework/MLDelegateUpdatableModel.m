@interface MLDelegateUpdatableModel
+ (id)loadModelFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (MLDelegateUpdatableModel)initWithEngine:(id)a3 error:(id *)a4;
- (void)cancelUpdate;
- (void)resumeUpdate;
- (void)resumeUpdateWithParameters:(id)a3;
- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4;
- (void)updateModelWithData:(id)a3;
@end

@implementation MLDelegateUpdatableModel

- (void)updateModelWithData:(id)a3
{
  id v5 = a3;
  v4 = [(MLDelegateUpdatableModel *)self updatableEngine];
  [v4 updateModelWithData:v5];
}

- (void)resumeUpdateWithParameters:(id)a3
{
  id v5 = a3;
  v4 = [(MLDelegateUpdatableModel *)self updatableEngine];
  [v4 resumeUpdateWithParameters:v5];
}

- (void)resumeUpdate
{
  id v2 = [(MLDelegateUpdatableModel *)self updatableEngine];
  [v2 resumeUpdate];
}

- (void)cancelUpdate
{
  id v2 = [(MLDelegateUpdatableModel *)self updatableEngine];
  [v2 cancelUpdate];
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(MLDelegateUpdatableModel *)self updatableEngine];
  [v7 setUpdateProgressHandlers:v8 dispatchQueue:v6];
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLDelegateUpdatableModel *)self updatableEngine];
  LOBYTE(a4) = [v7 writeToURL:v6 error:a4];

  return (char)a4;
}

- (MLDelegateUpdatableModel)initWithEngine:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (([v6 conformsToProtocol:&unk_1EF1247D8] & 1) == 0)
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)MLDelegateUpdatableModel;
  id v8 = [(MLDelegateModel *)&v10 initWithEngine:v6 error:a4];

  return v8;
}

+ (id)loadModelFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  v7 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
  }

  return 0;
}

@end