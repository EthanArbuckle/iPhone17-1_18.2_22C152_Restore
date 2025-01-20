@interface CardDAVBulkChangeTask
- (CardDAVBulkChangeTask)initWithURL:(id)a3 checkCTag:(id)a4 simple:(BOOL)a5 returnChangedData:(BOOL)a6 uuidsToAddActions:(id)a7 hrefsToModDeleteActions:(id)a8;
@end

@implementation CardDAVBulkChangeTask

- (CardDAVBulkChangeTask)initWithURL:(id)a3 checkCTag:(id)a4 simple:(BOOL)a5 returnChangedData:(BOOL)a6 uuidsToAddActions:(id)a7 hrefsToModDeleteActions:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v15 = a7;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)CardDAVBulkChangeTask;
  v17 = [(CoreDAVBulkChangeTask *)&v21 initWithURL:a3 checkCTag:a4 simple:v11 returnChangedData:v10 uuidsToAddActions:v15 hrefsToModDeleteActions:v16];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._appSpecificNamespace, @"urn:ietf:params:xml:ns:carddav");
    objc_storeStrong((id *)&v18->super._appSpecificDataProp, @"address-data");
    objc_storeStrong((id *)&v18->super._uuidsToAddActions, a7);
    objc_storeStrong((id *)&v18->super._hrefsToModDeleteActions, a8);
    if (v11) {
      v19 = @"text/vcard; charset=utf-8";
    }
    else {
      v19 = @"application/xml; charset=utf-8";
    }
    objc_storeStrong((id *)&v18->super._requestDataContentType, v19);
  }
  [(CoreDAVBulkChangeTask *)v18 fillOutDataWithUUIDsToAddActions:v15 hrefsToModDeleteActions:v16];

  return v18;
}

@end