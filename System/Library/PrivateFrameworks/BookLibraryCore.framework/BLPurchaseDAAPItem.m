@interface BLPurchaseDAAPItem
+ (BOOL)supportsSecureCoding;
+ (id)item;
+ (id)itemWithItem:(id)a3;
- (BLPurchaseDAAPItem)initWithCoder:(id)a3;
- (NSDate)expectedDate;
- (NSDictionary)additionalInfo;
- (NSDictionary)frozenInfo;
- (NSMutableDictionary)mutableInfo;
- (NSNumber)hasVideo;
- (NSString)name;
- (NSString)songalbum;
- (NSString)songalbumartist;
- (NSString)songartist;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)objectForKey:(id)a3;
- (int)mediaKind;
- (unint64_t)itemID;
- (unint64_t)songalbumid;
- (unsigned)containerItemID;
- (unsigned)downloadStatus;
- (void)encodeWithCoder:(id)a3;
- (void)freeze;
- (void)setContainerItemID:(unsigned int)a3;
- (void)setDownloadStatus:(unsigned __int8)a3;
- (void)setFrozenInfo:(id)a3;
- (void)setHasVideo:(id)a3;
- (void)setItemID:(unint64_t)a3;
- (void)setMutableInfo:(id)a3;
- (void)setName:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setSongalbum:(id)a3;
- (void)setSongalbumartist:(id)a3;
- (void)setSongalbumid:(unint64_t)a3;
- (void)setSongartist:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)thaw;
- (void)updateItemWithDictionary:(id)a3;
- (void)updateItemWithItem:(id)a3;
@end

@implementation BLPurchaseDAAPItem

+ (id)item
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)itemWithItem:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_item(a1, v5, v6, v7);
  objc_msgSend_updateItemWithItem_(v8, v9, (uint64_t)v4, v10);

  return v8;
}

