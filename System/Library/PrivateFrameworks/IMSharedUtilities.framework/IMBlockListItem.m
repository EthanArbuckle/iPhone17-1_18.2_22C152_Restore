@interface IMBlockListItem
- (BOOL)isEqualToBlockListItem:(id)a3;
- (CNContact)cnPerson;
- (IMBlockListItem)initWithCNContact:(id)a3 address:(id)a4 cmfItemRef:(void *)a5;
- (IMBlockListItem)initWithPerson:(id)a3 address:(id)a4 cmfItemRef:(void *)a5;
- (IMBlockListPerson)person;
- (NSString)address;
- (NSString)cachedFormattedHandle;
- (NSString)cachedFormattedPersonName;
- (id)formattedAddress;
- (id)formattedHandle;
- (id)fullName;
- (void)cmfItem;
- (void)dealloc;
- (void)lookupPerson;
- (void)setAddress:(id)a3;
- (void)setCachedFormattedHandle:(id)a3;
- (void)setCachedFormattedPersonName:(id)a3;
- (void)setCmfItem:(void *)a3;
- (void)setPerson:(id)a3;
@end

@implementation IMBlockListItem

- (IMBlockListItem)initWithPerson:(id)a3 address:(id)a4 cmfItemRef:(void *)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMBlockListItem;
  v11 = [(IMBlockListItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_person, a3);
    objc_storeStrong((id *)&v12->_address, a4);
    v12->_cmfItem = (void *)CFRetain(a5);
    [(IMBlockListItem *)v12 lookupPerson];
  }

  return v12;
}

- (IMBlockListItem)initWithCNContact:(id)a3 address:(id)a4 cmfItemRef:(void *)a5
{
  id v8 = a4;
  if (a3)
  {
    a3 = +[IMBlockListPerson personWithCNContact:a3];
  }
  id v9 = [(IMBlockListItem *)self initWithPerson:a3 address:v8 cmfItemRef:a5];

  return v9;
}

- (CNContact)cnPerson
{
  return [(IMBlockListPerson *)self->_person cnPerson];
}

- (void)dealloc
{
  cmfItem = self->_cmfItem;
  if (cmfItem) {
    CFRelease(cmfItem);
  }
  v4.receiver = self;
  v4.super_class = (Class)IMBlockListItem;
  [(IMBlockListItem *)&v4 dealloc];
}

- (void)lookupPerson
{
  p_person = &self->_person;
  if (!self->_person && [(NSString *)self->_address length])
  {
    objc_super v4 = [(NSString *)self->_address associatedPerson];
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      objc_storeStrong((id *)p_person, v4);
      v5 = v6;
    }
    MEMORY[0x1F41817F8](v4, v5);
  }
}

- (id)fullName
{
  v3 = [(IMBlockListItem *)self person];

  if (v3)
  {
    objc_super v4 = [(IMBlockListItem *)self person];
    v5 = [v4 fullName];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)formattedHandle
{
  v3 = [(IMBlockListItem *)self cachedFormattedHandle];

  if (!v3)
  {
    uint64_t v4 = [(IMBlockListItem *)self person];
    if (v4
      && (v5 = (void *)v4,
          [(IMBlockListItem *)self address],
          v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = MEMORY[0x1A62278C0](),
          v6,
          v5,
          v7))
    {
      id v8 = [(IMBlockListItem *)self address];
      id v9 = [(IMBlockListItem *)self person];
      id v10 = [v8 cnLabelForPerson:v9];

      v11 = [(IMBlockListItem *)self formattedAddress];
      if (v10 && [v10 length])
      {
        id v12 = [NSString stringWithFormat:@"(%@) %@", v10, v11];
      }
      else
      {
        id v12 = v11;
      }
      v13 = v12;
      [(IMBlockListItem *)self setCachedFormattedHandle:v12];
    }
    else
    {
      id v10 = [(IMBlockListItem *)self formattedAddress];
      [(IMBlockListItem *)self setCachedFormattedHandle:v10];
    }
  }

  return [(IMBlockListItem *)self cachedFormattedHandle];
}

- (id)formattedAddress
{
  if ([(NSString *)self->_address length]
    && [(NSString *)self->_address _appearsToBePhoneNumber])
  {
    v3 = [(NSString *)self->_address formattedPhoneNumber];
  }
  else
  {
    v3 = self->_address;
  }

  return v3;
}

- (BOOL)isEqualToBlockListItem:(id)a3
{
  v5 = (IMBlockListItem *)a3;
  v6 = v5;
  if (self != v5)
  {
    person = self->_person;
    id v8 = person;
    if (!person)
    {
      v3 = [(IMBlockListItem *)v5 person];
      if (!v3)
      {
        char v10 = 1;
        goto LABEL_9;
      }
      id v8 = self->_person;
    }
    id v9 = [(IMBlockListItem *)v6 person];
    char v10 = [(IMBlockListPerson *)v8 isEqualToPerson:v9];

    if (person)
    {
LABEL_10:
      id v12 = [(IMBlockListItem *)self address];
      v13 = [(IMBlockListItem *)v6 address];
      char v14 = [v12 isEqualToBlockListAddress:v13];

      char v11 = v10 & v14;
      goto LABEL_11;
    }
LABEL_9:

    goto LABEL_10;
  }
  char v11 = 1;
LABEL_11:

  return v11;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void)cmfItem
{
  return self->_cmfItem;
}

- (void)setCmfItem:(void *)a3
{
  self->_cmfItem = a3;
}

- (IMBlockListPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
}

- (NSString)cachedFormattedHandle
{
  return self->_cachedFormattedHandle;
}

- (void)setCachedFormattedHandle:(id)a3
{
}

- (NSString)cachedFormattedPersonName
{
  return self->_cachedFormattedPersonName;
}

- (void)setCachedFormattedPersonName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFormattedPersonName, 0);
  objc_storeStrong((id *)&self->_cachedFormattedHandle, 0);
  objc_storeStrong((id *)&self->_person, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end