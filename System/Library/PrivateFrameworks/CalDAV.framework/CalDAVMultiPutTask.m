@interface CalDAVMultiPutTask
- (CalDAVMultiPutTask)initWithURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6;
@end

@implementation CalDAVMultiPutTask

- (CalDAVMultiPutTask)initWithURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CalDAVMultiPutTask;
  v12 = [(CoreDAVMultiPutTask *)&v15 initWithURL:a3 checkCTag:a4 uuidsToAddActions:v10 hrefsToModDeleteActions:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)((char *)&v12->super.super.super.isa + (int)*MEMORY[0x263F34C48]), (id)*MEMORY[0x263F34CD8]);
    objc_storeStrong((id *)((char *)&v13->super.super.super.isa + (int)*MEMORY[0x263F34C40]), @"calendar-data");
  }
  [(CoreDAVMultiPutTask *)v13 fillOutDataWithUUIDsToAddActions:v10 hrefsToModDeleteActions:v11];

  return v13;
}

@end