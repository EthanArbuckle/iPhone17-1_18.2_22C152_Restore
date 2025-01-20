@interface _NSFaultingMutableArray
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)isFault;
- (Class)classForCoder;
- (NSManagedObject)source;
- (NSPropertyDescription)relationship;
- (_NSFaultingMutableArray)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)turnIntoFault;
- (void)willRead;
@end

@implementation _NSFaultingMutableArray

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (_NSFaultingMutableArray)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5
{
  BOOL v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_NSFaultingMutableArray;
  v8 = [(_NSFaultingMutableArray *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_source = (NSManagedObject *)a3;
    v8->_relationship = (NSPropertyDescription *)a4;
    if (v5)
    {
      v10 = 0;
      v9->_flags = (_NSFaultingMutableArrayFlags)1;
    }
    else
    {
      v8->_flags = 0;
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    v9->_realArray = v10;
  }
  return v9;
}

- (void)dealloc
{
  self->_realArray = 0;
  self->_source = 0;
  self->_relationship = 0;

  _PFDeallocateObject(self);
}

- (BOOL)isFault
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)willRead
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a2);
  }
  if (*(unsigned char *)&self->_flags)
  {
    v3 = [(NSManagedObject *)self->_source managedObjectContext];
    source = self->_source;
    if (source) {
      uint64_t v5 = _insertion_fault_handler;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = (NSMutableArray *)-[NSFaultHandler retainedFulfillAggregateFaultForObject:andRelationship:withContext:](v5, source, self->_relationship, (uint64_t)v3);
    self->_realArray = v6;
    if (!v6) {
      self->_realArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    *(_DWORD *)&self->_flags &= ~1u;
  }
}

- (void)turnIntoFault
{
  self->_realArray = 0;
  *(_DWORD *)&self->_flags |= 1u;
}

- (NSManagedObject)source
{
  return self->_source;
}

- (NSPropertyDescription)relationship
{
  return self->_relationship;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSFaultingMutableArrayFlags flags = self->_flags;
  uint64_t v5 = [_NSFaultingMutableArray alloc];
  source = self->_source;
  relationship = self->_relationship;
  if (*(unsigned char *)&flags)
  {
    return [(_NSFaultingMutableArray *)v5 initWithSource:source forRelationship:relationship asFault:1];
  }
  else
  {
    v8 = [(_NSFaultingMutableArray *)v5 initWithSource:source forRelationship:relationship asFault:0];
    [v8[2] setArray:self->_realArray];
    return v8;
  }
}

- (id)description
{
  source = self->_source;
  if (*(unsigned char *)&self->_flags) {
    return (id)[NSString stringWithFormat:@"Relationship fault for %@ on %p", self->_relationship, source, v4];
  }
  else {
    return (id)[NSString stringWithFormat:@"Relationship objects for %@ on %p: %@", self->_relationship, source, -[NSMutableArray description](self->_realArray, "description")];
  }
}

- (id)descriptionWithLocale:(id)a3
{
  source = self->_source;
  if (*(unsigned char *)&self->_flags) {
    return (id)[NSString stringWithFormat:@"Relationship fault for %@ on %p", self->_relationship, source, v5];
  }
  else {
    return (id)[NSString stringWithFormat:@"Relationship objects for %@ on %p: %@", self->_relationship, source, -[NSMutableArray descriptionWithLocale:](self->_realArray, "descriptionWithLocale:", a3)];
  }
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  source = self->_source;
  if (*(unsigned char *)&self->_flags) {
    return (id)[NSString stringWithFormat:@"Relationship fault for %@ on %p", self->_relationship, source, v6];
  }
  else {
    return (id)[NSString stringWithFormat:@"Relationship objects for %@ on %p: %@", self->_relationship, source, -[NSMutableArray descriptionWithLocale:indent:](self->_realArray, "descriptionWithLocale:indent:", a3, a4)];
  }
}

- (unint64_t)count
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  return [(NSMutableArray *)realArray count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  return (id)[(NSMutableArray *)realArray objectAtIndex:a3];
}

- (void)addObject:(id)a3
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  [(NSMutableArray *)realArray addObject:a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  return [(NSMutableArray *)realArray countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  [(NSMutableArray *)realArray enumerateObjectsWithOptions:a3 usingBlock:a4];
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  [(NSMutableArray *)realArray enumerateObjectsAtIndexes:a3 options:a4 usingBlock:a5];
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  return [(NSMutableArray *)realArray indexOfObjectWithOptions:a3 passingTest:a4];
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  return [(NSMutableArray *)realArray indexOfObjectAtIndexes:a3 options:a4 passingTest:a5];
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  return (id)[(NSMutableArray *)realArray indexesOfObjectsWithOptions:a3 passingTest:a4];
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  return (id)[(NSMutableArray *)realArray indexesOfObjectsAtIndexes:a3 options:a4 passingTest:a5];
}

- (id)objectEnumerator
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  return (id)[(NSMutableArray *)realArray objectEnumerator];
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  [(NSMutableArray *)realArray insertObject:a3 atIndex:a4];
}

- (void)removeLastObject
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  [(NSMutableArray *)realArray removeLastObject];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  [(NSMutableArray *)realArray removeObjectAtIndex:a3];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  [(NSMutableArray *)realArray replaceObjectAtIndex:a3 withObject:a4];
}

- (void)getObjects:(id *)a3
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  [(NSMutableArray *)realArray getObjects:a3];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  [(NSMutableArray *)realArray setValue:a3 forKey:a4];
}

- (id)valueForKey:(id)a3
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  return (id)[(NSMutableArray *)realArray valueForKey:a3];
}

- (id)valueForKeyPath:(id)a3
{
  [(_NSFaultingMutableArray *)self willRead];
  realArray = self->_realArray;

  return (id)[(NSMutableArray *)realArray valueForKeyPath:a3];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end