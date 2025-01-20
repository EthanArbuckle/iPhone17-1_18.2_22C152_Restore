@interface BLSAlwaysOnSession
- (BLSAlwaysOnSession)initWithEnvironment:(id)a3;
- (BLSBacklightSceneEnvironment)environment;
- (BLSFrameSpecifierModel)model;
- (NSString)description;
- (id)specifierForPresentationDate:(id)a3;
- (void)desiredFidelityForDateInterval:(id)a3 timelines:(id)a4 withCompletion:(id)a5;
- (void)performFrameSpecifiersRequest:(id)a3 timelines:(id)a4;
- (void)setModel:(id)a3;
@end

@implementation BLSAlwaysOnSession

- (BLSAlwaysOnSession)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLSAlwaysOnSession;
  v5 = [(BLSAlwaysOnSession *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = objc_alloc_init(BLSFrameSpecifierModel);
    model = v6->_model;
    v6->_model = v7;
  }
  return v6;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_model withName:@"model"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = NSString;
  v7 = [WeakRetained identifier];
  v8 = [v6 stringWithFormat:@"<%p:%@>", WeakRetained, v7];
  [v3 appendString:v8 withName:@"environment"];

  v9 = [v3 build];

  return (NSString *)v9;
}

- (id)specifierForPresentationDate:(id)a3
{
  id v4 = a3;
  v5 = [(BLSAlwaysOnSession *)self model];
  v6 = [v5 specifierAtPresentationDate:v4];

  return v6;
}

- (void)desiredFidelityForDateInterval:(id)a3 timelines:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void (**)(id, uint64_t))a5;
  v11 = [(BLSAlwaysOnSession *)self environment];
  if (v9)
  {
    uint64_t v12 = +[BLSAlwaysOnTimeline requestedFidelityForTimelines:v9 inDateInterval:v8];
    v13 = bls_scenes_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BLSAlwaysOnSession desiredFidelityForDateInterval:timelines:withCompletion:](v12, (uint64_t)v9, v13);
    }
  }
  else
  {
    v13 = bls_environment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BLSAlwaysOnSession desiredFidelityForDateInterval:timelines:withCompletion:](v11);
    }
    uint64_t v12 = 1;
  }

  v10[2](v10, v12);
}

- (void)performFrameSpecifiersRequest:(id)a3 timelines:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BLSAlwaysOnSession *)self environment];
  id v9 = [v6 dateInterval];
  objc_super v10 = [v6 previousPresentationDate];
  uint64_t v11 = [(BLSAlwaysOnSession *)self specifierForPresentationDate:v10];
  v37 = (void *)v11;
  if (v7)
  {
    uint64_t v12 = v11;
    v36 = v10;
    uint64_t v13 = [v6 shouldReset];
    if (v13)
    {
      v14 = objc_alloc_init(BLSFrameSpecifierModel);
      [(BLSAlwaysOnSession *)self setModel:v14];
    }
    v15 = +[BLSAlwaysOnTimeline constructFrameSpecifiersForTimelines:v7 dateInterval:v9 shouldConstructStartSpecifier:v13 framesPerSecond:v12 previousSpecifier:30.0];
    v16 = [(BLSAlwaysOnSession *)self model];
    [v16 addSpecifiers:v15];

    v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-10.0];
    v18 = [v9 startDate];
    int v19 = [v18 isBeforeDate:v17];

    if (v19)
    {
      v20 = bls_environment_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[BLSAlwaysOnSession performFrameSpecifiersRequest:timelines:](v9, v20);
      }
    }
    else
    {
      v20 = [(BLSAlwaysOnSession *)self model];
      [v20 purgeAllButOneSpecifiersBeforeDate:v17];
    }

    v23 = objc_msgSend(v15, "bs_map:", &__block_literal_global_6);
    unint64_t v24 = [v23 count];
    if (v24 < 0xB)
    {
      os_log_type_t v27 = OS_LOG_TYPE_INFO;
    }
    else
    {
      double v25 = (double)v24;
      [v9 duration];
      if (v25 / v26 <= 4.0) {
        os_log_type_t v27 = OS_LOG_TYPE_INFO;
      }
      else {
        os_log_type_t v27 = OS_LOG_TYPE_FAULT;
      }
    }
    v28 = bls_scenes_log();
    if (os_log_type_enabled(v28, v27))
    {
      v33 = [(BLSAlwaysOnSession *)self model];
      v29 = v9;
      uint64_t v30 = [v33 specifierCount];
      objc_msgSend(v23, "bls_boundedDescriptionWithMax:transformer:", 8, &__block_literal_global_16);
      v31 = id v35 = v7;
      objc_msgSend(v15, "bls_boundedDescriptionWithMax:", 1);
      v32 = v34 = v8;
      *(_DWORD *)buf = 134218498;
      uint64_t v39 = v30;
      id v9 = v29;
      __int16 v40 = 2114;
      v41 = v31;
      __int16 v42 = 2114;
      v43 = v32;
      _os_log_impl(&dword_1B55DE000, v28, v27, "performFrameSpecifiersRequest model.specifierCount:%lu dateSpecifers:%{public}@ for frameSpecifiers:%{public}@", buf, 0x20u);

      id v8 = v34;
      id v7 = v35;
    }

    objc_super v10 = v36;
  }
  else
  {
    v21 = bls_environment_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BLSAlwaysOnSession performFrameSpecifiersRequest:timelines:](v8);
    }

    v22 = [BLSAlwaysOnDateSpecifier alloc];
    v15 = [MEMORY[0x1E4F1C9C8] now];
    v17 = [(BLSAlwaysOnDateSpecifier *)v22 initWithDate:v15 fidelity:0];
    v44[0] = v17;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  }
  [v6 completeWithDateSpecifiers:v23];
}

