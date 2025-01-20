@interface ABSGroup
+ (id)propertyKeyForPropertyID:(int)a3;
+ (void)initialize;
- (ABSAddressBook)addressBook;
- (ABSGroup)init;
- (ABSGroup)initWithMutableGroup:(id)a3;
- (ABSGroup)initWithSource:(id)a3;
- (ABSSource)source;
- (BOOL)removeProperty:(int)a3 withError:(id *)a4;
- (BOOL)setValue:(void *)a3 forProperty:(int)a4 withError:(__CFError *)a5;
- (CNMutableGroup)cnImpl;
- (NSString)CNIdentifierString;
- (NSString)compositeName;
- (int)id;
- (int)revertedRecordID;
- (unsigned)type;
- (void)copyValueForProperty:(int)a3;
- (void)replaceRecordStorageWithCNObject:(id)a3;
- (void)setAddressBook:(id)a3;
- (void)setCnImpl:(id)a3;
- (void)setRevertedRecordID:(int)a3;
- (void)setSource:(id)a3;
- (void)updateAllValuesWithValuesFromGroup:(id)a3;
@end

@implementation ABSGroup

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___ABSGroup;
  objc_msgSendSuper2(&v2, sel_initialize);
  +[ABSAddressBook ABInitialize];
}

- (ABSGroup)initWithSource:(id)a3
{
  id v4 = a3;
  v5 = [(ABSGroup *)self initWithMutableGroup:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_source, v4);
    v6->_revertedRecordID = -1;
  }

  return v6;
}

- (ABSGroup)initWithMutableGroup:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ABSGroup;
  v5 = [(ABSGroup *)&v7 init];
  if (v5)
  {
    if (!v4) {
      id v4 = objc_alloc_init(MEMORY[0x263EFEB08]);
    }
    objc_storeStrong((id *)&v5->_cnImpl, v4);
  }

  return v5;
}

- (ABSGroup)init
{
  return [(ABSGroup *)self initWithSource:0];
}

- (int)id
{
  objc_super v2 = [(ABSGroup *)self cnImpl];
  int v3 = [v2 iOSLegacyIdentifier];

  if (v3) {
    return v3;
  }
  else {
    return -1;
  }
}

- (CNMutableGroup)cnImpl
{
  if (!self->_cnImpl && [(ABSGroup *)self revertedRecordID] != -1)
  {
    int v3 = [(ABSGroup *)self addressBook];
    id v4 = (id)objc_msgSend(v3, "groupWithRecordID:", -[ABSGroup revertedRecordID](self, "revertedRecordID"));
  }
  cnImpl = self->_cnImpl;

  return cnImpl;
}

- (NSString)CNIdentifierString
{
  objc_super v2 = [(ABSGroup *)self cnImpl];
  int v3 = [v2 identifier];

  return (NSString *)v3;
}

- (unsigned)type
{
  return 1;
}

- (NSString)compositeName
{
  objc_super v2 = [(ABSGroup *)self cnImpl];
  int v3 = [v2 name];

  return (NSString *)v3;
}

- (ABSSource)source
{
  p_source = &self->_source;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_source);
    if (v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ([(ABSGroup *)self id] == -1
    || ([(ABSGroup *)self addressBook],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 sourceForRecord:self],
        v5 = objc_claimAutoreleasedReturnValue(),
        v6,
        objc_storeWeak((id *)p_source, v5),
        !v5))
  {
LABEL_6:
    objc_super v7 = [(ABSGroup *)self addressBook];
    v5 = [v7 defaultSource];

    objc_storeWeak((id *)p_source, v5);
  }
LABEL_7:

  return (ABSSource *)v5;
}

- (void)copyValueForProperty:(int)a3
{
  if (a3)
  {
    int v3 = 0;
  }
  else
  {
    int v3 = [(ABSGroup *)self compositeName];
  }
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)setValue:(void *)a3 forProperty:(int)a4 withError:(__CFError *)a5
{
  objc_super v7 = +[ABSGroup propertyKeyForPropertyID:*(void *)&a4];
  v8 = a3;
  v9 = [(ABSGroup *)self cnImpl];
  [v9 setValue:v8 forKey:v7];

  v10 = [(ABSGroup *)self addressBook];
  [v10 recordUpdated:self];

  return 1;
}

- (BOOL)removeProperty:(int)a3 withError:(id *)a4
{
  v5 = +[ABSGroup propertyKeyForPropertyID:](ABSGroup, "propertyKeyForPropertyID:", *(void *)&a3, a4);
  v6 = [(ABSGroup *)self cnImpl];
  [v6 setValue:0 forKey:v5];

  objc_super v7 = [(ABSGroup *)self addressBook];
  [v7 recordUpdated:self];

  return 1;
}

- (void)updateAllValuesWithValuesFromGroup:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = *MEMORY[0x263EFE1B0];
    v18[0] = *MEMORY[0x263EFE1B8];
    v18[1] = v5;
    v18[2] = *MEMORY[0x263EFE1C0];
    v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v18, 3, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          v12 = [(ABSGroup *)self cnImpl];
          v13 = [v4 valueForKey:v11];
          [v12 setValue:v13 forKey:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }
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
    uint64_t v8 = [(ABSGroup *)self cnImpl];
    -[ABSGroup setRevertedRecordID:](self, "setRevertedRecordID:", [v8 iOSLegacyIdentifier]);

    id v7 = 0;
  }
  id v9 = v7;
  [(ABSGroup *)self setCnImpl:v7];
}

+ (id)propertyKeyForPropertyID:(int)a3
{
  if (a3) {
    id v3 = 0;
  }
  else {
    id v3 = (id)*MEMORY[0x263EFE1C0];
  }

  return v3;
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
  objc_destroyWeak((id *)&self->_source);

  objc_destroyWeak((id *)&self->_addressBook);
}

@end