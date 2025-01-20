@interface PDFileManager
+ (BOOL)createDataVaultAtPath:(const char *)a3 error:(id *)a4;
- (PDFileManager)init;
- (id)topLevelDirectoryURL;
@end

@implementation PDFileManager

- (PDFileManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDFileManager;
  result = [(PDFileManager *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (BOOL)createDataVaultAtPath:(const char *)a3 error:(id *)a4
{
  int v6 = rootless_mkdir_datavault();
  int v7 = v6;
  if (a4 && v6)
  {
    uint64_t v8 = *__error();
    v9 = __error();
    *a4 = +[NSError cls_createErrorWithCode:5, @"Failed to create a data vault at '%s'. Error: %d [%s]", a3, v8, strerror(*v9) format];
  }
  return v7 == 0;
}

- (id)topLevelDirectoryURL
{
  if (qword_10023E628 != -1) {
    dispatch_once(&qword_10023E628, &stru_1001F43F8);
  }
  v2 = (void *)qword_10023E620;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classKitDirectoryURL, 0);

  objc_storeStrong((id *)&self->_topLevelDirectoryURLOverride, 0);
}

@end