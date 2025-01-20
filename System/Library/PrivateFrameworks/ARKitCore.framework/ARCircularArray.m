@interface ARCircularArray
- (ARCircularArray)initWithCapacity:(int64_t)a3;
- (BOOL)containsObject:(id)a3;
- (NSArray)allObjects;
- (id)addObject:(id)a3;
- (id)firstObject;
- (id)lastObject;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6;
@end

@implementation ARCircularArray

- (ARCircularArray)initWithCapacity:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ARCircularArray;
  v4 = [(ARCircularArray *)&v10 init];
  v5 = v4;
  if (v4)
  {
    if (a3 <= 1) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = a3;
    }
    v4->_capacity = v6;
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:");
    objects = v5->_objects;
    v5->_objects = (NSMutableOrderedSet *)v7;
  }
  return v5;
}

- (NSArray)allObjects
{
  v2 = [(NSMutableOrderedSet *)self->_objects array];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)addObject:(id)a3
{
  id v4 = a3;
  if ([(NSMutableOrderedSet *)self->_objects containsObject:v4])
  {
    v5 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableOrderedSet *)self->_objects count];
    objects = self->_objects;
    if (v6 == self->_capacity)
    {
      v5 = [(NSMutableOrderedSet *)objects firstObject];
      [(NSMutableOrderedSet *)self->_objects removeObject:v5];
      objects = self->_objects;
    }
    else
    {
      v5 = 0;
    }
    [(NSMutableOrderedSet *)objects addObject:v4];
  }

  return v5;
}

- (BOOL)containsObject:(id)a3
{
  return [(NSMutableOrderedSet *)self->_objects containsObject:a3];
}

- (unint64_t)count
{
  return [(NSMutableOrderedSet *)self->_objects count];
}

- (id)firstObject
{
  return (id)[(NSMutableOrderedSet *)self->_objects firstObject];
}

- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6
{
  return -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:](self->_objects, "indexOfObject:inSortedRange:options:usingComparator:", a3, a4.location, a4.length, a5, a6);
}

- (id)lastObject
{
  return (id)[(NSMutableOrderedSet *)self->_objects lastObject];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableOrderedSet *)self->_objects objectAtIndex:a3];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)[(NSMutableOrderedSet *)self->_objects objectAtIndexedSubscript:a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableOrderedSet *)self->_objects countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void).cxx_destruct
{
}

@end