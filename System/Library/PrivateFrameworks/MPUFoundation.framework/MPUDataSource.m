@interface MPUDataSource
+ (Class)invalidationContextClass;
- (BOOL)canEditEntityAtIndex:(unint64_t)a3;
- (BOOL)canEditEntityAtIndexPath:(id)a3;
- (BOOL)canSelectEntityAtIndex:(unint64_t)a3;
- (BOOL)entityIsNowPlayingAtIndex:(unint64_t)a3;
- (BOOL)isEmpty;
- (BOOL)isIgnoringInvalidation;
- (BOOL)showsEntityCountFooter;
- (BOOL)showsIndexBar;
- (MPUDataSource)initWithCoder:(id)a3;
- (MPUDataSource)initWithEntityType:(int64_t)a3;
- (NSArray)localizedSectionIndexTitles;
- (NSString)entityCountFormat;
- (_NSRange)rangeOfSectionAtIndex:(unint64_t)a3;
- (id)_indexPathForGlobalIndex:(unint64_t)a3;
- (id)anyEntity;
- (id)entities;
- (id)entityAtIndex:(unint64_t)a3;
- (id)entityAtIndexPath:(id)a3;
- (id)localizedSectionTitleAtIndex:(unint64_t)a3;
- (id)playbackContextForIndex:(unint64_t)a3;
- (id)sectionEntities;
- (id)sectionEntityAtIndex:(unint64_t)a3;
- (int64_t)editingTypeForEntityAtIndex:(unint64_t)a3;
- (int64_t)editingTypeForEntityAtIndexPath:(id)a3;
- (int64_t)entityType;
- (unint64_t)_globalIndexForIndexPath:(id)a3;
- (unint64_t)count;
- (unint64_t)indexOfEntity:(id)a3;
- (unint64_t)indexOfSectionEntity:(id)a3;
- (unint64_t)indexOfSectionForSectionTitleAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_didInvalidateWithContext:(id)a3;
- (void)_willInvalidateWithContext:(id)a3;
- (void)beginIgnoringInvalidation;
- (void)deleteEntityAtIndexPath:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endIgnoringInvalidation;
- (void)invalidate;
- (void)invalidateWithContext:(id)a3;
- (void)preloadEntities;
- (void)preloadSectionEntities;
@end

@implementation MPUDataSource

- (MPUDataSource)initWithEntityType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPUDataSource;
  result = [(MPUDataSource *)&v5 init];
  if (result) {
    result->_entityType = a3;
  }
  return result;
}

- (MPUDataSource)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"entityType"];

  return [(MPUDataSource *)self initWithEntityType:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (id)anyEntity
{
  v3 = [(MPUDataSource *)self entities];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    objc_super v5 = [(MPUDataSource *)self entities];
    v6 = [v5 firstObject];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canSelectEntityAtIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)canEditEntityAtIndexPath:(id)a3
{
  unint64_t v4 = [(MPUDataSource *)self _globalIndexForIndexPath:a3];

  return [(MPUDataSource *)self canEditEntityAtIndex:v4];
}

- (unint64_t)count
{
  v2 = [(MPUDataSource *)self entities];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)deleteEntityAtIndexPath:(id)a3
{
  unint64_t v4 = [(MPUDataSource *)self _globalIndexForIndexPath:a3];

  [(MPUDataSource *)self deleteEntityAtIndex:v4];
}

- (BOOL)canEditEntityAtIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)editingTypeForEntityAtIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)editingTypeForEntityAtIndexPath:(id)a3
{
  unint64_t v4 = [(MPUDataSource *)self _globalIndexForIndexPath:a3];

  return [(MPUDataSource *)self editingTypeForEntityAtIndex:v4];
}

- (id)entities
{
  return 0;
}

- (id)entityAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(MPUDataSource *)self entities];
  objc_super v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)entityAtIndexPath:(id)a3
{
  unint64_t v4 = [(MPUDataSource *)self _globalIndexForIndexPath:a3];

  return [(MPUDataSource *)self entityAtIndex:v4];
}

- (NSString)entityCountFormat
{
  return 0;
}

