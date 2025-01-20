@interface NavdPaths
+ (id)pathInCacheDirWithFilename:(id)a3;
@end

@implementation NavdPaths

+ (id)pathInCacheDirWithFilename:(id)a3
{
  uint64_t v3 = qword_1000A25A8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000A25A8, &stru_10008C2A0);
  }
  v5 = [(id)qword_1000A25A0 stringByAppendingPathComponent:v4];

  return v5;
}

@end