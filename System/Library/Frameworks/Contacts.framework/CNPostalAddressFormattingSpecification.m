@interface CNPostalAddressFormattingSpecification
- (CNPostalAddressFormattingSpecification)initWithDisplayFieldArrangement:(id)a3 editingFieldArrangement:(id)a4 fieldLabelMap:(id)a5;
- (NSArray)displayFieldArrangement;
- (NSArray)editingFieldArrangement;
- (NSDictionary)fieldLabelMap;
- (id)localizedPlaceholderForKey:(id)a3;
@end

@implementation CNPostalAddressFormattingSpecification

- (CNPostalAddressFormattingSpecification)initWithDisplayFieldArrangement:(id)a3 editingFieldArrangement:(id)a4 fieldLabelMap:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNPostalAddressFormattingSpecification;
  v11 = [(CNPostalAddressFormattingSpecification *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    displayFieldArrangement = v11->_displayFieldArrangement;
    v11->_displayFieldArrangement = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    editingFieldArrangement = v11->_editingFieldArrangement;
    v11->_editingFieldArrangement = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    fieldLabelMap = v11->_fieldLabelMap;
    v11->_fieldLabelMap = (NSDictionary *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)localizedPlaceholderForKey:(id)a3
{
  id v4 = a3;
  v5 = [(CNPostalAddressFormattingSpecification *)self fieldLabelMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)fieldLabelMap
{
  return self->_fieldLabelMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldLabelMap, 0);
  objc_storeStrong((id *)&self->_editingFieldArrangement, 0);

  objc_storeStrong((id *)&self->_displayFieldArrangement, 0);
}

- (NSArray)displayFieldArrangement
{
  return self->_displayFieldArrangement;
}

- (NSArray)editingFieldArrangement
{
  return self->_editingFieldArrangement;
}

@end