@interface _KSTextReplacementEntry
+ (BOOL)supportsSecureCoding;
+ (id)localEntryFromCloudEntry:(id)a3;
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)needsSaveToCloud;
- (BOOL)wasDeleted;
- (NSData)cloudData;
- (NSDate)timestamp;
- (NSString)cloudID;
- (NSString)phrase;
- (NSString)shortcut;
- (_KSTextReplacementEntry)init;
- (_KSTextReplacementEntry)initWithCoder:(id)a3;
- (_KSTextReplacementEntry)priorValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encryptedFields;
- (id)unEncryptedFields;
- (id)uniqueID;
- (id)uniqueRecordName;
- (id)uniqueRecordNameVer0;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudData:(id)a3;
- (void)setCloudID:(id)a3;
- (void)setNeedsSaveToCloud:(BOOL)a3;
- (void)setPhrase:(id)a3;
- (void)setPriorValue:(id)a3;
- (void)setShortcut:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setWasDeleted:(BOOL)a3;
@end

@implementation _KSTextReplacementEntry

- (NSString)shortcut
{
  return self->_shortcut;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (_KSTextReplacementEntry)init
{
  v10.receiver = self;
  v10.super_class = (Class)_KSTextReplacementEntry;
  v2 = [(_KSTextReplacementEntry *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSDate *)v3;

    uint64_t v5 = [(_KSTextReplacementEntry *)v2 uniqueID];
    cloudID = v2->_cloudID;
    v2->_cloudID = (NSString *)v5;

    shortcut = v2->_shortcut;
    v2->_shortcut = (NSString *)&stru_26DE8B7B0;

    phrase = v2->_phrase;
    v2->_phrase = (NSString *)&stru_26DE8B7B0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudData, 0);
  objc_storeStrong((id *)&self->_priorValue, 0);
  objc_storeStrong((id *)&self->_cloudID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
}

- (id)uniqueID
{
  v2 = [MEMORY[0x263F08C38] UUID];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

- (void)setWasDeleted:(BOOL)a3
{
  self->_wasDeleted = a3;
}

- (void)setTimestamp:(id)a3
{
}

- (void)setShortcut:(id)a3
{
}

- (void)setPhrase:(id)a3
{
}

- (void)setNeedsSaveToCloud:(BOOL)a3
{
  self->_needsSaveToCloud = a3;
}

- (void)setCloudID:(id)a3
{
}

- (void)setCloudData:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_phrase copyWithZone:a3];
    v7 = (void *)v5[2];
    v5[2] = v6;

    uint64_t v8 = [(NSString *)self->_shortcut copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    uint64_t v10 = [(NSDate *)self->_timestamp copyWithZone:a3];
    v11 = (void *)v5[4];
    v5[4] = v10;

    id v12 = [(_KSTextReplacementEntry *)self->_priorValue copyWithZone:a3];
    v13 = (void *)v5[6];
    v5[6] = v12;

    uint64_t v14 = [(NSString *)self->_cloudID copyWithZone:a3];
    v15 = (void *)v5[5];
    v5[5] = v14;

    if (!v5[5])
    {
      uint64_t v16 = [(_KSTextReplacementEntry *)self uniqueID];
      v17 = (void *)v5[5];
      v5[5] = v16;
    }
  }
  return v5;
}

- (_KSTextReplacementEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_KSTextReplacementEntry;
  uint64_t v5 = [(_KSTextReplacementEntry *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phrase"];
    phrase = v5->_phrase;
    v5->_phrase = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcut"];
    shortcut = v5->_shortcut;
    v5->_shortcut = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priorValue"];
    priorValue = v5->_priorValue;
    v5->_priorValue = (_KSTextReplacementEntry *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudID"];
    cloudID = v5->_cloudID;
    v5->_cloudID = (NSString *)v14;

    if (!v5->_cloudID)
    {
      uint64_t v16 = [(_KSTextReplacementEntry *)v5 uniqueID];
      v17 = v5->_cloudID;
      v5->_cloudID = (NSString *)v16;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  phrase = self->_phrase;
  id v5 = a3;
  [v5 encodeObject:phrase forKey:@"phrase"];
  [v5 encodeObject:self->_shortcut forKey:@"shortcut"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_priorValue forKey:@"priorValue"];
  [v5 encodeObject:self->_cloudID forKey:@"cloudID"];
}

- (id)uniqueRecordNameVer0
{
  uint64_t v3 = NSString;
  id v4 = [(_KSTextReplacementEntry *)self shortcut];
  id v5 = [(_KSTextReplacementEntry *)self phrase];
  uint64_t v6 = [v3 stringWithFormat:@"%@-%@", v4, v5];

  return v6;
}

- (id)uniqueRecordName
{
  uint64_t v3 = NSString;
  id v4 = [(_KSTextReplacementEntry *)self shortcut];
  id v5 = [(_KSTextReplacementEntry *)self phrase];
  uint64_t v6 = [v3 stringWithFormat:@"%@%@", v4, v5];

  v7 = [MEMORY[0x263F08708] illegalCharacterSet];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  v9 = [MEMORY[0x263F08708] controlCharacterSet];
  uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];

  v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];

  return v12;
}

- (NSString)cloudID
{
  cloudID = self->_cloudID;
  if (!cloudID)
  {
    id v4 = [(_KSTextReplacementEntry *)self uniqueID];
    id v5 = self->_cloudID;
    self->_cloudID = v4;

    cloudID = self->_cloudID;
  }
  return cloudID;
}

- (id)unEncryptedFields
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"timestamp";
  v2 = [(_KSTextReplacementEntry *)self timestamp];
  v6[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)encryptedFields
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(_KSTextReplacementEntry *)self shortcut];
  id v5 = [v4 dataUsingEncoding:4];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"shortcutE"];
  }
  uint64_t v6 = [(_KSTextReplacementEntry *)self phrase];
  v7 = [v6 dataUsingEncoding:4];

  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"phraseE"];
  }

  return v3;
}

