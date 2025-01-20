@interface BMProactiveHarvestingMail
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingMail)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingMail)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromField:(id)a8 toField:(id)a9 ccField:(id)a10 bccField:(id)a11 headers:(id)a12 subject:(id)a13 htmlContentData:(id)a14 isFullyDownloaded:(id)a15 htmlContent:(id)a16 textContent:(id)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listID:(id)a22 accountType:(id)a23 attachments:(id)a24 fromHandle:(id)a25 toHandles:(id)a26 ccHandles:(id)a27 bccHandles:(id)a28 contentProtection:(id)a29 personaId:(id)a30;
- (BMProactiveHarvestingMail)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromField:(id)a8 toField:(id)a9 ccField:(id)a10 bccField:(id)a11 headers:(id)a12 subject:(id)a13 htmlContentData:(id)a14 isFullyDownloaded:(id)a15 htmlContent:(id)a16 textContent:(id)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listID:(id)a22 accountType:(id)a23 attachments:(id)a24 fromHandle:(id)a25 toHandles:(id)a26 ccHandles:(id)a27 bccHandles:(id)a28 contentProtection:(id)a29 personaId:(id)a30 conversationId:(id)a31 dateReceived:(id)a32 mailCategories:(id)a33 isNew:(id)a34 isTwoFactorCode:(id)a35 isFromMe:(id)a36 isJunk:(id)a37 isRead:(id)a38 isVIP:(id)a39 isFlagged:(id)a40;
- (BMProactiveHarvestingNamedHandle)fromHandle;
- (BMProactiveHarvestingNamedHandle)listID;
- (BMProactiveHarvestingNamedHandle)replyTo;
- (BOOL)hasIsFlagged;
- (BOOL)hasIsFromMe;
- (BOOL)hasIsFullyDownloaded;
- (BOOL)hasIsJunk;
- (BOOL)hasIsNew;
- (BOOL)hasIsRead;
- (BOOL)hasIsTwoFactorCode;
- (BOOL)hasIsVIP;
- (BOOL)hasMailCategories;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFlagged;
- (BOOL)isFromMe;
- (BOOL)isFullyDownloaded;
- (BOOL)isJunk;
- (BOOL)isNew;
- (BOOL)isRead;
- (BOOL)isTwoFactorCode;
- (BOOL)isVIP;
- (NSArray)accountHandles;
- (NSArray)attachments;
- (NSArray)bccHandles;
- (NSArray)ccHandles;
- (NSArray)headers;
- (NSArray)mailboxIdentifiers;
- (NSArray)toHandles;
- (NSData)htmlContent;
- (NSDate)absoluteTimestamp;
- (NSDate)dateReceived;
- (NSString)accountIdentifier;
- (NSString)accountType;
- (NSString)bccField;
- (NSString)ccField;
- (NSString)contentProtection;
- (NSString)conversationId;
- (NSString)description;
- (NSString)domainID;
- (NSString)fromField;
- (NSString)htmlContentData;
- (NSString)messageIdentifier;
- (NSString)personaId;
- (NSString)securityMethod;
- (NSString)subject;
- (NSString)textContent;
- (NSString)toField;
- (NSString)uniqueID;
- (id)_accountHandlesJSONArray;
- (id)_attachmentsJSONArray;
- (id)_bccHandlesJSONArray;
- (id)_ccHandlesJSONArray;
- (id)_headersJSONArray;
- (id)_mailboxIdentifiersJSONArray;
- (id)_toHandlesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)mailCategories;
- (unsigned)dataVersion;
- (void)setHasIsFlagged:(BOOL)a3;
- (void)setHasIsFromMe:(BOOL)a3;
- (void)setHasIsFullyDownloaded:(BOOL)a3;
- (void)setHasIsJunk:(BOOL)a3;
- (void)setHasIsNew:(BOOL)a3;
- (void)setHasIsRead:(BOOL)a3;
- (void)setHasIsTwoFactorCode:(BOOL)a3;
- (void)setHasIsVIP:(BOOL)a3;
- (void)setHasMailCategories:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingMail

