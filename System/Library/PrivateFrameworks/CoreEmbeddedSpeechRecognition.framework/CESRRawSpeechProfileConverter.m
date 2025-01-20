@interface CESRRawSpeechProfileConverter
- (BOOL)_processRawSpeechProfile:(id)a3 deviceId:(id)a4 userId:(id)a5 error:(id *)a6;
- (BOOL)addCompanionRawSpeechProfile:(id)a3 deviceId:(id)a4 userId:(id)a5 error:(id *)a6;
- (BOOL)setPrimaryRawSpeechProfile:(id)a3 error:(id *)a4;
- (CESRRawSpeechProfileConverter)init;
- (CESRRawSpeechProfileConverter)initWithOmittedItemTypes:(id)a3;
- (id)convertToKVProfileWithError:(id *)a3;
@end

@implementation CESRRawSpeechProfileConverter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionPriors, 0);
  objc_storeStrong((id *)&self->_primaryPriors, 0);
  objc_storeStrong((id *)&self->_companionProfiles, 0);
  objc_storeStrong((id *)&self->_primaryProfile, 0);

  objc_storeStrong((id *)&self->_omitItemTypes, 0);
}

- (id)convertToKVProfileWithError:(id *)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (self->_primaryProfile)
  {
    if (![(NSMutableDictionary *)self->_companionProfiles count])
    {
      v7 = self->_primaryProfile;
      goto LABEL_17;
    }
    primaryProfile = self->_primaryProfile;
    v6 = [(NSMutableDictionary *)self->_companionProfiles allValues];
    id v20 = 0;
    v7 = +[CESRRawSpeechProfileTools mergeMultiUserPrimaryProfile:primaryProfile withCompanionProfiles:v6 error:&v20];
    id v8 = v20;

    if (v7)
    {
      v9 = v7;
LABEL_16:

      goto LABEL_17;
    }
    v15 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      companionProfiles = self->_companionProfiles;
      v18 = v15;
      uint64_t v19 = [(NSMutableDictionary *)companionProfiles count];
      *(_DWORD *)buf = 136315650;
      v22 = "-[CESRRawSpeechProfileConverter convertToKVProfileWithError:]";
      __int16 v23 = 2048;
      v24 = (__CFString *)v19;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_error_impl(&dword_1B8CCB000, v18, OS_LOG_TYPE_ERROR, "%s Failed to merge primary and %lu companion profile(s), error: %@", buf, 0x20u);

      if (!a3) {
        goto LABEL_16;
      }
    }
    else if (!a3)
    {
      goto LABEL_16;
    }
    if (v8) {
      *a3 = v8;
    }
    goto LABEL_16;
  }
  v10 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[CESRRawSpeechProfileConverter convertToKVProfileWithError:]";
    __int16 v23 = 2112;
    v24 = @"No primary profile data has been successfuly added to the builder.";
    _os_log_error_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v27 = *MEMORY[0x1E4F28568];
  v28[0] = @"No primary profile data has been successfuly added to the builder.";
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v13 = [v11 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:9 userInfo:v12];
  v14 = v13;
  if (a3 && v13) {
    *a3 = v13;
  }

  v7 = 0;
LABEL_17:

  return v7;
}

- (BOOL)_processRawSpeechProfile:(id)a3 deviceId:(id)a4 userId:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = (unint64_t)a4;
  unint64_t v11 = (unint64_t)a5;
  omitItemTypes = self->_omitItemTypes;
  id v18 = 0;
  v13 = +[CESRRawSpeechProfileTools convertRawSpeechProfile:a3 deviceId:v10 userId:v11 omitItemTypes:omitItemTypes error:&v18];
  id v14 = v18;
  if (v13)
  {
    if (v11) {
      [(NSMutableDictionary *)self->_companionProfiles setObject:v13 forKey:v11];
    }
    else {
      objc_storeStrong((id *)&self->_primaryProfile, v13);
    }
  }
  else
  {
    v15 = (id)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v10 | v11)
      {
        v17 = [NSString stringWithFormat:@"[companion: {deviceId: %@ userId: %@}]", v10, v11];
      }
      else
      {
        v17 = @"[primary]";
      }
      *(_DWORD *)buf = 136315650;
      id v20 = "-[CESRRawSpeechProfileConverter _processRawSpeechProfile:deviceId:userId:error:]";
      __int16 v21 = 2112;
      v22 = v17;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_error_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_ERROR, "%s Failed to convert rawSpeechProfile %@ to KVProfile, error: %@", buf, 0x20u);
    }
    if (a6 && v14) {
      *a6 = v14;
    }
  }

  return v13 != 0;
}

- (BOOL)addCompanionRawSpeechProfile:(id)a3 deviceId:(id)a4 userId:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 length])
  {
    if ([v12 length])
    {
      BOOL v13 = [(CESRRawSpeechProfileConverter *)self _processRawSpeechProfile:v10 deviceId:v11 userId:v12 error:a6];
      goto LABEL_14;
    }
    id v14 = [NSString stringWithFormat:@"userId must be nonempty string: %@", v12];
    id v20 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CESRRawSpeechProfileConverter addCompanionRawSpeechProfile:deviceId:userId:error:]";
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_error_impl(&dword_1B8CCB000, v20, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    __int16 v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    id v26 = v14;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v18 = v21;
    uint64_t v19 = 8;
  }
  else
  {
    id v14 = [NSString stringWithFormat:@"deviceId must be nonempty string: %@", v11];
    v15 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CESRRawSpeechProfileConverter addCompanionRawSpeechProfile:deviceId:userId:error:]";
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_error_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28 = v14;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v18 = v16;
    uint64_t v19 = 7;
  }
  v22 = [v18 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:v19 userInfo:v17];
  __int16 v23 = v22;
  if (a6 && v22) {
    *a6 = v22;
  }

  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)setPrimaryRawSpeechProfile:(id)a3 error:(id *)a4
{
  return [(CESRRawSpeechProfileConverter *)self _processRawSpeechProfile:a3 deviceId:0 userId:0 error:a4];
}

- (CESRRawSpeechProfileConverter)initWithOmittedItemTypes:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CESRRawSpeechProfileConverter;
  v6 = [(CESRRawSpeechProfileConverter *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_omitItemTypes, a3);
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    companionProfiles = v7->_companionProfiles;
    v7->_companionProfiles = v8;

    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    companionPriors = v7->_companionPriors;
    v7->_companionPriors = v10;
  }
  return v7;
}

- (CESRRawSpeechProfileConverter)init
{
  return [(CESRRawSpeechProfileConverter *)self initWithOmittedItemTypes:0];
}

@end