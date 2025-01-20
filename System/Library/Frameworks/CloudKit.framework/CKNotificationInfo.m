@interface CKNotificationInfo
+ (BOOL)supportsSecureCoding;
+ (id)notificationInfo;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBadge;
- (BOOL)shouldSendContentAvailable;
- (BOOL)shouldSendMutableContent;
- (CKNotificationInfo)initWithCoder:(id)a3;
- (NSArray)alertLocalizationArgs;
- (NSArray)desiredKeys;
- (NSArray)subtitleLocalizationArgs;
- (NSArray)titleLocalizationArgs;
- (NSString)alertActionLocalizationKey;
- (NSString)alertBody;
- (NSString)alertLaunchImage;
- (NSString)alertLocalizationKey;
- (NSString)category;
- (NSString)collapseIDKey;
- (NSString)soundName;
- (NSString)subtitle;
- (NSString)subtitleLocalizationKey;
- (NSString)title;
- (NSString)titleLocalizationKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlertActionLocalizationKey:(NSString *)alertActionLocalizationKey;
- (void)setAlertBody:(NSString *)alertBody;
- (void)setAlertLaunchImage:(NSString *)alertLaunchImage;
- (void)setAlertLocalizationArgs:(NSArray *)alertLocalizationArgs;
- (void)setAlertLocalizationKey:(NSString *)alertLocalizationKey;
- (void)setCategory:(NSString *)category;
- (void)setCollapseIDKey:(NSString *)collapseIDKey;
- (void)setDesiredKeys:(NSArray *)desiredKeys;
- (void)setShouldBadge:(BOOL)shouldBadge;
- (void)setShouldSendContentAvailable:(BOOL)shouldSendContentAvailable;
- (void)setShouldSendMutableContent:(BOOL)shouldSendMutableContent;
- (void)setSoundName:(NSString *)soundName;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setSubtitleLocalizationArgs:(NSArray *)subtitleLocalizationArgs;
- (void)setSubtitleLocalizationKey:(NSString *)subtitleLocalizationKey;
- (void)setTitle:(NSString *)title;
- (void)setTitleLocalizationArgs:(NSArray *)titleLocalizationArgs;
- (void)setTitleLocalizationKey:(NSString *)titleLocalizationKey;
@end

@implementation CKNotificationInfo

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

