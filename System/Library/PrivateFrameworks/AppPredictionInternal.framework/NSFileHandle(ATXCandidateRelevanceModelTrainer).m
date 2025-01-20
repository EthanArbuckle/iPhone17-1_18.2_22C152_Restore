@interface NSFileHandle(ATXCandidateRelevanceModelTrainer)
- (void)writeCommaSeparatedValues:()ATXCandidateRelevanceModelTrainer;
@end

@implementation NSFileHandle(ATXCandidateRelevanceModelTrainer)

- (void)writeCommaSeparatedValues:()ATXCandidateRelevanceModelTrainer
{
  id v6 = [a3 componentsJoinedByString:@","];
  v4 = [NSString stringWithFormat:@"%@\n", v6];
  v5 = [v4 dataUsingEncoding:4];
  [a1 writeData:v5];
}

@end