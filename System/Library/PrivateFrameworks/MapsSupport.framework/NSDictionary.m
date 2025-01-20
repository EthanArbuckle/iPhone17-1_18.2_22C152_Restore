@interface NSDictionary
- (BOOL)_maps_writeBinaryPlist:(id)a3 error:(id *)a4;
@end

@implementation NSDictionary

- (BOOL)_maps_writeBinaryPlist:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v17 = 0;
  v7 = +[NSPropertyListSerialization dataWithPropertyList:self format:200 options:0 error:&v17];
  id v8 = v17;
  v9 = v8;
  if (v8)
  {
    unsigned __int8 v10 = 0;
    if (*a4) {
      *a4 = v8;
    }
  }
  else
  {
    v11 = [v6 stringByDeletingLastPathComponent];
    v12 = +[NSFileManager defaultManager];
    if (([v12 fileExistsAtPath:v11 isDirectory:0] & 1) == 0) {
      [v12 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];
    }
    id v16 = 0;
    unsigned __int8 v10 = [v7 writeToFile:v6 options:1 error:&v16];
    id v13 = v16;
    v14 = v13;
    if (v13)
    {
      unsigned __int8 v10 = 0;
      if (*a4) {
        *a4 = v13;
      }
    }
  }
  return v10;
}

@end