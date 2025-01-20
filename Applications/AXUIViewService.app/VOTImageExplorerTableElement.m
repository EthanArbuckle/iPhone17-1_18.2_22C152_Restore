@interface VOTImageExplorerTableElement
- (NSArray)filteredColumnFeatures;
- (NSArray)filteredColumnHeaders;
- (NSArray)filteredRowFeatures;
- (id)accessibilityDataTableCellElementForRow:(unint64_t)a3 column:(unint64_t)a4;
- (id)accessibilityHeaderElementsForColumn:(unint64_t)a3;
- (id)accessibilityIdentifier;
- (id)filteredSubfeaturesWithFeatureType:(int64_t)a3;
- (int64_t)accessibilityContainerType;
- (unint64_t)accessibilityColumnCount;
- (unint64_t)accessibilityRowCount;
- (void)setFilteredColumnFeatures:(id)a3;
- (void)setFilteredColumnHeaders:(id)a3;
- (void)setFilteredRowFeatures:(id)a3;
@end

@implementation VOTImageExplorerTableElement

- (unint64_t)accessibilityRowCount
{
  v2 = [(VOTImageExplorerTableElement *)self filteredSubfeaturesWithFeatureType:9];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)accessibilityColumnCount
{
  v2 = [(VOTImageExplorerTableElement *)self filteredSubfeaturesWithFeatureType:10];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)accessibilityHeaderElementsForColumn:(unint64_t)a3
{
  v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(VOTImageExplorerTableElement *)self filteredColumnHeaders];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 columnIndex] == (id)a3) {
          [v5 axSafelyAddObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)accessibilityDataTableCellElementForRow:(unint64_t)a3 column:(unint64_t)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(VOTImageExplorerTableElement *)self accessibilityElements];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 rowIndex] == (id)a3 && objc_msgSend(v11, "columnIndex") == (id)a4)
        {
          id v12 = v11;
          goto LABEL_12;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (id)filteredSubfeaturesWithFeatureType:(int64_t)a3
{
  v5 = [(VOTImageExplorerElement *)self feature];

  if (v5)
  {
    v6 = &OBJC_IVAR___VOTImageExplorerTableElement__filteredColumnFeatures;
    if (a3 == 9) {
      v6 = &OBJC_IVAR___VOTImageExplorerTableElement__filteredRowFeatures;
    }
    id v7 = (id *)((char *)&self->super.super.super.super.super.isa + *v6);
    id v8 = *v7;
    if (!v8)
    {
      uint64_t v9 = [(VOTImageExplorerElement *)self feature];
      v10 = [v9 subfeatures];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000084F0;
      v13[3] = &unk_100024968;
      v13[4] = a3;
      v11 = +[NSPredicate predicateWithBlock:v13];
      id v8 = [v10 filteredArrayUsingPredicate:v11];

      objc_storeStrong(v7, v8);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int64_t)accessibilityContainerType
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return @"VOTImageExplorerTableElement";
}

- (NSArray)filteredColumnHeaders
{
  if (!self->_filteredColumnHeaders)
  {
    id v3 = [(VOTImageExplorerTableElement *)self accessibilityElements];

    if (v3)
    {
      v4 = +[NSPredicate predicateWithBlock:&stru_1000249A8];
      v5 = [(VOTImageExplorerTableElement *)self accessibilityElements];
      v6 = [v5 filteredArrayUsingPredicate:v4];
      filteredColumnHeaders = self->_filteredColumnHeaders;
      self->_filteredColumnHeaders = v6;
    }
  }
  id v8 = self->_filteredColumnHeaders;

  return v8;
}

- (void)setFilteredColumnHeaders:(id)a3
{
}

- (NSArray)filteredRowFeatures
{
  return self->_filteredRowFeatures;
}

- (void)setFilteredRowFeatures:(id)a3
{
}

- (NSArray)filteredColumnFeatures
{
  return self->_filteredColumnFeatures;
}

- (void)setFilteredColumnFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredColumnFeatures, 0);
  objc_storeStrong((id *)&self->_filteredRowFeatures, 0);

  objc_storeStrong((id *)&self->_filteredColumnHeaders, 0);
}

@end