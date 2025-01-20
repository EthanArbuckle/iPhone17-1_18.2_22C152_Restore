@interface CESRFidesASRRecord
+ (BOOL)supportsSecureCoding;
+ (id)recordFromData:(id)a3;
+ (id)recordWithLanguage:(id)a3 task:(id)a4 context:(id)a5 narrowband:(BOOL)a6 farField:(BOOL)a7 interactionIdentifier:(id)a8 asrSelfComponentIdentifier:(id)a9 pluginId:(id)a10;
+ (id)recordWithLanguage:(id)a3 task:(id)a4 context:(id)a5 narrowband:(BOOL)a6 farField:(BOOL)a7 interactionIdentifier:(id)a8 asrSelfComponentIdentifier:(id)a9 pluginId:(id)a10 frequency:(unint64_t)a11;
+ (void)deleteAllRecordsForPlugin:(id)a3 completion:(id)a4;
- (BOOL)farField;
- (BOOL)hasData;
- (BOOL)hasRecognizedAnything;
- (BOOL)personalizedLMUsed;
- (CESRFidesASRRecord)initWithCoder:(id)a3;
- (CESRFidesASRRecord)initWithLanguage:(id)a3 task:(id)a4 context:(id)a5 narrowband:(BOOL)a6 farField:(BOOL)a7 interactionIdentifier:(id)a8 asrSelfComponentIdentifier:(id)a9 pluginId:(id)a10;
- (NSArray)alternatives;
- (NSArray)context;
- (NSArray)recognizedNbest;
- (NSArray)recognizedText;
- (NSData)profile;
- (NSMutableArray)audioPackets;
- (NSString)UUIDString;
- (NSString)applicationName;
- (NSString)asrSelfComponentIdentifier;
- (NSString)correctedText;
- (NSString)correctedTextV2;
- (NSString)date;
- (NSString)interactionIdentifier;
- (NSString)language;
- (NSString)pluginId;
- (NSString)postITNRecognizedText;
- (NSString)task;
- (NSURL)originalAudioFileURL;
- (double)_audioPacketsDuration;
- (double)timestamp;
- (id)_recordData;
- (id)_recordInfo;
- (id)concatenatedAudioPackets;
- (id)description;
- (id)todaysDate;
- (unint64_t)samplingRate;
- (void)addAudioPacket:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)markRecognition;
- (void)save;
- (void)saveOneRecordPerDay;
- (void)setAlternatives:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setCorrectedText:(id)a3;
- (void)setCorrectedTextV2:(id)a3;
- (void)setDate:(id)a3;
- (void)setOriginalAudioFileURL:(id)a3;
- (void)setPersonalizedLMUsed:(BOOL)a3;
- (void)setPostITNRecognizedText:(id)a3;
- (void)setProfile:(id)a3;
- (void)setRecognizedNbest:(id)a3;
- (void)setRecognizedText:(id)a3;
@end

@implementation CESRFidesASRRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_postITNRecognizedText, 0);
  objc_storeStrong((id *)&self->_recognizedNbest, 0);
  objc_storeStrong((id *)&self->_recognizedText, 0);
  objc_storeStrong((id *)&self->_correctedTextV2, 0);
  objc_storeStrong((id *)&self->_correctedText, 0);
  objc_storeStrong((id *)&self->_asrSelfComponentIdentifier, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_audioPackets, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_pluginId, 0);
}

- (void)setOriginalAudioFileURL:(id)a3
{
}

- (NSURL)originalAudioFileURL
{
  return self->_originalAudioFileURL;
}

- (void)setProfile:(id)a3
{
}

- (NSData)profile
{
  return self->_profile;
}