- (BMProactiveHarvestingMail)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromField:(id)a8 toField:(id)a9 ccField:(id)a10 bccField:(id)a11 headers:(id)a12 subject:(id)a13 htmlContentData:(id)a14 isFullyDownloaded:(id)a15 htmlContent:(id)a16 textContent:(id)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listID:(id)a22 accountType:(id)a23 attachments:(id)a24 fromHandle:(id)a25 toHandles:(id)a26 ccHandles:(id)a27 bccHandles:(id)a28 contentProtection:(id)a29 personaId:(id)a30
{
  return -[BMProactiveHarvestingMail initWithUniqueID:domainID:absoluteTimestamp:accountIdentifier:messageIdentifier:fromField:toField:ccField:bccField:headers:subject:htmlContentData:isFullyDownloaded:htmlContent:textContent:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listID:accountType:attachments:fromHandle:toHandles:ccHandles:bccHandles:contentProtection:personaId:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:](self, "initWithUniqueID:domainID:absoluteTimestamp:accountIdentifier:messageIdentifier:fromField:toField:ccField:bccField:headers:subject:htmlContentData:isFullyDownloaded:htmlContent:textContent:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listID:accountType:attachments:fromHandle:toHandles:ccHandles:bccHandles:contentProtection:personaId:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_bccHandles, 0);
  objc_storeStrong((id *)&self->_ccHandles, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_listID, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifiers, 0);
  objc_storeStrong((id *)&self->_replyTo, 0);
  objc_storeStrong((id *)&self->_accountHandles, 0);
  objc_storeStrong((id *)&self->_securityMethod, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_htmlContent, 0);
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_bccField, 0);
  objc_storeStrong((id *)&self->_ccField, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_fromField, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_domainID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (void)setHasIsFlagged:(BOOL)a3
{
  self->_hasIsFlagged = a3;
}

- (BOOL)hasIsFlagged
{
  return self->_hasIsFlagged;
}

- (BOOL)isFlagged
{
  return self->_isFlagged;
}

- (void)setHasIsVIP:(BOOL)a3
{
  self->_hasIsVIP = a3;
}

- (BOOL)hasIsVIP
{
  return self->_hasIsVIP;
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (void)setHasIsRead:(BOOL)a3
{
  self->_hasIsRead = a3;
}

- (BOOL)hasIsRead
{
  return self->_hasIsRead;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)setHasIsJunk:(BOOL)a3
{
  self->_hasIsJunk = a3;
}

- (BOOL)hasIsJunk
{
  return self->_hasIsJunk;
}

- (BOOL)isJunk
{
  return self->_isJunk;
}

- (void)setHasIsFromMe:(BOOL)a3
{
  self->_hasIsFromMe = a3;
}

- (BOOL)hasIsFromMe
{
  return self->_hasIsFromMe;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setHasIsTwoFactorCode:(BOOL)a3
{
  self->_hasIsTwoFactorCode = a3;
}

- (BOOL)hasIsTwoFactorCode
{
  return self->_hasIsTwoFactorCode;
}

- (BOOL)isTwoFactorCode
{
  return self->_isTwoFactorCode;
}

- (void)setHasIsNew:(BOOL)a3
{
  self->_hasIsNew = a3;
}

- (BOOL)hasIsNew
{
  return self->_hasIsNew;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (void)setHasMailCategories:(BOOL)a3
{
  self->_hasMailCategories = a3;
}

- (BOOL)hasMailCategories
{
  return self->_hasMailCategories;
}

- (int)mailCategories
{
  return self->_mailCategories;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSArray)bccHandles
{
  return self->_bccHandles;
}

- (NSArray)ccHandles
{
  return self->_ccHandles;
}

- (NSArray)toHandles
{
  return self->_toHandles;
}

- (BMProactiveHarvestingNamedHandle)fromHandle
{
  return self->_fromHandle;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (BMProactiveHarvestingNamedHandle)listID
{
  return self->_listID;
}

- (NSArray)mailboxIdentifiers
{
  return self->_mailboxIdentifiers;
}

- (BMProactiveHarvestingNamedHandle)replyTo
{
  return self->_replyTo;
}

- (NSArray)accountHandles
{
  return self->_accountHandles;
}

- (NSString)securityMethod
{
  return self->_securityMethod;
}

- (NSString)textContent
{
  return self->_textContent;
}

- (NSData)htmlContent
{
  return self->_htmlContent;
}

- (void)setHasIsFullyDownloaded:(BOOL)a3
{
  self->_hasIsFullyDownloaded = a3;
}

- (BOOL)hasIsFullyDownloaded
{
  return self->_hasIsFullyDownloaded;
}

- (BOOL)isFullyDownloaded
{
  return self->_isFullyDownloaded;
}

- (NSString)htmlContentData
{
  return self->_htmlContentData;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSArray)headers
{
  return self->_headers;
}

- (NSString)bccField
{
  return self->_bccField;
}

- (NSString)ccField
{
  return self->_ccField;
}

- (NSString)toField
{
  return self->_toField;
}

- (NSString)fromField
{
  return self->_fromField;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMProactiveHarvestingMail *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingMail *)self uniqueID];
      v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_164;
      }
    }
    v13 = [(BMProactiveHarvestingMail *)self domainID];
    uint64_t v14 = [v5 domainID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingMail *)self domainID];
      v17 = [v5 domainID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_164;
      }
    }
    v19 = [(BMProactiveHarvestingMail *)self absoluteTimestamp];
    uint64_t v20 = [v5 absoluteTimestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingMail *)self absoluteTimestamp];
      v23 = [v5 absoluteTimestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_164;
      }
    }
    v25 = [(BMProactiveHarvestingMail *)self accountIdentifier];
    uint64_t v26 = [v5 accountIdentifier];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingMail *)self accountIdentifier];
      v29 = [v5 accountIdentifier];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_164;
      }
    }
    v31 = [(BMProactiveHarvestingMail *)self messageIdentifier];
    uint64_t v32 = [v5 messageIdentifier];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingMail *)self messageIdentifier];
      v35 = [v5 messageIdentifier];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_164;
      }
    }
    v37 = [(BMProactiveHarvestingMail *)self fromField];
    uint64_t v38 = [v5 fromField];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMProactiveHarvestingMail *)self fromField];
      v41 = [v5 fromField];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_164;
      }
    }
    v43 = [(BMProactiveHarvestingMail *)self toField];
    uint64_t v44 = [v5 toField];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMProactiveHarvestingMail *)self toField];
      v47 = [v5 toField];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_164;
      }
    }
    v49 = [(BMProactiveHarvestingMail *)self ccField];
    uint64_t v50 = [v5 ccField];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMProactiveHarvestingMail *)self ccField];
      v53 = [v5 ccField];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_164;
      }
    }
    v55 = [(BMProactiveHarvestingMail *)self bccField];
    uint64_t v56 = [v5 bccField];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMProactiveHarvestingMail *)self bccField];
      v59 = [v5 bccField];
      int v60 = [v58 isEqual:v59];

      if (!v60) {
        goto LABEL_164;
      }
    }
    v61 = [(BMProactiveHarvestingMail *)self headers];
    uint64_t v62 = [v5 headers];
    if (v61 == (void *)v62)
    {
    }
    else
    {
      v63 = (void *)v62;
      v64 = [(BMProactiveHarvestingMail *)self headers];
      v65 = [v5 headers];
      int v66 = [v64 isEqual:v65];

      if (!v66) {
        goto LABEL_164;
      }
    }
    v67 = [(BMProactiveHarvestingMail *)self subject];
    uint64_t v68 = [v5 subject];
    if (v67 == (void *)v68)
    {
    }
    else
    {
      v69 = (void *)v68;
      v70 = [(BMProactiveHarvestingMail *)self subject];
      v71 = [v5 subject];
      int v72 = [v70 isEqual:v71];

      if (!v72) {
        goto LABEL_164;
      }
    }
    v73 = [(BMProactiveHarvestingMail *)self htmlContentData];
    uint64_t v74 = [v5 htmlContentData];
    if (v73 == (void *)v74)
    {
    }
    else
    {
      v75 = (void *)v74;
      v76 = [(BMProactiveHarvestingMail *)self htmlContentData];
      v77 = [v5 htmlContentData];
      int v78 = [v76 isEqual:v77];

      if (!v78) {
        goto LABEL_164;
      }
    }
    if ([(BMProactiveHarvestingMail *)self hasIsFullyDownloaded]
      || [v5 hasIsFullyDownloaded])
    {
      if (![(BMProactiveHarvestingMail *)self hasIsFullyDownloaded]) {
        goto LABEL_164;
      }
      if (![v5 hasIsFullyDownloaded]) {
        goto LABEL_164;
      }
      int v79 = [(BMProactiveHarvestingMail *)self isFullyDownloaded];
      if (v79 != [v5 isFullyDownloaded]) {
        goto LABEL_164;
      }
    }
    v80 = [(BMProactiveHarvestingMail *)self htmlContent];
    uint64_t v81 = [v5 htmlContent];
    if (v80 == (void *)v81)
    {
    }
    else
    {
      v82 = (void *)v81;
      v83 = [(BMProactiveHarvestingMail *)self htmlContent];
      v84 = [v5 htmlContent];
      int v85 = [v83 isEqual:v84];

      if (!v85) {
        goto LABEL_164;
      }
    }
    v86 = [(BMProactiveHarvestingMail *)self textContent];
    uint64_t v87 = [v5 textContent];
    if (v86 == (void *)v87)
    {
    }
    else
    {
      v88 = (void *)v87;
      v89 = [(BMProactiveHarvestingMail *)self textContent];
      v90 = [v5 textContent];
      int v91 = [v89 isEqual:v90];

      if (!v91) {
        goto LABEL_164;
      }
    }
    v92 = [(BMProactiveHarvestingMail *)self securityMethod];
    uint64_t v93 = [v5 securityMethod];
    if (v92 == (void *)v93)
    {
    }
    else
    {
      v94 = (void *)v93;
      v95 = [(BMProactiveHarvestingMail *)self securityMethod];
      v96 = [v5 securityMethod];
      int v97 = [v95 isEqual:v96];

      if (!v97) {
        goto LABEL_164;
      }
    }
    v98 = [(BMProactiveHarvestingMail *)self accountHandles];
    uint64_t v99 = [v5 accountHandles];
    if (v98 == (void *)v99)
    {
    }
    else
    {
      v100 = (void *)v99;
      v101 = [(BMProactiveHarvestingMail *)self accountHandles];
      v102 = [v5 accountHandles];
      int v103 = [v101 isEqual:v102];

      if (!v103) {
        goto LABEL_164;
      }
    }
    v104 = [(BMProactiveHarvestingMail *)self replyTo];
    uint64_t v105 = [v5 replyTo];
    if (v104 == (void *)v105)
    {
    }
    else
    {
      v106 = (void *)v105;
      v107 = [(BMProactiveHarvestingMail *)self replyTo];
      v108 = [v5 replyTo];
      int v109 = [v107 isEqual:v108];

      if (!v109) {
        goto LABEL_164;
      }
    }
    v110 = [(BMProactiveHarvestingMail *)self mailboxIdentifiers];
    uint64_t v111 = [v5 mailboxIdentifiers];
    if (v110 == (void *)v111)
    {
    }
    else
    {
      v112 = (void *)v111;
      v113 = [(BMProactiveHarvestingMail *)self mailboxIdentifiers];
      v114 = [v5 mailboxIdentifiers];
      int v115 = [v113 isEqual:v114];

      if (!v115) {
        goto LABEL_164;
      }
    }
    v116 = [(BMProactiveHarvestingMail *)self listID];
    uint64_t v117 = [v5 listID];
    if (v116 == (void *)v117)
    {
    }
    else
    {
      v118 = (void *)v117;
      v119 = [(BMProactiveHarvestingMail *)self listID];
      v120 = [v5 listID];
      int v121 = [v119 isEqual:v120];

      if (!v121) {
        goto LABEL_164;
      }
    }
    v122 = [(BMProactiveHarvestingMail *)self accountType];
    uint64_t v123 = [v5 accountType];
    if (v122 == (void *)v123)
    {
    }
    else
    {
      v124 = (void *)v123;
      v125 = [(BMProactiveHarvestingMail *)self accountType];
      v126 = [v5 accountType];
      int v127 = [v125 isEqual:v126];

      if (!v127) {
        goto LABEL_164;
      }
    }
    v128 = [(BMProactiveHarvestingMail *)self attachments];
    uint64_t v129 = [v5 attachments];
    if (v128 == (void *)v129)
    {
    }
    else
    {
      v130 = (void *)v129;
      v131 = [(BMProactiveHarvestingMail *)self attachments];
      v132 = [v5 attachments];
      int v133 = [v131 isEqual:v132];

      if (!v133) {
        goto LABEL_164;
      }
    }
    v134 = [(BMProactiveHarvestingMail *)self fromHandle];
    uint64_t v135 = [v5 fromHandle];
    if (v134 == (void *)v135)
    {
    }
    else
    {
      v136 = (void *)v135;
      v137 = [(BMProactiveHarvestingMail *)self fromHandle];
      v138 = [v5 fromHandle];
      int v139 = [v137 isEqual:v138];

      if (!v139) {
        goto LABEL_164;
      }
    }
    v140 = [(BMProactiveHarvestingMail *)self toHandles];
    uint64_t v141 = [v5 toHandles];
    if (v140 == (void *)v141)
    {
    }
    else
    {
      v142 = (void *)v141;
      v143 = [(BMProactiveHarvestingMail *)self toHandles];
      v144 = [v5 toHandles];
      int v145 = [v143 isEqual:v144];

      if (!v145) {
        goto LABEL_164;
      }
    }
    v146 = [(BMProactiveHarvestingMail *)self ccHandles];
    uint64_t v147 = [v5 ccHandles];
    if (v146 == (void *)v147)
    {
    }
    else
    {
      v148 = (void *)v147;
      v149 = [(BMProactiveHarvestingMail *)self ccHandles];
      v150 = [v5 ccHandles];
      int v151 = [v149 isEqual:v150];

      if (!v151) {
        goto LABEL_164;
      }
    }
    v152 = [(BMProactiveHarvestingMail *)self bccHandles];
    uint64_t v153 = [v5 bccHandles];
    if (v152 == (void *)v153)
    {
    }
    else
    {
      v154 = (void *)v153;
      v155 = [(BMProactiveHarvestingMail *)self bccHandles];
      v156 = [v5 bccHandles];
      int v157 = [v155 isEqual:v156];

      if (!v157) {
        goto LABEL_164;
      }
    }
    v158 = [(BMProactiveHarvestingMail *)self contentProtection];
    uint64_t v159 = [v5 contentProtection];
    if (v158 == (void *)v159)
    {
    }
    else
    {
      v160 = (void *)v159;
      v161 = [(BMProactiveHarvestingMail *)self contentProtection];
      v162 = [v5 contentProtection];
      int v163 = [v161 isEqual:v162];

      if (!v163) {
        goto LABEL_164;
      }
    }
    v164 = [(BMProactiveHarvestingMail *)self personaId];
    uint64_t v165 = [v5 personaId];
    if (v164 == (void *)v165)
    {
    }
    else
    {
      v166 = (void *)v165;
      v167 = [(BMProactiveHarvestingMail *)self personaId];
      v168 = [v5 personaId];
      int v169 = [v167 isEqual:v168];

      if (!v169) {
        goto LABEL_164;
      }
    }
    v170 = [(BMProactiveHarvestingMail *)self conversationId];
    uint64_t v171 = [v5 conversationId];
    if (v170 == (void *)v171)
    {
    }
    else
    {
      v172 = (void *)v171;
      v173 = [(BMProactiveHarvestingMail *)self conversationId];
      v174 = [v5 conversationId];
      int v175 = [v173 isEqual:v174];

      if (!v175) {
        goto LABEL_164;
      }
    }
    v176 = [(BMProactiveHarvestingMail *)self dateReceived];
    uint64_t v177 = [v5 dateReceived];
    if (v176 == (void *)v177)
    {
    }
    else
    {
      v178 = (void *)v177;
      v179 = [(BMProactiveHarvestingMail *)self dateReceived];
      v180 = [v5 dateReceived];
      int v181 = [v179 isEqual:v180];

      if (!v181) {
        goto LABEL_164;
      }
    }
    if (![(BMProactiveHarvestingMail *)self hasMailCategories]
      && ![v5 hasMailCategories]
      || [(BMProactiveHarvestingMail *)self hasMailCategories]
      && [v5 hasMailCategories]
      && (int v182 = [(BMProactiveHarvestingMail *)self mailCategories],
          v182 == [v5 mailCategories]))
    {
      if (!-[BMProactiveHarvestingMail hasIsNew](self, "hasIsNew") && ![v5 hasIsNew]
        || [(BMProactiveHarvestingMail *)self hasIsNew]
        && [v5 hasIsNew]
        && (int v183 = -[BMProactiveHarvestingMail isNew](self, "isNew"), v183 == [v5 isNew]))
      {
        if (![(BMProactiveHarvestingMail *)self hasIsTwoFactorCode]
          && ![v5 hasIsTwoFactorCode]
          || [(BMProactiveHarvestingMail *)self hasIsTwoFactorCode]
          && [v5 hasIsTwoFactorCode]
          && (int v184 = [(BMProactiveHarvestingMail *)self isTwoFactorCode],
              v184 == [v5 isTwoFactorCode]))
        {
          if (![(BMProactiveHarvestingMail *)self hasIsFromMe]
            && ![v5 hasIsFromMe]
            || [(BMProactiveHarvestingMail *)self hasIsFromMe]
            && [v5 hasIsFromMe]
            && (int v185 = [(BMProactiveHarvestingMail *)self isFromMe],
                v185 == [v5 isFromMe]))
          {
            if (![(BMProactiveHarvestingMail *)self hasIsJunk]
              && ![v5 hasIsJunk]
              || [(BMProactiveHarvestingMail *)self hasIsJunk]
              && [v5 hasIsJunk]
              && (int v186 = [(BMProactiveHarvestingMail *)self isJunk],
                  v186 == [v5 isJunk]))
            {
              if (![(BMProactiveHarvestingMail *)self hasIsRead]
                && ![v5 hasIsRead]
                || [(BMProactiveHarvestingMail *)self hasIsRead]
                && [v5 hasIsRead]
                && (int v187 = [(BMProactiveHarvestingMail *)self isRead],
                    v187 == [v5 isRead]))
              {
                if (![(BMProactiveHarvestingMail *)self hasIsVIP]
                  && ![v5 hasIsVIP]
                  || [(BMProactiveHarvestingMail *)self hasIsVIP]
                  && [v5 hasIsVIP]
                  && (int v188 = [(BMProactiveHarvestingMail *)self isVIP],
                      v188 == [v5 isVIP]))
                {
                  if (![(BMProactiveHarvestingMail *)self hasIsFlagged]
                    && ![v5 hasIsFlagged])
                  {
                    LOBYTE(v12) = 1;
                    goto LABEL_165;
                  }
                  if ([(BMProactiveHarvestingMail *)self hasIsFlagged]
                    && [v5 hasIsFlagged])
                  {
                    BOOL v189 = [(BMProactiveHarvestingMail *)self isFlagged];
                    int v12 = v189 ^ [v5 isFlagged] ^ 1;
LABEL_165:

                    goto LABEL_166;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_164:
    LOBYTE(v12) = 0;
    goto LABEL_165;
  }
  LOBYTE(v12) = 0;
LABEL_166:

  return v12;
}

- (NSDate)dateReceived
{
  if (self->_hasRaw_dateReceived)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_dateReceived];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v130[38] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMProactiveHarvestingMail *)self uniqueID];
  uint64_t v4 = [(BMProactiveHarvestingMail *)self domainID];
  id v5 = [(BMProactiveHarvestingMail *)self absoluteTimestamp];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMProactiveHarvestingMail *)self absoluteTimestamp];
    [v7 timeIntervalSinceReferenceDate];
    objc_msgSend(v6, "numberWithDouble:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v9 = [(BMProactiveHarvestingMail *)self accountIdentifier];
  uint64_t v10 = [(BMProactiveHarvestingMail *)self messageIdentifier];
  v128 = [(BMProactiveHarvestingMail *)self fromField];
  int v127 = [(BMProactiveHarvestingMail *)self toField];
  v126 = [(BMProactiveHarvestingMail *)self ccField];
  v125 = [(BMProactiveHarvestingMail *)self bccField];
  v124 = [(BMProactiveHarvestingMail *)self _headersJSONArray];
  uint64_t v123 = [(BMProactiveHarvestingMail *)self subject];
  v122 = [(BMProactiveHarvestingMail *)self htmlContentData];
  if ([(BMProactiveHarvestingMail *)self hasIsFullyDownloaded])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isFullyDownloaded](self, "isFullyDownloaded"));
    id v121 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v121 = 0;
  }
  int v11 = [(BMProactiveHarvestingMail *)self htmlContent];
  v120 = [v11 base64EncodedStringWithOptions:0];

  v119 = [(BMProactiveHarvestingMail *)self textContent];
  v118 = [(BMProactiveHarvestingMail *)self securityMethod];
  uint64_t v117 = [(BMProactiveHarvestingMail *)self _accountHandlesJSONArray];
  int v12 = [(BMProactiveHarvestingMail *)self replyTo];
  v116 = [v12 jsonDictionary];

  int v115 = [(BMProactiveHarvestingMail *)self _mailboxIdentifiersJSONArray];
  v13 = [(BMProactiveHarvestingMail *)self listID];
  v114 = [v13 jsonDictionary];

  v113 = [(BMProactiveHarvestingMail *)self accountType];
  v112 = [(BMProactiveHarvestingMail *)self _attachmentsJSONArray];
  uint64_t v14 = [(BMProactiveHarvestingMail *)self fromHandle];
  uint64_t v111 = [v14 jsonDictionary];

  v110 = [(BMProactiveHarvestingMail *)self _toHandlesJSONArray];
  int v109 = [(BMProactiveHarvestingMail *)self _ccHandlesJSONArray];
  v108 = [(BMProactiveHarvestingMail *)self _bccHandlesJSONArray];
  v107 = [(BMProactiveHarvestingMail *)self contentProtection];
  v106 = [(BMProactiveHarvestingMail *)self personaId];
  uint64_t v105 = [(BMProactiveHarvestingMail *)self conversationId];
  v15 = [(BMProactiveHarvestingMail *)self dateReceived];
  if (v15)
  {
    v16 = NSNumber;
    v17 = [(BMProactiveHarvestingMail *)self dateReceived];
    [v17 timeIntervalSinceReferenceDate];
    objc_msgSend(v16, "numberWithDouble:");
    id v104 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v104 = 0;
  }

  if ([(BMProactiveHarvestingMail *)self hasMailCategories])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMProactiveHarvestingMail mailCategories](self, "mailCategories"));
    id v103 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v103 = 0;
  }
  if ([(BMProactiveHarvestingMail *)self hasIsNew])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isNew](self, "isNew"));
    id v102 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v102 = 0;
  }
  if ([(BMProactiveHarvestingMail *)self hasIsTwoFactorCode])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isTwoFactorCode](self, "isTwoFactorCode"));
    id v101 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v101 = 0;
  }
  if ([(BMProactiveHarvestingMail *)self hasIsFromMe])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isFromMe](self, "isFromMe"));
    id v100 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v100 = 0;
  }
  if ([(BMProactiveHarvestingMail *)self hasIsJunk])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isJunk](self, "isJunk"));
    id v99 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v99 = 0;
  }
  if ([(BMProactiveHarvestingMail *)self hasIsRead])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isRead](self, "isRead"));
    id v98 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v98 = 0;
  }
  if ([(BMProactiveHarvestingMail *)self hasIsVIP])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isVIP](self, "isVIP"));
    id v97 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v97 = 0;
  }
  if ([(BMProactiveHarvestingMail *)self hasIsFlagged])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isFlagged](self, "isFlagged"));
    id v96 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v96 = 0;
  }
  v129[0] = @"uniqueID";
  uint64_t v18 = v3;
  if (!v3)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v87 = (void *)v18;
  v130[0] = v18;
  v129[1] = @"domainID";
  uint64_t v19 = v4;
  if (!v4)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v86 = (void *)v19;
  v130[1] = v19;
  v129[2] = @"absoluteTimestamp";
  uint64_t v20 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v85 = (void *)v20;
  v130[2] = v20;
  v129[3] = @"accountIdentifier";
  uint64_t v21 = v9;
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v84 = (void *)v21;
  v130[3] = v21;
  v129[4] = @"messageIdentifier";
  uint64_t v22 = v10;
  if (!v10)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v83 = (void *)v22;
  v130[4] = v22;
  v129[5] = @"fromField";
  uint64_t v23 = (uint64_t)v128;
  if (!v128)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[5] = v23;
  v129[6] = @"toField";
  int v24 = v127;
  if (!v127)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[6] = v24;
  v129[7] = @"ccField";
  uint64_t v25 = (uint64_t)v126;
  if (!v126)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[7] = v25;
  v129[8] = @"bccField";
  uint64_t v26 = (uint64_t)v125;
  if (!v125)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[8] = v26;
  v129[9] = @"headers";
  uint64_t v27 = (uint64_t)v124;
  if (!v124)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  int v79 = (void *)v27;
  v130[9] = v27;
  v129[10] = @"subject";
  uint64_t v28 = (uint64_t)v123;
  if (!v123)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v93 = (void *)v28;
  v130[10] = v28;
  v129[11] = @"htmlContentData";
  uint64_t v29 = (uint64_t)v122;
  if (!v122)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v92 = (void *)v29;
  v130[11] = v29;
  v129[12] = @"isFullyDownloaded";
  uint64_t v30 = (uint64_t)v121;
  if (!v121)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v9;
  int v91 = (void *)v30;
  v130[12] = v30;
  v129[13] = @"htmlContent";
  uint64_t v32 = (uint64_t)v120;
  if (!v120)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v3;
  v90 = (void *)v32;
  v130[13] = v32;
  v129[14] = @"textContent";
  uint64_t v34 = (uint64_t)v119;
  if (!v119)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v34;
  v130[14] = v34;
  v129[15] = @"securityMethod";
  uint64_t v36 = (uint64_t)v118;
  if (!v118)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  int v78 = (void *)v36;
  v130[15] = v36;
  v129[16] = @"accountHandles";
  uint64_t v37 = (uint64_t)v117;
  if (!v117)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v77 = (void *)v37;
  v130[16] = v37;
  v129[17] = @"replyTo";
  uint64_t v38 = (uint64_t)v116;
  if (!v116)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v76 = (void *)v38;
  v130[17] = v38;
  v129[18] = @"mailboxIdentifiers";
  uint64_t v39 = (uint64_t)v115;
  if (!v115)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v75 = (void *)v39;
  v130[18] = v39;
  v129[19] = @"listID";
  uint64_t v40 = (uint64_t)v114;
  if (!v114)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v74 = (void *)v40;
  v130[19] = v40;
  v129[20] = @"accountType";
  uint64_t v41 = (uint64_t)v113;
  if (!v113)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = (void *)v41;
  v130[20] = v41;
  v129[21] = @"attachments";
  uint64_t v42 = (uint64_t)v112;
  if (!v112)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  int v72 = (void *)v42;
  v130[21] = v42;
  v129[22] = @"fromHandle";
  uint64_t v43 = (uint64_t)v111;
  if (!v111)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v71 = (void *)v43;
  v130[22] = v43;
  v129[23] = @"toHandles";
  uint64_t v44 = (uint64_t)v110;
  if (!v110)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v70 = (void *)v44;
  v130[23] = v44;
  v129[24] = @"ccHandles";
  uint64_t v45 = (uint64_t)v109;
  if (!v109)
  {
    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = (void *)v45;
  v130[24] = v45;
  v129[25] = @"bccHandles";
  uint64_t v46 = (uint64_t)v108;
  if (!v108)
  {
    uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v68 = (void *)v46;
  v130[25] = v46;
  v129[26] = @"contentProtection";
  uint64_t v47 = (uint64_t)v107;
  if (!v107)
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = (void *)v47;
  v130[26] = v47;
  v129[27] = @"personaId";
  uint64_t v48 = (uint64_t)v106;
  if (!v106)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  int v66 = (void *)v48;
  v130[27] = v48;
  v129[28] = @"conversationId";
  uint64_t v49 = (uint64_t)v105;
  if (!v105)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v95 = (void *)v4;
  v65 = (void *)v49;
  v130[28] = v49;
  v129[29] = @"dateReceived";
  uint64_t v50 = (uint64_t)v104;
  if (!v104)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v64 = (void *)v50;
  v130[29] = v50;
  v129[30] = @"mailCategories";
  uint64_t v51 = (uint64_t)v103;
  if (!v103)
  {
    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
  }
  v94 = v8;
  v63 = (void *)v51;
  v130[30] = v51;
  v129[31] = @"isNew";
  uint64_t v52 = (uint64_t)v102;
  if (!v102)
  {
    uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v81 = (void *)v25;
  uint64_t v61 = v52;
  v130[31] = v52;
  v129[32] = @"isTwoFactorCode";
  v53 = v101;
  if (!v101)
  {
    objc_msgSend(MEMORY[0x1E4F1CA98], "null", v52, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78,
    v53 = v79);
  }
  v80 = (void *)v26;
  v130[32] = v53;
  v129[33] = @"isFromMe";
  int v54 = v100;
  if (!v100)
  {
    int v54 = [MEMORY[0x1E4F1CA98] null];
  }
  v89 = (void *)v10;
  v130[33] = v54;
  v129[34] = @"isJunk";
  v55 = v99;
  if (!v99)
  {
    v55 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[34] = v55;
  v129[35] = @"isRead";
  uint64_t v56 = v98;
  if (!v98)
  {
    uint64_t v56 = [MEMORY[0x1E4F1CA98] null];
  }
  v82 = (void *)v23;
  v130[35] = v56;
  v129[36] = @"isVIP";
  v57 = v97;
  if (!v97)
  {
    v57 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[36] = v57;
  v129[37] = @"isFlagged";
  v58 = v96;
  if (!v96)
  {
    v58 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[37] = v58;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v130, v129, 38, v61);
  id v88 = (id)objc_claimAutoreleasedReturnValue();
  if (!v96) {

  }
  v59 = v35;
  if (!v97)
  {

    v59 = v35;
  }
  if (!v98)
  {

    v59 = v35;
  }
  if (!v99)
  {

    v59 = v35;
  }
  if (!v100)
  {

    v59 = v35;
  }
  if (!v101)
  {

    v59 = v35;
  }
  if (!v102)
  {

    v59 = v35;
  }
  if (!v103)
  {

    v59 = v35;
  }
  if (!v104)
  {

    v59 = v35;
  }
  if (!v105)
  {

    v59 = v35;
  }
  if (!v106)
  {

    v59 = v35;
  }
  if (!v107)
  {

    v59 = v35;
  }
  if (!v108)
  {

    v59 = v35;
  }
  if (!v109)
  {

    v59 = v35;
  }
  if (!v110)
  {

    v59 = v35;
  }
  if (!v111)
  {

    v59 = v35;
  }
  if (!v112)
  {

    v59 = v35;
  }
  if (!v113)
  {

    v59 = v35;
  }
  if (!v114)
  {

    v59 = v35;
  }
  if (!v115)
  {

    v59 = v35;
  }
  if (!v116)
  {

    v59 = v35;
  }
  if (!v117)
  {

    v59 = v35;
  }
  if (!v118)
  {

    v59 = v35;
  }
  if (!v119) {

  }
  if (!v120) {
  if (!v121)
  }

  if (!v122) {
  if (!v123)
  }

  if (!v124) {
  if (!v125)
  }

  if (!v126) {
  if (!v127)
  }

  if (v128)
  {
    if (v89) {
      goto LABEL_176;
    }
  }
  else
  {

    if (v89)
    {
LABEL_176:
      if (v31) {
        goto LABEL_177;
      }
      goto LABEL_185;
    }
  }

  if (v31)
  {
LABEL_177:
    if (v94) {
      goto LABEL_178;
    }
    goto LABEL_186;
  }
LABEL_185:

  if (v94)
  {
LABEL_178:
    if (v95) {
      goto LABEL_179;
    }
LABEL_187:

    if (v33) {
      goto LABEL_180;
    }
    goto LABEL_188;
  }
LABEL_186:

  if (!v95) {
    goto LABEL_187;
  }
LABEL_179:
  if (v33) {
    goto LABEL_180;
  }
LABEL_188:

LABEL_180:

  return v88;
}

- (id)_bccHandlesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMProactiveHarvestingMail *)self bccHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_ccHandlesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMProactiveHarvestingMail *)self ccHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_toHandlesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMProactiveHarvestingMail *)self toHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_attachmentsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMProactiveHarvestingMail *)self attachments];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_mailboxIdentifiersJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMProactiveHarvestingMail *)self mailboxIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_accountHandlesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMProactiveHarvestingMail *)self accountHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_headersJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMProactiveHarvestingMail *)self headers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMProactiveHarvestingMail)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v591[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"uniqueID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"domainID"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v439 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v439 = v9;
LABEL_7:
      uint64_t v10 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
      v437 = self;
      v441 = (void *)v10;
      if (!v10 || (long long v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v436 = 0;
LABEL_23:
        uint64_t v35 = [v6 objectForKeyedSubscript:@"accountIdentifier"];
        v440 = (void *)v35;
        if (v35 && (uint64_t v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v55 = 0;
              uint64_t v25 = 0;
              uint64_t v21 = v439;
              a4 = v436;
              self = v437;
              goto LABEL_467;
            }
            id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v51 = v6;
            uint64_t v52 = *MEMORY[0x1E4F502C8];
            uint64_t v584 = *MEMORY[0x1E4F28568];
            id v433 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accountIdentifier"];
            id v585 = v433;
            uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v585 forKeys:&v584 count:1];
            uint64_t v54 = v52;
            id v6 = v51;
            v435 = (void *)v53;
            v55 = 0;
            uint64_t v25 = 0;
            *a4 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v54, 2);
            uint64_t v21 = v439;
            a4 = v436;
            goto LABEL_101;
          }
          id v432 = v36;
        }
        else
        {
          id v432 = 0;
        }
        uint64_t v37 = [v6 objectForKeyedSubscript:@"messageIdentifier"];
        v435 = (void *)v37;
        if (!v37 || (uint64_t v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v433 = 0;
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v433 = v38;
LABEL_29:
          uint64_t v39 = [v6 objectForKeyedSubscript:@"fromField"];
          v431 = (void *)v39;
          if (!v39 || (uint64_t v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v430 = 0;
            goto LABEL_32;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v430 = v40;
LABEL_32:
            uint64_t v41 = [v6 objectForKeyedSubscript:@"toField"];
            v429 = (void *)v41;
            if (!v41 || (uint64_t v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v428 = 0;
              goto LABEL_35;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v428 = v42;
LABEL_35:
              uint64_t v43 = [v6 objectForKeyedSubscript:@"ccField"];
              v444 = v43;
              if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v427 = 0;
LABEL_38:
                v438 = v6;
                uint64_t v44 = [v6 objectForKeyedSubscript:@"bccField"];
                v419 = v9;
                v426 = (void *)v44;
                if (v44 && (uint64_t v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (a4)
                    {
                      id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v89 = *MEMORY[0x1E4F502C8];
                      uint64_t v574 = *MEMORY[0x1E4F28568];
                      uint64_t v46 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bccField"];
                      v575 = v46;
                      uint64_t v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v575 forKeys:&v574 count:1];
                      int v91 = v88;
                      uint64_t v43 = v444;
                      v443 = (void *)v90;
                      id v425 = 0;
                      uint64_t v25 = 0;
                      *a4 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v89, 2);
                      uint64_t v21 = v439;
                      a4 = v436;
                      v55 = v432;
                      id v6 = v438;

                      goto LABEL_461;
                    }
                    id v425 = 0;
                    uint64_t v25 = 0;
                    uint64_t v21 = v439;
                    a4 = v436;
                    v55 = v432;
                    id v6 = v438;
                    goto LABEL_462;
                  }
                  id v425 = v45;
                }
                else
                {
                  id v425 = 0;
                }
                uint64_t v46 = [v438 objectForKeyedSubscript:@"headers"];
                uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
                int v48 = [v46 isEqual:v47];

                id v418 = v8;
                if (v48)
                {
                  uint64_t v49 = a4;
                  v421 = v7;

                  uint64_t v46 = 0;
                }
                else
                {
                  if (v46)
                  {
                    objc_opt_class();
                    id v6 = v438;
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (a4)
                      {
                        id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v100 = *MEMORY[0x1E4F502C8];
                        uint64_t v572 = *MEMORY[0x1E4F28568];
                        v442 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"headers"];
                        v573 = v442;
                        id v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v573 forKeys:&v572 count:1];
                        uint64_t v25 = 0;
                        *a4 = (id)[v99 initWithDomain:v100 code:2 userInfo:v87];
                        uint64_t v21 = v439;
                        a4 = v436;
                        v55 = v432;
                        uint64_t v43 = v444;
                        goto LABEL_460;
                      }
                      uint64_t v25 = 0;
                      uint64_t v21 = v439;
                      a4 = v436;
                      v55 = v432;
                      uint64_t v43 = v444;
                      goto LABEL_461;
                    }
                    uint64_t v49 = a4;
                    v421 = v7;
                    goto LABEL_74;
                  }
                  uint64_t v49 = a4;
                  v421 = v7;
                }
                id v6 = v438;
LABEL_74:
                v442 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v46, "count"));
                long long v477 = 0u;
                long long v478 = 0u;
                long long v479 = 0u;
                long long v480 = 0u;
                obuint64_t j = v46;
                uint64_t v78 = [obj countByEnumeratingWithState:&v477 objects:v571 count:16];
                if (!v78) {
                  goto LABEL_84;
                }
                uint64_t v79 = v78;
                uint64_t v80 = *(void *)v478;
                while (1)
                {
                  for (uint64_t i = 0; i != v79; ++i)
                  {
                    if (*(void *)v478 != v80) {
                      objc_enumerationMutation(obj);
                    }
                    v82 = *(void **)(*((void *)&v477 + 1) + 8 * i);
                    objc_opt_class();
                    uint64_t v43 = v444;
                    if (objc_opt_isKindOfClass())
                    {
                      if (v49)
                      {
                        id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v93 = *MEMORY[0x1E4F502C8];
                        uint64_t v569 = *MEMORY[0x1E4F28568];
                        id v83 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"headers"];
                        id v570 = v83;
                        v94 = (void *)MEMORY[0x1E4F1C9E8];
                        v95 = &v570;
                        id v96 = &v569;
LABEL_93:
                        uint64_t v97 = [v94 dictionaryWithObjects:v95 forKeys:v96 count:1];
                        id v98 = v92;
                        uint64_t v43 = v444;
                        id v416 = (id)v97;
                        uint64_t v25 = 0;
                        id *v49 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v93, 2);
                        id v87 = obj;
                        uint64_t v7 = v421;
                        uint64_t v21 = v439;
                        a4 = v436;
                        v55 = v432;

                        goto LABEL_459;
                      }
LABEL_102:
                      uint64_t v25 = 0;
                      id v87 = obj;
                      uint64_t v46 = obj;
                      uint64_t v7 = v421;
                      uint64_t v21 = v439;
                      a4 = v436;
                      v55 = v432;
                      goto LABEL_460;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (v49)
                      {
                        id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v93 = *MEMORY[0x1E4F502C8];
                        uint64_t v567 = *MEMORY[0x1E4F28568];
                        id v83 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"headers"];
                        id v568 = v83;
                        v94 = (void *)MEMORY[0x1E4F1C9E8];
                        v95 = &v568;
                        id v96 = &v567;
                        goto LABEL_93;
                      }
                      goto LABEL_102;
                    }
                    id v83 = v82;
                    v84 = [BMProactiveHarvestingMailHeaderEntry alloc];
                    id v476 = 0;
                    int v85 = [(BMProactiveHarvestingMailHeaderEntry *)v84 initWithJSONDictionary:v83 error:&v476];
                    id v86 = v476;
                    if (v86)
                    {
                      id v417 = v86;
                      if (v49) {
                        id *v49 = v86;
                      }

                      uint64_t v25 = 0;
                      id v87 = obj;
                      uint64_t v7 = v421;
                      uint64_t v21 = v439;
                      a4 = v436;
                      v55 = v432;
                      uint64_t v43 = v444;
                      goto LABEL_458;
                    }
                    [v442 addObject:v85];
                  }
                  uint64_t v79 = [obj countByEnumeratingWithState:&v477 objects:v571 count:16];
                  id v6 = v438;
                  if (!v79)
                  {
LABEL_84:

                    id v83 = [v6 objectForKeyedSubscript:@"subject"];
                    if (!v83)
                    {
                      id v87 = 0;
                      uint64_t v43 = v444;
                      goto LABEL_110;
                    }
                    objc_opt_class();
                    uint64_t v43 = v444;
                    if (objc_opt_isKindOfClass())
                    {
                      id v87 = 0;
                      goto LABEL_110;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v87 = v83;
LABEL_110:
                      int v109 = [v438 objectForKeyedSubscript:@"htmlContentData"];
                      id v412 = v87;
                      if (!v109)
                      {
                        id v417 = 0;
                        uint64_t v7 = v421;
                        goto LABEL_118;
                      }
                      objc_opt_class();
                      uint64_t v7 = v421;
                      if (objc_opt_isKindOfClass())
                      {
                        id v417 = 0;
LABEL_118:
                        uint64_t v110 = [v438 objectForKeyedSubscript:@"isFullyDownloaded"];
                        uint64_t v111 = v49;
                        v411 = (void *)v110;
                        if (v110 && (v112 = (void *)v110, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v113 = v112;
                            goto LABEL_121;
                          }
                          if (!v49)
                          {
                            id v113 = 0;
                            uint64_t v25 = 0;
                            uint64_t v21 = v439;
                            a4 = v436;
                            v55 = v432;
                            goto LABEL_456;
                          }
                          id v134 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v135 = *MEMORY[0x1E4F502C8];
                          uint64_t v561 = *MEMORY[0x1E4F28568];
                          id v136 = [NSString alloc];
                          uint64_t v355 = objc_opt_class();
                          v137 = v136;
                          uint64_t v43 = v444;
                          id v409 = (id)[v137 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v355, @"isFullyDownloaded"];
                          id v562 = v409;
                          v410 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v562 forKeys:&v561 count:1];
                          id v138 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v135, 2);
                          id v113 = 0;
                          uint64_t v25 = 0;
                          *uint64_t v111 = v138;
                        }
                        else
                        {
                          id v113 = 0;
LABEL_121:
                          uint64_t v114 = [v438 objectForKeyedSubscript:@"htmlContent"];
                          v410 = (void *)v114;
                          if (!v114 || (int v115 = (void *)v114, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v409 = 0;
LABEL_124:
                            uint64_t v116 = [v438 objectForKeyedSubscript:@"textContent"];
                            v408 = (void *)v116;
                            if (v116 && (uint64_t v117 = (void *)v116, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v407 = v117;
                                goto LABEL_127;
                              }
                              if (!v111)
                              {
                                id v407 = 0;
                                uint64_t v25 = 0;
                                uint64_t v21 = v439;
                                a4 = v436;
                                v55 = v432;
                                uint64_t v43 = v444;
                                goto LABEL_454;
                              }
                              id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v145 = *MEMORY[0x1E4F502C8];
                              uint64_t v557 = *MEMORY[0x1E4F28568];
                              id v405 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"textContent"];
                              id v558 = v405;
                              v406 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v558 forKeys:&v557 count:1];
                              id v146 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v145, 2);
                              id v407 = 0;
                              uint64_t v25 = 0;
                              *uint64_t v111 = v146;
                            }
                            else
                            {
                              id v407 = 0;
LABEL_127:
                              uint64_t v118 = [v438 objectForKeyedSubscript:@"securityMethod"];
                              v406 = (void *)v118;
                              if (!v118 || (v119 = (void *)v118, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v405 = 0;
                                goto LABEL_130;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v405 = v119;
LABEL_130:
                                v120 = [v438 objectForKeyedSubscript:@"accountHandles"];
                                id v121 = [MEMORY[0x1E4F1CA98] null];
                                int v122 = [v120 isEqual:v121];

                                if (v122)
                                {
                                  v399 = v109;

                                  goto LABEL_159;
                                }
                                uint64_t v43 = v444;
                                id v87 = v412;
                                if (v120)
                                {
                                  objc_opt_class();
                                  id v413 = v120;
                                  if (objc_opt_isKindOfClass())
                                  {
                                    v399 = v109;
                                    uint64_t v123 = v120;
                                    goto LABEL_160;
                                  }
                                  if (v111)
                                  {
                                    id v168 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v169 = *MEMORY[0x1E4F502C8];
                                    uint64_t v553 = *MEMORY[0x1E4F28568];
                                    v414 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"accountHandles"];
                                    v554 = v414;
                                    uint64_t v170 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v554 forKeys:&v553 count:1];
                                    uint64_t v171 = v168;
                                    uint64_t v43 = v444;
                                    uint64_t v172 = v169;
                                    id v87 = v412;
                                    v402 = (void *)v170;
                                    uint64_t v25 = 0;
                                    *uint64_t v111 = (id)objc_msgSend(v171, "initWithDomain:code:userInfo:", v172, 2);
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;

                                    goto LABEL_451;
                                  }
                                  uint64_t v25 = 0;
                                  uint64_t v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
LABEL_452:

LABEL_453:
LABEL_454:

LABEL_455:
LABEL_456:

LABEL_457:
LABEL_458:

LABEL_459:
                                  uint64_t v46 = obj;

LABEL_460:
                                  uint64_t v9 = v419;
                                  id v6 = v438;
                                  id v8 = v418;

LABEL_461:
LABEL_462:

LABEL_463:
LABEL_464:

LABEL_465:
                                  self = v437;

LABEL_466:
LABEL_467:

                                  goto LABEL_468;
                                }
                                v399 = v109;
LABEL_159:
                                uint64_t v123 = 0;
LABEL_160:
                                v414 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v123, "count"));
                                long long v472 = 0u;
                                long long v473 = 0u;
                                long long v474 = 0u;
                                long long v475 = 0u;
                                id v413 = v123;
                                uint64_t v147 = [v413 countByEnumeratingWithState:&v472 objects:v552 count:16];
                                if (v147)
                                {
                                  uint64_t v148 = v147;
                                  uint64_t v149 = *(void *)v473;
                                  id v396 = v113;
LABEL_162:
                                  v150 = v111;
                                  int v151 = v7;
                                  uint64_t v152 = 0;
                                  while (1)
                                  {
                                    if (*(void *)v473 != v149) {
                                      objc_enumerationMutation(v413);
                                    }
                                    uint64_t v153 = *(void **)(*((void *)&v472 + 1) + 8 * v152);
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass()) {
                                      break;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v150)
                                      {
                                        id v164 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v161 = *MEMORY[0x1E4F502C8];
                                        uint64_t v548 = *MEMORY[0x1E4F28568];
                                        v395 = (BMProactiveHarvestingNamedHandle *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accountHandles"];
                                        v549 = v395;
                                        uint64_t v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v549 forKeys:&v548 count:1];
                                        int v163 = v164;
                                        goto LABEL_178;
                                      }
                                      goto LABEL_179;
                                    }
                                    id v154 = v153;
                                    [v414 addObject:v154];

                                    if (v148 == ++v152)
                                    {
                                      uint64_t v148 = [v413 countByEnumeratingWithState:&v472 objects:v552 count:16];
                                      uint64_t v7 = v151;
                                      uint64_t v111 = v150;
                                      id v113 = v396;
                                      if (!v148) {
                                        goto LABEL_169;
                                      }
                                      goto LABEL_162;
                                    }
                                  }
                                  if (v150)
                                  {
                                    id v160 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v161 = *MEMORY[0x1E4F502C8];
                                    uint64_t v550 = *MEMORY[0x1E4F28568];
                                    v395 = (BMProactiveHarvestingNamedHandle *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"accountHandles"];
                                    v551 = v395;
                                    uint64_t v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v551 forKeys:&v550 count:1];
                                    int v163 = v160;
