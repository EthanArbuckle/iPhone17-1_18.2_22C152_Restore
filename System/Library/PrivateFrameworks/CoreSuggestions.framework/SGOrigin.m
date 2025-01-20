@interface SGOrigin
+ (BOOL)supportsSecureCoding;
+ (SGOrigin)originWithType:(unint64_t)a3 sourceKey:(id)a4 externalKey:(id)a5 bundleId:(id)a6 fromForwardedMessage:(BOOL)a7;
+ (SGOrigin)originWithType:(unint64_t)a3 sourceKey:(id)a4 externalKey:(id)a5 fromForwardedMessage:(BOOL)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrigin:(id)a3;
- (BOOL)isFromForwardedMessage;
- (BOOL)isSent;
- (CSPerson)fromPerson;
- (NSArray)bcc;
- (NSArray)cc;
- (NSArray)to;
- (NSArray)toPeople;
- (NSDate)date;
- (NSString)bundleId;
- (NSString)contextSnippet;
- (NSString)externalKey;
- (NSString)localizedApplicationName;
- (NSString)sourceKey;
- (NSString)teamId;
- (NSString)title;
- (NSURL)url;
- (SGOrigin)init;
- (SGOrigin)initWithCoder:(id)a3;
- (SGOrigin)initWithType:(unint64_t)a3 sourceKey:(id)a4 externalKey:(id)a5 bundleId:(id)a6 fromForwardedMessage:(BOOL)a7;
- (SGSimpleNamedEmailAddress)from;
- (_NSRange)contextSnippetRange;
- (id)universalURL;
- (unint64_t)hash;
- (unint64_t)type;
- (void)_resolveAppName;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGOrigin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_localizedApplicationName, 0);
  objc_storeStrong((id *)&self->_operatingSystemVersion, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_toPeople, 0);
  objc_storeStrong((id *)&self->_fromPerson, 0);
  objc_storeStrong((id *)&self->_contextSnippet, 0);
  objc_storeStrong((id *)&self->_externalKey, 0);

  objc_storeStrong((id *)&self->_sourceKey, 0);
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (BOOL)isFromForwardedMessage
{
  return self->_fromForwardedMessage;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)date
{
  return self->_date;
}

- (NSArray)bcc
{
  return self->_bcc;
}

- (NSArray)cc
{
  return self->_cc;
}

- (NSArray)to
{
  return self->_to;
}

- (NSString)teamId
{
  return self->_teamId;
}

- (NSString)localizedApplicationName
{
  return self->_localizedApplicationName;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSArray)toPeople
{
  return self->_toPeople;
}

- (CSPerson)fromPerson
{
  return self->_fromPerson;
}

- (NSString)externalKey
{
  return self->_externalKey;
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)universalURL
{
  unint64_t type = self->_type;
  if (type == 4)
  {
    v4 = +[SGEKEventConversions urlForEKEventFromTextMessageWithUniqueIdentifier:self->_externalKey];
  }
  else if (type == 1)
  {
    v4 = +[SGEKEventConversions urlForMailMessageWithId:self->_externalKey];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SGOrigin.m", 286, @"Unknown origin type: %lu", self->_type);

    v4 = 0;
  }

  return v4;
}

- (_NSRange)contextSnippetRange
{
  if (self->_shouldShowOperatingSystemVersion)
  {
    v3 = [(SGOrigin *)self contextSnippet];
    uint64_t v4 = [v3 length];
    NSUInteger v5 = v4 - [(NSString *)self->_contextSnippet length];

    NSUInteger location = v5 + self->_contextSnippetRange.location;
  }
  else
  {
    NSUInteger location = self->_contextSnippetRange.location;
  }
  NSUInteger length = self->_contextSnippetRange.length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)contextSnippet
{
  if (self->_shouldShowOperatingSystemVersion)
  {
    id v3 = [NSString alloc];
    if ([(NSString *)self->_operatingSystemVersion length]) {
      operatingSystemVersion = (__CFString *)self->_operatingSystemVersion;
    }
    else {
      operatingSystemVersion = @"Unknown OS";
    }
    NSUInteger v5 = (NSString *)[v3 initWithFormat:@"[%@]%@", operatingSystemVersion, self->_contextSnippet];
  }
  else
  {
    NSUInteger v5 = self->_contextSnippet;
  }

  return v5;
}

