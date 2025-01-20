@interface GEOButtonModuleConfiguration
- (GEOButtonModuleConfiguration)initWithButtonModuleConfiguration:(id)a3;
- (NSArray)buttonItems;
- (id)description;
@end

@implementation GEOButtonModuleConfiguration

- (GEOButtonModuleConfiguration)initWithButtonModuleConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOButtonModuleConfiguration;
  v6 = [(GEOButtonModuleConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_buttonModuleConfig, a3);
  }

  return v7;
}

- (NSArray)buttonItems
{
  v2 = -[GEOPDButtonModuleConfiguration buttonItems]((id *)&self->_buttonModuleConfig->super.super.isa);
  v3 = +[GEOButtonItem buttonItemsFromPDButtonItems:v2];

  return (NSArray *)v3;
}

- (id)description
{
  return [(GEOPDButtonModuleConfiguration *)self->_buttonModuleConfig description];
}

- (void).cxx_destruct
{
}

@end