+ (id)notificationInfo
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (NSArray)alertLocalizationArgs
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_alertLocalizationArgs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAlertLocalizationArgs:(NSArray *)alertLocalizationArgs
{
  v10 = alertLocalizationArgs;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v9 = v4->_alertLocalizationArgs;
  v4->_alertLocalizationArgs = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)titleLocalizationArgs
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_titleLocalizationArgs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setTitleLocalizationArgs:(NSArray *)titleLocalizationArgs
{
  v10 = titleLocalizationArgs;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v9 = v4->_titleLocalizationArgs;
  v4->_titleLocalizationArgs = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)subtitleLocalizationArgs
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_subtitleLocalizationArgs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSubtitleLocalizationArgs:(NSArray *)subtitleLocalizationArgs
{
  v10 = subtitleLocalizationArgs;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v9 = v4->_subtitleLocalizationArgs;
  v4->_subtitleLocalizationArgs = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)desiredKeys
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_desiredKeys;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
  v10 = desiredKeys;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v9 = v4->_desiredKeys;
  v4->_desiredKeys = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKNotificationInfo *)a3;
  if (self == v4)
  {
    char v161 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v9 = objc_msgSend_alertBody(self, v6, v7, v8);
      v13 = objc_msgSend_alertBody(v5, v10, v11, v12);
      int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (!v14) {
        goto LABEL_23;
      }
      v18 = objc_msgSend_alertLocalizationKey(self, v15, v16, v17);
      v22 = objc_msgSend_alertLocalizationKey(v5, v19, v20, v21);
      int v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      if (!v23) {
        goto LABEL_23;
      }
      v27 = objc_msgSend_alertLocalizationArgs(self, v24, v25, v26);
      v31 = objc_msgSend_alertLocalizationArgs(v5, v28, v29, v30);
      int v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      if (!v32) {
        goto LABEL_23;
      }
      v36 = objc_msgSend_title(self, v33, v34, v35);
      v40 = objc_msgSend_title(v5, v37, v38, v39);
      int v41 = CKObjectsAreBothNilOrEqual(v36, v40);

      if (!v41) {
        goto LABEL_23;
      }
      v45 = objc_msgSend_titleLocalizationKey(self, v42, v43, v44);
      v49 = objc_msgSend_titleLocalizationKey(v5, v46, v47, v48);
      int v50 = CKObjectsAreBothNilOrEqual(v45, v49);

      if (!v50) {
        goto LABEL_23;
      }
      v54 = objc_msgSend_titleLocalizationArgs(self, v51, v52, v53);
      v58 = objc_msgSend_titleLocalizationArgs(v5, v55, v56, v57);
      int v59 = CKObjectsAreBothNilOrEqual(v54, v58);

      if (!v59) {
        goto LABEL_23;
      }
      v63 = objc_msgSend_subtitle(self, v60, v61, v62);
      v67 = objc_msgSend_subtitle(v5, v64, v65, v66);
      int v68 = CKObjectsAreBothNilOrEqual(v63, v67);

      if (!v68) {
        goto LABEL_23;
      }
      v72 = objc_msgSend_subtitleLocalizationKey(self, v69, v70, v71);
      v76 = objc_msgSend_subtitleLocalizationKey(v5, v73, v74, v75);
      int v77 = CKObjectsAreBothNilOrEqual(v72, v76);

      if (!v77) {
        goto LABEL_23;
      }
      v81 = objc_msgSend_subtitleLocalizationArgs(self, v78, v79, v80);
      v85 = objc_msgSend_subtitleLocalizationArgs(v5, v82, v83, v84);
      int v86 = CKObjectsAreBothNilOrEqual(v81, v85);

      if (!v86) {
        goto LABEL_23;
      }
      v90 = objc_msgSend_alertActionLocalizationKey(self, v87, v88, v89);
      v94 = objc_msgSend_alertActionLocalizationKey(v5, v91, v92, v93);
      int v95 = CKObjectsAreBothNilOrEqual(v90, v94);

      if (!v95) {
        goto LABEL_23;
      }
      v99 = objc_msgSend_alertLaunchImage(self, v96, v97, v98);
      v103 = objc_msgSend_alertLaunchImage(v5, v100, v101, v102);
      int v104 = CKObjectsAreBothNilOrEqual(v99, v103);

      if (!v104) {
        goto LABEL_23;
      }
      v108 = objc_msgSend_soundName(self, v105, v106, v107);
      v112 = objc_msgSend_soundName(v5, v109, v110, v111);
      int v113 = CKObjectsAreBothNilOrEqual(v108, v112);

      if (!v113) {
        goto LABEL_23;
      }
      v117 = objc_msgSend_desiredKeys(self, v114, v115, v116);
      v121 = objc_msgSend_desiredKeys(v5, v118, v119, v120);
      int v122 = CKObjectsAreBothNilOrEqual(v117, v121);

      if (!v122) {
        goto LABEL_23;
      }
      int shouldBadge = objc_msgSend_shouldBadge(self, v123, v124, v125);
      if (shouldBadge != objc_msgSend_shouldBadge(v5, v127, v128, v129)) {
        goto LABEL_23;
      }
      int shouldSendContentAvailable = objc_msgSend_shouldSendContentAvailable(self, v130, v131, v132);
      if (shouldSendContentAvailable != objc_msgSend_shouldSendContentAvailable(v5, v134, v135, v136)) {
        goto LABEL_23;
      }
      int shouldSendMutableContent = objc_msgSend_shouldSendMutableContent(self, v137, v138, v139);
      if (shouldSendMutableContent != objc_msgSend_shouldSendMutableContent(v5, v141, v142, v143)) {
        goto LABEL_23;
      }
      v147 = objc_msgSend_category(self, v144, v145, v146);
      v151 = objc_msgSend_category(v5, v148, v149, v150);
      int v152 = CKObjectsAreBothNilOrEqual(v147, v151);

      if (v152)
      {
        v156 = objc_msgSend_collapseIDKey(self, v153, v154, v155);
        v160 = objc_msgSend_collapseIDKey(v5, v157, v158, v159);
        char v161 = CKObjectsAreBothNilOrEqual(v156, v160);
      }
      else
      {
LABEL_23:
        char v161 = 0;
      }
    }
    else
    {
      char v161 = 0;
    }
  }

  return v161;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_alertBody(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CKNotificationInfo);
  unint64_t v8 = objc_msgSend_alertBody(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  alertBody = v4->_alertBody;
  v4->_alertBody = (NSString *)v12;

  uint64_t v17 = objc_msgSend_alertLocalizationKey(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);
  alertLocalizationKey = v4->_alertLocalizationKey;
  v4->_alertLocalizationKey = (NSString *)v21;

  uint64_t v26 = objc_msgSend_alertLocalizationArgs(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_CKDeepCopy(v26, v27, v28, v29);
  alertLocalizationArgs = v4->_alertLocalizationArgs;
  v4->_alertLocalizationArgs = (NSArray *)v30;

  uint64_t v35 = objc_msgSend_title(self, v32, v33, v34);
  uint64_t v39 = objc_msgSend_copy(v35, v36, v37, v38);
  title = v4->_title;
  v4->_title = (NSString *)v39;

  uint64_t v44 = objc_msgSend_titleLocalizationKey(self, v41, v42, v43);
  uint64_t v48 = objc_msgSend_copy(v44, v45, v46, v47);
  titleLocalizationKey = v4->_titleLocalizationKey;
  v4->_titleLocalizationKey = (NSString *)v48;

  uint64_t v53 = objc_msgSend_titleLocalizationArgs(self, v50, v51, v52);
  uint64_t v57 = objc_msgSend_CKDeepCopy(v53, v54, v55, v56);
  titleLocalizationArgs = v4->_titleLocalizationArgs;
  v4->_titleLocalizationArgs = (NSArray *)v57;

  uint64_t v62 = objc_msgSend_subtitle(self, v59, v60, v61);
  uint64_t v66 = objc_msgSend_copy(v62, v63, v64, v65);
  subtitle = v4->_subtitle;
  v4->_subtitle = (NSString *)v66;

  uint64_t v71 = objc_msgSend_subtitleLocalizationKey(self, v68, v69, v70);
  uint64_t v75 = objc_msgSend_copy(v71, v72, v73, v74);
  subtitleLocalizationKey = v4->_subtitleLocalizationKey;
  v4->_subtitleLocalizationKey = (NSString *)v75;

  uint64_t v80 = objc_msgSend_subtitleLocalizationArgs(self, v77, v78, v79);
  uint64_t v84 = objc_msgSend_CKDeepCopy(v80, v81, v82, v83);
  subtitleLocalizationArgs = v4->_subtitleLocalizationArgs;
  v4->_subtitleLocalizationArgs = (NSArray *)v84;

  uint64_t v89 = objc_msgSend_alertActionLocalizationKey(self, v86, v87, v88);
  uint64_t v93 = objc_msgSend_copy(v89, v90, v91, v92);
  alertActionLocalizationKey = v4->_alertActionLocalizationKey;
  v4->_alertActionLocalizationKey = (NSString *)v93;

  uint64_t v98 = objc_msgSend_alertLaunchImage(self, v95, v96, v97);
  uint64_t v102 = objc_msgSend_copy(v98, v99, v100, v101);
  alertLaunchImage = v4->_alertLaunchImage;
  v4->_alertLaunchImage = (NSString *)v102;

  uint64_t v107 = objc_msgSend_soundName(self, v104, v105, v106);
  uint64_t v111 = objc_msgSend_copy(v107, v108, v109, v110);
  soundName = v4->_soundName;
  v4->_soundName = (NSString *)v111;

  v4->_int shouldBadge = objc_msgSend_shouldBadge(self, v113, v114, v115);
  v4->_int shouldSendContentAvailable = objc_msgSend_shouldSendContentAvailable(self, v116, v117, v118);
  v4->_int shouldSendMutableContent = objc_msgSend_shouldSendMutableContent(self, v119, v120, v121);
  uint64_t v125 = objc_msgSend_category(self, v122, v123, v124);
  uint64_t v129 = objc_msgSend_copy(v125, v126, v127, v128);
  category = v4->_category;
  v4->_category = (NSString *)v129;

  v134 = objc_msgSend_desiredKeys(self, v131, v132, v133);
  uint64_t v138 = objc_msgSend_CKDeepCopy(v134, v135, v136, v137);
  desiredKeys = v4->_desiredKeys;
  v4->_desiredKeys = (NSArray *)v138;

  uint64_t v143 = objc_msgSend_collapseIDKey(self, v140, v141, v142);
  uint64_t v147 = objc_msgSend_copy(v143, v144, v145, v146);
  collapseIDKey = v4->_collapseIDKey;
  v4->_collapseIDKey = (NSString *)v147;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v95 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  unint64_t v8 = objc_msgSend_alertBody(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v95, v9, (uint64_t)v8, @"alertString");

  v13 = objc_msgSend_alertLocalizationKey(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v95, v14, (uint64_t)v13, @"localizedAlert");

  v18 = objc_msgSend_alertLocalizationArgs(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v95, v19, (uint64_t)v18, @"localizedAlertArguments");

  int v23 = objc_msgSend_title(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v95, v24, (uint64_t)v23, @"title");

  uint64_t v28 = objc_msgSend_titleLocalizationKey(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v95, v29, (uint64_t)v28, @"localizedTitle");

  uint64_t v33 = objc_msgSend_titleLocalizationArgs(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v95, v34, (uint64_t)v33, @"localizedTitleArguments");

  uint64_t v38 = objc_msgSend_subtitle(self, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v95, v39, (uint64_t)v38, @"subtitle");

  uint64_t v43 = objc_msgSend_subtitleLocalizationKey(self, v40, v41, v42);
  objc_msgSend_encodeObject_forKey_(v95, v44, (uint64_t)v43, @"localizedSubtitle");

  uint64_t v48 = objc_msgSend_subtitleLocalizationArgs(self, v45, v46, v47);
  objc_msgSend_encodeObject_forKey_(v95, v49, (uint64_t)v48, @"localizedSubtitleArguments");

  uint64_t v53 = objc_msgSend_alertActionLocalizationKey(self, v50, v51, v52);
  objc_msgSend_encodeObject_forKey_(v95, v54, (uint64_t)v53, @"localizedAlertAction");

  v58 = objc_msgSend_alertLaunchImage(self, v55, v56, v57);
  objc_msgSend_encodeObject_forKey_(v95, v59, (uint64_t)v58, @"launchImage");

  v63 = objc_msgSend_soundName(self, v60, v61, v62);
  objc_msgSend_encodeObject_forKey_(v95, v64, (uint64_t)v63, @"soundName");

  int v68 = objc_msgSend_desiredKeys(self, v65, v66, v67);
  objc_msgSend_encodeObject_forKey_(v95, v69, (uint64_t)v68, @"desiredKeys");

  uint64_t shouldBadge = objc_msgSend_shouldBadge(self, v70, v71, v72);
  objc_msgSend_encodeBool_forKey_(v95, v74, shouldBadge, @"shouldBadge");
  uint64_t shouldSendContentAvailable = objc_msgSend_shouldSendContentAvailable(self, v75, v76, v77);
  objc_msgSend_encodeBool_forKey_(v95, v79, shouldSendContentAvailable, @"shouldSendContentAvailable");
  uint64_t shouldSendMutableContent = objc_msgSend_shouldSendMutableContent(self, v80, v81, v82);
  objc_msgSend_encodeBool_forKey_(v95, v84, shouldSendMutableContent, @"shouldSendMutableContent");
  uint64_t v88 = objc_msgSend_category(self, v85, v86, v87);
  objc_msgSend_encodeObject_forKey_(v95, v89, (uint64_t)v88, @"category");

  uint64_t v93 = objc_msgSend_collapseIDKey(self, v90, v91, v92);
  objc_msgSend_encodeObject_forKey_(v95, v94, (uint64_t)v93, @"collapseID");
}

- (CKNotificationInfo)initWithCoder:(id)a3
{
  v98[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)CKNotificationInfo;
  v5 = [(CKNotificationInfo *)&v94 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"alertString");
    alertBody = v5->_alertBody;
    v5->_alertBody = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"localizedAlert");
    alertLocalizationKey = v5->_alertLocalizationKey;
    v5->_alertLocalizationKey = (NSString *)v13;

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    v98[0] = objc_opt_class();
    v98[1] = objc_opt_class();
    uint64_t v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)v98, 2);
    uint64_t v20 = objc_msgSend_setWithArray_(v15, v18, (uint64_t)v17, v19);
    uint64_t v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, @"localizedAlertArguments");
    alertLocalizationArgs = v5->_alertLocalizationArgs;
    v5->_alertLocalizationArgs = (NSArray *)v22;

    uint64_t v24 = objc_opt_class();
    uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v26;

    uint64_t v28 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, @"localizedTitle");
    titleLocalizationKey = v5->_titleLocalizationKey;
    v5->_titleLocalizationKey = (NSString *)v30;

    uint64_t v32 = (void *)MEMORY[0x1E4F1CAD0];
    v97[0] = objc_opt_class();
    v97[1] = objc_opt_class();
    uint64_t v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v33, (uint64_t)v97, 2);
    uint64_t v37 = objc_msgSend_setWithArray_(v32, v35, (uint64_t)v34, v36);
    uint64_t v39 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v37, @"localizedTitleArguments");
    titleLocalizationArgs = v5->_titleLocalizationArgs;
    v5->_titleLocalizationArgs = (NSArray *)v39;

    uint64_t v41 = objc_opt_class();
    uint64_t v43 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, @"subtitle");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v43;

    uint64_t v45 = objc_opt_class();
    uint64_t v47 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, @"localizedSubtitle");
    subtitleLocalizationKey = v5->_subtitleLocalizationKey;
    v5->_subtitleLocalizationKey = (NSString *)v47;

    v49 = (void *)MEMORY[0x1E4F1CAD0];
    v96[0] = objc_opt_class();
    v96[1] = objc_opt_class();
    uint64_t v51 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v50, (uint64_t)v96, 2);
    v54 = objc_msgSend_setWithArray_(v49, v52, (uint64_t)v51, v53);
    uint64_t v56 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v55, (uint64_t)v54, @"localizedSubtitleArguments");
    subtitleLocalizationArgs = v5->_subtitleLocalizationArgs;
    v5->_subtitleLocalizationArgs = (NSArray *)v56;

    uint64_t v58 = objc_opt_class();
    uint64_t v60 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, @"localizedAlertAction");
    alertActionLocalizationKey = v5->_alertActionLocalizationKey;
    v5->_alertActionLocalizationKey = (NSString *)v60;

    uint64_t v62 = objc_opt_class();
    uint64_t v64 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v62, @"launchImage");
    alertLaunchImage = v5->_alertLaunchImage;
    v5->_alertLaunchImage = (NSString *)v64;

    uint64_t v66 = objc_opt_class();
    uint64_t v68 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, @"soundName");
    soundName = v5->_soundName;
    v5->_soundName = (NSString *)v68;

    uint64_t v70 = (void *)MEMORY[0x1E4F1CAD0];
    v95[0] = objc_opt_class();
    v95[1] = objc_opt_class();
    uint64_t v72 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v71, (uint64_t)v95, 2);
    uint64_t v75 = objc_msgSend_setWithArray_(v70, v73, (uint64_t)v72, v74);
    uint64_t v77 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v76, (uint64_t)v75, @"desiredKeys");
    desiredKeys = v5->_desiredKeys;
    v5->_desiredKeys = (NSArray *)v77;

    v5->_uint64_t shouldBadge = objc_msgSend_decodeBoolForKey_(v4, v79, @"shouldBadge", v80);
    v5->_uint64_t shouldSendContentAvailable = objc_msgSend_decodeBoolForKey_(v4, v81, @"shouldSendContentAvailable", v82);
    v5->_uint64_t shouldSendMutableContent = objc_msgSend_decodeBoolForKey_(v4, v83, @"shouldSendMutableContent", v84);
    uint64_t v85 = objc_opt_class();
    uint64_t v87 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v86, v85, @"category");
    category = v5->_category;
    v5->_category = (NSString *)v87;

    uint64_t v89 = objc_opt_class();
    uint64_t v91 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v90, v89, @"collapseID");
    collapseIDKey = v5->_collapseIDKey;
    v5->_collapseIDKey = (NSString *)v91;
  }

  return v5;
}

