@interface CNiOSABSaveContext
- (CNMutableSaveResponse)saveResponse;
- (CNSaveRequest)saveRequest;
- (CNiOSABSaveContext)initWithSaveRequest:(id)a3 response:(id)a4 addressBook:(void *)a5;
- (NSMapTable)contactIndicesByInstance;
- (NSMapTable)containerIndicesByInstance;
- (NSMapTable)groupIndicesByInstance;
- (NSMutableArray)contactIdentifiersNeedingMetadataPurge;
- (NSMutableDictionary)abAccountsByIdentifier;
- (NSMutableDictionary)abGroupsByIdentifier;
- (NSMutableDictionary)abPersonsByIdentifier;
- (NSMutableDictionary)abSourcesByIdentifier;
- (id)indexPathForContactInstance:(id)a3;
- (id)indexPathForContainerInstance:(id)a3;
- (id)indexPathForGroupInstance:(id)a3;
- (void)_populateSaveRequestIndexTables;
- (void)addressBook;
- (void)dealloc;
- (void)setAbAccountsByIdentifier:(id)a3;
- (void)setAbGroupsByIdentifier:(id)a3;
- (void)setAbPersonsByIdentifier:(id)a3;
- (void)setAbSourcesByIdentifier:(id)a3;
- (void)setContactIdentifiersNeedingMetadataPurge:(id)a3;
@end

@implementation CNiOSABSaveContext

- (CNiOSABSaveContext)initWithSaveRequest:(id)a3 response:(id)a4 addressBook:(void *)a5
{
  id v9 = a3;
  id v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CNiOSABSaveContext;
  v11 = [(CNiOSABSaveContext *)&v32 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_saveRequest, a3);
    objc_storeStrong((id *)&v12->_saveResponse, a4);
    if (a5) {
      v13 = (void *)CFRetain(a5);
    }
    else {
      v13 = 0;
    }
    v12->_addressBook = v13;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    abPersonsByIdentifier = v12->_abPersonsByIdentifier;
    v12->_abPersonsByIdentifier = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    abGroupsByIdentifier = v12->_abGroupsByIdentifier;
    v12->_abGroupsByIdentifier = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    abSourcesByIdentifier = v12->_abSourcesByIdentifier;
    v12->_abSourcesByIdentifier = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    abAccountsByIdentifier = v12->_abAccountsByIdentifier;
    v12->_abAccountsByIdentifier = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contactIdentifiersNeedingMetadataPurge = v12->_contactIdentifiersNeedingMetadataPurge;
    v12->_contactIdentifiersNeedingMetadataPurge = v22;

    uint64_t v24 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    contactIndicesByInstance = v12->_contactIndicesByInstance;
    v12->_contactIndicesByInstance = (NSMapTable *)v24;

    uint64_t v26 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    groupIndicesByInstance = v12->_groupIndicesByInstance;
    v12->_groupIndicesByInstance = (NSMapTable *)v26;

    uint64_t v28 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    containerIndicesByInstance = v12->_containerIndicesByInstance;
    v12->_containerIndicesByInstance = (NSMapTable *)v28;

    [(CNiOSABSaveContext *)v12 _populateSaveRequestIndexTables];
    v30 = v12;
  }

  return v12;
}

- (void)addressBook
{
  addressBook = self->_addressBook;
  if (!addressBook) {
    return 0;
  }
  CFTypeRef v3 = CFRetain(addressBook);
  if (!v3) {
    return 0;
  }

  return (void *)CFAutorelease(v3);
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNiOSABSaveContext;
  [(CNiOSABSaveContext *)&v4 dealloc];
}

- (void)_populateSaveRequestIndexTables
{
  CFTypeRef v3 = [(CNSaveRequest *)self->_saveRequest allContacts];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke;
  v8[3] = &unk_1E56B5508;
  v8[4] = self;
  [v3 enumerateObjectsUsingBlock:v8];
  objc_super v4 = [(CNSaveRequest *)self->_saveRequest allGroups];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_3;
  v7[3] = &unk_1E56B5530;
  v7[4] = self;
  [v4 enumerateObjectsUsingBlock:v7];

  v5 = [(CNSaveRequest *)self->_saveRequest allContainers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_4;
  v6[3] = &unk_1E56B5558;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 contactIndicesByInstance];
  v8 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
  [v7 setObject:v8 forKey:v6];

  id v9 = [v6 linkedContacts];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_2;
  v10[3] = &unk_1E56B54E0;
  v10[4] = *(void *)(a1 + 32);
  v10[5] = a3;
  [v9 enumerateObjectsUsingBlock:v10];
}

void __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  CFTypeRef v3 = *(void **)(a1 + 32);
  v7[0] = *(void *)(a1 + 40);
  v7[1] = a3;
  id v4 = a2;
  v5 = [v3 contactIndicesByInstance];
  id v6 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v7 length:2];
  [v5 setObject:v6 forKey:v4];
}

void __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [v4 groupIndicesByInstance];
  id v6 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
  [v7 setObject:v6 forKey:v5];
}

void __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [v4 containerIndicesByInstance];
  id v6 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
  [v7 setObject:v6 forKey:v5];
}

- (id)indexPathForContactInstance:(id)a3
{
  return [(NSMapTable *)self->_contactIndicesByInstance objectForKey:a3];
}

- (id)indexPathForGroupInstance:(id)a3
{
  return [(NSMapTable *)self->_groupIndicesByInstance objectForKey:a3];
}

- (id)indexPathForContainerInstance:(id)a3
{
  return [(NSMapTable *)self->_containerIndicesByInstance objectForKey:a3];
}

- (NSMapTable)contactIndicesByInstance
{
  return self->_contactIndicesByInstance;
}

- (NSMapTable)groupIndicesByInstance
{
  return self->_groupIndicesByInstance;
}

- (NSMapTable)containerIndicesByInstance
{
  return self->_containerIndicesByInstance;
}

- (NSMutableDictionary)abPersonsByIdentifier
{
  return self->_abPersonsByIdentifier;
}

- (void)setAbPersonsByIdentifier:(id)a3
{
}

- (NSMutableDictionary)abGroupsByIdentifier
{
  return self->_abGroupsByIdentifier;
}

- (void)setAbGroupsByIdentifier:(id)a3
{
}

- (NSMutableDictionary)abSourcesByIdentifier
{
  return self->_abSourcesByIdentifier;
}

- (void)setAbSourcesByIdentifier:(id)a3
{
}

- (NSMutableDictionary)abAccountsByIdentifier
{
  return self->_abAccountsByIdentifier;
}

- (void)setAbAccountsByIdentifier:(id)a3
{
}

- (NSMutableArray)contactIdentifiersNeedingMetadataPurge
{
  return self->_contactIdentifiersNeedingMetadataPurge;
}

- (void)setContactIdentifiersNeedingMetadataPurge:(id)a3
{
}

- (CNSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (CNMutableSaveResponse)saveResponse
{
  return self->_saveResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveRequest, 0);
  objc_storeStrong((id *)&self->_contactIdentifiersNeedingMetadataPurge, 0);
  objc_storeStrong((id *)&self->_abAccountsByIdentifier, 0);
  objc_storeStrong((id *)&self->_abSourcesByIdentifier, 0);
  objc_storeStrong((id *)&self->_abGroupsByIdentifier, 0);
  objc_storeStrong((id *)&self->_abPersonsByIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIndicesByInstance, 0);
  objc_storeStrong((id *)&self->_groupIndicesByInstance, 0);
  objc_storeStrong((id *)&self->_contactIndicesByInstance, 0);

  objc_storeStrong((id *)&self->_saveResponse, 0);
}

@end