LABEL_178:
                                    id v404 = (id)v162;
                                    uint64_t v7 = v151;
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    int v109 = v399;
                                    uint64_t v25 = 0;
                                    id *v150 = (id)objc_msgSend(v163, "initWithDomain:code:userInfo:", v161, 2);
                                    v401 = v413;
                                    uint64_t v43 = v444;
                                    id v87 = v412;
                                    id v113 = v396;
                                    goto LABEL_449;
                                  }
LABEL_179:
                                  uint64_t v25 = 0;
                                  uint64_t v7 = v151;
                                  uint64_t v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  uint64_t v43 = v444;
                                  id v87 = v412;
                                  int v109 = v399;
                                  id v113 = v396;

                                  goto LABEL_451;
                                }
LABEL_169:

                                uint64_t v155 = [v438 objectForKeyedSubscript:@"replyTo"];
                                v401 = (void *)v155;
                                if (!v155
                                  || (v156 = (void *)v155, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v395 = 0;
                                  goto LABEL_172;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  int v109 = v399;
                                  if (v111)
                                  {
                                    id v198 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v199 = *MEMORY[0x1E4F502C8];
                                    uint64_t v546 = *MEMORY[0x1E4F28568];
                                    v395 = (BMProactiveHarvestingNamedHandle *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"replyTo"];
                                    v547 = v395;
                                    id v404 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v547 forKeys:&v546 count:1];
                                    id v200 = (id)objc_msgSend(v198, "initWithDomain:code:userInfo:", v199, 2);
                                    uint64_t v25 = 0;
                                    *uint64_t v111 = v200;
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    uint64_t v43 = v444;
                                    id v87 = v412;
                                    goto LABEL_449;
                                  }
                                  uint64_t v25 = 0;
                                  uint64_t v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  uint64_t v43 = v444;
                                  id v87 = v412;
                                  goto LABEL_450;
                                }
                                id v188 = v156;
                                BOOL v189 = [BMProactiveHarvestingNamedHandle alloc];
                                id v471 = 0;
                                v395 = [(BMProactiveHarvestingNamedHandle *)v189 initWithJSONDictionary:v188 error:&v471];
                                id v190 = v471;
                                if (v190)
                                {
                                  v191 = v190;
                                  id v404 = v188;
                                  uint64_t v21 = v439;
                                  v192 = v111;
                                  a4 = v436;
                                  v55 = v432;
                                  id v87 = v412;
                                  if (v192) {
                                    id *v192 = v190;
                                  }

                                  uint64_t v25 = 0;
                                  v401 = v404;
                                  uint64_t v43 = v444;
                                  int v109 = v399;
LABEL_449:

LABEL_450:
LABEL_451:

                                  goto LABEL_452;
                                }