- (id)debugDescription
{
  uint64_t v75 = NSString;
  uint64_t v82 = objc_msgSend_alertBody(self, a2, v2, v3);
  uint64_t v81 = objc_msgSend_alertLocalizationKey(self, v5, v6, v7);
  uint64_t v78 = objc_msgSend_alertLocalizationArgs(self, v8, v9, v10);
  uint64_t v80 = CKStringWithArray(v78);
  uint64_t v73 = objc_msgSend_title(self, v11, v12, v13);
  uint64_t v72 = objc_msgSend_titleLocalizationKey(self, v14, v15, v16);
  uint64_t v77 = objc_msgSend_titleLocalizationArgs(self, v17, v18, v19);
  uint64_t v79 = CKStringWithArray(v77);
  uint64_t v71 = objc_msgSend_subtitle(self, v20, v21, v22);
  uint64_t v26 = objc_msgSend_subtitleLocalizationKey(self, v23, v24, v25);
  uint64_t v74 = objc_msgSend_subtitleLocalizationArgs(self, v27, v28, v29);
  uint64_t v69 = CKStringWithArray(v74);
  uint64_t v68 = objc_msgSend_alertActionLocalizationKey(self, v30, v31, v32);
  uint64_t v36 = objc_msgSend_alertLaunchImage(self, v33, v34, v35);
  v40 = objc_msgSend_soundName(self, v37, v38, v39);
  uint64_t v70 = objc_msgSend_desiredKeys(self, v41, v42, v43);
  uint64_t v44 = CKStringWithArray(v70);
  if (objc_msgSend_shouldBadge(self, v45, v46, v47)) {
    uint64_t v51 = @"true";
  }
  else {
    uint64_t v51 = @"false";
  }
  if (objc_msgSend_shouldSendContentAvailable(self, v48, v49, v50)) {
    uint64_t v55 = @"true";
  }
  else {
    uint64_t v55 = @"false";
  }
  if (objc_msgSend_shouldSendMutableContent(self, v52, v53, v54)) {
    int v59 = @"true";
  }
  else {
    int v59 = @"false";
  }
  uint64_t v60 = objc_msgSend_category(self, v56, v57, v58);
  uint64_t v64 = objc_msgSend_collapseIDKey(self, v61, v62, v63);
  objc_msgSend_stringWithFormat_(v75, v65, @"\talertBody -> %@\n\talertLocalizationKey -> \"%@\n\talertLocalizationArgs -> %@\n\ttitle -> %@\n\ttitleLocalizationKey -> \"%@\n\ttitleLocalizationArgs -> %@\n\tsubtitle -> %@\n\tsubtitleLocalizationKey -> \"%@\n\tsubtitleLocalizationArgs -> %@\n\talertActionLocalizationKey -> %@\n\talertLaunchImage -> %@\n\tsoundName -> %@\n\tdesiredKeys -> %@\n\tshouldBadge -> %@\n\tshouldSendContentAvailable -> %@\n\tshouldSendMutableContent -> %@\n\tcategory -> %@\n\tcollapseIDKey -> %@\n", v66, v82, v81, v80, v73, v72, v79, v71, v26, v69, v68, v36, v40, v44, v51, v55,
    v59,
    v60,
  uint64_t v76 = v64);

  return v76;
}

