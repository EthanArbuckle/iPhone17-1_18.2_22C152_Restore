@interface ATXAssetsPaths
+ (id)decDirectory;
+ (id)decDirectoryFile:(id)a3;
@end

@implementation ATXAssetsPaths

+ (id)decDirectory
{
  return (id)[MEMORY[0x1E4F4B650] appPredictionDirectory];
}

+ (id)decDirectoryFile:(id)a3
{
  id v4 = a3;
  v5 = [a1 decDirectory];
  v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

@end