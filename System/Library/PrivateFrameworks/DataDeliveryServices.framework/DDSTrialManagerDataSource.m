@interface DDSTrialManagerDataSource
- (BOOL)isEnabled;
- (id)createTrialClientWithWorkQueue:(id)a3 query:(id)a4;
@end

@implementation DDSTrialManagerDataSource

- (id)createTrialClientWithWorkQueue:(id)a3 query:(id)a4
{
  return +[DDSTrialClient createWithWorkQueue:a3 query:a4];
}

- (BOOL)isEnabled
{
  return MEMORY[0x1F40C9FB0]("TextInputCore", "UseDDSForABTesting");
}

@end