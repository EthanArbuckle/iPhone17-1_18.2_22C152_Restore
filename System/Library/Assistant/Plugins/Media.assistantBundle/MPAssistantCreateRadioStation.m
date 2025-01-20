@interface MPAssistantCreateRadioStation
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantCreateRadioStation

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantCreateRadioStation *)self aceId];
    sub_1D4244ECC(@"Create Radio Station", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = v4;
    v9 = self->_requestAceHash;
    v38 = [(MPAssistantCreateRadioStation *)self hashedRouteUIDs];
    uint64_t v10 = [v38 count];
    v11 = [(MPAssistantCreateRadioStation *)self assetInfo];
    if ([v11 length]) {
      v12 = @"present";
    }
    else {
      v12 = @"not present";
    }
    v13 = [(MPAssistantCreateRadioStation *)self startPlaying];
    v14 = [(MPAssistantCreateRadioStation *)self stationUrl];
    *(_DWORD *)buf = 138544386;
    v61 = v9;
    id v4 = v39;
    __int16 v62 = 2048;
    uint64_t v63 = v10;
    __int16 v64 = 2114;
    v65 = v12;
    __int16 v66 = 2114;
    v67 = v13;
    __int16 v68 = 2114;
    v69 = v14;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Create Radio Station (invoke) <%{public}@>: %lu UIDs, asset info %{public}@, start %{public}@, station %{public}@", buf, 0x34u);
  }
  v15 = self->_requestAceHash;
  v16 = [(MPAssistantCreateRadioStation *)self hashedRouteUIDs];
  sub_1D4245018(@"Create Radio Station", v15, v16);

  v17 = [(MPAssistantCreateRadioStation *)self stationUrl];
  v18 = [v17 absoluteString];

  v58[0] = *MEMORY[0x1E4F77790];
  uint64_t v19 = [(MPAssistantCreateRadioStation *)self startPlaying];
  v20 = (void *)v19;
  uint64_t v21 = MEMORY[0x1E4F1CC28];
  if (v19) {
    uint64_t v21 = v19;
  }
  v58[1] = *MEMORY[0x1E4F77770];
  v59[0] = v21;
  v59[1] = @"com.apple.MediaAssistant.siri";
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
  v23 = (void *)[v22 mutableCopy];

  if (v18) {
    [v23 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F777C8]];
  }
  v24 = [(MPAssistantCreateRadioStation *)self refId];
  if (v24) {
    [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F77680]];
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = sub_1D424E3DC;
  v53[3] = &unk_1E69E3650;
  id v25 = v23;
  id v54 = v25;
  id v26 = v4;
  id v57 = v26;
  v55 = self;
  id v27 = v18;
  id v56 = v27;
  v28 = (void *)MEMORY[0x1D94452A0](v53);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = sub_1D424E4DC;
  v50[3] = &unk_1E69E36A0;
  v50[4] = self;
  id v29 = v28;
  id v51 = v29;
  id v30 = v26;
  id v52 = v30;
  v31 = (void *)MEMORY[0x1D94452A0](v50);
  v32 = [(MPAssistantCreateRadioStation *)self hashedRouteUIDs];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    id v34 = objc_alloc_init(MEMORY[0x1E4F76E28]);
    v35 = [MEMORY[0x1E4F76E48] systemMediaApplicationDestination];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = sub_1D424E68C;
    v40[3] = &unk_1E69E3740;
    id v41 = v35;
    v42 = self;
    id v43 = v34;
    id v44 = v25;
    id v45 = v30;
    id v36 = v34;
    id v37 = v35;
    sub_1D424E68C((uint64_t)v40, 0);
  }
  else
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = sub_1D424E5B0;
    v46[3] = &unk_1E69E36F0;
    v46[4] = self;
    id v47 = v31;
    id v48 = v30;
    id v49 = v29;
    sub_1D424E5B0((uint64_t)v46, 0);
  }
}

@end