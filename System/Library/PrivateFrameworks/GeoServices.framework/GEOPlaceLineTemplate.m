@interface GEOPlaceLineTemplate
+ (BOOL)isDataItemValid:(id)a3;
- (GEOBusinessHours)businessHours;
- (GEOFactoid)factoid;
- (GEOPlaceLineTemplate)initWithDataItem:(id)a3 timeZone:(id)a4 attributionMap:(id)a5;
- (GEORatingSummary)ratingSummary;
- (NSString)categoryName;
- (NSString)locationName;
- (int)type;
@end

@implementation GEOPlaceLineTemplate

+ (BOOL)isDataItemValid:(id)a3
{
  v3 = (char *)a3;
  switch(-[GEOPDDataItem type]((uint64_t)v3))
  {
    case 1u:
      if (!v3) {
        goto LABEL_14;
      }
      -[GEOPDDataItem _readRatingData]((uint64_t)v3);
      v4 = &OBJC_IVAR___GEOPDDataItem__ratingData;
      goto LABEL_12;
    case 2u:
      if (!v3) {
        goto LABEL_14;
      }
      -[GEOPDDataItem _readCategoryData]((uint64_t)v3);
      v4 = &OBJC_IVAR___GEOPDDataItem__categoryData;
      goto LABEL_12;
    case 3u:
      if (!v3) {
        goto LABEL_14;
      }
      -[GEOPDDataItem _readFactoidData]((uint64_t)v3);
      v4 = &OBJC_IVAR___GEOPDDataItem__factoidData;
      goto LABEL_12;
    case 4u:
      if (!v3) {
        goto LABEL_14;
      }
      -[GEOPDDataItem _readBusinessHoursData]((uint64_t)v3);
      v4 = &OBJC_IVAR___GEOPDDataItem__businessHoursData;
      goto LABEL_12;
    case 5u:
      if (!v3) {
        goto LABEL_14;
      }
      -[GEOPDDataItem _readLocationData]((uint64_t)v3);
      v4 = &OBJC_IVAR___GEOPDDataItem__locationData;
LABEL_12:
      BOOL v5 = *(void *)&v3[*v4] != 0;
      break;
    default:
LABEL_14:
      BOOL v5 = 0;
      break;
  }

  return v5;
}

- (GEOPlaceLineTemplate)initWithDataItem:(id)a3 timeZone:(id)a4 attributionMap:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (+[GEOPlaceLineTemplate isDataItemValid:v9])
  {
    v16.receiver = self;
    v16.super_class = (Class)GEOPlaceLineTemplate;
    v12 = [(GEOPlaceLineTemplate *)&v16 init];
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_attributionMap, a5);
      objc_storeStrong(p_isa + 1, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (GEOBusinessHours)businessHours
{
  v3 = [GEOBusinessHours alloc];
  -[GEOPDDataItem businessHoursData]((id *)&self->_dataItem->super.super.isa);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = -[GEOPDBusinessHoursData businessHours](v4);
  v6 = [(GEOBusinessHours *)v3 initWithGEOPDBusinessHours:v5 timeZone:self->_timeZone];

  return v6;
}

- (NSString)categoryName
{
  return (NSString *)[(GEOPDDataItem *)self->_dataItem categoryName];
}

- (GEOFactoid)factoid
{
  v3 = [GEOFactoid alloc];
  -[GEOPDDataItem factoidData]((id *)&self->_dataItem->super.super.isa);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = -[GEOPDFactoidData factoid](v4);
  v6 = [(GEOFactoid *)v3 initWithFactoid:v5];

  return v6;
}

- (NSString)locationName
{
  return (NSString *)[(GEOPDDataItem *)self->_dataItem locationName];
}

- (GEORatingSummary)ratingSummary
{
  v3 = [GEORatingSummary alloc];
  v4 = -[GEOPDDataItem ratingData]((id *)&self->_dataItem->super.super.isa);
  BOOL v5 = [(GEORatingSummary *)v3 initWithRatingData:v4 attributionMap:self->_attributionMap];

  return v5;
}

- (int)type
{
  unsigned int v2 = -[GEOPDDataItem type]((uint64_t)self->_dataItem) - 1;
  if (v2 > 5) {
    return 0;
  }
  else {
    return dword_18A640C50[v2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_dataItem, 0);
}

@end