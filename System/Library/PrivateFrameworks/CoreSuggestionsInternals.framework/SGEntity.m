@interface SGEntity
- (BOOL)hasExtractionException;
- (BOOL)hasTag:(id)a3;
- (BOOL)isCancelled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEntity:(id)a3;
- (BOOL)isEventComplete;
- (BOOL)isFromForwardedMessage;
- (BOOL)isInhuman;
- (BOOL)isNaturalLanguageEvent;
- (BOOL)isPartiallyDownloaded;
- (CSPerson)author;
- (NSData)structuredData;
- (NSMutableSet)locations;
- (NSString)authorNickname;
- (NSString)authorPhotoPath;
- (NSString)content;
- (NSString)operatingSystemVersion;
- (NSString)sourceKey;
- (NSString)title;
- (SGDuplicateKey)duplicateKey;
- (SGEntity)init;
- (SGEntity)initWithEntity:(id)a3;
- (SGExtractionInfo)extractionInfo;
- (SGRecordId)recordId;
- (SGSimpleTimeRange)timeRange;
- (SGUnixTimestamp_)creationTimestamp;
- (SGUnixTimestamp_)lastModifiedTimestamp;
- (_NSRange)contentRangeOfInterest;
- (double)quality;
- (id)description;
- (id)extraKeyTag;
- (id)fieldsToSaveOnConfirmation;
- (id)loadOrigin:(id)a3;
- (id)loggingIdentifier;
- (id)tags;
- (id)templateShortName;
- (int64_t)groupId;
- (int64_t)masterEntityId;
- (unint64_t)hash;
- (unsigned)state;
- (void)addTag:(id)a3;
- (void)dealloc;
- (void)removeTag:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setAuthorNickname:(id)a3;
- (void)setAuthorPhotoPath:(id)a3;
- (void)setContent:(id)a3;
- (void)setContentRangeOfInterest:(_NSRange)a3;
- (void)setCreationTimestamp:(SGUnixTimestamp_)a3;
- (void)setDuplicateKey:(id)a3;
- (void)setExtractionInfo:(id)a3;
- (void)setGroupId:(int64_t)a3;
- (void)setLastModifiedTimestamp:(SGUnixTimestamp_)a3;
- (void)setLocations:(id)a3;
- (void)setMasterEntityId:(int64_t)a3;
- (void)setOperatingSystemVersion:(id)a3;
- (void)setQuality:(double)a3;
- (void)setRecordId:(id)a3;
- (void)setSourceKey:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)setStructuredData:(id)a3;
- (void)setTimeRange:(id)a3;
- (void)setTitle:(id)a3;
- (void)validate;
@end

@implementation SGEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatingSystemVersion, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_structuredData, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_authorPhotoPath, 0);
  objc_storeStrong((id *)&self->_authorNickname, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_sourceKey, 0);
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_duplicateKey, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_tagsSnapshot, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

- (void)setOperatingSystemVersion:(id)a3
{
}

