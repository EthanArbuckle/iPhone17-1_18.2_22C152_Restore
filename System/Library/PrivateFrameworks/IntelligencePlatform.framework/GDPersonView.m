@interface GDPersonView
- (GDPersonView)initWithAccessAssertion:(id)a3 database:(id)a4;
- (void)enumeratePeopleWithBlock:(id)a3;
@end

@implementation GDPersonView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_personRetriever, 0);

  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

- (void)enumeratePeopleWithBlock:(id)a3
{
  id v9 = a3;
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, v4, @"ViewEngine.Serving.Query", (uint64_t)&unk_1F0AE1D30, v5);
  objc_msgSend_enumerateObjectsWithBlock_(self->_personRetriever, v6, (uint64_t)v9, v7, v8);
}

- (GDPersonView)initWithAccessAssertion:(id)a3 database:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)GDPersonView;
  v10 = [(GDPersonView *)&v29 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accessAssertion, a3);
    objc_storeStrong((id *)&v11->_db, a4);
    v20 = objc_msgSend_viewArtifactTableName(v8, v12, v13, v14, v15);
    if (!v20)
    {
      v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17, v18, v19);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, (uint64_t)v11, @"GDPersonView.m", 36, @"Invalid parameter not satisfying: %@", @"tableName");
    }
    v21 = [GDSQLGraphObjectRetriever alloc];
    db = v11->_db;
    v23 = objc_opt_class();
    v24 = sub_1B2E66628((id *)&v21->super.isa, db, v20, @"SB104", (void *)2, v23);
    personRetriever = v11->_personRetriever;
    v11->_personRetriever = (GDSQLGraphObjectRetriever *)v24;
  }
  return v11;
}

@end