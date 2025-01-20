@interface DATrafficLogFilename
+ (id)filenameWithBasename:(id)a3;
+ (id)filenameWithBasename:(id)a3 bundle:(id)a4 processInfo:(id)a5 uid:(unsigned int)a6;
@end

@implementation DATrafficLogFilename

+ (id)filenameWithBasename:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 mainBundle];
  v7 = [MEMORY[0x1E4F28F80] processInfo];
  v8 = [a1 filenameWithBasename:v5 bundle:v6 processInfo:v7 uid:getuid()];

  return v8;
}

+ (id)filenameWithBasename:(id)a3 bundle:(id)a4 processInfo:(id)a5 uid:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a3;
  id v10 = a5;
  v11 = [a4 bundleIdentifier];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v10 processName];
  }
  v14 = v13;
  v15 = [NSString stringWithFormat:@"%@.%@.%u", v9, v13, v6];

  return v15;
}

@end