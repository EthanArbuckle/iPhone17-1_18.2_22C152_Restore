@interface GEORPFeedbackSubmissionResult
+ (BOOL)isValid:(id)a3;
+ (Class)imageIdMapEntryType;
- (BOOL)hasFeedbackId;
- (BOOL)hasPhotoAttributionPreferencesUpdateResult;
- (BOOL)hasRapInfo;
- (BOOL)hasTdmFraudRequestInfo;
- (BOOL)hasThirdPartyPhotoSharingPreferenceUpdateResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackSubmissionResult)init;
- (GEORPFeedbackSubmissionResult)initWithData:(id)a3;
- (GEORPFeedbackSubmissionResult)initWithDictionary:(id)a3;
- (GEORPFeedbackSubmissionResult)initWithJSON:(id)a3;
- (GEORPPhotoAttributionPreferencesUpdateResult)photoAttributionPreferencesUpdateResult;
- (GEORPRapProfileInfo)rapInfo;
- (GEORPTdmFraudRequestInfo)tdmFraudRequestInfo;
- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)thirdPartyPhotoSharingPreferenceUpdateResult;
- (NSMutableArray)imageIdMapEntrys;
- (NSString)feedbackId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imageIdMapEntryAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)imageIdMapEntrysCount;
- (void)_addNoFlagsImageIdMapEntry:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFeedbackId;
- (void)_readImageIdMapEntrys;
- (void)_readPhotoAttributionPreferencesUpdateResult;
- (void)_readRapInfo;
- (void)_readTdmFraudRequestInfo;
- (void)_readThirdPartyPhotoSharingPreferenceUpdateResult;
- (void)addImageIdMapEntry:(id)a3;
- (void)clearImageIdMapEntrys;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFeedbackId:(id)a3;
- (void)setImageIdMapEntrys:(id)a3;
- (void)setPhotoAttributionPreferencesUpdateResult:(id)a3;
- (void)setRapInfo:(id)a3;
- (void)setTdmFraudRequestInfo:(id)a3;
- (void)setThirdPartyPhotoSharingPreferenceUpdateResult:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackSubmissionResult

- (GEORPFeedbackSubmissionResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackSubmissionResult;
  v2 = [(GEORPFeedbackSubmissionResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackSubmissionResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackSubmissionResult;
  v3 = [(GEORPFeedbackSubmissionResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readFeedbackId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbackId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasFeedbackId
{
  return self->_feedbackId != 0;
}

- (NSString)feedbackId
{
  -[GEORPFeedbackSubmissionResult _readFeedbackId]((uint64_t)self);
  feedbackId = self->_feedbackId;

  return feedbackId;
}

- (void)setFeedbackId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_feedbackId, a3);
}

- (void)_readImageIdMapEntrys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageIdMapEntrys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)imageIdMapEntrys
{
  -[GEORPFeedbackSubmissionResult _readImageIdMapEntrys]((uint64_t)self);
  imageIdMapEntrys = self->_imageIdMapEntrys;

  return imageIdMapEntrys;
}

- (void)setImageIdMapEntrys:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  imageIdMapEntrys = self->_imageIdMapEntrys;
  self->_imageIdMapEntrys = v4;
}

- (void)clearImageIdMapEntrys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  imageIdMapEntrys = self->_imageIdMapEntrys;

  [(NSMutableArray *)imageIdMapEntrys removeAllObjects];
}

- (void)addImageIdMapEntry:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackSubmissionResult _readImageIdMapEntrys]((uint64_t)self);
  -[GEORPFeedbackSubmissionResult _addNoFlagsImageIdMapEntry:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImageIdMapEntry:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)imageIdMapEntrysCount
{
  -[GEORPFeedbackSubmissionResult _readImageIdMapEntrys]((uint64_t)self);
  imageIdMapEntrys = self->_imageIdMapEntrys;

  return [(NSMutableArray *)imageIdMapEntrys count];
}

- (id)imageIdMapEntryAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackSubmissionResult _readImageIdMapEntrys]((uint64_t)self);
  imageIdMapEntrys = self->_imageIdMapEntrys;

  return (id)[(NSMutableArray *)imageIdMapEntrys objectAtIndex:a3];
}

+ (Class)imageIdMapEntryType
{
  return (Class)objc_opt_class();
}

- (void)_readRapInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRapInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRapInfo
{
  return self->_rapInfo != 0;
}

- (GEORPRapProfileInfo)rapInfo
{
  -[GEORPFeedbackSubmissionResult _readRapInfo]((uint64_t)self);
  rapInfo = self->_rapInfo;

  return rapInfo;
}

- (void)setRapInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_rapInfo, a3);
}

- (void)_readThirdPartyPhotoSharingPreferenceUpdateResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readThirdPartyPhotoSharingPreferenceUpdateResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasThirdPartyPhotoSharingPreferenceUpdateResult
{
  return self->_thirdPartyPhotoSharingPreferenceUpdateResult != 0;
}

- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)thirdPartyPhotoSharingPreferenceUpdateResult
{
  -[GEORPFeedbackSubmissionResult _readThirdPartyPhotoSharingPreferenceUpdateResult]((uint64_t)self);
  thirdPartyPhotoSharingPreferenceUpdateResult = self->_thirdPartyPhotoSharingPreferenceUpdateResult;

  return thirdPartyPhotoSharingPreferenceUpdateResult;
}

- (void)setThirdPartyPhotoSharingPreferenceUpdateResult:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferenceUpdateResult, a3);
}

- (void)_readPhotoAttributionPreferencesUpdateResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoAttributionPreferencesUpdateResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPhotoAttributionPreferencesUpdateResult
{
  return self->_photoAttributionPreferencesUpdateResult != 0;
}

- (GEORPPhotoAttributionPreferencesUpdateResult)photoAttributionPreferencesUpdateResult
{
  -[GEORPFeedbackSubmissionResult _readPhotoAttributionPreferencesUpdateResult]((uint64_t)self);
  photoAttributionPreferencesUpdateResult = self->_photoAttributionPreferencesUpdateResult;

  return photoAttributionPreferencesUpdateResult;
}

- (void)setPhotoAttributionPreferencesUpdateResult:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_photoAttributionPreferencesUpdateResult, a3);
}

- (void)_readTdmFraudRequestInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTdmFraudRequestInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTdmFraudRequestInfo
{
  return self->_tdmFraudRequestInfo != 0;
}

- (GEORPTdmFraudRequestInfo)tdmFraudRequestInfo
{
  -[GEORPFeedbackSubmissionResult _readTdmFraudRequestInfo]((uint64_t)self);
  tdmFraudRequestInfo = self->_tdmFraudRequestInfo;

  return tdmFraudRequestInfo;
}

