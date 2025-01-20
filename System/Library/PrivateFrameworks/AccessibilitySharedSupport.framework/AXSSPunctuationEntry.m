@interface AXSSPunctuationEntry
+ (id)punctuationEntryFromJSONDictionary:(id)a3;
+ (id)punctuationEntryFromJSONRepresentation:(id)a3;
- (AXSSPunctuationEntry)init;
- (BOOL)inCloud;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonRepresentation;
- (NSDate)ckRecordProcessDate;
- (NSDate)lastModifiedDate;
- (NSDictionary)jsonDictionary;
- (NSString)ckChangeTag;
- (NSString)punctuation;
- (NSString)replacement;
- (NSUUID)groupUUID;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)rule;
- (unsigned)version;
- (void)setCkChangeTag:(id)a3;
- (void)setCkRecordProcessDate:(id)a3;
- (void)setGroupUUID:(id)a3;
- (void)setInCloud:(BOOL)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setPunctuation:(id)a3;
- (void)setReplacement:(id)a3;
- (void)setRule:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(unsigned __int16)a3;
@end

@implementation AXSSPunctuationEntry

- (AXSSPunctuationEntry)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXSSPunctuationEntry;
  v2 = [(AXSSPunctuationEntry *)&v5 init];
  v3 = [MEMORY[0x1E4F29128] UUID];
  [(AXSSPunctuationEntry *)v2 setUuid:v3];

  [(AXSSPunctuationEntry *)v2 setRule:1];
  [(AXSSPunctuationEntry *)v2 setVersion:1];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[AXSSPunctuationEntry allocWithZone:a3] init];
  [(AXSSPunctuationEntry *)v4 setRule:[(AXSSPunctuationEntry *)self rule]];
  objc_super v5 = [(AXSSPunctuationEntry *)self punctuation];
  [(AXSSPunctuationEntry *)v4 setPunctuation:v5];

  v6 = [(AXSSPunctuationEntry *)self replacement];
  [(AXSSPunctuationEntry *)v4 setReplacement:v6];

  v7 = [(AXSSPunctuationEntry *)self uuid];
  [(AXSSPunctuationEntry *)v4 setUuid:v7];

  v8 = [(AXSSPunctuationEntry *)self groupUUID];
  [(AXSSPunctuationEntry *)v4 setGroupUUID:v8];

  [(AXSSPunctuationEntry *)v4 setVersion:[(AXSSPunctuationEntry *)self version]];
  [(AXSSPunctuationEntry *)v4 setInCloud:[(AXSSPunctuationEntry *)self inCloud]];
  v9 = [(AXSSPunctuationEntry *)self ckChangeTag];
  [(AXSSPunctuationEntry *)v4 setCkChangeTag:v9];

  v10 = [(AXSSPunctuationEntry *)self lastModifiedDate];
  [(AXSSPunctuationEntry *)v4 setLastModifiedDate:v10];

  v11 = [(AXSSPunctuationEntry *)self ckRecordProcessDate];
  [(AXSSPunctuationEntry *)v4 setCkRecordProcessDate:v11];

  return v4;
}

+ (id)punctuationEntryFromJSONDictionary:(id)a3
{
  id v3 = a3;
  v4 = [[AXSSPunctuationEntry alloc] init];
  objc_super v5 = [v3 objectForKeyedSubscript:@"rule"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = +[AXSSPunctuationManager sharedDatabase];
    v7 = [v3 objectForKeyedSubscript:@"rule"];
    -[AXSSPunctuationEntry setRule:](v4, "setRule:", [v6 stringToRule:v7]);
  }
  else
  {
    [(AXSSPunctuationEntry *)v4 setRule:[(AXSSPunctuationEntry *)v4 rule]];
  }

  v8 = [v3 objectForKeyedSubscript:@"punctuation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v3 objectForKeyedSubscript:@"punctuation"];
    [(AXSSPunctuationEntry *)v4 setPunctuation:v9];
  }
  else
  {
    [(AXSSPunctuationEntry *)v4 setPunctuation:0];
  }

  v10 = [v3 objectForKeyedSubscript:@"replacement"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v3 objectForKeyedSubscript:@"replacement"];
    [(AXSSPunctuationEntry *)v4 setReplacement:v11];
  }
  else
  {
    [(AXSSPunctuationEntry *)v4 setReplacement:0];
  }

  v12 = [v3 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [v3 objectForKeyedSubscript:@"version"];
    -[AXSSPunctuationEntry setVersion:](v4, "setVersion:", (unsigned __int16)[v13 intValue]);
  }
  else
  {
    [(AXSSPunctuationEntry *)v4 setVersion:1];
  }

  v14 = [v3 objectForKeyedSubscript:@"groupUUID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = objc_alloc(MEMORY[0x1E4F29128]);
    v16 = [v3 objectForKeyedSubscript:@"groupUUID"];
    v17 = (void *)[v15 initWithUUIDString:v16];
    [(AXSSPunctuationEntry *)v4 setGroupUUID:v17];
  }
  else
  {
    [(AXSSPunctuationEntry *)v4 setGroupUUID:0];
  }

  return v4;
}

