@interface CPLBaseEngineLibrary
- (BOOL)createLibraryWithError:(id *)a3;
- (id)componentName;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
@end

@implementation CPLBaseEngineLibrary

- (BOOL)createLibraryWithError:(id *)a3
{
  v5 = +[NSFileManager defaultManager];
  v6 = [(CPLBaseEngineLibrary *)self abstractObject];
  v7 = [v6 clientLibraryBaseURL];
  LOBYTE(a3) = [v5 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:a3];

  return (char)a3;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v8 = 0;
  v4 = (void (**)(id, void))a3;
  LODWORD(self) = [(CPLBaseEngineLibrary *)self createLibraryWithError:&v8];
  id v5 = v8;
  v6 = v5;
  if (self) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }
  ((void (**)(id, id))v4)[2](v4, v7);
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
}

- (id)componentName
{
  return @"engine";
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, id, void))a3;
  id v4 = +[CPLTransaction transactions];
  v3[2](v3, v4, 0);
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  CFStringRef v7 = @"transactions";
  id v4 = a3;
  id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[CPLTransaction transactionCount]);
  id v8 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  (*((void (**)(id, void *, void))a3 + 2))(v4, v6, 0);
}

@end