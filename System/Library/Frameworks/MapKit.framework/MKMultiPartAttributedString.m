@interface MKMultiPartAttributedString
+ (id)_mapkit_multiPartAttributedStringForComposedStrings:(id)a3 defaultAttributes:(id)a4 repeatedSeparator:(id)a5;
+ (id)_mapkit_multiPartAttributedStringForServerFormattedString:(id)a3 defaultAttributes:(id)a4;
+ (id)_mapkit_multiPartAttributedStringForServerFormattedStrings:(id)a3 defaultAttributes:(id)a4 repeatedSeparator:(id)a5;
+ (id)multiPartAttributedStringWithComponents:(id)a3 repeatedSeparator:(id)a4;
+ (id)multiPartAttributedStringWithString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MKMultiPartAttributedString)initWithComponents:(id)a3 separators:(id)a4;
- (NSArray)components;
- (NSArray)separators;
- (NSAttributedString)attributedString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
@end

@implementation MKMultiPartAttributedString

- (MKMultiPartAttributedString)initWithComponents:(id)a3 separators:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MKMultiPartAttributedString;
  v8 = [(MKMultiPartAttributedString *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    separators = v8->_separators;
    v8->_separators = (NSArray *)v9;

    uint64_t v11 = [v6 copy];
    components = v8->_components;
    v8->_components = (NSArray *)v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  components = self->_components;
  separators = self->_separators;

  return (id)[v4 initWithComponents:components separators:separators];
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  if (![v7 isMemberOfClass:objc_opt_class()])
  {
    char v10 = 0;
    goto LABEL_17;
  }
  v8 = [(MKMultiPartAttributedString *)self components];
  if (v8 || ([v7 components], (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(MKMultiPartAttributedString *)self components];
    id v4 = [v7 components];
    if (([v3 isEqual:v4] & 1) == 0)
    {

      char v10 = 0;
      goto LABEL_14;
    }
    int v9 = 1;
  }
  else
  {
    v15 = 0;
    int v9 = 0;
  }
  uint64_t v11 = [(MKMultiPartAttributedString *)self separators];
  if (!v11)
  {
    v5 = [v7 separators];
    if (!v5)
    {
      char v10 = 1;
LABEL_19:

      if ((v9 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  v12 = [(MKMultiPartAttributedString *)self separators];
  v13 = [v7 separators];
  char v10 = [v12 isEqual:v13];

  if (!v11) {
    goto LABEL_19;
  }

  if (v9)
  {
LABEL_13:
  }
LABEL_14:
  if (!v8) {

  }
LABEL_17:
  return v10;
}

- (unint64_t)hash
{
  v3 = [(MKMultiPartAttributedString *)self components];
  uint64_t v4 = [v3 hash];
  v5 = [(MKMultiPartAttributedString *)self separators];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MKMultiPartAttributedString *)self components];
  unint64_t v6 = [(MKMultiPartAttributedString *)self separators];
  id v7 = [v3 stringWithFormat:@"<%@:%p\nparts=%@\nseparators =%@\n>", v4, self, v5, v6];

  return v7;
}

- (NSAttributedString)attributedString
{
  attributedString = self->_attributedString;
  if (!attributedString)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    v5 = [(MKMultiPartAttributedString *)self components];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      unint64_t v7 = 0;
      do
      {
        v8 = [(MKMultiPartAttributedString *)self components];
        int v9 = [v8 objectAtIndexedSubscript:v7];

        [v4 appendAttributedString:v9];
        unint64_t v10 = v7 + 1;
        uint64_t v11 = [(MKMultiPartAttributedString *)self components];
        unint64_t v12 = [v11 count];

        if (v7 + 1 < v12)
        {
          v13 = [(MKMultiPartAttributedString *)self separators];
          if (v7 >= [v13 count])
          {
            v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED919588];
          }
          else
          {
            objc_super v14 = [(MKMultiPartAttributedString *)self separators];
            v15 = [v14 objectAtIndexedSubscript:v7];
          }
          [v4 appendAttributedString:v15];
        }
        v16 = [(MKMultiPartAttributedString *)self components];
        unint64_t v17 = [v16 count];

        unint64_t v7 = v10;
      }
      while (v10 < v17);
    }
    v18 = (NSAttributedString *)[v4 copy];
    v19 = self->_attributedString;
    self->_attributedString = v18;

    attributedString = self->_attributedString;
  }

  return attributedString;
}

- (id)debugDescription
{
  attributedString = self->_attributedString;
  if (attributedString)
  {
    id v4 = [(NSAttributedString *)attributedString debugDescription];
  }
  else
  {
    v5 = [(MKMultiPartAttributedString *)self components];
    id v4 = [v5 debugDescription];
  }

  return v4;
}

- (NSArray)components
{
  return self->_components;
}

- (NSArray)separators
{
  return self->_separators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separators, 0);
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_attributedString, 0);
}