- (void)setTdmFraudRequestInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_tdmFraudRequestInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackSubmissionResult;
  id v4 = [(GEORPFeedbackSubmissionResult *)&v8 description];
  id v5 = [(GEORPFeedbackSubmissionResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackSubmissionResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 feedbackId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"feedbackId";
      }
      else {
        objc_super v6 = @"feedback_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if ([*(id *)(a1 + 32) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v42 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"imageIdMapEntry";
      }
      else {
        v15 = @"image_id_map_entry";
      }
      [v4 setObject:v7 forKey:v15];
    }
    v16 = [(id)a1 rapInfo];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"rapInfo";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"rap_info";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = [(id)a1 thirdPartyPhotoSharingPreferenceUpdateResult];
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"thirdPartyPhotoSharingPreferenceUpdateResult";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"third_party_photo_sharing_preference_update_result";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [(id)a1 photoAttributionPreferencesUpdateResult];
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"photoAttributionPreferencesUpdateResult";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"photo_attribution_preferences_update_result";
      }
      [v4 setObject:v26 forKey:v27];
    }
    v28 = [(id)a1 tdmFraudRequestInfo];
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"tdmFraudRequestInfo";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"tdm_fraud_request_info";
      }
      [v4 setObject:v30 forKey:v31];
    }
    v32 = *(void **)(a1 + 16);
    if (v32)
    {
      v33 = [v32 dictionaryRepresentation];
      v34 = v33;
      if (a2)
      {
        v35 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __59__GEORPFeedbackSubmissionResult__dictionaryRepresentation___block_invoke;
        v39[3] = &unk_1E53D8860;
        id v36 = v35;
        id v40 = v36;
        [v34 enumerateKeysAndObjectsUsingBlock:v39];
        id v37 = v36;

        v34 = v37;
      }
      [v4 setObject:v34 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackSubmissionResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEORPFeedbackSubmissionResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPFeedbackSubmissionResult)initWithDictionary:(id)a3
{
  return (GEORPFeedbackSubmissionResult *)-[GEORPFeedbackSubmissionResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"feedbackId";
      }
      else {
        objc_super v6 = @"feedback_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = (void *)[v7 copy];
        [a1 setFeedbackId:v8];
      }
      if (a3) {
        uint64_t v9 = @"imageIdMapEntry";
      }
      else {
        uint64_t v9 = @"image_id_map_entry";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v41 = v5;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v43 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v17 = [GEORPFeedbackImageIdMapEntry alloc];
                if (a3) {
                  uint64_t v18 = [(GEORPFeedbackImageIdMapEntry *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEORPFeedbackImageIdMapEntry *)v17 initWithDictionary:v16];
                }
                v19 = (void *)v18;
                [a1 addImageIdMapEntry:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
          }
          while (v13);
        }

        id v5 = v41;
      }

      if (a3) {
        v20 = @"rapInfo";
      }
      else {
        v20 = @"rap_info";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEORPRapProfileInfo alloc];
        if (a3) {
          uint64_t v23 = [(GEORPRapProfileInfo *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEORPRapProfileInfo *)v22 initWithDictionary:v21];
        }
        v24 = (void *)v23;
        [a1 setRapInfo:v23];
      }
      if (a3) {
        v25 = @"thirdPartyPhotoSharingPreferenceUpdateResult";
      }
      else {
        v25 = @"third_party_photo_sharing_preference_update_result";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = [GEORPThirdPartyPhotoSharingPreferenceUpdateResult alloc];
        if (a3) {
          uint64_t v28 = [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)v27 initWithJSON:v26];
        }
        else {
          uint64_t v28 = [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)v27 initWithDictionary:v26];
        }
        v29 = (void *)v28;
        [a1 setThirdPartyPhotoSharingPreferenceUpdateResult:v28];
      }
      if (a3) {
        v30 = @"photoAttributionPreferencesUpdateResult";
      }
      else {
        v30 = @"photo_attribution_preferences_update_result";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = [GEORPPhotoAttributionPreferencesUpdateResult alloc];
        if (a3) {
          uint64_t v33 = [(GEORPPhotoAttributionPreferencesUpdateResult *)v32 initWithJSON:v31];
        }
        else {
          uint64_t v33 = [(GEORPPhotoAttributionPreferencesUpdateResult *)v32 initWithDictionary:v31];
        }
        v34 = (void *)v33;
        [a1 setPhotoAttributionPreferencesUpdateResult:v33];
      }
      if (a3) {
        v35 = @"tdmFraudRequestInfo";
      }
      else {
        v35 = @"tdm_fraud_request_info";
      }
      id v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v37 = [GEORPTdmFraudRequestInfo alloc];
        if (a3) {
          uint64_t v38 = [(GEORPTdmFraudRequestInfo *)v37 initWithJSON:v36];
        }
        else {
          uint64_t v38 = [(GEORPTdmFraudRequestInfo *)v37 initWithDictionary:v36];
        }
        v39 = (void *)v38;
        [a1 setTdmFraudRequestInfo:v38];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackSubmissionResult)initWithJSON:(id)a3
{
  return (GEORPFeedbackSubmissionResult *)-[GEORPFeedbackSubmissionResult _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_2356;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_2357;
    }
    GEORPFeedbackSubmissionResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackSubmissionResultCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackSubmissionResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackSubmissionResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackSubmissionResultIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackSubmissionResult *)self readAll:0];
    if (self->_feedbackId) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_imageIdMapEntrys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_rapInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_thirdPartyPhotoSharingPreferenceUpdateResult) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_photoAttributionPreferencesUpdateResult) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tdmFraudRequestInfo) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEORPFeedbackSubmissionResult *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 18) = self->_readerMarkPos;
  *((_DWORD *)v9 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_feedbackId) {
    objc_msgSend(v9, "setFeedbackId:");
  }
  if ([(GEORPFeedbackSubmissionResult *)self imageIdMapEntrysCount])
  {
    [v9 clearImageIdMapEntrys];
    unint64_t v4 = [(GEORPFeedbackSubmissionResult *)self imageIdMapEntrysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackSubmissionResult *)self imageIdMapEntryAtIndex:i];
        [v9 addImageIdMapEntry:v7];
      }
    }
  }
  if (self->_rapInfo) {
    objc_msgSend(v9, "setRapInfo:");
  }
  uint64_t v8 = v9;
  if (self->_thirdPartyPhotoSharingPreferenceUpdateResult)
  {
    objc_msgSend(v9, "setThirdPartyPhotoSharingPreferenceUpdateResult:");
    uint64_t v8 = v9;
  }
  if (self->_photoAttributionPreferencesUpdateResult)
  {
    objc_msgSend(v9, "setPhotoAttributionPreferencesUpdateResult:");
    uint64_t v8 = v9;
  }
  if (self->_tdmFraudRequestInfo)
  {
    objc_msgSend(v9, "setTdmFraudRequestInfo:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackSubmissionResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackSubmissionResult *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_feedbackId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = self->_imageIdMapEntrys;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        [(id)v5 addImageIdMapEntry:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  id v15 = [(GEORPRapProfileInfo *)self->_rapInfo copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  id v17 = [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)self->_thirdPartyPhotoSharingPreferenceUpdateResult copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v17;

  id v19 = [(GEORPPhotoAttributionPreferencesUpdateResult *)self->_photoAttributionPreferencesUpdateResult copyWithZone:a3];
  v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  id v21 = [(GEORPTdmFraudRequestInfo *)self->_tdmFraudRequestInfo copyWithZone:a3];
  v22 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v21;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackSubmissionResult *)self readAll:1],
         [v4 readAll:1],
         feedbackId = self->_feedbackId,
         !((unint64_t)feedbackId | v4[3]))
     || -[NSString isEqual:](feedbackId, "isEqual:"))
    && ((imageIdMapEntrys = self->_imageIdMapEntrys, !((unint64_t)imageIdMapEntrys | v4[4]))
     || -[NSMutableArray isEqual:](imageIdMapEntrys, "isEqual:"))
    && ((rapInfo = self->_rapInfo, !((unint64_t)rapInfo | v4[6]))
     || -[GEORPRapProfileInfo isEqual:](rapInfo, "isEqual:"))
    && ((thirdPartyPhotoSharingPreferenceUpdateResult = self->_thirdPartyPhotoSharingPreferenceUpdateResult,
         !((unint64_t)thirdPartyPhotoSharingPreferenceUpdateResult | v4[8]))
     || -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult isEqual:](thirdPartyPhotoSharingPreferenceUpdateResult, "isEqual:"))&& ((photoAttributionPreferencesUpdateResult = self->_photoAttributionPreferencesUpdateResult, !((unint64_t)photoAttributionPreferencesUpdateResult | v4[5]))|| -[GEORPPhotoAttributionPreferencesUpdateResult isEqual:](photoAttributionPreferencesUpdateResult, "isEqual:")))
  {
    tdmFraudRequestInfo = self->_tdmFraudRequestInfo;
    if ((unint64_t)tdmFraudRequestInfo | v4[7]) {
      char v11 = -[GEORPTdmFraudRequestInfo isEqual:](tdmFraudRequestInfo, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  [(GEORPFeedbackSubmissionResult *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_feedbackId hash];
  uint64_t v4 = [(NSMutableArray *)self->_imageIdMapEntrys hash] ^ v3;
  unint64_t v5 = [(GEORPRapProfileInfo *)self->_rapInfo hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)self->_thirdPartyPhotoSharingPreferenceUpdateResult hash];
  unint64_t v7 = [(GEORPPhotoAttributionPreferencesUpdateResult *)self->_photoAttributionPreferencesUpdateResult hash];
  return v6 ^ v7 ^ [(GEORPTdmFraudRequestInfo *)self->_tdmFraudRequestInfo hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEORPFeedbackSubmissionResult setFeedbackId:](self, "setFeedbackId:");
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPFeedbackSubmissionResult addImageIdMapEntry:](self, "addImageIdMapEntry:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  rapInfo = self->_rapInfo;
  id v11 = v4[6];
  if (rapInfo)
  {
    if (v11) {
      -[GEORPRapProfileInfo mergeFrom:](rapInfo, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPFeedbackSubmissionResult setRapInfo:](self, "setRapInfo:");
  }
  thirdPartyPhotoSharingPreferenceUpdateResult = self->_thirdPartyPhotoSharingPreferenceUpdateResult;
  id v13 = v4[8];
  if (thirdPartyPhotoSharingPreferenceUpdateResult)
  {
    if (v13) {
      -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult mergeFrom:](thirdPartyPhotoSharingPreferenceUpdateResult, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPFeedbackSubmissionResult setThirdPartyPhotoSharingPreferenceUpdateResult:](self, "setThirdPartyPhotoSharingPreferenceUpdateResult:");
  }
  photoAttributionPreferencesUpdateResult = self->_photoAttributionPreferencesUpdateResult;
  id v15 = v4[5];
  if (photoAttributionPreferencesUpdateResult)
  {
    if (v15) {
      -[GEORPPhotoAttributionPreferencesUpdateResult mergeFrom:](photoAttributionPreferencesUpdateResult, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPFeedbackSubmissionResult setPhotoAttributionPreferencesUpdateResult:](self, "setPhotoAttributionPreferencesUpdateResult:");
  }
  tdmFraudRequestInfo = self->_tdmFraudRequestInfo;
  id v17 = v4[7];
  if (tdmFraudRequestInfo)
  {
    if (v17) {
      -[GEORPTdmFraudRequestInfo mergeFrom:](tdmFraudRequestInfo, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEORPFeedbackSubmissionResult setTdmFraudRequestInfo:](self, "setTdmFraudRequestInfo:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackSubmissionResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2361);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackSubmissionResult *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_imageIdMapEntrys;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(GEORPRapProfileInfo *)self->_rapInfo clearUnknownFields:1];
    [(GEORPTdmFraudRequestInfo *)self->_tdmFraudRequestInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferenceUpdateResult, 0);
  objc_storeStrong((id *)&self->_tdmFraudRequestInfo, 0);
  objc_storeStrong((id *)&self->_rapInfo, 0);
  objc_storeStrong((id *)&self->_photoAttributionPreferencesUpdateResult, 0);
  objc_storeStrong((id *)&self->_imageIdMapEntrys, 0);
  objc_storeStrong((id *)&self->_feedbackId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end