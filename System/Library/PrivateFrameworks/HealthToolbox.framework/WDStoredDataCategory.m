@interface WDStoredDataCategory
- (HKDisplayCategory)category;
- (NSMutableArray)displayTypes;
- (void)setCategory:(id)a3;
@end

@implementation WDStoredDataCategory

- (NSMutableArray)displayTypes
{
  displayTypes = self->_displayTypes;
  if (!displayTypes)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v5 = self->_displayTypes;
    self->_displayTypes = v4;

    displayTypes = self->_displayTypes;
  }

  return displayTypes;
}

- (HKDisplayCategory)category
{
  return (HKDisplayCategory *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_displayTypes, 0);
}

@end