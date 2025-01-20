@interface ADMonocularV2Executor
- (int64_t)computeDepthWithColor:(__CVBuffer *)a3 outDisparity:(__CVBuffer *)a4;
@end

@implementation ADMonocularV2Executor

- (int64_t)computeDepthWithColor:(__CVBuffer *)a3 outDisparity:(__CVBuffer *)a4
{
  return (int64_t)[(ADMonocularV2Executor *)self executeWithColor:a3 outDisparity:a4];
}

@end