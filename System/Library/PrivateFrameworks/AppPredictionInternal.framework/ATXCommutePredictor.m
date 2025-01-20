@interface ATXCommutePredictor
- (ATXCommutePredictor)initWithTransitionsCache:(id)a3 locationManager:(id)a4;
- (id)getNextTransitionOnActivity:(id)a3;
- (void)prewarmOnActivity:(id)a3;
@end

@implementation ATXCommutePredictor

- (ATXCommutePredictor)initWithTransitionsCache:(id)a3 locationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXCommutePredictor;
  v9 = [(ATXCommutePredictor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cache, a3);
    objc_storeStrong((id *)&v10->_manager, a4);
  }

  return v10;
}

- (id)getNextTransitionOnActivity:(id)a3
{
  id v4 = a3;
  v5 = [(ATXLocationManagerProtocol *)self->_manager locationOfInterestAtCurrentLocation];
  v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v7 = [v5 type];
  uint64_t v8 = [v6 type];
  if (!v7)
  {
    v9 = [(ATXPredictedTransitionsCache *)self->_cache getNextHomeToWorkTransitionsOnActivity:v4];
    v17 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "Sending cached home to work transition", buf, 2u);
    }

    id v18 = objc_alloc(MEMORY[0x1E4F935F0]);
    objc_super v12 = objc_opt_new();
    [v6 coordinate];
    v13 = v18;
    v14 = v12;
    uint64_t v15 = 1;
    goto LABEL_11;
  }
  if (v8 != 1)
  {
LABEL_7:
    v16 = 0;
    v9 = 0;
    goto LABEL_12;
  }
  v9 = [(ATXPredictedTransitionsCache *)self->_cache getNextWorkToHomeTransitionsOnActivity:v4];
  v10 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Sending cached work to home transition", v23, 2u);
  }

  id v11 = objc_alloc(MEMORY[0x1E4F935F0]);
  objc_super v12 = objc_opt_new();
  [v6 coordinate];
  v13 = v11;
  v14 = v12;
  uint64_t v15 = 0;
LABEL_11:
  v16 = objc_msgSend(v13, "initWithUUID:visits:coordinate:type:", v14, 0, v15);

LABEL_12:
  v19 = [v9 sortedArrayUsingSelector:sel_compare_];
  v20 = [v19 firstObject];

  v21 = [[ATXPredictedTransition alloc] initWithDate:v20 loi:v16];
  return v21;
}

- (void)prewarmOnActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end