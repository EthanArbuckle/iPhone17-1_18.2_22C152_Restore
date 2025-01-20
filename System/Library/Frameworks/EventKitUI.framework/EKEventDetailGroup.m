@interface EKEventDetailGroup
- (BOOL)hasSubitemForIndexPathRow:(unint64_t)a3;
- (EKEventDetailGroup)initWithTag:(int64_t)a3 headerTitle:(id)a4;
- (NSArray)items;
- (NSString)headerTitle;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3 withTraitCollection:(id)a4;
- (id)description;
- (id)itemAtIndex:(unint64_t)a3;
- (id)itemAtIndex:(unint64_t)a3 subitemIndex:(unint64_t *)a4;
- (int64_t)tag;
- (unint64_t)numberOfRows;
- (void)setHeaderTitle:(id)a3;
- (void)setItems:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)updateCellLayoutsForRowCountIfNeededUsingWidth:(double)a3;
@end

@implementation EKEventDetailGroup

- (EKEventDetailGroup)initWithTag:(int64_t)a3 headerTitle:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKEventDetailGroup;
  v7 = [(EKEventDetailGroup *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(EKEventDetailGroup *)v7 setTag:a3];
    [(EKEventDetailGroup *)v8 setHeaderTitle:v6];
  }

  return v8;
}

- (unint64_t)numberOfRows
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(EKEventDetailGroup *)self items];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) numberOfSubitems];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)itemAtIndex:(unint64_t)a3
{
  return [(EKEventDetailGroup *)self itemAtIndex:a3 subitemIndex:0];
}

- (id)itemAtIndex:(unint64_t)a3 subitemIndex:(unint64_t *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(EKEventDetailGroup *)self items];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    long long v9 = 0;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(obj);
      }
      long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      if (a3 - v8 < [v12 numberOfSubitems])
      {
        id v13 = v12;

        long long v9 = v13;
      }
      if (a4) {
        *a4 = a3 - v8;
      }
      v8 += [v12 numberOfSubitems];
      if (v8 > a3) {
        break;
      }
      if (v7 == ++v11)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3 withTraitCollection:(id)a4
{
  uint64_t v10 = 0;
  id v6 = a4;
  uint64_t v7 = [(EKEventDetailGroup *)self itemAtIndex:a3 subitemIndex:&v10];
  unint64_t v8 = [v7 cellForSubitemAtIndex:v10 withTraitCollection:v6];

  return v8;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  [(EKEventDetailGroup *)self defaultCellHeightForSubitemAtIndex:a3 forWidth:1 forceUpdate:a4];
  return result;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v11 = 0;
  uint64_t v7 = [(EKEventDetailGroup *)self itemAtIndex:a3 subitemIndex:&v11];
  [v7 defaultCellHeightForSubitemAtIndex:v11 forWidth:v5 forceUpdate:a4];
  double v9 = v8;

  return v9;
}

- (BOOL)hasSubitemForIndexPathRow:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v3 = [(EKEventDetailGroup *)self itemAtIndex:a3 subitemIndex:&v6];
  char v4 = [v3 hasDetailViewControllerAtIndex:v6];

  return v4;
}

- (id)description
{
  v2 = NSString;
  uint64_t v3 = [(EKEventDetailGroup *)self items];
  char v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (void)updateCellLayoutsForRowCountIfNeededUsingWidth:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = [(EKEventDetailGroup *)self items];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 requiresLayoutForSubitemCount]
          && [v9 maximumNumberOfSubItems])
        {
          unint64_t v10 = 0;
          do
          {
            uint64_t v11 = [v9 cellForSubitemAtIndex:v10];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v11, "layoutForWidth:position:", objc_msgSend(v9, "cellPosition"), a3);
            }

            ++v10;
          }
          while (v10 < [v9 maximumNumberOfSubItems]);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerTitle, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end