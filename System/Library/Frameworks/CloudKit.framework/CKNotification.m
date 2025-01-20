@interface CKNotification
+ (BOOL)supportsSecureCoding;
+ (CKNotification)notificationFromRemoteNotificationDictionary:(NSDictionary *)notificationDictionary;
+ (id)_realNotificationFromRemoteNotificationDictionary:(id)a3;
+ (void)initialize;
- (BOOL)isPruned;
- (BOOL)isRead;
- (CKContainerID)containerID;
- (CKNotification)init;
- (CKNotification)initWithCoder:(id)a3;
- (CKNotification)initWithRemoteNotificationDictionary:(id)a3;
- (CKNotificationID)notificationID;
- (CKNotificationType)notificationType;
- (CKRecordID)subscriptionOwnerUserRecordID;
- (CKSubscriptionID)subscriptionID;
- (NSArray)alertLocalizationArgs;
- (NSArray)subtitleLocalizationArgs;
- (NSArray)titleLocalizationArgs;
- (NSNumber)badge;
- (NSString)alertActionLocalizationKey;
- (NSString)alertBody;
- (NSString)alertLaunchImage;
- (NSString)alertLocalizationKey;
- (NSString)category;
- (NSString)containerIdentifier;
- (NSString)soundName;
- (NSString)subtitle;
- (NSString)subtitleLocalizationKey;
- (NSString)testDeviceID;
- (NSString)testServerName;
- (NSString)title;
- (NSString)titleLocalizationKey;
- (NSURL)testServerURL;
- (id)CKPropertiesDescription;
- (id)description;
- (id)initInternal;
- (void)encodeWithCoder:(id)a3;
- (void)setAlertActionLocalizationKey:(id)a3;
- (void)setAlertBody:(id)a3;
- (void)setAlertLaunchImage:(id)a3;
- (void)setAlertLocalizationArgs:(id)a3;
- (void)setAlertLocalizationKey:(id)a3;
- (void)setBadge:(id)a3;
- (void)setCategory:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setIsPruned:(BOOL)a3;
- (void)setNotificationID:(id)a3;
- (void)setNotificationType:(int64_t)a3;
- (void)setSoundName:(id)a3;
- (void)setSubscriptionID:(id)a3;
- (void)setSubscriptionOwnerUserRecordID:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLocalizationArgs:(id)a3;
- (void)setSubtitleLocalizationKey:(id)a3;
- (void)setTestDeviceID:(id)a3;
- (void)setTestServerName:(id)a3;
- (void)setTestServerURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLocalizationArgs:(id)a3;
- (void)setTitleLocalizationKey:(id)a3;
@end

@implementation CKNotification