LABEL_172:
                                int v157 = [v438 objectForKeyedSubscript:@"mailboxIdentifiers"];
                                v158 = [MEMORY[0x1E4F1CA98] null];
                                int v159 = [v157 isEqual:v158];

                                if (v159)
                                {

                                  int v157 = 0;
                                  goto LABEL_189;
                                }
                                id v87 = v412;
                                int v109 = v399;
                                if (v157)
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    id v404 = v157;
                                    if (!v111)
                                    {
                                      uint64_t v25 = 0;
                                      uint64_t v21 = v439;
                                      a4 = v436;
                                      v55 = v432;
                                      uint64_t v43 = v444;
                                      goto LABEL_449;
                                    }
                                    id v201 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v202 = *MEMORY[0x1E4F502C8];
                                    uint64_t v544 = *MEMORY[0x1E4F28568];
                                    v403 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"mailboxIdentifiers"];
                                    v545 = v403;
                                    uint64_t v203 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v545 forKeys:&v544 count:1];
                                    uint64_t v204 = v202;
                                    id v87 = v412;
                                    v392 = (void *)v203;
                                    uint64_t v25 = 0;
                                    *uint64_t v111 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v204, 2);
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    uint64_t v43 = v444;

                                    goto LABEL_448;
                                  }
                                }
LABEL_189:
                                v403 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v157, "count"));
                                long long v467 = 0u;
                                long long v468 = 0u;
                                long long v469 = 0u;
                                long long v470 = 0u;
                                id v404 = v157;
                                uint64_t v173 = [v404 countByEnumeratingWithState:&v467 objects:v543 count:16];
                                if (v173)
                                {
                                  uint64_t v174 = v173;
                                  uint64_t v175 = *(void *)v468;
                                  id v397 = v113;
LABEL_191:
                                  v176 = v111;
                                  uint64_t v177 = v7;
                                  uint64_t v178 = 0;
                                  while (1)
                                  {
                                    if (*(void *)v468 != v175) {
                                      objc_enumerationMutation(v404);
                                    }
                                    v179 = *(void **)(*((void *)&v467 + 1) + 8 * v178);
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass()) {
                                      break;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v176)
                                      {
                                        id v197 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v194 = *MEMORY[0x1E4F502C8];
                                        uint64_t v539 = *MEMORY[0x1E4F28568];
                                        v388 = (BMProactiveHarvestingNamedHandle *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"mailboxIdentifiers"];
                                        v540 = v388;
                                        uint64_t v195 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v540 forKeys:&v539 count:1];
                                        v196 = v197;
                                        goto LABEL_221;
                                      }
                                      goto LABEL_225;
                                    }
                                    id v180 = v179;
                                    [v403 addObject:v180];

                                    if (v174 == ++v178)
                                    {
                                      uint64_t v174 = [v404 countByEnumeratingWithState:&v467 objects:v543 count:16];
                                      uint64_t v7 = v177;
                                      uint64_t v111 = v176;
                                      id v113 = v397;
                                      if (!v174) {
                                        goto LABEL_198;
                                      }
                                      goto LABEL_191;
                                    }
                                  }
                                  if (v176)
                                  {
                                    id v193 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v194 = *MEMORY[0x1E4F502C8];
                                    uint64_t v541 = *MEMORY[0x1E4F28568];
                                    v388 = (BMProactiveHarvestingNamedHandle *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"mailboxIdentifiers"];
                                    v542 = v388;
                                    uint64_t v195 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v542 forKeys:&v541 count:1];
                                    v196 = v193;
LABEL_221:
                                    id v385 = (id)v195;
                                    uint64_t v7 = v177;
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    int v109 = v399;
                                    uint64_t v25 = 0;
                                    id *v176 = (id)objc_msgSend(v196, "initWithDomain:code:userInfo:", v194, 2);
                                    v391 = v404;
                                    uint64_t v43 = v444;
                                    id v87 = v412;
                                    id v113 = v397;
                                    goto LABEL_445;
                                  }
LABEL_225:
                                  uint64_t v25 = 0;
                                  uint64_t v7 = v177;
                                  uint64_t v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  uint64_t v43 = v444;
                                  id v87 = v412;
                                  int v109 = v399;
                                  id v113 = v397;

                                  goto LABEL_448;
                                }
LABEL_198:

                                uint64_t v181 = [v438 objectForKeyedSubscript:@"listID"];
                                v391 = (void *)v181;
                                if (v181)
                                {
                                  int v182 = (void *)v181;
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    objc_opt_class();
                                    int v109 = v399;
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v221 = v182;
                                      v222 = [BMProactiveHarvestingNamedHandle alloc];
                                      id v466 = 0;
                                      id v386 = v221;
                                      v388 = [(BMProactiveHarvestingNamedHandle *)v222 initWithJSONDictionary:v221 error:&v466];
                                      id v223 = v466;
                                      if (!v223)
                                      {

                                        goto LABEL_201;
                                      }
                                      v224 = v223;
                                      uint64_t v21 = v439;
                                      v225 = v111;
                                      a4 = v436;
                                      v55 = v432;
                                      id v87 = v412;
                                      if (v225) {
                                        id *v225 = v223;
                                      }

                                      uint64_t v25 = 0;
                                      v226 = v386;
                                      v391 = v386;
                                      uint64_t v43 = v444;
                                      int v109 = v399;
                                      goto LABEL_446;
                                    }
                                    if (v111)
                                    {
                                      id v424 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v227 = *MEMORY[0x1E4F502C8];
                                      uint64_t v537 = *MEMORY[0x1E4F28568];
                                      v388 = (BMProactiveHarvestingNamedHandle *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"listID"];
                                      v538 = v388;
                                      uint64_t v228 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v538 forKeys:&v537 count:1];
                                      id v229 = (id)[v424 initWithDomain:v227 code:2 userInfo:v228];
                                      uint64_t v25 = 0;
                                      *uint64_t v111 = v229;
                                      v226 = (void *)v228;
                                      uint64_t v21 = v439;
                                      a4 = v436;
                                      v55 = v432;
                                      uint64_t v43 = v444;
                                      id v87 = v412;
                                      goto LABEL_446;
                                    }
                                    uint64_t v25 = 0;
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    uint64_t v43 = v444;
                                    id v87 = v412;
LABEL_447:

LABEL_448:
                                    goto LABEL_449;
                                  }
                                }
                                v388 = 0;
                                int v109 = v399;
LABEL_201:
                                uint64_t v183 = [v438 objectForKeyedSubscript:@"accountType"];
                                v384 = (void *)v183;
                                if (!v183
                                  || (int v184 = (void *)v183, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v385 = 0;
                                  goto LABEL_204;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  if (v111)
                                  {
                                    id v230 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v231 = *MEMORY[0x1E4F502C8];
                                    uint64_t v535 = *MEMORY[0x1E4F28568];
                                    id v387 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accountType"];
                                    id v536 = v387;
                                    v390 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v536 forKeys:&v535 count:1];
                                    id v232 = (id)objc_msgSend(v230, "initWithDomain:code:userInfo:", v231, 2);
                                    id v385 = 0;
                                    uint64_t v25 = 0;
                                    *uint64_t v111 = v232;
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    uint64_t v43 = v444;
                                    id v87 = v412;

                                    goto LABEL_443;
                                  }
                                  id v385 = 0;
                                  uint64_t v25 = 0;
                                  uint64_t v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  uint64_t v43 = v444;
                                  id v87 = v412;
                                  goto LABEL_444;
                                }
                                id v385 = v184;
LABEL_204:
                                int v185 = [v438 objectForKeyedSubscript:@"attachments"];
                                int v186 = [MEMORY[0x1E4F1CA98] null];
                                int v187 = [v185 isEqual:v186];

                                if (v187)
                                {
                                  v400 = v109;
                                  v423 = v7;

                                  int v185 = 0;
                                  goto LABEL_231;
                                }
                                if (v185)
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    id v387 = v185;
                                    if (v111)
                                    {
                                      id v239 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v240 = *MEMORY[0x1E4F502C8];
                                      uint64_t v533 = *MEMORY[0x1E4F28568];
                                      v389 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"attachments"];
                                      v534 = v389;
                                      v383 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v534 forKeys:&v533 count:1];
                                      uint64_t v25 = 0;
                                      *uint64_t v111 = (id)objc_msgSend(v239, "initWithDomain:code:userInfo:", v240, 2);
                                      uint64_t v21 = v439;
                                      a4 = v436;
                                      v55 = v432;
                                      uint64_t v43 = v444;
                                      id v87 = v412;

                                      goto LABEL_442;
                                    }
                                    uint64_t v25 = 0;
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    uint64_t v43 = v444;
                                    id v87 = v412;
                                    goto LABEL_443;
                                  }
                                }
                                v400 = v109;
                                v423 = v7;
LABEL_231:
                                v389 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v185, "count"));
                                long long v462 = 0u;
                                long long v463 = 0u;
                                long long v464 = 0u;
                                long long v465 = 0u;
                                id v387 = v185;
                                uint64_t v205 = [v387 countByEnumeratingWithState:&v462 objects:v532 count:16];
                                id v398 = v113;
                                if (v205)
                                {
                                  uint64_t v206 = v205;
                                  uint64_t v207 = *(void *)v463;
LABEL_233:
                                  v208 = v111;
                                  uint64_t v209 = 0;
                                  while (1)
                                  {
                                    if (*(void *)v463 != v207) {
                                      objc_enumerationMutation(v387);
                                    }
                                    v210 = *(void **)(*((void *)&v462 + 1) + 8 * v209);
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass()) {
                                      break;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v208)
                                      {
                                        id v237 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v234 = *MEMORY[0x1E4F502C8];
                                        uint64_t v528 = *MEMORY[0x1E4F28568];
                                        v379 = (BMProactiveHarvestingNamedHandle *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"attachments"];
                                        v529 = v379;
                                        uint64_t v235 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v529 forKeys:&v528 count:1];
                                        v236 = v237;
                                        goto LABEL_264;
                                      }
                                      goto LABEL_271;
                                    }
                                    v211 = v210;
                                    v212 = [BMProactiveHarvestingContentAttachment alloc];
                                    id v461 = 0;
                                    v213 = [(BMProactiveHarvestingContentAttachment *)v212 initWithJSONDictionary:v211 error:&v461];
                                    id v214 = v461;
                                    if (v214)
                                    {
                                      id v381 = v214;
                                      v379 = v211;
                                      if (v208) {
                                        id *v208 = v214;
                                      }

                                      uint64_t v25 = 0;
                                      v382 = v387;
                                      uint64_t v7 = v423;
                                      uint64_t v21 = v439;
                                      a4 = v436;
                                      v55 = v432;
                                      uint64_t v43 = v444;
                                      id v87 = v412;
                                      int v109 = v400;
                                      id v113 = v398;
                                      goto LABEL_439;
                                    }
                                    [v389 addObject:v213];

                                    if (v206 == ++v209)
                                    {
                                      uint64_t v206 = [v387 countByEnumeratingWithState:&v462 objects:v532 count:16];
                                      uint64_t v111 = v208;
                                      id v113 = v398;
                                      if (!v206) {
                                        goto LABEL_241;
                                      }
                                      goto LABEL_233;
                                    }
                                  }
                                  if (v208)
                                  {
                                    id v233 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v234 = *MEMORY[0x1E4F502C8];
                                    uint64_t v530 = *MEMORY[0x1E4F28568];
                                    v379 = (BMProactiveHarvestingNamedHandle *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"attachments"];
                                    v531 = v379;
                                    uint64_t v235 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v531 forKeys:&v530 count:1];
                                    v236 = v233;
LABEL_264:
                                    uint64_t v25 = 0;
                                    id *v208 = (id)[v236 initWithDomain:v234 code:2 userInfo:v235];
                                    v238 = (void *)v235;
                                    v382 = v387;
                                    goto LABEL_265;
                                  }
LABEL_271:
                                  uint64_t v25 = 0;
                                  uint64_t v7 = v423;
                                  uint64_t v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  uint64_t v43 = v444;
                                  id v87 = v412;
                                  int v109 = v400;
                                  id v113 = v398;

LABEL_442:
LABEL_443:

LABEL_444:
LABEL_445:
                                  v226 = v385;
LABEL_446:

                                  goto LABEL_447;
                                }
LABEL_241:

                                uint64_t v215 = [v438 objectForKeyedSubscript:@"fromHandle"];
                                v382 = (void *)v215;
                                if (!v215
                                  || (v216 = (void *)v215, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v217 = 0;
                                  goto LABEL_244;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  if (v111)
                                  {
                                    id v259 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v260 = *MEMORY[0x1E4F502C8];
                                    uint64_t v526 = *MEMORY[0x1E4F28568];
                                    v379 = (BMProactiveHarvestingNamedHandle *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"fromHandle"];
                                    v527 = v379;
                                    uint64_t v261 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v527 forKeys:&v526 count:1];
                                    id v262 = (id)[v259 initWithDomain:v260 code:2 userInfo:v261];
                                    uint64_t v25 = 0;
                                    *uint64_t v111 = v262;
                                    v238 = (void *)v261;
                                    uint64_t v7 = v423;
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    uint64_t v43 = v444;
                                    id v87 = v412;
                                    int v109 = v400;
                                    goto LABEL_440;
                                  }
                                  uint64_t v25 = 0;
                                  uint64_t v7 = v423;
                                  uint64_t v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  uint64_t v43 = v444;
                                  id v87 = v412;
                                  int v109 = v400;
                                  goto LABEL_441;
                                }
                                id v254 = v216;
                                v255 = [BMProactiveHarvestingNamedHandle alloc];
                                id v460 = 0;
                                id v256 = v254;
                                v379 = [(BMProactiveHarvestingNamedHandle *)v255 initWithJSONDictionary:v254 error:&v460];
                                id v257 = v460;
                                if (v257)
                                {
                                  v258 = v257;
                                  if (v111) {
                                    *uint64_t v111 = v257;
                                  }

                                  uint64_t v25 = 0;
                                  v238 = v256;
                                  v382 = v256;
LABEL_265:
                                  uint64_t v7 = v423;
                                  uint64_t v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  uint64_t v43 = v444;
                                  id v87 = v412;
                                  int v109 = v400;
                                  id v113 = v398;
LABEL_440:

LABEL_441:
                                  goto LABEL_442;
                                }

                                id v113 = v398;
                                v217 = v379;
