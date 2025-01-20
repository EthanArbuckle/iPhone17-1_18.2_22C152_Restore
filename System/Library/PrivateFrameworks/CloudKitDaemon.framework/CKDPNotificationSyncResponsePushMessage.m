@interface CKDPNotificationSyncResponsePushMessage
+ (Class)subtitleLocalizedArgumentsType;
+ (Class)titleLocalizedArgumentsType;
- (BOOL)hasBadgeCount;
- (BOOL)hasCategory;
- (BOOL)hasDialog;
- (BOOL)hasIsRead;
- (BOOL)hasPayload;
- (BOOL)hasSound;
- (BOOL)hasSource;
- (BOOL)hasSubtitle;
- (BOOL)hasSubtitleLocalizedKey;
- (BOOL)hasTitle;
- (BOOL)hasTitleLocalizedKey;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRead;
- (BOOL)readFrom:(id)a3;
- (NSData)payload;
- (NSMutableArray)subtitleLocalizedArguments;
- (NSMutableArray)titleLocalizedArguments;
- (NSString)category;
- (NSString)dialog;
- (NSString)sound;
- (NSString)subtitle;
- (NSString)subtitleLocalizedKey;
- (NSString)title;
- (NSString)titleLocalizedKey;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sourceAsString:(int)a3;
- (id)subtitleLocalizedArgumentsAtIndex:(unint64_t)a3;
- (id)titleLocalizedArgumentsAtIndex:(unint64_t)a3;
- (int)StringAsSource:(id)a3;
- (int)badgeCount;
- (int)source;
- (unint64_t)hash;
- (unint64_t)subtitleLocalizedArgumentsCount;
- (unint64_t)titleLocalizedArgumentsCount;
- (void)addSubtitleLocalizedArguments:(id)a3;
- (void)addTitleLocalizedArguments:(id)a3;
- (void)clearSubtitleLocalizedArguments;
- (void)clearTitleLocalizedArguments;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBadgeCount:(int)a3;
- (void)setCategory:(id)a3;
- (void)setDialog:(id)a3;
- (void)setHasBadgeCount:(BOOL)a3;
- (void)setHasIsRead:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setIsRead:(BOOL)a3;
- (void)setPayload:(id)a3;
- (void)setSound:(id)a3;
- (void)setSource:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLocalizedArguments:(id)a3;
- (void)setSubtitleLocalizedKey:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLocalizedArguments:(id)a3;
- (void)setTitleLocalizedKey:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPNotificationSyncResponsePushMessage

- (void)setIsRead:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isRead = a3;
}

- (void)setHasIsRead:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsRead
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (int)source
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_source;
  }
  else {
    return 1;
  }
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 > 2)
  {
    if (a3 == 3)
    {
      v4 = @"CKRPC";
    }
    else
    {
      if (a3 != 999)
      {
LABEL_12:
        objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      v4 = @"UNKNOWN";
    }
  }
  else
  {
    if (a3 != 1)
    {
      if (a3 == 2)
      {
        v4 = @"SHARING";
        return v4;
      }
      goto LABEL_12;
    }
    v4 = @"DATABASE";
  }
  return v4;
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"DATABASE"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"SHARING"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"CKRPC"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"UNKNOWN"))
  {
    int v6 = 999;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasDialog
{
  return self->_dialog != 0;
}

- (BOOL)hasSound
{
  return self->_sound != 0;
}

- (void)setBadgeCount:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_badgeCount = a3;
}

- (void)setHasBadgeCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBadgeCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasTitleLocalizedKey
{
  return self->_titleLocalizedKey != 0;
}

- (void)clearTitleLocalizedArguments
{
  objc_msgSend_removeAllObjects(self->_titleLocalizedArguments, a2, v2);
}

- (void)addTitleLocalizedArguments:(id)a3
{
  v4 = (const char *)a3;
  titleLocalizedArguments = self->_titleLocalizedArguments;
  v8 = (char *)v4;
  if (!titleLocalizedArguments)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_titleLocalizedArguments;
    self->_titleLocalizedArguments = v6;

    v4 = v8;
    titleLocalizedArguments = self->_titleLocalizedArguments;
  }
  objc_msgSend_addObject_(titleLocalizedArguments, v4, (uint64_t)v4);
}

- (unint64_t)titleLocalizedArgumentsCount
{
  return objc_msgSend_count(self->_titleLocalizedArguments, a2, v2);
}