+ (id)_realNotificationFromRemoteNotificationDictionary:(id)a3
{
  id v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  v7 = objc_msgSend_objectForKeyedSubscript_(v3, v5, @"ck", v6);
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"qry", v9);

      if (v10
        || (objc_msgSend_objectForKeyedSubscript_(v7, v11, @"fet", v12),
            v14 = objc_claimAutoreleasedReturnValue(),
            v14,
            v14)
        || (objc_msgSend_objectForKeyedSubscript_(v7, v15, @"met", v16),
            v17 = objc_claimAutoreleasedReturnValue(),
            v17,
            v17))
      {
        v4 = (objc_class *)objc_opt_class();
      }
    }
    id v18 = [v4 alloc];
    v13 = objc_msgSend_initWithRemoteNotificationDictionary_(v18, v19, (uint64_t)v3, v20);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CKNotification)initWithRemoteNotificationDictionary:(id)a3
{
  id v4 = a3;
  v133.receiver = self;
  v133.super_class = (Class)CKNotification;
  v5 = [(CKNotification *)&v133 init];
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setNotificationType_(v5, v6, 0, v7);
    v11 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"ck", v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"nid", v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [CKNotificationID alloc];
        uint64_t v20 = objc_msgSend_initWithNotificationUUID_(v17, v18, (uint64_t)v14, v19);
        objc_msgSend_setNotificationID_(v8, v21, (uint64_t)v20, v22);
      }
      v23 = objc_msgSend_objectForKeyedSubscript_(v11, v15, @"p", v16);

      if (v23) {
        objc_msgSend_setIsPruned_(v8, v24, 1, v25);
      }
      v26 = objc_msgSend_objectForKeyedSubscript_(v11, v24, @"cid", v25);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v29 = v26;
      }
      else {
        v29 = @"Unknown Container";
      }
      v30 = objc_msgSend_objectForKeyedSubscript_(v11, v27, @"ce", v28);
      if (objc_opt_respondsToSelector()) {
        uint64_t v34 = objc_msgSend_integerValue(v30, v31, v32, v33);
      }
      else {
        uint64_t v34 = 1;
      }
      v35 = [CKContainerID alloc];
      v37 = objc_msgSend_initWithContainerIdentifier_environment_(v35, v36, (uint64_t)v29, v34);
      objc_msgSend_setContainerID_(v8, v38, (uint64_t)v37, v39);

      v42 = objc_msgSend_objectForKeyedSubscript_(v11, v40, @"ckuserid", v41);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v43 = [CKRecordID alloc];
        v46 = objc_msgSend_initWithRecordName_(v43, v44, (uint64_t)v42, v45);
        objc_msgSend_setSubscriptionOwnerUserRecordID_(v8, v47, (uint64_t)v46, v48);
      }
    }
    v49 = objc_msgSend_objectForKeyedSubscript_(v4, v12, @"aps", v13);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = objc_msgSend_objectForKeyedSubscript_(v49, v50, @"alert", v51);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_setAlertBody_(v8, v53, (uint64_t)v52, v54);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v57 = objc_msgSend_objectForKeyedSubscript_(v52, v55, @"body", v56);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setAlertBody_(v8, v58, v57, v59);
          }
          v130 = (void *)v57;
          uint64_t v60 = objc_msgSend_objectForKeyedSubscript_(v52, v58, @"loc-key", v59);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setAlertLocalizationKey_(v8, v61, v60, v62);
          }
          v129 = (void *)v60;
          uint64_t v63 = objc_msgSend_objectForKeyedSubscript_(v52, v61, @"loc-args", v62);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setAlertLocalizationArgs_(v8, v64, v63, v65);
          }
          uint64_t v66 = objc_msgSend_objectForKeyedSubscript_(v52, v64, @"title", v65);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setTitle_(v8, v67, v66, v68);
          }
          v128 = (void *)v63;
          uint64_t v69 = objc_msgSend_objectForKeyedSubscript_(v52, v67, @"title-loc-key", v68);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setTitleLocalizationKey_(v8, v70, v69, v71);
          }
          uint64_t v72 = objc_msgSend_objectForKeyedSubscript_(v52, v70, @"title-loc-args", v71);
          objc_opt_class();
          v132 = (void *)v72;
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setTitleLocalizationArgs_(v8, v73, v72, v74);
          }
          uint64_t v75 = objc_msgSend_objectForKeyedSubscript_(v52, v73, @"subtitle", v74);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setSubtitle_(v8, v76, v75, v77);
          }
          uint64_t v78 = objc_msgSend_objectForKeyedSubscript_(v52, v76, @"subtitle-loc-key", v77);
          objc_opt_class();
          v131 = (void *)v78;
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setSubtitleLocalizationKey_(v8, v79, v78, v80);
          }
          v126 = (void *)v69;
          uint64_t v81 = objc_msgSend_objectForKeyedSubscript_(v52, v79, @"subtitle-loc-args", v80);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setSubtitleLocalizationArgs_(v8, v82, v81, v83);
          }
          v125 = (void *)v75;
          v84 = objc_msgSend_objectForKeyedSubscript_(v52, v82, @"action-loc-key", v83);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setAlertActionLocalizationKey_(v8, v85, (uint64_t)v84, v86);
          }
          v124 = (void *)v81;
          v127 = (void *)v66;
          v87 = objc_msgSend_objectForKeyedSubscript_(v52, v85, @"launch-image", v86);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setAlertLaunchImage_(v8, v88, (uint64_t)v87, v89);
          }
          v90 = objc_msgSend_objectForKeyedSubscript_(v52, v88, @"badge", v89);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v94 = objc_msgSend_intValue(v90, v91, v92, v93);
            v97 = objc_msgSend_numberWithInt_(NSNumber, v95, v94, v96);
            objc_msgSend_setBadge_(v8, v98, (uint64_t)v97, v99);
          }
          v100 = objc_msgSend_objectForKeyedSubscript_(v52, v91, @"sound", v93);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setSoundName_(v8, v101, (uint64_t)v100, v102);
          }
        }
      }
      v103 = objc_msgSend_objectForKeyedSubscript_(v49, v55, @"category", v56);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend_setCategory_(v8, v104, (uint64_t)v103, v105);
      }
    }
    v106 = objc_msgSend_objectForKeyedSubscript_(v4, v50, @"ckt", v51);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v109 = objc_msgSend_objectForKeyedSubscript_(v106, v107, @"sn", v108);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend_setTestServerName_(v8, v110, (uint64_t)v109, v111);
      }
      v112 = objc_msgSend_objectForKeyedSubscript_(v106, v110, @"surl", v111);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_setTestServerURL_(v8, v113, (uint64_t)v112, v114);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v117 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v115, (uint64_t)v112, v116);
          objc_msgSend_setTestServerURL_(v8, v118, (uint64_t)v117, v119);
        }
      }
      v120 = objc_msgSend_objectForKeyedSubscript_(v106, v115, @"did", v116);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend_setTestDeviceID_(v8, v121, (uint64_t)v120, v122);
      }
    }
  }

  return v8;
}

