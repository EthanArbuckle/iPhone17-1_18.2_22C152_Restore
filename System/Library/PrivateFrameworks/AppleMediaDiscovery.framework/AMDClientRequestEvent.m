@interface AMDClientRequestEvent
+ (AMDClientNotificationObserver)observer;
+ (void)setObserver:(id)a3;
- (AMDClientRequestEvent)initWithFeatureName:(id)a3 withAccountDSID:(id)a4 andAccountStoreFrontId:(id)a5 inDomain:(id)a6 withCustomDescriptor:(id)a7 andSchemaVersion:(id)a8;
- (NSArray)PECSimilarityScoresArray;
- (NSArray)PIRDataArray;
- (NSArray)PIRKeywordArray;
- (NSArray)PIRMissingKeywordArray;
- (NSDictionary)customDescriptor;
- (NSString)CipherMLCallHandle;
- (NSString)CipherMLRequestError;
- (NSString)accountDSID;
- (NSString)domain;
- (NSString)featureName;
- (NSString)modelId;
- (NSString)request;
- (NSString)schemaVersion;
- (NSString)storefrontId;
- (NSString)treatmentId;
- (NSString)useCaseId;
- (id)getAMSRequest;
- (id)getAMSRequestForCipherML;
- (id)initAppSegmentQueryForAccountDSID:(id)a3;
- (id)initClearUserDataFor:(id)a3 inDomain:(id)a4;
- (id)initModelPathRequestForUsecaseId:(id)a3 andModelId:(id)a4 withTreatmentId:(id)a5 inDomain:(id)a6;
- (id)initPECResponseForSimilarityScores:(id)a3 requestError:(id)a4 andCallHandle:(id)a5;
- (id)initPIRResponseForKeywordArray:(id)a3 withDataArray:(id)a4 withMissingKeywords:(id)a5 requestError:(id)a6 andCallHandle:(id)a7;
- (void)internalInitializer:(id)a3 WithFeatureName:(id)a4 withAccountDSID:(id)a5 andAccountStoreFrontId:(id)a6 inDomain:(id)a7 withCustomDescriptor:(id)a8 withModelId:(id)a9 withTreatmentId:(id)a10 withUseCaseId:(id)a11 andSchemaVersion:(id)a12;
- (void)setAccountDSID:(id)a3;
- (void)setCipherMLCallHandle:(id)a3;
- (void)setCipherMLRequestError:(id)a3;
- (void)setCustomDescriptor:(id)a3;
- (void)setDomain:(id)a3;
- (void)setFeatureName:(id)a3;
- (void)setModelId:(id)a3;
- (void)setPECSimilarityScoresArray:(id)a3;
- (void)setPIRDataArray:(id)a3;
- (void)setPIRKeywordArray:(id)a3;
- (void)setPIRMissingKeywordArray:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSchemaVersion:(id)a3;
- (void)setStorefrontId:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)setUseCaseId:(id)a3;
@end

@implementation AMDClientRequestEvent

