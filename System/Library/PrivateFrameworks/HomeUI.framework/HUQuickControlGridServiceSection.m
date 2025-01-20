@interface HUQuickControlGridServiceSection
- (HFServiceItem)serviceItem;
- (HUQuickControlGridServiceSection)init;
- (NSMutableArray)gridControlItems;
- (NSMutableArray)supplementaryControlItems;
- (void)setGridControlItems:(id)a3;
- (void)setServiceItem:(id)a3;
- (void)setSupplementaryControlItems:(id)a3;
@end

@implementation HUQuickControlGridServiceSection

- (HUQuickControlGridServiceSection)init
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlGridServiceSection;
  v2 = [(HUQuickControlGridServiceSection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    gridControlItems = v2->_gridControlItems;
    v2->_gridControlItems = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    supplementaryControlItems = v2->_supplementaryControlItems;
    v2->_supplementaryControlItems = (NSMutableArray *)v5;
  }
  return v2;
}

- (HFServiceItem)serviceItem
{
  return self->_serviceItem;
}

- (void)setServiceItem:(id)a3
{
}

- (NSMutableArray)gridControlItems
{
  return self->_gridControlItems;
}

- (void)setGridControlItems:(id)a3
{
}

- (NSMutableArray)supplementaryControlItems
{
  return self->_supplementaryControlItems;
}

- (void)setSupplementaryControlItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryControlItems, 0);
  objc_storeStrong((id *)&self->_gridControlItems, 0);

  objc_storeStrong((id *)&self->_serviceItem, 0);
}

@end