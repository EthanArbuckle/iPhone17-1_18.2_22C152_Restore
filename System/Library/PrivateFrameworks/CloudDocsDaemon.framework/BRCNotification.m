@interface BRCNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationFromItem:(id)a3;
+ (id)notificationFromItem:(id)a3 relpath:(id)a4;
+ (id)notificationGatheredFromItem:(id)a3;
+ (id)notificationWithAliasItem:(id)a3 targetItemNotification:(id)a4;
- (BOOL)canMerge:(id)a3;
- (BOOL)isDocumentsFolder;
- (BOOL)isInDataScope;
- (BOOL)isInDocumentScope;
- (BOOL)isInTrashScope;
- (BRCAppLibrary)appLibrary;
- (BRCItemGlobalID)itemGlobalID;
- (BRCItemGlobalID)parentGlobalID;
- (BRCNotification)initWithAliasItem:(id)a3 itemDiffs:(unint64_t)a4;
- (BRCNotification)initWithLocalItem:(id)a3 itemDiffs:(unint64_t)a4;
- (BRFileObjectID)oldParentFileObjectID;
- (Class)classForCoder;
- (NSMutableSet)appLibraryIDsWithReverseAliases;
- (NSSet)parentGlobalIDs;
- (NSString)aliasSourceAppLibraryID;
- (NSString)oldAppLibraryID;
- (NSString)unsaltedBookmarkData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)notificationByStrippingSharingInfoIfNeeded;
- (id)subclassDescription;
- (void)_addAliasDecoration:(id)a3;
- (void)generateLogicalExtension:(id)a3 physicalExtension:(id)a4;
- (void)merge:(id)a3;
- (void)setAppLibraryIDsWithReverseAliases:(id)a3;
- (void)setNumberAttribute:(id)a3 forKey:(id)a4;
- (void)setParentGlobalIDs:(id)a3;
- (void)setUnsaltedBookmarkData:(id)a3;
@end

@implementation BRCNotification

- (id)subclassDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = v3;
  if (self->_itemGlobalID) {
    [v3 appendFormat:@" i:%@", self->_itemGlobalID];
  }
  if (self->_parentGlobalID) {
    [v4 appendFormat:@" parent-id:%@", self->_parentGlobalID];
  }
  if (self->_isInDataScope) {
    [v4 appendFormat:@" sc:data"];
  }
  if (self->_isInDocumentScope) {
    [v4 appendFormat:@" sc:docs"];
  }
  if (self->_isInTrashScope) {
    [v4 appendFormat:@" sc:trash"];
  }
  v5 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F595F8]);
  if (v5 && ([v5 isEqualToFileObjectID:self->_oldParentFileObjectID] & 1) == 0) {
    [v4 appendFormat:@" old-pino:%@", self->_oldParentFileObjectID];
  }
  if (self->_aliasSourceAppLibraryID) {
    [v4 appendFormat:@" alias-container:%@", self->_aliasSourceAppLibraryID];
  }
  if (self->_unsaltedBookmarkData) {
    [v4 appendFormat:@" unsalted-bookmark-data:%@", self->_unsaltedBookmarkData];
  }
  appLibraryIDsWithReverseAliases = self->_appLibraryIDsWithReverseAliases;
  if (appLibraryIDsWithReverseAliases)
  {
    v7 = [(NSMutableSet *)appLibraryIDsWithReverseAliases allObjects];
    v8 = [v7 componentsJoinedByString:@", "];
    [v4 appendFormat:@" reverse-alias-containers:{%@}", v8];
  }
  if (self->_oldAppLibraryID) {
    [v4 appendFormat:@" old-ct:%@", self->_oldAppLibraryID];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BRCNotification;
  v4 = [(BRCNotification *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 43, self->_itemGlobalID);
    objc_storeStrong(v5 + 37, self->_oldParentFileObjectID);
    objc_storeStrong(v5 + 44, self->_parentGlobalIDs);
    objc_storeStrong(v5 + 35, self->_appLibrary);
    objc_storeStrong(v5 + 36, self->_parentGlobalID);
    objc_storeStrong(v5 + 38, self->_aliasSourceAppLibraryID);
    objc_storeStrong(v5 + 40, self->_appLibraryIDsWithReverseAliases);
    objc_storeStrong(v5 + 41, self->_unsaltedBookmarkData);
  }
  return v5;
}