- (id)getAMSRequest
{
  v32 = self;
  v31[1] = (id)a2;
  v31[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v27 = [(AMDClientRequestEvent *)v32 domain];
  objc_msgSend(v31[0], "setValue:forKey:");

  v28 = [(AMDClientRequestEvent *)v32 accountDSID];
  if (v28)
  {
    v26 = [(AMDClientRequestEvent *)v32 accountDSID];
    objc_msgSend(v31[0], "setValue:forKey:");
  }
  v25 = [(AMDClientRequestEvent *)v32 customDescriptor];

  if (v25)
  {
    v24 = [(AMDClientRequestEvent *)v32 customDescriptor];
    objc_msgSend(v31[0], "setValue:forKey:");
  }
  v23 = [(AMDClientRequestEvent *)v32 featureName];

  if (v23)
  {
    v22 = [(AMDClientRequestEvent *)v32 featureName];
    objc_msgSend(v31[0], "setValue:forKey:");
  }
  v21 = [(AMDClientRequestEvent *)v32 schemaVersion];

  if (v21)
  {
    v20 = [(AMDClientRequestEvent *)v32 schemaVersion];
    objc_msgSend(v31[0], "setValue:forKey:");
  }
  v19 = [(AMDClientRequestEvent *)v32 storefrontId];

  if (v19)
  {
    v18 = [(AMDClientRequestEvent *)v32 storefrontId];
    objc_msgSend(v31[0], "setValue:forKey:");
  }
  v17 = [(AMDClientRequestEvent *)v32 useCaseId];

  if (v17)
  {
    v16 = [(AMDClientRequestEvent *)v32 useCaseId];
    objc_msgSend(v31[0], "setValue:forKey:");
  }
  v15 = [(AMDClientRequestEvent *)v32 modelId];

  if (v15)
  {
    v14 = [(AMDClientRequestEvent *)v32 modelId];
    objc_msgSend(v31[0], "setValue:forKey:");
  }
  v13 = [(AMDClientRequestEvent *)v32 treatmentId];

  if (v13)
  {
    v12 = [(AMDClientRequestEvent *)v32 treatmentId];
    objc_msgSend(v31[0], "setValue:forKey:");
  }
  id location = 0;
  v10 = [(AMDClientRequestEvent *)v32 request];
  BOOL v11 = [(NSString *)v10 isEqualToString:@"clearUserData"];

  if (v11)
  {
    objc_storeStrong(&location, @"amd.clearUserData");
  }
  else
  {
    v8 = [(AMDClientRequestEvent *)v32 request];
    BOOL v9 = [(NSString *)v8 isEqualToString:@"customAgg"];

    if (v9)
    {
      objc_storeStrong(&location, @"amd.fetchAggregatedData");
    }
    else
    {
      v6 = [(AMDClientRequestEvent *)v32 request];
      BOOL v7 = [(NSString *)v6 isEqualToString:@"fetchInapp"];

      if (v7)
      {
        objc_storeStrong(&location, @"amd.getSegment");
      }
      else
      {
        v4 = [(AMDClientRequestEvent *)v32 request];
        BOOL v5 = [(NSString *)v4 isEqualToString:@"fetchModelPath"];

        if (v5) {
          objc_storeStrong(&location, @"amd.getModelPath");
        }
      }
    }
  }
  [v31[0] setValue:location forKey:@"action"];
  v29 = objc_alloc_init(AMDAMSEngagementEvent);
  [(AMDAMSEngagementEvent *)v29 setEngagementData:v31[0]];
  v3 = v29;
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v31, 0);

  return v3;
}

- (NSString)accountDSID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)domain
{
  return self->_domain;
}

+ (AMDClientNotificationObserver)observer
{
  return (AMDClientNotificationObserver *)(id)_notificationObserver;
}

+ (void)setObserver:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&_notificationObserver, location[0]);
  objc_storeStrong(location, 0);
}

