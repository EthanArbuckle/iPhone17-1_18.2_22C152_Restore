@interface EMMessageListItemChange
+ (BOOL)supportsSecureCoding;
+ (id)changeForFlags:(id)a3;
+ (id)changeForKeyPaths:(id)a3 ofItem:(id)a4;
+ (id)changeForUnsubscribeType:(int64_t)a3;
+ (id)changeFrom:(id)a3 to:(id)a4;
+ (id)changeFrom:(id)a3 to:(id)a4 with:(id)a5 hasChanges:(BOOL)a6;
+ (id)changesForKeyPaths:(id)a3 ofItems:(id)a4;
- (BOOL)applyToMessageListItem:(id)a3;
- (BOOL)isCCMe;
- (BOOL)isEqual:(id)a3;
- (BOOL)isToMe;
- (ECMessageFlags)flags;
- (EMCollectionItemID)displayMessageItemID;
- (EMMessageListItemChange)initWithCoder:(id)a3;
- (EMMessageListItemChangeBusinessLogoID)businessLogoID;
- (EMMessageListItemChangeCategory)category;
- (EMMessageListItemChangeFlagColors)flagColors;
- (EMMessageListItemChangeFollowUp)followUp;
- (EMMessageListItemChangeGeneratedSummary)generatedSummary;
- (EMMessageListItemChangeReadLater)readLater;
- (EMMessageListItemChangeSendLaterDate)sendLaterDate;
- (EMMessageListItemChangeSubject)subject;
- (EMMessageListItemChangeSummary)summary;
- (NSArray)ccList;
- (NSArray)groupedSenderMessageListItems;
- (NSArray)mailboxObjectIDs;
- (NSArray)mailboxes;
- (NSArray)senderList;
- (NSArray)toList;
- (NSDate)date;
- (NSDate)displayDate;
- (NSNumber)allowAuthenticationWarning;
- (NSNumber)businessID;
- (NSNumber)conversationID;
- (NSNumber)conversationNotificationLevel;
- (NSNumber)count;
- (NSNumber)hasAttachments;
- (NSNumber)hasUnflagged;
- (NSNumber)isAuthenticated;
- (NSNumber)isBlocked;
- (NSNumber)isVIP;
- (NSNumber)messageSize;
- (NSNumber)unsubscribeType;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (id)_descriptionForInternal:(BOOL)a3 useDebugDescriptions:(BOOL)a4;
- (id)changeDescriptionsForInternal:(BOOL)a3 useDebugDescriptions:(BOOL)a4;
- (unint64_t)hash;
- (void)addChange:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowAuthenticationWarning:(id)a3;
- (void)setBusinessID:(id)a3;
- (void)setBusinessLogoID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCcList:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setConversationNotificationLevel:(id)a3;
- (void)setCount:(id)a3;
- (void)setDate:(id)a3;
- (void)setDisplayDate:(id)a3;
- (void)setDisplayMessageItemID:(id)a3;
- (void)setFlagColors:(id)a3;
- (void)setFlags:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setGeneratedSummary:(id)a3;
- (void)setGroupedSenderMessageListItems:(id)a3;
- (void)setHasAttachments:(id)a3;
- (void)setHasUnflagged:(id)a3;
- (void)setIsAuthenticated:(id)a3;
- (void)setIsBlocked:(id)a3;
- (void)setIsCCMe:(BOOL)a3;
- (void)setIsToMe:(BOOL)a3;
- (void)setIsVIP:(id)a3;
- (void)setMailboxObjectIDs:(id)a3;
- (void)setMailboxes:(id)a3;
- (void)setMessageSize:(id)a3;
- (void)setReadLater:(id)a3;
- (void)setSendLaterDate:(id)a3;
- (void)setSenderList:(id)a3;
- (void)setSubject:(id)a3;
- (void)setSummary:(id)a3;
- (void)setToList:(id)a3;
- (void)setUnsubscribeType:(id)a3;
@end

@implementation EMMessageListItemChange

- (NSString)debugDescription
{
  return (NSString *)[(EMMessageListItemChange *)self _descriptionForInternal:1 useDebugDescriptions:1];
}

- (NSString)ef_publicDescription
{
  v3 = [MEMORY[0x1E4F60D58] currentDevice];
  v4 = -[EMMessageListItemChange _descriptionForInternal:useDebugDescriptions:](self, "_descriptionForInternal:useDebugDescriptions:", [v3 isInternal], 0);

  return (NSString *)v4;
}

- (id)_descriptionForInternal:(BOOL)a3 useDebugDescriptions:(BOOL)a4
{
  v5 = [(EMMessageListItemChange *)self changeDescriptionsForInternal:a3 useDebugDescriptions:a4];
  v6 = [v5 componentsJoinedByString:@"\n"];
  v7 = (void *)[[NSString alloc] initWithFormat:@"<%@: %p> %lu changes\n%@", objc_opt_class(), self, objc_msgSend(v5, "count"), v6];

  return v7;
}