- (BRCNotification)initWithLocalItem:(id)a3 itemDiffs:(unint64_t)a4
{
  uint64_t v283 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 isBRAlias])
  {
    v89 = brc_bread_crumbs();
    v90 = brc_default_log();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT)) {
      -[BRCNotification initWithLocalItem:itemDiffs:].cold.7();
    }
  }
  v272.receiver = self;
  v272.super_class = (Class)BRCNotification;
  v8 = [(BRCNotification *)&v272 init];

  if (v8)
  {
    v9 = [v7 orig];
    if ([v7 isZoneRoot])
    {
      id v10 = 0;
    }
    else
    {
      id v10 = [v7 st];
    }
    unint64_t v268 = a4;
    v269 = [v7 session];
    int v11 = [v7 isOnDisk];
    *(Class *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E4F595E0]) = (Class)-1;
    *(Class *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E4F59610]) = (Class)-1;
    uint64_t v12 = [v7 appLibrary];
    appLibrary = v8->_appLibrary;
    v8->_appLibrary = (BRCAppLibrary *)v12;

    uint64_t v14 = [(BRCAppLibrary *)v8->_appLibrary appLibraryID];
    uint64_t v15 = (int)*MEMORY[0x1E4F59590];
    v16 = *(Class *)((char *)&v8->super.super.isa + v15);
    *(Class *)((char *)&v8->super.super.isa + v15) = (Class)v14;

    uint64_t v17 = [v7 itemGlobalID];
    itemGlobalID = v8->_itemGlobalID;
    v8->_itemGlobalID = (BRCItemGlobalID *)v17;

    uint64_t v19 = [v7 itemParentGlobalID];
    parentGlobalID = v8->_parentGlobalID;
    v8->_parentGlobalID = (BRCItemGlobalID *)v19;

    if (v10)
    {
      [v10 logicalName];
    }
    else
    {
      v4 = [(BRCAppLibrary *)v8->_appLibrary mangledID];
      [v4 mangledIDString];
    v21 = };
    v22 = (id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E4F595E8]);
    objc_storeStrong(v22, v21);
    if (!v10)
    {

      v21 = v4;
    }

    if (!*v22)
    {
      v91 = brc_bread_crumbs();
      v92 = brc_default_log();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT)) {
        -[BRCNotification initWithLocalItem:itemDiffs:].cold.6();
      }
    }
    v8->_isInDocumentScope = [v7 isInDocumentScope];
    v8->_isInDataScope = [v7 isInDataScope];
    v8->_isInTrashScope = [v7 isInTrashScope];
    v23 = [v7 parentClientZone];
    uint64_t v24 = [v23 dbRowID];
    uint64_t v25 = (int)*MEMORY[0x1E4F59608];
    v26 = *(Class *)((char *)&v8->super.super.isa + v25);
    *(Class *)((char *)&v8->super.super.isa + v25) = (Class)v24;

    v27 = [v7 clientZone];
    uint64_t v28 = [v27 dbRowID];
    uint64_t v29 = (int)*MEMORY[0x1E4F59638];
    v30 = *(Class *)((char *)&v8->super.super.isa + v29);
    *(Class *)((char *)&v8->super.super.isa + v29) = (Class)v28;

    if (([v9 isFSRoot] & 1) == 0)
    {
      uint64_t v31 = [v9 parentFileObjectID];
      oldParentFileObjectID = v8->_oldParentFileObjectID;
      v8->_oldParentFileObjectID = (BRFileObjectID *)v31;
    }
    v33 = [v9 appLibrary];
    v34 = v8->_appLibrary;
    v35 = v33;
    v36 = v34;
    if (v35 == v36)
    {

      p_isa = (NSString *)&v35->super.isa;
    }
    else
    {
      v37 = v36;
      if (v36)
      {
        BOOL v38 = [(BRCAppLibrary *)v35 isEqual:v36];

        if (v38)
        {
LABEL_22:
          v266 = v35;
          int v41 = [v7 fromReadOnlyDB];
          v42 = (unsigned int *)((char *)v8 + (int)*MEMORY[0x1E4F595D0]);
          uint64_t v43 = 0x100000;
          if (!v41) {
            uint64_t v43 = 0;
          }
          unint64_t v44 = *v42 & 0xFFEFFFCF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32) | v43;
          v270 = v10;
          if (v11)
          {
            unsigned int *v42 = *v42 & 0xFFEFFFCF | v43;
            *((unsigned char *)v42 + 4) = BYTE4(v44);
            uint64_t v45 = [v7 fileObjectID];
            uint64_t v46 = (int)*MEMORY[0x1E4F595C8];
            v47 = *(Class *)((char *)&v8->super.super.isa + v46);
            *(Class *)((char *)&v8->super.super.isa + v46) = (Class)v45;

            if (([v7 isFSRoot] & 1) != 0
              || ([v7 parentFileObjectID],
                  uint64_t v48 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v49 = (int)*MEMORY[0x1E4F595F8],
                  v50 = *(Class *)((char *)&v8->super.super.isa + v49),
                  *(Class *)((char *)&v8->super.super.isa + v49) = (Class)v48,
                  v50,
                  ([v7 sharingOptions] & 0x48) == 0))
            {
LABEL_36:
              int v65 = [v7 isDocument];
              v66 = *(Class *)((char *)&v8->super.super.isa + (int)v46);
              if (v65)
              {
                v67 = [v66 documentID];

                if (!v67)
                {
                  v68 = brc_bread_crumbs();
                  v69 = brc_default_log();
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
                  {
                    v70 = *(Class *)((char *)&v8->super.super.isa + (int)v46);
                    *(_DWORD *)buf = 138412802;
                    v274 = v70;
                    __int16 v275 = 2112;
                    id v276 = v7;
                    __int16 v277 = 2112;
                    uint64_t v278 = (uint64_t)v68;
                    _os_log_fault_impl(&dword_1D353B000, v69, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: got a document without a document fileObjectID:%@ %@%@", buf, 0x20u);
                  }
                  goto LABEL_60;
                }
              }
              else if ([v66 type] == 2)
              {
                v68 = brc_bread_crumbs();
                v69 = brc_default_log();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT)) {
                  -[BRCNotification initWithLocalItem:itemDiffs:].cold.4();
                }
LABEL_60:

                if (!v11) {
                  goto LABEL_61;
                }
                goto LABEL_42;
              }
              if (!v11)
              {
LABEL_61:
                BOOL v265 = 0;
                goto LABEL_62;
              }
LABEL_42:
              v71 = [v7 appLibrary];
              v72 = [v71 root];
              v271.val[0] = [v72 deviceID];
              v271.val[1] = 0;

              int v73 = [v7 isFSRoot];
              v74 = (int *)MEMORY[0x1E4F59600];
              if (v73)
              {
                v75 = [v7 fileID];
                ssize_t v76 = fsgetpath((char *)buf, 0x400uLL, &v271, [v75 unsignedLongLongValue]);

                if (v76 < 0) {
                  goto LABEL_48;
                }
                v77 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", buf);
                uint64_t v78 = [v77 stringByDeletingLastPathComponent];
                uint64_t v79 = *v74;
                v80 = *(Class *)((char *)&v8->super.super.isa + v79);
                *(Class *)((char *)&v8->super.super.isa + v79) = (Class)v78;
              }
              else
              {
                v81 = [v7 parentFileID];
                ssize_t v82 = fsgetpath((char *)buf, 0x400uLL, &v271, [v81 unsignedLongLongValue]);

                if (v82 < 0) {
                  goto LABEL_48;
                }
                uint64_t v83 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", buf);
                uint64_t v84 = *v74;
                v77 = *(Class *)((char *)&v8->super.super.isa + v84);
                *(Class *)((char *)&v8->super.super.isa + v84) = (Class)v83;
              }

LABEL_48:
              uint64_t v85 = *(uint64_t *)((char *)&v8->super.super.isa + *v74);
              BOOL v265 = v85 != 0;
              if (!v85)
              {
                v86 = brc_bread_crumbs();
                v87 = brc_notifications_log();
                if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG)) {
                  -[BRCNotification initWithLocalItem:itemDiffs:]();
                }

                unint64_t v88 = *v42 & 0xFFFFFFDF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                unsigned int *v42 = *v42 & 0xFFFFFFCF | 0x10;
                *((unsigned char *)v42 + 4) = BYTE4(v88);
              }
LABEL_62:
              v93 = [v10 finderTags];

              if (v93)
              {
                v94 = [BRFieldFinderTags alloc];
                v95 = [v10 finderTags];
                v96 = [(BRFieldFinderTags *)v94 initWithData:v95];

                if (![(BRFieldFinderTags *)v96 tagsCount])
                {
                  v257 = brc_bread_crumbs();
                  v258 = brc_default_log();
                  if (os_log_type_enabled(v258, OS_LOG_TYPE_FAULT)) {
                    -[BRCNotification initWithLocalItem:itemDiffs:]();
                  }
                }
                v97 = [(BRFieldFinderTags *)v96 tags];
                [(BRCNotification *)v8 setAttribute:v97 forKey:*MEMORY[0x1E4F596C8]];
              }
              if (v10) {
                char v98 = [v10 mode];
              }
              else {
                char v98 = 1;
              }
              uint64_t v99 = *v42;
              unint64_t v100 = v99 & 0xFFFFFFFFFFF1FFFFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
              unsigned int *v42 = v99 & 0xFFF1FFFF | ((v98 & 7) << 17);
              *((unsigned char *)v42 + 4) = BYTE4(v100);
              if ([v7 isDirectory])
              {
                unint64_t v101 = *v42 & 0xFFF1FFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32) | ((unint64_t)((*v42 >> 17) & 5 | 2) << 17);
                unsigned int *v42 = *v42 & 0xFFF1FFFF | (((*v42 >> 17) & 5 | 2) << 17);
                *((unsigned char *)v42 + 4) = BYTE4(v101);
              }
              uint64_t v102 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "birthtime"));
              uint64_t v103 = (int)*MEMORY[0x1E4F595A0];
              v104 = *(Class *)((char *)&v8->super.super.isa + v103);
              uint64_t v263 = v103;
              *(Class *)((char *)&v8->super.super.isa + v103) = (Class)v102;

              if ([v7 isInTrashScope])
              {
                int v105 = [v7 isUserVisible];
                int v106 = 0x10000;
                if (!v105) {
                  int v106 = 0;
                }
              }
              else
              {
                int v106 = 0;
              }
              uint64_t v107 = *v42;
              unint64_t v108 = v107 & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
              unsigned int *v42 = v107 & 0xFFFEFFFF | v106;
              *((unsigned char *)v42 + 4) = BYTE4(v108);
              uint64_t v109 = [v10 lastUsedTime];
              if (v109)
              {
                v110 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "lastUsedTime"));
              }
              else
              {
                v110 = 0;
              }
              objc_storeStrong((id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E4F595D8]), v110);
              if (v109) {

              }
              uint64_t v111 = [v10 favoriteRank];
              if (v111)
              {
                v112 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "favoriteRank"));
              }
              else
              {
                v112 = 0;
              }
              objc_storeStrong((id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E4F595C0]), v112);
              if (v111) {

              }
              v113 = [v10 creatorRowID];
              uint64_t v114 = [v113 integerValue];

              if (v114)
              {
                v115 = [v10 creatorRowID];
                v116 = [v7 db];
                v117 = +[BRCAccountSession nameComponentsForKey:v115 db:v116];

                [(BRCNotification *)v8 setAttribute:v117 forKey:*MEMORY[0x1E4F59688]];
              }
              else
              {
                [(BRCNotification *)v8 setAttribute:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F59680]];
              }
              char v118 = [v7 uploadStatus];
              unint64_t v119 = *v42 & 0xFFFFFFF3 | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
              unsigned int *v42 = *v42 & 0xFFFFFFF3 | (4 * (v118 & 3));
              *((unsigned char *)v42 + 4) = BYTE4(v119);
              v120 = [v7 clientZone];
              int v121 = [v120 isSharedZone];

              uint64_t v122 = [v7 sharingOptions] & 0x48;
              if (v121)
              {
                if (!v122 && ([v7 isDead] & 1) == 0)
                {
                  v123 = brc_bread_crumbs();
                  v124 = brc_default_log();
                  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                  {
                    v262 = [v7 digestDescription];
                    v261 = [v7 appLibrary];
                    uint64_t v125 = [v7 sharingOptions];
                    [v7 sharingOptions];
                    BRCPrettyPrintBitmap();
                    id v126 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413314;
                    v274 = v262;
                    __int16 v275 = 2112;
                    id v276 = v261;
                    __int16 v277 = 2048;
                    uint64_t v278 = v125;
                    __int16 v279 = 2112;
                    id v280 = v126;
                    __int16 v281 = 2112;
                    v282 = v123;
                    _os_log_impl(&dword_1D353B000, v124, OS_LOG_TYPE_DEFAULT, "[WARNING] item %@ in shared zone \"%@\" should have share-options set (actual:%lu %@)%@", buf, 0x34u);

                    id v10 = v270;
                  }
                }
                if (([v7 isShareAcceptationFault] & 1) == 0)
                {
                  unsigned int v127 = [v7 sharingOptions];
                  if (((([v7 sharingOptions] >> 3) ^ (v127 >> 6)) & 1) == 0
                    && ([v7 isDead] & 1) == 0)
                  {
                    v128 = brc_bread_crumbs();
                    v129 = brc_default_log();
                    if (os_log_type_enabled(v129, (os_log_type_t)0x90u)) {
                      -[BRCNotification initWithLocalItem:itemDiffs:]();
                    }
                  }
                }
                if (([v7 sharingOptions] & 0x20) == 0)
                {
                  int v130 = 0x2000;
LABEL_108:
                  uint64_t v134 = *v42;
                  unint64_t v135 = v134 & 0xFFFFFFFFFFFFC7FFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  unsigned int *v42 = v134 & 0xFFFFC7FF | v130;
                  *((unsigned char *)v42 + 4) = BYTE4(v135);
                  v136 = [v7 ownerKey];
                  v137 = [v7 db];
                  v138 = +[BRCAccountSession nameComponentsForKey:v136 db:v137];

                  [(BRCNotification *)v8 setAttribute:v138 forKey:*MEMORY[0x1E4F596B8]];
                  goto LABEL_109;
                }
                if ([v7 isKnownByServer])
                {
                  int v130 = 6144;
                  goto LABEL_108;
                }
              }
              else
              {
                char v131 = [v7 sharingOptions];
                if (!v122)
                {
                  if (v131)
                  {
                    int v140 = 0;
                    int v139 = 0;
                    if (([v7 sharingOptions] & 2) != 0) {
                      unsigned int v256 = *v42 & 0xFFFFC7FF | 0x800;
                    }
                    else {
                      unsigned int v256 = *v42 & 0xFFFFC7FF | 0x1000;
                    }
                    *((unsigned char *)v42 + 4) = *((unsigned char *)v42 + 4);
                    unsigned int *v42 = v256;
                  }
                  else
                  {
                    int v140 = 0;
                    int v139 = 0;
                    uint64_t v161 = *v42;
                    unint64_t v162 = v161 & 0xFFFFFFFFFFFFC7FFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                    unsigned int *v42 = v161 & 0xFFFFC7FF;
                    *((unsigned char *)v42 + 4) = BYTE4(v162);
                  }
                  goto LABEL_110;
                }
                unint64_t v132 = *v42 & 0xFFFFC7FF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                int v133 = 2048;
                if ((v131 & 0x10) == 0) {
                  int v133 = 4096;
                }
                unsigned int *v42 = *v42 & 0xFFFFC7FF | v133;
                *((unsigned char *)v42 + 4) = BYTE4(v132);
              }
