@interface ComponentBackGlass
- (BOOL)isPresent;
- (id)serialNumber;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentBackGlass

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ComponentBackGlass;
  [(ComponentBase *)&v6 populateAttributes:v4];
  v5 = [(ComponentBackGlass *)self serialNumber];
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"serialNumber"];
  }
}

- (BOOL)isPresent
{
  v2 = [(ComponentBackGlass *)self serialNumber];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 length] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)serialNumber
{
  v2 = +[DAComponentUtil getIORegistryName:@"product" property:@"backglass-serial-number" optionalKey:0];
  if (v2) {
    id v3 = [objc_alloc((Class)NSString) initWithData:v2 encoding:4];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

@end