- (id)titleLocalizedArgumentsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_titleLocalizedArguments, a2, a3);
}

+ (Class)titleLocalizedArgumentsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasSubtitleLocalizedKey
{
  return self->_subtitleLocalizedKey != 0;
}

- (void)clearSubtitleLocalizedArguments
{
  objc_msgSend_removeAllObjects(self->_subtitleLocalizedArguments, a2, v2);
}

- (void)addSubtitleLocalizedArguments:(id)a3
{
  v4 = (const char *)a3;
  subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
  v8 = (char *)v4;
  if (!subtitleLocalizedArguments)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_subtitleLocalizedArguments;
    self->_subtitleLocalizedArguments = v6;

    v4 = v8;
    subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
  }
  objc_msgSend_addObject_(subtitleLocalizedArguments, v4, (uint64_t)v4);
}

- (unint64_t)subtitleLocalizedArgumentsCount
{
  return objc_msgSend_count(self->_subtitleLocalizedArguments, a2, v2);
}

- (id)subtitleLocalizedArgumentsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_subtitleLocalizedArguments, a2, a3);
}

+ (Class)subtitleLocalizedArgumentsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPNotificationSyncResponsePushMessage;
  v4 = [(CKDPNotificationSyncResponsePushMessage *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isRead);
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, @"isRead");
  }
  uuid = self->_uuid;
  if (uuid) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)uuid, @"uuid");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int source = self->_source;
    if (source > 2)
    {
      if (source == 3)
      {
        v10 = @"CKRPC";
        objc_msgSend_setObject_forKey_(v5, v4, @"CKRPC", @"source");
        goto LABEL_16;
      }
      if (source == 999)
      {
        v10 = @"UNKNOWN";
        objc_msgSend_setObject_forKey_(v5, v4, @"UNKNOWN", @"source");
        goto LABEL_16;
      }
    }
    else
    {
      if (source == 1)
      {
        v10 = @"DATABASE";
        objc_msgSend_setObject_forKey_(v5, v4, @"DATABASE", @"source");
        goto LABEL_16;
      }
      if (source == 2)
      {
        v10 = @"SHARING";
        objc_msgSend_setObject_forKey_(v5, v4, @"SHARING", @"source");
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_source);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, @"source");
    goto LABEL_16;
  }
