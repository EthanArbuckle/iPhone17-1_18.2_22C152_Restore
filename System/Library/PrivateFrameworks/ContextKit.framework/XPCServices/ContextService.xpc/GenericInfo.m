@interface GenericInfo
- (id)init:(id)a3 parameters:(id)a4 returnType:(id)a5 typeParameters:(id)a6;
- (void)dealloc;
@end

@implementation GenericInfo

- (id)init:(id)a3 parameters:(id)a4 returnType:(id)a5 typeParameters:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)GenericInfo;
  id result = [(GenericInfo *)&v11 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 2) = a4;
    *((void *)result + 3) = a5;
    *((void *)result + 4) = a6;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GenericInfo;
  [(GenericInfo *)&v3 dealloc];
}

@end