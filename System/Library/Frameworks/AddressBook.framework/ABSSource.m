@interface ABSSource
+ (void)initialize;
- (ABSAddressBook)addressBook;
- (ABSSource)initWithMutableContainer:(id)a3;
- (ABSSource)source;
- (BOOL)removeProperty:(int)a3 withError:(id *)a4;
- (BOOL)setValue:(void *)a3 forProperty:(int)a4 withError:(__CFError *)a5;
- (CNAccount)account;
- (CNMutableContainer)cnImpl;
- (NSString)CNIdentifierString;
- (NSString)compositeName;
- (id)getAccount;
- (int)id;
- (int)revertedRecordID;
- (unsigned)type;
- (void)copyValueForProperty:(int)a3;
- (void)replaceRecordStorageWithCNObject:(id)a3;
- (void)setAddressBook:(id)a3;
- (void)setCnImpl:(id)a3;
- (void)setRevertedRecordID:(int)a3;
- (void)setSource:(id)a3;
- (void)updateAllValuesWithValuesFromContainer:(id)a3;
@end

@implementation ABSSource

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___ABSSource;
  objc_msgSendSuper2(&v2, sel_initialize);
  +[ABSAddressBook ABInitialize];
}

- (ABSSource)initWithMutableContainer:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ABSSource;
  v5 = [(ABSSource *)&v7 init];
  if (v5)
  {
    if (!v4) {
      id v4 = objc_alloc_init(MEMORY[0x263EFEB00]);
    }
    objc_storeStrong((id *)&v5->_cnImpl, v4);
  }

  return v5;
}

- (int)id
{
  v3 = [(ABSSource *)self cnImpl];
  int v4 = [v3 iOSLegacyIdentifier];

  if (self->_cnImpl) {
    return v4;
  }
  else {
    return -1;
  }
}

- (CNMutableContainer)cnImpl
{
  if (!self->_cnImpl && [(ABSSource *)self revertedRecordID] != -1)
  {
    v3 = [(ABSSource *)self addressBook];
    id v4 = (id)objc_msgSend(v3, "sourceWithRecordID:", -[ABSSource revertedRecordID](self, "revertedRecordID"));
  }
  cnImpl = self->_cnImpl;

  return cnImpl;
}

- (NSString)CNIdentifierString
{
  objc_super v2 = [(ABSSource *)self cnImpl];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (unsigned)type
{
  return 2;
}

- (NSString)compositeName
{
  objc_super v2 = [(ABSSource *)self cnImpl];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (id)getAccount
{
  return 0;
}

- (ABSSource)source
{
  p_source = &self->_source;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  if (!WeakRetained)
  {
    v5 = [(ABSSource *)self addressBook];
    v6 = [v5 sourceForRecord:self];
    objc_storeWeak((id *)p_source, v6);
  }
  id v7 = objc_loadWeakRetained((id *)p_source);

  return (ABSSource *)v7;
}

- (void)copyValueForProperty:(int)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      id v4 = [(ABSSource *)self cnImpl];
      uint64_t v5 = [v4 type];

      v6 = +[ABSConstantsMapping CNToABSourceTypeConstantsMapping];
      id v7 = [NSNumber numberWithInteger:v5];
      v3 = [v6 mappedConstant:v7];

      if (!v3
        || ([MEMORY[0x263EFF9D0] null],
            v8 = objc_claimAutoreleasedReturnValue(),
            v8,
            v3 == v8))
      {

        v3 = &unk_26C591BE0;
      }
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = [(ABSSource *)self compositeName];
  }
  v9 = (void *)[v3 copy];

  return v9;
}

- (BOOL)setValue:(void *)a3 forProperty:(int)a4 withError:(__CFError *)a5
{
  if (!a4)
  {
    id v7 = a3;
    v8 = [(ABSSource *)self cnImpl];
    [v8 setName:v7];

    v9 = [(ABSSource *)self addressBook];
    [v9 recordUpdated:self];
  }
  return a4 == 0;
}

- (BOOL)removeProperty:(int)a3 withError:(id *)a4
{
  if (!a3)
  {
    v6 = [(ABSSource *)self cnImpl];
    [v6 setName:0];

    id v7 = [(ABSSource *)self addressBook];
    [v7 recordUpdated:self];
  }
  return a3 == 0;
}

- (void)updateAllValuesWithValuesFromContainer:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(ABSSource *)self cnImpl];
    v6 = [v4 identifier];
    [v5 setIdentifier:v6];

    id v7 = [(ABSSource *)self cnImpl];
    v8 = [v4 name];
    [v7 setName:v8];

    v9 = [(ABSSource *)self cnImpl];
    objc_msgSend(v9, "setIOSLegacyIdentifier:", objc_msgSend(v4, "iOSLegacyIdentifier"));

    id v11 = [(ABSSource *)self cnImpl];
    uint64_t v10 = [v4 type];

    [v11 setType:v10];
  }
}

- (void)replaceRecordStorageWithCNObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [v5 mutableCopy];

      uint64_t v5 = (void *)v6;
    }
    id v7 = v5;
  }
  else
  {
    v8 = [(ABSSource *)self cnImpl];
    -[ABSSource setRevertedRecordID:](self, "setRevertedRecordID:", [v8 iOSLegacyIdentifier]);

    id v7 = 0;
  }
  id v9 = v7;
  [(ABSSource *)self setCnImpl:v7];
}

- (ABSAddressBook)addressBook
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addressBook);

  return (ABSAddressBook *)WeakRetained;
}

- (void)setAddressBook:(id)a3
{
}

- (void)setSource:(id)a3
{
}

- (CNAccount)account
{
  return self->_account;
}

- (void)setCnImpl:(id)a3
{
}

- (int)revertedRecordID
{
  return self->_revertedRecordID;
}

- (void)setRevertedRecordID:(int)a3
{
  self->_revertedRecordID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnImpl, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_source);

  objc_destroyWeak((id *)&self->_addressBook);
}

@end