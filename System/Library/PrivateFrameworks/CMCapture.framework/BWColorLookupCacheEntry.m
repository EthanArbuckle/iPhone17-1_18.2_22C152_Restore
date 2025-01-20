@interface BWColorLookupCacheEntry
- (BWColorLookupCacheEntry)initWithForegroundColorLookupTable:(id)a3 backgroundColorLookupTable:(id)a4;
- (NSData)backgroundColorLookupTable;
- (NSData)foregroundColorLookupTable;
- (void)dealloc;
@end

@implementation BWColorLookupCacheEntry

- (NSData)foregroundColorLookupTable
{
  return self->_foregroundColorLookupTable;
}

- (BWColorLookupCacheEntry)initWithForegroundColorLookupTable:(id)a3 backgroundColorLookupTable:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWColorLookupCacheEntry;
  v6 = [(BWColorLookupCacheEntry *)&v8 init];
  if (v6)
  {
    v6->_foregroundColorLookupTable = (NSData *)a3;
    v6->_backgroundColorLookupTable = (NSData *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWColorLookupCacheEntry;
  [(BWColorLookupCacheEntry *)&v3 dealloc];
}

- (NSData)backgroundColorLookupTable
{
  return self->_backgroundColorLookupTable;
}

@end