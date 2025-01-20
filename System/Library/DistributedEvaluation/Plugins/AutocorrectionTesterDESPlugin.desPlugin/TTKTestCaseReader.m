@interface TTKTestCaseReader
+ (id)loadFromDir:(id)a3;
+ (id)loadFromFile:(id)a3;
+ (id)loadFromFile:(id)a3 inputMode:(id)a4 layouts:(id)a5;
+ (id)loadFromPath:(id)a3;
+ (id)loadFromPath:(id)a3 fileManager:(id)a4;
@end

@implementation TTKTestCaseReader

+ (id)loadFromFile:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = sub_4038();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_5936C(v7);
  }

  v12 = +[NSInputStream inputStreamWithFileAtPath:v7];
  [v12 open];
  if ([v12 streamStatus] == (char *)&dword_4 + 3)
  {
    v13 = sub_4038();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_592F4((uint64_t)v7, v13);
    }

    [v12 close];
    id v14 = 0;
  }
  else
  {
    v15 = +[NSJSONSerialization JSONObjectWithStream:v12 options:0 error:0];
    id v14 = [[TTKFileSource alloc] init:v15 inputMode:v8 layouts:v9];
    [v12 close];
  }

  return v14;
}

+ (id)loadFromFile:(id)a3
{
  return [a1 loadFromFile:a3 inputMode:0 layouts:0];
}

+ (id)loadFromDir:(id)a3
{
  id v3 = a3;
  id v4 = [[TTKDirSource alloc] init:v3];

  return v4;
}

+ (id)loadFromPath:(id)a3
{
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  v6 = [a1 loadFromPath:v4 fileManager:v5];

  return v6;
}

+ (id)loadFromPath:(id)a3 fileManager:(id)a4
{
  id v6 = a3;
  char v11 = 0;
  unsigned int v7 = [a4 fileExistsAtPath:v6 isDirectory:&v11];
  if (v7 && v11)
  {
    uint64_t v8 = [a1 loadFromDir:v6];
LABEL_6:
    id v9 = (void *)v8;
    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v8 = [a1 loadFromFile:v6];
    goto LABEL_6;
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

@end