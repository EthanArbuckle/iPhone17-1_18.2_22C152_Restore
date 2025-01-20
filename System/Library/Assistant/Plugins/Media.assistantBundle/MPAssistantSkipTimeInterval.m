@interface MPAssistantSkipTimeInterval
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantSkipTimeInterval

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  if (![(NSString *)self->_requestAceHash length])
  {
    v6 = [(MPAssistantSkipTimeInterval *)self aceId];
    sub_1D4244ECC(@"Skip Time Interval", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;
  }
  v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    v11 = [(MPAssistantSkipTimeInterval *)self hashedRouteUIDs];
    uint64_t v12 = [v11 count];
    v13 = [(MPAssistantSkipTimeInterval *)self adjustmentInMilliseconds];
    *(_DWORD *)buf = 138543874;
    v45 = v10;
    __int16 v46 = 2048;
    uint64_t v47 = v12;
    __int16 v48 = 2114;
    v49 = v13;
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "Skip Time Interval (invoke) <%{public}@>: %lu UIDs, %{public}@ milliseconds", buf, 0x20u);
  }
  v14 = self->_requestAceHash;
  v15 = [(MPAssistantSkipTimeInterval *)self hashedRouteUIDs];
  sub_1D4245018(@"Skip Time Interval", v14, v15);

  v16 = [(MPAssistantSkipTimeInterval *)self adjustmentInMilliseconds];
  [v16 doubleValue];
  double v18 = v17;

  if (v18 >= 0.0) {
    int v19 = 17;
  }
  else {
    int v19 = 18;
  }
  v42[0] = *MEMORY[0x1E4F777A0];
  v20 = NSNumber;
  v21 = [(MPAssistantSkipTimeInterval *)self adjustmentInMilliseconds];
  uint64_t v22 = [v21 longValue];
  if (v22 >= 0) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = -v22;
  }
  v24 = [v20 numberWithDouble:(double)v23 / 1000.0];
  v43[0] = v24;
  v42[1] = *MEMORY[0x1E4F77680];
  v25 = [(MPAssistantSkipTimeInterval *)self refId];
  v42[2] = *MEMORY[0x1E4F77770];
  v43[1] = v25;
  v43[2] = @"com.apple.MediaAssistant.siri";
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];

  id v27 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  v28 = [MEMORY[0x1E4F76E48] nowPlayingApplicationDestination];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1D425387C;
  v34[3] = &unk_1E69E39E8;
  id v35 = v28;
  v36 = self;
  int v41 = v19;
  id v37 = v27;
  id v38 = v26;
  id v39 = v5;
  id v40 = v4;
  id v29 = v4;
  id v30 = v5;
  id v31 = v26;
  id v32 = v27;
  id v33 = v28;
  sub_1D425387C((uint64_t)v34, 0);
}

@end