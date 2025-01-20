@interface GEOSortPriorityMappingEntry
- (GEOSortPriorityMappingEntry)init;
- (GEOSortPriorityMappingEntry)initWithPriority:(int64_t)a3 resultType:(int64_t)a4 resultSubtype:(int64_t)a5;
- (int64_t)priority;
- (int64_t)resultSubtype;
- (int64_t)resultType;
@end

@implementation GEOSortPriorityMappingEntry

- (GEOSortPriorityMappingEntry)init
{
  result = (GEOSortPriorityMappingEntry *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSortPriorityMappingEntry)initWithPriority:(int64_t)a3 resultType:(int64_t)a4 resultSubtype:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)GEOSortPriorityMappingEntry;
  result = [(GEOSortPriorityMappingEntry *)&v9 init];
  if (result)
  {
    result->_priority = a3;
    result->_resultType = a4;
    result->_resultSubtype = a5;
  }
  return result;
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (int64_t)resultSubtype
{
  return self->_resultSubtype;
}

@end