LABEL_109:
              int v139 = [v7 isDocument];
              int v140 = 1;
LABEL_110:
              v267 = v9;
              if ([v7 isShared] && (objc_msgSend(v7, "sharingOptions") & 4) != 0)
              {
                v142 = [v7 collaborationIdentifierIfComputable];
                int v141 = 1;
              }
              else
              {
                int v141 = 0;
                v142 = 0;
              }
              objc_storeStrong((id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E4F595B0]), v142);
              if (v141)
              {

                if (!v140)
                {
LABEL_116:
                  if (!v139) {
                    goto LABEL_124;
                  }
                  goto LABEL_120;
                }
              }
              else if (!v140)
              {
                goto LABEL_116;
              }
              char v143 = [v7 sharingOptions];
              uint64_t v144 = *v42;
              *((unsigned char *)v42 + 4) = (v144 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32)) >> 32;
              unsigned int *v42 = (v144 & 0xFFDFFFFF | ((v143 & 4) << 19)) ^ 0x200000;
              if (!v139) {
                goto LABEL_124;
              }
LABEL_120:
              v145 = [v7 asDocument];
              v146 = [v145 currentVersion];
              v147 = [v146 lastEditorRowID];

              if (objc_msgSend(v147, "br_isEqualToNumber:", &unk_1F2B26D60))
              {
                [(BRCNotification *)v8 setAttribute:0 forKey:*MEMORY[0x1E4F59698]];
              }
              else
              {
                v148 = [v145 currentVersion];
                v149 = [v148 lastEditorRowID];
                v150 = [v145 db];
                v151 = +[BRCAccountSession nameComponentsForKey:v149 db:v150];

                id v10 = v270;
                [(BRCNotification *)v8 setAttribute:v151 forKey:*MEMORY[0x1E4F59698]];
              }