- (SGSimpleNamedEmailAddress)from
{
  return (SGSimpleNamedEmailAddress *)[(CSPerson *)self->_fromPerson sg_namedEmailAddress];
}

- (unint64_t)hash
{
  unint64_t type = self->_type;
  NSUInteger v4 = [(NSString *)self->_sourceKey hash] - type + 32 * type;
  return [(NSString *)self->_externalKey hash] - v4 + 32 * v4;
}

- (BOOL)isEqualToOrigin:(id)a3
{
  NSUInteger v4 = (id *)a3;
  NSUInteger v5 = v4;
  if (self->_type != v4[1]) {
    goto LABEL_59;
  }
  sourceKey = self->_sourceKey;
  v7 = (NSString *)v4[2];
  if (sourceKey == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = sourceKey;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_59;
    }
  }
  externalKey = self->_externalKey;
  v12 = (NSString *)v5[3];
  if (externalKey == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = externalKey;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_59;
    }
  }
  contextSnippet = self->_contextSnippet;
  v17 = (NSString *)v5[4];
  if (contextSnippet == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = contextSnippet;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_59;
    }
  }
  BOOL v21 = 0;
  if (self->_contextSnippetRange.location == v5[5] && self->_contextSnippetRange.length == v5[6])
  {
    fromPerson = self->_fromPerson;
    v23 = (CSPerson *)v5[7];
    if (fromPerson == v23)
    {
    }
    else
    {
      v24 = v23;
      v25 = fromPerson;
      char v26 = [(CSPerson *)v25 isEqual:v24];

      if ((v26 & 1) == 0) {
        goto LABEL_59;
      }
    }
    toPeople = self->_toPeople;
    v28 = (NSArray *)v5[8];
    if (toPeople == v28)
    {
    }
    else
    {
      v29 = v28;
      v30 = toPeople;
      char v31 = [(NSArray *)v30 isEqual:v29];

      if ((v31 & 1) == 0) {
        goto LABEL_59;
      }
    }
    bundleId = self->_bundleId;
    v33 = (NSString *)v5[9];
    if (bundleId == v33)
    {
    }
    else
    {
      v34 = v33;
      v35 = bundleId;
      char v36 = [(NSString *)v35 isEqual:v34];

      if ((v36 & 1) == 0) {
        goto LABEL_59;
      }
    }
    localizedApplicationName = self->_localizedApplicationName;
    v38 = (NSString *)v5[17];
    if (localizedApplicationName == v38)
    {
    }
    else
    {
      v39 = v38;
      v40 = localizedApplicationName;
      char v41 = [(NSString *)v40 isEqual:v39];

      if ((v41 & 1) == 0) {
        goto LABEL_59;
      }
    }
    teamId = self->_teamId;
    v43 = (NSString *)v5[18];
    if (teamId == v43)
    {
    }
    else
    {
      v44 = v43;
      v45 = teamId;
      char v46 = [(NSString *)v45 isEqual:v44];

      if ((v46 & 1) == 0) {
        goto LABEL_59;
      }
    }
    to = self->_to;
    v48 = (NSArray *)v5[10];
    if (to == v48)
    {
    }
    else
    {
      v49 = v48;
      v50 = to;
      char v51 = [(NSArray *)v50 isEqual:v49];

      if ((v51 & 1) == 0) {
        goto LABEL_59;
      }
    }
    cc = self->_cc;
    v53 = (NSArray *)v5[11];
    if (cc == v53)
    {
    }
    else
    {
      v54 = v53;
      v55 = cc;
      char v56 = [(NSArray *)v55 isEqual:v54];

      if ((v56 & 1) == 0) {
        goto LABEL_59;
      }
    }
    bcc = self->_bcc;
    v58 = (NSArray *)v5[12];
    if (bcc == v58)
    {
    }
    else
    {
      v59 = v58;
      v60 = bcc;
      char v61 = [(NSArray *)v60 isEqual:v59];

      if ((v61 & 1) == 0) {
        goto LABEL_59;
      }
    }
    date = self->_date;
    v63 = (NSDate *)v5[13];
    if (date == v63)
    {
    }
    else
    {
      v64 = v63;
      v65 = date;
      char v66 = [(NSDate *)v65 isEqual:v64];

      if ((v66 & 1) == 0) {
        goto LABEL_59;
      }
    }
    title = self->_title;
    v68 = (NSString *)v5[14];
    if (title == v68)
    {
    }
    else
    {
      v69 = v68;
      v70 = title;
      char v71 = [(NSString *)v70 isEqual:v69];

      if ((v71 & 1) == 0) {
        goto LABEL_59;
      }
    }
    if (self->_fromForwardedMessage == *((unsigned __int8 *)v5 + 130))
    {
      operatingSystemVersion = self->_operatingSystemVersion;
      v73 = (NSString *)v5[15];
      if (operatingSystemVersion == v73)
      {
      }
      else
      {
        v74 = v73;
        v75 = operatingSystemVersion;
        char v76 = [(NSString *)v75 isEqual:v74];

        if ((v76 & 1) == 0) {
          goto LABEL_59;
        }
      }
      BOOL v21 = self->_isSent == *((unsigned __int8 *)v5 + 128);
      goto LABEL_60;
    }
LABEL_59:
    BOOL v21 = 0;
  }