LABEL_17:
  dialog = self->_dialog;
  if (dialog) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)dialog, @"dialog");
  }
  sound = self->_sound;
  if (sound) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)sound, @"sound");
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_badgeCount);
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, @"badgeCount");
  }
  payload = self->_payload;
  if (payload) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)payload, @"payload");
  }
  category = self->_category;
  if (category) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)category, @"category");
  }
  title = self->_title;
  if (title) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)title, @"title");
  }
  titleLocalizedKey = self->_titleLocalizedKey;
  if (titleLocalizedKey) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)titleLocalizedKey, @"titleLocalizedKey");
  }
  titleLocalizedArguments = self->_titleLocalizedArguments;
  if (titleLocalizedArguments) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)titleLocalizedArguments, @"titleLocalizedArguments");
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)subtitle, @"subtitle");
  }
  subtitleLocalizedKey = self->_subtitleLocalizedKey;
  if (subtitleLocalizedKey) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)subtitleLocalizedKey, @"subtitleLocalizedKey");
  }
  subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
  if (subtitleLocalizedArguments) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)subtitleLocalizedArguments, @"subtitleLocalizedArguments");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPNotificationSyncResponsePushMessageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_dialog) {
    PBDataWriterWriteStringField();
  }
  if (self->_sound) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_payload) {
    PBDataWriterWriteDataField();
  }
  if (self->_category) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_titleLocalizedKey) {
    PBDataWriterWriteStringField();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = self->_titleLocalizedArguments;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, v28, 16);
    }
    while (v8);
  }

  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitleLocalizedKey) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = self->_subtitleLocalizedArguments;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, v27, 16);
    }
    while (v15);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[112] = self->_isRead;
    v4[116] |= 4u;
  }
  uuid = self->_uuid;
  v34 = v4;
  if (uuid)
  {
    objc_msgSend_setUuid_(v4, v5, (uint64_t)uuid);
    id v4 = v34;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_source;
    v4[116] |= 2u;
  }
  dialog = self->_dialog;
  if (dialog)
  {
    objc_msgSend_setDialog_(v34, v5, (uint64_t)dialog);
    id v4 = v34;
  }
  sound = self->_sound;
  if (sound)
  {
    objc_msgSend_setSound_(v34, v5, (uint64_t)sound);
    id v4 = v34;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_badgeCount;
    v4[116] |= 1u;
  }
  payload = self->_payload;
  if (payload) {
    objc_msgSend_setPayload_(v34, v5, (uint64_t)payload);
  }
  category = self->_category;
  if (category) {
    objc_msgSend_setCategory_(v34, v5, (uint64_t)category);
  }
  title = self->_title;
  if (title) {
    objc_msgSend_setTitle_(v34, v5, (uint64_t)title);
  }
  titleLocalizedKey = self->_titleLocalizedKey;
  if (titleLocalizedKey) {
    objc_msgSend_setTitleLocalizedKey_(v34, v5, (uint64_t)titleLocalizedKey);
  }
  if (objc_msgSend_titleLocalizedArgumentsCount(self, v5, (uint64_t)titleLocalizedKey))
  {
    objc_msgSend_clearTitleLocalizedArguments(v34, v13, v14);
    uint64_t v17 = objc_msgSend_titleLocalizedArgumentsCount(self, v15, v16);
    if (v17)
    {
      uint64_t v18 = v17;
      for (uint64_t i = 0; i != v18; ++i)
      {
        long long v20 = objc_msgSend_titleLocalizedArgumentsAtIndex_(self, v13, i);
        objc_msgSend_addTitleLocalizedArguments_(v34, v21, (uint64_t)v20);
      }
    }
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    objc_msgSend_setSubtitle_(v34, v13, (uint64_t)subtitle);
  }
  subtitleLocalizedKey = self->_subtitleLocalizedKey;
  if (subtitleLocalizedKey) {
    objc_msgSend_setSubtitleLocalizedKey_(v34, v13, (uint64_t)subtitleLocalizedKey);
  }
  if (objc_msgSend_subtitleLocalizedArgumentsCount(self, v13, (uint64_t)subtitleLocalizedKey))
  {
    objc_msgSend_clearSubtitleLocalizedArguments(v34, v24, v25);
    uint64_t v28 = objc_msgSend_subtitleLocalizedArgumentsCount(self, v26, v27);
    if (v28)
    {
      uint64_t v30 = v28;
      for (uint64_t j = 0; j != v30; ++j)
      {
        v32 = objc_msgSend_subtitleLocalizedArgumentsAtIndex_(self, v29, j);
        objc_msgSend_addSubtitleLocalizedArguments_(v34, v33, (uint64_t)v32);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v10 + 112) = self->_isRead;
    *(unsigned char *)(v10 + 116) |= 4u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_uuid, v11, (uint64_t)a3);
  uint64_t v14 = *(void **)(v12 + 104);
  *(void *)(v12 + 104) = v13;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v12 + 48) = self->_source;
    *(unsigned char *)(v12 + 116) |= 2u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_dialog, v15, (uint64_t)a3);
  uint64_t v17 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_sound, v18, (uint64_t)a3);
  long long v20 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v19;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 8) = self->_badgeCount;
    *(unsigned char *)(v12 + 116) |= 1u;
  }
  uint64_t v22 = objc_msgSend_copyWithZone_(self->_payload, v21, (uint64_t)a3);
  long long v23 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v22;

  uint64_t v25 = objc_msgSend_copyWithZone_(self->_category, v24, (uint64_t)a3);
  long long v26 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v25;

  uint64_t v28 = objc_msgSend_copyWithZone_(self->_title, v27, (uint64_t)a3);
  uint64_t v29 = *(void **)(v12 + 80);
  *(void *)(v12 + 80) = v28;

  uint64_t v31 = objc_msgSend_copyWithZone_(self->_titleLocalizedKey, v30, (uint64_t)a3);
  v32 = *(void **)(v12 + 96);
  *(void *)(v12 + 96) = v31;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v33 = self->_titleLocalizedArguments;
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v62, v67, 16);
  if (v35)
  {
    uint64_t v37 = v35;
    uint64_t v38 = *(void *)v63;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v63 != v38) {
          objc_enumerationMutation(v33);
        }
        v40 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v62 + 1) + 8 * v39), v36, (uint64_t)a3);
        objc_msgSend_addTitleLocalizedArguments_((void *)v12, v41, (uint64_t)v40);

        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v62, v67, 16);
    }
    while (v37);
  }

  uint64_t v43 = objc_msgSend_copyWithZone_(self->_subtitle, v42, (uint64_t)a3);
  v44 = *(void **)(v12 + 56);
  *(void *)(v12 + 56) = v43;

  uint64_t v46 = objc_msgSend_copyWithZone_(self->_subtitleLocalizedKey, v45, (uint64_t)a3);
  v47 = *(void **)(v12 + 72);
  *(void *)(v12 + 72) = v46;

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v48 = self->_subtitleLocalizedArguments;
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v58, v66, 16);
  if (v50)
  {
    uint64_t v52 = v50;
    uint64_t v53 = *(void *)v59;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v59 != v53) {
          objc_enumerationMutation(v48);
        }
        v55 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v58 + 1) + 8 * v54), v51, (uint64_t)a3, (void)v58);
        objc_msgSend_addSubtitleLocalizedArguments_((void *)v12, v56, (uint64_t)v55);

        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v58, v66, 16);
    }
    while (v52);
  }

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_43;
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 116);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 4) == 0) {
      goto LABEL_43;
    }
    if (self->_isRead)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_43;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
    goto LABEL_43;
  }
  uuid = self->_uuid;
  uint64_t v11 = v4[13];
  if (!((unint64_t)uuid | v11)) {
    goto LABEL_13;
  }
  if (!objc_msgSend_isEqual_(uuid, v7, v11))
  {
LABEL_43:
    char isEqual = 0;
    goto LABEL_44;
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 116);
LABEL_13:
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_source != *((_DWORD *)v4 + 12)) {
      goto LABEL_43;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_43;
  }
  dialog = self->_dialog;
  uint64_t v13 = v4[3];
  if ((unint64_t)dialog | v13 && !objc_msgSend_isEqual_(dialog, v7, v13)) {
    goto LABEL_43;
  }
  sound = self->_sound;
  uint64_t v15 = v4[5];
  if ((unint64_t)sound | v15)
  {
    if (!objc_msgSend_isEqual_(sound, v7, v15)) {
      goto LABEL_43;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 116) & 1) == 0 || self->_badgeCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_43;
    }
  }
  else if (*((unsigned char *)v4 + 116))
  {
    goto LABEL_43;
  }
  payload = self->_payload;
  uint64_t v17 = v4[4];
  if ((unint64_t)payload | v17 && !objc_msgSend_isEqual_(payload, v7, v17)) {
    goto LABEL_43;
  }
  category = self->_category;
  uint64_t v19 = v4[2];
  if ((unint64_t)category | v19)
  {
    if (!objc_msgSend_isEqual_(category, v7, v19)) {
      goto LABEL_43;
    }
  }
  title = self->_title;
  uint64_t v21 = v4[10];
  if ((unint64_t)title | v21)
  {
    if (!objc_msgSend_isEqual_(title, v7, v21)) {
      goto LABEL_43;
    }
  }
  titleLocalizedKey = self->_titleLocalizedKey;
  uint64_t v23 = v4[12];
  if ((unint64_t)titleLocalizedKey | v23)
  {
    if (!objc_msgSend_isEqual_(titleLocalizedKey, v7, v23)) {
      goto LABEL_43;
    }
  }
  titleLocalizedArguments = self->_titleLocalizedArguments;
  uint64_t v25 = v4[11];
  if ((unint64_t)titleLocalizedArguments | v25)
  {
    if (!objc_msgSend_isEqual_(titleLocalizedArguments, v7, v25)) {
      goto LABEL_43;
    }
  }
  subtitle = self->_subtitle;
  uint64_t v27 = v4[7];
  if ((unint64_t)subtitle | v27)
  {
    if (!objc_msgSend_isEqual_(subtitle, v7, v27)) {
      goto LABEL_43;
    }
  }
  subtitleLocalizedKey = self->_subtitleLocalizedKey;
  uint64_t v29 = v4[9];
  if ((unint64_t)subtitleLocalizedKey | v29)
  {
    if (!objc_msgSend_isEqual_(subtitleLocalizedKey, v7, v29)) {
      goto LABEL_43;
    }
  }
  subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
  uint64_t v31 = v4[8];
  if ((unint64_t)subtitleLocalizedArguments | v31) {
    char isEqual = objc_msgSend_isEqual_(subtitleLocalizedArguments, v7, v31);
  }
  else {
    char isEqual = 1;
  }
