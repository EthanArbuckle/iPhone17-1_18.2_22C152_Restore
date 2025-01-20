@interface _AAUIDataclassOptionCache
+ (BOOL)_hasPrescriptionEnrollment;
- (NSArray)filteredDataclasses;
- (NSDictionary)dataclassDetails;
- (NSDictionary)dataclassOptions;
- (_AAUIDataclassOptionCache)initWithDataclassOptions:(id)a3;
- (void)setDataclassDetails:(id)a3;
- (void)setDataclassOptions:(id)a3;
- (void)setFilteredDataclasses:(id)a3;
@end

@implementation _AAUIDataclassOptionCache

- (_AAUIDataclassOptionCache)initWithDataclassOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AAUIDataclassOptionCache;
  v5 = [(_AAUIDataclassOptionCache *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dataclassOptions = v5->_dataclassOptions;
    v5->_dataclassOptions = (NSDictionary *)v6;
  }
  return v5;
}

- (void)setDataclassOptions:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  dataclassOptions = self->_dataclassOptions;
  self->_dataclassOptions = v4;

  filteredDataclasses = self->_filteredDataclasses;
  self->_filteredDataclasses = 0;
}

- (NSArray)filteredDataclasses
{
  filteredDataclasses = self->_filteredDataclasses;
  if (!filteredDataclasses)
  {
    id v4 = [(NSDictionary *)self->_dataclassOptions aaf_filter:&__block_literal_global_12];
    v5 = [v4 allKeys];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48___AAUIDataclassOptionCache_filteredDataclasses__block_invoke_2;
    v9[3] = &unk_263F935E0;
    v9[4] = self;
    uint64_t v6 = [v5 sortedArrayUsingComparator:v9];
    v7 = self->_filteredDataclasses;
    self->_filteredDataclasses = v6;

    filteredDataclasses = self->_filteredDataclasses;
  }
  return filteredDataclasses;
}

- (NSDictionary)dataclassDetails
{
  v14[1] = *MEMORY[0x263EF8340];
  if (!self->_dataclassDetails)
  {
    uint64_t v5 = *MEMORY[0x263EFAC90];
    uint64_t v6 = [(NSDictionary *)self->_dataclassOptions objectForKeyedSubscript:*MEMORY[0x263EFAC90]];
    if (v6)
    {
      v7 = (void *)v6;
      BOOL v8 = +[_AAUIDataclassOptionCache _hasPrescriptionEnrollment];

      if (v8)
      {
        uint64_t v13 = v5;
        objc_super v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v10 = [v9 localizedStringForKey:@"SIGN_OUT_HEALTH_ROW_DETAIL_TEXT" value:&stru_26BD39CD8 table:@"Localizable"];
        v14[0] = v10;
        v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
        dataclassDetails = self->_dataclassDetails;
        self->_dataclassDetails = v11;
      }
    }
  }
  v3 = self->_dataclassDetails;
  return v3;
}

+ (BOOL)_hasPrescriptionEnrollment
{
  if (_hasPrescriptionEnrollment_onceToken != -1) {
    dispatch_once(&_hasPrescriptionEnrollment_onceToken, &__block_literal_global_49);
  }
  return 0;
}

- (NSDictionary)dataclassOptions
{
  return self->_dataclassOptions;
}

- (void)setFilteredDataclasses:(id)a3
{
}

- (void)setDataclassDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclassDetails, 0);
  objc_storeStrong((id *)&self->_filteredDataclasses, 0);
  objc_storeStrong((id *)&self->_dataclassOptions, 0);
}

@end