LABEL_244:
                                v379 = v217;
                                v218 = [v438 objectForKeyedSubscript:@"toHandles"];
                                v219 = [MEMORY[0x1E4F1CA98] null];
                                int v220 = [v218 isEqual:v219];

                                if (v220)
                                {

                                  goto LABEL_275;
                                }
                                if (v218)
                                {
                                  objc_opt_class();
                                  id v381 = v218;
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (v111)
                                    {
                                      id v282 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v283 = *MEMORY[0x1E4F502C8];
                                      uint64_t v524 = *MEMORY[0x1E4F28568];
                                      v380 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"toHandles"];
                                      v525 = v380;
                                      v377 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v525 forKeys:&v524 count:1];
                                      uint64_t v25 = 0;
                                      *uint64_t v111 = (id)objc_msgSend(v282, "initWithDomain:code:userInfo:", v283, 2);
                                      uint64_t v7 = v423;
                                      uint64_t v21 = v439;
                                      a4 = v436;
                                      v55 = v432;
                                      uint64_t v43 = v444;
                                      id v87 = v412;
                                      int v109 = v400;
                                      goto LABEL_438;
                                    }
                                    uint64_t v25 = 0;
                                    uint64_t v7 = v423;
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    uint64_t v43 = v444;
                                    id v87 = v412;
                                    int v109 = v400;
LABEL_439:
                                    v238 = v381;
                                    goto LABEL_440;
                                  }
                                  v241 = v218;
                                }
                                else
                                {
LABEL_275:
                                  v241 = 0;
                                }
                                v394 = v111;
                                v380 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v241, "count"));
                                long long v456 = 0u;
                                long long v457 = 0u;
                                long long v458 = 0u;
                                long long v459 = 0u;
                                id v381 = v241;
                                uint64_t v242 = [v381 countByEnumeratingWithState:&v456 objects:v523 count:16];
                                if (!v242) {
                                  goto LABEL_286;
                                }
                                uint64_t v243 = v242;
                                uint64_t v244 = *(void *)v457;
                                while (1)
                                {
                                  for (uint64_t j = 0; j != v243; ++j)
                                  {
                                    if (*(void *)v457 != v244) {
                                      objc_enumerationMutation(v381);
                                    }
                                    v246 = *(void **)(*((void *)&v456 + 1) + 8 * j);
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      if (v394)
                                      {
                                        id v263 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v264 = *MEMORY[0x1E4F502C8];
                                        uint64_t v521 = *MEMORY[0x1E4F28568];
                                        v378 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"toHandles"];
                                        v522 = v378;
                                        uint64_t v265 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v522 forKeys:&v521 count:1];
                                        v266 = v263;
                                        goto LABEL_303;
                                      }
LABEL_324:
                                      uint64_t v25 = 0;
                                      v377 = v381;
                                      goto LABEL_325;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (!v394) {
                                        goto LABEL_324;
                                      }
                                      id v267 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v264 = *MEMORY[0x1E4F502C8];
                                      uint64_t v519 = *MEMORY[0x1E4F28568];
                                      v378 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"toHandles"];
                                      v520 = v378;
                                      uint64_t v265 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v520 forKeys:&v519 count:1];
                                      v266 = v267;
LABEL_303:
                                      id v376 = (id)v265;
                                      uint64_t v25 = 0;
                                      id *v394 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v264, 2);
LABEL_307:
                                      v377 = v381;
                                      goto LABEL_436;
                                    }
                                    id v247 = v246;
                                    v248 = [BMProactiveHarvestingNamedHandle alloc];
                                    id v455 = 0;
                                    v249 = [(BMProactiveHarvestingNamedHandle *)v248 initWithJSONDictionary:v247 error:&v455];
                                    id v250 = v455;
                                    if (v250)
                                    {
                                      id v376 = v250;
                                      v378 = v247;
                                      if (v394) {
                                        id *v394 = v250;
                                      }

                                      uint64_t v25 = 0;
                                      goto LABEL_307;
                                    }
                                    [v380 addObject:v249];
                                  }
                                  uint64_t v243 = [v381 countByEnumeratingWithState:&v456 objects:v523 count:16];
                                  if (!v243)
                                  {
LABEL_286:

                                    v251 = [v438 objectForKeyedSubscript:@"ccHandles"];
                                    v252 = [MEMORY[0x1E4F1CA98] null];
                                    int v253 = [v251 isEqual:v252];

                                    if (v253)
                                    {

                                      v251 = 0;
LABEL_310:
                                      uint64_t v268 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v251, "count"));
                                      long long v451 = 0u;
                                      long long v452 = 0u;
                                      long long v453 = 0u;
                                      long long v454 = 0u;
                                      id v269 = v251;
                                      uint64_t v270 = [v269 countByEnumeratingWithState:&v451 objects:v516 count:16];
                                      v377 = v269;
                                      v378 = (void *)v268;
                                      if (!v270) {
                                        goto LABEL_320;
                                      }
                                      uint64_t v271 = v270;
                                      uint64_t v272 = *(void *)v452;
                                      while (1)
                                      {
                                        for (uint64_t k = 0; k != v271; ++k)
                                        {
                                          if (*(void *)v452 != v272) {
                                            objc_enumerationMutation(v269);
                                          }
                                          v274 = *(void **)(*((void *)&v451 + 1) + 8 * k);
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            if (v394)
                                            {
                                              id v284 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v285 = *MEMORY[0x1E4F502C8];
                                              uint64_t v514 = *MEMORY[0x1E4F28568];
                                              v375 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"ccHandles"];
                                              v515 = v375;
                                              uint64_t v286 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v515 forKeys:&v514 count:1];
                                              v287 = v284;
                                              goto LABEL_333;
                                            }
LABEL_367:
                                            uint64_t v25 = 0;
                                            id v376 = v269;
                                            goto LABEL_436;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            if (!v394) {
                                              goto LABEL_367;
                                            }
                                            id v288 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v285 = *MEMORY[0x1E4F502C8];
                                            uint64_t v512 = *MEMORY[0x1E4F28568];
                                            v375 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"ccHandles"];
                                            v513 = v375;
                                            uint64_t v286 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v513 forKeys:&v512 count:1];
                                            v287 = v288;
LABEL_333:
                                            id v289 = (id)v286;
                                            uint64_t v25 = 0;
                                            id *v394 = (id)objc_msgSend(v287, "initWithDomain:code:userInfo:", v285, 2);
LABEL_337:
                                            id v376 = v269;
                                            goto LABEL_435;
                                          }
                                          id v275 = v274;
                                          v276 = [BMProactiveHarvestingNamedHandle alloc];
                                          id v450 = 0;
                                          v277 = [(BMProactiveHarvestingNamedHandle *)v276 initWithJSONDictionary:v275 error:&v450];
                                          id v278 = v450;
                                          if (v278)
                                          {
                                            id v289 = v278;
                                            v375 = v275;
                                            if (v394) {
                                              id *v394 = v278;
                                            }

                                            uint64_t v25 = 0;
                                            goto LABEL_337;
                                          }
                                          [v378 addObject:v277];
                                        }
                                        uint64_t v271 = [v269 countByEnumeratingWithState:&v451 objects:v516 count:16];
                                        if (!v271)
                                        {
LABEL_320:

                                          v279 = [v438 objectForKeyedSubscript:@"bccHandles"];
                                          v280 = [MEMORY[0x1E4F1CA98] null];
                                          id v376 = v279;
                                          int v281 = [v279 isEqual:v280];

                                          if (v281)
                                          {

                                            goto LABEL_342;
                                          }
                                          if (v279)
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (v394)
                                              {
                                                id v290 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v291 = *MEMORY[0x1E4F502C8];
                                                uint64_t v510 = *MEMORY[0x1E4F28568];
                                                v375 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"bccHandles"];
                                                v511 = v375;
                                                id v289 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v511 forKeys:&v510 count:1];
                                                uint64_t v25 = 0;
                                                id *v394 = (id)objc_msgSend(v290, "initWithDomain:code:userInfo:", v291, 2);
                                                goto LABEL_435;
                                              }
                                              uint64_t v25 = 0;
                                              goto LABEL_436;
                                            }
                                          }
                                          else
                                          {
LABEL_342:
                                            id v376 = 0;
                                          }
                                          v375 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v376, "count"));
                                          long long v446 = 0u;
                                          long long v447 = 0u;
                                          long long v448 = 0u;
                                          long long v449 = 0u;
                                          id v376 = v376;
                                          uint64_t v292 = [v376 countByEnumeratingWithState:&v446 objects:v509 count:16];
                                          if (!v292) {
                                            goto LABEL_353;
                                          }
                                          uint64_t v293 = v292;
                                          uint64_t v294 = *(void *)v447;
LABEL_345:
                                          uint64_t v295 = 0;
                                          while (1)
                                          {
                                            if (*(void *)v447 != v294) {
                                              objc_enumerationMutation(v376);
                                            }
                                            v296 = *(void **)(*((void *)&v446 + 1) + 8 * v295);
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass()) {
                                              break;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (v394)
                                              {
                                                id v310 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v307 = *MEMORY[0x1E4F502C8];
                                                uint64_t v505 = *MEMORY[0x1E4F28568];
                                                v301 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"bccHandles"];
                                                v506 = v301;
                                                uint64_t v308 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v506 forKeys:&v505 count:1];
                                                v309 = v310;
                                                goto LABEL_373;
                                              }
                                              goto LABEL_378;
                                            }
                                            id v297 = v296;
                                            v298 = [BMProactiveHarvestingNamedHandle alloc];
                                            id v445 = 0;
                                            v299 = [(BMProactiveHarvestingNamedHandle *)v298 initWithJSONDictionary:v297 error:&v445];
                                            id v300 = v445;
                                            if (v300)
                                            {
                                              id v303 = v300;
                                              v301 = v297;
                                              if (v394) {
                                                id *v394 = v300;
                                              }

                                              uint64_t v25 = 0;
                                              goto LABEL_377;
                                            }
                                            [v375 addObject:v299];

                                            if (v293 == ++v295)
                                            {
                                              uint64_t v293 = [v376 countByEnumeratingWithState:&v446 objects:v509 count:16];
                                              if (v293) {
                                                goto LABEL_345;
                                              }
LABEL_353:

                                              v301 = [v438 objectForKeyedSubscript:@"contentProtection"];
                                              if (v301 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                              {
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v289 = v301;
                                                  goto LABEL_356;
                                                }
                                                if (v394)
                                                {
                                                  id v313 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v314 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v503 = *MEMORY[0x1E4F28568];
                                                  id v303 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentProtection"];
                                                  id v504 = v303;
                                                  v302 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v504 forKeys:&v503 count:1];
                                                  id v315 = (id)[v313 initWithDomain:v314 code:2 userInfo:v302];
                                                  id v289 = 0;
                                                  uint64_t v25 = 0;
                                                  id *v394 = v315;
                                                  goto LABEL_432;
                                                }
                                                id v289 = 0;
                                                uint64_t v25 = 0;
                                              }
                                              else
                                              {
                                                id v289 = 0;
LABEL_356:
                                                v302 = [v438 objectForKeyedSubscript:@"personaId"];
                                                if (v302 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                {
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v303 = v302;
                                                    goto LABEL_359;
                                                  }
                                                  if (v394)
                                                  {
                                                    id v316 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    uint64_t v317 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v501 = *MEMORY[0x1E4F28568];
                                                    id v371 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"personaId"];
                                                    id v502 = v371;
                                                    v374 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v502 forKeys:&v501 count:1];
                                                    id v318 = (id)objc_msgSend(v316, "initWithDomain:code:userInfo:", v317, 2);
                                                    id v303 = 0;
                                                    uint64_t v25 = 0;
                                                    id *v394 = v318;
                                                    goto LABEL_431;
                                                  }
                                                  id v303 = 0;
                                                  uint64_t v25 = 0;
                                                }
                                                else
                                                {
                                                  id v303 = 0;
LABEL_359:
                                                  v374 = [v438 objectForKeyedSubscript:@"conversationId"];
                                                  if (v374 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                  {
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v371 = v374;
                                                      goto LABEL_362;
                                                    }
                                                    if (v394)
                                                    {
                                                      id v319 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      uint64_t v320 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v499 = *MEMORY[0x1E4F28568];
                                                      id v369 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"conversationId"];
                                                      id v500 = v369;
                                                      v373 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v500 forKeys:&v499 count:1];
                                                      id v321 = (id)objc_msgSend(v319, "initWithDomain:code:userInfo:", v320, 2);
                                                      id v371 = 0;
                                                      uint64_t v25 = 0;
                                                      id *v394 = v321;
                                                      goto LABEL_430;
                                                    }
                                                    id v371 = 0;
                                                    uint64_t v25 = 0;
                                                  }
                                                  else
                                                  {
                                                    id v371 = 0;
LABEL_362:
                                                    v373 = [v438 objectForKeyedSubscript:@"dateReceived"];
                                                    if (!v373
                                                      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v369 = 0;
LABEL_397:
                                                      v372 = [v438 objectForKeyedSubscript:@"mailCategories"];
                                                      if (v372
                                                        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                      {
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v367 = v372;
                                                          goto LABEL_400;
                                                        }
                                                        if (v394)
                                                        {
                                                          id v327 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          uint64_t v328 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v495 = *MEMORY[0x1E4F28568];
                                                          id v366 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mailCategories"];
                                                          id v496 = v366;
                                                          v370 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v496 forKeys:&v495 count:1];
                                                          id v329 = (id)objc_msgSend(v327, "initWithDomain:code:userInfo:", v328, 2);
                                                          uint64_t v25 = 0;
                                                          id v367 = 0;
                                                          id *v394 = v329;
                                                          goto LABEL_428;
                                                        }
                                                        id v367 = 0;
                                                        uint64_t v25 = 0;
                                                      }
                                                      else
                                                      {
                                                        id v367 = 0;
LABEL_400:
                                                        v370 = [v438 objectForKeyedSubscript:@"isNew"];
                                                        if (v370
                                                          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v366 = v370;
                                                            goto LABEL_403;
                                                          }
                                                          if (v394)
                                                          {
                                                            id v330 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            uint64_t v331 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v493 = *MEMORY[0x1E4F28568];
                                                            id v364 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isNew"];
                                                            id v494 = v364;
                                                            v368 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v494 forKeys:&v493 count:1];
                                                            id v332 = (id)objc_msgSend(v330, "initWithDomain:code:userInfo:", v331, 2);
                                                            uint64_t v25 = 0;
                                                            id v366 = 0;
                                                            id *v394 = v332;
                                                            goto LABEL_427;
                                                          }
                                                          id v366 = 0;
                                                          uint64_t v25 = 0;
                                                        }
                                                        else
                                                        {
                                                          id v366 = 0;
LABEL_403:
                                                          v368 = [v438 objectForKeyedSubscript:@"isTwoFactorCode"];
                                                          if (v368
                                                            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                          {
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v364 = v368;
                                                              goto LABEL_406;
                                                            }
                                                            if (v394)
                                                            {
                                                              id v333 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              uint64_t v334 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v491 = *MEMORY[0x1E4F28568];
                                                              id v362 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isTwoFactorCode"];
                                                              id v492 = v362;
                                                              v365 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v492 forKeys:&v491 count:1];
                                                              id v335 = (id)objc_msgSend(v333, "initWithDomain:code:userInfo:", v334, 2);
                                                              uint64_t v25 = 0;
                                                              id v364 = 0;
                                                              id *v394 = v335;
                                                              goto LABEL_426;
                                                            }
                                                            id v364 = 0;
                                                            uint64_t v25 = 0;
                                                          }
                                                          else
                                                          {
                                                            id v364 = 0;
LABEL_406:
                                                            v365 = [v438 objectForKeyedSubscript:@"isFromMe"];
                                                            if (v365
                                                              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                            {
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v362 = v365;
                                                                goto LABEL_409;
                                                              }
                                                              if (v394)
                                                              {
                                                                id v336 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v337 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v489 = *MEMORY[0x1E4F28568];
                                                                id v360 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isFromMe"];
                                                                id v490 = v360;
                                                                v363 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v490 forKeys:&v489 count:1];
                                                                id v338 = (id)objc_msgSend(v336, "initWithDomain:code:userInfo:", v337, 2);
                                                                uint64_t v25 = 0;
                                                                id v362 = 0;
                                                                id *v394 = v338;
                                                                goto LABEL_425;
                                                              }
                                                              id v362 = 0;
                                                              uint64_t v25 = 0;
                                                            }
                                                            else
                                                            {
                                                              id v362 = 0;
LABEL_409:
                                                              v363 = [v438 objectForKeyedSubscript:@"isJunk"];
                                                              if (v363
                                                                && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                              {
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v360 = v363;
                                                                  goto LABEL_412;
                                                                }
                                                                if (v394)
                                                                {
                                                                  id v339 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v340 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v487 = *MEMORY[0x1E4F28568];
                                                                  id v358 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isJunk"];
                                                                  id v488 = v358;
                                                                  v361 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v488 forKeys:&v487 count:1];
                                                                  id v341 = (id)objc_msgSend(v339, "initWithDomain:code:userInfo:", v340, 2);
                                                                  uint64_t v25 = 0;
                                                                  id v360 = 0;
                                                                  id *v394 = v341;
                                                                  goto LABEL_424;
                                                                }
                                                                id v360 = 0;
                                                                uint64_t v25 = 0;
                                                              }
                                                              else
                                                              {
                                                                id v360 = 0;
LABEL_412:
                                                                v361 = [v438 objectForKeyedSubscript:@"isRead"];
                                                                if (v361
                                                                  && (objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v358 = v361;
                                                                    goto LABEL_415;
                                                                  }
                                                                  if (v394)
                                                                  {
                                                                    id v342 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    uint64_t v343 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v485 = *MEMORY[0x1E4F28568];
                                                                    id v323 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isRead"];
                                                                    id v486 = v323;
                                                                    v359 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v486 forKeys:&v485 count:1];
                                                                    id v344 = (id)objc_msgSend(v342, "initWithDomain:code:userInfo:", v343, 2);
                                                                    uint64_t v25 = 0;
                                                                    id v358 = 0;
                                                                    id *v394 = v344;
                                                                    goto LABEL_423;
                                                                  }
                                                                  id v358 = 0;
                                                                  uint64_t v25 = 0;
                                                                }
                                                                else
                                                                {
                                                                  id v358 = 0;
LABEL_415:
                                                                  v359 = [v438 objectForKeyedSubscript:@"isVIP"];
                                                                  if (v359
                                                                    && (objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                                  {
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v323 = v359;
                                                                      goto LABEL_418;
                                                                    }
                                                                    if (v394)
                                                                    {
                                                                      id v345 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v346 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v483 = *MEMORY[0x1E4F28568];
                                                                      id v325 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isVIP"];
                                                                      id v484 = v325;
                                                                      v324 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v484 forKeys:&v483 count:1];
                                                                      id v347 = (id)objc_msgSend(v345, "initWithDomain:code:userInfo:", v346, 2);
                                                                      uint64_t v25 = 0;
                                                                      id v323 = 0;
                                                                      id *v394 = v347;
                                                                      goto LABEL_422;
                                                                    }
                                                                    id v323 = 0;
                                                                    uint64_t v25 = 0;
                                                                  }
                                                                  else
                                                                  {
                                                                    id v323 = 0;
LABEL_418:
                                                                    v324 = [v438 objectForKeyedSubscript:@"isFlagged"];
                                                                    if (!v324
                                                                      || (objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v325 = 0;
                                                                      goto LABEL_421;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v325 = v324;
LABEL_421:
                                                                      uint64_t v25 = objc_retain(-[BMProactiveHarvestingMail initWithUniqueID:domainID:absoluteTimestamp:accountIdentifier:messageIdentifier:fromField:toField:ccField:bccField:headers:subject:htmlContentData:isFullyDownloaded:htmlContent:textContent:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listID:accountType:attachments:fromHandle:toHandles:ccHandles:bccHandles:contentProtection:personaId:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:](v437, "initWithUniqueID:domainID:absoluteTimestamp:accountIdentifier:messageIdentifier:fromField:toField:ccField:bccField:headers:subject:htmlContentData:isFullyDownloaded:htmlContent:textContent:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listID:accountType:attachments:fromHandle:toHandles:ccHandles:bccHandles:contentProtection:personaId:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", v418, v439, v436, v432, v433, v430,
                                                                                v428,
                                                                                v427,
                                                                                v425,
                                                                                v442,
                                                                                v412,
                                                                                v417,
                                                                                v398,
                                                                                v409,
                                                                                v407,
                                                                                v405,
                                                                                v414,
                                                                                v395,
                                                                                v403,
                                                                                v388,
                                                                                v385,
                                                                                v389,
                                                                                v379,
                                                                                v380,
                                                                                v378,
                                                                                v375,
                                                                                v289,
                                                                                v303,
                                                                                v371,
                                                                                v369,
                                                                                v367,
                                                                                v366,
                                                                                v364,
                                                                                v362,
                                                                                v360,
                                                                                v358,
                                                                                v323,
                                                                                v325));
                                                                      v437 = v25;
                                                                    }
                                                                    else
                                                                    {
                                                                      if (v394)
                                                                      {
                                                                        id v357 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        uint64_t v348 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v481 = *MEMORY[0x1E4F28568];
                                                                        v349 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isFlagged"];
                                                                        v482 = v349;
                                                                        v350 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v482 forKeys:&v481 count:1];
                                                                        id *v394 = (id)[v357 initWithDomain:v348 code:2 userInfo:v350];
                                                                      }
                                                                      id v325 = 0;
                                                                      uint64_t v25 = 0;
                                                                    }
LABEL_422:
                                                                  }
LABEL_423:
                                                                }
