@interface CPLRUDictionary
+ (id)dictionaryWithMaximumCapacity:(unint64_t)a3;
- (CPLRUDictionary)initWithMaximumCapacity:(unint64_t)a3;
- (id)allKeys;
- (id)allKeysInLRUOrder;
- (id)allValuesInLRUOrder;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)objectForKeyWithoutAffectingLRU:(id)a3;
- (unint64_t)count;
- (unint64_t)linkedListCount;
- (void)_addNodeToFront:(id)a3;
- (void)_moveNodeToFront:(id)a3;
- (void)_removeNode:(id)a3;
- (void)_removeNodeFromLinkedList:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation CPLRUDictionary

- (void)_removeNodeFromLinkedList:(id)a3
{
  uint64_t v4 = *((void *)a3 + 3);
  uint64_t v3 = *((void *)a3 + 4);
  *(void *)(v3 + 24) = v4;
  *(void *)(v4 + 32) = v3;
}

- (void)_removeNode:(id)a3
{
  -[CPLRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:");
  dictionary = self->_dictionary;
  v6 = (const void *)[a3 key];
  CFDictionaryRemoveValue(dictionary, v6);
}

- (void)_moveNodeToFront:(id)a3
{
  if (self->_head->next != a3)
  {
    -[CPLRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:");
    [(CPLRUDictionary *)self _addNodeToFront:a3];
  }
}

- (void)_addNodeToFront:(id)a3
{
  head = self->_head;
  next = head->next;
  head->next = (CPLRUDictionaryNode *)a3;
  v5 = self->_head;
  *((void *)a3 + 3) = next;
  *((void *)a3 + 4) = v5;
  next->prev = (CPLRUDictionaryNode *)a3;
}

+ (id)dictionaryWithMaximumCapacity:(unint64_t)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMaximumCapacity:a3];
  return v3;
}

- (CPLRUDictionary)initWithMaximumCapacity:(unint64_t)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CPLRUDictionary.m", 117, @"Invalid parameter not satisfying: %@", @"maxCount > 0");
  }
  v8.receiver = self;
  v8.super_class = (Class)CPLRUDictionary;
  v5 = [(CPLRUDictionary *)&v8 init];
  if (v5)
  {
    v5->_dictionary = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v5->_maxCount = a3;
    v5->_head = [[CPLRUDictionaryNode alloc] initWithKey:0 object:0];
    v6 = [[CPLRUDictionaryNode alloc] initWithKey:0 object:0];
    v5->_tail = v6;
    v5->_head->next = v6;
    v5->_tail->prev = v5->_head;
  }
  return v5;
}

- (void)dealloc
{
  CFRelease(self->_dictionary);

  v3.receiver = self;
  v3.super_class = (Class)CPLRUDictionary;
  [(CPLRUDictionary *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>{\n", objc_opt_class(), self];
  for (i = self->_head->next; i != self->_tail; i = i->next)
    objc_msgSend(v3, "appendFormat:", @"\t%@ = %@;\n",
      [(CPLRUDictionaryNode *)i key],
      [(CPLRUDictionaryNode *)i object]);
  [v3 appendString:@"}\n"];
  return v3;
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->_dictionary);
}

- (id)allKeys
{
  return (id)[(__CFDictionary *)self->_dictionary allKeys];
}

- (id)objectForKey:(id)a3
{
  id result = (id)CFDictionaryGetValue(self->_dictionary, a3);
  if (result)
  {
    id v5 = result;
    [(CPLRUDictionary *)self _moveNodeToFront:result];
    return (id)[v5 object];
  }
  return result;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  Value = (void *)CFDictionaryGetValue(self->_dictionary, a4);
  if (Value)
  {
    objc_super v8 = Value;
    [(CPLRUDictionary *)self _moveNodeToFront:Value];
    [v8 setObject:a3];
  }
  else
  {
    if (CFDictionaryGetCount(self->_dictionary) == self->_maxCount) {
      [(CPLRUDictionary *)self _removeNode:self->_tail->prev];
    }
    key = (void *)[a4 copyWithZone:0];
    v9 = [[CPLRUDictionaryNode alloc] initWithKey:key object:a3];
    CFDictionaryAddValue(self->_dictionary, key, v9);
    [(CPLRUDictionary *)self _addNodeToFront:v9];
  }
}

- (void)removeObjectForKey:(id)a3
{
  Value = CFDictionaryGetValue(self->_dictionary, a3);
  if (Value)
  {
    [(CPLRUDictionary *)self _removeNode:Value];
  }
}

- (void)removeAllObjects
{
  self->_head->next = self->_tail;
  self->_tail->prev = self->_head;
}

- (unint64_t)linkedListCount
{
  head = self->_head;
  tail = self->_tail;
  unint64_t result = -1;
  do
  {
    head = head->next;
    ++result;
  }
  while (head != tail);
  return result;
}

- (id)allKeysInLRUOrder
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  for (i = self->_head->next; i != self->_tail; i = i->next)
    objc_msgSend(v3, "addObject:", -[CPLRUDictionaryNode key](i, "key"));
  return v3;
}

- (id)allValuesInLRUOrder
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  for (i = self->_head->next; i != self->_tail; i = i->next)
    objc_msgSend(v3, "addObject:", -[CPLRUDictionaryNode object](i, "object"));
  return v3;
}

- (id)objectForKeyWithoutAffectingLRU:(id)a3
{
  Value = (void *)CFDictionaryGetValue(self->_dictionary, a3);
  return (id)[Value object];
}

@end