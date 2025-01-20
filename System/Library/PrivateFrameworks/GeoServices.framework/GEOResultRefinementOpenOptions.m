@interface GEOResultRefinementOpenOptions
- (GEOResultRefinementOpenOptions)initWithDisplayName:(id)a3 openNow:(id)a4 openAt:(id)a5;
- (GEOResultRefinementOpenOptions)initWithOpenOptions:(id)a3;
- (GEOResultRefinementTime)openAt;
- (GEOResultRefinementToggle)openNow;
- (NSNumber)selectionSequenceNumber;
- (NSString)displayName;
- (id)convertToGEOPDResultRefinementOpenOptions;
- (void)setDisplayName:(id)a3;
- (void)setOpenAt:(id)a3;
- (void)setOpenNow:(id)a3;
@end

@implementation GEOResultRefinementOpenOptions

- (GEOResultRefinementOpenOptions)initWithOpenOptions:(id)a3
{
  v4 = (id *)a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOResultRefinementOpenOptions;
  v5 = [(GEOResultRefinementOpenOptions *)&v17 init];
  if (v5)
  {
    v6 = [GEOResultRefinementTime alloc];
    v7 = -[GEOPDResultRefinementOpenOptions openAt](v4);
    uint64_t v8 = [(GEOResultRefinementTime *)v6 initWithResultRefinementTime:v7];
    openAt = v5->_openAt;
    v5->_openAt = (GEOResultRefinementTime *)v8;

    v10 = [GEOResultRefinementToggle alloc];
    v11 = -[GEOPDResultRefinementOpenOptions openNow](v4);
    uint64_t v12 = [(GEOResultRefinementToggle *)v10 initWithResultRefinementToggle:v11];
    openNow = v5->_openNow;
    v5->_openNow = (GEOResultRefinementToggle *)v12;

    uint64_t v14 = -[GEOPDResultRefinementOpenOptions displayName](v4);
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v14;
  }
  return v5;
}

- (GEOResultRefinementOpenOptions)initWithDisplayName:(id)a3 openNow:(id)a4 openAt:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GEOResultRefinementOpenOptions;
  v11 = [(GEOResultRefinementOpenOptions *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_openAt, a5);
    objc_storeStrong((id *)&v12->_openNow, a4);
    uint64_t v13 = [v8 copy];
    displayName = v12->_displayName;
    v12->_displayName = (NSString *)v13;
  }
  return v12;
}

- (id)convertToGEOPDResultRefinementOpenOptions
{
  v3 = objc_alloc_init(GEOPDResultRefinementOpenOptions);
  v4 = [(GEOResultRefinementOpenOptions *)self displayName];
  -[GEOPDResultRefinementOpenOptions setDisplayName:]((uint64_t)v3, v4);

  v5 = [(GEOResultRefinementOpenOptions *)self openAt];
  v6 = [v5 convertToGEOPDResultRefinementTime];
  -[GEOPDResultRefinementOpenOptions setOpenAt:]((uint64_t)v3, v6);

  v7 = [(GEOResultRefinementOpenOptions *)self openNow];
  id v8 = [v7 convertToGEOPDResultRefinementToggle];
  -[GEOPDResultRefinementOpenOptions setOpenNow:]((uint64_t)v3, v8);

  return v3;
}

- (GEOResultRefinementTime)openAt
{
  return self->_openAt;
}

- (void)setOpenAt:(id)a3
{
}

- (GEOResultRefinementToggle)openNow
{
  return self->_openNow;
}

- (void)setOpenNow:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_openNow, 0);

  objc_storeStrong((id *)&self->_openAt, 0);
}

@end