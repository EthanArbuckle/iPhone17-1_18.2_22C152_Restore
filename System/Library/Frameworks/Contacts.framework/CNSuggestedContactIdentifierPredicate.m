@interface CNSuggestedContactIdentifierPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsNativeSorting;
- (CNSuggestedContactIdentifierPredicate)initWithCoder:(id)a3;
- (CNSuggestedContactIdentifierPredicate)initWithSuggestionIdentifier:(unint64_t)a3;
- (NSString)description;
- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6;
- (unint64_t)suggestionIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNSuggestedContactIdentifierPredicate

- (CNSuggestedContactIdentifierPredicate)initWithSuggestionIdentifier:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNSuggestedContactIdentifierPredicate;
  v4 = [(CNPredicate *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_suggestionIdentifier = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSuggestedContactIdentifierPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNSuggestedContactIdentifierPredicate;
  v5 = [(CNPredicate *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_suggestionIdentifier = [v4 decodeInt64ForKey:@"_suggestionIdentifier"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNSuggestedContactIdentifierPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_suggestionIdentifier, @"_suggestionIdentifier", v5.receiver, v5.super_class);
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForSuggestionIdentifier:]"];
  objc_super v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CNSuggestedContactIdentifierPredicate suggestionIdentifier](self, "suggestionIdentifier"));
  id v6 = (id)[v3 appendName:@"identifier" object:v5];

  v7 = [v3 build];

  return (NSString *)v7;
}

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  v16[1] = *MEMORY[0x1E4F143B8];
  objc_super v8 = (void *)MEMORY[0x1E4F5DB20];
  id v9 = a5;
  v10 = objc_msgSend(v8, "recordIdWithInternalEntityId:", -[CNSuggestedContactIdentifierPredicate suggestionIdentifier](self, "suggestionIdentifier"));
  v11 = [v9 contactFromRecordID:v10 error:a6];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F5D9B8]);
    v13 = (void *)[v12 initWithContact:v11 matchTokens:MEMORY[0x1E4F1CBF0] matchInfo:MEMORY[0x1E4F1CBF0]];
    v16[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

@end