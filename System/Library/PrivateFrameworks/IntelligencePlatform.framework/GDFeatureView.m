@interface GDFeatureView
- (GDFeatureView)initWithAccessAssertion:(id)a3 database:(id)a4;
- (id)expectedFeatureKeysWithError:(id *)a3;
- (id)featureForKey:(id)a3 error:(id *)a4;
- (id)featureKeysWithError:(id *)a3;
@end

@implementation GDFeatureView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureRetriever, 0);
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

- (id)expectedFeatureKeysWithError:(id *)a3
{
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, a2, @"ViewEngine.Serving.Query", (uint64_t)&unk_1F0AC22E8, v3);
  v5 = objc_opt_new();
  v9 = objc_msgSend_featureKeysWithError_(v5, v6, (uint64_t)a3, v7, v8);

  return v9;
}

- (id)featureKeysWithError:(id *)a3
{
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, a2, @"ViewEngine.Serving.Query", (uint64_t)&unk_1F0AC22A8, v3);
  featureRetriever = self->_featureRetriever;

  return (id)objc_msgSend_featureKeysWithError_(featureRetriever, v6, (uint64_t)a3, v7, v8);
}

- (id)featureForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, v7, @"ViewEngine.Serving.Query", (uint64_t)&unk_1F0ADA1E0, v8);
  v11 = objc_msgSend_featureForKey_error_(self->_featureRetriever, v9, (uint64_t)v6, (uint64_t)a4, v10);

  return v11;
}

- (GDFeatureView)initWithAccessAssertion:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GDFeatureView;
  v9 = [(GDFeatureView *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessAssertion, a3);
    objc_storeStrong((id *)&v10->_db, a4);
    v11 = [GDSQLFeatureRetriever alloc];
    uint64_t v15 = objc_msgSend_initWithDatabase_(v11, v12, (uint64_t)v10->_db, v13, v14);
    featureRetriever = v10->_featureRetriever;
    v10->_featureRetriever = (GDSQLFeatureRetriever *)v15;
  }
  return v10;
}

@end