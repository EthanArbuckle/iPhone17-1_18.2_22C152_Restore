@interface MPAssistantRateMediaEntity
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantRateMediaEntity

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [(MPAssistantRateMediaEntity *)self hashedRouteUID];

  if (v6)
  {
    v7 = [(MPAssistantRateMediaEntity *)self hashedRouteUID];
    v40[0] = v7;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  }
  if (![(NSString *)self->_requestAceHash length])
  {
    v8 = [(MPAssistantRateMediaEntity *)self aceId];
    sub_1D4244ECC(@"Rate Media Entity", v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v9;
  }
  v11 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_requestAceHash;
    *(_DWORD *)buf = 138543874;
    v35 = v12;
    __int16 v36 = 2048;
    uint64_t v37 = [v6 count];
    __int16 v38 = 2048;
    uint64_t v39 = [(MPAssistantRateMediaEntity *)self rating];
    _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_DEFAULT, "Rate Media Entity (invoke) <%{public}@>: %lu UIDs rating %ld", buf, 0x20u);
  }

  sub_1D4245018(@"Rate Media Entity", self->_requestAceHash, v6);
  double v13 = (double)[(MPAssistantRateMediaEntity *)self rating] / 5.0;
  *(float *)&double v13 = v13;
  v32[0] = *MEMORY[0x1E4F77760];
  v14 = [NSNumber numberWithFloat:v13];
  v32[1] = *MEMORY[0x1E4F77770];
  v33[0] = v14;
  v33[1] = @"com.apple.MediaAssistant.siri";
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  id v16 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  v17 = [MEMORY[0x1E4F76E48] nowPlayingApplicationDestination];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1D422B9B0;
  v24[3] = &unk_1E69E2950;
  id v25 = v17;
  id v26 = v6;
  id v27 = v16;
  id v28 = v15;
  id v29 = v5;
  v30 = self;
  id v31 = v4;
  id v18 = v4;
  id v19 = v5;
  id v20 = v15;
  id v21 = v16;
  id v22 = v6;
  id v23 = v17;
  sub_1D422B9B0((uint64_t)v24, 0);
}

@end