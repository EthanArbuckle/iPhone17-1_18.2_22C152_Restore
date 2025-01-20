@interface GKCancelSwipeToEditGestureRecognizer
- (GKCollectionViewCell)currentEditingCell;
- (void)setCurrentEditingCell:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation GKCancelSwipeToEditGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([(GKCollectionViewCell *)self->_currentEditingCell touchWithinEditActions:*(void *)(*((void *)&v14 + 1) + 8 * i)])
        {
          [(GKCancelSwipeToEditGestureRecognizer *)self setState:5];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v13.receiver = self;
  v13.super_class = (Class)GKCancelSwipeToEditGestureRecognizer;
  [(GKCancelSwipeToEditGestureRecognizer *)&v13 touchesEnded:v8 withEvent:v7];
}

- (GKCollectionViewCell)currentEditingCell
{
  return self->_currentEditingCell;
}

- (void)setCurrentEditingCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end