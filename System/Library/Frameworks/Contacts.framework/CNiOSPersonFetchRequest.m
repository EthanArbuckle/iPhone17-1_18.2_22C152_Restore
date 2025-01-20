@interface CNiOSPersonFetchRequest
+ (id)effectivePredicate:(id)a3;
+ (id)fetchRequestFromCNFetchRequest:(id)a3 managedConfiguration:(id)a4 error:(id *)a5;
+ (id)validatePredicate:(id)a3 error:(id *)a4;
+ (int64_t)resolvedSortOrderFromContactSortOrder:(int64_t)a3;
- (BOOL)shouldSort;
- (BOOL)unifiedFetch;
- (CNManagedConfiguration)managedConfiguration;
- (CNiOSContactPredicate)predicate;
- (CNiOSPersonFetchRequest)initWithPredicate:(id)a3 keysToFetch:(id)a4 shouldSort:(BOOL)a5 sortOrder:(unsigned int)a6 unifiedFetch:(BOOL)a7 batchSize:(int64_t)a8 managedConfiguration:(id)a9 options:(unint64_t)a10;
- (NSArray)keysToFetch;
- (int64_t)batchSize;
- (unint64_t)options;
- (unsigned)sortOrder;
- (unsigned)sortOrderIncludingNone;
@end

@implementation CNiOSPersonFetchRequest

- (CNManagedConfiguration)managedConfiguration
{
  return (CNManagedConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)unifiedFetch
{
  return self->_unifiedFetch;
}

- (unsigned)sortOrderIncludingNone
{
  if (![(CNiOSPersonFetchRequest *)self shouldSort]) {
    return -1;
  }

  return [(CNiOSPersonFetchRequest *)self sortOrder];
}

- (BOOL)shouldSort
{
  return self->_shouldSort;
}

- (NSArray)keysToFetch
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

+ (id)fetchRequestFromCNFetchRequest:(id)a3 managedConfiguration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 predicate];
  v11 = [a1 validatePredicate:v10 error:a5];

  if (v11)
  {
    uint64_t v12 = objc_msgSend(a1, "resolvedSortOrderFromContactSortOrder:", objc_msgSend(v8, "sortOrder"));
    BOOL v13 = v12 != 0;
    v14 = +[CNiOSABConstantsMapping CNToABPersonSortOrderingConstantsMapping];
    v15 = [NSNumber numberWithInteger:v12];
    v16 = [v14 mappedConstant:v15];
    uint64_t v17 = [v16 unsignedIntValue];

    v18 = [CNiOSPersonFetchRequest alloc];
    v19 = [v8 effectiveKeysToFetch];
    v20 = [v19 allObjects];
    v21 = -[CNiOSPersonFetchRequest initWithPredicate:keysToFetch:shouldSort:sortOrder:unifiedFetch:batchSize:managedConfiguration:options:](v18, "initWithPredicate:keysToFetch:shouldSort:sortOrder:unifiedFetch:batchSize:managedConfiguration:options:", v11, v20, v13, v17, [v8 unifyResults], objc_msgSend(v8, "batchSize"), v9, 1);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (CNiOSPersonFetchRequest)initWithPredicate:(id)a3 keysToFetch:(id)a4 shouldSort:(BOOL)a5 sortOrder:(unsigned int)a6 unifiedFetch:(BOOL)a7 batchSize:(int64_t)a8 managedConfiguration:(id)a9 options:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v23 = a9;
  v24.receiver = self;
  v24.super_class = (Class)CNiOSPersonFetchRequest;
  v19 = [(CNiOSPersonFetchRequest *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_keysToFetch, a4);
    objc_storeStrong((id *)&v20->_predicate, a3);
    v20->_shouldSort = a5;
    v20->_sortOrder = a6;
    v20->_options = a10;
    v20->_unifiedFetch = a7;
    v20->_batchSize = a8;
    objc_storeStrong((id *)&v20->_managedConfiguration, a9);
    v21 = v20;
  }

  return v20;
}

+ (id)validatePredicate:(id)a3 error:(id *)a4
{
  v5 = [a1 effectivePredicate:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      *a4 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    }
    goto LABEL_6;
  }
  if (([v5 conformsToProtocol:&unk_1EE08B958] & 1) == 0)
  {
LABEL_6:

    v5 = 0;
  }

  return v5;
}

+ (int64_t)resolvedSortOrderFromContactSortOrder:(int64_t)a3
{
  if ((unint64_t)a3 <= 3 && a3 != 1 || a3 == 1000) {
    return a3;
  }
  v4 = +[CNContactsUserDefaults sharedDefaults];
  int64_t v5 = [v4 sortOrder];

  return v5;
}

+ (id)effectivePredicate:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = +[CNContact predicateForAllContacts];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

- (unsigned)sortOrder
{
  return self->_sortOrder;
}

- (CNiOSContactPredicate)predicate
{
  return (CNiOSContactPredicate *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)options
{
  return self->_options;
}

@end