- (NSString)operatingSystemVersion
{
  return self->_operatingSystemVersion;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setGroupId:(int64_t)a3
{
  self->_groupId = a3;
}

- (int64_t)groupId
{
  return self->_groupId;
}

- (void)setMasterEntityId:(int64_t)a3
{
  self->_masterEntityId = a3;
}

- (int64_t)masterEntityId
{
  return self->_masterEntityId;
}

- (void)setLocations:(id)a3
{
}

- (NSMutableSet)locations
{
  return self->_locations;
}

- (void)setQuality:(double)a3
{
  self->_quality = a3;
}

- (double)quality
{
  return self->_quality;
}

- (void)setStructuredData:(id)a3
{
}

- (NSData)structuredData
{
  return self->_structuredData;
}

- (void)setTimeRange:(id)a3
{
}

- (SGSimpleTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setLastModifiedTimestamp:(SGUnixTimestamp_)a3
{
  self->_lastModifiedTimestamp = a3;
}

- (SGUnixTimestamp_)lastModifiedTimestamp
{
  return self->_lastModifiedTimestamp;
}

- (void)setCreationTimestamp:(SGUnixTimestamp_)a3
{
  self->_creationTimestamp = a3;
}

- (SGUnixTimestamp_)creationTimestamp
{
  return self->_creationTimestamp;
}

- (CSPerson)author
{
  return self->_author;
}

- (void)setAuthorPhotoPath:(id)a3
{
}

- (NSString)authorPhotoPath
{
  return self->_authorPhotoPath;
}

- (void)setAuthorNickname:(id)a3
{
}

- (NSString)authorNickname
{
  return self->_authorNickname;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setContentRangeOfInterest:(_NSRange)a3
{
  self->_contentRangeOfInterest = a3;
}

- (_NSRange)contentRangeOfInterest
{
  NSUInteger length = self->_contentRangeOfInterest.length;
  NSUInteger location = self->_contentRangeOfInterest.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setContent:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setSourceKey:(id)a3
{
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (void)setExtractionInfo:(id)a3
{
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (void)setDuplicateKey:(id)a3
{
}

- (SGDuplicateKey)duplicateKey
{
  return self->_duplicateKey;
}

- (void)setRecordId:(id)a3
{
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (BOOL)isEventComplete
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SGEntity *)self tags];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
      if (objc_msgSend(v7, "isEventCompletenessTag", (void)v11)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v8 = v7;

    if (v8)
    {
      id v2 = [v8 isEventComplete];
      char v9 = [v2 BOOLValue];
      goto LABEL_12;
    }
    char v9 = 1;
  }
  else
  {
LABEL_9:

    id v8 = 0;
    char v9 = 1;
LABEL_12:
  }
  return v9;
}

- (id)loggingIdentifier
{
  if (self->_duplicateKey) {
    id v2 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%tu", -[SGDuplicateKey hash](self->_duplicateKey, "hash"));
  }
  else {
    id v2 = &stru_1F24EEF20;
  }
  if ((unint64_t)[(__CFString *)v2 length] > 0xC)
  {
    -[__CFString substringWithRange:](v2, "substringWithRange:", 0, 12);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = v2;
  }
  uint64_t v4 = v3;

  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(SGEntity *)self duplicateKey];
  uint64_t v5 = [(SGEntity *)self sourceKey];
  uint64_t v6 = [(SGEntity *)self title];
  v7 = (void *)[v3 initWithFormat:@"<SGEntity:%@,sourceKey=%@,title=%@>", v4, v5, v6];

  return v7;
}

- (id)fieldsToSaveOnConfirmation
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  uint64_t v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKeyedSubscript:@"summary"];
  }
  content = self->_content;
  if (content) {
    [v4 setObject:content forKeyedSubscript:@"description"];
  }
  return v4;
}

- (BOOL)isPartiallyDownloaded
{
  id v2 = [(SGEntity *)self tags];
  id v3 = [MEMORY[0x1E4F5D9F0] isPartiallyDownloaded];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)isInhuman
{
  id v2 = [(SGEntity *)self tags];
  id v3 = [MEMORY[0x1E4F5D9F0] inhuman];
  if ([v2 containsObject:v3])
  {
    char v4 = [MEMORY[0x1E4F5D9F0] human];
    int v5 = [v2 containsObject:v4] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)templateShortName
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(SGEntity *)self tags];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "isTemplateShortName", (void)v9))
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v7 = [v3 value];

  return v7;
}

- (id)extraKeyTag
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(SGEntity *)self tags];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isExtraKey", (void)v8))
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasTag:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = [(SGEntity *)self tags];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isEqualToEntityTag:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)tags
{
  p_tagsLock = &self->_tagsLock;
  pthread_mutex_lock(&self->_tagsLock);
  tagsSnapshot = self->_tagsSnapshot;
  if (!tagsSnapshot)
  {
    int v5 = (NSSet *)[(NSMutableSet *)self->_tags copy];
    uint64_t v6 = self->_tagsSnapshot;
    self->_tagsSnapshot = v5;

    tagsSnapshot = self->_tagsSnapshot;
  }
  uint64_t v7 = tagsSnapshot;
  pthread_mutex_unlock(p_tagsLock);
  return v7;
}

- (void)removeTag:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SGEntity.m", 174, @"Invalid parameter not satisfying: %@", @"tag" object file lineNumber description];
  }
  pthread_mutex_lock(&self->_tagsLock);
  if ([(NSMutableSet *)self->_tags containsObject:v7])
  {
    tagsSnapshot = self->_tagsSnapshot;
    self->_tagsSnapshot = 0;

    [(NSMutableSet *)self->_tags removeObject:v7];
  }
  pthread_mutex_unlock(&self->_tagsLock);
}

- (void)addTag:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SGEntity.m", 162, @"Invalid parameter not satisfying: %@", @"tag" object file lineNumber description];
  }
  pthread_mutex_lock(&self->_tagsLock);
  if (([(NSMutableSet *)self->_tags containsObject:v7] & 1) == 0)
  {
    tagsSnapshot = self->_tagsSnapshot;
    self->_tagsSnapshot = 0;

    [(NSMutableSet *)self->_tags addObject:v7];
  }
  pthread_mutex_unlock(&self->_tagsLock);
}

