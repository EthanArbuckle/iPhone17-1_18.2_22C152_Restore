@interface GEOSearchSection
- (GEOSearchSection)init;
- (GEOSearchSection)initWithName:(id)a3 sectionType:(int64_t)a4 sectionGuide:(id)a5 sectionPlace:(id)a6;
- (GEOSearchSection)initWithSearchSection:(id)a3 mapsResults:(id)a4;
- (GEOSearchSectionGuide)sectionGuide;
- (GEOSearchSectionPlace)sectionPlace;
- (NSString)name;
- (int64_t)sectionType;
@end

@implementation GEOSearchSection

- (GEOSearchSection)init
{
  result = (GEOSearchSection *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSearchSection)initWithName:(id)a3 sectionType:(int64_t)a4 sectionGuide:(id)a5 sectionPlace:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4)
  {
    v18.receiver = self;
    v18.super_class = (Class)GEOSearchSection;
    v14 = [(GEOSearchSection *)&v18 init];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_name, a3);
      v15->_sectionType = a4;
      objc_storeStrong((id *)&v15->_sectionGuide, a5);
      objc_storeStrong((id *)&v15->_sectionPlace, a6);
    }
    self = v15;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (GEOSearchSection)initWithSearchSection:(id)a3 mapsResults:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  v8 = -[GEOPDSearchSection name](v6);
  int v9 = -[GEOPDSearchSection sectionType]((uint64_t)v6);
  if (v6)
  {
    -[GEOPDSearchSection _readSectionGuide]((uint64_t)v6);
    if (v6[4])
    {
      v10 = [GEOSearchSectionGuide alloc];
      id v11 = -[GEOPDSearchSection sectionGuide](v6);
      id v12 = [(GEOSearchSectionGuide *)v10 initWithSearchSectionGuide:v11 mapsResults:v7];
    }
    else
    {
      id v12 = 0;
    }
    -[GEOPDSearchSection _readSectionPlace]((uint64_t)v6);
    if (v6[5])
    {
      id v13 = [GEOSearchSectionPlace alloc];
      v14 = -[GEOPDSearchSection sectionPlace](v6);
      v15 = [(GEOSearchSectionPlace *)v13 initWithSearchSectionPlace:v14];

      goto LABEL_9;
    }
  }
  else
  {
    id v12 = 0;
  }
  v15 = 0;
LABEL_9:
  if (v9 == 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2 * (v9 == 2);
  }
  v17 = [(GEOSearchSection *)self initWithName:v8 sectionType:v16 sectionGuide:v12 sectionPlace:v15];

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (GEOSearchSectionGuide)sectionGuide
{
  return self->_sectionGuide;
}

- (GEOSearchSectionPlace)sectionPlace
{
  return self->_sectionPlace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionPlace, 0);
  objc_storeStrong((id *)&self->_sectionGuide, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end