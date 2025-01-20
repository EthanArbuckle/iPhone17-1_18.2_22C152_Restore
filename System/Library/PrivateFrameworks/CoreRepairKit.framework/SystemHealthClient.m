@interface SystemHealthClient
- (SystemHealthClient)init;
- (SystemHealthClient)initWithComponentType:(unint64_t)a3;
- (unint64_t)componentType;
- (unint64_t)getComponentStatusWithError:(id *)a3;
- (void)setComponentType:(unint64_t)a3;
@end

@implementation SystemHealthClient

- (SystemHealthClient)init
{
  return 0;
}

- (SystemHealthClient)initWithComponentType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SystemHealthClient;
  result = [(SystemHealthClient *)&v5 init];
  if (result) {
    result->componentType = a3;
  }
  return result;
}

- (unint64_t)getComponentStatusWithError:(id *)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  objc_super v5 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v3, v6, v4, @"You must override %@ in a subclass", v5);

  return 0;
}

- (unint64_t)componentType
{
  return self->componentType;
}

- (void)setComponentType:(unint64_t)a3
{
  self->componentType = a3;
}

@end