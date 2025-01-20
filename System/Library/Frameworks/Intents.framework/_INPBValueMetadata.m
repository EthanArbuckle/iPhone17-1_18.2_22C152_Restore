@interface _INPBValueMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)confirmed;
- (BOOL)hasCanonicalValue;
- (BOOL)hasConfidenceScore;
- (BOOL)hasConfirmed;
- (BOOL)hasInput;
- (BOOL)hasSource;
- (BOOL)hasSourceAppBundleIdentifier;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)canonicalValue;
- (NSString)input;
- (NSString)source;
- (NSString)sourceAppBundleIdentifier;
- (NSString)uuid;
- (_INPBConfidenceScore)confidenceScore;
- (_INPBValueMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)requiredEntitlementsAsString:(int)a3;
- (int)StringAsRequiredEntitlements:(id)a3;
- (int)requiredEntitlementAtIndex:(unint64_t)a3;
- (int)requiredEntitlements;
- (unint64_t)hash;
- (unint64_t)requiredEntitlementsCount;
- (void)addRequiredEntitlement:(int)a3;
- (void)clearRequiredEntitlements;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCanonicalValue:(id)a3;
- (void)setConfidenceScore:(id)a3;
- (void)setConfirmed:(BOOL)a3;
- (void)setHasConfirmed:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setRequiredEntitlements:(int *)a3 count:(unint64_t)a4;
- (void)setSource:(id)a3;
- (void)setSourceAppBundleIdentifier:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBValueMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_confidenceScore, 0);

  objc_storeStrong((id *)&self->_canonicalValue, 0);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)sourceAppBundleIdentifier
{
  return self->_sourceAppBundleIdentifier;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)input
{
  return self->_input;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (_INPBConfidenceScore)confidenceScore
{
  return self->_confidenceScore;
}

- (NSString)canonicalValue
{
  return self->_canonicalValue;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_canonicalValue)
  {
    v4 = [(_INPBValueMetadata *)self canonicalValue];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"canonicalValue"];
  }
  v6 = [(_INPBValueMetadata *)self confidenceScore];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"confidenceScore"];

  if ([(_INPBValueMetadata *)self hasConfirmed])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBValueMetadata confirmed](self, "confirmed"));
    [v3 setObject:v8 forKeyedSubscript:@"confirmed"];
  }
  if (self->_input)
  {
    v9 = [(_INPBValueMetadata *)self input];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"input"];
  }
  if (self->_requiredEntitlements.count)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBValueMetadata requiredEntitlementsCount](self, "requiredEntitlementsCount"));
    if ([(_INPBValueMetadata *)self requiredEntitlementsCount])
    {
      unint64_t v12 = 0;
      do
      {
        int v13 = self->_requiredEntitlements.list[v12];
        if (v13 == 1)
        {
          v14 = @"CONTACTS";
        }
        else if (v13 == 2)
        {
          v14 = @"LOCATION";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requiredEntitlements.list[v12]);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v11 addObject:v14];

        ++v12;
      }
      while (v12 < [(_INPBValueMetadata *)self requiredEntitlementsCount]);
    }
    [v3 setObject:v11 forKeyedSubscript:@"requiredEntitlement"];
  }
  if (self->_source)
  {
    v15 = [(_INPBValueMetadata *)self source];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"source"];
  }
  if (self->_sourceAppBundleIdentifier)
  {
    v17 = [(_INPBValueMetadata *)self sourceAppBundleIdentifier];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"sourceAppBundleIdentifier"];
  }
  if (self->_uuid)
  {
    v19 = [(_INPBValueMetadata *)self uuid];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"uuid"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_canonicalValue hash];
  unint64_t v4 = [(_INPBConfidenceScore *)self->_confidenceScore hash];
  if ([(_INPBValueMetadata *)self hasConfirmed]) {
    uint64_t v5 = 2654435761 * self->_confirmed;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_input hash];
  uint64_t v7 = PBRepeatedInt32Hash();
  NSUInteger v8 = v7 ^ [(NSString *)self->_source hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_sourceAppBundleIdentifier hash];
  return v9 ^ [(NSString *)self->_uuid hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  uint64_t v5 = [(_INPBValueMetadata *)self canonicalValue];
  NSUInteger v6 = [v4 canonicalValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(_INPBValueMetadata *)self canonicalValue];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_INPBValueMetadata *)self canonicalValue];
    v10 = [v4 canonicalValue];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBValueMetadata *)self confidenceScore];
  NSUInteger v6 = [v4 confidenceScore];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(_INPBValueMetadata *)self confidenceScore];
  if (v12)
  {
    int v13 = (void *)v12;
    v14 = [(_INPBValueMetadata *)self confidenceScore];
    v15 = [v4 confidenceScore];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  int v17 = [(_INPBValueMetadata *)self hasConfirmed];
  if (v17 != [v4 hasConfirmed]) {
    goto LABEL_37;
  }
  if ([(_INPBValueMetadata *)self hasConfirmed])
  {
    if ([v4 hasConfirmed])
    {
      int confirmed = self->_confirmed;
      if (confirmed != [v4 confirmed]) {
        goto LABEL_37;
      }
    }
  }
  uint64_t v5 = [(_INPBValueMetadata *)self input];
  NSUInteger v6 = [v4 input];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v19 = [(_INPBValueMetadata *)self input];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBValueMetadata *)self input];
    v22 = [v4 input];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_37;
  }
  uint64_t v5 = [(_INPBValueMetadata *)self source];
  NSUInteger v6 = [v4 source];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v24 = [(_INPBValueMetadata *)self source];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBValueMetadata *)self source];
    v27 = [v4 source];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBValueMetadata *)self sourceAppBundleIdentifier];
  NSUInteger v6 = [v4 sourceAppBundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v29 = [(_INPBValueMetadata *)self sourceAppBundleIdentifier];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(_INPBValueMetadata *)self sourceAppBundleIdentifier];
    v32 = [v4 sourceAppBundleIdentifier];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBValueMetadata *)self uuid];
  NSUInteger v6 = [v4 uuid];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v34 = [(_INPBValueMetadata *)self uuid];
  if (!v34)
  {

LABEL_40:
    BOOL v39 = 1;
    goto LABEL_38;
  }
  v35 = (void *)v34;
  v36 = [(_INPBValueMetadata *)self uuid];
  v37 = [v4 uuid];
  char v38 = [v36 isEqual:v37];

  if (v38) {
    goto LABEL_40;
  }