- (void)internalInitializer:(id)a3 WithFeatureName:(id)a4 withAccountDSID:(id)a5 andAccountStoreFrontId:(id)a6 inDomain:(id)a7 withCustomDescriptor:(id)a8 withModelId:(id)a9 withTreatmentId:(id)a10 withUseCaseId:(id)a11 andSchemaVersion:(id)a12
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  id v23 = 0;
  objc_storeStrong(&v23, a6);
  id v22 = 0;
  objc_storeStrong(&v22, a7);
  id v21 = 0;
  objc_storeStrong(&v21, a8);
  id v20 = 0;
  objc_storeStrong(&v20, a9);
  id v19 = 0;
  objc_storeStrong(&v19, a10);
  id v18 = 0;
  objc_storeStrong(&v18, a11);
  id v17 = 0;
  objc_storeStrong(&v17, a12);
  [(AMDClientRequestEvent *)v27 setRequest:location[0]];
  [(AMDClientRequestEvent *)v27 setDomain:v22];
  [(AMDClientRequestEvent *)v27 setAccountDSID:v24];
  [(AMDClientRequestEvent *)v27 setStorefrontId:v23];
  [(AMDClientRequestEvent *)v27 setFeatureName:v25];
  [(AMDClientRequestEvent *)v27 setCustomDescriptor:v21];
  [(AMDClientRequestEvent *)v27 setSchemaVersion:v17];
  [(AMDClientRequestEvent *)v27 setModelId:v20];
  [(AMDClientRequestEvent *)v27 setTreatmentId:v19];
  [(AMDClientRequestEvent *)v27 setUseCaseId:v18];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (id)initClearUserDataFor:(id)a3 inDomain:(id)a4
{
  id obj = a4;
  BOOL v9 = (id *)&v15;
  v15 = self;
  location[1] = (id)a2;
  v8 = location;
  id v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v7 = &v13;
  id v13 = 0;
  objc_storeStrong(&v13, obj);
  v4 = v15;
  v15 = 0;
  v12.receiver = v4;
  v12.super_class = (Class)AMDClientRequestEvent;
  v15 = [(AMDClientRequestEvent *)&v12 init];
  objc_storeStrong((id *)&v15, v15);
  -[AMDClientRequestEvent internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:](v15, "internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:", @"clearUserData", 0, location[0], 0, v13, 0, 0, 0, 0);
  BOOL v11 = v15;
  objc_storeStrong(v7, v10);
  objc_storeStrong(v8, v10);
  objc_storeStrong(v9, v10);
  return v11;
}

- (AMDClientRequestEvent)initWithFeatureName:(id)a3 withAccountDSID:(id)a4 andAccountStoreFrontId:(id)a5 inDomain:(id)a6 withCustomDescriptor:(id)a7 andSchemaVersion:(id)a8
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = 0;
  objc_storeStrong(&v24, a6);
  id v23 = 0;
  objc_storeStrong(&v23, a7);
  id v22 = 0;
  objc_storeStrong(&v22, a8);
  if (v24 && location[0])
  {
    id v20 = (id)[v23 objectForKey:AMD_CUSTOM_AGG_VERSION];
    if (v20) {
      objc_storeStrong(&v20, v20);
    }
    else {
      objc_storeStrong(&v20, (id)AMD_CUSTOM_AGG_VERSION_1);
    }
    if (!v23 || ([v20 isEqualToString:AMD_CUSTOM_AGG_VERSION_SQLITE_0] & 1) != 0) {
      goto LABEL_14;
    }
    v8 = [AMDFeatureDescriptor alloc];
    id v19 = -[AMDFeatureDescriptor initWithDictionary:withUserId:featureName:](v8, "initWithDictionary:withUserId:featureName:", v23);
    BOOL v9 = [AMDFeatureDescriptor alloc];
    id v18 = [(AMDFeatureDescriptor *)v9 initWithDictionaryV2:v23 withUserId:@"111111111" featureName:location[0] withDomain:v24];
    if (v19 || v18)
    {
      int v21 = 0;
    }
    else
    {
      v29 = 0;
      int v21 = 1;
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    if (!v21)
    {
LABEL_14:
      id v10 = v28;
      id v28 = 0;
      v17.receiver = v10;
      v17.super_class = (Class)AMDClientRequestEvent;
      id v28 = [(AMDClientRequestEvent *)&v17 init];
      objc_storeStrong(&v28, v28);
      [v28 internalInitializer:@"customAgg" WithFeatureName:location[0] withAccountDSID:v26 andAccountStoreFrontId:v25 inDomain:v24 withCustomDescriptor:v23 withModelId:0 withTreatmentId:0 withUseCaseId:0 andSchemaVersion:v22];
      v29 = (AMDClientRequestEvent *)v28;
      int v21 = 1;
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v29 = 0;
    int v21 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v28, 0);
  return v29;
}

- (id)initAppSegmentQueryForAccountDSID:(id)a3
{
  v6 = (id *)&v11;
  BOOL v11 = self;
  location[1] = (id)a2;
  BOOL v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  BOOL v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)AMDClientRequestEvent;
  BOOL v11 = [(AMDClientRequestEvent *)&v9 init];
  objc_storeStrong((id *)&v11, v11);
  -[AMDClientRequestEvent internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:](v11, "internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:", @"fetchInapp", @"inAppSegments", location[0], 0, @"apps", 0, 0, 0, 0);
  v8 = v11;
  objc_storeStrong(v5, obj);
  objc_storeStrong(v6, obj);
  return v8;
}

