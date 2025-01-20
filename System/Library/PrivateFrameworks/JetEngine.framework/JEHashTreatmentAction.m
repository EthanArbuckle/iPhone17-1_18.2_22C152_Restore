@interface JEHashTreatmentAction
- (JEHashTreatmentAction)initWithField:(id)a3 configuration:(id)a4;
- (JEHashTreatmentAction)initWithField:(id)a3 configuration:(id)a4 topic:(id)a5;
- (NSDictionary)configuration;
- (NSString)namespace;
- (NSString)topic;
- (id)hashOf:(id)a3 userId:(id)a4;
- (id)performAction:(id)a3 context:(id)a4;
- (void)setConfiguration:(id)a3;
- (void)setNamespace:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation JEHashTreatmentAction

- (JEHashTreatmentAction)initWithField:(id)a3 configuration:(id)a4 topic:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)JEHashTreatmentAction;
  v12 = [(JETreatmentAction *)&v21 initWithField:v9 configuration:v10];
  if (v12)
  {
    v13 = [v10 objectForKeyedSubscript:@"scheme"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    v15 = [v14 objectForKeyedSubscript:@"namespace"];
    if (!v15)
    {
      v16 = NSString;
      v17 = [MEMORY[0x1E4F28B50] mainBundle];
      v18 = [v17 bundleIdentifier];
      v19 = v18;
      if (!v18)
      {
        v5 = [MEMORY[0x1E4F28F80] processInfo];
        v19 = [v5 processName];
      }
      v15 = [v16 stringWithFormat:@"%@.%lx", v19, objc_msgSend(v9, "hash")];
      if (!v18)
      {
      }
    }
    [(JEHashTreatmentAction *)v12 setNamespace:v15];
    [(JEHashTreatmentAction *)v12 setConfiguration:v10];
    [(JEHashTreatmentAction *)v12 setTopic:v11];
  }
  return v12;
}

- (id)hashOf:(id)a3 userId:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  id v9 = [(JEHashTreatmentAction *)self namespace];
  id v10 = [(JEHashTreatmentAction *)self topic];
  id v11 = [MEMORY[0x1E4F4DD70] keyWithName:@"userID" crossDeviceSync:0];
  v12 = [(JEHashTreatmentAction *)self configuration];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __39__JEHashTreatmentAction_hashOf_userId___block_invoke;
  v19[3] = &unk_1E59B5448;
  objc_super v21 = &v22;
  v13 = v8;
  v20 = v13;
  +[JEMetricsSecretMigrator migrateSecretIfNecessaryAndReturnSecretValueWithNamespace:v9 topic:v10 secretKey:v11 configuration:v12 completionHandler:v19];

  dispatch_time_t v14 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v13, v14);
  if (v23[5])
  {
    v15 = [NSString stringWithFormat:@"%@\n%@\n%@", v6, v23[5], v7];
    v16 = [v15 je_SHA1Base62String];
  }
  else
  {
    v15 = JEMetricsOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = [(JEHashTreatmentAction *)self namespace];
      *(_DWORD *)buf = 138412290;
      v29 = v17;
      _os_log_impl(&dword_19EE14000, v15, OS_LOG_TYPE_ERROR, "JetEngine: Failed to retrieve secret salt for namespace %@", buf, 0xCu);
    }
    v16 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v16;
}

void __39__JEHashTreatmentAction_hashOf_userId___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)performAction:(id)a3 context:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)JEHashTreatmentAction;
  id v7 = [(JETreatmentAction *)&v15 performAction:a3 context:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 stringValue];
LABEL_8:
    id v9 = v8;
    id v10 = -[JETreatmentContext metrics]((uint64_t)v6);
    id v11 = [v10 objectForKeyedSubscript:@"userId"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    v13 = [(JEHashTreatmentAction *)self hashOf:v9 userId:v12];

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v8 = [v7 description];
    goto LABEL_8;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (JEHashTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  return [(JEHashTreatmentAction *)self initWithField:a3 configuration:a4 topic:0];
}

- (NSString)namespace
{
  return self->_namespace;
}

- (void)setNamespace:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
}

@end