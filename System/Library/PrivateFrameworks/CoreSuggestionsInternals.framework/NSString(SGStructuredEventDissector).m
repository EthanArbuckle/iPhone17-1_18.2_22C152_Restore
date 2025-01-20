@interface NSString(SGStructuredEventDissector)
- (BOOL)sg_isEmptySchemaObject;
@end

@implementation NSString(SGStructuredEventDissector)

- (BOOL)sg_isEmptySchemaObject
{
  return [a1 length] == 0;
}

@end