- (id)changeDescriptionsForInternal:(BOOL)a3 useDebugDescriptions:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = [(EMMessageListItemChange *)self date];

  if (v8)
  {
    if (v4)
    {
      v9 = [(EMMessageListItemChange *)self date];
      uint64_t v10 = [v9 debugDescription];
    }
    else
    {
      v11 = [(EMMessageListItemChange *)self date];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v13 = (void *)MEMORY[0x1E4F60E00];
        v9 = [(EMMessageListItemChange *)self date];
        [v13 partiallyRedactedStringForString:v9];
      }
      else
      {
        v9 = [(EMMessageListItemChange *)self date];
        [v9 description];
      uint64_t v10 = };
    }
    v14 = (void *)v10;

    v15 = (void *)[[NSString alloc] initWithFormat:@"date: %@", v14];
    [v7 addObject:v15];
  }
  v16 = [(EMMessageListItemChange *)self displayDate];

  if (v16)
  {
    if (v4)
    {
      v17 = [(EMMessageListItemChange *)self displayDate];
      uint64_t v18 = [v17 debugDescription];
    }
    else
    {
      v19 = [(EMMessageListItemChange *)self displayDate];
      objc_opt_class();
      char v20 = objc_opt_isKindOfClass();

      if (v20)
      {
        v21 = (void *)MEMORY[0x1E4F60E00];
        v17 = [(EMMessageListItemChange *)self displayDate];
        [v21 partiallyRedactedStringForString:v17];
      }
      else
      {
        v17 = [(EMMessageListItemChange *)self displayDate];
        [v17 description];
      uint64_t v18 = };
    }
    v22 = (void *)v18;

    v23 = (void *)[[NSString alloc] initWithFormat:@"displayDate: %@", v22];
    [v7 addObject:v23];
  }
  v24 = [(EMMessageListItemChange *)self readLater];

  if (v24)
  {
    if (v4)
    {
      v25 = [(EMMessageListItemChange *)self readLater];
      uint64_t v26 = [v25 debugDescription];
    }
    else
    {
      v27 = [(EMMessageListItemChange *)self readLater];
      objc_opt_class();
      char v28 = objc_opt_isKindOfClass();

      if (v28)
      {
        v29 = (void *)MEMORY[0x1E4F60E00];
        v25 = [(EMMessageListItemChange *)self readLater];
        [v29 partiallyRedactedStringForString:v25];
      }
      else
      {
        v25 = [(EMMessageListItemChange *)self readLater];
        [v25 description];
      uint64_t v26 = };
    }
    v30 = (void *)v26;

    v31 = (void *)[[NSString alloc] initWithFormat:@"readLater: %@", v30];
    [v7 addObject:v31];
  }
  v32 = [(EMMessageListItemChange *)self sendLaterDate];

  if (v32)
  {
    if (v4)
    {
      v33 = [(EMMessageListItemChange *)self sendLaterDate];
      uint64_t v34 = [v33 debugDescription];
    }
    else
    {
      v35 = [(EMMessageListItemChange *)self sendLaterDate];
      objc_opt_class();
      char v36 = objc_opt_isKindOfClass();

      if (v36)
      {
        v37 = (void *)MEMORY[0x1E4F60E00];
        v33 = [(EMMessageListItemChange *)self sendLaterDate];
        [v37 partiallyRedactedStringForString:v33];
      }
      else
      {
        v33 = [(EMMessageListItemChange *)self sendLaterDate];
        [v33 description];
      uint64_t v34 = };
    }
    v38 = (void *)v34;

    v39 = (void *)[[NSString alloc] initWithFormat:@"sendLaterDate: %@", v38];
    [v7 addObject:v39];
  }
  v40 = [(EMMessageListItemChange *)self followUp];

  if (v40)
  {
    if (v4)
    {
      v41 = [(EMMessageListItemChange *)self followUp];
      uint64_t v42 = [v41 debugDescription];
    }
    else
    {
      v43 = [(EMMessageListItemChange *)self followUp];
      objc_opt_class();
      char v44 = objc_opt_isKindOfClass();

      if (v44)
      {
        v45 = (void *)MEMORY[0x1E4F60E00];
        v41 = [(EMMessageListItemChange *)self followUp];
        [v45 partiallyRedactedStringForString:v41];
      }
      else
      {
        v41 = [(EMMessageListItemChange *)self followUp];
        [v41 description];
      uint64_t v42 = };
    }
    v46 = (void *)v42;

    v47 = (void *)[[NSString alloc] initWithFormat:@"followUp: %@", v46];
    [v7 addObject:v47];
  }
  v48 = [(EMMessageListItemChange *)self subject];

  if (v48)
  {
    if (v5)
    {
      if (v4)
      {
        v49 = [(EMMessageListItemChange *)self subject];
        uint64_t v50 = [v49 debugDescription];
      }
      else
      {
        v51 = [(EMMessageListItemChange *)self subject];
        objc_opt_class();
        char v52 = objc_opt_isKindOfClass();

        if (v52)
        {
          v53 = (void *)MEMORY[0x1E4F60E00];
          v49 = [(EMMessageListItemChange *)self subject];
          [v53 partiallyRedactedStringForString:v49];
        }
        else
        {
          v49 = [(EMMessageListItemChange *)self subject];
          [v49 description];
        uint64_t v50 = };
      }
      v54 = (void *)v50;

      v55 = (void *)[[NSString alloc] initWithFormat:@"subject: %@", v54];
      [v7 addObject:v55];
    }
    else
    {
      [v7 addObject:@"subject"];
    }
  }
  v56 = [(EMMessageListItemChange *)self businessID];

  if (v56)
  {
    if (v4)
    {
      v57 = [(EMMessageListItemChange *)self businessID];
      uint64_t v58 = [v57 debugDescription];
    }
    else
    {
      v59 = [(EMMessageListItemChange *)self businessID];
      objc_opt_class();
      char v60 = objc_opt_isKindOfClass();

      if (v60)
      {
        v61 = (void *)MEMORY[0x1E4F60E00];
        v57 = [(EMMessageListItemChange *)self businessID];
        [v61 partiallyRedactedStringForString:v57];
      }
      else
      {
        v57 = [(EMMessageListItemChange *)self businessID];
        [v57 description];
      uint64_t v58 = };
    }
    v62 = (void *)v58;

    v63 = (void *)[[NSString alloc] initWithFormat:@"businessID: %@", v62];
    [v7 addObject:v63];
  }
  v64 = [(EMMessageListItemChange *)self businessLogoID];

  if (v64)
  {
    if (v4)
    {
      v65 = [(EMMessageListItemChange *)self businessLogoID];
      uint64_t v66 = [v65 debugDescription];
    }
    else
    {
      v67 = [(EMMessageListItemChange *)self businessLogoID];
      objc_opt_class();
      char v68 = objc_opt_isKindOfClass();

      if (v68)
      {
        v69 = (void *)MEMORY[0x1E4F60E00];
        v65 = [(EMMessageListItemChange *)self businessLogoID];
        [v69 partiallyRedactedStringForString:v65];
      }
      else
      {
        v65 = [(EMMessageListItemChange *)self businessLogoID];
        [v65 description];
      uint64_t v66 = };
    }
    v70 = (void *)v66;

    v71 = (void *)[[NSString alloc] initWithFormat:@"businessLogoID: %@", v70];
    [v7 addObject:v71];
  }
  v72 = [(EMMessageListItemChange *)self category];

  if (v72)
  {
    if (v4)
    {
      v73 = [(EMMessageListItemChange *)self category];
      uint64_t v74 = [v73 debugDescription];
    }
    else
    {
      v75 = [(EMMessageListItemChange *)self category];
      objc_opt_class();
      char v76 = objc_opt_isKindOfClass();

      if (v76)
      {
        v77 = (void *)MEMORY[0x1E4F60E00];
        v73 = [(EMMessageListItemChange *)self category];
        [v77 partiallyRedactedStringForString:v73];
      }
      else
      {
        v73 = [(EMMessageListItemChange *)self category];
        [v73 description];
      uint64_t v74 = };
    }
    v78 = (void *)v74;

    v79 = (void *)[[NSString alloc] initWithFormat:@"category: %@", v78];
    [v7 addObject:v79];
  }
  v80 = [(EMMessageListItemChange *)self summary];

  if (v80)
  {
    if (v5)
    {
      if (v4)
      {
        v81 = [(EMMessageListItemChange *)self summary];
        uint64_t v82 = [v81 debugDescription];
      }
      else
      {
        v83 = [(EMMessageListItemChange *)self summary];
        objc_opt_class();
        char v84 = objc_opt_isKindOfClass();

        if (v84)
        {
          v85 = (void *)MEMORY[0x1E4F60E00];
          v81 = [(EMMessageListItemChange *)self summary];
          [v85 partiallyRedactedStringForString:v81];
        }
        else
        {
          v81 = [(EMMessageListItemChange *)self summary];
          [v81 description];
        uint64_t v82 = };
      }
      v86 = (void *)v82;

      v87 = (void *)[[NSString alloc] initWithFormat:@"summary: %@", v86];
      [v7 addObject:v87];
    }
    else
    {
      [v7 addObject:@"summary"];
    }
  }
  if (_os_feature_enabled_impl())
  {
    if (EMIsGreymatterSupportedWithOverride())
    {
      v88 = [(EMMessageListItemChange *)self generatedSummary];

      if (v88)
      {
        if (v5)
        {
          if (v4)
          {
            v89 = [(EMMessageListItemChange *)self generatedSummary];
            uint64_t v90 = [v89 debugDescription];
          }
          else
          {
            v91 = [(EMMessageListItemChange *)self generatedSummary];
            objc_opt_class();
            char v92 = objc_opt_isKindOfClass();

            if (v92)
            {
              v93 = (void *)MEMORY[0x1E4F60E00];
              v89 = [(EMMessageListItemChange *)self generatedSummary];
              [v93 partiallyRedactedStringForString:v89];
            }
            else
            {
              v89 = [(EMMessageListItemChange *)self generatedSummary];
              [v89 description];
            uint64_t v90 = };
          }
          v94 = (void *)v90;

          v95 = (void *)[[NSString alloc] initWithFormat:@"generatedSummary: %@", v94];
          [v7 addObject:v95];
        }
        else
        {
          [v7 addObject:@"generatedSummary"];
        }
      }
    }
  }
  v96 = [(EMMessageListItemChange *)self senderList];

  if (v96)
  {
    if (v5)
    {
      if (v4)
      {
        v97 = [(EMMessageListItemChange *)self senderList];
        uint64_t v98 = [v97 debugDescription];
      }
      else
      {
        v99 = [(EMMessageListItemChange *)self senderList];
        objc_opt_class();
        char v100 = objc_opt_isKindOfClass();

        if (v100)
        {
          v101 = (void *)MEMORY[0x1E4F60E00];
          v97 = [(EMMessageListItemChange *)self senderList];
          [v101 partiallyRedactedStringForString:v97];
        }
        else
        {
          v97 = [(EMMessageListItemChange *)self senderList];
          [v97 description];
        uint64_t v98 = };
      }
      v102 = (void *)v98;

      v103 = (void *)[[NSString alloc] initWithFormat:@"senderList: %@", v102];
      [v7 addObject:v103];
    }
    else
    {
      [v7 addObject:@"senderList"];
    }
  }
  v104 = [(EMMessageListItemChange *)self toList];

  if (v104)
  {
    if (v5)
    {
      if (v4)
      {
        v105 = [(EMMessageListItemChange *)self toList];
        uint64_t v106 = [v105 debugDescription];
      }
      else
      {
        v107 = [(EMMessageListItemChange *)self toList];
        objc_opt_class();
        char v108 = objc_opt_isKindOfClass();

        if (v108)
        {
          v109 = (void *)MEMORY[0x1E4F60E00];
          v105 = [(EMMessageListItemChange *)self toList];
          [v109 partiallyRedactedStringForString:v105];
        }
        else
        {
          v105 = [(EMMessageListItemChange *)self toList];
          [v105 description];
        uint64_t v106 = };
      }
      v110 = (void *)v106;

      v111 = (void *)[[NSString alloc] initWithFormat:@"toList: %@", v110];
      [v7 addObject:v111];
    }
    else
    {
      [v7 addObject:@"toList"];
    }
  }
  v112 = [(EMMessageListItemChange *)self ccList];

  if (v112)
  {
    if (v5)
    {
      if (v4)
      {
        v113 = [(EMMessageListItemChange *)self ccList];
        uint64_t v114 = [v113 debugDescription];
      }
      else
      {
        v115 = [(EMMessageListItemChange *)self ccList];
        objc_opt_class();
        char v116 = objc_opt_isKindOfClass();

        if (v116)
        {
          v117 = (void *)MEMORY[0x1E4F60E00];
          v113 = [(EMMessageListItemChange *)self ccList];
          [v117 partiallyRedactedStringForString:v113];
        }
        else
        {
          v113 = [(EMMessageListItemChange *)self ccList];
          [v113 description];
        uint64_t v114 = };
      }
      v118 = (void *)v114;

      v119 = (void *)[[NSString alloc] initWithFormat:@"ccList: %@", v118];
      [v7 addObject:v119];
    }
    else
    {
      [v7 addObject:@"ccList"];
    }
  }
  v120 = [(EMMessageListItemChange *)self flags];

  if (v120)
  {
    if (v4)
    {
      v121 = [(EMMessageListItemChange *)self flags];
      uint64_t v122 = [v121 debugDescription];
    }
    else
    {
      v123 = [(EMMessageListItemChange *)self flags];
      objc_opt_class();
      char v124 = objc_opt_isKindOfClass();

      if (v124)
      {
        v125 = (void *)MEMORY[0x1E4F60E00];
        v121 = [(EMMessageListItemChange *)self flags];
        [v125 partiallyRedactedStringForString:v121];
      }
      else
      {
        v121 = [(EMMessageListItemChange *)self flags];
        [v121 description];
      uint64_t v122 = };
    }
    v126 = (void *)v122;

    v127 = (void *)[[NSString alloc] initWithFormat:@"flags: %@", v126];
    [v7 addObject:v127];
  }
  v128 = [(EMMessageListItemChange *)self hasUnflagged];

  if (v128)
  {
    if (v4)
    {
      v129 = [(EMMessageListItemChange *)self hasUnflagged];
      uint64_t v130 = [v129 debugDescription];
    }
    else
    {
      v131 = [(EMMessageListItemChange *)self hasUnflagged];
      objc_opt_class();
      char v132 = objc_opt_isKindOfClass();

      if (v132)
      {
        v133 = (void *)MEMORY[0x1E4F60E00];
        v129 = [(EMMessageListItemChange *)self hasUnflagged];
        [v133 partiallyRedactedStringForString:v129];
      }
      else
      {
        v129 = [(EMMessageListItemChange *)self hasUnflagged];
        [v129 description];
      uint64_t v130 = };
    }
    v134 = (void *)v130;

    v135 = (void *)[[NSString alloc] initWithFormat:@"hasUnflagged: %@", v134];
    [v7 addObject:v135];
  }
  v136 = [(EMMessageListItemChange *)self flagColors];

  if (v136)
  {
    if (v4)
    {
      v137 = [(EMMessageListItemChange *)self flagColors];
      uint64_t v138 = [v137 debugDescription];
    }
    else
    {
      v139 = [(EMMessageListItemChange *)self flagColors];
      objc_opt_class();
      char v140 = objc_opt_isKindOfClass();

      if (v140)
      {
        v141 = (void *)MEMORY[0x1E4F60E00];
        v137 = [(EMMessageListItemChange *)self flagColors];
        [v141 partiallyRedactedStringForString:v137];
      }
      else
      {
        v137 = [(EMMessageListItemChange *)self flagColors];
        [v137 description];
      uint64_t v138 = };
    }
    v142 = (void *)v138;

    v143 = (void *)[[NSString alloc] initWithFormat:@"flagColors: %@", v142];
    [v7 addObject:v143];
  }
  v144 = [(EMMessageListItemChange *)self isVIP];

  if (v144)
  {
    if (v4)
    {
      v145 = [(EMMessageListItemChange *)self isVIP];
      uint64_t v146 = [v145 debugDescription];
    }
    else
    {
      v147 = [(EMMessageListItemChange *)self isVIP];
      objc_opt_class();
      char v148 = objc_opt_isKindOfClass();

      if (v148)
      {
        v149 = (void *)MEMORY[0x1E4F60E00];
        v145 = [(EMMessageListItemChange *)self isVIP];
        [v149 partiallyRedactedStringForString:v145];
      }
      else
      {
        v145 = [(EMMessageListItemChange *)self isVIP];
        [v145 description];
      uint64_t v146 = };
    }
    v150 = (void *)v146;

    v151 = (void *)[[NSString alloc] initWithFormat:@"isVIP: %@", v150];
    [v7 addObject:v151];
  }
  v152 = [(EMMessageListItemChange *)self isBlocked];

  if (v152)
  {
    if (v4)
    {
      v153 = [(EMMessageListItemChange *)self isBlocked];
      uint64_t v154 = [v153 debugDescription];
    }
    else
    {
      v155 = [(EMMessageListItemChange *)self isBlocked];
      objc_opt_class();
      char v156 = objc_opt_isKindOfClass();

      if (v156)
      {
        v157 = (void *)MEMORY[0x1E4F60E00];
        v153 = [(EMMessageListItemChange *)self isBlocked];
        [v157 partiallyRedactedStringForString:v153];
      }
      else
      {
        v153 = [(EMMessageListItemChange *)self isBlocked];
        [v153 description];
      uint64_t v154 = };
    }
    v158 = (void *)v154;

    v159 = (void *)[[NSString alloc] initWithFormat:@"isBlocked: %@", v158];
    [v7 addObject:v159];
  }
  v160 = [(EMMessageListItemChange *)self unsubscribeType];

  if (v160)
  {
    if (v4)
    {
      v161 = [(EMMessageListItemChange *)self unsubscribeType];
      uint64_t v162 = [v161 debugDescription];
    }
    else
    {
      v163 = [(EMMessageListItemChange *)self unsubscribeType];
      objc_opt_class();
      char v164 = objc_opt_isKindOfClass();

      if (v164)
      {
        v165 = (void *)MEMORY[0x1E4F60E00];
        v161 = [(EMMessageListItemChange *)self unsubscribeType];
        [v165 partiallyRedactedStringForString:v161];
      }
      else
      {
        v161 = [(EMMessageListItemChange *)self unsubscribeType];
        [v161 description];
      uint64_t v162 = };
    }
    v166 = (void *)v162;

    v167 = (void *)[[NSString alloc] initWithFormat:@"unsubscribeType: %@", v166];
    [v7 addObject:v167];
  }
  v168 = [(EMMessageListItemChange *)self hasAttachments];

  if (v168)
  {
    if (v4)
    {
      v169 = [(EMMessageListItemChange *)self hasAttachments];
      uint64_t v170 = [v169 debugDescription];
    }
    else
    {
      v171 = [(EMMessageListItemChange *)self hasAttachments];
      objc_opt_class();
      char v172 = objc_opt_isKindOfClass();

      if (v172)
      {
        v173 = (void *)MEMORY[0x1E4F60E00];
        v169 = [(EMMessageListItemChange *)self hasAttachments];
        [v173 partiallyRedactedStringForString:v169];
      }
      else
      {
        v169 = [(EMMessageListItemChange *)self hasAttachments];
        [v169 description];
      uint64_t v170 = };
    }
    v174 = (void *)v170;

    v175 = (void *)[[NSString alloc] initWithFormat:@"hasAttachments: %@", v174];
    [v7 addObject:v175];
  }
  v176 = [(EMMessageListItemChange *)self conversationNotificationLevel];

  if (v176)
  {
    if (v4)
    {
      v177 = [(EMMessageListItemChange *)self conversationNotificationLevel];
      uint64_t v178 = [v177 debugDescription];
    }
    else
    {
      v179 = [(EMMessageListItemChange *)self conversationNotificationLevel];
      objc_opt_class();
      char v180 = objc_opt_isKindOfClass();

      if (v180)
      {
        v181 = (void *)MEMORY[0x1E4F60E00];
        v177 = [(EMMessageListItemChange *)self conversationNotificationLevel];
        [v181 partiallyRedactedStringForString:v177];
      }
      else
      {
        v177 = [(EMMessageListItemChange *)self conversationNotificationLevel];
        [v177 description];
      uint64_t v178 = };
    }
    v182 = (void *)v178;

    v183 = (void *)[[NSString alloc] initWithFormat:@"conversationNotificationLevel: %@", v182];
    [v7 addObject:v183];
  }
  v184 = [(EMMessageListItemChange *)self count];

  if (v184)
  {
    if (v4)
    {
      v185 = [(EMMessageListItemChange *)self count];
      uint64_t v186 = [v185 debugDescription];
    }
    else
    {
      v187 = [(EMMessageListItemChange *)self count];
      objc_opt_class();
      char v188 = objc_opt_isKindOfClass();

      if (v188)
      {
        v189 = (void *)MEMORY[0x1E4F60E00];
        v185 = [(EMMessageListItemChange *)self count];
        [v189 partiallyRedactedStringForString:v185];
      }
      else
      {
        v185 = [(EMMessageListItemChange *)self count];
        [v185 description];
      uint64_t v186 = };
    }
    v190 = (void *)v186;

    v191 = (void *)[[NSString alloc] initWithFormat:@"count: %@", v190];
    [v7 addObject:v191];
  }
  v192 = [(EMMessageListItemChange *)self mailboxObjectIDs];

  if (v192)
  {
    if (v4)
    {
      v193 = [(EMMessageListItemChange *)self mailboxObjectIDs];
      uint64_t v194 = [v193 debugDescription];
    }
    else
    {
      v195 = [(EMMessageListItemChange *)self mailboxObjectIDs];
      objc_opt_class();
      char v196 = objc_opt_isKindOfClass();

      if (v196)
      {
        v197 = (void *)MEMORY[0x1E4F60E00];
        v193 = [(EMMessageListItemChange *)self mailboxObjectIDs];
        [v197 partiallyRedactedStringForString:v193];
      }
      else
      {
        v193 = [(EMMessageListItemChange *)self mailboxObjectIDs];
        [v193 description];
      uint64_t v194 = };
    }
    v198 = (void *)v194;

    v199 = (void *)[[NSString alloc] initWithFormat:@"mailboxObjectIDs: %@", v198];
    [v7 addObject:v199];
  }
  v200 = [(EMMessageListItemChange *)self mailboxes];

  if (v200)
  {
    if (v5)
    {
      if (v4)
      {
        v201 = [(EMMessageListItemChange *)self mailboxes];
        uint64_t v202 = [v201 debugDescription];
      }
      else
      {
        v203 = [(EMMessageListItemChange *)self mailboxes];
        objc_opt_class();
        char v204 = objc_opt_isKindOfClass();

        if (v204)
        {
          v205 = (void *)MEMORY[0x1E4F60E00];
          v201 = [(EMMessageListItemChange *)self mailboxes];
          [v205 partiallyRedactedStringForString:v201];
        }
        else
        {
          v201 = [(EMMessageListItemChange *)self mailboxes];
          [v201 description];
        uint64_t v202 = };
      }
      v206 = (void *)v202;

      v207 = (void *)[[NSString alloc] initWithFormat:@"mailboxes: %@", v206];
      [v7 addObject:v207];
    }
    else
    {
      [v7 addObject:@"mailboxes"];
    }
  }
  v208 = [(EMMessageListItemChange *)self displayMessageItemID];

  if (v208)
  {
    if (v4)
    {
      v209 = [(EMMessageListItemChange *)self displayMessageItemID];
      uint64_t v210 = [v209 debugDescription];
    }
    else
    {
      v211 = [(EMMessageListItemChange *)self displayMessageItemID];
      objc_opt_class();
      char v212 = objc_opt_isKindOfClass();

      if (v212)
      {
        v213 = (void *)MEMORY[0x1E4F60E00];
        v209 = [(EMMessageListItemChange *)self displayMessageItemID];
        [v213 partiallyRedactedStringForString:v209];
      }
      else
      {
        v209 = [(EMMessageListItemChange *)self displayMessageItemID];
        [v209 description];
      uint64_t v210 = };
    }
    v214 = (void *)v210;

    v215 = (void *)[[NSString alloc] initWithFormat:@"displayMessageItemID: %@", v214];
    [v7 addObject:v215];
  }
  v216 = [(EMMessageListItemChange *)self groupedSenderMessageListItems];

  if (v216)
  {
    if (v5)
    {
      if (v4)
      {
        v217 = [(EMMessageListItemChange *)self groupedSenderMessageListItems];
        uint64_t v218 = [v217 debugDescription];
      }
      else
      {
        v219 = [(EMMessageListItemChange *)self groupedSenderMessageListItems];
        objc_opt_class();
        char v220 = objc_opt_isKindOfClass();

        if (v220)
        {
          v221 = (void *)MEMORY[0x1E4F60E00];
          v217 = [(EMMessageListItemChange *)self groupedSenderMessageListItems];
          [v221 partiallyRedactedStringForString:v217];
        }
        else
        {
          v217 = [(EMMessageListItemChange *)self groupedSenderMessageListItems];
          [v217 description];
        uint64_t v218 = };
      }
      v222 = (void *)v218;

      v223 = (void *)[[NSString alloc] initWithFormat:@"groupedSenderMessageListItems: %@", v222];
      [v7 addObject:v223];
    }
    else
    {
      [v7 addObject:@"groupedSenderMessageListItems"];
    }
  }
  id v224 = v7;

  return v224;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (EMMessageListItemChange *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else if ([(EMMessageListItemChange *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = v4;
    v6 = [(EMMessageListItemChange *)self date];
    id v7 = [(EMMessageListItemChange *)v5 date];
    if (EFObjectsAreEqual())
    {
      v8 = [(EMMessageListItemChange *)self readLater];
      v9 = [(EMMessageListItemChange *)v5 readLater];
      if (EFObjectsAreEqual())
      {
        uint64_t v10 = [(EMMessageListItemChange *)self sendLaterDate];
        v11 = [(EMMessageListItemChange *)v5 sendLaterDate];
        if (EFObjectsAreEqual())
        {
          v59 = [(EMMessageListItemChange *)self followUp];
          v12 = [(EMMessageListItemChange *)v5 followUp];
          if (EFObjectsAreEqual())
          {
            uint64_t v58 = [(EMMessageListItemChange *)self subject];
            v57 = [(EMMessageListItemChange *)v5 subject];
            if (EFObjectsAreEqual())
            {
              v56 = [(EMMessageListItemChange *)self summary];
              v55 = [(EMMessageListItemChange *)v5 summary];
              if (EFObjectsAreEqual())
              {
                v54 = [(EMMessageListItemChange *)self generatedSummary];
                v53 = [(EMMessageListItemChange *)v5 generatedSummary];
                if (EFObjectsAreEqual())
                {
                  char v52 = [(EMMessageListItemChange *)self senderList];
                  v51 = [(EMMessageListItemChange *)v5 senderList];
                  if (EFArraysAreEqual())
                  {
                    uint64_t v50 = [(EMMessageListItemChange *)self toList];
                    v49 = [(EMMessageListItemChange *)v5 toList];
                    if (EFArraysAreEqual())
                    {
                      v48 = [(EMMessageListItemChange *)self ccList];
                      v47 = [(EMMessageListItemChange *)v5 ccList];
                      if (EFArraysAreEqual())
                      {
                        v46 = [(EMMessageListItemChange *)self flags];
                        v45 = [(EMMessageListItemChange *)v5 flags];
                        if (EFObjectsAreEqual())
                        {
                          char v44 = [(EMMessageListItemChange *)self hasUnflagged];
                          v43 = [(EMMessageListItemChange *)v5 hasUnflagged];
                          if (EFObjectsAreEqual())
                          {
                            uint64_t v42 = [(EMMessageListItemChange *)self flagColors];
                            v41 = [(EMMessageListItemChange *)v5 flagColors];
                            if (EFObjectsAreEqual())
                            {
                              v40 = [(EMMessageListItemChange *)self isVIP];
                              v39 = [(EMMessageListItemChange *)v5 isVIP];
                              if (EFObjectsAreEqual())
                              {
                                v38 = [(EMMessageListItemChange *)self isBlocked];
                                v37 = [(EMMessageListItemChange *)v5 isBlocked];
                                if (EFObjectsAreEqual())
                                {
                                  char v36 = [(EMMessageListItemChange *)self unsubscribeType];
                                  v35 = [(EMMessageListItemChange *)v5 unsubscribeType];
                                  if (EFObjectsAreEqual())
                                  {
                                    uint64_t v34 = [(EMMessageListItemChange *)self hasAttachments];
                                    v33 = [(EMMessageListItemChange *)v5 hasAttachments];
                                    if (EFObjectsAreEqual())
                                    {
                                      v32 = [(EMMessageListItemChange *)self conversationNotificationLevel];
                                      v31 = [(EMMessageListItemChange *)v5 conversationNotificationLevel];
                                      if (EFObjectsAreEqual())
                                      {
                                        v30 = [(EMMessageListItemChange *)self count];
                                        v29 = [(EMMessageListItemChange *)v5 count];
                                        if (EFObjectsAreEqual())
                                        {
                                          char v28 = [(EMMessageListItemChange *)self conversationID];
                                          v27 = [(EMMessageListItemChange *)v5 conversationID];
                                          if (EFObjectsAreEqual())
                                          {
                                            uint64_t v26 = [(EMMessageListItemChange *)self mailboxObjectIDs];
                                            v25 = [(EMMessageListItemChange *)v5 mailboxObjectIDs];
                                            if (EFArraysAreEqual())
                                            {
                                              v24 = [(EMMessageListItemChange *)self mailboxes];
                                              v23 = [(EMMessageListItemChange *)v5 mailboxes];
                                              if (EFArraysAreEqual())
                                              {
                                                v22 = [(EMMessageListItemChange *)self displayMessageItemID];
                                                v21 = [(EMMessageListItemChange *)v5 displayMessageItemID];
                                                if (EFObjectsAreEqual())
                                                {
                                                  char v20 = [(EMMessageListItemChange *)self businessID];
                                                  v19 = [(EMMessageListItemChange *)v5 businessID];
                                                  if (EFObjectsAreEqual())
                                                  {
                                                    uint64_t v18 = [(EMMessageListItemChange *)self businessLogoID];
                                                    v17 = [(EMMessageListItemChange *)v5 businessLogoID];
                                                    if (EFObjectsAreEqual())
                                                    {
                                                      v16 = [(EMMessageListItemChange *)self groupedSenderMessageListItems];
                                                      v15 = [(EMMessageListItemChange *)v5 groupedSenderMessageListItems];
                                                      char v13 = _groupedSenderMessageListItemsPropertiesAreEqual(v16, v15);
                                                    }
                                                    else
                                                    {
                                                      char v13 = 0;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    char v13 = 0;
                                                  }
                                                }
                                                else
                                                {
                                                  char v13 = 0;
                                                }
                                              }
                                              else
                                              {
                                                char v13 = 0;
                                              }
                                            }
                                            else
                                            {
                                              char v13 = 0;
                                            }
                                          }
                                          else
                                          {
                                            char v13 = 0;
                                          }
                                        }
                                        else
                                        {
                                          char v13 = 0;
                                        }
                                      }
                                      else
                                      {
                                        char v13 = 0;
                                      }
                                    }
                                    else
                                    {
                                      char v13 = 0;
                                    }
                                  }
                                  else
                                  {
                                    char v13 = 0;
                                  }
                                }
                                else
                                {
                                  char v13 = 0;
                                }
                              }
                              else
                              {
                                char v13 = 0;
                              }
                            }
                            else
                            {
                              char v13 = 0;
                            }
                          }
                          else
                          {
                            char v13 = 0;
                          }
                        }
                        else
                        {
                          char v13 = 0;
                        }
                      }
                      else
                      {
                        char v13 = 0;
                      }
                    }
                    else
                    {
                      char v13 = 0;
                    }
                  }
                  else
                  {
                    char v13 = 0;
                  }
                }
                else
                {
                  char v13 = 0;
                }
              }
              else
              {
                char v13 = 0;
              }
            }
            else
            {
              char v13 = 0;
            }
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(EMMessageListItemChange *)self date];
  uint64_t v4 = [v3 hash];

  BOOL v5 = [(EMMessageListItemChange *)self readLater];
  uint64_t v6 = [v5 hash];

  id v7 = [(EMMessageListItemChange *)self sendLaterDate];
  uint64_t v8 = [v7 hash];

  v9 = [(EMMessageListItemChange *)self followUp];
  uint64_t v10 = [v9 hash];

  v11 = [(EMMessageListItemChange *)self subject];
  uint64_t v12 = [v11 hash];

  char v13 = [(EMMessageListItemChange *)self summary];
  uint64_t v14 = [v13 hash];

  v15 = [(EMMessageListItemChange *)self generatedSummary];
  uint64_t v16 = [v15 hash];

  v17 = [(EMMessageListItemChange *)self senderList];
  uint64_t v18 = [v17 hash];

  v19 = [(EMMessageListItemChange *)self toList];
  uint64_t v56 = [v19 hash];

  char v20 = [(EMMessageListItemChange *)self ccList];
  uint64_t v55 = [v20 hash];

  v21 = [(EMMessageListItemChange *)self flags];
  uint64_t v54 = [v21 hash];

  v22 = [(EMMessageListItemChange *)self hasUnflagged];
  uint64_t v53 = [v22 hash];

  v23 = [(EMMessageListItemChange *)self flagColors];
  uint64_t v52 = [v23 hash];

  v24 = [(EMMessageListItemChange *)self isVIP];
  uint64_t v51 = [v24 hash];

  v25 = [(EMMessageListItemChange *)self isBlocked];
  uint64_t v50 = [v25 hash];

  uint64_t v26 = [(EMMessageListItemChange *)self unsubscribeType];
  uint64_t v49 = [v26 hash];

  v27 = [(EMMessageListItemChange *)self hasAttachments];
  uint64_t v48 = [v27 hash];

  char v28 = [(EMMessageListItemChange *)self conversationNotificationLevel];
  uint64_t v47 = [v28 hash];

  v29 = [(EMMessageListItemChange *)self count];
  uint64_t v46 = [v29 hash];

  v30 = [(EMMessageListItemChange *)self conversationID];
  uint64_t v45 = [v30 hash];

  v31 = [(EMMessageListItemChange *)self mailboxObjectIDs];
  uint64_t v44 = [v31 hash];

  v32 = [(EMMessageListItemChange *)self mailboxes];
  uint64_t v43 = [v32 hash];

  v33 = [(EMMessageListItemChange *)self displayMessageItemID];
  uint64_t v42 = [v33 hash];
  uint64_t v41 = v18;

  uint64_t v34 = [(EMMessageListItemChange *)self businessID];
  uint64_t v40 = [v34 hash];

  v35 = [(EMMessageListItemChange *)self businessLogoID];
  uint64_t v36 = [v35 hash];

  v37 = [(EMMessageListItemChange *)self groupedSenderMessageListItems];
  unint64_t v38 = 33
      * (33
       * (33
        * (33
         * (33
          * (33
           * (33
            * (33
             * (33
              * (33
               * (33
                * (33
                 * (33
                  * (33
                   * (33
                    * (33
                     * (33
                      * (33
                       * (33 * (33 * (33 * (33 * (33 * (33 * (33 * v4 + v6) + v8) + v10) + v12) + v14) + v16) + v41)
                       + v56)
                      + v55)
                     + v54)
                    + v53)
                   + v52)
                  + v51)
                 + v50)
                + v49)
               + v48)
              + v47)
             + v46)
            + v45)
           + v44)
          + v43)
         + v42)
        + v40)
       + v36)
      + [v37 hash]
      - 0x56536DE4EC86E8BFLL;

  return v38;
}

- (NSArray)mailboxObjectIDs
{
  return self->_mailboxObjectIDs;
}

- (void)setMailboxObjectIDs:(id)a3
{
  id v7 = a3;
  if ((EFArraysAreEqual() & 1) == 0)
  {
    mailboxes = self->_mailboxes;
    self->_mailboxes = 0;

    BOOL v5 = (NSArray *)[v7 copy];
    mailboxObjectIDs = self->_mailboxObjectIDs;
    self->_mailboxObjectIDs = v5;
  }
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (NSArray *)[v8 copy];
  mailboxes = self->_mailboxes;
  self->_mailboxes = v4;

  objc_msgSend(v8, "ef_mapSelector:", sel_objectID);
  uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mailboxObjectIDs = self->_mailboxObjectIDs;
  self->_mailboxObjectIDs = v6;
}

+ (id)changeFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(EMMessageListItemChange);
  v9 = [a1 changeFrom:v6 to:v7 with:v8 hasChanges:0];

  return v9;
}

+ (id)changeFrom:(id)a3 to:(id)a4 with:(id)a5 hasChanges:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v99 = [v10 date];
  uint64_t v12 = [v9 date];
  char v13 = EFObjectsAreEqual();

  if ((v13 & 1) == 0)
  {
    [v11 setDate:v99];
    BOOL v6 = 1;
  }
  uint64_t v98 = [v10 displayDate];
  uint64_t v14 = [v9 displayDate];
  char v15 = EFObjectsAreEqual();

  if ((v15 & 1) == 0)
  {
    [v11 setDisplayDate:v98];
    BOOL v6 = 1;
  }
  v97 = [v10 sendLaterDate];
  uint64_t v16 = [v9 sendLaterDate];
  char v17 = EFObjectsAreEqual();

  if ((v17 & 1) == 0)
  {
    uint64_t v18 = v97;
    if (!v97)
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
    }
    [v11 setSendLaterDate:v18];
    if (!v97) {

    }
    BOOL v6 = 1;
  }
  v96 = [v10 readLater];
  v19 = [v9 readLater];
  char v20 = EFObjectsAreEqual();

  if ((v20 & 1) == 0)
  {
    v21 = v96;
    if (!v96)
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
    }
    [v11 setReadLater:v21];
    if (!v96) {

    }
    BOOL v6 = 1;
  }
  v95 = [v10 followUp];
  v22 = [v9 followUp];
  char v23 = EFObjectsAreEqual();

  if ((v23 & 1) == 0)
  {
    v24 = v95;
    if (!v95)
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
    }
    [v11 setFollowUp:v24];
    if (!v95) {

    }
    BOOL v6 = 1;
  }
  v94 = [v10 category];
  v25 = [v9 category];
  char v26 = EFObjectsAreEqual();

  if ((v26 & 1) == 0)
  {
    v27 = v94;
    if (!v94)
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
    }
    [v11 setCategory:v27];
    if (!v94) {

    }
    BOOL v6 = 1;
  }
  v93 = [v10 groupedSenderMessageListItems];
  char v28 = [v9 groupedSenderMessageListItems];
  char v29 = _groupedSenderMessageListItemsPropertiesAreEqual(v93, v28);

  if ((v29 & 1) == 0)
  {
    v30 = v93;
    if (!v93)
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
    }
    [v11 setGroupedSenderMessageListItems:v30];
    if (!v93) {

    }
    BOOL v6 = 1;
  }
  uint64_t v31 = [v10 businessID];
  if (v31 != [v9 businessID])
  {
    v32 = [NSNumber numberWithLongLong:v31];
    [v11 setBusinessID:v32];

    BOOL v6 = 1;
  }
  char v92 = [v10 businessLogoID];
  v33 = [v9 businessLogoID];
  char v34 = EFObjectsAreEqual();

  if ((v34 & 1) == 0)
  {
    v35 = v92;
    if (!v92)
    {
      v35 = [MEMORY[0x1E4F1CA98] null];
    }
    [v11 setBusinessLogoID:v35];
    if (!v92) {

    }
    BOOL v6 = 1;
  }
  v91 = [v10 subject];
  uint64_t v36 = [v9 subject];
  char v37 = EFObjectsAreEqual();

  if ((v37 & 1) == 0)
  {
    unint64_t v38 = v91;
    if (!v91)
    {
      unint64_t v38 = [MEMORY[0x1E4F1CA98] null];
    }
    [v11 setSubject:v38];
    if (!v91) {

    }
    BOOL v6 = 1;
  }
  char v100 = [v10 summary];
  v39 = [v9 summary];
  char v40 = EFObjectsAreEqual();

  if ((v40 & 1) == 0)
  {
    uint64_t v41 = v100;
    if (!v100)
    {
      uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
    }
    [v11 setSummary:v41];
    if (!v100) {

    }
    BOOL v6 = 1;
  }
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    uint64_t v42 = [v10 generatedSummary];
    uint64_t v43 = [v9 generatedSummary];
    char v44 = EFObjectsAreEqual();

    if ((v44 & 1) == 0)
    {
      uint64_t v45 = v42;
      if (!v42)
      {
        uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
      }
      [v11 setGeneratedSummary:v45];
      if (!v42) {

      }
      BOOL v6 = 1;
    }
  }
  uint64_t v90 = [v10 senderList];
  uint64_t v46 = [v9 senderList];
  char v47 = EFArraysAreEqual();

  if ((v47 & 1) == 0)
  {
    [v11 setSenderList:v90];
    BOOL v6 = 1;
  }
  v89 = [v10 toList];
  uint64_t v48 = [v9 toList];
  char v49 = EFArraysAreEqual();

  if ((v49 & 1) == 0)
  {
    [v11 setToList:v89];
    BOOL v6 = 1;
  }
  v88 = [v10 ccList];
  uint64_t v50 = [v9 ccList];
  char v51 = EFArraysAreEqual();

  if ((v51 & 1) == 0)
  {
    [v11 setCcList:v88];
    BOOL v6 = 1;
  }
  v87 = [v10 flags];
  uint64_t v52 = [v9 flags];
  char v53 = EFObjectsAreEqual();

  if ((v53 & 1) == 0)
  {
    [v11 setFlags:v87];
    BOOL v6 = 1;
  }
  uint64_t v54 = [v10 hasUnflagged];
  if (v54 != [v9 hasUnflagged])
  {
    uint64_t v55 = [NSNumber numberWithBool:v54];
    [v11 setHasUnflagged:v55];

    BOOL v6 = 1;
  }
  uint64_t v56 = [v10 flagColors];
  v57 = [v9 flagColors];
  char v58 = EFObjectsAreEqual();

  if ((v58 & 1) == 0)
  {
    v59 = v56;
    if (!v56)
    {
      v59 = [MEMORY[0x1E4F1CA98] null];
    }
    [v11 setFlagColors:v59];
    if (!v56) {

    }
    BOOL v6 = 1;
  }
  uint64_t v60 = [v10 isVIP];
  if (v60 != [v9 isVIP])
  {
    v61 = [NSNumber numberWithBool:v60];
    [v11 setIsVIP:v61];

    BOOL v6 = 1;
  }
  uint64_t v62 = [v10 isBlocked];
  if (v62 != [v9 isBlocked])
  {
    v63 = [NSNumber numberWithBool:v62];
    [v11 setIsBlocked:v63];

    BOOL v6 = 1;
  }
  uint64_t v64 = [v10 unsubscribeType];
  if (v64 != [v9 unsubscribeType])
  {
    v65 = [NSNumber numberWithInteger:v64];
    [v11 setUnsubscribeType:v65];

    BOOL v6 = 1;
  }
  uint64_t v66 = [v10 hasAttachments];
  if (v66 != [v9 hasAttachments])
  {
    v67 = [NSNumber numberWithBool:v66];
    [v11 setHasAttachments:v67];

    BOOL v6 = 1;
  }
  uint64_t v68 = [v10 isAuthenticated];
  if (v68 != [v9 isAuthenticated])
  {
    v69 = [NSNumber numberWithBool:v68];
    [v11 setIsAuthenticated:v69];

    BOOL v6 = 1;
  }
  uint64_t v70 = [v10 allowAuthenticationWarning];
  if (v70 != [v9 allowAuthenticationWarning])
  {
    v71 = [NSNumber numberWithBool:v70];
    [v11 setAllowAuthenticationWarning:v71];

    BOOL v6 = 1;
  }
  uint64_t v72 = [v10 conversationNotificationLevel];
  if (v72 != [v9 conversationNotificationLevel])
  {
    v73 = [NSNumber numberWithInteger:v72];
    [v11 setConversationNotificationLevel:v73];

    BOOL v6 = 1;
  }
  uint64_t v74 = [v10 count];
  if (v74 != [v9 count])
  {
    v75 = [NSNumber numberWithUnsignedInteger:v74];
    [v11 setCount:v75];

    BOOL v6 = 1;
  }
  char v76 = [v10 mailboxObjectIDs];
  v77 = [v9 mailboxObjectIDs];
  if ((EFArraysAreEqual() & 1) == 0)
  {
    v78 = [v10 mailboxes];
    v79 = [v9 mailboxes];
    uint64_t v80 = [v78 count];
    if (v80 == [v76 count]
      && (uint64_t v81 = [v79 count], v81 == objc_msgSend(v77, "count"))
      && (EFArraysAreEqual() & 1) == 0)
    {
      [v11 setMailboxes:v78];
    }
    else
    {
      [v11 setMailboxObjectIDs:v76];
    }

    BOOL v6 = 1;
  }
  uint64_t v82 = [v10 displayMessageItemID];
  v83 = [v9 displayMessageItemID];
  char v84 = EFObjectsAreEqual();

  if (v84)
  {
    if (!v6)
    {
      id v85 = 0;
      goto LABEL_107;
    }
  }
  else
  {
    [v11 setDisplayMessageItemID:v82];
  }
  id v85 = v11;
