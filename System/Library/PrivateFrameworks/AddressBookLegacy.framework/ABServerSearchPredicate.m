@interface ABServerSearchPredicate
- (ABPredicateDelegate)delegate;
- (ABServerSearchPredicate)initWithSearchString:(id)a3 source:(void *)a4 account:(id)a5;
- (ABServerSearchPredicate)initWithSearchString:(id)a3 source:(void *)a4 account:(id)a5 includeSourceInResults:(BOOL)a6;
- (ABServerSearchPredicate)initWithSearchString:(id)a3 source:(void *)a4 account:(id)a5 includeSourceInResults:(BOOL)a6 includePhotosInResults:(BOOL)a7;
- (BOOL)includePhotosInResults;
- (BOOL)includeSourceInResults;
- (DADConnection)connection;
- (NSString)accountIdentifier;
- (NSString)searchString;
- (int)_errorForDAStatusCode:(int64_t)a3;
- (int)error;
- (void)_searchQueryIsDone;
- (void)ab_runPredicateWithSortOrder:(unsigned int)a3 ranked:(BOOL)a4 inAddressBook:(void *)a5 withDelegate:(id)a6;
- (void)dealloc;
- (void)runPredicate;
- (void)runPredicateWithDelegate:(id)a3;
- (void)searchQuery:(id)a3 finishedWithError:(id)a4;
- (void)searchQuery:(id)a3 returnedResults:(id)a4;
- (void)setAccountIdentifier:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIncludePhotosInResults:(BOOL)a3;
- (void)setIncludeSourceInResults:(BOOL)a3;
- (void)setSearchString:(id)a3;
- (void)setSource:(void *)a3;
- (void)source;
@end

@implementation ABServerSearchPredicate

- (ABServerSearchPredicate)initWithSearchString:(id)a3 source:(void *)a4 account:(id)a5 includeSourceInResults:(BOOL)a6 includePhotosInResults:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  v15.receiver = self;
  v15.super_class = (Class)ABServerSearchPredicate;
  v12 = [(ABPredicate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(ABServerSearchPredicate *)v12 setSearchString:a3];
    [(ABServerSearchPredicate *)v13 setSource:a4];
    [(ABServerSearchPredicate *)v13 setAccountIdentifier:a5];
    [(ABServerSearchPredicate *)v13 setIncludeSourceInResults:v8];
    [(ABServerSearchPredicate *)v13 setIncludePhotosInResults:v7];
  }
  return v13;
}

- (ABServerSearchPredicate)initWithSearchString:(id)a3 source:(void *)a4 account:(id)a5 includeSourceInResults:(BOOL)a6
{
  return [(ABServerSearchPredicate *)self initWithSearchString:a3 source:a4 account:a5 includeSourceInResults:a6 includePhotosInResults:1];
}

- (ABServerSearchPredicate)initWithSearchString:(id)a3 source:(void *)a4 account:(id)a5
{
  return [(ABServerSearchPredicate *)self initWithSearchString:a3 source:a4 account:a5 includeSourceInResults:0];
}

- (void)dealloc
{
  source = self->_source;
  if (source) {
    CFRelease(source);
  }

  v4.receiver = self;
  v4.super_class = (Class)ABServerSearchPredicate;
  [(ABPredicate *)&v4 dealloc];
}

- (void)setSource:(void *)a3
{
  source = self->_source;
  if (source != a3)
  {
    if (source) {
      CFRelease(source);
    }
    self->_source = (void *)CFRetain(a3);
  }
}

- (void)source
{
  return self->_source;
}

- (int)error
{
  return self->_error;
}

- (void)setConnection:(id)a3
{
  connection = self->_connection;
  if (connection != a3)
  {

    self->_connection = (DADConnection *)a3;
  }
}

- (DADConnection)connection
{
  result = self->_connection;
  if (!result)
  {
    result = (DADConnection *)(id)[MEMORY[0x1E4F5E950] sharedConnection];
    self->_connection = result;
  }
  return result;
}

