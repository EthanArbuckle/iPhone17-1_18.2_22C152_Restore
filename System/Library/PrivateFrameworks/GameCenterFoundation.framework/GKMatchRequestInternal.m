@interface GKMatchRequestInternal
+ (id)secureCodedPropertyKeys;
- (BOOL)hasGuestPlayers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLateJoin;
- (BOOL)isPreloadedMatch;
- (BOOL)restrictToAutomatch;
- (GKMatchRequestInternal)init;
- (NSArray)messagesBasedRecipients;
- (NSArray)recipientPlayerIDs;
- (NSArray)recipients;
- (NSData)archivedSharePlayInviteeTokensFromProgrammaticInvite;
- (NSData)sessionToken;
- (NSDictionary)localizableInviteMessage;
- (NSDictionary)properties;
- (NSDictionary)recipientProperties;
- (NSString)inviteMessage;
- (NSString)localPlayerID;
- (NSString)queueName;
- (NSString)rid;
- (unint64_t)hash;
- (unint64_t)matchType;
- (unint64_t)playerGroup;
- (unsigned)defaultNumberOfPlayers;
- (unsigned)maxPlayers;
- (unsigned)minPlayers;
- (unsigned)playerAttributes;
- (unsigned)version;
- (void)setArchivedSharePlayInviteeTokensFromProgrammaticInvite:(id)a3;
- (void)setDefaultNumberOfPlayers:(unsigned __int8)a3;
- (void)setInviteMessage:(id)a3;
- (void)setIsLateJoin:(BOOL)a3;
- (void)setLocalPlayerID:(id)a3;
- (void)setLocalizableInviteMessage:(id)a3;
- (void)setMatchType:(unint64_t)a3;
- (void)setMaxPlayers:(unsigned __int8)a3;
- (void)setMessagesBasedRecipients:(id)a3;
- (void)setMinPlayers:(unsigned __int8)a3;
- (void)setPlayerAttributes:(unsigned int)a3;
- (void)setPlayerGroup:(unint64_t)a3;
- (void)setPreloadedMatch:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setQueueName:(id)a3;
- (void)setRecipientPlayerIDs:(id)a3;
- (void)setRecipientProperties:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setRestrictToAutomatch:(BOOL)a3;
- (void)setRid:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation GKMatchRequestInternal