- (void)setAlternatives:(id)a3
{
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setDate:(id)a3
{
}

- (NSString)date
{
  return self->_date;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setPersonalizedLMUsed:(BOOL)a3
{
  self->_personalizedLMUsed = a3;
}

- (BOOL)personalizedLMUsed
{
  return self->_personalizedLMUsed;
}

- (void)setPostITNRecognizedText:(id)a3
{
}

- (NSString)postITNRecognizedText
{
  return self->_postITNRecognizedText;
}

- (void)setRecognizedNbest:(id)a3
{
}

- (NSArray)recognizedNbest
{
  return self->_recognizedNbest;
}

- (void)setRecognizedText:(id)a3
{
}

- (NSArray)recognizedText
{
  return self->_recognizedText;
}

- (NSString)correctedTextV2
{
  return self->_correctedTextV2;
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (NSString)asrSelfComponentIdentifier
{
  return self->_asrSelfComponentIdentifier;
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (BOOL)hasRecognizedAnything
{
  return self->_hasRecognizedAnything;
}

- (NSMutableArray)audioPackets
{
  return self->_audioPackets;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (NSArray)context
{
  return self->_context;
}

- (BOOL)farField
{
  return self->_farField;
}

- (unint64_t)samplingRate
{
  return self->_samplingRate;
}

- (NSString)task
{
  return self->_task;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)pluginId
{
  return self->_pluginId;
}

- (void)saveOneRecordPerDay
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F5F4F8]) initWithBundleIdentifier:self->_pluginId];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__CESRFidesASRRecord_saveOneRecordPerDay__block_invoke;
  v5[3] = &unk_1E61C3090;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 fetchSavedRecordInfoWithCompletion:v5];
}

void __41__CESRFidesASRRecord_saveOneRecordPerDay__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CESRFidesASRRecord saveOneRecordPerDay]_block_invoke";
      _os_log_error_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_ERROR, "%s Failed to fetch records.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v19 = a1;
    v8 = [*(id *)(a1 + 32) todaysDate];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v9 = [v5 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v15 = [v5 objectForKeyedSubscript:v14];
          v16 = [v15 objectForKeyedSubscript:@"date"];

          if ([v16 isEqualToString:v8])
          {
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __41__CESRFidesASRRecord_saveOneRecordPerDay__block_invoke_2;
            v20[3] = &unk_1E61C3068;
            uint64_t v18 = *(void *)(v19 + 32);
            v17 = *(void **)(v19 + 40);
            v20[4] = v14;
            v20[5] = v18;
            [v17 deleteSavedRecordWithIdentfier:v14 completion:v20];

            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    [*(id *)(v19 + 32) save];
LABEL_14:

    id v6 = 0;
  }
}

void __41__CESRFidesASRRecord_saveOneRecordPerDay__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *MEMORY[0x1E4F4E370];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 136315394;
      v8 = "-[CESRFidesASRRecord saveOneRecordPerDay]_block_invoke_2";
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_error_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_ERROR, "%s Failed to delete record: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      v8 = "-[CESRFidesASRRecord saveOneRecordPerDay]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_debug_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_DEBUG, "%s Deleted record(%@)", (uint8_t *)&v7, 0x16u);
    }
    [*(id *)(a1 + 40) save];
  }
}

- (id)todaysDate
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
  [v2 setTimeZone:v3];

  [v2 setDateFormat:@"yyyyMMdd"];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [v2 stringFromDate:v4];

  return v5;
}

- (void)save
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_hasRecognizedAnything)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F5F4F8]) initWithBundleIdentifier:self->_pluginId];
    id v4 = [(CESRFidesASRRecord *)self todaysDate];
    date = self->_date;
    self->_date = v4;

    uint64_t v6 = [(CESRFidesASRRecord *)self _recordInfo];
    int v7 = [(CESRFidesASRRecord *)self _recordData];
    v8 = (void *)*MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = v8;
      *(_DWORD *)buf = 136315650;
      v13 = "-[CESRFidesASRRecord save]";
      __int16 v14 = 2114;
      v15 = v6;
      __int16 v16 = 2050;
      uint64_t v17 = [v7 length];
      _os_log_debug_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_DEBUG, "%s Creating DES record (SPI v2): %{public}@, %{public}zu bytes", buf, 0x20u);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __26__CESRFidesASRRecord_save__block_invoke;
    v11[3] = &unk_1E61C3040;
    v11[4] = self;
    [v3 saveRecordWithData:v7 recordInfo:v6 completion:v11];
  }
  else
  {
    __int16 v9 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CESRFidesASRRecord save]";
      _os_log_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_INFO, "%s Skip DES record creation because of no recognition", buf, 0xCu);
    }
  }
}

