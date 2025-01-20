@interface FIDataSeparatedICloudDrive
+ (pair<FINode)findUnderlyingNodes;
@end

@implementation FIDataSeparatedICloudDrive

+ (pair<FINode)findUnderlyingNodes
{
  v3 = v2;
  uint64_t v4 = +[FINode dataSeparatedICloudLibrariesContainer];
  v5 = +[FINode dataSeparatedICloudDefaultContainer];
  uint64_t *v3 = v4;
  v3[1] = (uint64_t)v5;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

@end