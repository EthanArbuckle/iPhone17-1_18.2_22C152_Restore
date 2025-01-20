@interface HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl
- (HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl)initWithIdentifier:(id)a3 loggingCategory:(id)a4;
- (id)makeGatedActivityWithHandler:(id)a3;
@end

@implementation HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl

- (HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl)initWithIdentifier:(id)a3 loggingCategory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl;
  v9 = [(HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_loggingCategory, a4);
  }

  return v10;
}

- (id)makeGatedActivityWithHandler:(id)a3
{
  id v4 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14310], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F65DC0]) initWithName:self->_identifier criteria:empty loggingCategory:self->_loggingCategory handler:v4];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end