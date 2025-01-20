@interface _CSContactSearchResult
+ (id)generateQueryStringForContact:(id)a3 filterQueries:(id)a4 includeSecondaryRecipients:(BOOL)a5 inputScope:(unint64_t)a6;
- (BOOL)contact;
- (BOOL)recent;
- (NSArray)emailAddresses;
- (NSNumber)recentsIdentifier;
- (NSPersonNameComponents)nameComponents;
- (NSString)contactIdentifier;
- (NSString)displayName;
- (_CSContactSearchResult)initWithDisplayName:(id)a3 emailAddresses:(id)a4 contactIdentifier:(id)a5 recentsIdentifier:(id)a6 sourceType:(unint64_t)a7;
- (_CSContactSearchResult)initWithDisplayName:(id)a3 nameComponents:(id)a4 emailAddresses:(id)a5 contactIdentifier:(id)a6 recentsIdentifier:(id)a7 sourceType:(unint64_t)a8;
- (unint64_t)scope;
- (unint64_t)sourceType;
- (void)setEmailAddresses:(id)a3;
- (void)setScope:(unint64_t)a3;
@end

@implementation _CSContactSearchResult

- (_CSContactSearchResult)initWithDisplayName:(id)a3 nameComponents:(id)a4 emailAddresses:(id)a5 contactIdentifier:(id)a6 recentsIdentifier:(id)a7 sourceType:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v29.receiver = self;
  v29.super_class = (Class)_CSContactSearchResult;
  v19 = [(_CSContactSearchResult *)&v29 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    nameComponents = v19->_nameComponents;
    v19->_nameComponents = (NSPersonNameComponents *)v22;

    uint64_t v24 = [v16 copy];
    emailAddresses = v19->_emailAddresses;
    v19->_emailAddresses = (NSArray *)v24;

    uint64_t v26 = [v17 copy];
    contactIdentifier = v19->_contactIdentifier;
    v19->_contactIdentifier = (NSString *)v26;

    objc_storeStrong((id *)&v19->_recentsIdentifier, a7);
    v19->_sourceType = a8;
  }

  return v19;
}

- (_CSContactSearchResult)initWithDisplayName:(id)a3 emailAddresses:(id)a4 contactIdentifier:(id)a5 recentsIdentifier:(id)a6 sourceType:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_CSContactSearchResult;
  id v16 = [(_CSContactSearchResult *)&v25 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    displayName = v16->_displayName;
    v16->_displayName = (NSString *)v17;

    nameComponents = v16->_nameComponents;
    v16->_nameComponents = 0;

    uint64_t v20 = [v13 copy];
    emailAddresses = v16->_emailAddresses;
    v16->_emailAddresses = (NSArray *)v20;

    uint64_t v22 = [v14 copy];
    contactIdentifier = v16->_contactIdentifier;
    v16->_contactIdentifier = (NSString *)v22;

    objc_storeStrong((id *)&v16->_recentsIdentifier, a6);
    v16->_sourceType = a7;
  }

  return v16;
}

- (BOOL)contact
{
  return (LOBYTE(self->_sourceType) >> 1) & 1;
}

- (BOOL)recent
{
  return self->_sourceType & 1;
}

+ (id)generateQueryStringForContact:(id)a3 filterQueries:(id)a4 includeSecondaryRecipients:(BOOL)a5 inputScope:(unint64_t)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  if (v9 && [v9 count])
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    id v12 = @"kMDItemAuthorEmailAddresses";
    if (a6 == 2)
    {
      id v13 = MDItemRecipientEmailAddresses;
      if (!v7) {
        id v13 = MDItemPrimaryRecipientEmailAddresses;
      }
      id v14 = *v13;

      id v12 = v14;
    }
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    objc_super v25 = __108___CSContactSearchResult_generateQueryStringForContact_filterQueries_includeSecondaryRecipients_inputScope___block_invoke;
    uint64_t v26 = &unk_1E554C798;
    id v15 = v11;
    id v27 = v15;
    id v16 = v12;
    v28 = v16;
    [v9 enumerateObjectsUsingBlock:&v23];
    uint64_t v17 = [v15 componentsJoinedByString:@" || "];
    if (v10 && [v10 count])
    {
      if ([v10 count] == 1)
      {
        id v18 = [v10 objectAtIndexedSubscript:0];
      }
      else
      {
        uint64_t v20 = NSString;
        v21 = [v10 componentsJoinedByString:@") && ("];
        id v18 = [v20 stringWithFormat:@"(%@)", v21];
      }
      v19 = [NSString stringWithFormat:@"((%@) && (%@))", v17, v18, v23, v24, v25, v26, v27];
    }
    else
    {
      v19 = [NSString stringWithFormat:@"(%@)", v17];
    }
  }
  else
  {
    v19 = @"(false)";
  }

  return v19;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSNumber)recentsIdentifier
{
  return self->_recentsIdentifier;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (unint64_t)scope
{
  return self->_scope;
}

- (void)setScope:(unint64_t)a3
{
  self->_scope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end