+ (void)initialize
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v6, 3);
  sub_18AF14F44((uint64_t)a1, v3, v5, 0, 0);
}

- (CKNotification)init
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  id v4 = [CKException alloc];
  id v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E4F1C3C8], @"%@ is not meant for direct instantiation", v3);
  objc_exception_throw(v6);
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)CKNotification;
  return [(CKNotification *)&v3 init];
}

+ (CKNotification)notificationFromRemoteNotificationDictionary:(NSDictionary *)notificationDictionary
{
  v5 = objc_msgSend_copy(notificationDictionary, a2, (uint64_t)notificationDictionary, v3);
  v8 = objc_msgSend__realNotificationFromRemoteNotificationDictionary_(a1, v6, (uint64_t)v5, v7);

  return (CKNotification *)v8;
}

- (id)CKPropertiesDescription
{
  uint64_t v78 = NSString;
  uint64_t v77 = objc_msgSend_notificationType(self, a2, v2, v3);
  uint64_t v81 = objc_msgSend_notificationID(self, v5, v6, v7);
  v84 = objc_msgSend_notificationUUID(v81, v8, v9, v10);
  uint64_t v80 = objc_msgSend_containerID(self, v11, v12, v13);
  uint64_t v83 = objc_msgSend_ckShortDescription(v80, v14, v15, v16);
  objc_msgSend_subscriptionOwnerUserRecordID(self, v17, v18, v19);
  v79 = uint64_t v20 = &stru_1ED7F5C98;
  if (v79)
  {
    v24 = NSString;
    uint64_t v75 = objc_msgSend_subscriptionOwnerUserRecordID(self, v21, v22, v23);
    uint64_t v74 = objc_msgSend_ckShortDescription(v75, v25, v26, v27);
    objc_msgSend_stringWithFormat_(v24, v28, @", subscriptionOwnerUserRecordID=%@", v29, v74);
    v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v82 = &stru_1ED7F5C98;
  }
  int isPruned = objc_msgSend_isPruned(self, v21, v22, v23);
  uint64_t v34 = @", isPruned";
  if (!isPruned) {
    uint64_t v34 = &stru_1ED7F5C98;
  }
  v76 = v34;
  v38 = objc_msgSend_subscriptionID(self, v31, v32, v33);
  if (v38)
  {
    uint64_t v39 = NSString;
    v73 = objc_msgSend_subscriptionID(self, v35, v36, v37);
    objc_msgSend_stringWithFormat_(v39, v40, @", subscriptionID=%@", v41, v73);
    uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v45 = objc_msgSend_testServerName(self, v35, v36, v37);
  if (v45)
  {
    v46 = NSString;
    uint64_t v72 = objc_msgSend_testServerName(self, v42, v43, v44);
    objc_msgSend_stringWithFormat_(v46, v47, @", testServerName=%@", v48, v72);
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v49 = &stru_1ED7F5C98;
  }
  v53 = objc_msgSend_testServerURL(self, v42, v43, v44);
  if (v53)
  {
    uint64_t v54 = NSString;
    uint64_t v71 = objc_msgSend_testServerURL(self, v50, v51, v52);
    objc_msgSend_stringWithFormat_(v54, v55, @", testServerURL=%@", v56, v71);
    uint64_t v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v57 = &stru_1ED7F5C98;
  }
  v61 = objc_msgSend_testDeviceID(self, v50, v51, v52);
  if (v61)
  {
    uint64_t v62 = NSString;
    uint64_t v63 = objc_msgSend_testDeviceID(self, v58, v59, v60);
    uint64_t v66 = objc_msgSend_stringWithFormat_(v62, v64, @", testDeviceID=%@", v65, v63);
    uint64_t v69 = objc_msgSend_stringWithFormat_(v78, v67, @"notificationType=%ld, notificationID=%@, containerID=%@%@%@%@%@%@%@", v68, v77, v84, v83, v82, v76, v20, v49, v57, v66);
  }
  else
  {
    uint64_t v69 = objc_msgSend_stringWithFormat_(v78, v58, @"notificationType=%ld, notificationID=%@, containerID=%@%@%@%@%@%@%@", v60, v77, v84, v83, v82, v76, v20, v49, v57, &stru_1ED7F5C98);
  }

  if (v53)
  {
  }
  if (v45)
  {
  }
  if (v38)
  {
  }
  if (v79)
  {
  }

  return v69;
}

- (id)description
{
  return (id)((uint64_t (*)(CKNotification *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)isRead
{
  return objc_msgSend_notificationType(self, a2, v2, v3) == 3;
}

- (NSString)containerIdentifier
{
  id v4 = objc_msgSend_containerID(self, a2, v2, v3);
  v8 = objc_msgSend_containerIdentifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (void)setContainerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [CKContainerID alloc];
  objc_msgSend_containerID(self, v6, v7, v8);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_environment(v17, v9, v10, v11);
  v14 = objc_msgSend_initWithContainerIdentifier_environment_(v5, v13, (uint64_t)v4, v12);

  objc_msgSend_setContainerID_(self, v15, (uint64_t)v14, v16);
}

- (void)setSubscriptionID:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v123 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_notificationType(self, v5, v6, v7);
  objc_msgSend_encodeInt64_forKey_(v123, v9, v8, @"Type");
  uint64_t v13 = objc_msgSend_notificationID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v123, v14, (uint64_t)v13, @"ID");

  uint64_t v18 = objc_msgSend_containerID(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v123, v19, (uint64_t)v18, @"containerID");

  uint64_t v23 = objc_msgSend_subscriptionOwnerUserRecordID(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v123, v24, (uint64_t)v23, @"subscriptionOwnerUserRecordID");

  uint64_t isPruned = objc_msgSend_isPruned(self, v25, v26, v27);
  objc_msgSend_encodeBool_forKey_(v123, v29, isPruned, @"IsPruned");
  uint64_t v33 = objc_msgSend_subscriptionID(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v123, v34, (uint64_t)v33, @"SubscriptionID");

  v38 = objc_msgSend_testServerName(self, v35, v36, v37);
  uint64_t v39 = NSStringFromSelector(sel_testServerName);
  objc_msgSend_encodeObject_forKey_(v123, v40, (uint64_t)v38, (uint64_t)v39);

  uint64_t v44 = objc_msgSend_testServerURL(self, v41, v42, v43);
  uint64_t v45 = NSStringFromSelector(sel_testServerURL);
  objc_msgSend_encodeObject_forKey_(v123, v46, (uint64_t)v44, (uint64_t)v45);

  v50 = objc_msgSend_testDeviceID(self, v47, v48, v49);
  uint64_t v51 = NSStringFromSelector(sel_testDeviceID);
  objc_msgSend_encodeObject_forKey_(v123, v52, (uint64_t)v50, (uint64_t)v51);

  uint64_t v56 = objc_msgSend_alertBody(self, v53, v54, v55);
  objc_msgSend_encodeObject_forKey_(v123, v57, (uint64_t)v56, @"AlertBody");

  v61 = objc_msgSend_alertLocalizationKey(self, v58, v59, v60);
  objc_msgSend_encodeObject_forKey_(v123, v62, (uint64_t)v61, @"AlertLocalizationKey");

  uint64_t v66 = objc_msgSend_alertLocalizationArgs(self, v63, v64, v65);
  objc_msgSend_encodeObject_forKey_(v123, v67, (uint64_t)v66, @"AlertLocalizationArgs");

  uint64_t v71 = objc_msgSend_title(self, v68, v69, v70);
  objc_msgSend_encodeObject_forKey_(v123, v72, (uint64_t)v71, @"Title");

  v76 = objc_msgSend_titleLocalizationKey(self, v73, v74, v75);
  objc_msgSend_encodeObject_forKey_(v123, v77, (uint64_t)v76, @"TitleLocalizationKey");

  uint64_t v81 = objc_msgSend_titleLocalizationArgs(self, v78, v79, v80);
  objc_msgSend_encodeObject_forKey_(v123, v82, (uint64_t)v81, @"TitleLocalizationArgs");

  uint64_t v86 = objc_msgSend_subtitle(self, v83, v84, v85);
  objc_msgSend_encodeObject_forKey_(v123, v87, (uint64_t)v86, @"Subtitle");

  v91 = objc_msgSend_subtitleLocalizationKey(self, v88, v89, v90);
  objc_msgSend_encodeObject_forKey_(v123, v92, (uint64_t)v91, @"SubtitleLocalizationKey");

  uint64_t v96 = objc_msgSend_subtitleLocalizationArgs(self, v93, v94, v95);
  objc_msgSend_encodeObject_forKey_(v123, v97, (uint64_t)v96, @"SubtitleLocalizationArgs");

  v101 = objc_msgSend_alertActionLocalizationKey(self, v98, v99, v100);
  objc_msgSend_encodeObject_forKey_(v123, v102, (uint64_t)v101, @"AlertActionLocalizationKey");

  v106 = objc_msgSend_alertLaunchImage(self, v103, v104, v105);
  objc_msgSend_encodeObject_forKey_(v123, v107, (uint64_t)v106, @"LaunchImage");

  uint64_t v111 = objc_msgSend_badge(self, v108, v109, v110);
  objc_msgSend_encodeObject_forKey_(v123, v112, (uint64_t)v111, @"Badge");

  uint64_t v116 = objc_msgSend_soundName(self, v113, v114, v115);
  objc_msgSend_encodeObject_forKey_(v123, v117, (uint64_t)v116, @"SoundName");

  v121 = objc_msgSend_category(self, v118, v119, v120);
  objc_msgSend_encodeObject_forKey_(v123, v122, (uint64_t)v121, @"Category");
}

- (CKNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)CKNotification;
  v5 = [(CKNotification *)&v99 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    v5->_notificationType = objc_msgSend_decodeInt64ForKey_(v4, v7, @"Type", v8);
    uint64_t v9 = objc_opt_class();
    uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"ID");
    notificationID = v5->_notificationID;
    v5->_notificationID = (CKNotificationID *)v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"containerID");
    containerID = v5->_containerID;
    v5->_containerID = (CKContainerID *)v15;

    uint64_t v17 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"subscriptionOwnerUserRecordID");
    subscriptionOwnerUserRecordID = v5->_subscriptionOwnerUserRecordID;
    v5->_subscriptionOwnerUserRecordID = (CKRecordID *)v19;

    v5->_uint64_t isPruned = objc_msgSend_decodeBoolForKey_(v4, v21, @"IsPruned", v22);
    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"SubscriptionID");
    subscriptionID = v5->_subscriptionID;
    v5->_subscriptionID = (NSString *)v25;

    uint64_t v27 = objc_opt_class();
    uint64_t v28 = NSStringFromSelector(sel_testServerName);
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v27, (uint64_t)v28);
    testServerName = v5->_testServerName;
    v5->_testServerName = (NSString *)v30;

    uint64_t v32 = objc_opt_class();
    uint64_t v33 = NSStringFromSelector(sel_testServerURL);
    uint64_t v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v32, (uint64_t)v33);
    testServerURL = v5->_testServerURL;
    v5->_testServerURL = (NSURL *)v35;

    uint64_t v37 = objc_opt_class();
    v38 = NSStringFromSelector(sel_testDeviceID);
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v37, (uint64_t)v38);
    testDeviceID = v5->_testDeviceID;
    v5->_testDeviceID = (NSString *)v40;

    uint64_t v42 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, @"AlertBody");
    alertBody = v5->_alertBody;
    v5->_alertBody = (NSString *)v44;

    uint64_t v46 = objc_opt_class();
    uint64_t v48 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"AlertLocalizationKey");
    alertLocalizationKey = v5->_alertLocalizationKey;
    v5->_alertLocalizationKey = (NSString *)v48;

    v50 = CKAcceptableValueClasses();
    uint64_t v52 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v51, (uint64_t)v50, @"AlertLocalizationArgs");
    alertLocalizationArgs = v5->_alertLocalizationArgs;
    v5->_alertLocalizationArgs = (NSArray *)v52;

    uint64_t v54 = objc_opt_class();
    uint64_t v56 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"Title");
    title = v5->_title;
    v5->_title = (NSString *)v56;

    uint64_t v58 = objc_opt_class();
    uint64_t v60 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, @"TitleLocalizationKey");
    titleLocalizationKey = v5->_titleLocalizationKey;
    v5->_titleLocalizationKey = (NSString *)v60;

    uint64_t v62 = CKAcceptableValueClasses();
    uint64_t v64 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v63, (uint64_t)v62, @"TitleLocalizationArgs");
    titleLocalizationArgs = v5->_titleLocalizationArgs;
    v5->_titleLocalizationArgs = (NSArray *)v64;

    uint64_t v66 = objc_opt_class();
    uint64_t v68 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, @"Subtitle");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v68;

    uint64_t v70 = objc_opt_class();
    uint64_t v72 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v71, v70, @"SubtitleLocalizationKey");
    subtitleLocalizationKey = v5->_subtitleLocalizationKey;
    v5->_subtitleLocalizationKey = (NSString *)v72;

    uint64_t v74 = CKAcceptableValueClasses();
    uint64_t v76 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v75, (uint64_t)v74, @"SubtitleLocalizationArgs");
    subtitleLocalizationArgs = v5->_subtitleLocalizationArgs;
    v5->_subtitleLocalizationArgs = (NSArray *)v76;

    uint64_t v78 = objc_opt_class();
    uint64_t v80 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v79, v78, @"AlertActionLocalizationKey");
    alertActionLocalizationKey = v5->_alertActionLocalizationKey;
    v5->_alertActionLocalizationKey = (NSString *)v80;

    uint64_t v82 = objc_opt_class();
    uint64_t v84 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v83, v82, @"LaunchImage");
    alertLaunchImage = v5->_alertLaunchImage;
    v5->_alertLaunchImage = (NSString *)v84;

    uint64_t v86 = objc_opt_class();
    uint64_t v88 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v87, v86, @"Badge");
    badge = v5->_badge;
    v5->_badge = (NSNumber *)v88;

    uint64_t v90 = objc_opt_class();
    uint64_t v92 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v91, v90, @"SoundName");
    soundName = v5->_soundName;
    v5->_soundName = (NSString *)v92;

    uint64_t v94 = objc_opt_class();
    uint64_t v96 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v95, v94, @"Category");
    category = v5->_category;
    v5->_category = (NSString *)v96;
  }

  return v5;
}