LABEL_424:
                                                              }
LABEL_425:
                                                            }
LABEL_426:
                                                          }
LABEL_427:
                                                        }
LABEL_428:
                                                      }
LABEL_429:

                                                      goto LABEL_430;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v311 = v373;
                                                      id v312 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                                                      [v311 doubleValue];
                                                      id v369 = (id)objc_msgSend(v312, "initWithTimeIntervalSinceReferenceDate:");
LABEL_396:

                                                      goto LABEL_397;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v311 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                                                      id v322 = v373;
                                                      id v369 = [v311 dateFromString:v322];

                                                      goto LABEL_396;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v369 = v373;
                                                      goto LABEL_397;
                                                    }
                                                    if (v394)
                                                    {
                                                      id v351 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      uint64_t v352 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v497 = *MEMORY[0x1E4F28568];
                                                      id v367 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"dateReceived"];
                                                      id v498 = v367;
                                                      v372 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v498 forKeys:&v497 count:1];
                                                      id v353 = (id)objc_msgSend(v351, "initWithDomain:code:userInfo:", v352, 2);
                                                      id v369 = 0;
                                                      uint64_t v25 = 0;
                                                      id *v394 = v353;
                                                      goto LABEL_429;
                                                    }
                                                    id v369 = 0;
                                                    uint64_t v25 = 0;
LABEL_430:
                                                  }
LABEL_431:
                                                }
LABEL_432:

LABEL_433:
                                              }

LABEL_435:
LABEL_436:
                                              uint64_t v7 = v423;
                                              uint64_t v21 = v439;
                                              a4 = v436;
                                              v55 = v432;
                                              id v87 = v412;
                                              int v109 = v400;

                                              uint64_t v43 = v444;
LABEL_437:
                                              id v113 = v398;
LABEL_438:

                                              goto LABEL_439;
                                            }
                                          }
                                          if (v394)
                                          {
                                            id v306 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v307 = *MEMORY[0x1E4F502C8];
                                            uint64_t v507 = *MEMORY[0x1E4F28568];
                                            v301 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"bccHandles"];
                                            v508 = v301;
                                            uint64_t v308 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v508 forKeys:&v507 count:1];
                                            v309 = v306;
LABEL_373:
                                            id v303 = (id)v308;
                                            uint64_t v25 = 0;
                                            id *v394 = (id)objc_msgSend(v309, "initWithDomain:code:userInfo:", v307, 2);
LABEL_377:
                                            id v289 = v376;
                                            goto LABEL_433;
                                          }
LABEL_378:
                                          uint64_t v25 = 0;
                                          id v289 = v376;
                                          goto LABEL_435;
                                        }
                                      }
                                    }
                                    v377 = v251;
                                    if (!v251) {
                                      goto LABEL_310;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass()) {
                                      goto LABEL_310;
                                    }
                                    if (v394)
                                    {
                                      id v304 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v305 = *MEMORY[0x1E4F502C8];
                                      uint64_t v517 = *MEMORY[0x1E4F28568];
                                      v378 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"ccHandles"];
                                      v518 = v378;
                                      id v376 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v518 forKeys:&v517 count:1];
                                      uint64_t v25 = 0;
                                      id *v394 = (id)objc_msgSend(v304, "initWithDomain:code:userInfo:", v305, 2);
                                      goto LABEL_436;
                                    }
                                    uint64_t v25 = 0;
LABEL_325:
                                    uint64_t v7 = v423;
                                    uint64_t v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    uint64_t v43 = v444;
                                    id v87 = v412;
                                    int v109 = v400;
                                    goto LABEL_437;
                                  }
                                }
                              }
                              if (v111)
                              {
                                id v165 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v166 = *MEMORY[0x1E4F502C8];
                                uint64_t v555 = *MEMORY[0x1E4F28568];
                                id v413 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"securityMethod"];
                                id v556 = v413;
                                v415 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v556 forKeys:&v555 count:1];
                                id v167 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v166, 2);
                                id v405 = 0;
                                uint64_t v25 = 0;
                                *uint64_t v111 = v167;
                                uint64_t v21 = v439;
                                a4 = v436;
                                v55 = v432;
                                uint64_t v43 = v444;

                                goto LABEL_452;
                              }
                              id v405 = 0;
                              uint64_t v25 = 0;
                            }
                            uint64_t v21 = v439;
                            a4 = v436;
                            v55 = v432;
                            uint64_t v43 = v444;
                            goto LABEL_453;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v409 = v115;
                            goto LABEL_124;
                          }
                          if (v111)
                          {
                            id v139 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v140 = *MEMORY[0x1E4F502C8];
                            uint64_t v559 = *MEMORY[0x1E4F28568];
                            id v141 = [NSString alloc];
                            uint64_t v356 = objc_opt_class();
                            v142 = v141;
                            uint64_t v43 = v444;
                            id v407 = (id)[v142 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", v356, @"htmlContent"];
                            id v560 = v407;
                            v408 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v560 forKeys:&v559 count:1];
                            id v143 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v140, 2);
                            id v409 = 0;
                            uint64_t v25 = 0;
                            *uint64_t v111 = v143;
                            uint64_t v21 = v439;
                            a4 = v436;
                            v55 = v432;
                            goto LABEL_454;
                          }
                          id v409 = 0;
                          uint64_t v25 = 0;
                        }
                        uint64_t v21 = v439;
                        a4 = v436;
                        v55 = v432;
                        goto LABEL_455;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v417 = v109;
                        goto LABEL_118;
                      }
                      if (v49)
                      {
                        id v128 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v129 = *MEMORY[0x1E4F502C8];
                        uint64_t v563 = *MEMORY[0x1E4F28568];
                        uint64_t v130 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"htmlContentData"];
                        uint64_t v564 = v130;
                        uint64_t v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v564 forKeys:&v563 count:1];
                        v132 = v128;
                        uint64_t v43 = v444;
                        uint64_t v133 = v129;
                        id v87 = v412;
                        v411 = (void *)v131;
                        id v417 = 0;
                        uint64_t v25 = 0;
                        id *v49 = (id)objc_msgSend(v132, "initWithDomain:code:userInfo:", v133, 2);
                        id v113 = (id)v130;
                        uint64_t v21 = v439;
                        a4 = v436;
                        v55 = v432;
                        goto LABEL_456;
                      }
                      id v417 = 0;
                      uint64_t v25 = 0;
                    }
                    else
                    {
                      uint64_t v7 = v421;
                      if (!v49)
                      {
                        id v87 = 0;
                        uint64_t v25 = 0;
                        uint64_t v21 = v439;
                        a4 = v436;
                        v55 = v432;
                        goto LABEL_459;
                      }
                      id v124 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v125 = *MEMORY[0x1E4F502C8];
                      uint64_t v565 = *MEMORY[0x1E4F28568];
                      id v417 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subject"];
                      id v566 = v417;
                      int v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v566 forKeys:&v565 count:1];
                      v126 = v124;
                      uint64_t v43 = v444;
                      id v127 = (id)[v126 initWithDomain:v125 code:2 userInfo:v109];
                      id v87 = 0;
                      uint64_t v25 = 0;
                      id *v49 = v127;
                    }
                    uint64_t v21 = v439;
                    a4 = v436;
                    v55 = v432;
                    goto LABEL_457;
                  }
                }
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v427 = v43;
                goto LABEL_38;
              }
              if (a4)
              {
                id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
                id v73 = v6;
                uint64_t v74 = *MEMORY[0x1E4F502C8];
                uint64_t v576 = *MEMORY[0x1E4F28568];
                id v425 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"ccField"];
                id v577 = v425;
                uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v577 forKeys:&v576 count:1];
                v76 = v72;
                uint64_t v43 = v444;
                uint64_t v77 = v74;
                id v6 = v73;
                v426 = (void *)v75;
                id v427 = 0;
                uint64_t v25 = 0;
                *a4 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
                uint64_t v21 = v439;
                a4 = v436;
                v55 = v432;
                goto LABEL_462;
              }
              id v427 = 0;
              uint64_t v25 = 0;
LABEL_133:
              uint64_t v21 = v439;
              a4 = v436;
              v55 = v432;
              goto LABEL_463;
            }
            if (a4)
            {
              id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
              id v67 = v6;
              uint64_t v68 = *MEMORY[0x1E4F502C8];
              uint64_t v578 = *MEMORY[0x1E4F28568];
              id v427 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"toField"];
              id v579 = v427;
              uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v579 forKeys:&v578 count:1];
              v70 = v66;
              uint64_t v43 = (void *)v69;
              uint64_t v71 = v68;
              id v6 = v67;
              id v428 = 0;
              uint64_t v25 = 0;
              *a4 = (id)[v70 initWithDomain:v71 code:2 userInfo:v69];
              goto LABEL_133;
            }
            id v428 = 0;
            uint64_t v25 = 0;
LABEL_115:
            uint64_t v21 = v439;
            a4 = v436;
            v55 = v432;
            goto LABEL_464;
          }
          if (a4)
          {
            id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v62 = v6;
            uint64_t v63 = *MEMORY[0x1E4F502C8];
            uint64_t v580 = *MEMORY[0x1E4F28568];
            id v428 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"fromField"];
            id v581 = v428;
            uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v581 forKeys:&v580 count:1];
            uint64_t v65 = v63;
            id v6 = v62;
            v429 = (void *)v64;
            id v430 = 0;
            uint64_t v25 = 0;
            *a4 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v65, 2);
            goto LABEL_115;
          }
          id v430 = 0;
          uint64_t v25 = 0;
LABEL_105:
          uint64_t v21 = v439;
          a4 = v436;
          v55 = v432;
          goto LABEL_465;
        }
        if (a4)
        {
          id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v57 = v6;
          uint64_t v58 = *MEMORY[0x1E4F502C8];
          uint64_t v582 = *MEMORY[0x1E4F28568];
          id v430 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"messageIdentifier"];
          id v583 = v430;
          uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v583 forKeys:&v582 count:1];
          uint64_t v60 = v58;
          id v6 = v57;
          v431 = (void *)v59;
          id v433 = 0;
          uint64_t v25 = 0;
          *a4 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v60, 2);
          goto LABEL_105;
        }
        id v433 = 0;
        uint64_t v25 = 0;
        uint64_t v21 = v439;
        a4 = v436;
        v55 = v432;
LABEL_101:
        self = v437;
        goto LABEL_466;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        id v13 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [v12 doubleValue];
        v436 = (id *)objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:");
LABEL_22:

        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        id v34 = v11;
        v436 = [v12 dateFromString:v34];

        goto LABEL_22;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v436 = v11;
        goto LABEL_23;
      }
      if (a4)
      {
        v422 = v7;
        id v101 = self;
        id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v103 = v6;
        uint64_t v104 = *MEMORY[0x1E4F502C8];
        uint64_t v586 = *MEMORY[0x1E4F28568];
        v393 = a4;
        uint64_t v105 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
        uint64_t v587 = v105;
        uint64_t v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v587 forKeys:&v586 count:1];
        v107 = v102;
        self = v101;
        uint64_t v7 = v422;
        uint64_t v108 = v104;
        id v6 = v103;
        v55 = (void *)v105;
        v440 = (void *)v106;
        a4 = 0;
        uint64_t v25 = 0;
        id *v393 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v108, 2);
        uint64_t v21 = v439;
        goto LABEL_467;
      }
      uint64_t v25 = 0;
      uint64_t v21 = v439;
LABEL_468:

      goto LABEL_469;
    }
    if (a4)
    {
      v420 = v7;
      uint64_t v26 = self;
      id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v28 = v6;
      uint64_t v29 = *MEMORY[0x1E4F502C8];
      uint64_t v588 = *MEMORY[0x1E4F28568];
      uint64_t v30 = a4;
      a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domainID"];
      v589 = a4;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v589 forKeys:&v588 count:1];
      uint64_t v32 = v27;
      self = v26;
      uint64_t v7 = v420;
      uint64_t v33 = v29;
      id v6 = v28;
      v441 = (void *)v31;
      uint64_t v21 = 0;
      uint64_t v25 = 0;
      *uint64_t v30 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2);
      goto LABEL_468;
    }
    uint64_t v21 = 0;
    uint64_t v25 = 0;
LABEL_469:

    goto LABEL_470;
  }
  if (a4)
  {
    long long v14 = self;
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v16 = v6;
    uint64_t v17 = *MEMORY[0x1E4F502C8];
    uint64_t v590 = *MEMORY[0x1E4F28568];
    uint64_t v18 = v7;
    id v19 = [NSString alloc];
    uint64_t v354 = objc_opt_class();
    uint64_t v20 = v19;
    uint64_t v7 = v18;
    uint64_t v21 = (void *)[v20 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v354, @"uniqueID"];
    v591[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v591 forKeys:&v590 count:1];
    uint64_t v23 = v15;
    self = v14;
    uint64_t v24 = v17;
    id v6 = v16;
    uint64_t v9 = (void *)v22;
    id v8 = 0;
    uint64_t v25 = 0;
    *a4 = (id)[v23 initWithDomain:v24 code:2 userInfo:v22];
    goto LABEL_469;
  }
  id v8 = 0;
  uint64_t v25 = 0;