LABEL_37:
  BOOL v39 = 0;
LABEL_38:

  return v39;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBValueMetadata allocWithZone:](_INPBValueMetadata, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(NSString *)self->_canonicalValue copyWithZone:a3];
  [(_INPBValueMetadata *)v5 setCanonicalValue:v6];

  id v7 = [(_INPBConfidenceScore *)self->_confidenceScore copyWithZone:a3];
  [(_INPBValueMetadata *)v5 setConfidenceScore:v7];

  if ([(_INPBValueMetadata *)self hasConfirmed]) {
    [(_INPBValueMetadata *)v5 setConfirmed:[(_INPBValueMetadata *)self confirmed]];
  }
  NSUInteger v8 = (void *)[(NSString *)self->_input copyWithZone:a3];
  [(_INPBValueMetadata *)v5 setInput:v8];

  PBRepeatedInt32Copy();
  NSUInteger v9 = (void *)[(NSString *)self->_source copyWithZone:a3];
  [(_INPBValueMetadata *)v5 setSource:v9];

  v10 = (void *)[(NSString *)self->_sourceAppBundleIdentifier copyWithZone:a3];
  [(_INPBValueMetadata *)v5 setSourceAppBundleIdentifier:v10];

  int v11 = (void *)[(NSString *)self->_uuid copyWithZone:a3];
  [(_INPBValueMetadata *)v5 setUuid:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBValueMetadata *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBValueMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBValueMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBValueMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBValueMetadata *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBValueMetadata *)self clearRequiredEntitlements];
  v3.receiver = self;
  v3.super_class = (Class)_INPBValueMetadata;
  [(_INPBValueMetadata *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  id v4 = [(_INPBValueMetadata *)self canonicalValue];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(_INPBValueMetadata *)self confidenceScore];

  if (v5)
  {
    id v6 = [(_INPBValueMetadata *)self confidenceScore];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBValueMetadata *)self hasConfirmed]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v7 = [(_INPBValueMetadata *)self input];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if (self->_requiredEntitlements.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_requiredEntitlements.count);
  }
  NSUInteger v9 = [(_INPBValueMetadata *)self source];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  v10 = [(_INPBValueMetadata *)self sourceAppBundleIdentifier];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(_INPBValueMetadata *)self uuid];

  uint64_t v12 = v13;
  if (v11)
  {
    PBDataWriterWriteStringField();
    uint64_t v12 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBValueMetadataReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setUuid:(id)a3
{
  self->_uuid = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasSourceAppBundleIdentifier
{
  return self->_sourceAppBundleIdentifier != 0;
}

- (void)setSourceAppBundleIdentifier:(id)a3
{
  self->_sourceAppBundleIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)setSource:(id)a3
{
  self->_source = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int)StringAsRequiredEntitlements:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"CONTACTS"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"LOCATION"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)requiredEntitlementsAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"CONTACTS";
  }
  else if (a3 == 2)
  {
    int v4 = @"LOCATION";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)requiredEntitlementAtIndex:(unint64_t)a3
{
  return self->_requiredEntitlements.list[a3];
}

- (unint64_t)requiredEntitlementsCount
{
  return self->_requiredEntitlements.count;
}

- (void)addRequiredEntitlement:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearRequiredEntitlements
{
}

- (int)requiredEntitlements
{
  return self->_requiredEntitlements.list;
}

- (void)setRequiredEntitlements:(int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasInput
{
  return self->_input != 0;
}

- (void)setInput:(id)a3
{
  self->_input = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setHasConfirmed:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfirmed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfirmed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int confirmed = a3;
}

- (BOOL)hasConfidenceScore
{
  return self->_confidenceScore != 0;
}

- (void)setConfidenceScore:(id)a3
{
}

- (BOOL)hasCanonicalValue
{
  return self->_canonicalValue != 0;
}

- (void)setCanonicalValue:(id)a3
{
  self->_canonicalValue = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end