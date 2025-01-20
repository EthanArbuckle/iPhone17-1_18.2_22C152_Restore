@interface NSOrderedCollectionChange
+ (NSOrderedCollectionChange)changeWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index;
+ (NSOrderedCollectionChange)changeWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index associatedIndex:(NSUInteger)associatedIndex;
- (BOOL)isEqual:(id)a3;
- (NSCollectionChangeType)changeType;
- (NSOrderedCollectionChange)initWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index;
- (NSOrderedCollectionChange)initWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index associatedIndex:(NSUInteger)associatedIndex;
- (NSUInteger)associatedIndex;
- (NSUInteger)index;
- (id)debugDescription;
- (id)init;
- (id)object;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSOrderedCollectionChange

- (id)object
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSCollectionChangeType)changeType
{
  return self->_changeType;
}

- (NSUInteger)index
{
  return self->_index;
}

- (NSUInteger)associatedIndex
{
  return self->_associatedIndex;
}

+ (NSOrderedCollectionChange)changeWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index
{
  v5 = (void *)[objc_alloc((Class)a1) initWithObject:anObject type:type index:index];

  return (NSOrderedCollectionChange *)v5;
}

+ (NSOrderedCollectionChange)changeWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index associatedIndex:(NSUInteger)associatedIndex
{
  v6 = (void *)[objc_alloc((Class)a1) initWithObject:anObject type:type index:index associatedIndex:associatedIndex];

  return (NSOrderedCollectionChange *)v6;
}

- (NSOrderedCollectionChange)initWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index associatedIndex:(NSUInteger)associatedIndex
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NSOrderedCollectionChange;
  v10 = [(NSOrderedCollectionChange *)&v15 init];
  v11 = v10;
  if (v10)
  {
    if ((unint64_t)type >= 2)
    {

      v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = *MEMORY[0x1E4F1C3C8];
      v16 = @"type";
      v17[0] = +[NSNumber numberWithInteger:type];
      objc_exception_throw((id)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, @"Invalid type for change", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1)));
    }
    v10->_object = anObject;
    v11->_changeType = type;
    v11->_index = index;
    v11->_associatedIndex = associatedIndex;
  }
  return v11;
}

- (NSOrderedCollectionChange)initWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index
{
  return [(NSOrderedCollectionChange *)self initWithObject:anObject type:type index:index associatedIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSOrderedCollectionChange;
  [(NSOrderedCollectionChange *)&v3 dealloc];
}

- (id)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  Name = sel_getName(a2);
  v6 = (void *)[v3 initWithName:v4, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unavailable method %s called on class %@", Name, objc_opt_class()), 0 reason userInfo];
  objc_exception_throw(v6);
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int64_t changeType = self->_changeType;
  if (self->_object)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = +[NSString stringWithFormat:@"of object <%@: %p> ", NSStringFromClass(v6), self->_object];
  }
  else
  {
    v7 = (NSString *)&stru_1ECA5C228;
  }
  unint64_t index = self->_index;
  if (self->_associatedIndex == 0x7FFFFFFFFFFFFFFFLL) {
    v9 = (NSString *)&stru_1ECA5C228;
  }
  else {
    v9 = +[NSString stringWithFormat:@" associated with index %lu", self->_associatedIndex];
  }
  v10 = @"insertion";
  if (changeType == 1) {
    v10 = @"removal";
  }
  return +[NSString stringWithFormat:@"<%@: %p>(%@ %@at index %lu%@)", v4, self, v10, v7, index, v9];
}

- (unint64_t)hash
{
  return self->_index ^ (self->_associatedIndex << 8) ^ (self->_changeType << 31);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id object = self->_object;
  if (object == *((id *)a3 + 1) || (int v6 = objc_msgSend(object, "isEqual:")) != 0)
  {
    if (self->_changeType == *((void *)a3 + 2) && self->_index == *((void *)a3 + 3))
    {
      LOBYTE(v6) = self->_associatedIndex == *((void *)a3 + 4);
      return v6;
    }
LABEL_8:
    LOBYTE(v6) = 0;
  }
  return v6;
}

@end