LABEL_124:
              if ([v7 isInTrashScope])
              {
                v152 = [v7 st];
                v153 = [v152 logicalName];
                if ([v153 length])
                {
                  v154 = [v7 st];
                  v155 = [v154 logicalName];
                  int v156 = [v155 characterAtIndex:0] == 46;
                  unint64_t v157 = *v42 & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  unsigned int *v42 = *v42 & 0xFBFFFFFF | (v156 << 26);
                  *((unsigned char *)v42 + 4) = BYTE4(v157);
                }
                else
                {
                  uint64_t v163 = *v42;
                  unint64_t v164 = v163 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  unsigned int *v42 = v163 & 0xFBFFFFFF;
                  *((unsigned char *)v42 + 4) = BYTE4(v164);
                }
              }
              else
              {
                int v158 = [v7 isUserVisible];
                int v159 = 0x4000000;
                if (v158) {
                  int v159 = 0;
                }
                unint64_t v160 = *v42 & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                unsigned int *v42 = *v42 & 0xFBFFFFFF | v159;
                *((unsigned char *)v42 + 4) = BYTE4(v160);
              }
              uint64_t v165 = [v10 physicalName];
              uint64_t v166 = (int)*MEMORY[0x1E4F59618];
              v167 = *(Class *)((char *)&v8->super.super.isa + v166);
              *(Class *)((char *)&v8->super.super.isa + v166) = (Class)v165;

              if ([v7 isDocument])
              {
                v168 = [v7 asDocument];
                v169 = [v168 currentVersion];
                v170 = [v7 st];
                int v171 = [v170 isHiddenExt];
                int v172 = 0x4000;
                if (!v171) {
                  int v172 = 0;
                }
                unint64_t v173 = *v42 & 0xFFFFBFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                unsigned int *v42 = *v42 & 0xFFFFBFFF | v172;
                *((unsigned char *)v42 + 4) = BYTE4(v173);

                if (([v168 isFault] & v265) == 1)
                {
                  v174 = [v168 desiredVersion];
                  int v175 = [v174 wantsContent];

                  unint64_t v176 = *v42 | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32) | 0x30;
                  if (v175) {
                    unint64_t v176 = *v42 & 0xFFFFFFCF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32) | 0x20;
                  }
                  unsigned int *v42 = v176;
                  *((unsigned char *)v42 + 4) = BYTE4(v176);
                }
                if (v169)
                {
                  v177 = [v169 editedSinceShared];
                  int v178 = [v177 BOOLValue];
                  int v179 = 0x1000000;
                  if (!v178) {
                    int v179 = 0;
                  }
                  unint64_t v180 = *v42 & 0xFEFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  unsigned int *v42 = *v42 & 0xFEFFFFFF | v179;
                  *((unsigned char *)v42 + 4) = BYTE4(v180);

                  uint64_t v181 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v169, "size"));
                  uint64_t v182 = (int)*MEMORY[0x1E4F59628];
                  v183 = *(Class *)((char *)&v8->super.super.isa + v182);
                  *(Class *)((char *)&v8->super.super.isa + v182) = (Class)v181;

                  uint64_t v184 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v169, "mtime"));
                  uint64_t v185 = (int)*MEMORY[0x1E4F595F0];
                  v186 = *(Class *)((char *)&v8->super.super.isa + v185);
                  *(Class *)((char *)&v8->super.super.isa + v185) = (Class)v184;
                }
                if ([v7 isFinderBookmark])
                {
                  char v187 = 3;
                }
                else if ([v169 isPackage])
                {
                  char v187 = 2;
                }
                else
                {
                  char v187 = 1;
                }
                *((unsigned char *)v42 + 5) = v187;
                v224 = [v168 liveConflictLoserEtags];
                int v225 = [v224 count] != 0;
                unint64_t v226 = *v42 & 0xFFFFFFBF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                unsigned int *v42 = *v42 & 0xFFFFFFBF | (v225 << 6);
                *((unsigned char *)v42 + 4) = BYTE4(v226);

                if (([v168 isDead] & 1) == 0)
                {
                  v227 = [v269 fsDownloader];
                  int v228 = [v227 isDownloadingItem:v168];
                  int v229 = 512;
                  if (!v228) {
                    int v229 = 0;
                  }
                  unint64_t v230 = *v42 & 0xFFFFFDFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  unsigned int *v42 = *v42 & 0xFFFFFDFF | v229;
                  *((unsigned char *)v42 + 4) = BYTE4(v230);

                  v231 = [v269 fsUploader];
                  int v232 = [v231 isUploadingItem:v168];
                  int v233 = 256;
                  if (!v232) {
                    int v233 = 0;
                  }
                  unint64_t v234 = *v42 & 0xFFFFFEFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  unsigned int *v42 = *v42 & 0xFFFFFEFF | v233;
                  *((unsigned char *)v42 + 4) = BYTE4(v234);
                }
                unsigned int *v42 = *v42 & 0xFFFFFFFC | [v168 downloadStatus] & 3;
                v235 = [v168 desiredVersion];
                v236 = [v235 downloadError];
                v237 = objc_msgSend(v236, "brc_wrappedError");

                if (v237) {
                  [(BRCNotification *)v8 setAttribute:v237 forKey:*MEMORY[0x1E4F59690]];
                }
                v238 = [v168 desiredVersion];
                int v239 = [v238 wantsContent];

                if (v239)
                {
                  v240 = NSNumber;
                  v241 = [v168 desiredVersion];
                  v242 = objc_msgSend(v240, "numberWithLongLong:", objc_msgSend(v241, "size"));
                  [(BRCNotification *)v8 setAttribute:v242 forKey:*MEMORY[0x1E4F596A8]];
                }
                v243 = [v168 uploadError];
                v189 = objc_msgSend(v243, "brc_wrappedError");

                if ([v168 downloadStatus] == 1
                  && [v168 isDownloadRequestedForThumbnail])
                {
                  unint64_t v244 = *v42 & 0xFFFFFBFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                }
                else
                {
                  int v245 = [v168 isDownloadRequested];
                  uint64_t v246 = 1024;
                  if (!v245) {
                    uint64_t v246 = 0;
                  }
                  unint64_t v244 = *v42 & 0xFFFFFBFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32) | v246;
                }
                unsigned int *v42 = v244;
                *((unsigned char *)v42 + 4) = BYTE4(v244);
                int v247 = [v168 isEvictable];
                int v248 = 0x10000000;
                if (!v247) {
                  int v248 = 0;
                }
                unint64_t v249 = *v42 & 0xEFFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                unsigned int *v42 = *v42 & 0xEFFFFFFF | v248;
                *((unsigned char *)v42 + 4) = BYTE4(v249);
              }
              else if ([v7 isDirectory])
              {
                v188 = [v7 syncUpError];
                v189 = objc_msgSend(v188, "brc_wrappedError");

                v168 = [v7 asDirectory];
                *((unsigned char *)v42 + 5) = 0;
                uint64_t v190 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v168, "mtime"));
                uint64_t v191 = (int)*MEMORY[0x1E4F595F0];
                v192 = *(Class *)((char *)&v8->super.super.isa + v191);
                *(Class *)((char *)&v8->super.super.isa + v191) = (Class)v190;

                int v193 = [v168 isSharedByMeOrContainsSharedByMeItem];
                int v194 = 0x800000;
                if (!v193) {
                  int v194 = 0;
                }
                unint64_t v195 = *v42 & 0xFF7FFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                unsigned int *v42 = *v42 & 0xFF7FFFFF | v194;
                *((unsigned char *)v42 + 4) = BYTE4(v195);
                int v196 = [v168 isSharedToMeOrContainsSharedToMeItem];
                int v197 = 0x400000;
                if (!v196) {
                  int v197 = 0;
                }
                unint64_t v198 = *v42 & 0xFFBFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                unsigned int *v42 = *v42 & 0xFFBFFFFF | v197;
                *((unsigned char *)v42 + 4) = BYTE4(v198);
                int v199 = [v168 isAppLibraryTrashFolder];
                int v200 = 0x40000000;
                if (!v199) {
                  int v200 = 0;
                }
                unint64_t v201 = *v42 & 0xBFFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                unsigned int *v42 = *v42 & 0xBFFFFFFF | v200;
                *((unsigned char *)v42 + 4) = BYTE4(v201);
                v202 = [v7 itemID];
                int v203 = [v202 isNonDesktopRoot];
                unsigned int v204 = 0x80000000;
                if (!v203) {
                  unsigned int v204 = 0;
                }
                unint64_t v205 = *v42 & 0x7FFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                unsigned int *v42 = *v42 & 0x7FFFFFFF | v204;
                *((unsigned char *)v42 + 4) = BYTE4(v205);

                v206 = [v7 itemID];
                int v207 = [v206 isDocumentsFolder];
                uint64_t v208 = 0x100000000;
                if (!v207) {
                  uint64_t v208 = 0;
                }
                unint64_t v209 = (*v42 | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
                unsigned int *v42 = *v42;
                *((unsigned char *)v42 + 4) = (v209 | v208) >> 32;

                if ([v168 isDirectoryFault])
                {
                  uint64_t v210 = [v168 serverQuotaUsage];
                  uint64_t v211 = (int)*MEMORY[0x1E4F59628];
                  v212 = *(Class *)((char *)&v8->super.super.isa + v211);
                  *(Class *)((char *)&v8->super.super.isa + v211) = (Class)v210;
                }
                v213 = [v7 asDirectory];
                uint64_t v214 = [v213 childItemCount];
                uint64_t v215 = (int)*MEMORY[0x1E4F595A8];
                v216 = *(Class *)((char *)&v8->super.super.isa + v215);
                *(Class *)((char *)&v8->super.super.isa + v215) = (Class)v214;

                *v42 |= 3u;
              }
              else
              {
                if (![v7 isSymLink])
                {
                  v189 = 0;
                  goto LABEL_186;
                }
                v217 = [v7 syncUpError];
                v189 = objc_msgSend(v217, "brc_wrappedError");

                *((unsigned char *)v42 + 5) = 4;
                *v42 |= 3u;
                v218 = [v7 asSymlink];
                uint64_t v219 = [v218 symlinkTarget];
                uint64_t v220 = (int)*MEMORY[0x1E4F59630];
                v221 = *(Class *)((char *)&v8->super.super.isa + v220);
                *(Class *)((char *)&v8->super.super.isa + v220) = (Class)v219;

                uint64_t v222 = (int)*MEMORY[0x1E4F595F0];
                v223 = (objc_class *)*(id *)((char *)&v8->super.super.isa + v263);
                v168 = *(Class *)((char *)&v8->super.super.isa + v222);
                *(Class *)((char *)&v8->super.super.isa + v222) = v223;
              }