void __26__CESRFidesASRRecord_save__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = *MEMORY[0x1E4F4E370];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 32);
      int v10 = 136315650;
      uint64_t v11 = "-[CESRFidesASRRecord save]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_ERROR, "%s Could not write DES record for SPI v2 %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
    int v10 = 136315650;
    uint64_t v11 = "-[CESRFidesASRRecord save]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s DES Record created for SPI v2 %@: %@", (uint8_t *)&v10, 0x20u);
  }
  [MEMORY[0x1E4F4E398] logDESRecordingForLanguage:*(void *)(*(void *)(a1 + 32) + 32) error:v6];
}

- (id)_recordData
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  id v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (!v2)
  {
    id v4 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v8 = "-[CESRFidesASRRecord _recordData]";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_ERROR, "%s Unable to serialize DES record: %@", buf, 0x16u);
    }
  }

  return v2;
}

- (id)_recordInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_language forKeyedSubscript:@"language"];
  [v3 setObject:self->_task forKeyedSubscript:@"task"];
  [v3 setObject:self->_context forKeyedSubscript:@"context"];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_samplingRate];
  [v3 setObject:v4 forKeyedSubscript:@"samplingRate"];

  id v5 = [NSNumber numberWithBool:self->_farField];
  [v3 setObject:v5 forKeyedSubscript:@"farField"];

  [v3 setObject:self->_interactionIdentifier forKeyedSubscript:@"interactionIdentifier"];
  [v3 setObject:self->_asrSelfComponentIdentifier forKeyedSubscript:@"asrSelfComponentIdentifier"];
  id v6 = [NSNumber numberWithBool:self->_personalizedLMUsed];
  [v3 setObject:v6 forKeyedSubscript:@"personalizedLMUsed"];

  [v3 setObject:self->_applicationName forKeyedSubscript:@"applicationName"];
  int v7 = NSNumber;
  [(CESRFidesASRRecord *)self _audioPacketsDuration];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setObject:v8 forKeyedSubscript:@"audioPacketsDuration"];

  [v3 setObject:self->_date forKeyedSubscript:@"date"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeObject:self->_pluginId forKey:@"_pluginId"];
  [v4 encodeObject:self->_language forKey:@"_language"];
  [v4 encodeObject:self->_task forKey:@"_task"];
  [v4 encodeInteger:self->_samplingRate forKey:@"_samplingRate"];
  [v4 encodeBool:self->_farField forKey:@"_farField"];
  [v4 encodeObject:self->_context forKey:@"_context"];
  [v4 encodeObject:self->_UUIDString forKey:@"_UUIDString"];
  originalAudioFileURL = self->_originalAudioFileURL;
  if (originalAudioFileURL)
  {
    id v6 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[CESRFidesASRRecord encodeWithCoder:]";
      _os_log_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_INFO, "%s Skipping audio bytes and save originalAudioFileURL instead", (uint8_t *)&v10, 0xCu);
      originalAudioFileURL = self->_originalAudioFileURL;
    }
    int v7 = @"_originalAudioFileURL";
    uint64_t v8 = v4;
    audioPackets = (NSMutableArray *)originalAudioFileURL;
  }
  else
  {
    audioPackets = self->_audioPackets;
    int v7 = @"_audioPackets";
    uint64_t v8 = v4;
  }
  [v8 encodeObject:audioPackets forKey:v7];
  [v4 encodeBool:self->_hasRecognizedAnything forKey:@"_hasRecognizedAnything"];
  [v4 encodeObject:self->_interactionIdentifier forKey:@"_interactionIdentifier"];
  [v4 encodeObject:self->_asrSelfComponentIdentifier forKey:@"_asrSelfComponentIdentifier"];
  [v4 encodeObject:self->_correctedText forKey:@"_correctedText"];
  [v4 encodeObject:self->_correctedTextV2 forKey:@"_correctedTextV2"];
  [v4 encodeObject:self->_recognizedText forKey:@"_recognizedText"];
  [v4 encodeObject:self->_postITNRecognizedText forKey:@"_postITNRecognizedText"];
  [v4 encodeObject:self->_recognizedNbest forKey:@"_recognizedNbest"];
  [v4 encodeBool:self->_personalizedLMUsed forKey:@"_personalizedLMUsed"];
  [v4 encodeObject:self->_applicationName forKey:@"_applicationName"];
  [v4 encodeObject:self->_date forKey:@"_date"];
  [v4 encodeDouble:@"_timestamp" forKey:self->_timestamp];
  [v4 encodeObject:self->_alternatives forKey:@"_alternatives"];
  [v4 encodeObject:self->_profile forKey:@"_profile"];
}

