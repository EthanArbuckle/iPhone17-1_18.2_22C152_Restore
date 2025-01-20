@interface DMShader
+ (id)createShaderWithName:(id)a3;
@end

@implementation DMShader

+ (id)createShaderWithName:(id)a3
{
  id v3 = a3;
  id v4 = [(ForwardDmShader *)[DMShader alloc] initShaderWithName:v3];

  return v4;
}

@end