- (BOOL)entityIsNowPlayingAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)indexOfEntity:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MPUDataSource *)self entities];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (unint64_t)indexOfSectionForSectionTitleAtIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)isEmpty
{
  v2 = [(MPUDataSource *)self entities];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isIgnoringInvalidation
{
  return self->_invalidationIgnoreCount > 0;
}

- (void)beginIgnoringInvalidation
{
}

- (void)endIgnoringInvalidation
{
  int64_t invalidationIgnoreCount = self->_invalidationIgnoreCount;
  if (!invalidationIgnoreCount || (int64_t v3 = invalidationIgnoreCount - 1, (self->_invalidationIgnoreCount = v3) == 0))
  {
    if (self->_numberOfIgnoredInvalidations)
    {
      self->_numberOfIgnoredInvalidations = 0;
      [(MPUDataSource *)self invalidate];
    }
  }
}

- (void)invalidate
{
}

- (void)invalidateWithContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_invalidationIgnoreCount)
  {
    ++self->_numberOfIgnoredInvalidations;
  }
  else
  {
    if (!v4)
    {
      id v6 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
      [v6 setInvalidateEverything:1];
      [v6 setInvalidateDataSourceCounts:1];
      id v5 = v6;
    }
    v7 = v5;
    [(MPUDataSource *)self _willInvalidateWithContext:v5];
    if (([v7 invalidateDataSourceCounts] & 1) != 0
      || [v7 invalidateEverything])
    {
      [(MPUDataSource *)self _invalidateCalculatedEntities];
    }
    id v4 = (id)[(MPUDataSource *)self _didInvalidateWithContext:v7];
    id v5 = v7;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (NSArray)localizedSectionIndexTitles
{
  return 0;
}

- (id)localizedSectionTitleAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)numberOfSections
{
  if (![(MPUDataSource *)self usesSections]) {
    return [(MPUDataSource *)self count] != 0;
  }
  int64_t v3 = [(MPUDataSource *)self sectionEntities];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)playbackContextForIndex:(unint64_t)a3
{
  return 0;
}

- (void)preloadEntities
{
  id v2 = [(MPUDataSource *)self entities];
}

- (void)preloadSectionEntities
{
  id v2 = [(MPUDataSource *)self sectionEntities];
}

- (_NSRange)rangeOfSectionAtIndex:(unint64_t)a3
{
  NSUInteger v3 = 0;
  NSUInteger v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)sectionEntityAtIndex:(unint64_t)a3
{
  id v5 = [(MPUDataSource *)self sectionEntities];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    v7 = [(MPUDataSource *)self sectionEntities];
    v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (unint64_t)indexOfSectionEntity:(id)a3
{
  id v4 = a3;
  id v5 = [(MPUDataSource *)self sectionEntities];
  if ([v5 count])
  {
    unint64_t v6 = [(MPUDataSource *)self sectionEntities];
    unint64_t v7 = [v6 indexOfObject:v4];
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)sectionEntities
{
  return 0;
}

- (BOOL)showsEntityCountFooter
{
  return 0;
}

- (BOOL)showsIndexBar
{
  return 0;
}

- (void)_didInvalidateWithContext:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  unint64_t v6 = [v4 defaultCenter];
  v8 = @"MPUDataSourceInvalidationContextUserInfoKey";
  v9[0] = v5;
  unint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"MPUDataSourceDidInvalidateNotification" object:self userInfo:v7];
}

- (unint64_t)_globalIndexForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  if (v5 >= [(MPUDataSource *)self numberOfSections])
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (v5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      do
      {
        [(MPUDataSource *)self rangeOfSectionAtIndex:v6];
        v7 += v8;
        ++v6;
      }
      while (v5 != v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v10 = [(MPUDataSource *)self rangeOfSectionAtIndex:v5];
    unint64_t v12 = v11;
    unint64_t v13 = [v4 row];
    if (v13 >= v12 || v10 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v13 + v7;
    }
  }

  return v9;
}

- (id)_indexPathForGlobalIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(MPUDataSource *)self numberOfSections];
    if (v4)
    {
      uint64_t v8 = v4;
      uint64_t v9 = 0;
      while (1)
      {
        unint64_t v10 = [(MPUDataSource *)self rangeOfSectionAtIndex:v9];
        if (a3 >= v10 && a3 - v10 < v11) {
          break;
        }
        if (v8 == (void *)++v9)
        {
          id v4 = 0;
          goto LABEL_12;
        }
      }
      id v4 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:");
    }
LABEL_12:
  }
  return v4;
}

- (void)_willInvalidateWithContext:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  uint64_t v8 = @"MPUDataSourceInvalidationContextUserInfoKey";
  v9[0] = v5;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"MPUDataSourceWillInvalidateNotification" object:self userInfo:v7];
}

- (int64_t)entityType
{
  return self->_entityType;
}

@end