LABEL_60:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SGOrigin *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGOrigin *)self isEqualToOrigin:v5];

  return v6;
}

- (NSURL)url
{
  unint64_t type = self->_type;
  if (type > 7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SGOrigin.m", 190, @"Unknown origin type: %lu", self->_type);
    NSUInteger v4 = 0;
  }
  else
  {
    if (((1 << type) & 0xED) != 0)
    {
      NSUInteger v4 = 0;
      goto LABEL_10;
    }
    NSUInteger v5 = (void *)MEMORY[0x1E4F1CB10];
    if (type == 1)
    {
      id v6 = [NSString alloc];
      externalKey = self->_externalKey;
      v8 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
      v9 = [(NSString *)externalKey stringByAddingPercentEncodingWithAllowedCharacters:v8];
      uint64_t v10 = [v6 initWithFormat:@"message:%@", v9];
    }
    else
    {
      id v12 = [NSString alloc];
      v13 = self->_externalKey;
      v8 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
      v9 = [(NSString *)v13 stringByAddingPercentEncodingWithAllowedCharacters:v8];
      uint64_t v10 = [v12 initWithFormat:@"messages:openchat?guid=%@", v9];
    }
    v14 = (void *)v10;
    NSUInteger v4 = [v5 URLWithString:v10];
  }
LABEL_10:

  return (NSURL *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt64:type forKey:@"type"];
  [v5 encodeObject:self->_sourceKey forKey:@"sourceKey"];
  [v5 encodeObject:self->_externalKey forKey:@"externalKey"];
  [v5 encodeObject:self->_contextSnippet forKey:@"contextSnippet"];
  [v5 encodeInteger:self->_contextSnippetRange.location forKey:@"contextSnippetRange_location"];
  [v5 encodeInteger:self->_contextSnippetRange.length forKey:@"contextSnippetRange_length"];
  [v5 encodeObject:self->_fromPerson forKey:@"fromPerson"];
  [v5 encodeObject:self->_toPeople forKey:@"toPeople"];
  [v5 encodeObject:self->_bundleId forKey:@"bundleId"];
  [v5 encodeObject:self->_localizedApplicationName forKey:@"localizedApplicationName"];
  [v5 encodeObject:self->_teamId forKey:@"teamId"];
  [v5 encodeObject:self->_to forKey:@"to"];
  [v5 encodeObject:self->_cc forKey:@"cc"];
  [v5 encodeObject:self->_bcc forKey:@"bcc"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeBool:self->_fromForwardedMessage forKey:@"fromForwardedMessage"];
  [v5 encodeObject:self->_operatingSystemVersion forKey:@"operatingSystemVersion"];
  [v5 encodeBool:self->_shouldShowOperatingSystemVersion forKey:@"shouldShowOperatingSystemVersion"];
  [v5 encodeBool:self->_isSent forKey:@"isSent"];
}

