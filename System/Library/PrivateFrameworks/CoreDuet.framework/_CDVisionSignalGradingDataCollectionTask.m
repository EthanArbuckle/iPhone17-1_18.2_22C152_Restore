@interface _CDVisionSignalGradingDataCollectionTask
- (NSString)file;
- (OS_xpc_object)activity;
- (VisionSignalGradingVisionGradeEvent)event;
- (_CDVisionSignalGradingDataCollectionTask)initWithFile:(id)a3 activity:(id)a4;
- (id)eventFromDict:(id)a3;
- (id)eventFromFile:(id)a3;
- (void)execute;
- (void)setEvent:(id)a3;
@end

@implementation _CDVisionSignalGradingDataCollectionTask

- (_CDVisionSignalGradingDataCollectionTask)initWithFile:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CDVisionSignalGradingDataCollectionTask;
  v9 = [(_CDVisionSignalGradingDataCollectionTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_file, a3);
    uint64_t v11 = [(_CDVisionSignalGradingDataCollectionTask *)v10 eventFromFile:v7];
    event = v10->_event;
    v10->_event = (VisionSignalGradingVisionGradeEvent *)v11;

    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (void)execute
{
  v3 = [getPETEventTracker2Class() sharedInstance];
  if (self->_event)
  {
    id v6 = v3;
    objc_msgSend(v3, "logMessage:");
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [(_CDVisionSignalGradingDataCollectionTask *)self file];
    [v4 removeItemAtPath:v5 error:0];

    v3 = v6;
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
      [(_CDVisionSignalGradingDataCollectionTask *)(uint64_t)v4 eventFromFile:v7];
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
        -[_CDVisionSignalGradingDataCollectionTask eventFromFile:]((uint64_t)v7, v10);
      }

      id v8 = 0;
    }
    else
    {
      id v8 = [(_CDVisionSignalGradingDataCollectionTask *)self eventFromDict:v9];
    }
  }
  return v8;
}

- (id)eventFromDict:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v38 = objc_opt_new();
  id v4 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v42 = v3;
  obuint64_t j = [v3 objectForKeyedSubscript:@"visionGrades"];
  uint64_t v5 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  v39 = v4;
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = @"identifier";
    unint64_t v8 = 0x1E560C000uLL;
    uint64_t v9 = *(void *)v53;
    do
    {
      uint64_t v10 = 0;
      uint64_t v40 = v6;
      do
      {
        if (*(void *)v53 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v52 + 1) + 8 * v10);
        context = (void *)MEMORY[0x192FB2F20]();
        id v12 = objc_opt_new();
        id v13 = [v11 objectForKeyedSubscript:v7];
        [v12 setIdentifier:v13];

        objc_super v14 = [v11 objectForKeyedSubscript:@"imageGrade"];
        objc_msgSend(v12, "setImageGrade:", objc_msgSend(v14, "BOOLValue"));

        v15 = [v11 objectForKeyedSubscript:@"numPeople"];
        objc_msgSend(v12, "setNumPeople:", objc_msgSend(v15, "intValue"));

        v16 = [v11 objectForKeyedSubscript:@"cameraRollGrade"];
        objc_msgSend(v12, "setCameraRollGrade:", objc_msgSend(v16, "BOOLValue"));

        v17 = [v11 objectForKeyedSubscript:@"extractedGrade"];
        objc_msgSend(v12, "setExtractedGrade:", objc_msgSend(v17, "BOOLValue"));

        if ([v12 extractedGrade])
        {
          uint64_t v18 = v9;
          unint64_t v19 = v8;
          v20 = v7;
          v21 = objc_opt_new();
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          v22 = [v11 objectForKeyedSubscript:@"extractedIds"];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v49 != v25) {
                  objc_enumerationMutation(v22);
                }
                objc_msgSend(v21, "addObject:", *(void *)(*((void *)&v48 + 1) + 8 * i), v38);
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v57 count:16];
            }
            while (v24);
          }

          [v12 setExtractedSignals:v21];
          id v7 = v20;
          unint64_t v8 = v19;
          uint64_t v9 = v18;
          id v4 = v39;
          uint64_t v6 = v40;
        }
        objc_msgSend(v4, "addObject:", v12, v38);

        ++v10;
      }
      while (v10 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v6);
  }

  [v38 setVisionGrades:v4];
  v27 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v28 = [v42 objectForKeyedSubscript:@"popularityDict"];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        v34 = objc_opt_new();
        [v34 setIdentifier:v33];
        v35 = [v42 objectForKeyedSubscript:@"popularityDict"];
        v36 = [v35 objectForKeyedSubscript:v33];
        objc_msgSend(v34, "setCount:", objc_msgSend(v36, "intValue"));

        [v27 addObject:v34];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v30);
  }

  [v38 setPopularityEntries:v27];
  return v38;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (NSString)file
{
  return self->_file;
}

- (VisionSignalGradingVisionGradeEvent)event
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
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving vision siginal grading data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)eventFromFile:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Error reading vision signal grading data from file %@: %@", (uint8_t *)&v3, 0x16u);
}

@end