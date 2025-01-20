@interface HKDataMetadataSimpleSection
- (HKDataMetadataSimpleSection)initWithTitle:(id)a3;
- (NSMutableArray)rows;
- (NSString)title;
- (id)_rowTitles;
- (id)_valueForRowWithTitle:(id)a3;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
- (void)addText:(id)a3 detail:(id)a4 baseIdentifier:(id)a5;
- (void)setRows:(id)a3;
@end

@implementation HKDataMetadataSimpleSection

- (HKDataMetadataSimpleSection)initWithTitle:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKDataMetadataSimpleSection;
  v6 = [(HKDataMetadataSimpleSection *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_title, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    rows = v7->_rows;
    v7->_rows = v8;
  }
  return v7;
}

- (void)addText:(id)a3 detail:(id)a4 baseIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = objc_alloc_init(_HKDataMetadataSimpleRow);
  [(_HKDataMetadataSimpleRow *)v11 setText:v10];

  [(_HKDataMetadataSimpleRow *)v11 setDetail:v9];
  [(_HKDataMetadataSimpleRow *)v11 setBaseIdentifier:v8];

  [(NSMutableArray *)self->_rows addObject:v11];
}

- (id)_rowTitles
{
  return (id)[(NSMutableArray *)self->_rows hk_map:&__block_literal_global_55];
}

uint64_t __41__HKDataMetadataSimpleSection__rowTitles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 detail];
}

- (id)_valueForRowWithTitle:(id)a3
{
  id v4 = a3;
  rows = self->_rows;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HKDataMetadataSimpleSection__valueForRowWithTitle___block_invoke;
  v11[3] = &unk_1E6D54438;
  id v12 = v4;
  id v6 = v4;
  v7 = [(NSMutableArray *)rows hk_filter:v11];
  id v8 = [v7 firstObject];
  id v9 = [v8 text];

  return v9;
}

uint64_t __53__HKDataMetadataSimpleSection__valueForRowWithTitle___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 detail];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)sectionTitle
{
  return self->_title;
}

- (unint64_t)numberOfRowsInSection
{
  return [(NSMutableArray *)self->_rows count];
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  id v6 = [a4 dequeueReusableCellWithIdentifier:@"SimpleCellReuseIdentifier"];
  if (!v6) {
    id v6 = [[HKDataMetadataSimpleTableViewCell alloc] initWithReuseIdentifier:@"SimpleCellReuseIdentifier"];
  }
  v7 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:a3];
  id v8 = [v7 text];
  id v9 = [(HKDataMetadataSimpleTableViewCell *)v6 titleTextLabel];
  [v9 setText:v8];

  id v10 = [v7 detail];

  if (v10)
  {
    objc_super v11 = [v7 detail];
    id v12 = [(HKDataMetadataSimpleTableViewCell *)v6 subtitleTextLabel];
    [v12 setText:v11];
  }
  v13 = [v7 baseIdentifier];
  [(HKDataMetadataSimpleTableViewCell *)v6 updateAutomationIdentifiersWith:v13];

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end