LABEL_470:

  return v25;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMProactiveHarvestingMail *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_domainID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_accountIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_fromField) {
    PBDataWriterWriteStringField();
  }
  if (self->_toField) {
    PBDataWriterWriteStringField();
  }
  if (self->_ccField) {
    PBDataWriterWriteStringField();
  }
  if (self->_bccField) {
    PBDataWriterWriteStringField();
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v5 = self->_headers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v71;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v71 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v70 + 1) + 8 * v9);
        uint64_t v69 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v70 objects:v80 count:16];
    }
    while (v7);
  }

  if (self->_subject) {
    PBDataWriterWriteStringField();
  }
  if (self->_htmlContentData) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsFullyDownloaded) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_htmlContent) {
    PBDataWriterWriteDataField();
  }
  if (self->_textContent) {
    PBDataWriterWriteStringField();
  }
  if (self->_securityMethod) {
    PBDataWriterWriteStringField();
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v11 = self->_accountHandles;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v66;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v65 objects:v79 count:16];
    }
    while (v13);
  }

  if (self->_replyTo)
  {
    uint64_t v69 = 0;
    PBDataWriterPlaceMark();
    [(BMProactiveHarvestingNamedHandle *)self->_replyTo writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v16 = self->_mailboxIdentifiers;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v61 objects:v78 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v62;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v61 objects:v78 count:16];
    }
    while (v18);
  }

  if (self->_listID)
  {
    uint64_t v69 = 0;
    PBDataWriterPlaceMark();
    [(BMProactiveHarvestingNamedHandle *)self->_listID writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_accountType) {
    PBDataWriterWriteStringField();
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v21 = self->_attachments;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v57 objects:v77 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v58;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v58 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v57 + 1) + 8 * v25);
        uint64_t v69 = 0;
        PBDataWriterPlaceMark();
        [v26 writeTo:v4];
        PBDataWriterRecallMark();
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v57 objects:v77 count:16];
    }
    while (v23);
  }

  if (self->_fromHandle)
  {
    uint64_t v69 = 0;
    PBDataWriterPlaceMark();
    [(BMProactiveHarvestingNamedHandle *)self->_fromHandle writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v27 = self->_toHandles;
  uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v53 objects:v76 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v54;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v54 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void **)(*((void *)&v53 + 1) + 8 * v31);
        uint64_t v69 = 0;
        PBDataWriterPlaceMark();
        [v32 writeTo:v4];
        PBDataWriterRecallMark();
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v53 objects:v76 count:16];
    }
    while (v29);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v33 = self->_ccHandles;
  uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v49 objects:v75 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v50;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v50 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void **)(*((void *)&v49 + 1) + 8 * v37);
        uint64_t v69 = 0;
        PBDataWriterPlaceMark();
        [v38 writeTo:v4];
        PBDataWriterRecallMark();
        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v49 objects:v75 count:16];
    }
    while (v35);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v39 = self->_bccHandles;
  uint64_t v40 = [(NSArray *)v39 countByEnumeratingWithState:&v45 objects:v74 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v46;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v46 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void **)(*((void *)&v45 + 1) + 8 * v43);
        uint64_t v69 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v44, "writeTo:", v4, (void)v45);
        PBDataWriterRecallMark();
        ++v43;
      }
      while (v41 != v43);
      uint64_t v41 = [(NSArray *)v39 countByEnumeratingWithState:&v45 objects:v74 count:16];
    }
    while (v41);
  }

  if (self->_contentProtection) {
    PBDataWriterWriteStringField();
  }
  if (self->_personaId) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_dateReceived) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasMailCategories) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasIsNew) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsTwoFactorCode) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsFromMe) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsJunk) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsRead) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsVIP) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsFlagged) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v132.receiver = self;
  v132.super_class = (Class)BMProactiveHarvestingMail;
  uint64_t v5 = [(BMEventBase *)&v132 init];
  if (!v5) {
    goto LABEL_186;
  }
  uint64_t v129 = objc_opt_new();
  uint64_t v131 = objc_opt_new();
  uint64_t v130 = objc_opt_new();
  id v127 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v10 = (int *)MEMORY[0x1E4F940E0];
  long long v11 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v11]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v9;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v10]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
        *(void *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_13;
        }
        v13 += 7;
        BOOL v20 = v14++ >= 9;
        if (v20)
        {
          unint64_t v15 = 0;
          int v21 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      int v21 = v4[*v11];
      if (v4[*v11]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 80;
          goto LABEL_81;
        case 2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 88;
          goto LABEL_81;
        case 3u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v25 = *v9;
          unint64_t v26 = *(void *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)&v4[*v10])
          {
            id v27 = *(objc_class **)(*(void *)&v4[*v12] + v26);
            *(void *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v11] = 1;
            id v27 = 0;
          }
          uint64_t v109 = 24;
          goto LABEL_182;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 96;
          goto LABEL_81;
        case 5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 104;
          goto LABEL_81;
        case 6u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 112;
          goto LABEL_81;
        case 7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 120;
          goto LABEL_81;
        case 8u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 128;
          goto LABEL_81;
        case 9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 136;
          goto LABEL_81;
        case 0xAu:
          uint64_t v133 = 0;
          uint64_t v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          id v28 = [[BMProactiveHarvestingMailHeaderEntry alloc] initByReadFrom:v4];
          if (!v28) {
            goto LABEL_188;
          }
          uint64_t v29 = v28;
          uint64_t v30 = v129;
          goto LABEL_76;
        case 0xBu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 152;
          goto LABEL_81;
        case 0xCu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 160;
          goto LABEL_81;
        case 0xDu:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasIsFullyDownloaded = 1;
          while (2)
          {
            uint64_t v34 = *v9;
            uint64_t v35 = *(void *)&v4[v34];
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v12] + v35);
              *(void *)&v4[v34] = v36;
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                BOOL v20 = v32++ >= 9;
                if (v20)
                {
                  uint64_t v33 = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v33 = 0;
          }
LABEL_144:
          BOOL v107 = v33 != 0;
          uint64_t v108 = 48;
          goto LABEL_177;
        case 0xEu:
          uint64_t v23 = PBReaderReadData();
          uint64_t v24 = 168;
          goto LABEL_81;
        case 0xFu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 176;
          goto LABEL_81;
        case 0x10u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 184;
          goto LABEL_81;
        case 0x11u:
          uint64_t v38 = PBReaderReadString();
          if (!v38) {
            goto LABEL_188;
          }
          uint64_t v29 = (void *)v38;
          uint64_t v39 = v131;
          goto LABEL_55;
        case 0x12u:
          uint64_t v133 = 0;
          uint64_t v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          uint64_t v40 = [[BMProactiveHarvestingNamedHandle alloc] initByReadFrom:v4];
          if (!v40) {
            goto LABEL_188;
          }
          uint64_t v41 = 200;
          goto LABEL_66;
        case 0x13u:
          uint64_t v42 = PBReaderReadString();
          if (!v42) {
            goto LABEL_188;
          }
          uint64_t v29 = (void *)v42;
          uint64_t v39 = v130;
LABEL_55:
          objc_msgSend(v39, "addObject:", v29, v127);
          goto LABEL_77;
        case 0x14u:
          uint64_t v133 = 0;
          uint64_t v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          uint64_t v40 = [[BMProactiveHarvestingNamedHandle alloc] initByReadFrom:v4];
          if (!v40) {
            goto LABEL_188;
          }
          uint64_t v41 = 216;
          goto LABEL_66;
        case 0x15u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 224;
          goto LABEL_81;
        case 0x16u:
          uint64_t v133 = 0;
          uint64_t v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          id v43 = [[BMProactiveHarvestingContentAttachment alloc] initByReadFrom:v4];
          if (!v43) {
            goto LABEL_188;
          }
          uint64_t v29 = v43;
          uint64_t v30 = v127;
          goto LABEL_76;
        case 0x17u:
          uint64_t v133 = 0;
          uint64_t v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          uint64_t v40 = [[BMProactiveHarvestingNamedHandle alloc] initByReadFrom:v4];
          if (!v40) {
            goto LABEL_188;
          }
          uint64_t v41 = 240;
LABEL_66:
          uint64_t v44 = *(Class *)((char *)&v5->super.super.isa + v41);
          *(Class *)((char *)&v5->super.super.isa + v41) = v40;

          PBReaderRecallMark();
          continue;
        case 0x18u:
          uint64_t v133 = 0;
          uint64_t v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          id v45 = [[BMProactiveHarvestingNamedHandle alloc] initByReadFrom:v4];
          if (!v45) {
            goto LABEL_188;
          }
          uint64_t v29 = v45;
          uint64_t v30 = v6;
          goto LABEL_76;
        case 0x19u:
          uint64_t v133 = 0;
          uint64_t v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          id v46 = [[BMProactiveHarvestingNamedHandle alloc] initByReadFrom:v4];
          if (!v46) {
            goto LABEL_188;
          }
          uint64_t v29 = v46;
          uint64_t v30 = v7;
          goto LABEL_76;
        case 0x1Au:
          uint64_t v133 = 0;
          uint64_t v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          id v47 = [[BMProactiveHarvestingNamedHandle alloc] initByReadFrom:v4];
          if (!v47) {
            goto LABEL_188;
          }
          uint64_t v29 = v47;
          uint64_t v30 = v8;
LABEL_76:
          objc_msgSend(v30, "addObject:", v29, v127);
          PBReaderRecallMark();
LABEL_77:

          continue;
        case 0x1Bu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 272;
          goto LABEL_81;
        case 0x1Cu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 280;
          goto LABEL_81;
        case 0x1Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 288;
LABEL_81:
          long long v48 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0x1Eu:
          v5->_hasRaw_dateReceived = 1;
          uint64_t v49 = *v9;
          unint64_t v50 = *(void *)&v4[v49];
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(void *)&v4[*v10])
          {
            id v27 = *(objc_class **)(*(void *)&v4[*v12] + v50);
            *(void *)&v4[v49] = v50 + 8;
          }
          else
          {
            v4[*v11] = 1;
            id v27 = 0;
          }
          uint64_t v109 = 40;
LABEL_182:
          *(Class *)((char *)&v5->super.super.isa + v109) = v27;
          continue;
        case 0x1Fu:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v53 = 0;
          v5->_hasMailCategories = 1;
          while (2)
          {
            uint64_t v54 = *v9;
            uint64_t v55 = *(void *)&v4[v54];
            unint64_t v56 = v55 + 1;
            if (v55 == -1 || v56 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)&v4[*v12] + v55);
              *(void *)&v4[v54] = v56;
              v53 |= (unint64_t)(v57 & 0x7F) << v51;
              if (v57 < 0)
              {
                v51 += 7;
                BOOL v20 = v52++ >= 9;
                if (v20)
                {
                  LODWORD(v53) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v53) = 0;
          }
LABEL_148:
          v5->_mailCategories = v53;
          continue;
        case 0x20u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          v5->_hasIsNew = 1;
          while (2)
          {
            uint64_t v61 = *v9;
            uint64_t v62 = *(void *)&v4[v61];
            unint64_t v63 = v62 + 1;
            if (v62 == -1 || v63 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)&v4[*v12] + v62);
              *(void *)&v4[v61] = v63;
              v60 |= (unint64_t)(v64 & 0x7F) << v58;
              if (v64 < 0)
              {
                v58 += 7;
                BOOL v20 = v59++ >= 9;
                if (v20)
                {
                  uint64_t v60 = 0;
                  goto LABEL_152;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v60 = 0;
          }
LABEL_152:
          BOOL v107 = v60 != 0;
          uint64_t v108 = 51;
          goto LABEL_177;
        case 0x21u:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          v5->_hasIsTwoFactorCode = 1;
          while (2)
          {
            uint64_t v68 = *v9;
            uint64_t v69 = *(void *)&v4[v68];
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)&v4[*v12] + v69);
              *(void *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                BOOL v20 = v66++ >= 9;
                if (v20)
                {
                  uint64_t v67 = 0;
                  goto LABEL_156;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v67 = 0;
          }
LABEL_156:
          BOOL v107 = v67 != 0;
          uint64_t v108 = 53;
          goto LABEL_177;
        case 0x22u:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v74 = 0;
          v5->_hasIsFromMe = 1;
          while (2)
          {
            uint64_t v75 = *v9;
            uint64_t v76 = *(void *)&v4[v75];
            unint64_t v77 = v76 + 1;
            if (v76 == -1 || v77 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v78 = *(unsigned char *)(*(void *)&v4[*v12] + v76);
              *(void *)&v4[v75] = v77;
              v74 |= (unint64_t)(v78 & 0x7F) << v72;
              if (v78 < 0)
              {
                v72 += 7;
                BOOL v20 = v73++ >= 9;
                if (v20)
                {
                  uint64_t v74 = 0;
                  goto LABEL_160;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v74 = 0;
          }
LABEL_160:
          BOOL v107 = v74 != 0;
          uint64_t v108 = 55;
          goto LABEL_177;
        case 0x23u:
          char v79 = 0;
          unsigned int v80 = 0;
          uint64_t v81 = 0;
          v5->_hasIsJunuint64_t k = 1;
          while (2)
          {
            uint64_t v82 = *v9;
            uint64_t v83 = *(void *)&v4[v82];
            unint64_t v84 = v83 + 1;
            if (v83 == -1 || v84 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)&v4[*v12] + v83);
              *(void *)&v4[v82] = v84;
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                BOOL v20 = v80++ >= 9;
                if (v20)
                {
                  uint64_t v81 = 0;
                  goto LABEL_164;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v81 = 0;
          }
LABEL_164:
          BOOL v107 = v81 != 0;
          uint64_t v108 = 57;
          goto LABEL_177;
        case 0x24u:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v88 = 0;
          v5->_hasIsRead = 1;
          while (2)
          {
            uint64_t v89 = *v9;
            uint64_t v90 = *(void *)&v4[v89];
            unint64_t v91 = v90 + 1;
            if (v90 == -1 || v91 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v92 = *(unsigned char *)(*(void *)&v4[*v12] + v90);
              *(void *)&v4[v89] = v91;
              v88 |= (unint64_t)(v92 & 0x7F) << v86;
              if (v92 < 0)
              {
                v86 += 7;
                BOOL v20 = v87++ >= 9;
                if (v20)
                {
                  uint64_t v88 = 0;
                  goto LABEL_168;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v88 = 0;
          }
LABEL_168:
          BOOL v107 = v88 != 0;
          uint64_t v108 = 59;
          goto LABEL_177;
        case 0x25u:
          char v93 = 0;
          unsigned int v94 = 0;
          uint64_t v95 = 0;
          v5->_hasIsVIP = 1;
          while (2)
          {
            uint64_t v96 = *v9;
            uint64_t v97 = *(void *)&v4[v96];
            unint64_t v98 = v97 + 1;
            if (v97 == -1 || v98 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v99 = *(unsigned char *)(*(void *)&v4[*v12] + v97);
              *(void *)&v4[v96] = v98;
              v95 |= (unint64_t)(v99 & 0x7F) << v93;
              if (v99 < 0)
              {
                v93 += 7;
                BOOL v20 = v94++ >= 9;
                if (v20)
                {
                  uint64_t v95 = 0;
                  goto LABEL_172;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v95 = 0;
          }
LABEL_172:
          BOOL v107 = v95 != 0;
          uint64_t v108 = 61;
          goto LABEL_177;
        case 0x26u:
          char v100 = 0;
          unsigned int v101 = 0;
          uint64_t v102 = 0;
          v5->_hasIsFlagged = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_188:

          goto LABEL_185;
      }
      while (1)
      {
        uint64_t v103 = *v9;
        uint64_t v104 = *(void *)&v4[v103];
        unint64_t v105 = v104 + 1;
        if (v104 == -1 || v105 > *(void *)&v4[*v10]) {
          break;
        }
        char v106 = *(unsigned char *)(*(void *)&v4[*v12] + v104);
        *(void *)&v4[v103] = v105;
        v102 |= (unint64_t)(v106 & 0x7F) << v100;
        if ((v106 & 0x80) == 0) {
          goto LABEL_174;
        }
        v100 += 7;
        BOOL v20 = v101++ >= 9;
        if (v20)
        {
          uint64_t v102 = 0;
          goto LABEL_176;
        }
      }
      v4[*v11] = 1;
LABEL_174:
      if (v4[*v11]) {
        uint64_t v102 = 0;
      }
LABEL_176:
      BOOL v107 = v102 != 0;
      uint64_t v108 = 63;
LABEL_177:
      *((unsigned char *)&v5->super.super.isa + v108) = v107;
    }
    while (*(void *)&v4[*v9] < *(void *)&v4[*v10]);
  }
  uint64_t v110 = objc_msgSend(v129, "copy", v127);
  headers = v5->_headers;
  v5->_headers = (NSArray *)v110;

  uint64_t v112 = [v131 copy];
  accountHandles = v5->_accountHandles;
  v5->_accountHandles = (NSArray *)v112;

  uint64_t v114 = [v130 copy];
  mailboxIdentifiers = v5->_mailboxIdentifiers;
  v5->_mailboxIdentifiers = (NSArray *)v114;

  uint64_t v116 = [v128 copy];
  attachments = v5->_attachments;
  v5->_attachments = (NSArray *)v116;

  uint64_t v118 = [v6 copy];
  toHandles = v5->_toHandles;
  v5->_toHandles = (NSArray *)v118;

  uint64_t v120 = [v7 copy];
  ccHandles = v5->_ccHandles;
  v5->_ccHandles = (NSArray *)v120;

  uint64_t v122 = [v8 copy];
  bccHandles = v5->_bccHandles;
  v5->_bccHandles = (NSArray *)v122;

  int v124 = v4[*v11];
  if (v124) {
LABEL_185:
  }
    uint64_t v125 = 0;
  else {
LABEL_186:
  }
    uint64_t v125 = v5;

  return v125;
}

- (NSString)description
{
  id v20 = [NSString alloc];
  id v43 = [(BMProactiveHarvestingMail *)self uniqueID];
  uint64_t v42 = [(BMProactiveHarvestingMail *)self domainID];
  uint64_t v41 = [(BMProactiveHarvestingMail *)self absoluteTimestamp];
  uint64_t v40 = [(BMProactiveHarvestingMail *)self accountIdentifier];
  uint64_t v39 = [(BMProactiveHarvestingMail *)self messageIdentifier];
  uint64_t v38 = [(BMProactiveHarvestingMail *)self fromField];
  char v37 = [(BMProactiveHarvestingMail *)self toField];
  unint64_t v36 = [(BMProactiveHarvestingMail *)self ccField];
  uint64_t v35 = [(BMProactiveHarvestingMail *)self bccField];
  uint64_t v34 = [(BMProactiveHarvestingMail *)self headers];
  uint64_t v33 = [(BMProactiveHarvestingMail *)self subject];
  uint64_t v30 = [(BMProactiveHarvestingMail *)self htmlContentData];
  unsigned int v32 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isFullyDownloaded](self, "isFullyDownloaded"));
  uint64_t v29 = [(BMProactiveHarvestingMail *)self htmlContent];
  id v28 = [(BMProactiveHarvestingMail *)self textContent];
  id v27 = [(BMProactiveHarvestingMail *)self securityMethod];
  unint64_t v26 = [(BMProactiveHarvestingMail *)self accountHandles];
  char v31 = [(BMProactiveHarvestingMail *)self replyTo];
  uint64_t v23 = [(BMProactiveHarvestingMail *)self mailboxIdentifiers];
  uint64_t v25 = [(BMProactiveHarvestingMail *)self listID];
  uint64_t v22 = [(BMProactiveHarvestingMail *)self accountType];
  char v19 = [(BMProactiveHarvestingMail *)self attachments];
  unint64_t v18 = [(BMProactiveHarvestingMail *)self fromHandle];
  uint64_t v17 = [(BMProactiveHarvestingMail *)self toHandles];
  uint64_t v16 = [(BMProactiveHarvestingMail *)self ccHandles];
  uint64_t v24 = [(BMProactiveHarvestingMail *)self bccHandles];
  unint64_t v15 = [(BMProactiveHarvestingMail *)self contentProtection];
  uint64_t v12 = [(BMProactiveHarvestingMail *)self personaId];
  unsigned int v14 = [(BMProactiveHarvestingMail *)self conversationId];
  char v13 = [(BMProactiveHarvestingMail *)self dateReceived];
  long long v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMProactiveHarvestingMail mailCategories](self, "mailCategories"));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isNew](self, "isNew"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isTwoFactorCode](self, "isTwoFactorCode"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isFromMe](self, "isFromMe"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isJunk](self, "isJunk"));
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isRead](self, "isRead"));
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isVIP](self, "isVIP"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMail isFlagged](self, "isFlagged"));
  id v21 = (id)objc_msgSend(v20, "initWithFormat:", @"BMProactiveHarvestingMail with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, accountIdentifier: %@, messageIdentifier: %@, fromField: %@, toField: %@, ccField: %@, bccField: %@, headers: %@, subject: %@, htmlContentData: %@, isFullyDownloaded: %@, htmlContent: %@, textContent: %@, securityMethod: %@, accountHandles: %@, replyTo: %@, mailboxIdentifiers: %@, listID: %@, accountType: %@, attachments: %@, fromHandle: %@, toHandles: %@, ccHandles: %@, bccHandles: %@, contentProtection: %@, personaId: %@, conversationId: %@, dateReceived: %@, mailCategories: %@, isNew: %@, isTwoFactorCode: %@, isFromMe: %@, isJunk: %@, isRead: %@, isVIP: %@, isFlagged: %@", v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v30, v32, v29, v28, v27,
              v26,
              v31,
              v23,
              v25,
              v22,
              v19,
              v18,
              v17,
              v16,
              v24,
              v15,
              v12,
              v14,
              v13,
              v11,
              v10,
              v9,
              v8,
              v7,
              v3,
              v4,
              v5);

  return (NSString *)v21;
}