+ (id)multiPartAttributedStringWithComponents:(id)a3 repeatedSeparator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  if ((unint64_t)[v6 count] >= 2)
  {
    unint64_t v9 = 1;
    do
    {
      [v8 addObject:v7];
      ++v9;
    }
    while (v9 < [v6 count]);
  }
  unint64_t v10 = (void *)[objc_alloc((Class)a1) initWithComponents:v6 separators:v8];

  return v10;
}

+ (id)multiPartAttributedStringWithString:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc((Class)a1);
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];

    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v8 = (void *)[v5 initWithComponents:v7 separators:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_mapkit_multiPartAttributedStringForServerFormattedString:(id)a3 defaultAttributes:(id)a4
{
  id v4 = a3;
  if (a3)
  {
    id v5 = a4;
    id v6 = v4;
    id v7 = [[MKServerFormattedStringParameters alloc] initWithInstructionsDistanceDetailLevel:0 variableOverrides:0];
    v8 = [[MKServerFormattedString alloc] initWithGeoServerString:v6 parameters:v7];

    id v4 = [(MKServerFormattedString *)v8 multiPartAttributedStringWithAttributes:v5];
  }

  return v4;
}

+ (id)_mapkit_multiPartAttributedStringForServerFormattedStrings:(id)a3 defaultAttributes:(id)a4 repeatedSeparator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    unint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __156__MKMultiPartAttributedString_TransitFormattedStringExtras___mapkit_multiPartAttributedStringForServerFormattedStrings_defaultAttributes_repeatedSeparator___block_invoke;
    v20[3] = &unk_1E54BEE88;
    id v13 = v12;
    id v21 = v13;
    id v22 = v10;
    id v25 = a1;
    id v23 = v9;
    id v14 = v11;
    id v24 = v14;
    [v8 enumerateObjectsUsingBlock:v20];
    if ([v14 count])
    {
      v15 = [MKMultiPartAttributedString alloc];
      v16 = (void *)[v14 copy];
      unint64_t v17 = (void *)[v13 copy];
      v18 = [(MKMultiPartAttributedString *)v15 initWithComponents:v16 separators:v17];
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __156__MKMultiPartAttributedString_TransitFormattedStringExtras___mapkit_multiPartAttributedStringForServerFormattedStrings_defaultAttributes_repeatedSeparator___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (a3) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  id v5 = objc_msgSend(*(id *)(a1 + 64), "_mapkit_multiPartAttributedStringForServerFormattedString:defaultAttributes:", v11, *(void *)(a1 + 48));
  id v6 = v5;
  if (v5)
  {
    id v7 = *(void **)(a1 + 56);
    id v8 = [v5 components];
    [v7 addObjectsFromArray:v8];

    id v9 = *(void **)(a1 + 32);
    id v10 = [v6 separators];
    [v9 addObjectsFromArray:v10];
  }
}

+ (id)_mapkit_multiPartAttributedStringForComposedStrings:(id)a3 defaultAttributes:(id)a4 repeatedSeparator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __149__MKMultiPartAttributedString_TransitFormattedStringExtras___mapkit_multiPartAttributedStringForComposedStrings_defaultAttributes_repeatedSeparator___block_invoke;
    id v22 = &unk_1E54BEEB0;
    id v12 = v11;
    id v23 = v12;
    id v24 = v9;
    id v25 = v8;
    id v13 = v10;
    id v26 = v13;
    [v7 enumerateObjectsUsingBlock:&v19];
    if (objc_msgSend(v13, "count", v19, v20, v21, v22))
    {
      id v14 = [MKMultiPartAttributedString alloc];
      v15 = (void *)[v13 copy];
      v16 = (void *)[v12 copy];
      unint64_t v17 = [(MKMultiPartAttributedString *)v14 initWithComponents:v15 separators:v16];
    }
    else
    {
      unint64_t v17 = 0;
    }
  }
  else
  {
    unint64_t v17 = 0;
  }

  return v17;
}

void __149__MKMultiPartAttributedString_TransitFormattedStringExtras___mapkit_multiPartAttributedStringForComposedStrings_defaultAttributes_repeatedSeparator___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  if (a3) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  id v5 = [[MKServerFormattedString alloc] initWithComposedString:v12];
  id v6 = [(MKServerFormattedString *)v5 multiPartAttributedStringWithAttributes:*(void *)(a1 + 48)];
  id v7 = v6;
  if (v6)
  {
    id v8 = *(void **)(a1 + 56);
    id v9 = [v6 components];
    [v8 addObjectsFromArray:v9];

    id v10 = *(void **)(a1 + 32);
    id v11 = [v7 separators];
    [v10 addObjectsFromArray:v11];
  }
}

@end