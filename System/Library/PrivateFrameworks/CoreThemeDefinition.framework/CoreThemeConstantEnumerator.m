@interface CoreThemeConstantEnumerator
+ (id)enumeratorForGlobalListAtAddress:(void *)a3;
- (CoreThemeConstantEnumerator)initWithGlobalListAtAddress:(void *)a3;
- (id)currentConstantHelper;
- (id)firstConstantHelper;
- (id)lastConstantHelper;
- (id)nextConstantHelper;
- (id)previousConstantHelper;
- (int64_t)constantCount;
- (void)_moveToIndexOfLastEntry;
@end

@implementation CoreThemeConstantEnumerator

- (CoreThemeConstantEnumerator)initWithGlobalListAtAddress:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreThemeConstantEnumerator;
  result = [(CoreThemeConstantEnumerator *)&v5 init];
  result->_globalListPointer = a3;
  result->_listIndex = -1;
  result->_indexOfLastEntry = -1;
  return result;
}

+ (id)enumeratorForGlobalListAtAddress:(void *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithGlobalListAtAddress:a3];

  return v3;
}

- (void)_moveToIndexOfLastEntry
{
  self->_listIndex = -1;
  do
    id v3 = [(CoreThemeConstantEnumerator *)self nextConstantHelper];
  while (v3 && objc_msgSend((id)objc_msgSend(v3, "label"), "length"));
  int64_t v4 = self->_listIndex - 1;
  self->_listIndex = v4;
  self->_indexOfLastEntry = v4;
}

- (int64_t)constantCount
{
  int64_t indexOfLastEntry = self->_indexOfLastEntry;
  if (indexOfLastEntry < 0)
  {
    int64_t listIndex = self->_listIndex;
    [(CoreThemeConstantEnumerator *)self _moveToIndexOfLastEntry];
    self->_int64_t listIndex = listIndex;
    int64_t indexOfLastEntry = self->_indexOfLastEntry;
  }
  return indexOfLastEntry + 1;
}

- (id)currentConstantHelper
{
  return +[CoreThemeConstantHelper helperForStructAtIndex:self->_listIndex inAssociatedGlobalList:self->_globalListPointer];
}

- (id)nextConstantHelper
{
  if (self->_isPastLastEntry) {
    return 0;
  }
  int64_t listIndex = self->_listIndex;
  self->_int64_t listIndex = listIndex + 1;
  if (__PAIR128__(listIndex, self->_globalListPointer) == __PAIR128__(-1, MEMORY[0x263F38488])) {
    self->_int64_t listIndex = 1;
  }
  id v2 = [(CoreThemeConstantEnumerator *)self currentConstantHelper];
  if (!objc_msgSend((id)objc_msgSend(v2, "label"), "length")) {
    self->_isPastLastEntry = 1;
  }
  return v2;
}

- (id)previousConstantHelper
{
  int64_t listIndex = self->_listIndex;
  if (listIndex < 0) {
    return 0;
  }
  self->_int64_t listIndex = listIndex - 1;
  self->_isPastLastEntry = 0;
  return [(CoreThemeConstantEnumerator *)self currentConstantHelper];
}

- (id)firstConstantHelper
{
  self->_int64_t listIndex = 0;
  id v3 = [(CoreThemeConstantEnumerator *)self currentConstantHelper];
  if (!objc_msgSend((id)objc_msgSend(v3, "label"), "length")) {
    self->_isPastLastEntry = 1;
  }
  return v3;
}

- (id)lastConstantHelper
{
  int64_t indexOfLastEntry = self->_indexOfLastEntry;
  if (indexOfLastEntry < 0) {
    [(CoreThemeConstantEnumerator *)self _moveToIndexOfLastEntry];
  }
  else {
    self->_int64_t listIndex = indexOfLastEntry;
  }

  return [(CoreThemeConstantEnumerator *)self currentConstantHelper];
}

@end