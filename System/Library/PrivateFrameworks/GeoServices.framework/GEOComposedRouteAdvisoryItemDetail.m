@interface GEOComposedRouteAdvisoryItemDetail
+ (BOOL)supportsSecureCoding;
- (GEOComposedRouteAdvisoryItemDetail)initWithCoder:(id)a3;
- (GEOComposedRouteAdvisoryItemDetail)initWithRestrictionDetails:(id)a3;
- (GEOComposedString)titleString;
- (GEOServerFormattedString)title;
- (NSArray)detailStrings;
- (NSArray)details;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteAdvisoryItemDetail

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteAdvisoryItemDetail)initWithRestrictionDetails:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)GEOComposedRouteAdvisoryItemDetail;
    v5 = [(GEOComposedRouteAdvisoryItemDetail *)&v21 init];
    if (v5)
    {
      v6 = [v4 title];
      uint64_t v7 = [v6 copy];
      title = v5->_title;
      v5->_title = (GEOServerFormattedString *)v7;

      v9 = [GEOComposedString alloc];
      v10 = [v4 title];
      uint64_t v11 = [(GEOComposedString *)v9 initWithGeoFormattedString:v10];
      titleString = v5->_titleString;
      v5->_titleString = (GEOComposedString *)v11;

      v13 = [v4 messageStrings];
      uint64_t v14 = [v13 copy];
      details = v5->_details;
      v5->_details = (NSArray *)v14;

      v16 = [v4 messageStrings];
      uint64_t v17 = objc_msgSend(v16, "_geo_map:", &__block_literal_global_23);
      detailStrings = v5->_detailStrings;
      v5->_detailStrings = (NSArray *)v17;
    }
    self = v5;
    v19 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: restrictionDetails", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

GEOComposedString *__65__GEOComposedRouteAdvisoryItemDetail_initWithRestrictionDetails___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOComposedString alloc] initWithGeoFormattedString:v2];

  return v3;
}

- (GEOComposedRouteAdvisoryItemDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedRouteAdvisoryItemDetail;
  v5 = [(GEOComposedRouteAdvisoryItemDetail *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (GEOServerFormattedString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_titleString"];
    titleString = v5->_titleString;
    v5->_titleString = (GEOComposedString *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_details"];
    details = v5->_details;
    v5->_details = (NSArray *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_detailStrings"];
    detailStrings = v5->_detailStrings;
    v5->_detailStrings = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"_title"];
  [v5 encodeObject:self->_titleString forKey:@"_titleString"];
  [v5 encodeObject:self->_details forKey:@"_details"];
  [v5 encodeObject:self->_detailStrings forKey:@"_detailStrings"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_title);
  uint64_t v5 = [(GEOComposedString *)self->_titleString copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSArray *)self->_details copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_detailStrings copyItems:1];
  uint64_t v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  return (id)v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@ title: %@\ndetails: %@", v5, self->_titleString, self->_detailStrings];

  return v6;
}

- (GEOServerFormattedString)title
{
  return self->_title;
}

- (GEOComposedString)titleString
{
  return self->_titleString;
}

- (NSArray)details
{
  return self->_details;
}

- (NSArray)detailStrings
{
  return self->_detailStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailStrings, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_titleString, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end