BLSAlwaysOnDateSpecifier *__62__BLSAlwaysOnSession_performFrameSpecifiersRequest_timelines___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [BLSAlwaysOnDateSpecifier alloc];
  id v4 = [v2 presentationInterval];
  v5 = [v4 startDate];
  uint64_t v6 = [v2 requestedFidelity];

  id v7 = [(BLSAlwaysOnDateSpecifier *)v3 initWithDate:v5 fidelity:v6];

  return v7;
}

id __62__BLSAlwaysOnSession_performFrameSpecifiersRequest_timelines___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = a2;
  id v4 = [v3 date];
  v5 = objc_msgSend(v4, "bls_shortLoggingString");
  uint64_t v6 = [v3 fidelity];

  id v7 = NSStringAbbreviatedFromBLSUpdateFidelity(v6);
  id v8 = [v2 stringWithFormat:@"%@ – %@", v5, v7];

  return v8;
}

- (BLSBacklightSceneEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (BLSBacklightSceneEnvironment *)WeakRetained;
}

- (BLSFrameSpecifierModel)model
{
  return (BLSFrameSpecifierModel *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_destroyWeak((id *)&self->_environment);
}

- (void)desiredFidelityForDateInterval:(void *)a1 timelines:withCompletion:.cold.1(void *a1)
{
  v1 = [a1 delegate];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_1B55DE000, v2, v3, "performDesiredFidelityRequest desiredFidelity:Minutes - nil timeline array returned by delegate:%@", v4, v5, v6, v7, v8);
}

- (void)desiredFidelityForDateInterval:(uint64_t)a1 timelines:(uint64_t)a2 withCompletion:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromBLSUpdateFidelity(a1);
  OUTLINED_FUNCTION_1_4();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1B55DE000, a3, OS_LOG_TYPE_DEBUG, "performDesiredFidelityRequest desiredFidelity:%{public}@ for timelines:%{public}@", v6, 0x16u);
}

- (void)performFrameSpecifiersRequest:(void *)a1 timelines:.cold.1(void *a1)
{
  v1 = [a1 delegate];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_1B55DE000, v2, v3, "nil timeline array returned by delegate:%@", v4, v5, v6, v7, v8);
}

- (void)performFrameSpecifiersRequest:(void *)a1 timelines:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "bls_shortLoggingString");
  OUTLINED_FUNCTION_1_4();
  _os_log_error_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_ERROR, "performFrameSpecifiersRequest: start of dateInterval %{public}@ is more than ten seconds ago so not purging", v4, 0xCu);
}

@end