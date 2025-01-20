@interface _INPBContactValue
+ (BOOL)supportsSecureCoding;
+ (Class)aliasesType;
- (BOOL)hasContactHandle;
- (BOOL)hasCustomIdentifier;
- (BOOL)hasFirstName;
- (BOOL)hasFullName;
- (BOOL)hasHandle;
- (BOOL)hasImage;
- (BOOL)hasIsContactSuggestion;
- (BOOL)hasIsMe;
- (BOOL)hasLastName;
- (BOOL)hasMiddleName;
- (BOOL)hasNamePrefix;
- (BOOL)hasNameSuffix;
- (BOOL)hasNickName;
- (BOOL)hasPhonemeData;
- (BOOL)hasPhoneticFirstName;
- (BOOL)hasPhoneticLastName;
- (BOOL)hasPhoneticMiddleName;
- (BOOL)hasPhoneticNamePrefix;
- (BOOL)hasPhoneticNameSuffix;
- (BOOL)hasRelationship;
- (BOOL)hasSearchProvider;
- (BOOL)hasSuggestionType;
- (BOOL)hasValueMetadata;
- (BOOL)isContactSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (BOOL)readFrom:(id)a3;
- (NSArray)aliases;
- (NSString)customIdentifier;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)handle;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickName;
- (NSString)phonemeData;
- (NSString)phoneticFirstName;
- (NSString)phoneticLastName;
- (NSString)phoneticMiddleName;
- (NSString)phoneticNamePrefix;
- (NSString)phoneticNameSuffix;
- (NSString)relationship;
- (_INPBContactHandle)contactHandle;
- (_INPBContactValue)initWithCoder:(id)a3;
- (_INPBImageValue)image;
- (_INPBValueMetadata)valueMetadata;
- (id)aliasesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)searchProviderAsString:(int)a3;
- (id)suggestionTypeAsString:(int)a3;
- (int)StringAsSearchProvider:(id)a3;
- (int)StringAsSuggestionType:(id)a3;
- (int)searchProvider;
- (int)suggestionType;
- (unint64_t)aliasesCount;
- (unint64_t)hash;
- (void)addAliases:(id)a3;
- (void)clearAliases;
- (void)encodeWithCoder:(id)a3;
- (void)setAliases:(id)a3;
- (void)setContactHandle:(id)a3;
- (void)setCustomIdentifier:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFullName:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHasIsContactSuggestion:(BOOL)a3;
- (void)setHasIsMe:(BOOL)a3;
- (void)setHasSearchProvider:(BOOL)a3;
- (void)setHasSuggestionType:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setIsContactSuggestion:(BOOL)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNamePrefix:(id)a3;
- (void)setNameSuffix:(id)a3;
- (void)setNickName:(id)a3;
- (void)setPhonemeData:(id)a3;
- (void)setPhoneticFirstName:(id)a3;
- (void)setPhoneticLastName:(id)a3;
- (void)setPhoneticMiddleName:(id)a3;
- (void)setPhoneticNamePrefix:(id)a3;
- (void)setPhoneticNameSuffix:(id)a3;
- (void)setRelationship:(id)a3;
- (void)setSearchProvider:(int)a3;
- (void)setSuggestionType:(int)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBContactValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_phoneticNameSuffix, 0);
  objc_storeStrong((id *)&self->_phoneticNamePrefix, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_phonemeData, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_contactHandle, 0);

  objc_storeStrong((id *)&self->_aliases, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (int)searchProvider
{
  return self->_searchProvider;
}

- (NSString)relationship
{
  return self->_relationship;
}

- (NSString)phoneticNameSuffix
{
  return self->_phoneticNameSuffix;
}

- (NSString)phoneticNamePrefix
{
  return self->_phoneticNamePrefix;
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (NSString)phoneticLastName
{
  return self->_phoneticLastName;
}

- (NSString)phoneticFirstName
{
  return self->_phoneticFirstName;
}

- (NSString)phonemeData
{
  return self->_phonemeData;
}

- (NSString)nickName
{
  return self->_nickName;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (BOOL)isContactSuggestion
{
  return self->_isContactSuggestion;
}

- (_INPBImageValue)image
{
  return self->_image;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (_INPBContactHandle)contactHandle
{
  return self->_contactHandle;
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (id)dictionaryRepresentation
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_aliases count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v5 = self->_aliases;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v57 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v56 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"aliases"];
  }
  v11 = [(_INPBContactValue *)self contactHandle];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"contactHandle"];

  if (self->_customIdentifier)
  {
    v13 = [(_INPBContactValue *)self customIdentifier];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"customIdentifier"];
  }
  if (self->_firstName)
  {
    v15 = [(_INPBContactValue *)self firstName];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"firstName"];
  }
  if (self->_fullName)
  {
    v17 = [(_INPBContactValue *)self fullName];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"fullName"];
  }
  if (self->_handle)
  {
    v19 = [(_INPBContactValue *)self handle];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"handle"];
  }
  v21 = [(_INPBContactValue *)self image];
  v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"image"];

  if ([(_INPBContactValue *)self hasIsContactSuggestion])
  {
    v23 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBContactValue isContactSuggestion](self, "isContactSuggestion"));
    [v3 setObject:v23 forKeyedSubscript:@"isContactSuggestion"];
  }
  if ([(_INPBContactValue *)self hasIsMe])
  {
    v24 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBContactValue isMe](self, "isMe"));
    [v3 setObject:v24 forKeyedSubscript:@"isMe"];
  }
  if (self->_lastName)
  {
    v25 = [(_INPBContactValue *)self lastName];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"lastName"];
  }
  if (self->_middleName)
  {
    v27 = [(_INPBContactValue *)self middleName];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"middleName"];
  }
  if (self->_namePrefix)
  {
    v29 = [(_INPBContactValue *)self namePrefix];
    v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"namePrefix"];
  }
  if (self->_nameSuffix)
  {
    v31 = [(_INPBContactValue *)self nameSuffix];
    v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"nameSuffix"];
  }
  if (self->_nickName)
  {
    v33 = [(_INPBContactValue *)self nickName];
    v34 = (void *)[v33 copy];
    [v3 setObject:v34 forKeyedSubscript:@"nickName"];
  }
  if (self->_phonemeData)
  {
    v35 = [(_INPBContactValue *)self phonemeData];
    v36 = (void *)[v35 copy];
    [v3 setObject:v36 forKeyedSubscript:@"phonemeData"];
  }
  if (self->_phoneticFirstName)
  {
    v37 = [(_INPBContactValue *)self phoneticFirstName];
    v38 = (void *)[v37 copy];
    [v3 setObject:v38 forKeyedSubscript:@"phoneticFirstName"];
  }
  if (self->_phoneticLastName)
  {
    v39 = [(_INPBContactValue *)self phoneticLastName];
    v40 = (void *)[v39 copy];
    [v3 setObject:v40 forKeyedSubscript:@"phoneticLastName"];
  }
  if (self->_phoneticMiddleName)
  {
    v41 = [(_INPBContactValue *)self phoneticMiddleName];
    v42 = (void *)[v41 copy];
    [v3 setObject:v42 forKeyedSubscript:@"phoneticMiddleName"];
  }
  if (self->_phoneticNamePrefix)
  {
    v43 = [(_INPBContactValue *)self phoneticNamePrefix];
    v44 = (void *)[v43 copy];
    [v3 setObject:v44 forKeyedSubscript:@"phoneticNamePrefix"];
  }
  if (self->_phoneticNameSuffix)
  {
    v45 = [(_INPBContactValue *)self phoneticNameSuffix];
    v46 = (void *)[v45 copy];
    [v3 setObject:v46 forKeyedSubscript:@"phoneticNameSuffix"];
  }
  if (self->_relationship)
  {
    v47 = [(_INPBContactValue *)self relationship];
    v48 = (void *)[v47 copy];
    [v3 setObject:v48 forKeyedSubscript:@"relationship"];
  }
  if ([(_INPBContactValue *)self hasSearchProvider])
  {
    uint64_t v49 = [(_INPBContactValue *)self searchProvider];
    if (v49 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v49);
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = off_1E5517E20[v49];
    }
    [v3 setObject:v50 forKeyedSubscript:@"searchProvider"];
  }
  if ([(_INPBContactValue *)self hasSuggestionType])
  {
    uint64_t v51 = [(_INPBContactValue *)self suggestionType];
    if (v51 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v51);
      v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = off_1E5517E40[v51];
    }
    [v3 setObject:v52 forKeyedSubscript:@"suggestionType"];
  }
  v53 = [(_INPBContactValue *)self valueMetadata];
  v54 = [v53 dictionaryRepresentation];
  [v3 setObject:v54 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v26 = [(NSArray *)self->_aliases hash];
  unint64_t v25 = [(_INPBContactHandle *)self->_contactHandle hash];
  NSUInteger v24 = [(NSString *)self->_customIdentifier hash];
  NSUInteger v23 = [(NSString *)self->_firstName hash];
  NSUInteger v22 = [(NSString *)self->_fullName hash];
  NSUInteger v21 = [(NSString *)self->_handle hash];
  unint64_t v20 = [(_INPBImageValue *)self->_image hash];
  if ([(_INPBContactValue *)self hasIsContactSuggestion]) {
    uint64_t v19 = 2654435761 * self->_isContactSuggestion;
  }
  else {
    uint64_t v19 = 0;
  }
  if ([(_INPBContactValue *)self hasIsMe]) {
    uint64_t v18 = 2654435761 * self->_isMe;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_lastName hash];
  NSUInteger v16 = [(NSString *)self->_middleName hash];
  NSUInteger v15 = [(NSString *)self->_namePrefix hash];
  NSUInteger v14 = [(NSString *)self->_nameSuffix hash];
  NSUInteger v13 = [(NSString *)self->_nickName hash];
  NSUInteger v3 = [(NSString *)self->_phonemeData hash];
  NSUInteger v4 = [(NSString *)self->_phoneticFirstName hash];
  NSUInteger v5 = [(NSString *)self->_phoneticLastName hash];
  NSUInteger v6 = [(NSString *)self->_phoneticMiddleName hash];
  NSUInteger v7 = [(NSString *)self->_phoneticNamePrefix hash];
  NSUInteger v8 = [(NSString *)self->_phoneticNameSuffix hash];
  NSUInteger v9 = [(NSString *)self->_relationship hash];
  if ([(_INPBContactValue *)self hasSearchProvider]) {
    uint64_t v10 = 2654435761 * self->_searchProvider;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBContactValue *)self hasSuggestionType]) {
    uint64_t v11 = 2654435761 * self->_suggestionType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_118;
  }
  NSUInteger v5 = [(_INPBContactValue *)self aliases];
  NSUInteger v6 = [v4 aliases];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v7 = [(_INPBContactValue *)self aliases];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_INPBContactValue *)self aliases];
    uint64_t v10 = [v4 aliases];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self contactHandle];
  NSUInteger v6 = [v4 contactHandle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v12 = [(_INPBContactValue *)self contactHandle];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    NSUInteger v14 = [(_INPBContactValue *)self contactHandle];
    NSUInteger v15 = [v4 contactHandle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self customIdentifier];
  NSUInteger v6 = [v4 customIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v17 = [(_INPBContactValue *)self customIdentifier];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_INPBContactValue *)self customIdentifier];
    unint64_t v20 = [v4 customIdentifier];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self firstName];
  NSUInteger v6 = [v4 firstName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v22 = [(_INPBContactValue *)self firstName];
  if (v22)
  {
    NSUInteger v23 = (void *)v22;
    NSUInteger v24 = [(_INPBContactValue *)self firstName];
    unint64_t v25 = [v4 firstName];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self fullName];
  NSUInteger v6 = [v4 fullName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v27 = [(_INPBContactValue *)self fullName];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBContactValue *)self fullName];
    v30 = [v4 fullName];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self handle];
  NSUInteger v6 = [v4 handle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v32 = [(_INPBContactValue *)self handle];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBContactValue *)self handle];
    v35 = [v4 handle];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self image];
  NSUInteger v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v37 = [(_INPBContactValue *)self image];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBContactValue *)self image];
    v40 = [v4 image];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  int v42 = [(_INPBContactValue *)self hasIsContactSuggestion];
  if (v42 != [v4 hasIsContactSuggestion]) {
    goto LABEL_118;
  }
  if ([(_INPBContactValue *)self hasIsContactSuggestion])
  {
    if ([v4 hasIsContactSuggestion])
    {
      int isContactSuggestion = self->_isContactSuggestion;
      if (isContactSuggestion != [v4 isContactSuggestion]) {
        goto LABEL_118;
      }
    }
  }
  int v44 = [(_INPBContactValue *)self hasIsMe];
  if (v44 != [v4 hasIsMe]) {
    goto LABEL_118;
  }
  if ([(_INPBContactValue *)self hasIsMe])
  {
    if ([v4 hasIsMe])
    {
      int isMe = self->_isMe;
      if (isMe != [v4 isMe]) {
        goto LABEL_118;
      }
    }
  }
  NSUInteger v5 = [(_INPBContactValue *)self lastName];
  NSUInteger v6 = [v4 lastName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v46 = [(_INPBContactValue *)self lastName];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [(_INPBContactValue *)self lastName];
    uint64_t v49 = [v4 lastName];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self middleName];
  NSUInteger v6 = [v4 middleName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v51 = [(_INPBContactValue *)self middleName];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(_INPBContactValue *)self middleName];
    v54 = [v4 middleName];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self namePrefix];
  NSUInteger v6 = [v4 namePrefix];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v56 = [(_INPBContactValue *)self namePrefix];
  if (v56)
  {
    long long v57 = (void *)v56;
    long long v58 = [(_INPBContactValue *)self namePrefix];
    long long v59 = [v4 namePrefix];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self nameSuffix];
  NSUInteger v6 = [v4 nameSuffix];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v61 = [(_INPBContactValue *)self nameSuffix];
  if (v61)
  {
    v62 = (void *)v61;
    v63 = [(_INPBContactValue *)self nameSuffix];
    v64 = [v4 nameSuffix];
    int v65 = [v63 isEqual:v64];

    if (!v65) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self nickName];
  NSUInteger v6 = [v4 nickName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v66 = [(_INPBContactValue *)self nickName];
  if (v66)
  {
    v67 = (void *)v66;
    v68 = [(_INPBContactValue *)self nickName];
    v69 = [v4 nickName];
    int v70 = [v68 isEqual:v69];

    if (!v70) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self phonemeData];
  NSUInteger v6 = [v4 phonemeData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v71 = [(_INPBContactValue *)self phonemeData];
  if (v71)
  {
    v72 = (void *)v71;
    v73 = [(_INPBContactValue *)self phonemeData];
    v74 = [v4 phonemeData];
    int v75 = [v73 isEqual:v74];

    if (!v75) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self phoneticFirstName];
  NSUInteger v6 = [v4 phoneticFirstName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v76 = [(_INPBContactValue *)self phoneticFirstName];
  if (v76)
  {
    v77 = (void *)v76;
    v78 = [(_INPBContactValue *)self phoneticFirstName];
    v79 = [v4 phoneticFirstName];
    int v80 = [v78 isEqual:v79];

    if (!v80) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self phoneticLastName];
  NSUInteger v6 = [v4 phoneticLastName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v81 = [(_INPBContactValue *)self phoneticLastName];
  if (v81)
  {
    v82 = (void *)v81;
    v83 = [(_INPBContactValue *)self phoneticLastName];
    v84 = [v4 phoneticLastName];
    int v85 = [v83 isEqual:v84];

    if (!v85) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self phoneticMiddleName];
  NSUInteger v6 = [v4 phoneticMiddleName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v86 = [(_INPBContactValue *)self phoneticMiddleName];
  if (v86)
  {
    v87 = (void *)v86;
    v88 = [(_INPBContactValue *)self phoneticMiddleName];
    v89 = [v4 phoneticMiddleName];
    int v90 = [v88 isEqual:v89];

    if (!v90) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self phoneticNamePrefix];
  NSUInteger v6 = [v4 phoneticNamePrefix];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v91 = [(_INPBContactValue *)self phoneticNamePrefix];
  if (v91)
  {
    v92 = (void *)v91;
    v93 = [(_INPBContactValue *)self phoneticNamePrefix];
    v94 = [v4 phoneticNamePrefix];
    int v95 = [v93 isEqual:v94];

    if (!v95) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self phoneticNameSuffix];
  NSUInteger v6 = [v4 phoneticNameSuffix];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v96 = [(_INPBContactValue *)self phoneticNameSuffix];
  if (v96)
  {
    v97 = (void *)v96;
    v98 = [(_INPBContactValue *)self phoneticNameSuffix];
    v99 = [v4 phoneticNameSuffix];
    int v100 = [v98 isEqual:v99];

    if (!v100) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBContactValue *)self relationship];
  NSUInteger v6 = [v4 relationship];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_117;
  }
  uint64_t v101 = [(_INPBContactValue *)self relationship];
  if (v101)
  {
    v102 = (void *)v101;
    v103 = [(_INPBContactValue *)self relationship];
    v104 = [v4 relationship];
    int v105 = [v103 isEqual:v104];

    if (!v105) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  int v106 = [(_INPBContactValue *)self hasSearchProvider];
  if (v106 != [v4 hasSearchProvider]) {
    goto LABEL_118;
  }
  if ([(_INPBContactValue *)self hasSearchProvider])
  {
    if ([v4 hasSearchProvider])
    {
      int searchProvider = self->_searchProvider;
      if (searchProvider != [v4 searchProvider]) {
        goto LABEL_118;
      }
    }
  }
  int v108 = [(_INPBContactValue *)self hasSuggestionType];
  if (v108 != [v4 hasSuggestionType]) {
    goto LABEL_118;
  }
  if ([(_INPBContactValue *)self hasSuggestionType])
  {
    if ([v4 hasSuggestionType])
    {
      int suggestionType = self->_suggestionType;
      if (suggestionType != [v4 suggestionType]) {
        goto LABEL_118;
      }
    }
  }
  NSUInteger v5 = [(_INPBContactValue *)self valueMetadata];
  NSUInteger v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v110 = [(_INPBContactValue *)self valueMetadata];
    if (!v110)
    {

LABEL_121:
      BOOL v115 = 1;
      goto LABEL_119;
    }
    v111 = (void *)v110;
    v112 = [(_INPBContactValue *)self valueMetadata];
    v113 = [v4 valueMetadata];
    char v114 = [v112 isEqual:v113];

    if (v114) {
      goto LABEL_121;
    }
  }
  else
  {
LABEL_117:
  }
LABEL_118:
  BOOL v115 = 0;
LABEL_119:

  return v115;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBContactValue allocWithZone:](_INPBContactValue, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(NSArray *)self->_aliases copyWithZone:a3];
  [(_INPBContactValue *)v5 setAliases:v6];

  id v7 = [(_INPBContactHandle *)self->_contactHandle copyWithZone:a3];
  [(_INPBContactValue *)v5 setContactHandle:v7];

  NSUInteger v8 = (void *)[(NSString *)self->_customIdentifier copyWithZone:a3];
  [(_INPBContactValue *)v5 setCustomIdentifier:v8];

  NSUInteger v9 = (void *)[(NSString *)self->_firstName copyWithZone:a3];
  [(_INPBContactValue *)v5 setFirstName:v9];

  uint64_t v10 = (void *)[(NSString *)self->_fullName copyWithZone:a3];
  [(_INPBContactValue *)v5 setFullName:v10];

  int v11 = (void *)[(NSString *)self->_handle copyWithZone:a3];
  [(_INPBContactValue *)v5 setHandle:v11];

  id v12 = [(_INPBImageValue *)self->_image copyWithZone:a3];
  [(_INPBContactValue *)v5 setImage:v12];

  if ([(_INPBContactValue *)self hasIsContactSuggestion]) {
    [(_INPBContactValue *)v5 setIsContactSuggestion:[(_INPBContactValue *)self isContactSuggestion]];
  }
  if ([(_INPBContactValue *)self hasIsMe]) {
    [(_INPBContactValue *)v5 setIsMe:[(_INPBContactValue *)self isMe]];
  }
  NSUInteger v13 = (void *)[(NSString *)self->_lastName copyWithZone:a3];
  [(_INPBContactValue *)v5 setLastName:v13];

  NSUInteger v14 = (void *)[(NSString *)self->_middleName copyWithZone:a3];
  [(_INPBContactValue *)v5 setMiddleName:v14];

  NSUInteger v15 = (void *)[(NSString *)self->_namePrefix copyWithZone:a3];
  [(_INPBContactValue *)v5 setNamePrefix:v15];

  int v16 = (void *)[(NSString *)self->_nameSuffix copyWithZone:a3];
  [(_INPBContactValue *)v5 setNameSuffix:v16];

  uint64_t v17 = (void *)[(NSString *)self->_nickName copyWithZone:a3];
  [(_INPBContactValue *)v5 setNickName:v17];

  uint64_t v18 = (void *)[(NSString *)self->_phonemeData copyWithZone:a3];
  [(_INPBContactValue *)v5 setPhonemeData:v18];

  uint64_t v19 = (void *)[(NSString *)self->_phoneticFirstName copyWithZone:a3];
  [(_INPBContactValue *)v5 setPhoneticFirstName:v19];

  unint64_t v20 = (void *)[(NSString *)self->_phoneticLastName copyWithZone:a3];
  [(_INPBContactValue *)v5 setPhoneticLastName:v20];

  int v21 = (void *)[(NSString *)self->_phoneticMiddleName copyWithZone:a3];
  [(_INPBContactValue *)v5 setPhoneticMiddleName:v21];

  uint64_t v22 = (void *)[(NSString *)self->_phoneticNamePrefix copyWithZone:a3];
  [(_INPBContactValue *)v5 setPhoneticNamePrefix:v22];

  NSUInteger v23 = (void *)[(NSString *)self->_phoneticNameSuffix copyWithZone:a3];
  [(_INPBContactValue *)v5 setPhoneticNameSuffix:v23];

  NSUInteger v24 = (void *)[(NSString *)self->_relationship copyWithZone:a3];
  [(_INPBContactValue *)v5 setRelationship:v24];

  if ([(_INPBContactValue *)self hasSearchProvider]) {
    [(_INPBContactValue *)v5 setSearchProvider:[(_INPBContactValue *)self searchProvider]];
  }
  if ([(_INPBContactValue *)self hasSuggestionType]) {
    [(_INPBContactValue *)v5 setSuggestionType:[(_INPBContactValue *)self suggestionType]];
  }
  id v25 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBContactValue *)v5 setValueMetadata:v25];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBContactValue *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBContactValue)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBContactValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBContactValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBContactValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  NSUInteger v5 = self->_aliases;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_INPBContactValue *)self contactHandle];

  if (v10)
  {
    int v11 = [(_INPBContactValue *)self contactHandle];
    PBDataWriterWriteSubmessage();
  }
  id v12 = [(_INPBContactValue *)self customIdentifier];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v13 = [(_INPBContactValue *)self firstName];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v14 = [(_INPBContactValue *)self fullName];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v15 = [(_INPBContactValue *)self handle];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  int v16 = [(_INPBContactValue *)self image];

  if (v16)
  {
    uint64_t v17 = [(_INPBContactValue *)self image];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBContactValue *)self hasIsContactSuggestion]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBContactValue *)self hasIsMe]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v18 = [(_INPBContactValue *)self lastName];

  if (v18) {
    PBDataWriterWriteStringField();
  }
  uint64_t v19 = [(_INPBContactValue *)self middleName];

  if (v19) {
    PBDataWriterWriteStringField();
  }
  unint64_t v20 = [(_INPBContactValue *)self namePrefix];

  if (v20) {
    PBDataWriterWriteStringField();
  }
  int v21 = [(_INPBContactValue *)self nameSuffix];

  if (v21) {
    PBDataWriterWriteStringField();
  }
  uint64_t v22 = [(_INPBContactValue *)self nickName];

  if (v22) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v23 = [(_INPBContactValue *)self phonemeData];

  if (v23) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v24 = [(_INPBContactValue *)self phoneticFirstName];

  if (v24) {
    PBDataWriterWriteStringField();
  }
  id v25 = [(_INPBContactValue *)self phoneticLastName];

  if (v25) {
    PBDataWriterWriteStringField();
  }
  int v26 = [(_INPBContactValue *)self phoneticMiddleName];

  if (v26) {
    PBDataWriterWriteStringField();
  }
  uint64_t v27 = [(_INPBContactValue *)self phoneticNamePrefix];

  if (v27) {
    PBDataWriterWriteStringField();
  }
  v28 = [(_INPBContactValue *)self phoneticNameSuffix];

  if (v28) {
    PBDataWriterWriteStringField();
  }
  v29 = [(_INPBContactValue *)self relationship];

  if (v29) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBContactValue *)self hasSearchProvider]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBContactValue *)self hasSuggestionType]) {
    PBDataWriterWriteInt32Field();
  }
  v30 = [(_INPBContactValue *)self valueMetadata];

  if (v30)
  {
    int v31 = [(_INPBContactValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBContactValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (int)StringAsSuggestionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SocialProfile"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"InstantMessageAddress"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)suggestionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517E40[a3];
  }

  return v3;
}

- (void)setHasSuggestionType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSuggestionType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSuggestionType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int suggestionType = a3;
  }
}

