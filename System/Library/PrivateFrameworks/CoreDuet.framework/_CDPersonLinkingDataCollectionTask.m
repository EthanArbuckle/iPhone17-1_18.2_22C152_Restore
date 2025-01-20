@interface _CDPersonLinkingDataCollectionTask
- (NSString)file;
- (OS_xpc_object)activity;
- (PersonLinkingLinkedPairEvent)event;
- (_CDPersonLinkingDataCollectionTask)initWithFile:(id)a3 activity:(id)a4;
- (id)eventFromDict:(id)a3;
- (id)eventFromFile:(id)a3;
- (void)execute;
- (void)setEvent:(id)a3;
@end

@implementation _CDPersonLinkingDataCollectionTask

- (_CDPersonLinkingDataCollectionTask)initWithFile:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CDPersonLinkingDataCollectionTask;
  v9 = [(_CDPersonLinkingDataCollectionTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_file, a3);
    uint64_t v11 = [(_CDPersonLinkingDataCollectionTask *)v10 eventFromFile:v7];
    event = v10->_event;
    v10->_event = (PersonLinkingLinkedPairEvent *)v11;

    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (id)eventFromDict:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:@"userID"];
  v24 = v4;
  [v4 setUserID:v5];

  v27 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v23 = v3;
  id obj = [v3 objectForKeyedSubscript:@"pairs"];
  uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v8 = objc_opt_new();
        v9 = objc_opt_new();
        v10 = objc_opt_new();
        uint64_t v11 = [v7 objectForKeyedSubscript:@"sourcePerson"];
        v12 = [v11 objectForKeyedSubscript:@"name"];
        [v9 setName:v12];

        v13 = [v7 objectForKeyedSubscript:@"sourcePerson"];
        objc_super v14 = [v13 objectForKeyedSubscript:@"emails"];
        [v9 setEmails:v14];

        v15 = [v7 objectForKeyedSubscript:@"targetPerson"];
        v16 = [v15 objectForKeyedSubscript:@"name"];
        [v10 setName:v16];

        v17 = [v7 objectForKeyedSubscript:@"targetPerson"];
        v18 = [v17 objectForKeyedSubscript:@"emails"];
        [v10 setEmails:v18];

        [v8 setSourcePerson:v9];
        [v8 setTargetPerson:v10];
        v19 = [v7 objectForKeyedSubscript:@"grade"];
        objc_msgSend(v8, "setGrade:", objc_msgSend(v19, "BOOLValue"));

        v20 = [v7 objectForKeyedSubscript:@"confidence"];
        [v20 floatValue];
        objc_msgSend(v8, "setConfidence:");

        v21 = [v7 objectForKeyedSubscript:@"reason"];
        [v8 setReason:v21];

        [v27 addObject:v8];
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v28);
  }

  [v24 setPairs:v27];
  return v24;
}

- (void)execute
{
  id v3 = [getPETEventTracker2Class() sharedInstance];
  if (self->_event)
  {
    id v6 = v3;
    objc_msgSend(v3, "logMessage:");
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [(_CDPersonLinkingDataCollectionTask *)self file];
    [v4 removeItemAtPath:v5 error:0];

    id v3 = v6;
  }
}

- (id)eventFromFile:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:2 error:&v13];
  id v6 = v13;
  if (v6)
  {
    id v7 = +[_CDLogging dataCollectionChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(_CDPersonLinkingDataCollectionTask *)(uint64_t)v4 eventFromFile:v7];
    }
    id v8 = 0;
  }
  else
  {
    id v12 = 0;
    v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v12];
    id v7 = v12;
    if (v7)
    {
      v10 = +[_CDLogging dataCollectionChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_CDPersonLinkingDataCollectionTask eventFromFile:]((uint64_t)v7, v10);
      }

      id v8 = 0;
    }
    else
    {
      id v8 = [(_CDPersonLinkingDataCollectionTask *)self eventFromDict:v9];
    }
  }
  return v8;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (NSString)file
{
  return self->_file;
}

- (PersonLinkingLinkedPairEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)eventFromFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving person linking data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)eventFromFile:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Error reading person linking data from file %@: %@", (uint8_t *)&v3, 0x16u);
}

@end