LABEL_186:
              v250 = [v270 parentID];
              int v251 = [v250 isNonDesktopRoot];

              if (v251) {
                *v42 |= 0x8000000u;
              }
              if (v189) {
                [(BRCNotification *)v8 setAttribute:v189 forKey:*MEMORY[0x1E4F596D0]];
              }
              if ((v268 & 0x100000000) != 0)
              {
                v252 = [v7 orig];
                int v253 = [v252 isLost];

                if (v253) {
                  *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E4F595B8]) |= 0x4000u;
                }
              }
              if ((v268 & 0x20) != 0) {
                *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E4F595B8]) |= 0x10u;
              }
              if ((v268 & 0x1000000040) != 0) {
                *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E4F595B8]) |= 0x20u;
              }

              goto LABEL_198;
            }
            if (([v7 sharingOptions] & 4) == 0)
            {
              v51 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v7);
              v52 = v51;
              if (v51)
              {
                uint64_t v53 = objc_msgSend(v51, "brc_shareItemID");
                v54 = [v7 clientZone];
                v55 = [v7 db];
                v264 = (void *)v53;
                v56 = [v54 itemByItemID:v53 db:v55];

                if (!v56)
                {
                  v259 = brc_bread_crumbs();
                  v260 = brc_default_log();
                  if (os_log_type_enabled(v260, OS_LOG_TYPE_FAULT)) {
                    -[BRCNotification initWithLocalItem:itemDiffs:].cold.5();
                  }
                }
                uint64_t v57 = [v56 fileObjectID];
                uint64_t v58 = (int)*MEMORY[0x1E4F59620];
                v59 = *(Class *)((char *)&v8->super.super.isa + v58);
                *(Class *)((char *)&v8->super.super.isa + v58) = (Class)v57;

                id v10 = v270;
              }
              goto LABEL_35;
            }
            uint64_t v62 = [v7 fileObjectID];
            v63 = (int *)MEMORY[0x1E4F59620];
          }
          else
          {
            *((unsigned char *)v42 + 4) = BYTE4(v44);
            unsigned int *v42 = v44 | 0x10;
            uint64_t v60 = [v9 fileObjectID];
            uint64_t v46 = (int)*MEMORY[0x1E4F595C8];
            v61 = *(Class *)((char *)&v8->super.super.isa + v46);
            *(Class *)((char *)&v8->super.super.isa + v46) = (Class)v60;

            if ([v9 isFSRoot]) {
              goto LABEL_36;
            }
            uint64_t v62 = [v9 parentFileObjectID];
            v63 = (int *)MEMORY[0x1E4F595F8];
          }
          uint64_t v64 = *v63;
          v52 = *(Class *)((char *)&v8->super.super.isa + v64);
          *(Class *)((char *)&v8->super.super.isa + v64) = (Class)v62;