- (BMProactiveHarvestingMail)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromField:(id)a8 toField:(id)a9 ccField:(id)a10 bccField:(id)a11 headers:(id)a12 subject:(id)a13 htmlContentData:(id)a14 isFullyDownloaded:(id)a15 htmlContent:(id)a16 textContent:(id)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listID:(id)a22 accountType:(id)a23 attachments:(id)a24 fromHandle:(id)a25 toHandles:(id)a26 ccHandles:(id)a27 bccHandles:(id)a28 contentProtection:(id)a29 personaId:(id)a30 conversationId:(id)a31 dateReceived:(id)a32 mailCategories:(id)a33 isNew:(id)a34 isTwoFactorCode:(id)a35 isFromMe:(id)a36 isJunk:(id)a37 isRead:(id)a38 isVIP:(id)a39 isFlagged:(id)a40
{
  id v89 = a3;
  id v58 = a4;
  id v88 = a4;
  id v93 = a5;
  id v59 = a6;
  id v87 = a6;
  id v60 = a7;
  id v86 = a7;
  id v61 = a8;
  id v85 = a8;
  id v84 = a9;
  id v83 = a10;
  id v82 = a11;
  id v81 = a12;
  id v80 = a13;
  id v79 = a14;
  id v91 = a15;
  id v78 = a16;
  id v77 = a17;
  id v76 = a18;
  id v75 = a19;
  id v74 = a20;
  id v73 = a21;
  id v72 = a22;
  id v71 = a23;
  id v70 = a24;
  id v69 = a25;
  id v68 = a26;
  id v67 = a27;
  id v66 = a28;
  id v65 = a29;
  id v64 = a30;
  id v63 = a31;
  id v44 = a32;
  id v45 = a33;
  id v46 = a34;
  id v47 = a35;
  id v48 = a36;
  id v49 = a37;
  id v90 = a38;
  id v50 = a39;
  id v51 = a40;
  v94.receiver = self;
  v94.super_class = (Class)BMProactiveHarvestingMail;
  unsigned int v52 = [(BMEventBase *)&v94 init];
  if (v52)
  {
    v52->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v52->_uniqueID, a3);
    objc_storeStrong((id *)&v52->_domainID, v58);
    if (v93)
    {
      v52->_hasRaw_absoluteTimestamp = 1;
      [v93 timeIntervalSinceReferenceDate];
    }
    else
    {
      v52->_hasRaw_absoluteTimestamp = 0;
      double v53 = -1.0;
    }
    v52->_raw_absoluteTimestamp = v53;
    objc_storeStrong((id *)&v52->_accountIdentifier, v59);
    objc_storeStrong((id *)&v52->_messageIdentifier, v60);
    objc_storeStrong((id *)&v52->_fromField, v61);
    objc_storeStrong((id *)&v52->_toField, a9);
    objc_storeStrong((id *)&v52->_ccField, a10);
    objc_storeStrong((id *)&v52->_bccField, a11);
    objc_storeStrong((id *)&v52->_headers, a12);
    objc_storeStrong((id *)&v52->_subject, a13);
    objc_storeStrong((id *)&v52->_htmlContentData, a14);
    if (v91)
    {
      v52->_hasIsFullyDownloaded = 1;
      v52->_isFullyDownloaded = [v91 BOOLValue];
    }
    else
    {
      v52->_hasIsFullyDownloaded = 0;
      v52->_isFullyDownloaded = 0;
    }
    objc_storeStrong((id *)&v52->_htmlContent, a16);
    objc_storeStrong((id *)&v52->_textContent, a17);
    objc_storeStrong((id *)&v52->_securityMethod, a18);
    objc_storeStrong((id *)&v52->_accountHandles, a19);
    objc_storeStrong((id *)&v52->_replyTo, a20);
    objc_storeStrong((id *)&v52->_mailboxIdentifiers, a21);
    objc_storeStrong((id *)&v52->_listID, a22);
    objc_storeStrong((id *)&v52->_accountType, a23);
    objc_storeStrong((id *)&v52->_attachments, a24);
    objc_storeStrong((id *)&v52->_fromHandle, a25);
    objc_storeStrong((id *)&v52->_toHandles, a26);
    objc_storeStrong((id *)&v52->_ccHandles, a27);
    objc_storeStrong((id *)&v52->_bccHandles, a28);
    objc_storeStrong((id *)&v52->_contentProtection, a29);
    objc_storeStrong((id *)&v52->_personaId, a30);
    objc_storeStrong((id *)&v52->_conversationId, a31);
    if (v44)
    {
      v52->_hasRaw_dateReceived = 1;
      [v44 timeIntervalSinceReferenceDate];
    }
    else
    {
      v52->_hasRaw_dateReceived = 0;
      double v54 = -1.0;
    }
    v52->_raw_dateReceived = v54;
    if (v45)
    {
      v52->_hasMailCategories = 1;
      int v55 = [v45 intValue];
    }
    else
    {
      v52->_hasMailCategories = 0;
      int v55 = -1;
    }
    v52->_mailCategories = v55;
    if (v46)
    {
      v52->_hasIsNew = 1;
      v52->_isNew = [v46 BOOLValue];
    }
    else
    {
      v52->_hasIsNew = 0;
      v52->_isNew = 0;
    }
    if (v47)
    {
      v52->_hasIsTwoFactorCode = 1;
      v52->_isTwoFactorCode = [v47 BOOLValue];
    }
    else
    {
      v52->_hasIsTwoFactorCode = 0;
      v52->_isTwoFactorCode = 0;
    }
    if (v48)
    {
      v52->_hasIsFromMe = 1;
      v52->_isFromMe = [v48 BOOLValue];
    }
    else
    {
      v52->_hasIsFromMe = 0;
      v52->_isFromMe = 0;
    }
    if (v49)
    {
      v52->_hasIsJunuint64_t k = 1;
      v52->_isJunuint64_t k = [v49 BOOLValue];
    }
    else
    {
      v52->_hasIsJunuint64_t k = 0;
      v52->_isJunuint64_t k = 0;
    }
    if (v90)
    {
      v52->_hasIsRead = 1;
      v52->_isRead = [v90 BOOLValue];
    }
    else
    {
      v52->_hasIsRead = 0;
      v52->_isRead = 0;
    }
    if (v50)
    {
      v52->_hasIsVIP = 1;
      v52->_isVIP = [v50 BOOLValue];
    }
    else
    {
      v52->_hasIsVIP = 0;
      v52->_isVIP = 0;
    }
    if (v51)
    {
      v52->_hasIsFlagged = 1;
      v52->_isFlagged = [v51 BOOLValue];
    }
    else
    {
      v52->_hasIsFlagged = 0;
      v52->_isFlagged = 0;
    }
  }

  return v52;
}

+ (id)protoFields
{
  v42[38] = *MEMORY[0x1E4F143B8];
  uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  v42[0] = v41;
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domainID" number:2 type:13 subMessageClass:0];
  v42[1] = v40;
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:3 type:0 subMessageClass:0];
  v42[2] = v39;
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accountIdentifier" number:4 type:13 subMessageClass:0];
  v42[3] = v38;
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageIdentifier" number:5 type:13 subMessageClass:0];
  v42[4] = v37;
  unint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fromField" number:6 type:13 subMessageClass:0];
  v42[5] = v36;
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"toField" number:7 type:13 subMessageClass:0];
  v42[6] = v35;
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ccField" number:8 type:13 subMessageClass:0];
  v42[7] = v34;
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bccField" number:9 type:13 subMessageClass:0];
  v42[8] = v33;
  unsigned int v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"headers" number:10 type:14 subMessageClass:objc_opt_class()];
  v42[9] = v32;
  char v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subject" number:11 type:13 subMessageClass:0];
  v42[10] = v31;
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"htmlContentData" number:12 type:13 subMessageClass:0];
  v42[11] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFullyDownloaded" number:13 type:12 subMessageClass:0];
  v42[12] = v29;
  id v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"htmlContent" number:14 type:14 subMessageClass:0];
  v42[13] = v28;
  id v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"textContent" number:15 type:13 subMessageClass:0];
  v42[14] = v27;
  unint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"securityMethod" number:16 type:13 subMessageClass:0];
  v42[15] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accountHandles" number:17 type:13 subMessageClass:0];
  v42[16] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"replyTo" number:18 type:14 subMessageClass:objc_opt_class()];
  v42[17] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mailboxIdentifiers" number:19 type:13 subMessageClass:0];
  v42[18] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"listID" number:20 type:14 subMessageClass:objc_opt_class()];
  v42[19] = v22;
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accountType" number:21 type:13 subMessageClass:0];
  v42[20] = v21;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"attachments" number:22 type:14 subMessageClass:objc_opt_class()];
  v42[21] = v20;
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fromHandle" number:23 type:14 subMessageClass:objc_opt_class()];
  v42[22] = v19;
  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"toHandles" number:24 type:14 subMessageClass:objc_opt_class()];
  v42[23] = v18;
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ccHandles" number:25 type:14 subMessageClass:objc_opt_class()];
  v42[24] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bccHandles" number:26 type:14 subMessageClass:objc_opt_class()];
  v42[25] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:27 type:13 subMessageClass:0];
  v42[26] = v15;
  unsigned int v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:28 type:13 subMessageClass:0];
  v42[27] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"conversationId" number:29 type:13 subMessageClass:0];
  v42[28] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dateReceived" number:30 type:0 subMessageClass:0];
  v42[29] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mailCategories" number:31 type:2 subMessageClass:0];
  v42[30] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isNew" number:32 type:12 subMessageClass:0];
  v42[31] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isTwoFactorCode" number:33 type:12 subMessageClass:0];
  v42[32] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFromMe" number:34 type:12 subMessageClass:0];
  v42[33] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isJunk" number:35 type:12 subMessageClass:0];
  v42[34] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRead" number:36 type:12 subMessageClass:0];
  v42[35] = v9;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isVIP" number:37 type:12 subMessageClass:0];
  v42[36] = v10;
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFlagged" number:38 type:12 subMessageClass:0];
  v42[37] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:38];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5A48;
}

+ (id)columns
{
  v42[38] = *MEMORY[0x1E4F143B8];
  uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domainID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:1];
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accountIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageIdentifier" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  unint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fromField" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"toField" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ccField" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bccField" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  unsigned int v32 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"headers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_52061];
  char v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subject" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"htmlContentData" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFullyDownloaded" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  id v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"htmlContent" dataType:4 requestOnly:0 fieldNumber:14 protoDataType:14 convertedType:0];
  id v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"textContent" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  unint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"securityMethod" dataType:2 requestOnly:0 fieldNumber:16 protoDataType:13 convertedType:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"accountHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_281];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"replyTo_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_283_52062];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"mailboxIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_285];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"listID_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_287];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accountType" dataType:2 requestOnly:0 fieldNumber:21 protoDataType:13 convertedType:0];
  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"attachments_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_289_52063];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"fromHandle_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_291];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"toHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_293];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"ccHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_295];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bccHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_297];
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:27 protoDataType:13 convertedType:0];
  unsigned int v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:28 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"conversationId" dataType:2 requestOnly:0 fieldNumber:29 protoDataType:13 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dateReceived" dataType:3 requestOnly:0 fieldNumber:30 protoDataType:0 convertedType:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mailCategories" dataType:0 requestOnly:0 fieldNumber:31 protoDataType:2 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isNew" dataType:0 requestOnly:0 fieldNumber:32 protoDataType:12 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isTwoFactorCode" dataType:0 requestOnly:0 fieldNumber:33 protoDataType:12 convertedType:0];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFromMe" dataType:0 requestOnly:0 fieldNumber:34 protoDataType:12 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isJunk" dataType:0 requestOnly:0 fieldNumber:35 protoDataType:12 convertedType:0];
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRead" dataType:0 requestOnly:0 fieldNumber:36 protoDataType:12 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isVIP" dataType:0 requestOnly:0 fieldNumber:37 protoDataType:12 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFlagged" dataType:0 requestOnly:0 fieldNumber:38 protoDataType:12 convertedType:0];
  v42[0] = v41;
  v42[1] = v40;
  v42[2] = v39;
  v42[3] = v38;
  v42[4] = v37;
  v42[5] = v36;
  v42[6] = v35;
  v42[7] = v34;
  v42[8] = v33;
  v42[9] = v32;
  v42[10] = v31;
  v42[11] = v30;
  v42[12] = v29;
  v42[13] = v28;
  v42[14] = v27;
  v42[15] = v26;
  v42[16] = v25;
  v42[17] = v24;
  v42[18] = v23;
  v42[19] = v22;
  v42[20] = v20;
  v42[21] = v18;
  v42[22] = v17;
  v42[23] = v21;
  v42[24] = v16;
  v42[25] = v15;
  v42[26] = v19;
  v42[27] = v14;
  v42[28] = v2;
  v42[29] = v3;
  v42[30] = v4;
  v42[31] = v13;
  v42[32] = v5;
  v42[33] = v12;
  v42[34] = v6;
  v42[35] = v11;
  v42[36] = v7;
  v42[37] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:38];

  return v10;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_10(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _bccHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_9(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _ccHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_8(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _toHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 fromHandle];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _attachmentsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 listID];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _mailboxIdentifiersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 replyTo];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _accountHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _headersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingMail alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[17] = 3;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 3;
}

@end