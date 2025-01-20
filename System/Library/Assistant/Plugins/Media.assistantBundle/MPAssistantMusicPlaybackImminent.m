@interface MPAssistantMusicPlaybackImminent
- (void)_perform:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantMusicPlaybackImminent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (void)_perform:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F76E68] systemMediaApplicationDestination];
  id v6 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  v37[0] = *MEMORY[0x1E4F77680];
  v7 = [(MPAssistantMusicPlaybackImminent *)self refId];
  v37[1] = *MEMORY[0x1E4F77770];
  v38[0] = v7;
  v38[1] = @"com.apple.MediaAssistant.siri";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v9 = (void *)[v8 mutableCopy];

  userIdentity = self->_userIdentity;
  id v32 = 0;
  v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:userIdentity requiringSecureCoding:1 error:&v32];
  id v12 = v32;
  if (v12)
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      v13 = [(MPAssistantMusicPlaybackImminent *)self aceId];
      sub_1D4244ECC(@"Music Playback Imminent", v13);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v14;
    }
    v16 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v34 = v17;
      __int16 v35 = 2114;
      id v36 = v12;
      v18 = "Music Playback Imminent (perform) <%{public}@>: user identity encoding failed %{public}@";
      v19 = v16;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_1D422A000, v19, v20, v18, buf, 0x16u);
    }
  }
  else
  {
    [v9 setObject:v11 forKey:*MEMORY[0x1E4F777E0]];
    if (![(NSString *)self->_requestAceHash length])
    {
      v21 = [(MPAssistantMusicPlaybackImminent *)self aceId];
      sub_1D4244ECC(@"Music Playback Imminent", v21);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v23 = self->_requestAceHash;
      self->_requestAceHash = v22;
    }
    v16 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_requestAceHash;
      *(_DWORD *)buf = 138543619;
      v34 = v24;
      __int16 v35 = 2113;
      id v36 = v11;
      v18 = "Music Playback Imminent (perform) <%{public}@>: user identity %{private}@";
      v19 = v16;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  privateListeningEnabled = self->_privateListeningEnabled;
  if (privateListeningEnabled) {
    [v9 setObject:privateListeningEnabled forKeyedSubscript:*MEMORY[0x1E4F77750]];
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1D4255AE4;
  v28[3] = &unk_1E69E3AB0;
  v30 = self;
  id v31 = v4;
  id v29 = v6;
  id v26 = v4;
  id v27 = v6;
  [v27 sendCommand:132 toDestination:v5 withOptions:v9 completion:v28];
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantMusicPlaybackImminent *)self aceId];
    sub_1D4244ECC(@"Music Playback Imminent", v5);
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    os_log_type_t v20 = v9;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Music Playback Imminent (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  v10 = sub_1D42461A8();
  dispatch_group_enter(v10);
  v11 = self->_requestAceHash;
  id v12 = [(SAMPMusicPlaybackImminent *)self preloadedUserSharedUserId];
  v13 = [(SAMPMusicPlaybackImminent *)self preloadedUserSharedUserId];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1D4255E5C;
  v16[3] = &unk_1E69E3A88;
  v17 = v10;
  id v18 = v4;
  v16[4] = self;
  v14 = v10;
  id v15 = v4;
  sub_1D4246230(@"Music Playback Imminent", v11, v12, v13, v16);
}

@end