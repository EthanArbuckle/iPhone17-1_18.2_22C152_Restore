@interface _INVocabularyItem
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSimilarEnoughToNotSync:(id)a3;
- (BOOL)requiresUserIdentification;
- (NSString)string;
- (NSString)vocabularyIdentifier;
- (NSUUID)_siriID;
- (_INVocabularyItem)init;
- (_INVocabularyItem)initWithCoder:(id)a3;
- (_INVocabularyItem)initWithSpeakable:(id)a3;
- (_INVocabularyItem)initWithString:(id)a3 vocabularyIdentifier:(id)a4;
- (_INVocabularyItem)initWithString:(id)a3 vocabularyIdentifier:(id)a4 requiresUserIdentification:(BOOL)a5;
- (id)_dictionaryForSaving;
- (id)_initWithUncheckedSpeakable:(id)a3;
- (id)_initWithUncheckedString:(id)a3 vocabularyIdentifier:(id)a4 requiresUserIdentification:(BOOL)a5;
- (id)_initWithVocabularyItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)validate;
- (void)_setSiriID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _INVocabularyItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__siriID, 0);
  objc_storeStrong((id *)&self->_vocabularyIdentifier, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

- (_INVocabularyItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_string"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_vocabularyIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_siriID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiresUserIdentification"];

  uint64_t v9 = [v8 BOOLValue];
  v10 = [(_INVocabularyItem *)self initWithString:v5 vocabularyIdentifier:v6 requiresUserIdentification:v9];
  [(_INVocabularyItem *)v10 _setSiriID:v7];

  return v10;
}

- (_INVocabularyItem)initWithString:(id)a3 vocabularyIdentifier:(id)a4 requiresUserIdentification:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_INVocabularyItem;
  v10 = [(_INVocabularyItem *)&v17 init];
  if (!v10) {
    goto LABEL_4;
  }
  uint64_t v11 = [v8 copy];
  string = v10->_string;
  v10->_string = (NSString *)v11;

  uint64_t v13 = [v9 copy];
  vocabularyIdentifier = v10->_vocabularyIdentifier;
  v10->_vocabularyIdentifier = (NSString *)v13;

  v10->_requiresUserIdentification = a5;
  if ([(_INVocabularyItem *)v10 validate] == 1) {
    v15 = v10;
  }
  else {
LABEL_4:
  }
    v15 = 0;

  return v15;
}

- (id)_dictionaryForSaving
{
  v3 = [(_INVocabularyItem *)self _siriID];
  id v4 = [v3 UUIDString];

  v5 = [(_INVocabularyItem *)self string];
  v6 = [(_INVocabularyItem *)self vocabularyIdentifier];
  BOOL v7 = [(_INVocabularyItem *)self requiresUserIdentification];
  id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  [v8 setObject:v5 forKey:@"string"];
  if (v4) {
    [v8 setObject:v4 forKey:@"_siriID"];
  }
  if (v6) {
    [v8 setObject:v6 forKey:@"vocabularyIdentifier"];
  }
  id v9 = [NSNumber numberWithBool:v7];
  [v8 setObject:v9 forKey:@"requiresUserIdentification"];

  return v8;
}

- (BOOL)requiresUserIdentification
{
  return self->_requiresUserIdentification;
}

- (id)_initWithVocabularyItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 string];
  v6 = [v4 vocabularyIdentifier];
  id v7 = -[_INVocabularyItem _initWithUncheckedString:vocabularyIdentifier:requiresUserIdentification:](self, "_initWithUncheckedString:vocabularyIdentifier:requiresUserIdentification:", v5, v6, [v4 requiresUserIdentification]);

  if (v7 && [v7 validate] == 1)
  {
    id v8 = [v4 _siriID];
    [v7 _setSiriID:v8];

    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)validate
{
  v3 = [(_INVocabularyItem *)self string];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 2;
  }
  v5 = [(_INVocabularyItem *)self string];
  unint64_t v6 = [v5 lengthOfBytesUsingEncoding:10];

  if (v6 > 0x400) {
    return 3;
  }
  id v8 = [(_INVocabularyItem *)self vocabularyIdentifier];
  unint64_t v9 = [v8 lengthOfBytesUsingEncoding:10];

  if (v9 <= 0x400) {
    return 1;
  }
  else {
    return 4;
  }
}

