@interface HMIAnalysisService
- (BOOL)cancelRequest:(int)a3;
- (HMIAnalysisService)init;
- (id)expectedClasses;
- (int)requestAnalysisForAssetData:(id)a3 withProperties:(id)a4 andCompletionHandler:(id)a5;
- (int)requestAnalysisForPixelBuffer:(__CVBuffer *)a3 withProperties:(id)a4 andCompletionHandler:(id)a5;
@end

@implementation HMIAnalysisService

- (HMIAnalysisService)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMIAnalysisService;
  return [(HMIAnalysisService *)&v3 init];
}

- (id)expectedClasses
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (int)requestAnalysisForPixelBuffer:(__CVBuffer *)a3 withProperties:(id)a4 andCompletionHandler:(id)a5
{
  return -1;
}

- (int)requestAnalysisForAssetData:(id)a3 withProperties:(id)a4 andCompletionHandler:(id)a5
{
  return -1;
}

- (BOOL)cancelRequest:(int)a3
{
  return 1;
}

@end