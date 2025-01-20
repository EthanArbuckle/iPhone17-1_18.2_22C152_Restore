@interface LPCSSVariable
- (LPCSSVariable)initWithName:(id)a3;
- (NSString)name;
- (id)variableByResolvingWithThemePath:(id)a3;
@end

@implementation LPCSSVariable

- (LPCSSVariable)initWithName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPCSSVariable;
  v6 = [(LPCSSVariable *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = v7;
  }

  return v7;
}

- (id)variableByResolvingWithThemePath:(id)a3
{
  v3 = [(NSString *)self->_name stringByReplacingOccurrencesOfString:@"<theme-path>" withString:a3];
  v4 = [[LPCSSVariable alloc] initWithName:v3];

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end