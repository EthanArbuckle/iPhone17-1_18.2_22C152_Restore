@interface IMBlockListController
+ (id)sharedBlockList;
+ (void)_createCMFItemRefWithUnsanitizedAddress:(id)a3;
- (BOOL)addressIsBlocked:(id)a3;
- (BOOL)blockAddress:(id)a3;
- (BOOL)blockItem:(id)a3;
- (BOOL)itemIsBlocked:(id)a3;
- (IMBlockListController)init;
- (NSOrderedSet)imBlockItemList;
- (id)_addressForCMItemRef:(void *)a3;
- (id)blockListItems;
- (id)cmfBlockListUpdatedObserver;
- (id)cnDatabaseChangedExternallyObserver;
- (void)_buildBlockList;
- (void)_unblockCMFItem:(void *)a3;
- (void)dealloc;
- (void)listenToCNNotifications;
- (void)removeCNNotifications;
- (void)setCmfBlockListUpdatedObserver:(id)a3;
- (void)setCnDatabaseChangedExternallyObserver:(id)a3;
- (void)setImBlockItemList:(id)a3;
- (void)unblockAddress:(id)a3;
- (void)unblockItem:(id)a3;
@end

@implementation IMBlockListController

- (IMBlockListController)init
{
  v13.receiver = self;
  v13.super_class = (Class)IMBlockListController;
  v2 = [(IMBlockListController *)&v13 init];
  if (v2)
  {
    id location = 0;
    objc_initWeak(&location, v2);
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = *MEMORY[0x1E4F59E40];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = sub_1A07A0CFC;
    v10 = &unk_1E5A100E0;
    objc_copyWeak(&v11, &location);
    v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:&v7];
    -[IMBlockListController setCmfBlockListUpdatedObserver:](v2, "setCmfBlockListUpdatedObserver:", v5, v7, v8, v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(IMBlockListController *)self cmfBlockListUpdatedObserver];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5 = [(IMBlockListController *)self cmfBlockListUpdatedObserver];
    [v4 removeObserver:v5];
  }
  [(IMBlockListController *)self removeCNNotifications];
  v6.receiver = self;
  v6.super_class = (Class)IMBlockListController;
  [(IMBlockListController *)&v6 dealloc];
}

+ (id)sharedBlockList
{
  v2 = (void *)qword_1E94FE950;
  if (!qword_1E94FE950)
  {
    v3 = objc_alloc_init(IMBlockListController);
    uint64_t v4 = (void *)qword_1E94FE950;
    qword_1E94FE950 = (uint64_t)v3;

    v2 = (void *)qword_1E94FE950;
  }

  return v2;
}

- (id)blockListItems
{
  imBlockItemList = self->_imBlockItemList;
  if (!imBlockItemList)
  {
    [(IMBlockListController *)self _buildBlockList];
    imBlockItemList = self->_imBlockItemList;
  }

  return imBlockItemList;
}

- (void)listenToCNNotifications
{
  v3 = [(IMBlockListController *)self cnDatabaseChangedExternallyObserver];

  if (!v3)
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *MEMORY[0x1E4F1AF80];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = sub_1A07A0FF0;
    v10 = &unk_1E5A100E0;
    objc_copyWeak(&v11, &location);
    objc_super v6 = [v4 addObserverForName:v5 object:0 queue:0 usingBlock:&v7];
    -[IMBlockListController setCnDatabaseChangedExternallyObserver:](self, "setCnDatabaseChangedExternallyObserver:", v6, v7, v8, v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)removeCNNotifications
{
  v3 = [(IMBlockListController *)self cnDatabaseChangedExternallyObserver];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = [(IMBlockListController *)self cnDatabaseChangedExternallyObserver];
    [v4 removeObserver:v5];

    [(IMBlockListController *)self setCnDatabaseChangedExternallyObserver:0];
  }
}

- (BOOL)itemIsBlocked:(id)a3
{
  if (a3) {
    return 0;
  }
  objc_msgSend(0, "cmfItem", v3, v4);
  return CMFBlockListIsItemBlocked() != 0;
}