- (int)StringAsSearchProvider:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLUS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SRR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SuggestedStore"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)searchProviderAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517E20[a3];
  }

  return v3;
}

- (void)setHasSearchProvider:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSearchProvider
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSearchProvider:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int searchProvider = a3;
  }
}

- (BOOL)hasRelationship
{
  return self->_relationship != 0;
}

- (void)setRelationship:(id)a3
{
  self->_relationship = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasPhoneticNameSuffix
{
  return self->_phoneticNameSuffix != 0;
}

- (void)setPhoneticNameSuffix:(id)a3
{
  self->_phoneticNameSuffix = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasPhoneticNamePrefix
{
  return self->_phoneticNamePrefix != 0;
}

- (void)setPhoneticNamePrefix:(id)a3
{
  self->_phoneticNamePrefix = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasPhoneticMiddleName
{
  return self->_phoneticMiddleName != 0;
}

- (void)setPhoneticMiddleName:(id)a3
{
  self->_phoneticMiddleName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasPhoneticLastName
{
  return self->_phoneticLastName != 0;
}

- (void)setPhoneticLastName:(id)a3
{
  self->_phoneticLastName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasPhoneticFirstName
{
  return self->_phoneticFirstName != 0;
}

- (void)setPhoneticFirstName:(id)a3
{
  self->_phoneticFirstName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasPhonemeData
{
  return self->_phonemeData != 0;
}

- (void)setPhonemeData:(id)a3
{
  self->_phonemeData = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasNickName
{
  return self->_nickName != 0;
}

- (void)setNickName:(id)a3
{
  self->_nickName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0;
}

- (void)setNameSuffix:(id)a3
{
  self->_nameSuffix = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0;
}

- (void)setNamePrefix:(id)a3
{
  self->_namePrefix = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (void)setMiddleName:(id)a3
{
  self->_middleName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (void)setLastName:(id)a3
{
  self->_lastName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setHasIsMe:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsMe
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsMe:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isMe = a3;
}

- (void)setHasIsContactSuggestion:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsContactSuggestion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsContactSuggestion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isContactSuggestion = a3;
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (void)setImage:(id)a3
{
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (void)setHandle:(id)a3
{
  self->_handle = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasFullName
{
  return self->_fullName != 0;
}

- (void)setFullName:(id)a3
{
  self->_fullName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (void)setFirstName:(id)a3
{
  self->_firstName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasCustomIdentifier
{
  return self->_customIdentifier != 0;
}

- (void)setCustomIdentifier:(id)a3
{
  self->_customIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasContactHandle
{
  return self->_contactHandle != 0;
}

- (void)setContactHandle:(id)a3
{
}

- (id)aliasesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_aliases objectAtIndexedSubscript:a3];
}

- (unint64_t)aliasesCount
{
  return [(NSArray *)self->_aliases count];
}

- (void)addAliases:(id)a3
{
  id v4 = a3;
  aliases = self->_aliases;
  id v8 = v4;
  if (!aliases)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_aliases;
    self->_aliases = v6;

    id v4 = v8;
    aliases = self->_aliases;
  }
  [(NSArray *)aliases addObject:v4];
}

- (void)clearAliases
{
}

- (void)setAliases:(id)a3
{
  self->_aliases = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)aliasesType
{
  return (Class)objc_opt_class();
}

@end