LABEL_107:

  return v85;
}

+ (id)changeForKeyPaths:(id)a3 ofItem:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22 = v6;
  if ([v6 count])
  {
    v24 = objc_alloc_init(EMMessageListItemChange);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (!v9) {
      goto LABEL_39;
    }
    uint64_t v10 = *(void *)v26;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 isEqualToString:@"readLater.date"])
          {
            char v13 = [v7 readLater];
            id v14 = v13;
            if (!v13)
            {
              a4 = [MEMORY[0x1E4F1CA98] null];
              id v14 = a4;
            }
            [(EMMessageListItemChange *)v24 setReadLater:v14];
            id v15 = a4;
            if (!v13) {
              goto LABEL_18;
            }
          }
          else
          {
            if (([v12 isEqualToString:@"followUp.startDate"] & 1) != 0
              || [v12 isEqualToString:@"followUp.endDate"])
            {
              char v13 = [v7 followUp];
              uint64_t v16 = v13;
              if (!v13)
              {
                uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
                uint64_t v16 = (void *)v4;
              }
              [(EMMessageListItemChange *)v24 setFollowUp:v16];
              id v15 = (id)v4;
              if (v13) {
                goto LABEL_19;
              }
            }
            else if (([v12 isEqualToString:@"category.type"] & 1) != 0 {
                   || [v12 isEqualToString:@"category.isHighImpact"])
            }
            {
              char v13 = [v7 category];
              char v17 = v13;
              if (!v13)
              {
                uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
                char v17 = (void *)v23;
              }
              [(EMMessageListItemChange *)v24 setCategory:v17];
              id v15 = (id)v23;
              if (v13) {
                goto LABEL_19;
              }
            }
            else
            {
              if ([v12 isEqualToString:@"AuthenticationState"])
              {
                char v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isAuthenticated"));
                [(EMMessageListItemChange *)v24 setIsAuthenticated:v13];
                goto LABEL_19;
              }
              if ([v12 isEqualToString:@"businessID"])
              {
                char v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "businessID"));
                [(EMMessageListItemChange *)v24 setBusinessID:v13];
                goto LABEL_19;
              }
              if (![v12 isEqualToString:@"businessLogoID"])
              {
                char v13 = [v7 valueForKeyPath:v12];
                [(EMMessageListItemChange *)v24 setValue:v13 forKeyPath:v12];
                goto LABEL_19;
              }
              char v13 = [v7 businessLogoID];
              uint64_t v18 = v13;
              if (!v13)
              {
                uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
                uint64_t v18 = (void *)v21;
              }
              -[EMMessageListItemChange setBusinessLogoID:](v24, "setBusinessLogoID:", v18, v21);
              id v15 = (id)v21;
              if (v13) {
                goto LABEL_19;
              }
            }