LABEL_35:

          goto LABEL_36;
        }
      }
      else
      {
      }
      uint64_t v40 = [(BRCAppLibrary *)v35 appLibraryID];
      p_isa = v8->_oldAppLibraryID;
      v8->_oldAppLibraryID = (NSString *)v40;
    }

    goto LABEL_22;
  }
LABEL_198:
  v254 = v8;

  return v254;
}

+ (id)notificationGatheredFromItem:(id)a3
{
  id result = (id)[a1 notificationFromItem:a3];
  if (result) {
    *(_WORD *)((char *)result + (int)*MEMORY[0x1E4F595B8]) |= 0x8000u;
  }
  return result;
}

+ (id)notificationFromItem:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isBRAlias];
  v5 = [BRCNotification alloc];
  v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v3 asBRAlias];

    v8 = [(BRCNotification *)v6 initWithAliasItem:v7 itemDiffs:0];
    id v3 = (id)v7;
  }
  else
  {
    v8 = [(BRCNotification *)v5 initWithLocalItem:v3 itemDiffs:0];
  }

  return v8;
}

- (void)setNumberAttribute:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 longLongValue]) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  [(BRCNotification *)self setAttribute:v7 forKey:v6];
}

- (id)notificationByStrippingSharingInfoIfNeeded
{
  uint64_t v3 = (int)*MEMORY[0x1E4F59598];
  uint64_t v4 = *MEMORY[0x1E4F596B8];
  uint64_t v5 = [*(id *)((char *)&self->super.super.isa + v3) objectForKey:*MEMORY[0x1E4F596B8]];

  uint64_t v6 = *MEMORY[0x1E4F59698];
  uint64_t v7 = [*(id *)((char *)&self->super.super.isa + v3) objectForKey:*MEMORY[0x1E4F59698]];

  if (v7 | v5)
  {
    id v8 = (char *)[(BRCNotification *)self copy];
    [*(id *)&v8[v3] removeObjectForKey:v4];
    [*(id *)&v8[v3] removeObjectForKey:v6];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (BOOL)canMerge:(id)a3
{
  uint64_t v4 = a3;
  if ([(BRCItemGlobalID *)self->_itemGlobalID isEqualToItemGlobalID:v4[43]]) {
    char v5 = [*(id *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F595C8]) isEqualToFileObjectID:*(void *)((char *)v4 + (int)*MEMORY[0x1E4F595C8])];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)merge:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCNotification;
  [(BRCNotification *)&v13 merge:v4];
  if ([*((id *)v4 + 44) count])
  {
    NSUInteger v5 = [(NSSet *)self->_parentGlobalIDs count];
    uint64_t v6 = (void *)*((void *)v4 + 44);
    if (v5)
    {
      uint64_t v7 = (NSSet *)[v6 mutableCopy];
      [(NSSet *)v7 unionSet:self->_parentGlobalIDs];
    }
    else
    {
      uint64_t v7 = v6;
    }
    parentGlobalIDs = self->_parentGlobalIDs;
    self->_parentGlobalIDs = v7;
  }
  if (*((void *)v4 + 40))
  {
    appLibraryIDsWithReverseAliases = self->_appLibraryIDsWithReverseAliases;
    if (appLibraryIDsWithReverseAliases)
    {
      -[NSMutableSet unionSet:](appLibraryIDsWithReverseAliases, "unionSet:");
    }
    else
    {
      id v10 = (NSMutableSet *)[*((id *)v4 + 40) mutableCopy];
      int v11 = self->_appLibraryIDsWithReverseAliases;
      self->_appLibraryIDsWithReverseAliases = v10;
    }
    objc_storeStrong((id *)&self->_unsaltedBookmarkData, *((id *)v4 + 41));
  }
  uint64_t v12 = (void *)*((void *)v4 + 45);
  if (v12) {
    objc_storeStrong((id *)&self->_oldAppLibraryID, v12);
  }
}

- (void)generateLogicalExtension:(id)a3 physicalExtension:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCNotification generateLogicalExtension:physicalExtension:]", 841, v27);
  id v8 = brc_bread_crumbs();
  v9 = brc_notifications_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v29 = v27[0];
    __int16 v30 = 2112;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    v33 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx generating sandbox extensions for %@%@", buf, 0x20u);
  }

  id v10 = self;
  objc_sync_enter(v10);
  id v11 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E4F59600]);
  id v12 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E4F59618]);
  id v13 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E4F595E8]);
  id v14 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E4F595C8]);
  __int16 v15 = *(_WORD *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E4F595B8]);
  objc_sync_exit(v10);

  char v16 = [(BRCNotification *)v10 isDead];
  if (v11) {
    char v17 = v16;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0 && (v15 & 0xC030) != 0)
  {
    v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
    if (v12 && (objc_msgSend(v12, "br_isSideFaultName") & 1) == 0)
    {
      v21 = [v18 URLByAppendingPathComponent:v12];
      v22 = _issueReadWriteSandboxExtensionForURL(v21);
      if (v22) {
        [v6 setObject:v22 forKeyedSubscript:v14];
      }
      goto LABEL_23;
    }
    if (v13)
    {
      uint64_t v19 = [v18 URLByAppendingPathComponent:v13];
      v20 = _issueReadWriteSandboxExtensionForURL(v19);
      if (v20) {
        [v6 setObject:v20 forKeyedSubscript:v14];
      }
      if (v12)
      {
LABEL_14:
        if ((objc_msgSend(v12, "br_isSideFaultName") & 1) == 0)
        {
          v26 = brc_bread_crumbs();
          uint64_t v25 = brc_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
            -[BRCNotification generateLogicalExtension:physicalExtension:]();
          }
        }
        v21 = objc_msgSend(v18, "URLByAppendingPathComponent:", v12, v26);

        v22 = _issueReadWriteSandboxExtensionForURL(v21);

        if (v22) {
          [v7 setObject:v22 forKeyedSubscript:v14];
        }
        goto LABEL_23;
      }
    }
    else
    {
      v23 = brc_bread_crumbs();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[BRCNotification generateLogicalExtension:physicalExtension:]();
      }

      uint64_t v19 = 0;
      v20 = 0;
      if (v12) {
        goto LABEL_14;
      }
    }
    v21 = v19;
    v22 = v20;
