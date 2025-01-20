@interface CKDPSubscriptionNotificationAlert
+ (Class)localizedArgumentsType;
+ (Class)subtitleLocalizedArgumentsType;
+ (Class)titleLocalizedArgumentsType;
- (BOOL)hasActionLocKey;
- (BOOL)hasCategory;
- (BOOL)hasLaunchImage;
- (BOOL)hasLocalizedKey;
- (BOOL)hasSoundName;
- (BOOL)hasSubtitle;
- (BOOL)hasSubtitleLocalizedKey;
- (BOOL)hasText;
- (BOOL)hasTitle;
- (BOOL)hasTitleLocalizedKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)localizedArguments;
- (NSMutableArray)subtitleLocalizedArguments;
- (NSMutableArray)titleLocalizedArguments;
- (NSString)actionLocKey;
- (NSString)category;
- (NSString)launchImage;
- (NSString)localizedKey;
- (NSString)soundName;
- (NSString)subtitle;
- (NSString)subtitleLocalizedKey;
- (NSString)text;
- (NSString)title;
- (NSString)titleLocalizedKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)localizedArgumentsAtIndex:(unint64_t)a3;
- (id)subtitleLocalizedArgumentsAtIndex:(unint64_t)a3;
- (id)titleLocalizedArgumentsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)localizedArgumentsCount;
- (unint64_t)subtitleLocalizedArgumentsCount;
- (unint64_t)titleLocalizedArgumentsCount;
- (void)addLocalizedArguments:(id)a3;
- (void)addSubtitleLocalizedArguments:(id)a3;
- (void)addTitleLocalizedArguments:(id)a3;
- (void)clearLocalizedArguments;
- (void)clearSubtitleLocalizedArguments;
- (void)clearTitleLocalizedArguments;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionLocKey:(id)a3;
- (void)setCategory:(id)a3;
- (void)setLaunchImage:(id)a3;
- (void)setLocalizedArguments:(id)a3;
- (void)setLocalizedKey:(id)a3;
- (void)setSoundName:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLocalizedArguments:(id)a3;
- (void)setSubtitleLocalizedKey:(id)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLocalizedArguments:(id)a3;
- (void)setTitleLocalizedKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPSubscriptionNotificationAlert

- (BOOL)hasText
{
  return self->_text != 0;
}

- (BOOL)hasLocalizedKey
{
  return self->_localizedKey != 0;
}

- (void)clearLocalizedArguments
{
  objc_msgSend_removeAllObjects(self->_localizedArguments, a2, v2);
}

- (void)addLocalizedArguments:(id)a3
{
  v4 = (const char *)a3;
  localizedArguments = self->_localizedArguments;
  v8 = (char *)v4;
  if (!localizedArguments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_localizedArguments;
    self->_localizedArguments = v6;

    v4 = v8;
    localizedArguments = self->_localizedArguments;
  }
  objc_msgSend_addObject_(localizedArguments, v4, (uint64_t)v4);
}

- (unint64_t)localizedArgumentsCount
{
  return objc_msgSend_count(self->_localizedArguments, a2, v2);
}

- (id)localizedArgumentsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_localizedArguments, a2, a3);
}

+ (Class)localizedArgumentsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasActionLocKey
{
  return self->_actionLocKey != 0;
}

- (BOOL)hasLaunchImage
{
  return self->_launchImage != 0;
}