- (GKMatchRequestInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKMatchRequestInternal;
  result = [(GKMatchRequestInternal *)&v3 init];
  if (result)
  {
    result->_matchType = 0;
    result->_playerGroup = 1;
    result->_playerAttributes = -1;
    result->_minPlayers = 2;
    result->_maxPlayers = 2;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  id v5 = v4;
  int v6 = [(GKMatchRequestInternal *)self minPlayers];
  if (v6 != [v5 minPlayers]) {
    goto LABEL_15;
  }
  int v7 = [(GKMatchRequestInternal *)self maxPlayers];
  if (v7 != [v5 maxPlayers]) {
    goto LABEL_15;
  }
  int v8 = [(GKMatchRequestInternal *)self defaultNumberOfPlayers];
  if (v8 != [v5 defaultNumberOfPlayers]) {
    goto LABEL_15;
  }
  unint64_t v9 = [(GKMatchRequestInternal *)self matchType];
  if (v9 != [v5 matchType]) {
    goto LABEL_15;
  }
  unint64_t v10 = [(GKMatchRequestInternal *)self playerGroup];
  if (v10 != [v5 playerGroup]) {
    goto LABEL_15;
  }
  unsigned int v11 = [(GKMatchRequestInternal *)self playerAttributes];
  if (v11 != [v5 playerAttributes]) {
    goto LABEL_15;
  }
  v12 = [(GKMatchRequestInternal *)self localPlayerID];
  v13 = [v5 localPlayerID];
  if (v12 == v13) {
    goto LABEL_11;
  }
  v14 = [(GKMatchRequestInternal *)self localPlayerID];
  v15 = [v5 localPlayerID];
  if (![v14 isEqualToString:v15])
  {

LABEL_15:
    goto LABEL_16;
  }
  v102 = v15;
  v103 = v14;
LABEL_11:
  v16 = [(GKMatchRequestInternal *)self recipients];
  v17 = [v5 recipients];
  if (v16 == v17) {
    goto LABEL_18;
  }
  v18 = [(GKMatchRequestInternal *)self recipients];
  v19 = [v5 recipients];
  if ([v18 isEqualToArray:v19])
  {
    v100 = v19;
    v101 = v18;
LABEL_18:
    v22 = [(GKMatchRequestInternal *)self recipientPlayerIDs];
    uint64_t v23 = [v5 recipientPlayerIDs];
    v24 = (void *)v23;
    if (v22 != (void *)v23)
    {
      v25 = v13;
      v26 = v17;
      v27 = v16;
      v28 = (void *)v23;
      v29 = v22;
      v30 = [(GKMatchRequestInternal *)self recipientPlayerIDs];
      v93 = [v5 recipientPlayerIDs];
      v94 = v30;
      if (!objc_msgSend(v30, "isEqualToArray:"))
      {
        char v31 = 0;
        v22 = v29;
        v24 = v28;
        v16 = v27;
        v17 = v26;
        v13 = v25;
LABEL_66:

LABEL_67:
        v19 = v100;
        v18 = v101;
        if (v16 == v17) {
          goto LABEL_69;
        }
        goto LABEL_68;
      }
      v22 = v29;
      v24 = v28;
      v16 = v27;
      v17 = v26;
      v13 = v25;
    }
    uint64_t v32 = [(GKMatchRequestInternal *)self messagesBasedRecipients];
    uint64_t v99 = [v5 messagesBasedRecipients];
    v95 = (void *)v32;
    if (v32 != v99)
    {
      v33 = [(GKMatchRequestInternal *)self messagesBasedRecipients];
      v88 = [v5 messagesBasedRecipients];
      v89 = v33;
      if (![v33 isEqualToArray:v88])
      {
        char v96 = 0;
        v34 = (void *)v99;
        v35 = v95;
LABEL_64:

LABEL_65:
        char v31 = v96;
        if (v22 == v24) {
          goto LABEL_67;
        }
        goto LABEL_66;
      }
    }
    uint64_t v36 = [(GKMatchRequestInternal *)self inviteMessage];
    uint64_t v90 = [v5 inviteMessage];
    v91 = (void *)v36;
    v92 = v17;
    if (v36 != v90)
    {
      v37 = [(GKMatchRequestInternal *)self inviteMessage];
      v84 = [v5 inviteMessage];
      v85 = v37;
      if (!objc_msgSend(v37, "isEqualToString:"))
      {
        char v96 = 0;
        v39 = (void *)v90;
        v38 = v91;
        v35 = v95;
LABEL_62:

LABEL_63:
        v34 = (void *)v99;
        v17 = v92;
        if (v35 == (void *)v99) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }
    }
    v40 = [(GKMatchRequestInternal *)self localizableInviteMessage];
    [v5 localizableInviteMessage];
    uint64_t v87 = v86 = v22;
    if (v40 == (void *)v87)
    {
      v97 = v16;
    }
    else
    {
      v77 = v24;
      v41 = [(GKMatchRequestInternal *)self localizableInviteMessage];
      v79 = [v5 localizableInviteMessage];
      v80 = v41;
      if (!objc_msgSend(v41, "isEqualToDictionary:"))
      {
        char v96 = 0;
        v39 = (void *)v90;
        v38 = v91;
        v48 = (void *)v87;
        v24 = v77;
LABEL_60:

LABEL_61:
        v22 = v86;
        v35 = v95;
        if (v38 == v39) {
          goto LABEL_63;
        }
        goto LABEL_62;
      }
      v97 = v16;
      v24 = v77;
    }
    uint64_t v42 = [(GKMatchRequestInternal *)self sessionToken];
    uint64_t v82 = [v5 sessionToken];
    v83 = (void *)v42;
    v81 = v40;
    if (v42 == v82)
    {
      v16 = v97;
    }
    else
    {
      v43 = [(GKMatchRequestInternal *)self sessionToken];
      v75 = [v5 sessionToken];
      v76 = v43;
      int v44 = objc_msgSend(v43, "isEqual:");
      v16 = v97;
      if (!v44)
      {
        char v45 = 0;
        v46 = (void *)v82;
        v47 = v83;
LABEL_43:
        char v96 = v45;

        goto LABEL_59;
      }
    }
    unsigned int v49 = [(GKMatchRequestInternal *)self version];
    if (v49 != [v5 version]
      || (int v50 = [(GKMatchRequestInternal *)self isPreloadedMatch],
          v50 != [v5 isPreloadedMatch])
      || (int v51 = [(GKMatchRequestInternal *)self restrictToAutomatch],
          v51 != [v5 restrictToAutomatch])
      || (int v52 = [(GKMatchRequestInternal *)self isLateJoin],
          v52 != [v5 isLateJoin]))
    {
      char v45 = 0;
      char v53 = 0;
      v46 = (void *)v82;
      v47 = v83;
      if (v83 != (void *)v82) {
        goto LABEL_43;
      }
LABEL_58:

      char v96 = v53;
LABEL_59:
      v40 = v81;
      v48 = (void *)v87;
      v39 = (void *)v90;
      v38 = v91;
      if (v81 == (void *)v87) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
    v72 = v12;
    v73 = v13;
    v98 = v16;
    v78 = v24;
    uint64_t v54 = [(GKMatchRequestInternal *)self queueName];
    [v5 queueName];
    v55 = v74 = (void *)v54;
    if ((void *)v54 != v55)
    {
      v56 = [(GKMatchRequestInternal *)self queueName];
      v70 = [v5 queueName];
      v71 = v56;
      if (!objc_msgSend(v56, "isEqualToString:"))
      {
        char v57 = 0;
LABEL_56:

LABEL_57:
        char v45 = v57;
        char v53 = v57;
        v46 = (void *)v82;
        v47 = v83;
        v24 = v78;
        v16 = v98;
        v12 = v72;
        v13 = v73;
        if (v83 != (void *)v82) {
          goto LABEL_43;
        }
        goto LABEL_58;
      }
    }
    uint64_t v58 = [(GKMatchRequestInternal *)self properties];
    [v5 properties];
    v60 = v59 = (void *)v58;
    if ((void *)v58 == v60
      || ([(GKMatchRequestInternal *)self properties],
          v61 = objc_claimAutoreleasedReturnValue(),
          [v5 properties],
          v68 = objc_claimAutoreleasedReturnValue(),
          v69 = v61,
          objc_msgSend(v61, "isEqualToDictionary:")))
    {
      v62 = [(GKMatchRequestInternal *)self recipientProperties];
      uint64_t v63 = [v5 recipientProperties];
      v64 = v62;
      if (v62 == (void *)v63)
      {

        char v57 = 1;
      }
      else
      {
        v65 = (void *)v63;
        v66 = [(GKMatchRequestInternal *)self recipientProperties];
        v67 = [v5 recipientProperties];
        char v57 = [v66 isEqualToDictionary:v67];
      }
      if (v59 == v60)
      {
LABEL_55:

        if (v74 == v55) {
          goto LABEL_57;
        }
        goto LABEL_56;
      }
    }
    else
    {
      char v57 = 0;
    }

    goto LABEL_55;
  }
  char v31 = 0;
LABEL_68:

LABEL_69:
  if (v12 != v13)
  {
  }
  if (v31)
  {
    BOOL v20 = 1;
    goto LABEL_17;
  }
LABEL_16:
  BOOL v20 = 0;
LABEL_17:

  return v20;
}

- (unint64_t)hash
{
  int v3 = [(GKMatchRequestInternal *)self minPlayers];
  uint64_t v4 = ([(GKMatchRequestInternal *)self maxPlayers] << 20) | (v3 << 26);
  unint64_t v5 = [(GKMatchRequestInternal *)self matchType];
  return [(GKMatchRequestInternal *)self version] | (v5 << 16) | v4;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_25 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_25, &__block_literal_global_65);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_25;

  return v2;
}

void __49__GKMatchRequestInternal_secureCodedPropertyKeys__block_invoke()
{
  v25[22] = *MEMORY[0x1E4F143B8];
  v24[0] = @"minPlayers";
  v25[0] = objc_opt_class();
  v24[1] = @"maxPlayers";
  v25[1] = objc_opt_class();
  v24[2] = @"defaultNumberOfPlayers";
  v25[2] = objc_opt_class();
  v24[3] = @"playerGroup";
  v25[3] = objc_opt_class();
  v24[4] = @"playerAttributes";
  v25[4] = objc_opt_class();
  v24[5] = @"localPlayerID";
  v25[5] = objc_opt_class();
  v24[6] = @"recipients";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  int v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v25[6] = v3;
  v24[7] = @"recipientPlayerIDs";
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  int v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v25[7] = v7;
  v24[8] = @"messagesBasedRecipients";
  int v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  unsigned int v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v25[8] = v11;
  v24[9] = @"inviteMessage";
  v25[9] = objc_opt_class();
  v24[10] = @"localizableInviteMessage";
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  v25[10] = v15;
  v24[11] = @"matchType";
  v25[11] = objc_opt_class();
  v24[12] = @"sessionToken";
  v25[12] = objc_opt_class();
  v24[13] = @"rid";
  v25[13] = objc_opt_class();
  v24[14] = @"version";
  v25[14] = objc_opt_class();
  v24[15] = @"preloadedMatch";
  v25[15] = objc_opt_class();
  v24[16] = @"restrictToAutomatch";
  v25[16] = objc_opt_class();
  v24[17] = @"archivedSharePlayInviteeTokensFromProgrammaticInvite";
  v25[17] = objc_opt_class();
  v24[18] = @"isLateJoin";
  v25[18] = objc_opt_class();
  v24[19] = @"queueName";
  v25[19] = objc_opt_class();
  v24[20] = @"properties";
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  v17 = +[GKInternalRepresentation secureCodedJsonTypes];
  v18 = [v16 setWithSet:v17];
  v25[20] = v18;
  v24[21] = @"recipientProperties";
  v19 = [MEMORY[0x1E4F1CA80] setWithObject:objc_opt_class()];
  BOOL v20 = +[GKInternalRepresentation secureCodedJsonTypes];
  v21 = [v19 setByAddingObjectsFromSet:v20];
  v25[21] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:22];

  uint64_t v23 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_25;
  secureCodedPropertyKeys_sSecureCodedKeys_25 = v22;
}

