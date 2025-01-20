@interface ABSearchOperation
+ (id)personPredicateWithAnyValueForProperty:(int)a3 addressBook:(void *)a4;
+ (id)personPredicateWithGroup:(void *)a3 addressBook:(void *)a4;
+ (id)personPredicateWithName:(id)a3 addressBook:(void *)a4;
+ (id)personPredicateWithNameLike:(id)a3 addressBook:(void *)a4;
+ (id)personPredicateWithNameLike:(id)a3 inAccount:(id)a4 addressBook:(void *)a5;
+ (id)personPredicateWithNameLike:(id)a3 inGroup:(void *)a4 addressBook:(void *)a5;
+ (id)personPredicateWithNameLike:(id)a3 inGroups:(id)a4 sources:(id)a5 addressBook:(void *)a6;
+ (id)personPredicateWithNameLike:(id)a3 inSource:(void *)a4 addressBook:(void *)a5;
+ (id)personPredicateWithNameLike:(id)a3 inSource:(void *)a4 includeSourceInResults:(BOOL)a5 addressBook:(void *)a6;
+ (id)personPredicateWithNameLike:(id)a3 inSource:(void *)a4 includeSourceInResults:(BOOL)a5 includePhotosInResults:(BOOL)a6 addressBook:(void *)a7;
+ (id)personPredicateWithNameOnly:(id)a3 inAccount:(id)a4 addressBook:(void *)a5;
+ (id)personPredicateWithPhoneLike:(id)a3 countryHint:(id)a4 addressBook:(void *)a5;
+ (id)personPredicateWithValue:(id)a3 comparison:(int64_t)a4 forProperty:(int)a5 addressBook:(void *)a6;
- (ABSearchOperationDelegate)delegate;
- (BOOL)isConcurrent;
- (BOOL)predicateShouldContinue:(id)a3;
- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4;
- (NSArray)prefetchProperties;
- (NSPredicate)predicate;
- (id)progressBlock;
- (unsigned)sortOrdering;
- (void)_mainThread_tellDelegateSearchFoundMatch:(void *)a3;
- (void)addressBook;
- (void)cancel;
- (void)context;
- (void)dealloc;
- (void)internalSearchAddressBook;
- (void)main;
- (void)setAddressBook:(void *)a3;
- (void)setContext:(void *)a3;
- (void)setDelegate:(id)a3;
- (void)setInternalSearchAddressBook:(void *)a3;
- (void)setPredicate:(id)a3;
- (void)setPrefetchProperties:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setSortOrdering:(unsigned int)a3;
@end

@implementation ABSearchOperation

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  internalSearchAddressBook = self->_internalSearchAddressBook;
  if (internalSearchAddressBook) {
    CFRelease(internalSearchAddressBook);
  }

  v5.receiver = self;
  v5.super_class = (Class)ABSearchOperation;
  [(ABSearchOperation *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  if (a3) {
    [(ABSearchOperation *)self setProgressBlock:0];
  }
  self->_delegate = (ABSearchOperationDelegate *)a3;
}

- (BOOL)isConcurrent
{
  v3 = [(ABSearchOperation *)self addressBook];
  return v3 != [(ABSearchOperation *)self internalSearchAddressBook];
}

- (void)setProgressBlock:(id)a3
{
  if (a3) {
    [(ABSearchOperation *)self setDelegate:0];
  }
  id progressBlock = self->_progressBlock;
  if (progressBlock != a3)
  {

    self->_id progressBlock = (id)[a3 copy];
    self->_progressBlockThread = (NSThread *)(id)[MEMORY[0x1E4F29060] currentThread];
  }
}

- (void)setAddressBook:(void *)a3
{
  addressBook = self->_addressBook;
  if (addressBook != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      addressBook = self->_addressBook;
    }
    if (addressBook) {
      CFRelease(addressBook);
    }
    self->_addressBook = a3;
  }
}

- (void)addressBook
{
  return self->_addressBook;
}

- (void)internalSearchAddressBook
{
  if (!self->_internalSearchAddressBook && [(ABSearchOperation *)self addressBook])
  {
    CFTypeRef v4 = ABAddressBookCopyDatabaseDirectory((uint64_t)[(ABSearchOperation *)self addressBook]);
    if (v4)
    {
      objc_super v5 = v4;
      self->_internalSearchAddressBook = (void *)ABAddressBookCreateWithDatabaseDirectory((uint64_t)v4);
      CFRelease(v5);
    }
    else
    {
      self->_internalSearchAddressBook = (void *)CFRetain(self->_addressBook);
    }
  }
  return self->_internalSearchAddressBook;
}

