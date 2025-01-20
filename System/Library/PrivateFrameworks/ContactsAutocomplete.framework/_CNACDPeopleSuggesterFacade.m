@interface _CNACDPeopleSuggesterFacade
- (id)suggestPeopleWithContext:(id)a3 settings:(id)a4 error:(id *)a5;
@end

@implementation _CNACDPeopleSuggesterFacade

- (id)suggestPeopleWithContext:(id)a3 settings:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F5B428] peopleSuggester];
  [v9 setContext:v7];
  [v9 setSettings:v8];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  v10 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v11 = [v10 schedulerProvider];
  v12 = [v11 immediateScheduler];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71___CNACDPeopleSuggesterFacade_suggestPeopleWithContext_settings_error___block_invoke;
  v18[3] = &unk_1E63DD7F0;
  v20 = &v22;
  id v13 = v9;
  id v19 = v13;
  v21 = &v28;
  [v12 performBlock:v18 qualityOfService:4];

  v14 = (void *)v29[5];
  id v15 = (id)v23[5];
  v16 = v15;
  if (a5 && !v15) {
    *a5 = v14;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

@end