+ (id)localEntryFromCloudEntry:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(_KSTextReplacementEntry);
  id v5 = [v3 encryptedValuesByKey];
  uint64_t v6 = [v5 objectForKey:@"shortcutE"];

  if (v6)
  {
    uint64_t v7 = [[NSString alloc] initWithData:v6 encoding:4];
  }
  else
  {
    uint64_t v7 = [v3 objectForKey:@"shortcut"];
  }
  uint64_t v8 = (void *)v7;
  [(_KSTextReplacementEntry *)v4 setShortcut:v7];

  v9 = [v3 encryptedValuesByKey];
  uint64_t v10 = [v9 objectForKey:@"phraseE"];

  if (v10)
  {
    uint64_t v11 = [[NSString alloc] initWithData:v10 encoding:4];
  }
  else
  {
    uint64_t v11 = [v3 objectForKey:@"phrase"];
  }
  uint64_t v12 = (void *)v11;
  [(_KSTextReplacementEntry *)v4 setPhrase:v11];

  v13 = [v3 objectForKey:@"timestamp"];
  [(_KSTextReplacementEntry *)v4 setTimestamp:v13];

  uint64_t v14 = [v3 recordID];
  v15 = [v14 recordName];
  [(_KSTextReplacementEntry *)v4 setCloudID:v15];

  uint64_t v16 = [(_KSTextReplacementEntry *)v4 shortcut];

  if (!v16) {
    [(_KSTextReplacementEntry *)v4 setShortcut:&stru_26DE8B7B0];
  }
  v17 = [(_KSTextReplacementEntry *)v4 phrase];

  if (!v17) {
    [(_KSTextReplacementEntry *)v4 setPhrase:&stru_26DE8B7B0];
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  [v3 encodeSystemFieldsWithCoder:v18];
  [v18 finishEncoding];
  objc_super v19 = [v18 encodedData];
  v20 = [MEMORY[0x263EFF8F8] dataWithData:v19];
  [(_KSTextReplacementEntry *)v4 setCloudData:v20];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(_KSTextReplacementEntry *)self shortcut];
  id v5 = [(_KSTextReplacementEntry *)self phrase];
  uint64_t v6 = [v3 stringWithFormat:@"%@, %@", v4, v5];

  return v6;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = a3;
  id v5 = [(_KSTextReplacementEntry *)self shortcut];
  uint64_t v6 = [v4 shortcut];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [(_KSTextReplacementEntry *)self phrase];
    uint64_t v8 = [v4 phrase];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (_KSTextReplacementEntry)priorValue
{
  return self->_priorValue;
}

- (void)setPriorValue:(id)a3
{
}

- (NSData)cloudData
{
  return self->_cloudData;
}

- (BOOL)needsSaveToCloud
{
  return self->_needsSaveToCloud;
}

- (BOOL)wasDeleted
{
  return self->_wasDeleted;
}

@end