- (void)setAuthor:(id)a3
{
}

- (BOOL)isFromForwardedMessage
{
  id v2 = [(SGEntity *)self tags];
  id v3 = [MEMORY[0x1E4F5D9F0] fromForwardedMessage];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)hasExtractionException
{
  id v2 = [(SGEntity *)self tags];
  id v3 = [MEMORY[0x1E4F5D9F0] templateException];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)isCancelled
{
  id v2 = [(SGEntity *)self tags];
  id v3 = [MEMORY[0x1E4F5D9F0] extractedEventCancellation];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)isNaturalLanguageEvent
{
  id v2 = [(SGEntity *)self tags];
  id v3 = [MEMORY[0x1E4F5D9F0] naturalLanguageEvent];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (id)loadOrigin:(id)a3
{
  return (id)[MEMORY[0x1E4F5DAC8] originForDuplicateKey:self->_duplicateKey sourceKey:self->_sourceKey store:a3];
}

- (void)validate
{
  char v4 = [(SGEntity *)self duplicateKey];
  int v5 = [v4 entityKey];

  if (!v5)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SGEntity.m" lineNumber:120 description:@"entityKey can't be nil."];
  }
  uint64_t v6 = [(SGEntity *)self duplicateKey];
  uint64_t v7 = [v6 entityType];

  if (!v7)
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SGEntity.m" lineNumber:121 description:@"entityType must not be SGEntityTypeUnknown"];
  }
  long long v8 = [(SGEntity *)self duplicateKey];
  uint64_t v9 = [v8 entityType];

  if (v9 == 8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SGEntity.m" lineNumber:122 description:@"entityType must not be SGEntityTypeDetectedEmailAddress"];
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(SGRecordId *)self->_recordId hash];
  unint64_t v4 = [(SGDuplicateKey *)self->_duplicateKey hash] - v3 + 32 * v3;
  return [(NSString *)self->_sourceKey hash] - v4 + 32 * v4;
}

- (BOOL)isEqualToEntity:(id)a3
{
  unint64_t v4 = (id *)a3;
  recordId = self->_recordId;
  uint64_t v6 = (SGRecordId *)v4[12];
  if (recordId == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    long long v8 = recordId;
    char v9 = [(SGRecordId *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_27;
    }
  }
  duplicateKey = self->_duplicateKey;
  long long v11 = (SGDuplicateKey *)v4[13];
  if (duplicateKey == v11)
  {
  }
  else
  {
    id v12 = v11;
    long long v13 = duplicateKey;
    BOOL v14 = [(SGDuplicateKey *)v13 isEqual:v12];

    if (!v14) {
      goto LABEL_27;
    }
  }
  sourceKey = self->_sourceKey;
  uint64_t v16 = (NSString *)v4[15];
  if (sourceKey == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = sourceKey;
    char v19 = [(NSString *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_27;
    }
  }
  content = self->_content;
  v21 = (NSString *)v4[16];
  if (content == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = content;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_27;
    }
  }
  BOOL v25 = 0;
  if (self->_contentRangeOfInterest.location == v4[30] && self->_contentRangeOfInterest.length == v4[31])
  {
    title = self->_title;
    v27 = (NSString *)v4[17];
    if (title == v27)
    {
    }
    else
    {
      v28 = v27;
      v29 = title;
      char v30 = [(NSString *)v29 isEqual:v28];

      if ((v30 & 1) == 0) {
        goto LABEL_27;
      }
    }
    [v4 creationTimestamp];
    if (self->_creationTimestamp.secondsFromUnixEpoch != v31) {
      goto LABEL_27;
    }
    [v4 lastModifiedTimestamp];
    if (self->_lastModifiedTimestamp.secondsFromUnixEpoch != v32) {
      goto LABEL_27;
    }
    timeRange = self->_timeRange;
    v34 = (SGSimpleTimeRange *)v4[23];
    if (timeRange == v34)
    {
    }
    else
    {
      v35 = v34;
      v36 = timeRange;
      char v37 = [(SGSimpleTimeRange *)v36 isEqual:v35];

      if ((v37 & 1) == 0)
      {
LABEL_27:
        BOOL v25 = 0;
        goto LABEL_28;
      }
    }
    v39 = [(SGEntity *)self tags];
    v40 = [v4 tags];
    if (![v39 isEqual:v40]) {
      goto LABEL_42;
    }
    structuredData = self->_structuredData;
    v42 = (NSData *)v4[24];
    if (structuredData == v42)
    {
    }
    else
    {
      v43 = v42;
      v44 = structuredData;
      char v45 = [(NSData *)v44 isEqual:v43];

      if ((v45 & 1) == 0) {
        goto LABEL_42;
      }
    }
    double quality = self->_quality;
    [v4 quality];
    if (quality == v47)
    {
      locations = self->_locations;
      v49 = (NSMutableSet *)v4[26];
      if (locations == v49)
      {
      }
      else
      {
        v50 = v49;
        v51 = locations;
        char v52 = [(NSMutableSet *)v51 isEqual:v50];

        if ((v52 & 1) == 0) {
          goto LABEL_42;
        }
      }
      int64_t masterEntityId = self->_masterEntityId;
      if (masterEntityId == [v4 masterEntityId])
      {
        unsigned int state = self->_state;
        BOOL v25 = state == [v4 state];
LABEL_43:

        goto LABEL_28;
      }
    }
LABEL_42:
    BOOL v25 = 0;
    goto LABEL_43;
  }
LABEL_28:

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SGEntity *)a3;
  int v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGEntity *)self isEqualToEntity:v5];

  return v6;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_tagsLock);
  v3.receiver = self;
  v3.super_class = (Class)SGEntity;
  [(SGEntity *)&v3 dealloc];
}

