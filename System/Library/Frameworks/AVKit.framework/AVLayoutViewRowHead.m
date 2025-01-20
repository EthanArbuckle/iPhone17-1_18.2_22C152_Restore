@interface AVLayoutViewRowHead
- (AVLayoutItemAttributes)firstAttributesInLayoutOrder;
- (AVLayoutItemAttributes)firstAttributesInPriorityOrder;
- (AVLayoutViewRowHead)initWithFirstAttributesInLayoutOrder:(id)a3 firstAttributesInPriorityOrder:(id)a4;
@end

@implementation AVLayoutViewRowHead

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_firstAttributesInPriorityOrder);

  objc_storeStrong((id *)&self->_firstAttributesInLayoutOrder, 0);
}

- (AVLayoutItemAttributes)firstAttributesInPriorityOrder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstAttributesInPriorityOrder);

  return (AVLayoutItemAttributes *)WeakRetained;
}

- (AVLayoutItemAttributes)firstAttributesInLayoutOrder
{
  return self->_firstAttributesInLayoutOrder;
}

- (AVLayoutViewRowHead)initWithFirstAttributesInLayoutOrder:(id)a3 firstAttributesInPriorityOrder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVLayoutViewRowHead;
  v9 = [(AVLayoutViewRowHead *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstAttributesInLayoutOrder, a3);
    objc_storeWeak((id *)&v10->_firstAttributesInPriorityOrder, v8);
  }

  return v10;
}

@end