- (void)setInternalSearchAddressBook:(void *)a3
{
  internalSearchAddressBook = self->_internalSearchAddressBook;
  if (internalSearchAddressBook != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      internalSearchAddressBook = self->_internalSearchAddressBook;
    }
    if (internalSearchAddressBook) {
      CFRelease(internalSearchAddressBook);
    }
    self->_internalSearchAddressBook = a3;
  }
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)ABSearchOperation;
  [(ABSearchOperation *)&v5 cancel];
  if ([(ABSearchOperation *)self internalSearchAddressBook])
  {
    [(ABSearchOperation *)self internalSearchAddressBook];
    CPRecordStoreGetDatabase();
    uint64_t v3 = CPSqliteDatabaseConnectionForReading();
    if (v3)
    {
      CFTypeRef v4 = *(sqlite3 **)(v3 + 8);
      if (v4) {
        sqlite3_interrupt(v4);
      }
    }
  }
}

- (void)main
{
  if (([(ABSearchOperation *)self isCancelled] & 1) == 0)
  {
    +[ABPredicate searchPeopleWithPredicate:[(ABSearchOperation *)self predicate] sortOrder:[(ABSearchOperation *)self sortOrdering] inAddressBook:[(ABSearchOperation *)self internalSearchAddressBook] withDelegate:self];
    if (([(ABSearchOperation *)self isCancelled] & 1) == 0)
    {
      if ([(ABSearchOperation *)self delegate])
      {
        uint64_t v3 = (void *)[MEMORY[0x1E4F5A4E8] mainThreadScheduler];
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = __25__ABSearchOperation_main__block_invoke;
        v5[3] = &unk_1E5989000;
        v5[4] = self;
        [v3 performBlock:v5];
      }
      else
      {
        CFTypeRef v4 = *(void (**)(void))([(ABSearchOperation *)self progressBlock] + 16);
        v4();
      }
    }
  }
}

uint64_t __25__ABSearchOperation_main__block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 searchOperation:v3 didFindMatches:0 moreComing:0];
}

- (BOOL)predicateShouldContinue:(id)a3
{
  return [(ABSearchOperation *)self isCancelled] ^ 1;
}

- (void)_mainThread_tellDelegateSearchFoundMatch:(void *)a3
{
  if (([(ABSearchOperation *)self isCancelled] & 1) == 0)
  {
    ABRecordID RecordID = ABRecordGetRecordID(a3);
    PersonWithABRecordID RecordID = a3;
    if (RecordID != -1)
    {
      ABRecordID v7 = RecordID;
      ABAddressBookAddRecord([(ABSearchOperation *)self addressBook], a3, 0);
      PersonWithABRecordID RecordID = (void *)ABAddressBookGetPersonWithRecordID([(ABSearchOperation *)self addressBook], v7);
    }
    if (PersonWithRecordID)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
      if ([(ABSearchOperation *)self delegate])
      {
        [(ABSearchOperationDelegate *)[(ABSearchOperation *)self delegate] searchOperation:self didFindMatches:v8 moreComing:1];
      }
      else if ([(ABSearchOperation *)self progressBlock])
      {
        v9 = [(ABSearchOperation *)self progressBlock];
        v9[2](v9, self, v8, 1);
      }
    }
  }
  if (a3)
  {
    CFRelease(a3);
  }
}

- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4
{
  v6 = [(ABSearchOperation *)self internalSearchAddressBook];
  ABRecordID v7 = [(ABSearchOperation *)self addressBook];
  if (v6 == v7) {
    uint64_t v8 = (uint64_t)CFRetain(a4);
  }
  else {
    uint64_t v8 = ABPersonCopy((uint64_t)a4);
  }
  v9 = (const void *)v8;
  if ([(ABSearchOperation *)self isCancelled])
  {
    CFRelease(v9);
  }
  else
  {
    int v10 = [MEMORY[0x1E4F29060] isMainThread];
    if (v6 == v7 || v10)
    {
      [(ABSearchOperation *)self _mainThread_tellDelegateSearchFoundMatch:v9];
    }
    else
    {
      progressBlockThread = self->_progressBlockThread;
      if (progressBlockThread) {
        -[ABSearchOperation performSelector:onThread:withObject:waitUntilDone:modes:](self, "performSelector:onThread:withObject:waitUntilDone:modes:", sel__mainThread_tellDelegateSearchFoundMatch_, progressBlockThread, v9, 1, [MEMORY[0x1E4F1C978] arrayWithObject:kABSearchOperationRunloopMode]);
      }
      else {
        [(ABSearchOperation *)self performSelectorOnMainThread:sel__mainThread_tellDelegateSearchFoundMatch_ withObject:v9 waitUntilDone:0];
      }
    }
  }
  return [(ABSearchOperation *)self isCancelled] ^ 1;
}

