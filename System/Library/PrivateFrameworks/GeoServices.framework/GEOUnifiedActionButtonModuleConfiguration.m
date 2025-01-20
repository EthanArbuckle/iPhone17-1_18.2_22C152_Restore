@interface GEOUnifiedActionButtonModuleConfiguration
- (GEOUnifiedActionButtonModuleConfiguration)initWithUnifiedActionModuleConfiguration:(id)a3;
- (NSArray)buttonItems;
- (id)description;
@end

@implementation GEOUnifiedActionButtonModuleConfiguration

- (GEOUnifiedActionButtonModuleConfiguration)initWithUnifiedActionModuleConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOUnifiedActionButtonModuleConfiguration;
  v6 = [(GEOUnifiedActionButtonModuleConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_buttonModuleConfig, a3);
  }

  return v7;
}

- (NSArray)buttonItems
{
  v2 = -[GEOPDUnifiedActionModuleConfiguration buttonItems]((id *)&self->_buttonModuleConfig->super.super.isa);
  v3 = +[GEOButtonItem buttonItemsFromPDButtonItems:v2];

  return (NSArray *)v3;
}

- (id)description
{
  return [(GEOPDUnifiedActionModuleConfiguration *)self->_buttonModuleConfig description];
}

- (void).cxx_destruct
{
}

@end