@interface FAEligiblityEvaluationRequest
- (FAEligiblityEvaluationRequest)initWithPropertyName:(id)a3 bundleID:(id)a4;
- (NSString)bundleID;
- (NSString)propertyName;
- (unint64_t)fetchEligibilityWithError:(id *)a3;
- (void)startRequestWithCompletion:(id)a3;
@end

@implementation FAEligiblityEvaluationRequest

- (FAEligiblityEvaluationRequest)initWithPropertyName:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FAEligiblityEvaluationRequest;
  v8 = [(FAFamilyCircleRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    propertyName = v8->_propertyName;
    v8->_propertyName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v11;
  }
  return v8;
}

- (void)startRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(FAEligiblityEvaluationRequest *)self propertyName];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __60__FAEligiblityEvaluationRequest_startRequestWithCompletion___block_invoke;
  v12 = &unk_1E6924E58;
  id v13 = v5;
  id v14 = v4;
  id v6 = v4;
  id v7 = v5;
  v8 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:&v9];
  objc_msgSend(v8, "fetchEligibilityForPropertyName:bundleID:completion:", self->_propertyName, self->_bundleID, v6, v9, v10, v11, v12);
}

void __60__FAEligiblityEvaluationRequest_startRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__FAEligiblityEvaluationRequest_startRequestWithCompletion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)fetchEligibilityWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x3032000000;
  v18[2] = __Block_byref_object_copy__5;
  v18[3] = __Block_byref_object_dispose__5;
  id v19 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__FAEligiblityEvaluationRequest_fetchEligibilityWithError___block_invoke;
  v12[3] = &unk_1E69257C0;
  v12[4] = &v17;
  v5 = [(FAFamilyCircleRequest *)self synchronousRemoteObjectWithErrorHandler:v12];
  propertyName = self->_propertyName;
  bundleID = self->_bundleID;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__FAEligiblityEvaluationRequest_fetchEligibilityWithError___block_invoke_2;
  v11[3] = &unk_1E69258D0;
  v11[4] = &v17;
  v11[5] = &v13;
  [v5 fetchEligibilityForPropertyName:propertyName bundleID:bundleID completion:v11];
  if (*(void *)(v18[0] + 40))
  {
    v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FAEligiblityEvaluationRequest fetchEligibilityWithError:]((uint64_t)v18, v8);
    }
  }
  if (a3) {
    *a3 = *(id *)(v18[0] + 40);
  }
  unint64_t v9 = v14[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __59__FAEligiblityEvaluationRequest_fetchEligibilityWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __59__FAEligiblityEvaluationRequest_fetchEligibilityWithError___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

void __60__FAEligiblityEvaluationRequest_startRequestWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D252C000, log, OS_LOG_TYPE_ERROR, "Failed to evaluate eligibility for property %@ with XPC error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)fetchEligibilityWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D252C000, a2, OS_LOG_TYPE_ERROR, "FARecommendationRequest - synchronous fetchRecommendation request failed with error: %@", (uint8_t *)&v3, 0xCu);
}

@end