+ (id)punctuationEntryFromJSONRepresentation:(id)a3
{
  id v9 = 0;
  v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:1 error:&v9];
  id v5 = v9;
  if (v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[AXSSPunctuationGroup punctuationGroupFromJSONRepresentation:v7];
    }

    v6 = 0;
  }
  else
  {
    v6 = [a1 punctuationEntryFromJSONDictionary:v4];
  }

  return v6;
}

- (void)setGroupUUID:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

- (void)setCkRecordProcessDate:(id)a3
{
}

- (NSDictionary)jsonDictionary
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16 = @"rule";
  id v3 = +[AXSSPunctuationManager sharedDatabase];
  v4 = objc_msgSend(v3, "ruleToString:", -[AXSSPunctuationEntry rule](self, "rule"));
  v17[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v6 = (void *)[v5 mutableCopy];

  v7 = [(AXSSPunctuationEntry *)self punctuation];

  if (v7)
  {
    v8 = [(AXSSPunctuationEntry *)self punctuation];
    [v6 setObject:v8 forKeyedSubscript:@"punctuation"];
  }
  id v9 = [(AXSSPunctuationEntry *)self replacement];

  if (v9)
  {
    v10 = [(AXSSPunctuationEntry *)self replacement];
    [v6 setObject:v10 forKeyedSubscript:@"replacement"];
  }
  v11 = [(AXSSPunctuationEntry *)self groupUUID];

  if (v11)
  {
    v12 = [(AXSSPunctuationEntry *)self groupUUID];
    v13 = [v12 UUIDString];
    [v6 setObject:v13 forKeyedSubscript:@"groupUUID"];
  }
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[AXSSPunctuationEntry version](self, "version"));
  [v6 setObject:v14 forKeyedSubscript:@"version"];

  return (NSDictionary *)v6;
}

- (NSData)jsonRepresentation
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(AXSSPunctuationEntry *)self jsonDictionary];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (v5)
  {
    v6 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(AXSSPunctuationGroup *)(uint64_t)v5 jsonRepresentation];
    }
  }

  return (NSData *)v4;
}

- (id)description
{
  id v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)AXSSPunctuationEntry;
  v4 = [(AXSSPunctuationEntry *)&v15 description];
  unsigned int v5 = [(AXSSPunctuationEntry *)self version];
  v6 = [(AXSSPunctuationEntry *)self punctuation];
  v7 = [(AXSSPunctuationEntry *)self replacement];
  int64_t v8 = [(AXSSPunctuationEntry *)self rule];
  BOOL v9 = [(AXSSPunctuationEntry *)self inCloud];
  v10 = [(AXSSPunctuationEntry *)self ckChangeTag];
  v11 = [(AXSSPunctuationEntry *)self uuid];
  v12 = [(AXSSPunctuationEntry *)self groupUUID];
  v13 = [v3 stringWithFormat:@"%@[v%d]: punctuation: %@, replacement: %@, rule: %d (In Cloud: %d: %@), uuid: %@  group uuid: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [v4 uuid];
    v6 = [(AXSSPunctuationEntry *)self uuid];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (NSString)punctuation
{
  return self->_punctuation;
}

- (void)setPunctuation:(id)a3
{
}

- (NSString)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
}

- (int64_t)rule
{
  return self->_rule;
}

- (void)setRule:(int64_t)a3
{
  self->_rule = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (BOOL)inCloud
{
  return self->_inCloud;
}

- (void)setInCloud:(BOOL)a3
{
  self->_inCloud = a3;
}

- (NSString)ckChangeTag
{
  return self->_ckChangeTag;
}

- (void)setCkChangeTag:(id)a3
{
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (NSDate)ckRecordProcessDate
{
  return self->_ckRecordProcessDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckRecordProcessDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_ckChangeTag, 0);
  objc_storeStrong((id *)&self->_replacement, 0);
  objc_storeStrong((id *)&self->_punctuation, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end