- (BOOL)hasSoundName
{
  return self->_soundName != 0;
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
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPSubscriptionNotificationAlert;
  v4 = [(CKDPSubscriptionNotificationAlert *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  text = self->_text;
  if (text) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)text, @"text");
  }
  localizedKey = self->_localizedKey;
  if (localizedKey) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)localizedKey, @"localizedKey");
  }
  localizedArguments = self->_localizedArguments;
  if (localizedArguments) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)localizedArguments, @"localizedArguments");
  }
  actionLocKey = self->_actionLocKey;
  if (actionLocKey) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)actionLocKey, @"actionLocKey");
  }
  launchImage = self->_launchImage;
  if (launchImage) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)launchImage, @"launchImage");
  }
  soundName = self->_soundName;
  if (soundName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)soundName, @"soundName");
  }
  category = self->_category;
  if (category) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)category, @"category");
  }
  title = self->_title;
  if (title) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)title, @"title");
  }
  titleLocalizedKey = self->_titleLocalizedKey;
  if (titleLocalizedKey) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)titleLocalizedKey, @"titleLocalizedKey");
  }
  titleLocalizedArguments = self->_titleLocalizedArguments;
  if (titleLocalizedArguments) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)titleLocalizedArguments, @"titleLocalizedArguments");
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)subtitle, @"subtitle");
  }
  subtitleLocalizedKey = self->_subtitleLocalizedKey;
  if (subtitleLocalizedKey) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)subtitleLocalizedKey, @"subtitleLocalizedKey");
  }
  subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
  if (subtitleLocalizedArguments) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)subtitleLocalizedArguments, @"subtitleLocalizedArguments");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EBC570((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_text) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizedKey) {
    PBDataWriterWriteStringField();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v5 = self->_localizedArguments;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v34, v40, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v34, v40, 16);
    }
    while (v8);
  }

  if (self->_actionLocKey) {
    PBDataWriterWriteStringField();
  }
  if (self->_launchImage) {
    PBDataWriterWriteStringField();
  }
  if (self->_soundName) {
    PBDataWriterWriteStringField();
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
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v12 = self->_titleLocalizedArguments;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, v39, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v30, v39, 16);
    }
    while (v15);
  }

  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitleLocalizedKey) {
    PBDataWriterWriteStringField();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v19 = self->_subtitleLocalizedArguments;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v26, v38, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v26, v38, 16);
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v43 = a3;
  text = self->_text;
  if (text) {
    objc_msgSend_setText_(v43, v4, (uint64_t)text);
  }
  localizedKey = self->_localizedKey;
  if (localizedKey) {
    objc_msgSend_setLocalizedKey_(v43, v4, (uint64_t)localizedKey);
  }
  if (objc_msgSend_localizedArgumentsCount(self, v4, (uint64_t)localizedKey))
  {
    objc_msgSend_clearLocalizedArguments(v43, v7, v8);
    uint64_t v11 = objc_msgSend_localizedArgumentsCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = objc_msgSend_localizedArgumentsAtIndex_(self, v7, i);
        objc_msgSend_addLocalizedArguments_(v43, v15, (uint64_t)v14);
      }
    }
  }
  actionLocKey = self->_actionLocKey;
  if (actionLocKey) {
    objc_msgSend_setActionLocKey_(v43, v7, (uint64_t)actionLocKey);
  }
  launchImage = self->_launchImage;
  if (launchImage) {
    objc_msgSend_setLaunchImage_(v43, v7, (uint64_t)launchImage);
  }
  soundName = self->_soundName;
  if (soundName) {
    objc_msgSend_setSoundName_(v43, v7, (uint64_t)soundName);
  }
  category = self->_category;
  if (category) {
    objc_msgSend_setCategory_(v43, v7, (uint64_t)category);
  }
  title = self->_title;
  if (title) {
    objc_msgSend_setTitle_(v43, v7, (uint64_t)title);
  }
  titleLocalizedKey = self->_titleLocalizedKey;
  if (titleLocalizedKey) {
    objc_msgSend_setTitleLocalizedKey_(v43, v7, (uint64_t)titleLocalizedKey);
  }
  if (objc_msgSend_titleLocalizedArgumentsCount(self, v7, (uint64_t)titleLocalizedKey))
  {
    objc_msgSend_clearTitleLocalizedArguments(v43, v22, v23);
    uint64_t v26 = objc_msgSend_titleLocalizedArgumentsCount(self, v24, v25);
    if (v26)
    {
      uint64_t v27 = v26;
      for (uint64_t j = 0; j != v27; ++j)
      {
        long long v29 = objc_msgSend_titleLocalizedArgumentsAtIndex_(self, v22, j);
        objc_msgSend_addTitleLocalizedArguments_(v43, v30, (uint64_t)v29);
      }
    }
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    objc_msgSend_setSubtitle_(v43, v22, (uint64_t)subtitle);
  }
  subtitleLocalizedKey = self->_subtitleLocalizedKey;
  if (subtitleLocalizedKey) {
    objc_msgSend_setSubtitleLocalizedKey_(v43, v22, (uint64_t)subtitleLocalizedKey);
  }
  if (objc_msgSend_subtitleLocalizedArgumentsCount(self, v22, (uint64_t)subtitleLocalizedKey))
  {
    objc_msgSend_clearSubtitleLocalizedArguments(v43, v33, v34);
    uint64_t v37 = objc_msgSend_subtitleLocalizedArgumentsCount(self, v35, v36);
    if (v37)
    {
      uint64_t v39 = v37;
      for (uint64_t k = 0; k != v39; ++k)
      {
        uint64_t v41 = objc_msgSend_subtitleLocalizedArgumentsAtIndex_(self, v38, k);
        objc_msgSend_addSubtitleLocalizedArguments_(v43, v42, (uint64_t)v41);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_text, v11, (uint64_t)a3);
  v13 = (void *)v10[10];
  v10[10] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_localizedKey, v14, (uint64_t)a3);
  uint64_t v16 = (void *)v10[5];
  v10[5] = v15;

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v17 = self->_localizedArguments;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v77, v83, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v78;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v78 != v22) {
          objc_enumerationMutation(v17);
        }
        uint64_t v24 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v77 + 1) + 8 * v23), v20, (uint64_t)a3);
        objc_msgSend_addLocalizedArguments_(v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v77, v83, 16);
    }
    while (v21);
  }

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_actionLocKey, v26, (uint64_t)a3);
  long long v28 = (void *)v10[1];
  v10[1] = v27;

  uint64_t v30 = objc_msgSend_copyWithZone_(self->_launchImage, v29, (uint64_t)a3);
  long long v31 = (void *)v10[3];
  v10[3] = v30;

  uint64_t v33 = objc_msgSend_copyWithZone_(self->_soundName, v32, (uint64_t)a3);
  uint64_t v34 = (void *)v10[6];
  v10[6] = v33;

  uint64_t v36 = objc_msgSend_copyWithZone_(self->_category, v35, (uint64_t)a3);
  uint64_t v37 = (void *)v10[2];
  v10[2] = v36;

  uint64_t v39 = objc_msgSend_copyWithZone_(self->_title, v38, (uint64_t)a3);
  v40 = (void *)v10[11];
  v10[11] = v39;

  uint64_t v42 = objc_msgSend_copyWithZone_(self->_titleLocalizedKey, v41, (uint64_t)a3);
  id v43 = (void *)v10[13];
  v10[13] = v42;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v44 = self->_titleLocalizedArguments;
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v73, v82, 16);
  if (v46)
  {
    uint64_t v48 = v46;
    uint64_t v49 = *(void *)v74;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v74 != v49) {
          objc_enumerationMutation(v44);
        }
        v51 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v73 + 1) + 8 * v50), v47, (uint64_t)a3);
        objc_msgSend_addTitleLocalizedArguments_(v10, v52, (uint64_t)v51);

        ++v50;
      }
      while (v48 != v50);
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v73, v82, 16);
    }
    while (v48);
  }

  uint64_t v54 = objc_msgSend_copyWithZone_(self->_subtitle, v53, (uint64_t)a3);
  v55 = (void *)v10[7];
  v10[7] = v54;

  uint64_t v57 = objc_msgSend_copyWithZone_(self->_subtitleLocalizedKey, v56, (uint64_t)a3);
  v58 = (void *)v10[9];
  v10[9] = v57;

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v59 = self->_subtitleLocalizedArguments;
  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v69, v81, 16);
  if (v61)
  {
    uint64_t v63 = v61;
    uint64_t v64 = *(void *)v70;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v70 != v64) {
          objc_enumerationMutation(v59);
        }
        v66 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v69 + 1) + 8 * v65), v62, (uint64_t)a3, (void)v69);
        objc_msgSend_addSubtitleLocalizedArguments_(v10, v67, (uint64_t)v66);

        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v62, (uint64_t)&v69, v81, 16);
    }
    while (v63);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_28;
  }
  text = self->_text;
  uint64_t v9 = v4[10];
  if ((unint64_t)text | v9)
  {
    if (!objc_msgSend_isEqual_(text, v7, v9)) {
      goto LABEL_28;
    }
  }
  localizedKey = self->_localizedKey;
  uint64_t v11 = v4[5];
  if ((unint64_t)localizedKey | v11)
  {
    if (!objc_msgSend_isEqual_(localizedKey, v7, v11)) {
      goto LABEL_28;
    }
  }
  localizedArguments = self->_localizedArguments;
  uint64_t v13 = v4[4];
  if ((unint64_t)localizedArguments | v13)
  {
    if (!objc_msgSend_isEqual_(localizedArguments, v7, v13)) {
      goto LABEL_28;
    }
  }
  actionLocKey = self->_actionLocKey;
  uint64_t v15 = v4[1];
  if ((unint64_t)actionLocKey | v15)
  {
    if (!objc_msgSend_isEqual_(actionLocKey, v7, v15)) {
      goto LABEL_28;
    }
  }
  launchImage = self->_launchImage;
  uint64_t v17 = v4[3];
  if ((unint64_t)launchImage | v17)
  {
    if (!objc_msgSend_isEqual_(launchImage, v7, v17)) {
      goto LABEL_28;
    }
  }
  soundName = self->_soundName;
  uint64_t v19 = v4[6];
  if ((unint64_t)soundName | v19)
  {
    if (!objc_msgSend_isEqual_(soundName, v7, v19)) {
      goto LABEL_28;
    }
  }
  category = self->_category;
  uint64_t v21 = v4[2];
  if ((unint64_t)category | v21)
  {
    if (!objc_msgSend_isEqual_(category, v7, v21)) {
      goto LABEL_28;
    }
  }
  title = self->_title;
  uint64_t v23 = v4[11];
  if ((unint64_t)title | v23)
  {
    if (!objc_msgSend_isEqual_(title, v7, v23)) {
      goto LABEL_28;
    }
  }
  titleLocalizedKey = self->_titleLocalizedKey;
  uint64_t v25 = v4[13];
  if ((unint64_t)titleLocalizedKey | v25)
  {
    if (!objc_msgSend_isEqual_(titleLocalizedKey, v7, v25)) {
      goto LABEL_28;
    }
  }
  if (((titleLocalizedArguments = self->_titleLocalizedArguments,
         uint64_t v27 = v4[12],
         !((unint64_t)titleLocalizedArguments | v27))
     || objc_msgSend_isEqual_(titleLocalizedArguments, v7, v27))
    && ((subtitle = self->_subtitle, uint64_t v29 = v4[7], !((unint64_t)subtitle | v29))
     || objc_msgSend_isEqual_(subtitle, v7, v29))
    && ((subtitleLocalizedKey = self->_subtitleLocalizedKey, uint64_t v31 = v4[9],
                                                             !((unint64_t)subtitleLocalizedKey | v31))
     || objc_msgSend_isEqual_(subtitleLocalizedKey, v7, v31)))
  {
    subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
    uint64_t v33 = v4[8];
    if ((unint64_t)subtitleLocalizedArguments | v33) {
      char isEqual = objc_msgSend_isEqual_(subtitleLocalizedArguments, v7, v33);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
LABEL_28:
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_text, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_localizedKey, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_localizedArguments, v8, v9);
  uint64_t v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_actionLocKey, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_launchImage, v14, v15);
  uint64_t v19 = v16 ^ objc_msgSend_hash(self->_soundName, v17, v18);
  uint64_t v22 = v13 ^ v19 ^ objc_msgSend_hash(self->_category, v20, v21);
  uint64_t v25 = objc_msgSend_hash(self->_title, v23, v24);
  uint64_t v28 = v25 ^ objc_msgSend_hash(self->_titleLocalizedKey, v26, v27);
  uint64_t v31 = v28 ^ objc_msgSend_hash(self->_titleLocalizedArguments, v29, v30);
  uint64_t v34 = v22 ^ v31 ^ objc_msgSend_hash(self->_subtitle, v32, v33);
  uint64_t v37 = objc_msgSend_hash(self->_subtitleLocalizedKey, v35, v36);
  return v34 ^ v37 ^ objc_msgSend_hash(self->_subtitleLocalizedArguments, v38, v39);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 10);
  if (v6) {
    objc_msgSend_setText_(self, v4, v6);
  }
  uint64_t v7 = *((void *)v5 + 5);
  if (v7) {
    objc_msgSend_setLocalizedKey_(self, v4, v7);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v8 = *((id *)v5 + 4);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v47, v53, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addLocalizedArguments_(self, v11, *(void *)(*((void *)&v47 + 1) + 8 * i));
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v47, v53, 16);
    }
    while (v12);
  }

  uint64_t v16 = *((void *)v5 + 1);
  if (v16) {
    objc_msgSend_setActionLocKey_(self, v15, v16);
  }
  uint64_t v17 = *((void *)v5 + 3);
  if (v17) {
    objc_msgSend_setLaunchImage_(self, v15, v17);
  }
  uint64_t v18 = *((void *)v5 + 6);
  if (v18) {
    objc_msgSend_setSoundName_(self, v15, v18);
  }
  uint64_t v19 = *((void *)v5 + 2);
  if (v19) {
    objc_msgSend_setCategory_(self, v15, v19);
  }
  uint64_t v20 = *((void *)v5 + 11);
  if (v20) {
    objc_msgSend_setTitle_(self, v15, v20);
  }
  uint64_t v21 = *((void *)v5 + 13);
  if (v21) {
    objc_msgSend_setTitleLocalizedKey_(self, v15, v21);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v22 = *((id *)v5 + 12);
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v43, v52, 16);
  if (v24)
  {
    uint64_t v26 = v24;
    uint64_t v27 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend_addTitleLocalizedArguments_(self, v25, *(void *)(*((void *)&v43 + 1) + 8 * j));
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v43, v52, 16);
    }
    while (v26);
  }

  uint64_t v30 = *((void *)v5 + 7);
  if (v30) {
    objc_msgSend_setSubtitle_(self, v29, v30);
  }
  uint64_t v31 = *((void *)v5 + 9);
  if (v31) {
    objc_msgSend_setSubtitleLocalizedKey_(self, v29, v31);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v32 = *((id *)v5 + 8);
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v39, v51, 16);
  if (v34)
  {
    uint64_t v36 = v34;
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(v32);
        }
        objc_msgSend_addSubtitleLocalizedArguments_(self, v35, *(void *)(*((void *)&v39 + 1) + 8 * k), (void)v39);
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v39, v51, 16);
    }
    while (v36);
  }
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)localizedKey
{
  return self->_localizedKey;
}

- (void)setLocalizedKey:(id)a3
{
}

- (NSMutableArray)localizedArguments
{
  return self->_localizedArguments;
}

- (void)setLocalizedArguments:(id)a3
{
}

- (NSString)actionLocKey
{
  return self->_actionLocKey;
}

- (void)setActionLocKey:(id)a3
{
}

- (NSString)launchImage
{
  return self->_launchImage;
}

- (void)setLaunchImage:(id)a3
{
}

- (NSString)soundName
{
  return self->_soundName;
}

- (void)setSoundName:(id)a3
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
  objc_storeStrong((id *)&self->_titleLocalizedKey, 0);
  objc_storeStrong((id *)&self->_titleLocalizedArguments, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizedKey, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizedArguments, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_soundName, 0);
  objc_storeStrong((id *)&self->_localizedKey, 0);
  objc_storeStrong((id *)&self->_localizedArguments, 0);
  objc_storeStrong((id *)&self->_launchImage, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_actionLocKey, 0);
}

@end