@interface HUItemTableViewScrollDestination
- (BOOL)isAnimated;
- (HFItem)item;
- (HUItemTableViewScrollDestination)initWithItem:(id)a3 animated:(BOOL)a4;
@end

@implementation HUItemTableViewScrollDestination

- (HUItemTableViewScrollDestination)initWithItem:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUItemTableViewScrollDestination;
  v8 = [(HUItemTableViewScrollDestination *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_item, a3);
    v9->_animated = a4;
  }

  return v9;
}

- (HFItem)item
{
  return self->_item;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void).cxx_destruct
{
}

@end