+ (id)personPredicateWithName:(id)a3 addressBook:(void *)a4
{
  return +[ABPredicate personPredicateWithName:a3 addressBook:a4];
}

+ (id)personPredicateWithNameLike:(id)a3 addressBook:(void *)a4
{
  return +[ABPredicate personPredicateWithNameLike:a3 group:0 source:0 account:0 includeSourceInResults:0 addressBook:a4];
}

+ (id)personPredicateWithNameLike:(id)a3 inGroup:(void *)a4 addressBook:(void *)a5
{
  return +[ABPredicate personPredicateWithNameLike:a3 group:a4 source:0 account:0 includeSourceInResults:0 addressBook:a5];
}

+ (id)personPredicateWithNameLike:(id)a3 inSource:(void *)a4 addressBook:(void *)a5
{
  return +[ABPredicate personPredicateWithNameLike:a3 group:0 source:a4 account:0 includeSourceInResults:0 addressBook:a5];
}

+ (id)personPredicateWithNameLike:(id)a3 inSource:(void *)a4 includeSourceInResults:(BOOL)a5 addressBook:(void *)a6
{
  return +[ABPredicate personPredicateWithNameLike:a3 group:0 source:a4 account:0 includeSourceInResults:a5 addressBook:a6];
}

+ (id)personPredicateWithNameLike:(id)a3 inSource:(void *)a4 includeSourceInResults:(BOOL)a5 includePhotosInResults:(BOOL)a6 addressBook:(void *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  if (a4) {
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObject:a4];
  }
  else {
    uint64_t v11 = 0;
  }
  return +[ABPredicate personPredicateWithNameLike:a3 groups:0 sources:v11 includeSourceInResults:v9 includePhotosInResults:v8 addressBook:a7];
}

+ (id)personPredicateWithNameLike:(id)a3 inAccount:(id)a4 addressBook:(void *)a5
{
  return +[ABPredicate personPredicateWithNameLike:a3 group:0 source:0 account:a4 includeSourceInResults:0 addressBook:a5];
}

+ (id)personPredicateWithNameLike:(id)a3 inGroups:(id)a4 sources:(id)a5 addressBook:(void *)a6
{
  return +[ABPredicate personPredicateWithNameLike:a3 groups:a4 sources:a5 addressBook:a6];
}

+ (id)personPredicateWithPhoneLike:(id)a3 countryHint:(id)a4 addressBook:(void *)a5
{
  return +[ABPredicate personPredicateWithPhoneLike:a3 countryHint:a4 addressBook:a5];
}

+ (id)personPredicateWithNameOnly:(id)a3 inAccount:(id)a4 addressBook:(void *)a5
{
  return +[ABPredicate personPredicateWithNameOnly:a3 account:a4 addressBook:a5];
}

+ (id)personPredicateWithValue:(id)a3 comparison:(int64_t)a4 forProperty:(int)a5 addressBook:(void *)a6
{
  return +[ABPredicate personPredicateWithValue:comparison:forProperty:](ABPredicate, "personPredicateWithValue:comparison:forProperty:", a3, a4, *(void *)&a5, a6);
}

+ (id)personPredicateWithAnyValueForProperty:(int)a3 addressBook:(void *)a4
{
  return +[ABPredicate personPredicateWithAnyValueForProperty:](ABPredicate, "personPredicateWithAnyValueForProperty:", *(void *)&a3, a4);
}

+ (id)personPredicateWithGroup:(void *)a3 addressBook:(void *)a4
{
  return +[ABPredicate personPredicateWithGroup:a3 source:0 account:0];
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSArray)prefetchProperties
{
  return self->_prefetchProperties;
}

- (void)setPrefetchProperties:(id)a3
{
}

- (ABSearchOperationDelegate)delegate
{
  return self->_delegate;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (unsigned)sortOrdering
{
  return self->_sortOrdering;
}

- (void)setSortOrdering:(unsigned int)a3
{
  self->_sortOrdering = a3;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

@end