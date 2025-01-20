@interface GKSectionInfo
- (NSArray)items;
- (NSArray)sortDescriptors;
- (NSPredicate)predicate;
- (NSString)title;
- (id)description;
- (int64_t)section;
- (void)setItems:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setSection:(int64_t)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation GKSectionInfo

- (id)description
{
  v4 = [(GKSectionInfo *)self items];
  uint64_t v5 = [v4 count];

  v6 = NSString;
  v24.receiver = self;
  v24.super_class = (Class)GKSectionInfo;
  v7 = [(GKSectionInfo *)&v24 description];
  int64_t section = self->_section;
  v23 = v6;
  if (section == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = &stru_1F07B2408;
  }
  else
  {
    v10 = NSString;
    uint64_t v11 = _gkBeautifyVariableName();
    v21 = [NSNumber numberWithInteger:self->_section];
    v22 = (void *)v11;
    v9 = [v10 stringWithFormat:@" %@: %@", v11, v21];
  }
  title = self->_title;
  if (title)
  {
    v13 = NSString;
    v2 = _gkBeautifyVariableName();
    v14 = [v13 stringWithFormat:@" %@: %@", v2, self->_title];
    if (v5) {
      goto LABEL_6;
    }
  }
  else
  {
    v14 = &stru_1F07B2408;
    if (v5)
    {
LABEL_6:
      v15 = NSString;
      v16 = _gkBeautifyVariableName();
      v17 = [NSNumber numberWithInteger:v5];
      v18 = [v15 stringWithFormat:@" %@: %@", v16, v17];
      v19 = [v23 stringWithFormat:@"%@%@%@%@", v7, v9, v14, v18];

      if (!title) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  v19 = [v23 stringWithFormat:@"%@%@%@%@", v7, v9, v14, &stru_1F07B2408];
  if (title)
  {
LABEL_7:
  }
LABEL_8:
  if (section != 0x7FFFFFFFFFFFFFFFLL)
  {
  }

  return v19;
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_int64_t section = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end