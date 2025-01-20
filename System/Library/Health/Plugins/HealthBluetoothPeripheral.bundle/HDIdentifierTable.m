@interface HDIdentifierTable
- (id)allObjects;
- (id)objectWithIdentifier:(unint64_t)a3;
- (unint64_t)addObject:(id)a3;
- (unint64_t)count;
- (void)removeAllObjects;
- (void)removeObjectWithIdentifier:(unint64_t)a3;
@end

@implementation HDIdentifierTable

- (unint64_t)count
{
  return [(NSMapTable *)self->_map count];
}

- (unint64_t)addObject:(id)a3
{
  id v4 = a3;
  if (!v4) {
    +[NSException raise:NSInvalidArgumentException format:@"object cannot be nil"];
  }
  if (!self->_map)
  {
    long long v5 = *(_OWORD *)&NSIntegerMapKeyCallBacks.retain;
    *(_OWORD *)&keyCallBacks.hash = *(_OWORD *)&NSIntegerMapKeyCallBacks.hash;
    *(_OWORD *)&keyCallBacks.retain = v5;
    *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)&NSIntegerMapKeyCallBacks.describe;
    NSMapTableValueCallBacks v13 = NSObjectMapValueCallBacks;
    v6 = NSCreateMapTable(&keyCallBacks, &v13, 0);
    map = self->_map;
    self->_map = v6;
  }
  do
  {
    v8 = self->_map;
    unint64_t nextIdentifier = self->_nextIdentifier;
    if (nextIdentifier + 1 > 1) {
      v10 = (const void *)(nextIdentifier + 1);
    }
    else {
      v10 = &dword_0 + 1;
    }
    self->_unint64_t nextIdentifier = (unint64_t)v10;
  }
  while (NSMapGet(v8, v10));
  NSMapInsert(self->_map, (const void *)self->_nextIdentifier, v4);
  unint64_t v11 = self->_nextIdentifier;

  return v11;
}

- (id)objectWithIdentifier:(unint64_t)a3
{
  if (a3)
  {
    id v4 = NSMapGet(self->_map, (const void *)a3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)removeObjectWithIdentifier:(unint64_t)a3
{
}

- (void)removeAllObjects
{
}

- (id)allObjects
{
  return NSAllMapTableValues(self->_map);
}

- (void).cxx_destruct
{
}

@end