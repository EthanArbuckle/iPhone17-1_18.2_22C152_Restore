@interface _DKCustomQuantity
+ (id)typeForName:(id)a3;
@end

@implementation _DKCustomQuantity

+ (id)typeForName:(id)a3
{
  return +[_DKObjectType objectTypeWithName:a3];
}

@end