@interface SGMicrodataItem
- (NSArray)itemRef;
- (NSSet)itemType;
- (SGMicrodataItem)initWithItemType:(id)a3 itemRef:(id)a4;
- (void)resolveItemRefsWithDocument:(id)a3;
@end

@implementation SGMicrodataItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_itemRef, 0);
}

- (NSArray)itemRef
{
  return &self->_itemRef->super;
}

- (NSSet)itemType
{
  return self->_itemType;
}

- (SGMicrodataItem)initWithItemType:(id)a3 itemRef:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SGMicrodataItem;
  v9 = [(SGMicrodataItemScope *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemType, a3);
    uint64_t v11 = [v8 mutableCopy];
    itemRef = v10->_itemRef;
    v10->_itemRef = (NSMutableArray *)v11;
  }
  return v10;
}

- (void)resolveItemRefsWithDocument:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_itemRef count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v5 = self->_itemRef;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v4, "htmlIds", (void)v21);
          v12 = [v11 objectForKeyedSubscript:v10];

          if (v12)
          {
            if (![(SGMicrodataItemScope *)self isReferencedBy:v12])
            {
              itemProps = self->super._itemProps;
              objc_super v14 = [v12 itemProps];
              [(NSMutableArray *)itemProps addObjectsFromArray:v14];

              v15 = [(SGMicrodataItemScope *)self itemProps];
              unint64_t v16 = [v15 count];

              if (v16 >= 0x3E8)
              {

                goto LABEL_14;
              }
            }
          }
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    v17 = [(SGMicrodataItemScope *)self itemProps];
    unint64_t v18 = [v17 count];

    if (v18 >= 0x3E9)
    {
      v19 = [(SGMicrodataItemScope *)self itemProps];
      uint64_t v20 = [v19 count] - 1000;

      -[NSMutableArray removeObjectsInRange:](self->super._itemProps, "removeObjectsInRange:", 1000, v20);
    }
  }
}

@end