- (SGOrigin)initWithCoder:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)SGOrigin;
  id v5 = [(SGOrigin *)&v59 init];
  if (v5)
  {
    v5->_unint64_t type = [v4 decodeInt64ForKey:@"type"];
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"sourceKey"];
    sourceKey = v5->_sourceKey;
    v5->_sourceKey = (NSString *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"externalKey"];
    externalKey = v5->_externalKey;
    v5->_externalKey = (NSString *)v10;

    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"contextSnippet"];
    contextSnippet = v5->_contextSnippet;
    v5->_contextSnippet = (NSString *)v13;

    uint64_t v15 = [v4 decodeIntegerForKey:@"contextSnippetRange_location"];
    uint64_t v16 = [v4 decodeIntegerForKey:@"contextSnippetRange_length"];
    v5->_contextSnippetRange.NSUInteger location = v15;
    v5->_contextSnippetRange.NSUInteger length = v16;
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"fromPerson"];
    fromPerson = v5->_fromPerson;
    v5->_fromPerson = (CSPerson *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"toPeople"];
    toPeople = v5->_toPeople;
    v5->_toPeople = (NSArray *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"bundleId"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"localizedApplicationName"];
    localizedApplicationName = v5->_localizedApplicationName;
    v5->_localizedApplicationName = (NSString *)v29;

    char v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"teamId"];
    teamId = v5->_teamId;
    v5->_teamId = (NSString *)v32;

    id v34 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v35 = objc_opt_class();
    char v36 = objc_msgSend(v34, "initWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"to"];
    to = v5->_to;
    v5->_to = (NSArray *)v37;

    id v39 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v40 = objc_opt_class();
    char v41 = objc_msgSend(v39, "initWithObjects:", v40, objc_opt_class(), 0);
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"cc"];
    cc = v5->_cc;
    v5->_cc = (NSArray *)v42;

    id v44 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v45 = objc_opt_class();
    char v46 = objc_msgSend(v44, "initWithObjects:", v45, objc_opt_class(), 0);
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"bcc"];
    bcc = v5->_bcc;
    v5->_bcc = (NSArray *)v47;

    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v50 = [v4 decodeObjectOfClasses:v49 forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v50;

    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v53 = [v4 decodeObjectOfClasses:v52 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v53;

    v5->_fromForwardedMessage = [v4 decodeBoolForKey:@"fromForwardedMessage"];
    v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v56 = [v4 decodeObjectOfClasses:v55 forKey:@"operatingSystemVersion"];
    operatingSystemVersion = v5->_operatingSystemVersion;
    v5->_operatingSystemVersion = (NSString *)v56;

    v5->_shouldShowOperatingSystemVersion = [v4 decodeBoolForKey:@"shouldShowOperatingSystemVersion"];
    v5->_isSent = [v4 decodeBoolForKey:@"isSent"];
  }

  return v5;
}

