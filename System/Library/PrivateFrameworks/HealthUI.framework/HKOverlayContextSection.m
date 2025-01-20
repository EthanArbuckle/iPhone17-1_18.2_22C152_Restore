@interface HKOverlayContextSection
- (HKOverlayContextSection)initWithSectionTitle:(id)a3 overlayContextItems:(id)a4;
- (HKOverlayContextSection)initWithSectionTitle:(id)a3 overlayContextItems:(id)a4 accessoryButtonAction:(id)a5;
- (NSArray)items;
- (NSArray)overlayContextItems;
- (NSString)localizedSectionTitle;
- (UIAction)accessoryButtonAction;
- (void)setItems:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation HKOverlayContextSection

- (HKOverlayContextSection)initWithSectionTitle:(id)a3 overlayContextItems:(id)a4 accessoryButtonAction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKOverlayContextSection;
  v12 = [(HKOverlayContextSection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localizedSectionTitle, a3);
    objc_storeStrong((id *)&v13->_overlayContextItems, a4);
    objc_storeStrong((id *)&v13->_accessoryButtonAction, a5);
  }

  return v13;
}

- (HKOverlayContextSection)initWithSectionTitle:(id)a3 overlayContextItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKOverlayContextSection;
  id v9 = [(HKOverlayContextSection *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedSectionTitle, a3);
    accessoryButtonAction = v10->_accessoryButtonAction;
    v10->_accessoryButtonAction = 0;

    objc_storeStrong((id *)&v10->_overlayContextItems, a4);
  }

  return v10;
}

- (NSArray)items
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(HKOverlayContextSection *)self overlayContextItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) contextItemForLastUpdate];
        if (!v10)
        {
          id v11 = [MEMORY[0x1E4F28B00] currentHandler];
          [v11 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomViewController.m" lineNumber:3421 description:@"Context items should not be nil"];
        }
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (void)setTitle:(id)a3
{
}

- (void)setItems:(id)a3
{
}

- (NSString)localizedSectionTitle
{
  return self->_localizedSectionTitle;
}

- (NSArray)overlayContextItems
{
  return self->_overlayContextItems;
}

- (UIAction)accessoryButtonAction
{
  return self->_accessoryButtonAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryButtonAction, 0);
  objc_storeStrong((id *)&self->_overlayContextItems, 0);
  objc_storeStrong((id *)&self->_localizedSectionTitle, 0);
  objc_storeStrong((id *)&self->items, 0);
  objc_storeStrong((id *)&self->title, 0);
}

@end