LABEL_23:
  }
  __brc_leave_section(v27);
}

- (BOOL)isDocumentsFolder
{
  v2 = [(BRCNotification *)self itemGlobalID];
  uint64_t v3 = [v2 itemID];
  char v4 = [v3 isDocumentsFolder];

  return v4;
}

- (BRCItemGlobalID)itemGlobalID
{
  return self->_itemGlobalID;
}

- (BRCItemGlobalID)parentGlobalID
{
  return self->_parentGlobalID;
}

- (BRFileObjectID)oldParentFileObjectID
{
  return self->_oldParentFileObjectID;
}

- (NSSet)parentGlobalIDs
{
  return self->_parentGlobalIDs;
}

- (void)setParentGlobalIDs:(id)a3
{
}

- (BRCAppLibrary)appLibrary
{
  return self->_appLibrary;
}

- (NSString)oldAppLibraryID
{
  return self->_oldAppLibraryID;
}

- (NSString)aliasSourceAppLibraryID
{
  return self->_aliasSourceAppLibraryID;
}

- (BOOL)isInDocumentScope
{
  return self->_isInDocumentScope;
}

- (BOOL)isInDataScope
{
  return self->_isInDataScope;
}

- (BOOL)isInTrashScope
{
  return self->_isInTrashScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldAppLibraryID, 0);
  objc_storeStrong((id *)&self->_parentGlobalIDs, 0);
  objc_storeStrong((id *)&self->_itemGlobalID, 0);
  objc_storeStrong((id *)&self->_unsaltedBookmarkData, 0);
  objc_storeStrong((id *)&self->_appLibraryIDsWithReverseAliases, 0);
  objc_storeStrong((id *)&self->_aliasSourceAppLibraryID, 0);
  objc_storeStrong((id *)&self->_oldParentFileObjectID, 0);
  objc_storeStrong((id *)&self->_parentGlobalID, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
}

- (void)setAppLibraryIDsWithReverseAliases:(id)a3
{
}

- (void)setUnsaltedBookmarkData:(id)a3
{
}

- (NSMutableSet)appLibraryIDsWithReverseAliases
{
  return self->_appLibraryIDsWithReverseAliases;
}

- (NSString)unsaltedBookmarkData
{
  return self->_unsaltedBookmarkData;
}

+ (id)notificationFromItem:(id)a3 relpath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isZoneRoot])
  {
    v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      +[BRCNotification(LegacyAdditions) notificationFromItem:relpath:]((uint64_t)v26, v27, v28, v29, v30, v31, v32, v33);
    }
  }
  id v7 = +[BRCNotification notificationFromItem:v5];
  if (v6)
  {
    if (([v6 exists] & 1) == 0)
    {
      if ([v5 isFault]) {
        goto LABEL_11;
      }
      id v11 = (int *)MEMORY[0x1E4F595D0];
      *(_DWORD *)&v7[*MEMORY[0x1E4F595D0]] &= 0xFFFFFFFC;
      v9 = &v7[*v11];
      unint64_t v10 = *(_DWORD *)v9 & 0xFFFFFFF3 | ((unint64_t)v9[4] << 32);
      goto LABEL_9;
    }
    if (![v6 isDocument]) {
      goto LABEL_11;
    }
    if ([v5 changedAtRelativePath:v6 scanPackage:0])
    {
      id v8 = (int *)MEMORY[0x1E4F595D0];
      *(_DWORD *)&v7[*MEMORY[0x1E4F595D0]] |= 3u;
      v9 = &v7[*v8];
      unint64_t v10 = *(_DWORD *)v9 & 0xFFFFFFF7 | ((unint64_t)v9[4] << 32);
      *(_DWORD *)v9 = *(_DWORD *)v9 & 0xFFFFFFF3 | 4;
LABEL_10:
      v9[4] = BYTE4(v10);
      goto LABEL_11;
    }
    if ([v5 fromReadOnlyDB])
    {
      id v13 = [v5 st];
      uint64_t v14 = [v13 stagedFileID];
      if (v14)
      {
        __int16 v15 = (void *)v14;
        char v16 = [v5 st];
        char v17 = [v16 stagedFileID];
        uint64_t v18 = [v17 unsignedLongLongValue];
        if (v18 == [v6 fileID])
        {
          char v19 = [v6 isFault];

          if ((v19 & 1) == 0)
          {
            v20 = [v5 st];
            int v21 = [v20 stagedGenerationID];
            v22 = [v6 generationID];
            v23 = [v22 fsGenerationID];
            uint64_t v24 = [v23 longValue];

            if (v24 != v21)
            {
              uint64_t v34 = brc_bread_crumbs();
              v35 = brc_default_log();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
                +[BRCNotification(LegacyAdditions) notificationFromItem:relpath:]((uint64_t)v34, v35, v36, v37, v38, v39, v40, v41);
              }
            }
            uint64_t v25 = (int *)MEMORY[0x1E4F595D0];
            *(_DWORD *)&v7[*MEMORY[0x1E4F595D0]] |= 3u;
            v9 = &v7[*v25];
            unint64_t v10 = *(_DWORD *)v9 & 0xFFFFFDFF | ((unint64_t)v9[4] << 32);
LABEL_9:
            *(_DWORD *)v9 = v10;
            goto LABEL_10;
          }
          goto LABEL_11;
        }
      }
    }
  }
LABEL_11:

  return v7;
}

