@interface _DPTokenFetcherHelper
+ (id)filesInDirectory:(id)a3 withPrefix:(id)a4;
@end

@implementation _DPTokenFetcherHelper

+ (id)filesInDirectory:(id)a3 withPrefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [&__NSArray0__struct mutableCopy];
  v8 = +[NSFileManager defaultManager];
  v9 = [v8 enumeratorAtPath:v5];
  uint64_t v10 = [v9 nextObject];
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      if (!v6 || [v11 hasPrefix:v6])
      {
        v12 = [v5 stringByAppendingPathComponent:v11];
        char v16 = 0;
        if ([v8 fileExistsAtPath:v12 isDirectory:&v16])
        {
          if (v16)
          {
            [v9 skipDescendents];
          }
          else
          {
            v13 = +[NSURL fileURLWithPath:v12];
            [v7 addObject:v13];
          }
        }
      }
      uint64_t v14 = [v9 nextObject];

      v11 = (void *)v14;
    }
    while (v14);
  }

  return v7;
}

@end