- (BOOL)hasGuestPlayers
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v2 = [(GKMatchRequestInternal *)self recipients];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__GKMatchRequestInternal_hasGuestPlayers__block_invoke;
  v4[3] = &unk_1E6472600;
  v4[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __41__GKMatchRequestInternal_hasGuestPlayers__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isGuestPlayer];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (unsigned)minPlayers
{
  return self->_minPlayers;
}

- (void)setMinPlayers:(unsigned __int8)a3
{
  self->_minPlayers = a3;
}

- (unsigned)maxPlayers
{
  return self->_maxPlayers;
}

- (void)setMaxPlayers:(unsigned __int8)a3
{
  self->_maxPlayers = a3;
}

- (unsigned)defaultNumberOfPlayers
{
  return self->_defaultNumberOfPlayers;
}

- (void)setDefaultNumberOfPlayers:(unsigned __int8)a3
{
  self->_defaultNumberOfPlayers = a3;
}

- (unint64_t)playerGroup
{
  return self->_playerGroup;
}

- (void)setPlayerGroup:(unint64_t)a3
{
  self->_playerGroup = a3;
}

- (unsigned)playerAttributes
{
  return self->_playerAttributes;
}

- (void)setPlayerAttributes:(unsigned int)a3
{
  self->_playerAttributes = a3;
}

