@interface NPNameComponentsData
- (BOOL)collectionForEntry:(unint64_t)a3 contains:(id)a4;
- (NPNameComponentsData)init;
- (id)_keyForDataEntry:(unint64_t)a3;
- (id)objectValueForEntry:(unint64_t)a3;
@end

@implementation NPNameComponentsData

- (NPNameComponentsData)init
{
  v12.receiver = self;
  v12.super_class = (Class)NPNameComponentsData;
  v2 = [(NPNameComponentsData *)&v12 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4E70970]();
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 pathForResource:@"name_components_data" ofType:@"plist"];

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:1 error:0];
    if (!v6)
    {

      v10 = 0;
      goto LABEL_6;
    }
    v7 = (void *)v6;
    uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:0];
    nameComponents = v2->_nameComponents;
    v2->_nameComponents = (NSDictionary *)v8;
  }
  v10 = v2;
LABEL_6:

  return v10;
}

- (id)_keyForDataEntry:(unint64_t)a3
{
  if (a3 > 8) {
    return 0;
  }
  else {
    return off_1E6E1CAA8[a3];
  }
}

- (id)objectValueForEntry:(unint64_t)a3
{
  v4 = [(NPNameComponentsData *)self _keyForDataEntry:a3];
  if (v4)
  {
    v5 = [(NSDictionary *)self->_nameComponents objectForKeyedSubscript:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)collectionForEntry:(unint64_t)a3 contains:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = [(NPNameComponentsData *)self objectValueForEntry:a3];
    objc_opt_class();
    BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v7, "count"), 256, &__block_literal_global) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __52__NPNameComponentsData_collectionForEntry_contains___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:");
}

- (void).cxx_destruct
{
}

@end