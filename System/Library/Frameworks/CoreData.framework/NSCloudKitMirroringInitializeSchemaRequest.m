@interface NSCloudKitMirroringInitializeSchemaRequest
- (unint64_t)schemaInitializationOptions;
- (void)setSchemaInitializationOptions:(unint64_t)a3;
@end

@implementation NSCloudKitMirroringInitializeSchemaRequest

- (unint64_t)schemaInitializationOptions
{
  return self->_schemaInitializationOptions;
}

- (void)setSchemaInitializationOptions:(unint64_t)a3
{
  self->_schemaInitializationOptions = a3;
}

@end