- (NSString)localPlayerID
{
  return self->_localPlayerID;
}

- (void)setLocalPlayerID:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)recipientPlayerIDs
{
  return self->_recipientPlayerIDs;
}

- (void)setRecipientPlayerIDs:(id)a3
{
}

- (NSArray)messagesBasedRecipients
{
  return self->_messagesBasedRecipients;
}

- (void)setMessagesBasedRecipients:(id)a3
{
}

- (NSString)inviteMessage
{
  return self->_inviteMessage;
}

- (void)setInviteMessage:(id)a3
{
}

- (NSDictionary)localizableInviteMessage
{
  return self->_localizableInviteMessage;
}

- (void)setLocalizableInviteMessage:(id)a3
{
}

- (BOOL)restrictToAutomatch
{
  return self->_restrictToAutomatch;
}

- (void)setRestrictToAutomatch:(BOOL)a3
{
  self->_restrictToAutomatch = a3;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(unint64_t)a3
{
  self->_matchType = a3;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (NSString)rid
{
  return self->_rid;
}

- (void)setRid:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (BOOL)isPreloadedMatch
{
  return self->_preloadedMatch;
}

- (void)setPreloadedMatch:(BOOL)a3
{
  self->_preloadedMatch = a3;
}

- (NSData)archivedSharePlayInviteeTokensFromProgrammaticInvite
{
  return self->_archivedSharePlayInviteeTokensFromProgrammaticInvite;
}

- (void)setArchivedSharePlayInviteeTokensFromProgrammaticInvite:(id)a3
{
}

- (BOOL)isLateJoin
{
  return self->_isLateJoin;
}

- (void)setIsLateJoin:(BOOL)a3
{
  self->_isLateJoin = a3;
}

- (NSString)queueName
{
  return self->_queueName;
}

- (void)setQueueName:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSDictionary)recipientProperties
{
  return self->_recipientProperties;
}

- (void)setRecipientProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_queueName, 0);
  objc_storeStrong((id *)&self->_archivedSharePlayInviteeTokensFromProgrammaticInvite, 0);
  objc_storeStrong((id *)&self->_rid, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_localizableInviteMessage, 0);
  objc_storeStrong((id *)&self->_inviteMessage, 0);
  objc_storeStrong((id *)&self->_messagesBasedRecipients, 0);
  objc_storeStrong((id *)&self->_recipientPlayerIDs, 0);
  objc_storeStrong((id *)&self->_recipients, 0);

  objc_storeStrong((id *)&self->_localPlayerID, 0);
}

@end