- (void)_addAliasDecoration:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BRCAppLibrary *)self->_appLibrary session];
  id v6 = [v5 volume];
  v46.val[0] = [v6 deviceID];
  v46.val[1] = 0;

  uint64_t v7 = (int)*MEMORY[0x1E4F595D0];
  *(_DWORD *)((char *)&self->super.super.isa + v7) |= 0x8000u;
  id v8 = [v4 itemParentGlobalID];
  parentGlobalID = self->_parentGlobalID;
  self->_parentGlobalID = v8;

  unint64_t v10 = [v4 orig];
  id v11 = [v10 parentFileObjectID];
  oldParentFileObjectID = self->_oldParentFileObjectID;
  self->_oldParentFileObjectID = v11;

  id v13 = [v4 appLibrary];
  uint64_t v14 = [v13 appLibraryID];
  aliasSourceAppLibraryID = self->_aliasSourceAppLibraryID;
  self->_aliasSourceAppLibraryID = v14;

  self->_isInDocumentScope = [v4 isInDocumentScope];
  char v16 = [v4 parentClientZone];
  char v17 = [v16 dbRowID];
  uint64_t v18 = (int)*MEMORY[0x1E4F59608];
  char v19 = *(Class *)((char *)&self->super.super.isa + v18);
  *(Class *)((char *)&self->super.super.isa + v18) = v17;

  if ([v4 isDead])
  {
    v20 = [v4 orig];
    int v21 = [v20 fileObjectID];
    uint64_t v22 = (int)*MEMORY[0x1E4F595C8];
    v23 = *(Class *)((char *)&self->super.super.isa + v22);
    *(Class *)((char *)&self->super.super.isa + v22) = v21;

    uint64_t v24 = [v4 orig];
    uint64_t v25 = [v24 parentFileObjectID];
    uint64_t v26 = (int)*MEMORY[0x1E4F595F8];
    v27 = *(Class *)((char *)&self->super.super.isa + v26);
    *(Class *)((char *)&self->super.super.isa + v26) = v25;

    uint64_t v28 = (char *)self + v7;
    unint64_t v29 = *(_DWORD *)((unsigned char *)&self->super.super.isa + v7) & 0xFFFFFFDF | ((unint64_t)*((unsigned __int8 *)&self->super.super.isa
                                                                                              + v7
                                                                                              + 4) << 32);
    *(_DWORD *)uint64_t v28 = *(_DWORD *)((unsigned char *)&self->super.super.isa + v7) & 0xFFFFFFCF | 0x10;
    v28[4] = BYTE4(v29);
  }
  else
  {
    uint64_t v30 = [v4 fileObjectID];
    uint64_t v31 = (int)*MEMORY[0x1E4F595C8];
    uint64_t v32 = *(Class *)((char *)&self->super.super.isa + v31);
    *(Class *)((char *)&self->super.super.isa + v31) = v30;

    uint64_t v33 = [v4 parentFileObjectID];
    uint64_t v34 = (int)*MEMORY[0x1E4F595F8];
    v35 = *(Class *)((char *)&self->super.super.isa + v34);
    *(Class *)((char *)&self->super.super.isa + v34) = v33;

    uint64_t v36 = [v4 parentFileID];
    ssize_t v37 = fsgetpath(v53, 0x400uLL, &v46, [v36 unsignedLongLongValue]);

    if (v37 < 0)
    {
      v42 = (char *)self + v7;
      unint64_t v43 = *(_DWORD *)((unsigned char *)&self->super.super.isa + v7) & 0xFFFFFFDF | ((unint64_t)*((unsigned __int8 *)&self->super.super.isa
                                                                                                + v7
                                                                                                + 4) << 32);
      *(_DWORD *)v42 = *(_DWORD *)((unsigned char *)&self->super.super.isa + v7) & 0xFFFFFFCF | 0x10;
      v42[4] = BYTE4(v43);
      unint64_t v44 = brc_bread_crumbs();
      uint64_t v45 = brc_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v48 = self;
        __int16 v49 = 2112;
        id v50 = v4;
        __int16 v51 = 2112;
        v52 = v44;
        _os_log_debug_impl(&dword_1D353B000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: can't resolve the alias on disk for %@, marking it dead%@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v38 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v53);
      uint64_t v39 = [v4 st];
      uint64_t v40 = [v39 filename];
      uint64_t v41 = [v38 stringByAppendingPathComponent:v40];

      [(BRCNotification *)self setAttribute:v41 forKey:*MEMORY[0x1E4F596A0]];
    }
  }
}

- (BRCNotification)initWithAliasItem:(id)a3 itemDiffs:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 targetItemID];
  if (v7)
  {
    id v8 = [v6 targetClientZone];
    v9 = [v6 db];
    unint64_t v10 = [v8 itemByItemID:v7 db:v9];
    id v11 = [v10 asShareableItem];

    if (v11 && ([v11 isDead] & 1) == 0 && !objc_msgSend(v11, "isReserved"))
    {
      id v12 = [(BRCNotification *)self initWithLocalItem:v11 itemDiffs:a4];
      int v13 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = 0;
  }
  v28.receiver = self;
  v28.super_class = (Class)BRCNotification;
  id v12 = [(BRCNotification *)&v28 init];
  int v13 = 1;
LABEL_8:
  uint64_t v14 = [v6 st];
  __int16 v15 = [v14 parentID];
  int v16 = [v15 isNonDesktopRoot];

  if (v16)
  {
    *(_DWORD *)((char *)&v12->super.super.isa + (int)*MEMORY[0x1E4F595D0]) |= 0x8000000u;
  }
  else if (!v12)
  {
    goto LABEL_14;
  }
  if (v13)
  {
    char v17 = (char *)v12 + (int)*MEMORY[0x1E4F595D0];
    unint64_t v18 = *(_DWORD *)v17 & 0xFFFFFFDF | ((unint64_t)v17[4] << 32);
    *(_DWORD *)char v17 = *(_DWORD *)v17 & 0xFFFFFFCF | 0x10;
    v17[4] = BYTE4(v18);
    char v19 = [v6 targetAppLibrary];
    uint64_t v20 = [v19 appLibraryID];
    uint64_t v21 = (int)*MEMORY[0x1E4F59590];
    uint64_t v22 = *(Class *)((char *)&v12->super.super.isa + v21);
    *(Class *)((char *)&v12->super.super.isa + v21) = (Class)v20;

    v23 = [v6 clientZone];
    uint64_t v24 = [v23 dbRowID];
    uint64_t v25 = (int)*MEMORY[0x1E4F59638];
    uint64_t v26 = *(Class *)((char *)&v12->super.super.isa + v25);
    *(Class *)((char *)&v12->super.super.isa + v25) = (Class)v24;
  }
  [(BRCNotification *)v12 _addAliasDecoration:v6];
LABEL_14:

  return v12;
}

+ (id)notificationWithAliasItem:(id)a3 targetItemNotification:(id)a4
{
  id v5 = a3;
  id v6 = (void *)[a4 copy];
  uint64_t v7 = v6;
  if (v6) {
    [v6 _addAliasDecoration:v5];
  }

  return v7;
}

- (void)initWithLocalItem:itemDiffs:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] item has both or neither a public and private share %@%@", v1, 0x16u);
}

- (void)initWithLocalItem:itemDiffs:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: finderTags.tagsCount > 0%@", v2, v3, v4, v5, v6);
}

- (void)initWithLocalItem:itemDiffs:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Changing update for item %@ to be dead because the parent path can't be computed%@");
}

- (void)initWithLocalItem:itemDiffs:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _fileObjectID.type != BRFileObjectIDTypeDocument%@", v2, v3, v4, v5, v6);
}

- (void)initWithLocalItem:itemDiffs:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: shareRoot%@", v2, v3, v4, v5, v6);
}

- (void)initWithLocalItem:itemDiffs:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _logicalName != nil%@", v2, v3, v4, v5, v6);
}

- (void)initWithLocalItem:itemDiffs:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !item.isBRAlias%@", v2, v3, v4, v5, v6);
}

- (void)generateLogicalExtension:physicalExtension:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: physicalName.br_isSideFaultName%@", v2, v3, v4, v5, v6);
}

- (void)generateLogicalExtension:physicalExtension:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: logicalName%@", v2, v3, v4, v5, v6);
}

@end