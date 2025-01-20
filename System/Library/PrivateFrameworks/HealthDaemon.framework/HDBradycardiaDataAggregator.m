@interface HDBradycardiaDataAggregator
- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6;
- (id)_categoryType;
@end

@implementation HDBradycardiaDataAggregator

- (id)_categoryType
{
  return (id)[MEMORY[0x1E4F2ACB8] bradycardiaType];
}

- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  -[HDHeartEventDataAggregator triggerImmediateCloudSyncWithReason:](self, @"New Low Heart Rate Notification sample added");
  v14.receiver = self;
  v14.super_class = (Class)HDBradycardiaDataAggregator;
  LOBYTE(a6) = [(HDHeartEventDataAggregator *)&v14 didPersistObjects:v12 lastDatum:v11 collector:v10 error:a6];

  return (char)a6;
}

@end