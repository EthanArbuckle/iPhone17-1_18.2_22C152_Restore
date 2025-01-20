@interface CardDAVMultiPutTask
- (CardDAVMultiPutTask)initWithURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6;
@end

@implementation CardDAVMultiPutTask

- (CardDAVMultiPutTask)initWithURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CardDAVMultiPutTask;
  v12 = [(CoreDAVMultiPutTask *)&v15 initWithURL:a3 checkCTag:a4 uuidsToAddActions:v10 hrefsToModDeleteActions:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->super._appSpecificNamespace, @"urn:ietf:params:xml:ns:carddav");
    objc_storeStrong((id *)&v13->super._appSpecificDataProp, @"address-data");
  }
  [(CoreDAVMultiPutTask *)v13 fillOutDataWithUUIDsToAddActions:v10 hrefsToModDeleteActions:v11];

  return v13;
}

@end