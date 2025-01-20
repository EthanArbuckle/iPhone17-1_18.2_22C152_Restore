@interface HKEmergencyCardGroupTableItem
- (BOOL)canEditRowAtIndex:(int64_t)a3;
- (BOOL)hasPresentableData;
- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3;
- (NSArray)subitems;
- (NSString)titleForHeader;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndex:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (int64_t)editingStyleForRowAtIndex:(int64_t)a3;
- (int64_t)numberOfRows;
- (void)_getSubitem:(id *)a3 andSubitemRow:(int64_t *)a4 forTableViewRow:(int64_t)a5;
- (void)commitEditing;
- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (void)setData:(id)a3;
- (void)setOwningViewController:(id)a3;
- (void)setProfileFirstName:(id)a3;
- (void)setSubitems:(id)a3;
- (void)setTitleForHeader:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4;
@end

@implementation HKEmergencyCardGroupTableItem

- (void)setSubitems:(id)a3
{
  v5 = (NSArray *)a3;
  objc_storeStrong((id *)&self->_allSubItems, a3);
  subitems = self->_subitems;
  self->_subitems = v5;
  v9 = v5;

  v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v9, "count"));
  cumulativeRowOffsets = self->_cumulativeRowOffsets;
  self->_cumulativeRowOffsets = v7;
}

- (void)_getSubitem:(id *)a3 andSubitemRow:(int64_t *)a4 forTableViewRow:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = self->_subitems;
  id v9 = (id)[(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      v11 = 0;
      int64_t v12 = a5;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v11);
        uint64_t v14 = objc_msgSend(v13, "numberOfRows", (void)v16);
        a5 = v12 - v14;
        if (v12 < v14)
        {
          id v9 = v13;
          a5 = v12;
          goto LABEL_11;
        }
        v11 = (char *)v11 + 1;
        v12 -= v14;
      }
      while (v9 != v11);
      id v9 = (id)[(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v15 = v9;
  *a3 = v15;
  *a4 = a5;
}

- (void)setData:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKEmergencyCardGroupTableItem;
  id v4 = a3;
  [(HKEmergencyCardTableItem *)&v5 setData:v4];
  -[NSArray makeObjectsPerformSelector:withObject:](self->_allSubItems, "makeObjectsPerformSelector:withObject:", sel_setData_, v4, v5.receiver, v5.super_class);
}

- (void)setProfileFirstName:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKEmergencyCardGroupTableItem;
  id v4 = a3;
  [(HKEmergencyCardTableItem *)&v5 setProfileFirstName:v4];
  -[NSArray makeObjectsPerformSelector:withObject:](self->_allSubItems, "makeObjectsPerformSelector:withObject:", sel_setProfileFirstName_, v4, v5.receiver, v5.super_class);
}

- (void)setOwningViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKEmergencyCardGroupTableItem;
  id v4 = a3;
  [(HKEmergencyCardTableItem *)&v5 setOwningViewController:v4];
  -[NSArray makeObjectsPerformSelector:withObject:](self->_allSubItems, "makeObjectsPerformSelector:withObject:", sel_setOwningViewController_, v4, v5.receiver, v5.super_class);
}

- (BOOL)hasPresentableData
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_allSubItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPresentableData", (void)v14)) {
          [(NSArray *)v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  subitems = self->_subitems;
  self->_subitems = v3;

  v11 = [(HKEmergencyCardGroupTableItem *)self subitems];
  BOOL v12 = [v11 count] != 0;

  return v12;
}

- (int64_t)numberOfRows
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_subitems;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "numberOfRows", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v10 = 0;
  uint64_t v11 = 0;
  id v6 = a3;
  [(HKEmergencyCardGroupTableItem *)self _getSubitem:&v10 andSubitemRow:&v11 forTableViewRow:a4];
  id v7 = v10;
  v8 = [v7 tableView:v6 cellForRowAtIndex:v11];

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndex:(int64_t)a4
{
  id v11 = 0;
  uint64_t v12 = 0;
  id v6 = a3;
  [(HKEmergencyCardGroupTableItem *)self _getSubitem:&v11 andSubitemRow:&v12 forTableViewRow:a4];
  id v7 = v11;
  [v7 tableView:v6 estimatedHeightForRowAtIndex:v12];
  double v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  id v11 = 0;
  uint64_t v12 = 0;
  id v6 = a3;
  [(HKEmergencyCardGroupTableItem *)self _getSubitem:&v11 andSubitemRow:&v12 forTableViewRow:a4];
  id v7 = v11;
  [v7 tableView:v6 heightForRowAtIndex:v12];
  double v9 = v8;

  return v9;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  id v6 = 0;
  uint64_t v7 = 0;
  [(HKEmergencyCardGroupTableItem *)self _getSubitem:&v6 andSubitemRow:&v7 forTableViewRow:a3];
  id v3 = v6;
  char v4 = [v3 shouldHighlightRowAtIndex:v7];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4
{
  id v8 = 0;
  uint64_t v9 = 0;
  id v6 = a3;
  [(HKEmergencyCardGroupTableItem *)self _getSubitem:&v8 andSubitemRow:&v9 forTableViewRow:a4];
  id v7 = v8;
  [v7 tableView:v6 didSelectRowAtIndex:v9];
}

- (BOOL)canEditRowAtIndex:(int64_t)a3
{
  id v6 = 0;
  uint64_t v7 = 0;
  [(HKEmergencyCardGroupTableItem *)self _getSubitem:&v6 andSubitemRow:&v7 forTableViewRow:a3];
  id v3 = v6;
  char v4 = [v3 canEditRowAtIndex:v7];

  return v4;
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  id v6 = 0;
  uint64_t v7 = 0;
  [(HKEmergencyCardGroupTableItem *)self _getSubitem:&v6 andSubitemRow:&v7 forTableViewRow:a3];
  id v3 = v6;
  int64_t v4 = [v3 editingStyleForRowAtIndex:v7];

  return v4;
}

- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  id v8 = 0;
  uint64_t v9 = 0;
  [(HKEmergencyCardGroupTableItem *)self _getSubitem:&v8 andSubitemRow:&v9 forTableViewRow:a4];
  id v5 = v8;
  int64_t v6 = [v5 commitEditingStyle:a3 forRowAtIndex:v9];

  return v6;
}

- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  id v6 = 0;
  uint64_t v7 = 0;
  [(HKEmergencyCardGroupTableItem *)self _getSubitem:&v6 andSubitemRow:&v7 forTableViewRow:a4];
  id v5 = v6;
  [v5 didCommitEditingStyle:a3 forRowAtIndex:v7];
}

- (void)commitEditing
{
}

- (NSArray)subitems
{
  return self->_subitems;
}

- (NSString)titleForHeader
{
  return self->_titleForHeader;
}

- (void)setTitleForHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleForHeader, 0);
  objc_storeStrong((id *)&self->_subitems, 0);
  objc_storeStrong((id *)&self->_allSubItems, 0);
  objc_storeStrong((id *)&self->_cumulativeRowOffsets, 0);
}

@end