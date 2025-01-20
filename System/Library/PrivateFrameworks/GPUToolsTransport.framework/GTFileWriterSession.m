@interface GTFileWriterSession
+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
@end

@implementation GTFileWriterSession

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [v9 compressionAlgorithm];
  v12 = [(id)objc_opt_class() sessionWithFileEntries:v11 relativeToURL:v10 options:v9 error:a6];

  return v12;
}

@end