- (void)runPredicate
{
  if (![(ABServerSearchPredicate *)self delegate]
    || [(ABPredicateDelegate *)[(ABServerSearchPredicate *)self delegate] predicateShouldContinue:self])
  {
    if ([(ABServerSearchPredicate *)self source])
    {
      v3 = [(ABServerSearchPredicate *)self source];
      objc_super v4 = (void *)ABRecordCopyValue(v3, kABSourceExternalIdentifierProperty);
      v5 = [(ABServerSearchPredicate *)self source];
      id v6 = (id)ABRecordCopyValue(v5, kABSourceExternalModificationTagProperty);
    }
    else
    {
      id v6 = 0;
      objc_super v4 = 0;
    }
    self->_doneLock = (NSConditionLock *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    self->_searchQuery = (DAContactsSearchQuery *)(id)objc_msgSend(MEMORY[0x1E4F5E948], "contactsSearchQueryWithSearchString:searchBase:searchScope:consumer:", -[ABServerSearchPredicate searchString](self, "searchString"), v4, v6, self);
    [(DAContactsSearchQuery *)self->_searchQuery setIncludePhotos:[(ABServerSearchPredicate *)self includePhotosInResults]];
    if ([(DADConnection *)[(ABServerSearchPredicate *)self connection] performServerContactsSearch:self->_searchQuery forAccountWithID:[(ABServerSearchPredicate *)self accountIdentifier]])
    {
      [(NSConditionLock *)self->_doneLock lockWhenCondition:1];
      [(NSConditionLock *)self->_doneLock unlock];
    }
    else
    {
      self->_error = [(ABServerSearchPredicate *)self _errorForDAStatusCode:0];
    }
  }
}

- (void)runPredicateWithDelegate:(id)a3
{
  [(ABServerSearchPredicate *)self setDelegate:a3];
  [(ABServerSearchPredicate *)self runPredicate];
}

- (void)ab_runPredicateWithSortOrder:(unsigned int)a3 ranked:(BOOL)a4 inAddressBook:(void *)a5 withDelegate:(id)a6
{
}

- (int)_errorForDAStatusCode:(int64_t)a3
{
  if (a3) {
    int v3 = -2;
  }
  else {
    int v3 = -1;
  }
  if (a3 == 2) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)_searchQueryIsDone
{
  if (![(NSConditionLock *)self->_doneLock condition])
  {
    [(NSConditionLock *)self->_doneLock lockWhenCondition:0];
    doneLock = self->_doneLock;
    [(NSConditionLock *)doneLock unlockWithCondition:1];
  }
}

- (void)searchQuery:(id)a3 returnedResults:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (!self->_searchResults) {
    self->_searchResults = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([(ABServerSearchPredicate *)self includeSourceInResults]) {
          source = self->_source;
        }
        else {
          source = 0;
        }
        v11 = (const void *)[v9 newAddressBookRecordWithSource:source];
        if (v11)
        {
          [(NSMutableArray *)self->_searchResults addObject:v11];
          CFRelease(v11);
          if ([(ABServerSearchPredicate *)self delegate])
          {
            if (([(ABPredicateDelegate *)[(ABServerSearchPredicate *)self delegate] predicateShouldContinue:self afterFindingRecord:v11] & 1) == 0)
            {
              [(DADConnection *)[(ABServerSearchPredicate *)self connection] cancelServerContactsSearch:self->_searchQuery];
              [(ABServerSearchPredicate *)self _searchQueryIsDone];
              goto LABEL_18;
            }
          }
        }
      }
      uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_18:
  objc_sync_exit(self);
}

- (void)searchQuery:(id)a3 finishedWithError:(id)a4
{
  if (a4) {
    uint64_t v5 = objc_msgSend(a4, "code", a3);
  }
  else {
    uint64_t v5 = 2;
  }
  objc_sync_enter(self);
  self->_error = [(ABServerSearchPredicate *)self _errorForDAStatusCode:v5];
  [(ABServerSearchPredicate *)self _searchQueryIsDone];
  objc_sync_exit(self);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (BOOL)includeSourceInResults
{
  return self->_includeSourceInResults;
}

- (void)setIncludeSourceInResults:(BOOL)a3
{
  self->_includeSourceInResults = a3;
}

- (BOOL)includePhotosInResults
{
  return self->_includePhotosInResults;
}

- (void)setIncludePhotosInResults:(BOOL)a3
{
  self->_includePhotosInResults = a3;
}

- (ABPredicateDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ABPredicateDelegate *)a3;
}

@end