- (id)initModelPathRequestForUsecaseId:(id)a3 andModelId:(id)a4 withTreatmentId:(id)a5 inDomain:(id)a6
{
  id obj = a4;
  id v9 = a5;
  id v10 = a6;
  v15 = (id *)&v23;
  id v23 = self;
  location[1] = (id)a2;
  v14 = location;
  id v16 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = &v21;
  id v21 = 0;
  objc_storeStrong(&v21, obj);
  objc_super v12 = &v20;
  id v20 = 0;
  objc_storeStrong(&v20, v9);
  BOOL v11 = &v19;
  id v19 = 0;
  objc_storeStrong(&v19, v10);
  v6 = v23;
  id v23 = 0;
  v18.receiver = v6;
  v18.super_class = (Class)AMDClientRequestEvent;
  id v23 = [(AMDClientRequestEvent *)&v18 init];
  objc_storeStrong((id *)&v23, v23);
  -[AMDClientRequestEvent internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:](v23, "internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:", @"fetchModelPath", 0, 0, 0, v19, v21, v20, location[0], 0);
  objc_super v17 = v23;
  objc_storeStrong(v11, v16);
  objc_storeStrong(v12, v16);
  objc_storeStrong(v13, v16);
  objc_storeStrong(v14, v16);
  objc_storeStrong(v15, v16);
  return v17;
}

- (id)initPIRResponseForKeywordArray:(id)a3 withDataArray:(id)a4 withMissingKeywords:(id)a5 requestError:(id)a6 andCallHandle:(id)a7
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  id v19 = 0;
  objc_storeStrong(&v19, a7);
  BOOL v7 = v24;
  id v24 = 0;
  v18.receiver = v7;
  v18.super_class = (Class)AMDClientRequestEvent;
  id v24 = [(AMDClientRequestEvent *)&v18 init];
  objc_storeStrong((id *)&v24, v24);
  [(AMDClientRequestEvent *)v24 setRequest:0x26BEAD5B8];
  id v15 = +[AMDMiscHelpers convertDataArrayToBase64StringArray:location[0]];
  -[AMDClientRequestEvent setPIRKeywordArray:](v24, "setPIRKeywordArray:");

  id v16 = +[AMDMiscHelpers convertDataArrayToBase64StringArray:v21];
  -[AMDClientRequestEvent setPIRMissingKeywordArray:](v24, "setPIRMissingKeywordArray:");

  id v17 = +[AMDMiscHelpers convertDataArrayToBase64StringArray:v22];
  -[AMDClientRequestEvent setPIRDataArray:](v24, "setPIRDataArray:");

  [(AMDClientRequestEvent *)v24 setCipherMLCallHandle:v19];
  if (v20)
  {
    id v10 = (id)[v20 localizedDescription];
    -[AMDClientRequestEvent setCipherMLRequestError:](v24, "setCipherMLRequestError:");
  }
  id v9 = v24;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v24, 0);
  return v9;
}

