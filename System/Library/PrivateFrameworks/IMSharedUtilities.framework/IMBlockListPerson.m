@interface IMBlockListPerson
+ (IMBlockListPerson)personWithCNContact:(id)a3;
- (BOOL)isEqualToPerson:(id)a3;
- (BOOL)isInAddressBook;
- (CNContact)cnPerson;
- (IMBlockListPerson)init;
- (IMBlockListPerson)initWithCNContact:(id)a3;
- (NSString)cachedCompanyName;
- (NSString)cachedFullName;
- (NSString)fullName;
- (NSString)identifier;
- (id)companyName;
- (id)sanitizeString:(id)a3;
- (void)setCachedCompanyName:(id)a3;
- (void)setCachedFullName:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation IMBlockListPerson

+ (IMBlockListPerson)personWithCNContact:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCNContact:v4];

  return (IMBlockListPerson *)v5;
}

- (IMBlockListPerson)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMBlockListPerson;
  v2 = [(IMBlockListPerson *)&v8 init];
  if (v2)
  {
    v3 = (CNContact *)objc_alloc_init(MEMORY[0x1E4F1B8F8]);
    cnPerson = v2->_cnPerson;
    v2->_cnPerson = v3;

    uint64_t v5 = [(CNContact *)v2->_cnPerson identifier];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v5;
  }
  return v2;
}

- (IMBlockListPerson)initWithCNContact:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = [(IMBlockListPerson *)self init];
    goto LABEL_10;
  }
  v20.receiver = self;
  v20.super_class = (Class)IMBlockListPerson;
  v6 = [(IMBlockListPerson *)&v20 init];
  v7 = v6;
  if (!v6)
  {
LABEL_10:
    v7 = v7;
    objc_super v8 = v7;
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_cnPerson, a3);
  objc_super v8 = [(CNContact *)v7->_cnPerson identifier];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F6C420] sharedInstance];
    v10 = [(CNContact *)v7->_cnPerson identifier];
    v11 = (IMBlockListPerson *)[v9 copyOrSetObject:v7 forKey:v10];

    LODWORD(v9) = [(IMBlockListPerson *)v11 isInAddressBook];
    uint64_t v12 = [(CNContact *)v7->_cnPerson identifier];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v12;

    if (v9) {
      BOOL v14 = v11 == v7;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      objc_super v8 = v7;
      goto LABEL_11;
    }
    v15 = [MEMORY[0x1E4F6C420] sharedInstance];
    v16 = [(CNContact *)v7->_cnPerson identifier];
    [v15 removeObject:v7 key:v16];

    v17 = [MEMORY[0x1E4F6C420] sharedInstance];
    v18 = [(CNContact *)v7->_cnPerson identifier];

    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

- (BOOL)isEqualToPerson:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(IMBlockListPerson *)self identifier];
  v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (NSString)fullName
{
  v3 = [(IMBlockListPerson *)self cnPerson];
  id v4 = +[IMContactStore fullNameForCNContact:v3];
  id v5 = [(IMBlockListPerson *)self sanitizeString:v4];
  v6 = (void *)[v5 copy];

  if (v6)
  {
    [(IMBlockListPerson *)self setCachedFullName:v6];
    id v7 = v6;
  }
  else
  {
    objc_super v8 = [(IMBlockListPerson *)self cnPerson];
    v9 = +[IMContactStore companyNameForCNContact:v8];

    if (v9 && [v9 length])
    {
      id v10 = v9;
    }
    else
    {
      id v10 = [(IMBlockListPerson *)self cachedFullName];
    }
    id v7 = v10;
  }

  return (NSString *)v7;
}

- (id)companyName
{
  v3 = [(IMBlockListPerson *)self cnPerson];
  id v4 = +[IMContactStore companyNameForCNContact:v3];
  id v5 = [(IMBlockListPerson *)self sanitizeString:v4];

  if (v5)
  {
    [(IMBlockListPerson *)self setCachedCompanyName:v5];
    id v6 = v5;
  }
  else
  {
    id v6 = [(IMBlockListPerson *)self cachedCompanyName];
  }
  id v7 = v6;

  return v7;
}

- (id)sanitizeString:(id)a3
{
  id v3 = a3;
  if (([v3 isNull] & 1) != 0 || !objc_msgSend(v3, "length"))
  {
    id v5 = 0;
  }
  else
  {
    id v4 = [v3 stringByRemovingWhitespace];

    if ([v4 length])
    {
      id v5 = v4;
      id v3 = v5;
    }
    else
    {
      id v5 = 0;
      id v3 = v4;
    }
  }

  return v5;
}

- (BOOL)isInAddressBook
{
  v2 = [(IMBlockListPerson *)self cnPerson];
  BOOL v3 = +[IMContactStore isCNContactAKnownContact:v2];

  return v3;
}

- (CNContact)cnPerson
{
  return self->_cnPerson;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)cachedFullName
{
  return self->_cachedFullName;
}

- (void)setCachedFullName:(id)a3
{
}

- (NSString)cachedCompanyName
{
  return self->_cachedCompanyName;
}

- (void)setCachedCompanyName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCompanyName, 0);
  objc_storeStrong((id *)&self->_cachedFullName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_cnPerson, 0);
}

@end