- (CESRFidesASRRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CESRFidesASRRecord *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pluginId"];
    pluginId = v5->_pluginId;
    v5->_pluginId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_language"];
    language = v5->_language;
    v5->_language = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_task"];
    task = v5->_task;
    v5->_task = (NSString *)v10;

    v5->_samplingRate = [v4 decodeIntegerForKey:@"_samplingRate"];
    v5->_farField = [v4 decodeBoolForKey:@"_farField"];
    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_context"];
    context = v5->_context;
    v5->_context = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UUIDString"];
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v20;

    long long v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v22, "setWithObjects:", v23, v24, v25, v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"_audioPackets"];
    uint64_t v29 = [v28 mutableCopy];
    audioPackets = v5->_audioPackets;
    v5->_audioPackets = (NSMutableArray *)v29;

    v5->_hasRecognizedAnything = [v4 decodeBoolForKey:@"_hasRecognizedAnything"];
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_interactionIdentifier"];
    interactionIdentifier = v5->_interactionIdentifier;
    v5->_interactionIdentifier = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_asrSelfComponentIdentifier"];
    asrSelfComponentIdentifier = v5->_asrSelfComponentIdentifier;
    v5->_asrSelfComponentIdentifier = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_correctedText"];
    correctedText = v5->_correctedText;
    v5->_correctedText = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_correctedTextV2"];
    correctedTextV2 = v5->_correctedTextV2;
    v5->_correctedTextV2 = (NSString *)v37;

    v39 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    v44 = objc_msgSend(v39, "setWithObjects:", v40, v41, v42, v43, objc_opt_class(), 0);
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"_recognizedText"];
    recognizedText = v5->_recognizedText;
    v5->_recognizedText = (NSArray *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_postITNRecognizedText"];
    postITNRecognizedText = v5->_postITNRecognizedText;
    v5->_postITNRecognizedText = (NSString *)v47;

    v49 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    uint64_t v53 = objc_opt_class();
    v54 = objc_msgSend(v49, "setWithObjects:", v50, v51, v52, v53, objc_opt_class(), 0);
    uint64_t v55 = [v4 decodeObjectOfClasses:v54 forKey:@"_recognizedNbest"];
    recognizedNbest = v5->_recognizedNbest;
    v5->_recognizedNbest = (NSArray *)v55;

    v5->_personalizedLMUsed = [v4 decodeBoolForKey:@"_personalizedLMUsed"];
    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_applicationName"];
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_date"];
    date = v5->_date;
    v5->_date = (NSString *)v59;

    [v4 decodeDoubleForKey:@"_timestamp"];
    v5->_timestamp = v61;
    v62 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v63 = objc_opt_class();
    uint64_t v64 = objc_opt_class();
    uint64_t v65 = objc_opt_class();
    uint64_t v66 = objc_opt_class();
    v67 = objc_msgSend(v62, "setWithObjects:", v63, v64, v65, v66, objc_opt_class(), 0);
    uint64_t v68 = [v4 decodeObjectOfClasses:v67 forKey:@"_alternatives"];
    alternatives = v5->_alternatives;
    v5->_alternatives = (NSArray *)v68;

    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_profile"];
    profile = v5->_profile;
    v5->_profile = (NSData *)v70;

    uint64_t v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalAudioFileURL"];
    originalAudioFileURL = v5->_originalAudioFileURL;
    v5->_originalAudioFileURL = (NSURL *)v72;
  }
  return v5;
}

- (void)setCorrectedTextV2:(id)a3
{
  id v5 = a3;
  if (!self->_audioExceededMaxDuration)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_correctedTextV2, a3);
    id v5 = v6;
  }
}

- (void)setCorrectedText:(id)a3
{
  id v5 = a3;
  if (!self->_audioExceededMaxDuration)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_correctedText, a3);
    id v5 = v6;
  }
}

