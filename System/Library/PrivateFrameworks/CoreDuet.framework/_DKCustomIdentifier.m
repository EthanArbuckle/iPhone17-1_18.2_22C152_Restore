@interface _DKCustomIdentifier
+ (id)typeForName:(id)a3;
@end

@implementation _DKCustomIdentifier

+ (id)typeForName:(id)a3
{
  return +[_DKObjectType objectTypeWithName:a3];
}

@end