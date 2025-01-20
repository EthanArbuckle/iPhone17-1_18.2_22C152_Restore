@interface ATXUnifiedActivityBiomeStream
- (ATXUnifiedActivityBiomeStream)init;
- (id)_mergeTransitionPublisher:(id)a3 withOthers:(id)a4;
- (id)_mergeTransitionPublishers:(id)a3;
- (id)efficientCurrentMode;
- (id)initFromTimeBasedTransitionStream:(id)a3 appLaunchBasedTransitionStream:(id)a4 heuristicTransitionStream:(id)a5 userFocusTransitionStream:(id)a6;
- (id)sessionPublisherFromStartTime:(double)a3;
- (id)transitionPublisherFromStartTime:(double)a3;
@end

@implementation ATXUnifiedActivityBiomeStream

- (id)initFromTimeBasedTransitionStream:(id)a3 appLaunchBasedTransitionStream:(id)a4 heuristicTransitionStream:(id)a5 userFocusTransitionStream:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXUnifiedActivityBiomeStream;
  v15 = [(ATXUnifiedActivityBiomeStream *)&v18 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timeBasedInferredActivityStream, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (ATXUnifiedActivityBiomeStream)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(ATXUnifiedActivityBiomeStream *)self initFromTimeBasedTransitionStream:v3 appLaunchBasedTransitionStream:v4 heuristicTransitionStream:v5 userFocusTransitionStream:v6];

  return v7;
}

- (id)efficientCurrentMode
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__76;
  v25 = __Block_byref_object_dispose__76;
  id v26 = 0;
  v3 = [(ATXUserFocusComputedActivityBiomeStream *)self->_userFocusComputedActivityStream transitionPublisherFromStartTime:0 endTime:0 maxEvents:&unk_1F27F1BA8 lastN:0 reversed:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke;
  v20[3] = &unk_1E68AD400;
  v20[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_18;
  v19[3] = &unk_1E68B3B78;
  v19[4] = &v21;
  id v4 = (id)[v3 sinkWithCompletion:v20 receiveInput:v19];

  v5 = (void *)v22[5];
  if (v5 && [v5 isEntryEvent])
  {
    v6 = [(id)v22[5] mode];
  }
  else
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__76;
    v17 = __Block_byref_object_dispose__76;
    id v18 = 0;
    v7 = [(ATXHeuristicInferredActivityBiomeStream *)self->_heuristicInferredActivityStream transitionPublisherFromStartTime:0 endTime:0 maxEvents:&unk_1F27F1BA8 lastN:0 reversed:1];
    v11[4] = &v13;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_2;
    v12[3] = &unk_1E68AD400;
    v12[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_20;
    v11[3] = &unk_1E68B3B78;
    id v8 = (id)[v7 sinkWithCompletion:v12 receiveInput:v11];

    v9 = (void *)v14[5];
    if (v9 && [v9 isEntryEvent])
    {
      v6 = [(id)v14[5] mode];
    }
    else
    {
      v6 = 0;
    }
    _Block_object_dispose(&v13, 8);
  }
  _Block_object_dispose(&v21, 8);

  return v6;
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_cold_1(a1, v3);
    }
  }
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_18(uint64_t a1, void *a2)
{
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_2_cold_1(a1, v3);
    }
  }
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_20(uint64_t a1, void *a2)
{
}

- (id)transitionPublisherFromStartTime:(double)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v5 = -[ATXTimeBasedInferredActivityBiomeStream transitionPublisherFromStartTime:](self->_timeBasedInferredActivityStream, "transitionPublisherFromStartTime:");
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CBF0] bpsPublisher];
  }
  v18[0] = v6;
  v7 = [(ATXAppLaunchBasedInferredActivityBiomeStream *)self->_appLaunchInferredActivityStream transitionPublisherFromStartTime:a3];
  id v8 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F1CBF0] bpsPublisher];
  }
  v18[1] = v8;
  v9 = [(ATXHeuristicInferredActivityBiomeStream *)self->_heuristicInferredActivityStream transitionPublisherFromStartTime:a3];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CBF0] bpsPublisher];
  }
  v18[2] = v10;
  id v11 = [(ATXUserFocusComputedActivityBiomeStream *)self->_userFocusComputedActivityStream transitionPublisherFromStartTime:a3];
  id v12 = v11;
  if (!v11)
  {
    id v12 = [MEMORY[0x1E4F1CBF0] bpsPublisher];
  }
  v18[3] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  if (!v11) {

  }
  if (!v9) {
  if (!v7)
  }

  if (!v5) {
  id v14 = [(ATXUnifiedActivityBiomeStream *)self _mergeTransitionPublishers:v13];
  }
  uint64_t v15 = objc_opt_new();
  v16 = [v15 combineTransitions:v14];

  return v16;
}

- (id)_mergeTransitionPublishers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    if ([v4 count] == 1)
    {
      id v6 = v5;
    }
    else
    {
      v7 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
      id v6 = [(ATXUnifiedActivityBiomeStream *)self _mergeTransitionPublisher:v5 withOthers:v7];
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CBF0] bpsPublisher];
  }

  return v6;
}

- (id)_mergeTransitionPublisher:(id)a3 withOthers:(id)a4
{
  return (id)[a3 orderedMergeWithOthers:a4 comparator:&__block_literal_global_163];
}

uint64_t __70__ATXUnifiedActivityBiomeStream__mergeTransitionPublisher_withOthers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = NSNumber;
  [v4 transitionTime];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = NSNumber;
  [v5 transitionTime];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v10 = [v7 compare:v9];

  if (!v10)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isEntryEvent"));
    id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isEntryEvent"));
    uint64_t v10 = [v11 compare:v12];
  }
  return v10;
}

- (id)sessionPublisherFromStartTime:(double)a3
{
  id v3 = [(ATXUnifiedActivityBiomeStream *)self transitionPublisherFromStartTime:a3];
  id v4 = +[_ATXUnifiedActivityStreamConversions sessionPublisherFromTransitionPublisher:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFocusComputedActivityStream, 0);
  objc_storeStrong((id *)&self->_heuristicInferredActivityStream, 0);
  objc_storeStrong((id *)&self->_appLaunchInferredActivityStream, 0);
  objc_storeStrong((id *)&self->_timeBasedInferredActivityStream, 0);
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [a2 error];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v6, v7, "%@ - error fetching last activity transition from ATXUserFocusComputedActivityBiomeStream: %@", v8, v9, v10, v11, v12);
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [a2 error];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v6, v7, "%@ - error fetching last activity transition from ATXHeuristicInferredActivityBiomeStream: %@", v8, v9, v10, v11, v12);
}

@end