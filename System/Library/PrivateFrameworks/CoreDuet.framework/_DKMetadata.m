@interface _DKMetadata
+ (id)keyPathForMetadataKey:(id)a3;
@end

@implementation _DKMetadata

+ (id)keyPathForMetadataKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"metadata.%@", a3];
}

@end