- (CKNotificationType)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(int64_t)a3
{
  self->_notificationType = a3;
}

- (CKNotificationID)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
}

- (CKRecordID)subscriptionOwnerUserRecordID
{
  return self->_subscriptionOwnerUserRecordID;
}

- (void)setSubscriptionOwnerUserRecordID:(id)a3
{
}

- (BOOL)isPruned
{
  return self->_isPruned;
}

- (void)setIsPruned:(BOOL)a3
{
  self->_uint64_t isPruned = a3;
}

- (CKSubscriptionID)subscriptionID
{
  return self->_subscriptionID;
}

- (NSString)alertBody
{
  return self->_alertBody;
}

- (void)setAlertBody:(id)a3
{
}

- (NSString)alertLocalizationKey
{
  return self->_alertLocalizationKey;
}

- (void)setAlertLocalizationKey:(id)a3
{
}

- (NSArray)alertLocalizationArgs
{
  return self->_alertLocalizationArgs;
}

- (void)setAlertLocalizationArgs:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)titleLocalizationKey
{
  return self->_titleLocalizationKey;
}

- (void)setTitleLocalizationKey:(id)a3
{
}

- (NSArray)titleLocalizationArgs
{
  return self->_titleLocalizationArgs;
}

- (void)setTitleLocalizationArgs:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitleLocalizationKey
{
  return self->_subtitleLocalizationKey;
}

