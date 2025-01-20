@interface MPAssistantSetRepeatMode
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantSetRepeatMode

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, id))a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  if (![(NSString *)self->_requestAceHash length])
  {
    v6 = [(MPAssistantSetRepeatMode *)self aceId];
    sub_1D4244ECC(@"Set Repeat Mode", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;
  }
  v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    v11 = [(MPAssistantSetRepeatMode *)self hashedRouteUIDs];
    uint64_t v12 = [v11 count];
    v13 = [(MPAssistantSetRepeatMode *)self repeatMode];
    *(_DWORD *)buf = 138543874;
    v40 = v10;
    __int16 v41 = 2048;
    uint64_t v42 = v12;
    __int16 v43 = 2114;
    v44 = v13;
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "Set Repeat Mode (invoke) <%{public}@>: %lu UIDs, %{public}@ mode", buf, 0x20u);
  }
  v14 = self->_requestAceHash;
  uint64_t v15 = [(MPAssistantSetRepeatMode *)self hashedRouteUIDs];
  sub_1D4245018(@"Set Repeat Mode", v14, (void *)v15);

  v16 = [(MPAssistantSetRepeatMode *)self repeatMode];
  LOBYTE(v15) = [v16 isEqualToString:*MEMORY[0x1E4F97468]];

  if (v15)
  {
    uint64_t v17 = 3;
  }
  else
  {
    v18 = [(MPAssistantSetRepeatMode *)self repeatMode];
    char v19 = [v18 isEqualToString:*MEMORY[0x1E4F97478]];

    if (v19)
    {
      uint64_t v17 = 2;
    }
    else
    {
      v20 = [(MPAssistantSetRepeatMode *)self repeatMode];
      char v21 = [v20 isEqualToString:*MEMORY[0x1E4F97470]];

      if ((v21 & 1) == 0)
      {
        id v29 = objc_alloc_init(MEMORY[0x1E4F965A8]);
        id v28 = [v29 dictionary];
        v4[2](v4, v28);
        goto LABEL_12;
      }
      uint64_t v17 = 1;
    }
  }
  v37[0] = *MEMORY[0x1E4F77778];
  v22 = [NSNumber numberWithInt:v17];
  v38[0] = v22;
  v37[1] = *MEMORY[0x1E4F77680];
  v23 = [(MPAssistantSetRepeatMode *)self refId];
  v37[2] = *MEMORY[0x1E4F77770];
  v38[1] = v23;
  v38[2] = @"com.apple.MediaAssistant.siri";
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

  id v25 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  v26 = [MEMORY[0x1E4F76E48] nowPlayingApplicationDestination];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1D4240D78;
  v30[3] = &unk_1E69E3EE0;
  id v31 = v26;
  v32 = self;
  id v33 = v25;
  id v34 = v24;
  id v35 = v5;
  v36 = v4;
  id v27 = v24;
  id v28 = v25;
  id v29 = v26;
  sub_1D4240D78((uint64_t)v30, 0);

LABEL_12:
}

@end