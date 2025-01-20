@interface HUCCMosaicItem
- (HFHomeKitItemProtocol)baseItem;
- (HUCCMosaicItem)init;
- (HUCCMosaicItem)initWithBaseItem:(id)a3;
- (double)itemPriority;
- (unint64_t)itemSize;
- (unint64_t)itemType;
- (void)setBaseItem:(id)a3;
- (void)setItemPriority:(double)a3;
- (void)setItemSize:(unint64_t)a3;
- (void)setItemType:(unint64_t)a3;
@end

@implementation HUCCMosaicItem

- (HUCCMosaicItem)initWithBaseItem:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUCCMosaicItem;
  v5 = [(HUCCMosaicItem *)&v19 init];
  v6 = v5;
  if (v5)
  {
    [(HUCCMosaicItem *)v5 setBaseItem:v4];
    v7 = [(HUCCMosaicItem *)v6 baseItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v9 = v6;
    if (isKindOfClass)
    {
      uint64_t v10 = 0;
    }
    else
    {
      v11 = [(HUCCMosaicItem *)v6 baseItem];
      objc_opt_class();
      char v12 = objc_opt_isKindOfClass();

      v9 = v6;
      if (v12)
      {
        uint64_t v10 = 1;
      }
      else
      {
        v13 = [(HUCCMosaicItem *)v6 baseItem];
        int v14 = [v13 conformsToProtocol:&unk_1F1A3D558];

        v9 = v6;
        if (v14)
        {
          uint64_t v10 = 2;
        }
        else
        {
          v15 = [(HUCCMosaicItem *)v6 baseItem];
          objc_opt_class();
          int v16 = objc_opt_isKindOfClass();

          v9 = v6;
          if ((v16 & 1) == 0)
          {
            v18 = [(HUCCMosaicItem *)v6 baseItem];
            NSLog(&cfstr_UnknownMosaicB.isa, v18);

            goto LABEL_11;
          }
          uint64_t v10 = 3;
        }
      }
    }
    [(HUCCMosaicItem *)v9 setItemType:v10];
  }
LABEL_11:

  return v6;
}

- (HUCCMosaicItem)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCCMosaicItem.m", 44, @"%s is unavailable; use %@ instead",
    "-[HUCCMosaicItem init]",
    v5);

  return 0;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (unint64_t)itemSize
{
  return self->_itemSize;
}

- (void)setItemSize:(unint64_t)a3
{
  self->_itemSize = a3;
}

- (double)itemPriority
{
  return self->_itemPriority;
}

- (void)setItemPriority:(double)a3
{
  self->_itemPriority = a3;
}

- (HFHomeKitItemProtocol)baseItem
{
  return self->_baseItem;
}

- (void)setBaseItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end