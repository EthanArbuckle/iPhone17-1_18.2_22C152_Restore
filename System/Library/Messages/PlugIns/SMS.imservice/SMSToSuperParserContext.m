@interface SMSToSuperParserContext
- (NSArray)orderedParts;
- (id)name;
- (void)_addPart:(id)a3;
- (void)dealloc;
@end

@implementation SMSToSuperParserContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SMSToSuperParserContext;
  [(SMSToSuperParserContext *)&v3 dealloc];
}

- (id)name
{
  return @"SMSToSuper";
}

- (void)_addPart:(id)a3
{
  if (a3)
  {
    orderedParts = self->_orderedParts;
    if (!orderedParts)
    {
      orderedParts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->_orderedParts = orderedParts;
    }
    [(NSMutableArray *)orderedParts addObject:a3];
  }
}

- (NSArray)orderedParts
{
  return &self->_orderedParts->super;
}

@end