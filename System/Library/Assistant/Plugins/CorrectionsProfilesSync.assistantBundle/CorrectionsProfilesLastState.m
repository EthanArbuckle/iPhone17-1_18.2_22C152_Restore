@interface CorrectionsProfilesLastState
- (BOOL)loadLastState;
- (id)_path;
- (id)correctionKeys;
- (id)description;
- (id)digest;
- (id)profileDataForKey:(id)a3;
- (unint64_t)count;
- (void)saveNewState:(id)a3;
@end

@implementation CorrectionsProfilesLastState

- (void).cxx_destruct
{
}

- (unint64_t)count
{
  return self->_count;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@", objc_opt_class(), self, self->_persistedState];
}

- (void)saveNewState:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = [(CorrectionsProfilesLastState *)self _path];
  if (v4)
  {
    persistedState = self->_persistedState;
    if (!persistedState)
    {
      v8 = objc_alloc_init(CorrectionsProfilesPersistedState);
      v9 = self->_persistedState;
      self->_persistedState = v8;

      persistedState = self->_persistedState;
    }
    [(CorrectionsProfilesPersistedState *)persistedState setCorrectionsProfiles:v4];
    v10 = self->_persistedState;
    v11 = CorrectionsProfilesDigest(v4);
    [(CorrectionsProfilesPersistedState *)v10 setDigest:v11];

    v12 = [(CorrectionsProfilesPersistedState *)self->_persistedState digest];

    if (!v12) {
      [(CorrectionsProfilesPersistedState *)self->_persistedState setCorrectionsProfiles:0];
    }
    v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:self->_persistedState requiringSecureCoding:1 error:0];
    v14 = v13;
    if (v13)
    {
      id v22 = 0;
      char v15 = [v13 writeToFile:v6 options:1 error:&v22];
      id v16 = v22;
      if ((v15 & 1) == 0)
      {
        v17 = *MEMORY[0x263F28380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v24 = "-[CorrectionsProfilesLastState saveNewState:]";
          __int16 v25 = 2112;
          id v26 = v4;
          _os_log_error_impl(&dword_222E28000, v17, OS_LOG_TYPE_ERROR, "%s Could not save state: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v20 = *MEMORY[0x263F28380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[CorrectionsProfilesLastState saveNewState:]";
        __int16 v25 = 2112;
        id v26 = v4;
        _os_log_error_impl(&dword_222E28000, v20, OS_LOG_TYPE_ERROR, "%s Could not archive state: %@", buf, 0x16u);
      }
      id v16 = 0;
    }

LABEL_18:
    goto LABEL_19;
  }
  id v21 = 0;
  char v18 = [v5 removeItemAtPath:v6 error:&v21];
  id v16 = v21;
  if (v16 || (v18 & 1) == 0)
  {
    v19 = *MEMORY[0x263F28380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[CorrectionsProfilesLastState saveNewState:]";
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_error_impl(&dword_222E28000, v19, OS_LOG_TYPE_ERROR, "%s Failed to remove previous state:%@", buf, 0x16u);
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (id)profileDataForKey:(id)a3
{
  persistedState = self->_persistedState;
  id v4 = a3;
  v5 = [(CorrectionsProfilesPersistedState *)persistedState correctionsProfiles];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)correctionKeys
{
  id v3 = objc_alloc(MEMORY[0x263EFFA08]);
  id v4 = [(CorrectionsProfilesPersistedState *)self->_persistedState correctionsProfiles];
  v5 = [v4 allKeys];
  v6 = (void *)[v3 initWithArray:v5];

  return v6;
}

- (id)digest
{
  return [(CorrectionsProfilesPersistedState *)self->_persistedState digest];
}

- (BOOL)loadLastState
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(CorrectionsProfilesLastState *)self _path];
  id v20 = 0;
  id v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3 options:2 error:&v20];
  id v5 = v20;
  v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    v12 = (void *)MEMORY[0x263F08928];
    v13 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    v14 = [v12 unarchivedObjectOfClasses:v13 fromData:v4 error:0];

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&self->_persistedState, v14);
        char v15 = [(CorrectionsProfilesPersistedState *)self->_persistedState correctionsProfiles];
        self->_count = [v15 count];

        BOOL v16 = 1;
LABEL_18:

        goto LABEL_19;
      }
      v17 = *MEMORY[0x263F28380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_ERROR))
      {
LABEL_17:
        BOOL v16 = 0;
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136315394;
      id v22 = "-[CorrectionsProfilesLastState loadLastState]";
      __int16 v23 = 2112;
      v24 = v14;
      char v18 = "%s Last state data is of unexpected format: %@";
    }
    else
    {
      v17 = *MEMORY[0x263F28380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136315394;
      id v22 = "-[CorrectionsProfilesLastState loadLastState]";
      __int16 v23 = 2112;
      v24 = v4;
      char v18 = "%s Unable to decode data: %@";
    }
    _os_log_error_impl(&dword_222E28000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
    goto LABEL_17;
  }
  v8 = [MEMORY[0x263F08850] defaultManager];
  int v9 = [v8 fileExistsAtPath:v3];

  v10 = *MEMORY[0x263F28380];
  v11 = *MEMORY[0x263F28380];
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[CorrectionsProfilesLastState loadLastState]";
      _os_log_error_impl(&dword_222E28000, v10, OS_LOG_TYPE_ERROR, "%s Unable to read last persisted corrections state", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[CorrectionsProfilesLastState loadLastState]";
    _os_log_impl(&dword_222E28000, v10, OS_LOG_TYPE_INFO, "%s No corrections state has been persisted", buf, 0xCu);
  }
  BOOL v16 = 0;
LABEL_19:

  return v16;
}

- (id)_path
{
  v2 = AFUserSupportDirectoryPath();
  id v3 = [v2 stringByAppendingPathComponent:@"com.apple.siri.corrections.laststate.plist"];

  return v3;
}

@end