- (id)initPECResponseForSimilarityScores:(id)a3 requestError:(id)a4 andCallHandle:(id)a5
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  BOOL v5 = v15;
  id v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)AMDClientRequestEvent;
  id v15 = [(AMDClientRequestEvent *)&v11 init];
  objc_storeStrong((id *)&v15, v15);
  [(AMDClientRequestEvent *)v15 setRequest:0x26BEAD598];
  [(AMDClientRequestEvent *)v15 setPECSimilarityScoresArray:location[0]];
  [(AMDClientRequestEvent *)v15 setCipherMLCallHandle:v12];
  if (v13)
  {
    id v8 = (id)[v13 localizedDescription];
    -[AMDClientRequestEvent setCipherMLRequestError:](v15, "setCipherMLRequestError:");
  }
  BOOL v7 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (id)getAMSRequestForCipherML
{
  id v22 = self;
  v21[1] = (id)a2;
  v21[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v19 = [(AMDClientRequestEvent *)v22 accountDSID];

  if (v19)
  {
    objc_super v18 = [(AMDClientRequestEvent *)v22 accountDSID];
    objc_msgSend(v21[0], "setValue:forKey:");
  }
  id v17 = [(AMDClientRequestEvent *)v22 PIRDataArray];

  if (v17)
  {
    id v16 = [(AMDClientRequestEvent *)v22 PIRDataArray];
    objc_msgSend(v21[0], "setValue:forKey:");
  }
  id v15 = [(AMDClientRequestEvent *)v22 PIRKeywordArray];

  if (v15)
  {
    v14 = [(AMDClientRequestEvent *)v22 PIRKeywordArray];
    objc_msgSend(v21[0], "setValue:forKey:");
  }
  id v13 = [(AMDClientRequestEvent *)v22 PIRMissingKeywordArray];

  if (v13)
  {
    id v12 = [(AMDClientRequestEvent *)v22 PIRMissingKeywordArray];
    objc_msgSend(v21[0], "setValue:forKey:");
  }
  objc_super v11 = [(AMDClientRequestEvent *)v22 PECSimilarityScoresArray];

  if (v11)
  {
    id v10 = [(AMDClientRequestEvent *)v22 PECSimilarityScoresArray];
    objc_msgSend(v21[0], "setValue:forKey:");
  }
  id v9 = [(AMDClientRequestEvent *)v22 CipherMLCallHandle];

  if (v9)
  {
    id v8 = [(AMDClientRequestEvent *)v22 CipherMLCallHandle];
    objc_msgSend(v21[0], "setValue:forKey:");
  }
  BOOL v7 = [(AMDClientRequestEvent *)v22 CipherMLRequestError];

  if (v7)
  {
    v6 = [(AMDClientRequestEvent *)v22 CipherMLCallHandle];
    objc_msgSend(v21[0], "setValue:forKey:");
  }
  v4 = [(AMDClientRequestEvent *)v22 request];
  objc_msgSend(v3, "setValue:forKey:");

  [v21[0] setValue:@"amd.enqueueCipherMLEvent" forKey:@"action"];
  id v20 = objc_alloc_init(AMDAMSEngagementEvent);
  [(AMDAMSEngagementEvent *)v20 setEngagementData:v21[0]];
  BOOL v5 = v20;
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(v21, 0);

  return v5;
}

- (void)setAccountDSID:(id)a3
{
}

- (NSDictionary)customDescriptor
{
  return self->_customDescriptor;
}

- (void)setCustomDescriptor:(id)a3
{
}

- (void)setDomain:(id)a3
{
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
}

- (NSString)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(id)a3
{
}

- (NSString)storefrontId
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStorefrontId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)useCaseId
{
  return self->_useCaseId;
}

- (void)setUseCaseId:(id)a3
{
}

- (NSString)CipherMLCallHandle
{
  return self->_CipherMLCallHandle;
}

- (void)setCipherMLCallHandle:(id)a3
{
}

- (NSString)CipherMLRequestError
{
  return self->_CipherMLRequestError;
}

- (void)setCipherMLRequestError:(id)a3
{
}

- (NSArray)PECSimilarityScoresArray
{
  return self->_PECSimilarityScoresArray;
}

- (void)setPECSimilarityScoresArray:(id)a3
{
}

- (NSArray)PIRDataArray
{
  return self->_PIRDataArray;
}

- (void)setPIRDataArray:(id)a3
{
}

- (NSArray)PIRKeywordArray
{
  return self->_PIRKeywordArray;
}

- (void)setPIRKeywordArray:(id)a3
{
}

- (NSArray)PIRMissingKeywordArray
{
  return self->_PIRMissingKeywordArray;
}

- (void)setPIRMissingKeywordArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end