- (id)description
{
  uint64_t v13 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)CESRFidesASRRecord;
  id v3 = [(CESRFidesASRRecord *)&v14 description];
  long long v12 = *(_OWORD *)&self->_pluginId;
  unint64_t samplingRate = self->_samplingRate;
  task = self->_task;
  BOOL farField = self->_farField;
  UUIDString = self->_UUIDString;
  context = self->_context;
  [(CESRFidesASRRecord *)self _audioPacketsDuration];
  objc_msgSend(v13, "stringWithFormat:", @"%@, pluginId=%@, language=%@, task=%@, samplingRate=%ld, farField=%d, context=%@, UUIDString=%@, audioPackets(duration)=%f, hasRecognizedAnything=%d, interactionIdentifier=%@, asrSelfComponentIdentifier=%@, correctedText=%@, correctedTextV2=%@, recognizedText=%@, postITNRecognizedText=%@, recognizedNbest(count)=%lu, personalizedLMUsed=%d, applicationName=%@, date=%@, timestamp=%f, alternatives=%@, profile(length)=%ld, originalAudioFileURL=%@", v3, v12, task, samplingRate, farField, context, UUIDString, v4, self->_hasRecognizedAnything, self->_interactionIdentifier, self->_asrSelfComponentIdentifier, self->_correctedText, self->_correctedTextV2, self->_recognizedText, self->_postITNRecognizedText, -[NSArray count](self->_recognizedNbest, "count"),
    self->_personalizedLMUsed,
    self->_applicationName,
    self->_date,
    *(void *)&self->_timestamp,
    self->_alternatives,
    [(NSData *)self->_profile length],
  id v5 = self->_originalAudioFileURL);

  return v5;
}

- (id)concatenatedAudioPackets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_audioPackets;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "appendData:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (double)_audioPacketsDuration
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_samplingRate) {
    return 0.0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_audioPackets;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "length", (void)v11);
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
    double v9 = (double)(v6 >> 1);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9 / (double)self->_samplingRate;
}

- (void)markRecognition
{
  self->_hasRecognizedAnything = 1;
}

- (BOOL)hasData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_originalAudioFileURL)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v3 = self->_audioPackets;
    uint64_t v2 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v2)
    {
      uint64_t v4 = *(void *)v8;
      while (2)
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "length", (void)v7))
          {
            LOBYTE(v2) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v2 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v2;
}

- (void)addAudioPacket:(id)a3
{
  id v4 = a3;
  if (!self->_originalAudioFileURL && self->_samplingRate)
  {
    id v6 = v4;
    double v5 = self->_collectedAudioDurationMS
       + (double)((unint64_t)[v4 length] >> 1) / (double)self->_samplingRate * 1000.0;
    if (v5 <= 60000.0)
    {
      self->_collectedAudioDurationMS = v5;
      [(NSMutableArray *)self->_audioPackets addObject:v6];
    }
    else
    {
      self->_audioExceededMaxDuration = 1;
    }
    id v4 = v6;
  }
}

- (CESRFidesASRRecord)initWithLanguage:(id)a3 task:(id)a4 context:(id)a5 narrowband:(BOOL)a6 farField:(BOOL)a7 interactionIdentifier:(id)a8 asrSelfComponentIdentifier:(id)a9 pluginId:(id)a10
{
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v44.receiver = self;
  v44.super_class = (Class)CESRFidesASRRecord;
  long long v22 = [(CESRFidesASRRecord *)&v44 init];
  if (v22)
  {
    uint64_t v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    audioPackets = v22->_audioPackets;
    v22->_audioPackets = v23;

    uint64_t v25 = [v16 copy];
    language = v22->_language;
    v22->_language = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    task = v22->_task;
    v22->_task = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    context = v22->_context;
    v22->_context = (NSArray *)v29;

    uint64_t v31 = 16000;
    if (v12) {
      uint64_t v31 = 8000;
    }
    v22->_unint64_t samplingRate = v31;
    v22->_BOOL farField = a7;
    v32 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v33 = [v32 UUIDString];
    UUIDString = v22->_UUIDString;
    v22->_UUIDString = (NSString *)v33;

    v22->_hasRecognizedAnything = 0;
    uint64_t v35 = [v19 copy];
    interactionIdentifier = v22->_interactionIdentifier;
    v22->_interactionIdentifier = (NSString *)v35;

    uint64_t v37 = [v20 copy];
    asrSelfComponentIdentifier = v22->_asrSelfComponentIdentifier;
    v22->_asrSelfComponentIdentifier = (NSString *)v37;

    uint64_t v39 = [v21 copy];
    pluginId = v22->_pluginId;
    v22->_pluginId = (NSString *)v39;

    uint64_t v41 = [MEMORY[0x1E4F1C9C8] date];
    [v41 timeIntervalSince1970];
    v22->_timestamp = v42;

    v22->_audioExceededMaxDuration = 0;
  }

  return v22;
}