- (NSString)alertBody
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAlertBody:(NSString *)alertBody
{
}

- (NSString)alertLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAlertLocalizationKey:(NSString *)alertLocalizationKey
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTitle:(NSString *)title
{
}

- (NSString)titleLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTitleLocalizationKey:(NSString *)titleLocalizationKey
{
}

- (NSString)subtitle
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSubtitle:(NSString *)subtitle
{
}

- (NSString)subtitleLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSubtitleLocalizationKey:(NSString *)subtitleLocalizationKey
{
}

- (NSString)alertActionLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAlertActionLocalizationKey:(NSString *)alertActionLocalizationKey
{
}

- (NSString)alertLaunchImage
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAlertLaunchImage:(NSString *)alertLaunchImage
{
}

- (NSString)soundName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSoundName:(NSString *)soundName
{
}

- (BOOL)shouldBadge
{
  return self->_shouldBadge;
}

- (void)setShouldBadge:(BOOL)shouldBadge
{
  self->_uint64_t shouldBadge = shouldBadge;
}

- (BOOL)shouldSendContentAvailable
{
  return self->_shouldSendContentAvailable;
}

- (void)setShouldSendContentAvailable:(BOOL)shouldSendContentAvailable
{
  self->_uint64_t shouldSendContentAvailable = shouldSendContentAvailable;
}

- (BOOL)shouldSendMutableContent
{
  return self->_shouldSendMutableContent;
}

- (void)setShouldSendMutableContent:(BOOL)shouldSendMutableContent
{
  self->_uint64_t shouldSendMutableContent = shouldSendMutableContent;
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCategory:(NSString *)category
{
}

- (NSString)collapseIDKey
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCollapseIDKey:(NSString *)collapseIDKey
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapseIDKey, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_soundName, 0);
  objc_storeStrong((id *)&self->_alertLaunchImage, 0);
  objc_storeStrong((id *)&self->_alertActionLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alertLocalizationKey, 0);
  objc_storeStrong((id *)&self->_alertBody, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationArgs, 0);
  objc_storeStrong((id *)&self->_titleLocalizationArgs, 0);

  objc_storeStrong((id *)&self->_alertLocalizationArgs, 0);
}

@end