- (BOOL)addressIsBlocked:(id)a3
{
  id v3 = a3;
  if (v3
    && (uint64_t v4 = +[IMBlockListController _createCMFItemRefWithUnsanitizedAddress:v3]) != 0)
  {
    uint64_t v5 = v4;
    BOOL v6 = CMFBlockListIsItemBlocked() != 0;
    CFRelease(v5);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)blockItem:(id)a3
{
  [a3 cmfItem];

  return MEMORY[0x1F4181798](self, sel__blockCMFItemRef_);
}

- (BOOL)blockAddress:(id)a3
{
  uint64_t v4 = +[IMBlockListController _createCMFItemRefWithUnsanitizedAddress:a3];
  if (v4)
  {
    CMFBlockListAddItemForAllServices();
    imBlockItemList = self->_imBlockItemList;
    self->_imBlockItemList = 0;

    CFRelease(v4);
  }
  BOOL v6 = self->_imBlockItemList;
  self->_imBlockItemList = 0;

  return v4 != 0;
}

- (void)unblockItem:(id)a3
{
  uint64_t v4 = [a3 cmfItem];

  [(IMBlockListController *)self _unblockCMFItem:v4];
}

- (void)unblockAddress:(id)a3
{
  uint64_t v4 = +[IMBlockListController _createCMFItemRefWithUnsanitizedAddress:a3];
  if (v4)
  {
    uint64_t v5 = v4;
    if (CMFBlockListIsItemBlocked())
    {
      [(IMBlockListController *)self _unblockCMFItem:v5];
      imBlockItemList = self->_imBlockItemList;
      self->_imBlockItemList = 0;
    }
    CFRelease(v5);
  }
}

+ (void)_createCMFItemRefWithUnsanitizedAddress:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28E58];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  BOOL v6 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  [v5 formUnionWithCharacterSet:v6];

  uint64_t v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  [v5 formUnionWithCharacterSet:v7];

  uint64_t v8 = [v4 stringByTrimmingCharactersInSet:v5];

  if (!MEMORY[0x1A62278C0](v8))
  {
    if (IMStringIsEmail())
    {
      objc_super v13 = (void *)CMFItemCreateWithEmailAddress();
      goto LABEL_7;
    }
LABEL_6:
    objc_super v13 = 0;
    goto LABEL_7;
  }
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = [v9 objectForKey:*MEMORY[0x1E4F1C400]];
  [v10 lowercaseString];

  uint64_t v11 = CFPhoneNumberCreate();
  if (!v11) {
    goto LABEL_6;
  }
  v12 = (const void *)v11;
  objc_super v13 = (void *)CMFItemCreateWithPhoneNumber();
  CFRelease(v12);
LABEL_7:

  return v13;
}

- (void)_buildBlockList
{
  CMFBlockListCopyItemsForAllServicesService();
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:0];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v3 objectAtIndex:v6];
      uint64_t v8 = [(IMBlockListController *)self _addressForCMItemRef:v7];
      v9 = v8;
      if (v8)
      {
        v10 = [v8 associatedPerson];
        uint64_t v11 = [[IMBlockListItem alloc] initWithPerson:v10 address:v9 cmfItemRef:v7];
        [v4 addObject:v9];
        [v5 addObject:v11];
      }
      ++v6;
    }
    while (v6 < [v3 count]);
  }
  v12 = (NSOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v5];
  imBlockItemList = self->_imBlockItemList;
  self->_imBlockItemList = v12;
}

- (id)_addressForCMItemRef:(void *)a3
{
  if (CMFItemGetType())
  {
    CMFItemCopyEmailAddress();
    id v3 = 0;
  }
  else
  {
    CMFItemCopyPhoneNumber();
    IMFormattedPhoneNumberForCFPhoneNumberRef();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_unblockCMFItem:(void *)a3
{
  if (a3 && CMFBlockListIsItemBlocked())
  {
    CMFBlockListRemoveItemFromAllServices();
    imBlockItemList = self->_imBlockItemList;
    self->_imBlockItemList = 0;
  }
}

- (NSOrderedSet)imBlockItemList
{
  return self->_imBlockItemList;
}

- (void)setImBlockItemList:(id)a3
{
}

- (id)cmfBlockListUpdatedObserver
{
  return self->_cmfBlockListUpdatedObserver;
}

- (void)setCmfBlockListUpdatedObserver:(id)a3
{
}

- (id)cnDatabaseChangedExternallyObserver
{
  return self->_cnDatabaseChangedExternallyObserver;
}

- (void)setCnDatabaseChangedExternallyObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cnDatabaseChangedExternallyObserver, 0);
  objc_storeStrong(&self->_cmfBlockListUpdatedObserver, 0);

  objc_storeStrong((id *)&self->_imBlockItemList, 0);
}

@end