+ (void)deleteAllRecordsForPlugin:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = (void *)[objc_alloc(MEMORY[0x1E4F5F4F8]) initWithBundleIdentifier:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CESRFidesASRRecord_deleteAllRecordsForPlugin_completion___block_invoke;
  v10[3] = &unk_1E61C3758;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 deleteAllSavedRecordsWithCompletion:v10];
}

void __59__CESRFidesASRRecord_deleteAllRecordsForPlugin_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *MEMORY[0x1E4F4E370];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315650;
      id v9 = "+[CESRFidesASRRecord deleteAllRecordsForPlugin:completion:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_ERROR, "%s Failed to delete all records for plugin=%@ with error=%@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 136315394;
    id v9 = "+[CESRFidesASRRecord deleteAllRecordsForPlugin:completion:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Successfully deleted all records for plugin=%@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)recordFromData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v10 = 0;
  uint64_t v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:&v10];

  id v6 = v10;
  uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  [v5 finishDecoding];
  if (!v7)
  {
    int v8 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v12 = "+[CESRFidesASRRecord recordFromData:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_INFO, "%s DES record unarchive error: %@", buf, 0x16u);
    }
  }

  return v7;
}

+ (id)recordWithLanguage:(id)a3 task:(id)a4 context:(id)a5 narrowband:(BOOL)a6 farField:(BOOL)a7 interactionIdentifier:(id)a8 asrSelfComponentIdentifier:(id)a9 pluginId:(id)a10 frequency:(unint64_t)a11
{
  BOOL v26 = a7;
  BOOL v12 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F5F4F8]) initWithBundleIdentifier:v21];
  if ([v22 shouldMakeRecordWithFrequency:a11])
  {
    uint64_t v23 = (void *)[objc_alloc((Class)a1) initWithLanguage:v16 task:v17 context:v18 narrowband:v12 farField:v26 interactionIdentifier:v19 asrSelfComponentIdentifier:v20 pluginId:v21];
  }
  else
  {
    uint64_t v24 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v28 = "+[CESRFidesASRRecord recordWithLanguage:task:context:narrowband:farField:interactionIdentifier:asrSelfCompon"
            "entIdentifier:pluginId:frequency:]";
      _os_log_impl(&dword_1B8CCB000, v24, OS_LOG_TYPE_INFO, "%s Lost the lottery: not creating DES record this time", buf, 0xCu);
    }
    uint64_t v23 = 0;
  }

  return v23;
}

+ (id)recordWithLanguage:(id)a3 task:(id)a4 context:(id)a5 narrowband:(BOOL)a6 farField:(BOOL)a7 interactionIdentifier:(id)a8 asrSelfComponentIdentifier:(id)a9 pluginId:(id)a10
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F5F4F8]) initWithBundleIdentifier:v21];
  if ([v22 shouldMakeRecord])
  {
    uint64_t v23 = (void *)[objc_alloc((Class)a1) initWithLanguage:v16 task:v17 context:v18 narrowband:v12 farField:v11 interactionIdentifier:v19 asrSelfComponentIdentifier:v20 pluginId:v21];
  }
  else
  {
    uint64_t v24 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v27 = "+[CESRFidesASRRecord recordWithLanguage:task:context:narrowband:farField:interactionIdentifier:asrSelfCompon"
            "entIdentifier:pluginId:]";
      _os_log_impl(&dword_1B8CCB000, v24, OS_LOG_TYPE_INFO, "%s Lost the lottery: not creating DES record this time", buf, 0xCu);
    }
    uint64_t v23 = 0;
  }

  return v23;
}

@end