- (SGEntity)initWithEntity:(id)a3
{
  id v4 = a3;
  int v5 = [(SGEntity *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 recordId];
    recordId = v5->_recordId;
    v5->_recordId = (SGRecordId *)v6;

    uint64_t v8 = [v4 duplicateKey];
    duplicateKey = v5->_duplicateKey;
    v5->_duplicateKey = (SGDuplicateKey *)v8;

    uint64_t v10 = [v4 extractionInfo];
    extractionInfo = v5->_extractionInfo;
    v5->_extractionInfo = (SGExtractionInfo *)v10;

    uint64_t v12 = [v4 sourceKey];
    sourceKey = v5->_sourceKey;
    v5->_sourceKey = (NSString *)v12;

    uint64_t v14 = [v4 content];
    content = v5->_content;
    v5->_content = (NSString *)v14;

    v5->_contentRangeOfInterest.NSUInteger location = [v4 contentRangeOfInterest];
    v5->_contentRangeOfInterest.NSUInteger length = v16;
    uint64_t v17 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v17;

    uint64_t v19 = [v4 author];
    author = v5->_author;
    v5->_author = (CSPerson *)v19;

    [v4 creationTimestamp];
    v5->_creationTimestamp.secondsFromUnixEpoch = v21;
    [v4 lastModifiedTimestamp];
    v5->_lastModifiedTimestamp.secondsFromUnixEpoch = v22;
    uint64_t v23 = [v4 timeRange];
    timeRange = v5->_timeRange;
    v5->_timeRange = (SGSimpleTimeRange *)v23;

    uint64_t v25 = [v4 structuredData];
    structuredData = v5->_structuredData;
    v5->_structuredData = (NSData *)v25;

    [v4 quality];
    v5->_double quality = v27;
    uint64_t v28 = [v4 locations];
    locations = v5->_locations;
    v5->_locations = (NSMutableSet *)v28;

    v5->_int64_t masterEntityId = [v4 masterEntityId];
    v5->_groupId = [v4 groupId];
    v5->_unsigned int state = [v4 state];
  }

  return v5;
}

- (SGEntity)init
{
  v12.receiver = self;
  v12.super_class = (Class)SGEntity;
  id v2 = [(SGEntity *)&v12 init];
  objc_super v3 = v2;
  if (v2)
  {
    recordId = v2->_recordId;
    v2->_recordId = 0;

    v3->_unsigned int state = 1;
    uint64_t v5 = objc_opt_new();
    tags = v3->_tags;
    v3->_tags = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    locations = v3->_locations;
    v3->_locations = (NSMutableSet *)v7;

    v3->_double quality = 1.0;
    v3->_contentRangeOfInterest = (_NSRange)xmmword_1CA8CB4A0;
    pthread_mutex_init(&v3->_tagsLock, 0);
    uint64_t v9 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:0 modelVersion:0 confidence:0];
    extractionInfo = v3->_extractionInfo;
    v3->_extractionInfo = (SGExtractionInfo *)v9;
  }
  return v3;
}

@end