- (id)description
{
  id v4 = objc_msgSend_valueForKey_(self, a2, @"macAddress", v2);

  v5 = NSString;
  if (v4)
  {
    ClassName = object_getClassName(self);
    uint64_t v12 = objc_msgSend_valueForKey_(self, v7, @"supportsVideo", v8);
    if (v12) {
      v13 = @"AirPlay Video";
    }
    else {
      v13 = @"AirPlay";
    }
    v100 = objc_msgSend_name(self, v9, v10, v11);
    v16 = objc_msgSend_valueForKey_(self, v14, @"isPlaying", v15);
    int v20 = objc_msgSend_BOOLValue(v16, v17, v18, v19);
    v23 = &stru_26CED4330;
    v24 = @"isPlaying, ";
    if (!v20) {
      v24 = &stru_26CED4330;
    }
    v95 = v24;
    v25 = objc_msgSend_valueForKey_(self, v21, @"selected", v22);
    int v31 = objc_msgSend_BOOLValue(v25, v26, v27, v28);
    v102 = (void *)v12;
    v97 = ClassName;
    v98 = v16;
    v96 = v13;
    if (v31)
    {
      v32 = NSString;
      v94 = objc_msgSend_valueForKey_(self, v29, @"volume", v30);
      objc_msgSend_floatValue(v94, v33, v34, v35);
      objc_msgSend_stringWithFormat_(v32, v37, @"selected v:%f ", v38, v36);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v72 = objc_msgSend_valueForKey_(self, v29, @"volume", v30);
    unsigned int v76 = objc_msgSend_BOOLValue(v72, v73, v74, v75);
    v79 = objc_msgSend_valueForKey_(self, v77, @"hasPassword", v78);
    unsigned int v83 = objc_msgSend_BOOLValue(v79, v80, v81, v82);
    v86 = objc_msgSend_valueForKey_(self, v84, @"macAddress", v85);
    v89 = objc_msgSend_stringWithFormat_(v5, v87, @"<%s: %p> %@: %@, %@%@supportsVolume:%d, locked:%d, macAddress:%@", v88, v97, self, v96, v100, v95, v23, v76, v83, v86);

    if (v31)
    {
    }
  }
  else
  {
    v103 = NSString;
    v104.receiver = self;
    v104.super_class = (Class)BLPurchaseDAAPItem;
    v101 = [(BLPurchaseDAAPItem *)&v104 description];
    v42 = objc_msgSend_name(self, v39, v40, v41);
    uint64_t v99 = objc_msgSend_itemID(self, v43, v44, v45);
    v49 = objc_msgSend_songalbum(self, v46, v47, v48);
    v53 = objc_msgSend_songartist(self, v50, v51, v52);
    uint64_t v57 = objc_msgSend_containerItemID(self, v54, v55, v56);
    v61 = objc_msgSend_expectedDate(self, v58, v59, v60);
    v64 = objc_msgSend_objectForKey_(self, v62, @"dmap.itemhidden", v63);
    v70 = objc_msgSend_valueForKey_(self, v65, @"booklets", v66);
    if (v70)
    {
      v71 = objc_msgSend_valueForKey_(self, v67, @"booklets", v69);
    }
    else
    {
      v71 = (void *)MEMORY[0x263EFFA68];
    }
    v90 = objc_msgSend_additionalInfo(self, v67, v68, v69);
    v89 = objc_msgSend_stringWithFormat_(v103, v91, @"%@ %@, %llu, %@, %@, containerItemID = %u, isPreorder = %u, isHidden = %@, Booklets = %@, additionalInfo = %@", v92, v101, v42, v99, v49, v53, v57, v61 != 0, v64, v71, v90);

    if (v70) {
  }
    }

  return v89;
}

- (NSDictionary)additionalInfo
{
  if (self->_isFrozen) {
    objc_msgSend_frozenInfo(self, a2, v2, v3);
  }
  else {
  id v4 = objc_msgSend_mutableInfo(self, a2, v2, v3);
  }

  return (NSDictionary *)v4;
}

- (void)freeze
{
  if (!self->_isFrozen)
  {
    self->_isFrozen = 1;
    v5 = NSDictionary;
    uint64_t v6 = objc_msgSend_mutableInfo(self, a2, v2, v3);
    v9 = objc_msgSend_dictionaryWithDictionary_(v5, v7, (uint64_t)v6, v8);
    objc_msgSend_setFrozenInfo_(self, v10, (uint64_t)v9, v11);

    objc_msgSend_setMutableInfo_(self, v12, 0, v13);
  }
}

- (void)thaw
{
  if (self->_isFrozen)
  {
    self->_isFrozen = 0;
    v5 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v6 = objc_msgSend_frozenInfo(self, a2, v2, v3);
    v9 = objc_msgSend_dictionaryWithDictionary_(v5, v7, (uint64_t)v6, v8);
    objc_msgSend_setMutableInfo_(self, v10, (uint64_t)v9, v11);

    objc_msgSend_setFrozenInfo_(self, v12, 0, v13);
  }
}

- (NSNumber)hasVideo
{
  if (*(unsigned char *)&self->_itemFlags)
  {
    uint64_t v3 = objc_msgSend_numberWithBool_(NSNumber, a2, 1, v2);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setHasVideo:(id)a3
{
  *(unsigned char *)&self->_itemFlags = *(unsigned char *)&self->_itemFlags & 0xFE | objc_msgSend_BOOLValue(a3, a2, (uint64_t)a3, v3);
}

- (int)mediaKind
{
  v5 = objc_msgSend_additionalInfo(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_valueForKey_(v5, v6, @"mediaKind", v7);

  if (!v8)
  {
    uint64_t v12 = objc_msgSend_additionalInfo(self, v9, v10, v11);
    uint64_t v8 = objc_msgSend_valueForKey_(v12, v13, @"com.apple.itunes.mediakind", v14);
  }
  int v15 = objc_msgSend_intValue(v8, v9, v10, v11);

  return v15;
}

- (unint64_t)itemID
{
  unint64_t result = self->_itemID;
  if (!result)
  {
    uint64_t v6 = objc_msgSend_additionalInfo(self, a2, v2, v3);
    v9 = objc_msgSend_valueForKey_(v6, v7, @"dmap.longitemid", v8);
    self->_itemID = objc_msgSend_unsignedLongLongValue(v9, v10, v11, v12);

    return self->_itemID;
  }
  return result;
}

- (NSDate)expectedDate
{
  id v4 = objc_msgSend_additionalInfo(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_valueForKey_(v4, v5, @"com.apple.itunes.preorder-expected-date", v6);

  return (NSDate *)v7;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_additionalInfo(self, a2, v2, v3);
  id v9 = (id)objc_msgSend_mutableCopy(v5, v6, v7, v8);

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  uint64_t v13 = objc_msgSend_name(self, v10, v11, v12);

  if (v13)
  {
    v17 = objc_msgSend_name(self, v14, v15, v16);
    objc_msgSend_setValue_forKey_(v9, v18, (uint64_t)v17, @"name");
  }
  uint64_t v19 = objc_msgSend_songalbum(self, v14, v15, v16);

  if (v19)
  {
    v23 = objc_msgSend_songalbum(self, v20, v21, v22);
    objc_msgSend_setValue_forKey_(v9, v24, (uint64_t)v23, @"daap.songalbum");
  }
  v25 = objc_msgSend_songartist(self, v20, v21, v22);

  if (v25)
  {
    v29 = objc_msgSend_songartist(self, v26, v27, v28);
    objc_msgSend_setValue_forKey_(v9, v30, (uint64_t)v29, @"daap.songartist");
  }
  int v31 = objc_msgSend_songalbumartist(self, v26, v27, v28);

  if (v31)
  {
    uint64_t v35 = objc_msgSend_songalbumartist(self, v32, v33, v34);
    objc_msgSend_setValue_forKey_(v9, v36, (uint64_t)v35, @"daap.songalbumartist");
  }
  v37 = NSNumber;
  uint64_t v38 = objc_msgSend_itemID(self, v32, v33, v34);
  uint64_t v41 = objc_msgSend_numberWithUnsignedLongLong_(v37, v39, v38, v40);
  objc_msgSend_setValue_forKey_(v9, v42, (uint64_t)v41, @"dmap.itemid");

  v43 = NSNumber;
  uint64_t v47 = objc_msgSend_songalbumid(self, v44, v45, v46);
  v50 = objc_msgSend_numberWithUnsignedLongLong_(v43, v48, v47, v49);
  objc_msgSend_setValue_forKey_(v9, v51, (uint64_t)v50, @"daap.songalbumid");

  uint64_t v52 = NSNumber;
  uint64_t v56 = objc_msgSend_containerItemID(self, v53, v54, v55);
  uint64_t v59 = objc_msgSend_numberWithInt_(v52, v57, v56, v58);
  objc_msgSend_setValue_forKey_(v9, v60, (uint64_t)v59, @"dmap.containeritemid");

  v64 = objc_msgSend_hasVideo(self, v61, v62, v63);
  objc_msgSend_setValue_forKey_(v9, v65, (uint64_t)v64, @"hasVideo");

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_name(self, v13, v14, v15);
  int v20 = objc_msgSend_copy(v16, v17, v18, v19);
  objc_msgSend_setName_(v12, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_additionalInfo(self, v23, v24, v25);
  objc_msgSend_updateItemWithDictionary_(v12, v27, (uint64_t)v26, v28);

  return v12;
}

- (BLPurchaseDAAPItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = (BLPurchaseDAAPItem *)objc_msgSend_init(self, v5, v6, v7);
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"name");
    name = v8->_name;
    v8->_name = (NSString *)v11;

    uint64_t v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    int v20 = objc_msgSend_setWithObjects_(v13, v18, v14, v19, v15, v16, v17, 0);
    uint64_t v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, @"additionalInfo");
    objc_msgSend_updateItemWithDictionary_(v8, v23, (uint64_t)v22, v24);
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_name(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"name");

  objc_msgSend_additionalInfo(self, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v14, @"additionalInfo");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isEqualToString_(v4, v5, @"daap.songartist", v6))
  {
    uint64_t v10 = objc_msgSend_songartist(self, v7, v8, v9);
LABEL_7:
    uint64_t v21 = (void *)v10;
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v4, v7, @"daap.songalbumid", v9))
  {
    id v14 = NSString;
    uint64_t v15 = objc_msgSend_songalbumid(self, v11, v12, v13);
    uint64_t v10 = objc_msgSend_stringWithFormat_(v14, v16, @"%llu", v17, v15);
    goto LABEL_7;
  }
  if (objc_msgSend_isEqualToString_(v4, v11, @"daap.songalbum", v13))
  {
    uint64_t v10 = objc_msgSend_songalbum(self, v18, v19, v20);
    goto LABEL_7;
  }
  v23 = objc_msgSend_additionalInfo(self, v18, v19, v20);
  uint64_t v21 = objc_msgSend_objectForKey_(v23, v24, (uint64_t)v4, v25);

LABEL_8:

  return v21;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v20 = a3;
  id v9 = a4;
  if (!self->_isFrozen)
  {
    uint64_t v12 = objc_msgSend_mutableInfo(self, v6, v7, v8);
    if (v20)
    {

      if (!v12)
      {
        uint64_t v16 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v13, v14, v15);
        objc_msgSend_setMutableInfo_(self, v17, (uint64_t)v16, v18);
      }
      uint64_t v12 = objc_msgSend_mutableInfo(self, v13, v14, v15);
      objc_msgSend_setObject_forKey_(v12, v19, (uint64_t)v20, (uint64_t)v9);
    }
    else
    {
      objc_msgSend_removeObjectForKey_(v12, v10, (uint64_t)v9, v11);
    }
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  objc_msgSend_willChangeValueForKey_(self, v7, (uint64_t)v12, v8);
  objc_msgSend_setObject_forKey_(self, v9, (uint64_t)v6, (uint64_t)v12);

  objc_msgSend_didChangeValueForKey_(self, v10, (uint64_t)v12, v11);
}

- (void)updateItemWithItem:(id)a3
{
  id v4 = a3;
  if (!self->_isFrozen)
  {
    id v18 = v4;
    uint64_t v8 = objc_msgSend_name(v4, v5, v6, v7);

    if (v8)
    {
      id v12 = objc_msgSend_name(v18, v9, v10, v11);
      objc_msgSend_setName_(self, v13, (uint64_t)v12, v14);
    }
    uint64_t v15 = objc_msgSend_additionalInfo(v18, v9, v10, v11);
    objc_msgSend_updateItemWithDictionary_(self, v16, (uint64_t)v15, v17);

    id v4 = v18;
  }
}

- (void)updateItemWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = v4;
  if (!self->_isFrozen)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = objc_msgSend_allKeys(v4, v5, v6, v7, 0);
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v20, (uint64_t)v24, 16);
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v18 = objc_msgSend_objectForKeyedSubscript_(v8, v12, v17, v13);
          objc_msgSend_setValue_forKey_(self, v19, (uint64_t)v18, v17);
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v20, (uint64_t)v24, 16);
      }
      while (v14);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)songalbum
{
  return self->_songalbum;
}