- (void)_resolveAppName
{
  if (_resolveAppName__pasOnceToken2 != -1) {
    dispatch_once(&_resolveAppName__pasOnceToken2, &__block_literal_global_5045);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__SGOrigin__resolveAppName__block_invoke_2;
  v4[3] = &unk_1E5B8FC58;
  v4[4] = self;
  id v3 = (id)_resolveAppName__pasExprOnceResult;
  [v3 runWithLockAcquired:v4];
}

void __27__SGOrigin__resolveAppName__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 72)];
  if (!v4)
  {
    id v5 = (void *)MEMORY[0x1A6265250]();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 72);
    id v19 = 0;
    uint64_t v7 = [MEMORY[0x1E4F223C8] bundleRecordWithBundleIdentifier:v6 allowPlaceholder:0 error:&v19];
    id v8 = v19;
    if (v7)
    {
      if ((unint64_t)[v3 count] >= 5) {
        [v3 removeAllObjects];
      }
      id v9 = objc_alloc(MEMORY[0x1E4F93BB8]);
      uint64_t v10 = [v7 localizedName];
      v11 = [v7 teamIdentifier];
      id v4 = (void *)[v9 initWithFirst:v10 second:v11];

      [v3 setObject:v4 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 72)];
    }
    else
    {
      id v12 = sgLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v8;
        _os_log_impl(&dword_1A4D8C000, v12, OS_LOG_TYPE_DEFAULT, "SGOrigin: no bundle record found %@", buf, 0xCu);
      }

      id v4 = 0;
    }
  }
  uint64_t v13 = [v4 first];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 136);
  *(void *)(v14 + 136) = v13;

  uint64_t v16 = [v4 second];
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void **)(v17 + 144);
  *(void *)(v17 + 144) = v16;
}

void __27__SGOrigin__resolveAppName__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6265250]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  id v4 = (void *)_resolveAppName__pasExprOnceResult;
  _resolveAppName__pasExprOnceResult = v3;
}

- (SGOrigin)initWithType:(unint64_t)a3 sourceKey:(id)a4 externalKey:(id)a5 bundleId:(id)a6 fromForwardedMessage:(BOOL)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(SGOrigin *)self init];
  uint64_t v16 = v15;
  if (v15)
  {
    v15->_unint64_t type = a3;
    uint64_t v17 = [v12 copy];
    sourceKey = v16->_sourceKey;
    v16->_sourceKey = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    externalKey = v16->_externalKey;
    v16->_externalKey = (NSString *)v19;

    v16->_fromForwardedMessage = a7;
    if (!v14)
    {
      switch(a3)
      {
        case 1uLL:
          uint64_t v23 = @"com.apple.mobilemail";
          goto LABEL_10;
        case 4uLL:
          uint64_t v23 = @"com.apple.MobileSMS";
          goto LABEL_10;
        case 5uLL:
          id v21 = v16->_sourceKey;
          goto LABEL_4;
        case 7uLL:
          uint64_t v23 = @"com.apple.mobilesafari";
LABEL_10:
          v24 = v23;
          bundleId = v16->_bundleId;
          v16->_bundleId = &v23->isa;
          goto LABEL_11;
        default:
          goto LABEL_12;
      }
    }
    id v21 = (NSString *)[v14 copy];
LABEL_4:
    bundleId = v16->_bundleId;
    v16->_bundleId = v21;
LABEL_11:

LABEL_12:
    if (v16->_bundleId) {
      [(SGOrigin *)v16 _resolveAppName];
    }
  }

  return v16;
}

- (SGOrigin)init
{
  v3.receiver = self;
  v3.super_class = (Class)SGOrigin;
  _NSRange result = [(SGOrigin *)&v3 init];
  if (result) {
    result->_contextSnippetRange = (_NSRange)xmmword_1A4E19870;
  }
  return result;
}

+ (SGOrigin)originWithType:(unint64_t)a3 sourceKey:(id)a4 externalKey:(id)a5 fromForwardedMessage:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  v11 = [[SGOrigin alloc] initWithType:a3 sourceKey:v10 externalKey:v9 bundleId:0 fromForwardedMessage:v6];

  return v11;
}

+ (SGOrigin)originWithType:(unint64_t)a3 sourceKey:(id)a4 externalKey:(id)a5 bundleId:(id)a6 fromForwardedMessage:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [[SGOrigin alloc] initWithType:a3 sourceKey:v13 externalKey:v12 bundleId:v11 fromForwardedMessage:v7];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end