LABEL_18:
          }
LABEL_19:
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v19 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v9 = v19;
      if (!v19)
      {
LABEL_39:

        goto LABEL_41;
      }
    }
  }
  v24 = 0;
LABEL_41:

  return v24;
}

+ (id)changesForKeyPaths:(id)a3 ofItems:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        char v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = objc_msgSend(a1, "changeForKeyPaths:ofItem:", v6, v13, (void)v17);
        if (v13)
        {
          id v15 = [v13 objectID];
          [v8 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v8;
}

+ (id)changeForFlags:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(EMMessageListItemChange);
  [(EMMessageListItemChange *)v4 setFlags:v3];
  BOOL v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "flagged") ^ 1);
  [(EMMessageListItemChange *)v4 setHasUnflagged:v5];

  if ([v3 flagged])
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v3, "flagColor"));
    [(EMMessageListItemChange *)v4 setFlagColors:v6];
  }
  return v4;
}

+ (id)changeForUnsubscribeType:(int64_t)a3
{
  uint64_t v4 = objc_alloc_init(EMMessageListItemChange);
  BOOL v5 = [NSNumber numberWithInteger:a3];
  [(EMMessageListItemChange *)v4 setUnsubscribeType:v5];

  return v4;
}

- (void)addChange:(id)a3
{
  id v58 = a3;
  uint64_t v4 = [v58 date];

  if (v4)
  {
    BOOL v5 = [v58 date];
    [(EMMessageListItemChange *)self setDate:v5];
  }
  id v6 = [v58 displayDate];

  if (v6)
  {
    id v7 = [v58 displayDate];
    [(EMMessageListItemChange *)self setDisplayDate:v7];
  }
  id v8 = [v58 readLater];

  if (v8)
  {
    id v9 = [v58 readLater];
    [(EMMessageListItemChange *)self setReadLater:v9];
  }
  uint64_t v10 = [v58 sendLaterDate];

  if (v10)
  {
    uint64_t v11 = [v58 sendLaterDate];
    [(EMMessageListItemChange *)self setSendLaterDate:v11];
  }
  uint64_t v12 = [v58 followUp];

  if (v12)
  {
    char v13 = [v58 followUp];
    [(EMMessageListItemChange *)self setFollowUp:v13];
  }
  id v14 = [v58 subject];

  if (v14)
  {
    id v15 = [v58 subject];
    [(EMMessageListItemChange *)self setSubject:v15];
  }
  uint64_t v16 = [v58 summary];

  if (v16)
  {
    long long v17 = [v58 summary];
    [(EMMessageListItemChange *)self setSummary:v17];
  }
  long long v18 = [v58 generatedSummary];

  if (v18)
  {
    long long v19 = [v58 generatedSummary];
    [(EMMessageListItemChange *)self setGeneratedSummary:v19];
  }
  long long v20 = [v58 senderList];

  if (v20)
  {
    uint64_t v21 = [v58 senderList];
    [(EMMessageListItemChange *)self setSenderList:v21];
  }
  uint64_t v22 = [v58 toList];

  if (v22)
  {
    uint64_t v23 = [v58 toList];
    [(EMMessageListItemChange *)self setToList:v23];
  }
  v24 = [v58 ccList];

  if (v24)
  {
    long long v25 = [v58 ccList];
    [(EMMessageListItemChange *)self setCcList:v25];
  }
  long long v26 = [v58 flags];

  if (v26)
  {
    long long v27 = [v58 flags];
    [(EMMessageListItemChange *)self setFlags:v27];
  }
  long long v28 = [v58 hasUnflagged];

  if (v28)
  {
    char v29 = [v58 hasUnflagged];
    [(EMMessageListItemChange *)self setHasUnflagged:v29];
  }
  uint64_t v30 = [v58 flagColors];

  if (v30)
  {
    uint64_t v31 = [v58 flagColors];
    [(EMMessageListItemChange *)self setFlagColors:v31];
  }
  v32 = [v58 isVIP];

  if (v32)
  {
    v33 = [v58 isVIP];
    [(EMMessageListItemChange *)self setIsVIP:v33];
  }
  char v34 = [v58 isBlocked];

  if (v34)
  {
    v35 = [v58 isBlocked];
    [(EMMessageListItemChange *)self setIsBlocked:v35];
  }
  uint64_t v36 = [v58 unsubscribeType];

  if (v36)
  {
    char v37 = [v58 unsubscribeType];
    [(EMMessageListItemChange *)self setUnsubscribeType:v37];
  }
  unint64_t v38 = [v58 hasAttachments];

  if (v38)
  {
    v39 = [v58 hasAttachments];
    [(EMMessageListItemChange *)self setHasAttachments:v39];
  }
  char v40 = [v58 conversationNotificationLevel];

  if (v40)
  {
    uint64_t v41 = [v58 conversationNotificationLevel];
    [(EMMessageListItemChange *)self setConversationNotificationLevel:v41];
  }
  uint64_t v42 = [v58 count];

  if (v42)
  {
    uint64_t v43 = [v58 count];
    [(EMMessageListItemChange *)self setCount:v43];
  }
  char v44 = [v58 conversationID];

  if (v44)
  {
    uint64_t v45 = [v58 conversationID];
    [(EMMessageListItemChange *)self setConversationID:v45];
  }
  uint64_t v46 = [v58 mailboxObjectIDs];

  if (v46)
  {
    char v47 = [v58 mailboxObjectIDs];
    [(EMMessageListItemChange *)self setMailboxObjectIDs:v47];
  }
  uint64_t v48 = [v58 mailboxes];

  if (v48)
  {
    char v49 = [v58 mailboxes];
    [(EMMessageListItemChange *)self setMailboxes:v49];
  }
  uint64_t v50 = [v58 displayMessageItemID];

  if (v50)
  {
    char v51 = [v58 displayMessageItemID];
    [(EMMessageListItemChange *)self setDisplayMessageItemID:v51];
  }
  uint64_t v52 = [v58 groupedSenderMessageListItems];

  if (v52)
  {
    char v53 = [v58 groupedSenderMessageListItems];
    [(EMMessageListItemChange *)self setGroupedSenderMessageListItems:v53];
  }
  uint64_t v54 = [v58 businessID];

  if (v54)
  {
    uint64_t v55 = [v58 businessID];
    [(EMMessageListItemChange *)self setBusinessID:v55];
  }
  uint64_t v56 = [v58 businessLogoID];

  if (v56)
  {
    v57 = [v58 businessLogoID];
    [(EMMessageListItemChange *)self setBusinessLogoID:v57];
  }
}