- (void)setSongalbum:(id)a3
{
}

- (NSString)songartist
{
  return self->_songartist;
}

- (void)setSongartist:(id)a3
{
}

- (NSString)songalbumartist
{
  return self->_songalbumartist;
}

- (void)setSongalbumartist:(id)a3
{
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (unsigned)downloadStatus
{
  return self->_downloadStatus;
}

- (void)setDownloadStatus:(unsigned __int8)a3
{
  self->_downloadStatus = a3;
}

- (unint64_t)songalbumid
{
  return self->_songalbumid;
}

- (void)setSongalbumid:(unint64_t)a3
{
  self->_songalbumid = a3;
}

- (unsigned)containerItemID
{
  return self->_containerItemID;
}

- (void)setContainerItemID:(unsigned int)a3
{
  self->_containerItemID = a3;
}

- (NSDictionary)frozenInfo
{
  return self->_frozenInfo;
}

- (void)setFrozenInfo:(id)a3
{
}

- (NSMutableDictionary)mutableInfo
{
  return self->_mutableInfo;
}

- (void)setMutableInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableInfo, 0);
  objc_storeStrong((id *)&self->_frozenInfo, 0);
  objc_storeStrong((id *)&self->_songalbumartist, 0);
  objc_storeStrong((id *)&self->_songartist, 0);
  objc_storeStrong((id *)&self->_songalbum, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end