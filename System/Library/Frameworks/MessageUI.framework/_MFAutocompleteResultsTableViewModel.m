@interface _MFAutocompleteResultsTableViewModel
- (_MFAutocompleteResultsTableViewModel)initWithNumberOfSections:(unint64_t)a3;
- (id)computeDiffForModel:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfNonEmptySections;
- (unint64_t)numberOfSections;
- (void)enumerateSections:(id)a3;
- (void)setNumberOfSections:(unint64_t)a3;
- (void)setSection:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation _MFAutocompleteResultsTableViewModel

- (void)setNumberOfSections:(unint64_t)a3
{
  self->_numberOfSections = a3;
  v4 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
  sections = self->_sections;
  self->_sections = v4;
}

- (unint64_t)numberOfNonEmptySections
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64___MFAutocompleteResultsTableViewModel_numberOfNonEmptySections__block_invoke;
  v4[3] = &unk_1E5F795A0;
  v4[4] = &v5;
  [(_MFAutocompleteResultsTableViewModel *)self enumerateSections:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)enumerateSections:(id)a3
{
  id v4 = a3;
  sections = self->_sections;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58___MFAutocompleteResultsTableViewModel_enumerateSections___block_invoke;
  v7[3] = &unk_1E5F795C8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)sections enumerateKeysAndObjectsUsingBlock:v7];
}

- (_MFAutocompleteResultsTableViewModel)initWithNumberOfSections:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MFAutocompleteResultsTableViewModel;
  id v4 = [(_MFAutocompleteResultsTableViewModel *)&v7 init];
  uint64_t v5 = v4;
  if (v4) {
    [(_MFAutocompleteResultsTableViewModel *)v4 setNumberOfSections:a3];
  }
  return v5;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  if (self->_numberOfSections >= a3)
  {
    sections = self->_sections;
    objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    uint64_t v8 = [(NSMutableDictionary *)sections objectForKey:v7];

    id v3 = (id)v8;
    if (!v8)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v9 = self->_sections;
      v10 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v9 setObject:v3 forKey:v10];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setSection:(id)a3 atIndex:(unint64_t)a4
{
  sections = self->_sections;
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:a3];
  id v6 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)sections setObject:v7 forKey:v6];
}

- (id)computeDiffForModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28E60] indexSet];
  id v6 = [MEMORY[0x1E4F28E60] indexSet];
  id v7 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v8 = [v4 numberOfSections];
  if (v8 == [(_MFAutocompleteResultsTableViewModel *)self numberOfSections])
  {
    for (unint64_t i = 0; i < [(_MFAutocompleteResultsTableViewModel *)self numberOfSections]; ++i)
    {
      unint64_t v10 = [v4 numberOfSections];
      if (v10 < [(_MFAutocompleteResultsTableViewModel *)self numberOfSections])
      {
        v11 = [(_MFAutocompleteResultsTableViewModel *)self sectionAtIndex:i];
        if ([v11 count])
        {
          v12 = [v4 sectionAtIndex:i];
          uint64_t v13 = [v12 count];

          v14 = v6;
          if (!v13) {
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      unint64_t v15 = [v4 numberOfSections];
      if (v15 <= [(_MFAutocompleteResultsTableViewModel *)self numberOfSections]) {
        goto LABEL_14;
      }
      v16 = [v4 sectionAtIndex:i];
      if (![v16 count])
      {

LABEL_14:
        v19 = [v4 sectionAtIndex:i];
        uint64_t v20 = [v19 count];

        v14 = v7;
        if (!v20) {
          continue;
        }
        goto LABEL_15;
      }
      v17 = [(_MFAutocompleteResultsTableViewModel *)self sectionAtIndex:i];
      uint64_t v18 = [v17 count];

      v14 = v5;
      if (v18) {
        goto LABEL_14;
      }
LABEL_15:
      [v14 addIndex:i];
    }
  }
  v21 = objc_alloc_init(_MFTableViewModelDiff);
  [(_MFTableViewModelDiff *)v21 setChangedRows:v7];
  [(_MFTableViewModelDiff *)v21 setDeletedRows:v6];
  [(_MFTableViewModelDiff *)v21 setInsertedRows:v5];

  return v21;
}

- (unint64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (void).cxx_destruct
{
}

@end