- (BOOL)applyToMessageListItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EMMessageListItemChange *)self date];
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = [(EMMessageListItemChange *)self date];
  id v7 = [v4 date];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    uint64_t v10 = [(EMMessageListItemChange *)self date];
    [v4 setDate:v10];

    BOOL v9 = 1;
  }
  else
  {
LABEL_3:
    BOOL v9 = 0;
  }
  uint64_t v11 = [(EMMessageListItemChange *)self displayDate];
  if (v11)
  {
    uint64_t v12 = [(EMMessageListItemChange *)self displayDate];
    char v13 = [v4 displayDate];
    char v14 = [v12 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      id v15 = [(EMMessageListItemChange *)self displayDate];
      [v4 setDisplayDate:v15];

      BOOL v9 = 1;
    }
  }
  uint64_t v16 = [(EMMessageListItemChange *)self readLater];

  if (v16)
  {
    long long v17 = [(EMMessageListItemChange *)self readLater];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = [(EMMessageListItemChange *)self readLater];
    }
    else
    {
      id v18 = 0;
    }

    id v19 = [v4 readLater];
    if (v18 == v19)
    {
    }
    else
    {
      long long v20 = [v4 readLater];
      char v21 = [v18 isEqual:v20];

      if ((v21 & 1) == 0)
      {
        [v4 setReadLater:v18];
        BOOL v9 = 1;
      }
    }
  }
  uint64_t v22 = [(EMMessageListItemChange *)self sendLaterDate];

  if (v22)
  {
    uint64_t v23 = [(EMMessageListItemChange *)self sendLaterDate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = [(EMMessageListItemChange *)self sendLaterDate];
    }
    else
    {
      id v24 = 0;
    }

    id v25 = [v4 sendLaterDate];
    if (v24 == v25)
    {
    }
    else
    {
      long long v26 = [v4 sendLaterDate];
      char v27 = [v24 isEqual:v26];

      if ((v27 & 1) == 0)
      {
        [v4 setSendLaterDate:v24];
        BOOL v9 = 1;
      }
    }
  }
  long long v28 = [(EMMessageListItemChange *)self followUp];

  if (v28)
  {
    char v29 = [(EMMessageListItemChange *)self followUp];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = [(EMMessageListItemChange *)self followUp];
    }
    else
    {
      id v30 = 0;
    }

    id v31 = [v4 followUp];
    if (v30 == v31)
    {
    }
    else
    {
      v32 = [v4 followUp];
      char v33 = [v30 isEqual:v32];

      if ((v33 & 1) == 0)
      {
        [v4 setFollowUp:v30];
        BOOL v9 = 1;
      }
    }
  }
  char v34 = [(EMMessageListItemChange *)self businessID];
  if (v34)
  {
    v35 = [(EMMessageListItemChange *)self businessID];
    uint64_t v36 = [v35 longLongValue];
    uint64_t v37 = [v4 businessID];

    if (v36 != v37)
    {
      unint64_t v38 = [(EMMessageListItemChange *)self businessID];
      objc_msgSend(v4, "setBusinessID:", objc_msgSend(v38, "longLongValue"));

      BOOL v9 = 1;
    }
  }
  v39 = [(EMMessageListItemChange *)self businessLogoID];

  if (v39)
  {
    char v40 = [(EMMessageListItemChange *)self businessLogoID];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v41 = [(EMMessageListItemChange *)self businessLogoID];
    }
    else
    {
      id v41 = 0;
    }

    id v42 = [v4 businessLogoID];
    if (v41 == v42)
    {
    }
    else
    {
      uint64_t v43 = [v4 businessLogoID];
      char v44 = [v41 isEqual:v43];

      if ((v44 & 1) == 0)
      {
        [v4 setBusinessLogoID:v41];
        BOOL v9 = 1;
      }
    }
  }
  uint64_t v45 = [(EMMessageListItemChange *)self category];

  if (v45)
  {
    uint64_t v46 = [(EMMessageListItemChange *)self category];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v47 = [(EMMessageListItemChange *)self category];
    }
    else
    {
      id v47 = 0;
    }

    id v48 = [v4 category];
    if (v47 == v48)
    {
    }
    else
    {
      char v49 = [v4 category];
      char v50 = [v47 isEqual:v49];

      if ((v50 & 1) == 0)
      {
        [v4 setCategory:v47];
        BOOL v9 = 1;
      }
    }
  }
  char v51 = [(EMMessageListItemChange *)self groupedSenderMessageListItems];
  if (v51)
  {
    uint64_t v52 = [v4 groupedSenderMessageListItems];
    char v53 = _groupedSenderMessageListItemsPropertiesAreEqual(v51, v52);

    if ((v53 & 1) == 0)
    {
      [v4 setGroupedSenderMessageListItems:v51];
      BOOL v9 = 1;
    }
  }
  uint64_t v54 = [(EMMessageListItemChange *)self subject];

  if (v54)
  {
    uint64_t v55 = [(EMMessageListItemChange *)self subject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v56 = [(EMMessageListItemChange *)self subject];
    }
    else
    {
      id v56 = 0;
    }

    id v57 = [v4 subject];
    if (v56 == v57)
    {
    }
    else
    {
      id v58 = [v4 subject];
      char v59 = [v56 isEqual:v58];

      if ((v59 & 1) == 0)
      {
        [v4 setSubject:v56];
        BOOL v9 = 1;
      }
    }
  }
  uint64_t v60 = [(EMMessageListItemChange *)self summary];

  if (v60)
  {
    v61 = [(EMMessageListItemChange *)self summary];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v62 = [(EMMessageListItemChange *)self summary];
    }
    else
    {
      id v62 = 0;
    }

    id v63 = [v4 summary];
    if (v62 == v63)
    {
    }
    else
    {
      uint64_t v64 = [v4 summary];
      char v65 = [v62 isEqual:v64];

      if ((v65 & 1) == 0)
      {
        [v4 setSummary:v62];
        BOOL v9 = 1;
      }
    }
  }
  uint64_t v66 = [(EMMessageListItemChange *)self generatedSummary];

  if (v66)
  {
    v67 = [(EMMessageListItemChange *)self generatedSummary];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v68 = [(EMMessageListItemChange *)self generatedSummary];
    }
    else
    {
      id v68 = 0;
    }

    id v69 = [v4 generatedSummary];
    if (v68 == v69)
    {
    }
    else
    {
      uint64_t v70 = [v4 generatedSummary];
      char v71 = [v68 isEqual:v70];

      if ((v71 & 1) == 0)
      {
        [v4 setGeneratedSummary:v68];
        BOOL v9 = 1;
      }
    }
  }
  uint64_t v72 = [(EMMessageListItemChange *)self senderList];
  if (v72)
  {
    v73 = [(EMMessageListItemChange *)self senderList];
    uint64_t v74 = [v4 senderList];
    char v75 = [v73 isEqual:v74];

    if ((v75 & 1) == 0)
    {
      char v76 = [(EMMessageListItemChange *)self senderList];
      [v4 setSenderList:v76];

      BOOL v9 = 1;
    }
  }
  v77 = [(EMMessageListItemChange *)self toList];
  if (v77)
  {
    v78 = [(EMMessageListItemChange *)self toList];
    v79 = [v4 toList];
    char v80 = [v78 isEqual:v79];

    if ((v80 & 1) == 0)
    {
      uint64_t v81 = [(EMMessageListItemChange *)self toList];
      [v4 setToList:v81];

      BOOL v9 = 1;
    }
  }
  uint64_t v82 = [(EMMessageListItemChange *)self ccList];
  if (v82)
  {
    v83 = [(EMMessageListItemChange *)self ccList];
    char v84 = [v4 ccList];
    char v85 = [v83 isEqual:v84];

    if ((v85 & 1) == 0)
    {
      v86 = [(EMMessageListItemChange *)self ccList];
      [v4 setCcList:v86];

      BOOL v9 = 1;
    }
  }
  v87 = [(EMMessageListItemChange *)self flags];
  if (v87)
  {
    v88 = [(EMMessageListItemChange *)self flags];
    v89 = [v4 flags];
    char v90 = [v88 isEqual:v89];

    if ((v90 & 1) == 0)
    {
      v91 = [(EMMessageListItemChange *)self flags];
      [v4 setFlags:v91];

      BOOL v9 = 1;
    }
  }
  char v92 = [(EMMessageListItemChange *)self hasUnflagged];
  if (v92)
  {
    v93 = [(EMMessageListItemChange *)self hasUnflagged];
    int v94 = [v93 BOOLValue];
    int v95 = [v4 hasUnflagged];

    if (v94 != v95)
    {
      v96 = [(EMMessageListItemChange *)self hasUnflagged];
      objc_msgSend(v4, "setHasUnflagged:", objc_msgSend(v96, "BOOLValue"));

      BOOL v9 = 1;
    }
  }
  v97 = [(EMMessageListItemChange *)self flagColors];

  if (v97)
  {
    uint64_t v98 = [(EMMessageListItemChange *)self flagColors];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v99 = [(EMMessageListItemChange *)self flagColors];
    }
    else
    {
      id v99 = 0;
    }

    id v100 = [v4 flagColors];
    if (v99 == v100)
    {
    }
    else
    {
      v101 = [v4 flagColors];
      char v102 = [v99 isEqual:v101];

      if ((v102 & 1) == 0)
      {
        [v4 setFlagColors:v99];
        BOOL v9 = 1;
      }
    }
  }
  v103 = [(EMMessageListItemChange *)self isVIP];
  if (v103)
  {
    v104 = [(EMMessageListItemChange *)self isVIP];
    int v105 = [v104 BOOLValue];
    int v106 = [v4 isVIP];

    if (v105 != v106)
    {
      v107 = [(EMMessageListItemChange *)self isVIP];
      objc_msgSend(v4, "setIsVIP:", objc_msgSend(v107, "BOOLValue"));

      BOOL v9 = 1;
    }
  }
  char v108 = [(EMMessageListItemChange *)self isBlocked];
  if (v108)
  {
    v109 = [(EMMessageListItemChange *)self isBlocked];
    int v110 = [v109 BOOLValue];
    int v111 = [v4 isBlocked];

    if (v110 != v111)
    {
      v112 = [(EMMessageListItemChange *)self isBlocked];
      objc_msgSend(v4, "setIsBlocked:", objc_msgSend(v112, "BOOLValue"));

      BOOL v9 = 1;
    }
  }
  v113 = [(EMMessageListItemChange *)self unsubscribeType];
  if (v113)
  {
    uint64_t v114 = [(EMMessageListItemChange *)self unsubscribeType];
    uint64_t v115 = [v114 integerValue];
    uint64_t v116 = [v4 unsubscribeType];

    if (v115 != v116)
    {
      v117 = [(EMMessageListItemChange *)self unsubscribeType];
      objc_msgSend(v4, "setUnsubscribeType:", objc_msgSend(v117, "integerValue"));

      BOOL v9 = 1;
    }
  }
  v118 = [(EMMessageListItemChange *)self hasAttachments];
  if (v118)
  {
    v119 = [(EMMessageListItemChange *)self hasAttachments];
    int v120 = [v119 BOOLValue];
    int v121 = [v4 hasAttachments];

    if (v120 != v121)
    {
      uint64_t v122 = [(EMMessageListItemChange *)self hasAttachments];
      objc_msgSend(v4, "setHasAttachments:", objc_msgSend(v122, "BOOLValue"));

      BOOL v9 = 1;
    }
  }
  v123 = [(EMMessageListItemChange *)self conversationNotificationLevel];
  if (v123)
  {
    char v124 = [(EMMessageListItemChange *)self conversationNotificationLevel];
    uint64_t v125 = [v124 integerValue];
    uint64_t v126 = [v4 conversationNotificationLevel];

    if (v125 != v126)
    {
      v127 = [(EMMessageListItemChange *)self conversationNotificationLevel];
      objc_msgSend(v4, "setConversationNotificationLevel:", objc_msgSend(v127, "integerValue"));

      BOOL v9 = 1;
    }
  }
  v128 = [(EMMessageListItemChange *)self count];
  if (v128)
  {
    v129 = [(EMMessageListItemChange *)self count];
    uint64_t v130 = [v129 unsignedIntegerValue];
    uint64_t v131 = [v4 count];

    if (v130 != v131)
    {
      char v132 = [(EMMessageListItemChange *)self count];
      objc_msgSend(v4, "setCount:", objc_msgSend(v132, "unsignedIntegerValue"));

      BOOL v9 = 1;
    }
  }
  v133 = [(EMMessageListItemChange *)self conversationID];
  if (v133)
  {
    v134 = [(EMMessageListItemChange *)self conversationID];
    uint64_t v135 = [v134 longLongValue];
    uint64_t v136 = [v4 conversationID];

    if (v135 != v136)
    {
      v137 = [(EMMessageListItemChange *)self conversationID];
      objc_msgSend(v4, "setConversationID:", objc_msgSend(v137, "longLongValue"));

      BOOL v9 = 1;
    }
  }
  uint64_t v138 = [(EMMessageListItemChange *)self mailboxObjectIDs];
  if (v138)
  {
    v139 = [(EMMessageListItemChange *)self mailboxObjectIDs];
    char v140 = [v4 mailboxObjectIDs];
    char v141 = [v139 isEqual:v140];

    if ((v141 & 1) == 0)
    {
      v142 = [(EMMessageListItemChange *)self mailboxObjectIDs];
      [v4 setMailboxObjectIDs:v142];

      BOOL v9 = 1;
    }
  }
  v143 = [(EMMessageListItemChange *)self mailboxes];
  if (v143)
  {
    v144 = [(EMMessageListItemChange *)self mailboxes];
    v145 = [v4 mailboxes];
    char v146 = [v144 isEqual:v145];

    if ((v146 & 1) == 0)
    {
      v147 = [(EMMessageListItemChange *)self mailboxes];
      [v4 setMailboxes:v147];

      BOOL v9 = 1;
    }
  }
  char v148 = [(EMMessageListItemChange *)self displayMessageItemID];
  if (v148)
  {
    v149 = [(EMMessageListItemChange *)self displayMessageItemID];
    v150 = [v4 displayMessageItemID];
    char v151 = [v149 isEqual:v150];

    if ((v151 & 1) == 0)
    {
      v152 = [(EMMessageListItemChange *)self displayMessageItemID];
      [v4 setDisplayMessageItemID:v152];

      BOOL v9 = 1;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageListItemChange)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EMMessageListItemChange *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_displayDate"];
    displayDate = v5->_displayDate;
    v5->_displayDate = (NSDate *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"EFPropertyKey_readLater"];
    readLater = v5->_readLater;
    v5->_readLater = (EMMessageListItemChangeReadLater *)v13;

    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    long long v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"EFPropertyKey_followUp"];
    followUp = v5->_followUp;
    v5->_followUp = (EMMessageListItemChangeFollowUp *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_businessID"];
    businessID = v5->_businessID;
    v5->_businessID = (NSNumber *)v20;

    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    id v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"EFPropertyKey_businessLogoID"];
    businessLogoID = v5->_businessLogoID;
    v5->_businessLogoID = (EMMessageListItemChangeBusinessLogoID *)v25;

    char v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    char v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"EFPropertyKey_category"];
    category = v5->_category;
    v5->_category = (EMMessageListItemChangeCategory *)v30;

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"EFPropertyKey_groupedSenderMessageListItems"];
    groupedSenderMessageListItems = v5->_groupedSenderMessageListItems;
    v5->_groupedSenderMessageListItems = (NSArray *)v36;

    unint64_t v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    char v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"EFPropertyKey_subject"];
    subject = v5->_subject;
    v5->_subject = (EMMessageListItemChangeSubject *)v41;

    uint64_t v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"EFPropertyKey_sendLaterDate"];
    sendLaterDate = v5->_sendLaterDate;
    v5->_sendLaterDate = (EMMessageListItemChangeSendLaterDate *)v46;

    id v48 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v49 = objc_opt_class();
    char v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    uint64_t v51 = [v4 decodeObjectOfClasses:v50 forKey:@"EFPropertyKey_summary"];
    summary = v5->_summary;
    v5->_summary = (EMMessageListItemChangeSummary *)v51;

    char v53 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
    uint64_t v56 = [v4 decodeObjectOfClasses:v55 forKey:@"EFPropertyKey_generatedSummary"];
    generatedSummary = v5->_generatedSummary;
    v5->_generatedSummary = (EMMessageListItemChangeGeneratedSummary *)v56;

    id v58 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v59 = objc_opt_class();
    uint64_t v60 = objc_opt_class();
    v61 = objc_msgSend(v58, "setWithObjects:", v59, v60, objc_opt_class(), 0);
    uint64_t v62 = [v4 decodeObjectOfClasses:v61 forKey:@"EFPropertyKey_senderList"];
    senderList = v5->_senderList;
    v5->_senderList = (NSArray *)v62;

    uint64_t v64 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v65 = objc_opt_class();
    uint64_t v66 = objc_opt_class();
    v67 = objc_msgSend(v64, "setWithObjects:", v65, v66, objc_opt_class(), 0);
    uint64_t v68 = [v4 decodeObjectOfClasses:v67 forKey:@"EFPropertyKey_toList"];
    toList = v5->_toList;
    v5->_toList = (NSArray *)v68;

    uint64_t v70 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v71 = objc_opt_class();
    uint64_t v72 = objc_opt_class();
    v73 = objc_msgSend(v70, "setWithObjects:", v71, v72, objc_opt_class(), 0);
    uint64_t v74 = [v4 decodeObjectOfClasses:v73 forKey:@"EFPropertyKey_ccList"];
    ccList = v5->_ccList;
    v5->_ccList = (NSArray *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_flags"];
    flags = v5->_flags;
    v5->_flags = (ECMessageFlags *)v76;

    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_hasUnflagged"];
    hasUnflagged = v5->_hasUnflagged;
    v5->_hasUnflagged = (NSNumber *)v78;

    char v80 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v81 = objc_opt_class();
    uint64_t v82 = objc_msgSend(v80, "setWithObjects:", v81, objc_opt_class(), 0);
    uint64_t v83 = [v4 decodeObjectOfClasses:v82 forKey:@"EFPropertyKey_flagColors"];
    flagColors = v5->_flagColors;
    v5->_flagColors = (EMMessageListItemChangeFlagColors *)v83;

    uint64_t v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_isVIP"];
    isVIP = v5->_isVIP;
    v5->_isVIP = (NSNumber *)v85;

    uint64_t v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_isBlocked"];
    isBlocked = v5->_isBlocked;
    v5->_isBlocked = (NSNumber *)v87;

    uint64_t v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_unsubscribeType"];
    unsubscribeType = v5->_unsubscribeType;
    v5->_unsubscribeType = (NSNumber *)v89;

    uint64_t v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_hasAttachments"];
    hasAttachments = v5->_hasAttachments;
    v5->_hasAttachments = (NSNumber *)v91;

    uint64_t v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_conversationNotificationLevel"];
    conversationNotificationLevel = v5->_conversationNotificationLevel;
    v5->_conversationNotificationLevel = (NSNumber *)v93;

    uint64_t v95 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_count"];
    count = v5->_count;
    v5->_count = (NSNumber *)v95;

    uint64_t v97 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_conversationID"];
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSNumber *)v97;

    id v99 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v100 = objc_opt_class();
    v101 = objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0);
    uint64_t v102 = [v4 decodeObjectOfClasses:v101 forKey:@"EFPropertyKey_mailboxObjectIDs"];
    mailboxObjectIDs = v5->_mailboxObjectIDs;
    v5->_mailboxObjectIDs = (NSArray *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_displayMessageItemID"];
    displayMessageItemID = v5->_displayMessageItemID;
    v5->_displayMessageItemID = (EMCollectionItemID *)v104;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v31 = a3;
  id v4 = [(EMMessageListItemChange *)self date];
  [v31 encodeObject:v4 forKey:@"EFPropertyKey_date"];

  BOOL v5 = [(EMMessageListItemChange *)self displayDate];
  [v31 encodeObject:v5 forKey:@"EFPropertyKey_displayDate"];

  uint64_t v6 = [(EMMessageListItemChange *)self readLater];
  [v31 encodeObject:v6 forKey:@"EFPropertyKey_readLater"];

  id v7 = [(EMMessageListItemChange *)self followUp];
  [v31 encodeObject:v7 forKey:@"EFPropertyKey_followUp"];

  uint64_t v8 = [(EMMessageListItemChange *)self businessID];
  [v31 encodeObject:v8 forKey:@"EFPropertyKey_businessID"];

  BOOL v9 = [(EMMessageListItemChange *)self businessLogoID];
  [v31 encodeObject:v9 forKey:@"EFPropertyKey_businessLogoID"];

  uint64_t v10 = [(EMMessageListItemChange *)self category];
  [v31 encodeObject:v10 forKey:@"EFPropertyKey_category"];

  uint64_t v11 = [(EMMessageListItemChange *)self groupedSenderMessageListItems];
  [v31 encodeObject:v11 forKey:@"EFPropertyKey_groupedSenderMessageListItems"];

  uint64_t v12 = [(EMMessageListItemChange *)self subject];
  [v31 encodeObject:v12 forKey:@"EFPropertyKey_subject"];

  uint64_t v13 = [(EMMessageListItemChange *)self sendLaterDate];
  [v31 encodeObject:v13 forKey:@"EFPropertyKey_sendLaterDate"];

  char v14 = [(EMMessageListItemChange *)self summary];
  [v31 encodeObject:v14 forKey:@"EFPropertyKey_summary"];

  id v15 = [(EMMessageListItemChange *)self generatedSummary];
  [v31 encodeObject:v15 forKey:@"EFPropertyKey_generatedSummary"];

  uint64_t v16 = [(EMMessageListItemChange *)self senderList];
  [v31 encodeObject:v16 forKey:@"EFPropertyKey_senderList"];

  long long v17 = [(EMMessageListItemChange *)self toList];
  [v31 encodeObject:v17 forKey:@"EFPropertyKey_toList"];

  uint64_t v18 = [(EMMessageListItemChange *)self ccList];
  [v31 encodeObject:v18 forKey:@"EFPropertyKey_ccList"];

  id v19 = [(EMMessageListItemChange *)self flags];
  [v31 encodeObject:v19 forKey:@"EFPropertyKey_flags"];

  uint64_t v20 = [(EMMessageListItemChange *)self hasUnflagged];
  [v31 encodeObject:v20 forKey:@"EFPropertyKey_hasUnflagged"];

  char v21 = [(EMMessageListItemChange *)self flagColors];
  [v31 encodeObject:v21 forKey:@"EFPropertyKey_flagColors"];

  uint64_t v22 = [(EMMessageListItemChange *)self isVIP];
  [v31 encodeObject:v22 forKey:@"EFPropertyKey_isVIP"];

  uint64_t v23 = [(EMMessageListItemChange *)self isBlocked];
  [v31 encodeObject:v23 forKey:@"EFPropertyKey_isBlocked"];

  id v24 = [(EMMessageListItemChange *)self unsubscribeType];
  [v31 encodeObject:v24 forKey:@"EFPropertyKey_unsubscribeType"];

  uint64_t v25 = [(EMMessageListItemChange *)self hasAttachments];
  [v31 encodeObject:v25 forKey:@"EFPropertyKey_hasAttachments"];

  long long v26 = [(EMMessageListItemChange *)self conversationNotificationLevel];
  [v31 encodeObject:v26 forKey:@"EFPropertyKey_conversationNotificationLevel"];

  char v27 = [(EMMessageListItemChange *)self count];
  [v31 encodeObject:v27 forKey:@"EFPropertyKey_count"];

  uint64_t v28 = [(EMMessageListItemChange *)self conversationID];
  [v31 encodeObject:v28 forKey:@"EFPropertyKey_conversationID"];

  char v29 = [(EMMessageListItemChange *)self mailboxObjectIDs];
  [v31 encodeObject:v29 forKey:@"EFPropertyKey_mailboxObjectIDs"];

  uint64_t v30 = [(EMMessageListItemChange *)self displayMessageItemID];
  [v31 encodeObject:v30 forKey:@"EFPropertyKey_displayMessageItemID"];
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (void)setDisplayDate:(id)a3
{
}

- (EMMessageListItemChangeSubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (EMMessageListItemChangeSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (EMMessageListItemChangeGeneratedSummary)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
}

- (NSArray)senderList
{
  return self->_senderList;
}

- (void)setSenderList:(id)a3
{
}

- (NSArray)toList
{
  return self->_toList;
}

- (void)setToList:(id)a3
{
}

- (NSArray)ccList
{
  return self->_ccList;
}

- (void)setCcList:(id)a3
{
}

- (BOOL)isToMe
{
  return self->_isToMe;
}

- (void)setIsToMe:(BOOL)a3
{
  self->_isToMe = a3;
}

- (BOOL)isCCMe
{
  return self->_isCCMe;
}

- (void)setIsCCMe:(BOOL)a3
{
  self->_isCCMe = a3;
}

- (ECMessageFlags)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
}

- (NSNumber)hasUnflagged
{
  return self->_hasUnflagged;
}

- (void)setHasUnflagged:(id)a3
{
}

- (EMMessageListItemChangeFlagColors)flagColors
{
  return self->_flagColors;
}

- (void)setFlagColors:(id)a3
{
}

- (NSNumber)isVIP
{
  return self->_isVIP;
}

- (void)setIsVIP:(id)a3
{
}

- (NSNumber)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(id)a3
{
}

- (NSNumber)unsubscribeType
{
  return self->_unsubscribeType;
}

- (void)setUnsubscribeType:(id)a3
{
}

- (NSNumber)hasAttachments
{
  return self->_hasAttachments;
}

- (void)setHasAttachments:(id)a3
{
}

- (NSNumber)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(id)a3
{
}

- (NSNumber)allowAuthenticationWarning
{
  return self->_allowAuthenticationWarning;
}

- (void)setAllowAuthenticationWarning:(id)a3
{
}

- (NSNumber)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (void)setConversationNotificationLevel:(id)a3
{
}

- (EMMessageListItemChangeReadLater)readLater
{
  return self->_readLater;
}

- (void)setReadLater:(id)a3
{
}

- (EMMessageListItemChangeSendLaterDate)sendLaterDate
{
  return self->_sendLaterDate;
}

- (void)setSendLaterDate:(id)a3
{
}

- (EMMessageListItemChangeFollowUp)followUp
{
  return self->_followUp;
}

- (void)setFollowUp:(id)a3
{
}

- (NSNumber)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(id)a3
{
}

- (EMMessageListItemChangeBusinessLogoID)businessLogoID
{
  return self->_businessLogoID;
}

- (void)setBusinessLogoID:(id)a3
{
}

- (EMMessageListItemChangeCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSArray)groupedSenderMessageListItems
{
  return self->_groupedSenderMessageListItems;
}

- (void)setGroupedSenderMessageListItems:(id)a3
{
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
}

- (NSNumber)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (EMCollectionItemID)displayMessageItemID
{
  return self->_displayMessageItemID;
}

- (void)setDisplayMessageItemID:(id)a3
{
}

- (NSNumber)messageSize
{
  return self->_messageSize;
}

- (void)setMessageSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSize, 0);
  objc_storeStrong((id *)&self->_displayMessageItemID, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_groupedSenderMessageListItems, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_businessLogoID, 0);
  objc_storeStrong((id *)&self->_businessID, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_conversationNotificationLevel, 0);
  objc_storeStrong((id *)&self->_allowAuthenticationWarning, 0);
  objc_storeStrong((id *)&self->_isAuthenticated, 0);
  objc_storeStrong((id *)&self->_hasAttachments, 0);
  objc_storeStrong((id *)&self->_unsubscribeType, 0);
  objc_storeStrong((id *)&self->_isBlocked, 0);
  objc_storeStrong((id *)&self->_isVIP, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
  objc_storeStrong((id *)&self->_hasUnflagged, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
}

@end