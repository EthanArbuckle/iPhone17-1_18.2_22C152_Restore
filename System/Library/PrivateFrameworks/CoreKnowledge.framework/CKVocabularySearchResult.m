@interface CKVocabularySearchResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSearchResult:(id)a3;
- (CKVocabularyItem)vocabularyItem;
- (CKVocabularySearchResult)init;
- (CKVocabularySearchResult)initWithCoder:(id)a3;
- (CKVocabularySearchResult)initWithVocabularyItem:(id)a3 originAppId:(id)a4;
- (NSString)originAppId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKVocabularySearchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_vocabularyItem, 0);
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (CKVocabularyItem)vocabularyItem
{
  return self->_vocabularyItem;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(CKVocabularyItem *)self->_vocabularyItem copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_originAppId copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CKVocabularyItem *)self->_vocabularyItem hash];
  return [(NSString *)self->_originAppId hash] ^ v3;
}

- (BOOL)isEqualToSearchResult:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && (vocabularyItem = self->_vocabularyItem,
        [v4 vocabularyItem],
        v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(vocabularyItem) = [(CKVocabularyItem *)vocabularyItem isEqual:v7],
        v7,
        vocabularyItem))
  {
    originAppId = self->_originAppId;
    v9 = [v5 originAppId];
    char v10 = [(NSString *)originAppId isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKVocabularySearchResult *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CKVocabularySearchResult *)self isEqualToSearchResult:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  vocabularyItem = self->_vocabularyItem;
  id v5 = a3;
  [v5 encodeObject:vocabularyItem forKey:@"item"];
  [v5 encodeObject:self->_originAppId forKey:@"appId"];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CKVocabularySearchResult;
  uint64_t v3 = [(CKVocabularySearchResult *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" appId: %@, vocabularyItem: %@", self->_originAppId, self->_vocabularyItem];

  return v4;
}

- (CKVocabularySearchResult)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use -initWithItem:appId:" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVocabularySearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKVocabularySearchResult;
  id v5 = [(CKVocabularySearchResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"item"];
    vocabularyItem = v5->_vocabularyItem;
    v5->_vocabularyItem = (CKVocabularyItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appId"];
    originAppId = v5->_originAppId;
    v5->_originAppId = (NSString *)v8;
  }
  return v5;
}

- (CKVocabularySearchResult)initWithVocabularyItem:(id)a3 originAppId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKVocabularySearchResult;
  uint64_t v8 = [(CKVocabularySearchResult *)&v15 init];
  if (!v8) {
    goto LABEL_4;
  }
  uint64_t v9 = [v6 copy];
  vocabularyItem = v8->_vocabularyItem;
  v8->_vocabularyItem = (CKVocabularyItem *)v9;

  if (!v8->_vocabularyItem) {
    goto LABEL_5;
  }
  uint64_t v11 = [v7 copy];
  originAppId = v8->_originAppId;
  v8->_originAppId = (NSString *)v11;

  if (v8->_originAppId) {
LABEL_4:
  }
    v13 = v8;
  else {
LABEL_5:
  }
    v13 = 0;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end