- (void)setSubtitleLocalizationKey:(id)a3
{
}

- (NSArray)subtitleLocalizationArgs
{
  return self->_subtitleLocalizationArgs;
}

- (void)setSubtitleLocalizationArgs:(id)a3
{
}

- (NSString)alertActionLocalizationKey
{
  return self->_alertActionLocalizationKey;
}

- (void)setAlertActionLocalizationKey:(id)a3
{
}

- (NSString)alertLaunchImage
{
  return self->_alertLaunchImage;
}

- (void)setAlertLaunchImage:(id)a3
{
}

- (NSNumber)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
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

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (NSString)testServerName
{
  return self->_testServerName;
}

- (void)setTestServerName:(id)a3
{
}

- (NSURL)testServerURL
{
  return self->_testServerURL;
}

- (void)setTestServerURL:(id)a3
{
}

- (NSString)testDeviceID
{
  return self->_testDeviceID;
}

- (void)setTestDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDeviceID, 0);
  objc_storeStrong((id *)&self->_testServerURL, 0);
  objc_storeStrong((id *)&self->_testServerName, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_soundName, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_alertLaunchImage, 0);
  objc_storeStrong((id *)&self->_alertActionLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationArgs, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleLocalizationArgs, 0);
  objc_storeStrong((id *)&self->_titleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alertLocalizationArgs, 0);
  objc_storeStrong((id *)&self->_alertLocalizationKey, 0);
  objc_storeStrong((id *)&self->_alertBody, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
  objc_storeStrong((id *)&self->_subscriptionOwnerUserRecordID, 0);

  objc_storeStrong((id *)&self->_notificationID, 0);
}

@end