- (NSString)string
{
  return self->_string;
}

- (NSString)vocabularyIdentifier
{
  return self->_vocabularyIdentifier;
}

- (id)_initWithUncheckedString:(id)a3 vocabularyIdentifier:(id)a4 requiresUserIdentification:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_INVocabularyItem;
  v10 = [(_INVocabularyItem *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    string = v10->_string;
    v10->_string = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    vocabularyIdentifier = v10->_vocabularyIdentifier;
    v10->_vocabularyIdentifier = (NSString *)v13;

    v10->_requiresUserIdentification = a5;
  }

  return v10;
}

- (NSUUID)_siriID
{
  return self->__siriID;
}

- (void)_setSiriID:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  string = self->_string;
  id v5 = a3;
  [v5 encodeObject:string forKey:@"_string"];
  [v5 encodeObject:self->_vocabularyIdentifier forKey:@"_vocabularyIdentifier"];
  unint64_t v6 = [(_INVocabularyItem *)self _siriID];
  [v5 encodeObject:v6 forKey:@"_siriID"];

  id v7 = [NSNumber numberWithBool:self->_requiresUserIdentification];
  [v5 encodeObject:v7 forKey:@"requiresUserIdentification"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 _initWithVocabularyItem:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isSimilarEnoughToNotSync:(id)a3
{
  id v4 = a3;
  id v5 = [(_INVocabularyItem *)self string];
  unint64_t v6 = [v4 string];
  id v7 = [(_INVocabularyItem *)self vocabularyIdentifier];
  id v8 = [v4 vocabularyIdentifier];
  BOOL v9 = [(_INVocabularyItem *)self requiresUserIdentification];
  char v10 = [v4 requiresUserIdentification];

  if ((v5 == v6 || [v5 isEqual:v6])
    && (v7 == v8 || [v7 isEqual:v8]))
  {
    char v11 = v9 ^ v10 ^ 1;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = [(_INVocabularyItem *)self _siriID];
  id v4 = [v3 UUIDString];

  id v5 = &stru_1EDA6DB28;
  if (v4) {
    id v5 = v4;
  }
  unint64_t v6 = v5;

  id v7 = NSString;
  uint64_t v8 = objc_opt_class();
  BOOL v9 = [(_INVocabularyItem *)self string];
  char v10 = [(_INVocabularyItem *)self vocabularyIdentifier];
  BOOL v11 = [(_INVocabularyItem *)self requiresUserIdentification];
  v12 = @"NO";
  if (v11) {
    v12 = @"YES";
  }
  uint64_t v13 = [v7 stringWithFormat:@"<%p %@:%@>{string='%@', vocabularyIdentifier='%@', requiresUserIdentification='%@'}", self, v8, v6, v9, v10, v12];

  return v13;
}

- (_INVocabularyItem)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], @"You must use -initWithString:, with a non-empty string, to create an _INVocabularyItem", MEMORY[0x1E4F1CC08] reason userInfo];
  objc_exception_throw(v2);
}

- (_INVocabularyItem)initWithSpeakable:(id)a3
{
  id v4 = a3;
  id v5 = [v4 spokenPhrase];
  if (v5)
  {
    unint64_t v6 = [v4 spokenPhrase];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      uint64_t v8 = [v4 spokenPhrase];
      BOOL v9 = [v4 vocabularyIdentifier];
      self = [(_INVocabularyItem *)self initWithString:v8 vocabularyIdentifier:v9];

      id v5 = self;
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (_INVocabularyItem)initWithString:(id)a3 vocabularyIdentifier:(id)a4
{
  return [(_INVocabularyItem *)self initWithString:a3 vocabularyIdentifier:a4 requiresUserIdentification:0];
}

- (id)_initWithUncheckedSpeakable:(id)a3
{
  id v4 = a3;
  id v5 = [v4 spokenPhrase];
  unint64_t v6 = [v4 vocabularyIdentifier];

  id v7 = [(_INVocabularyItem *)self _initWithUncheckedString:v5 vocabularyIdentifier:v6 requiresUserIdentification:0];
  return v7;
}

@end