LABEL_44:

  return isEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_isRead;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v7 = objc_msgSend_hash(self->_uuid, a2, v2);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_source;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = objc_msgSend_hash(self->_dialog, v5, v6);
  uint64_t v12 = objc_msgSend_hash(self->_sound, v10, v11);
  if (*(unsigned char *)&self->_has) {
    uint64_t v15 = 2654435761 * self->_badgeCount;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = v7 ^ v4 ^ v8 ^ v9 ^ v12 ^ v15 ^ objc_msgSend_hash(self->_payload, v13, v14);
  uint64_t v19 = objc_msgSend_hash(self->_category, v17, v18);
  uint64_t v22 = v19 ^ objc_msgSend_hash(self->_title, v20, v21);
  uint64_t v25 = v22 ^ objc_msgSend_hash(self->_titleLocalizedKey, v23, v24);
  uint64_t v28 = v16 ^ v25 ^ objc_msgSend_hash(self->_titleLocalizedArguments, v26, v27);
  uint64_t v31 = objc_msgSend_hash(self->_subtitle, v29, v30);
  uint64_t v34 = v31 ^ objc_msgSend_hash(self->_subtitleLocalizedKey, v32, v33);
  return v28 ^ v34 ^ objc_msgSend_hash(self->_subtitleLocalizedArguments, v35, v36);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v6 = v4;
  if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
    self->_isRead = *((unsigned char *)v4 + 112);
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v7 = *((void *)v4 + 13);
  if (v7) {
    objc_msgSend_setUuid_(self, v5, v7);
  }
  if ((*((unsigned char *)v6 + 116) & 2) != 0)
  {
    self->_int source = *((_DWORD *)v6 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v8 = *((void *)v6 + 3);
  if (v8) {
    objc_msgSend_setDialog_(self, v5, v8);
  }
  uint64_t v9 = *((void *)v6 + 5);
  if (v9) {
    objc_msgSend_setSound_(self, v5, v9);
  }
  if (*((unsigned char *)v6 + 116))
  {
    self->_badgeCount = *((_DWORD *)v6 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v10 = *((void *)v6 + 4);
  if (v10) {
    objc_msgSend_setPayload_(self, v5, v10);
  }
  uint64_t v11 = *((void *)v6 + 2);
  if (v11) {
    objc_msgSend_setCategory_(self, v5, v11);
  }
  uint64_t v12 = *((void *)v6 + 10);
  if (v12) {
    objc_msgSend_setTitle_(self, v5, v12);
  }
  uint64_t v13 = *((void *)v6 + 12);
  if (v13) {
    objc_msgSend_setTitleLocalizedKey_(self, v5, v13);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = *((id *)v6 + 11);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v35, v40, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend_addTitleLocalizedArguments_(self, v17, *(void *)(*((void *)&v35 + 1) + 8 * i));
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v35, v40, 16);
    }
    while (v18);
  }

  uint64_t v22 = *((void *)v6 + 7);
  if (v22) {
    objc_msgSend_setSubtitle_(self, v21, v22);
  }
  uint64_t v23 = *((void *)v6 + 9);
  if (v23) {
    objc_msgSend_setSubtitleLocalizedKey_(self, v21, v23);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v24 = *((id *)v6 + 8);
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v31, v39, 16);
  if (v26)
  {
    uint64_t v28 = v26;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend_addSubtitleLocalizedArguments_(self, v27, *(void *)(*((void *)&v31 + 1) + 8 * j), (void)v31);
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v31, v39, 16);
    }
    while (v28);
  }
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
}

- (NSString)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (int)badgeCount
{
  return self->_badgeCount;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)titleLocalizedKey
{
  return self->_titleLocalizedKey;
}

- (void)setTitleLocalizedKey:(id)a3
{
}

- (NSMutableArray)titleLocalizedArguments
{
  return self->_titleLocalizedArguments;
}

- (void)setTitleLocalizedArguments:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitleLocalizedKey
{
  return self->_subtitleLocalizedKey;
}

- (void)setSubtitleLocalizedKey:(id)a3
{
}

- (NSMutableArray)subtitleLocalizedArguments
{
  return self->_subtitleLocalizedArguments;
}

- (void)setSubtitleLocalizedArguments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_titleLocalizedKey, 0);
  objc_storeStrong((id *)&self->_titleLocalizedArguments, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizedKey, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizedArguments, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end