@interface SSREnrollmentSamplingMetaData
- (NSNumber)selectionStatus;
- (NSString)voiceProfileId;
- (SSREnrollmentSamplingMetaData)init;
- (SSREnrollmentSamplingMetaData)initWithDictionary:(id)a3;
- (SSREnrollmentSamplingMetaData)initWithSelectionStatus:(id)a3 voiceProfileId:(id)a4;
- (id)description;
- (id)dictionaryRepresentation;
@end

@implementation SSREnrollmentSamplingMetaData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfileId, 0);
  objc_storeStrong((id *)&self->_selectionStatus, 0);
}

- (NSString)voiceProfileId
{
  return self->_voiceProfileId;
}

- (NSNumber)selectionStatus
{
  return self->_selectionStatus;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  selectionStatus = self->_selectionStatus;
  if (selectionStatus) {
    [v3 setObject:selectionStatus forKeyedSubscript:@"SSRSamplingSelectionState"];
  }
  voiceProfileId = self->_voiceProfileId;
  if (voiceProfileId) {
    [v4 setObject:voiceProfileId forKeyedSubscript:@"SSRSamplingVoiceProfileId"];
  }
  return v4;
}

- (id)description
{
  v2 = [(SSREnrollmentSamplingMetaData *)self dictionaryRepresentation];
  id v3 = [v2 description];

  return v3;
}

- (SSREnrollmentSamplingMetaData)initWithDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v11 = *MEMORY[0x1E4F5D4A8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D4A8], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v14 = 136315138;
    v15 = "-[SSREnrollmentSamplingMetaData initWithDictionary:]";
    v12 = "%s invalid input from dictionary";
LABEL_11:
    _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0xCu);
    goto LABEL_12;
  }
  v6 = [v4 objectForKeyedSubscript:@"SSRSamplingVoiceProfileId"];

  if (!v6)
  {
    v11 = *MEMORY[0x1E4F5D4A8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D4A8], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v14 = 136315138;
    v15 = "-[SSREnrollmentSamplingMetaData initWithDictionary:]";
    v12 = "%s invalid voiceProfileIdKey";
    goto LABEL_11;
  }
  v7 = [v5 objectForKeyedSubscript:@"SSRSamplingSelectionState"];

  if (!v7)
  {
    v11 = *MEMORY[0x1E4F5D4A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D4A8], OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "-[SSREnrollmentSamplingMetaData initWithDictionary:]";
      v12 = "%s invalid selection state";
      goto LABEL_11;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  v8 = [v5 objectForKeyedSubscript:@"SSRSamplingSelectionState"];
  v9 = [v5 objectForKeyedSubscript:@"SSRSamplingVoiceProfileId"];
  self = [(SSREnrollmentSamplingMetaData *)self initWithSelectionStatus:v8 voiceProfileId:v9];

  v10 = self;
LABEL_13:

  return v10;
}

- (SSREnrollmentSamplingMetaData)initWithSelectionStatus:(id)a3 voiceProfileId:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSREnrollmentSamplingMetaData;
  v9 = [(SSREnrollmentSamplingMetaData *)&v14 init];
  p_isa = (id *)&v9->super.isa;
  if (!v9) {
    goto LABEL_5;
  }
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_selectionStatus, a3);
    objc_storeStrong(p_isa + 2, a4);
LABEL_5:
    v11 = p_isa;
    goto LABEL_9;
  }
  v12 = *MEMORY[0x1E4F5D4A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D4A8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[SSREnrollmentSamplingMetaData initWithSelectionStatus:voiceProfileId:]";
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_error_impl(&dword_1C9338000, v12, OS_LOG_TYPE_ERROR, "%s initializing samplingMetaData with nil inputs: %@, %@", buf, 0x20u);
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (SSREnrollmentSamplingMetaData)init
{
  return [(SSREnrollmentSamplingMetaData *)self initWithSelectionStatus:0 voiceProfileId:0];
}

@end