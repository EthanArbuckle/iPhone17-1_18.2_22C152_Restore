@interface _NSOrderedCollectionDifferenceMoves
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _NSOrderedCollectionDifferenceMoves

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSOrderedCollectionDifferenceMoves;
  [(_NSOrderedCollectionDifferenceMoves *)&v3 dealloc];
}

- (unint64_t)hash
{
  unint64_t result = [(NSMutableDictionary *)self->_removeDict count];
  if (result)
  {
    uint64_t v4 = (void *)[(NSMutableDictionary *)self->_removeDict objectForKeyedSubscript:+[NSNumber numberWithUnsignedInteger:self->_firstRemove]];
    return [v4 hash];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ![(NSMutableDictionary *)self->_removeDict isEqual:*((void *)a3 + 1)])
  {
    return 0;
  }
  insertDict = self->_insertDict;
  uint64_t v6 = *((void *)a3 + 2);

  return [(NSMutableDictionary *)insertDict isEqual:v6];
}

@end