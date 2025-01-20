@interface GEOVenueLabel
- (GEOVenueLabel)init;
- (GEOVenueLabel)initWithLabel:(id)a3;
- (GEOVenueLabel)initWithName:(id)a3;
- (GEOVenueLabel)initWithName:(id)a3 shortName:(id)a4 detail:(id)a5;
- (NSString)detail;
- (NSString)name;
- (NSString)shortName;
@end

@implementation GEOVenueLabel

- (GEOVenueLabel)init
{
  result = (GEOVenueLabel *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOVenueLabel)initWithName:(id)a3 shortName:(id)a4 detail:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GEOVenueLabel;
  v12 = [(GEOVenueLabel *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_shortName, a4);
    objc_storeStrong((id *)&v13->_detail, a5);
  }

  return v13;
}

- (GEOVenueLabel)initWithName:(id)a3
{
  return [(GEOVenueLabel *)self initWithName:a3 shortName:0 detail:0];
}

- (GEOVenueLabel)initWithLabel:(id)a3
{
  v4 = (id *)a3;
  -[GEOPDVenueLabel name](v4);
  v5 = (GEOVenueLabel *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[GEOPDVenueLabel name](v4);
    v7 = -[GEOPDVenueLabel nameShort](v4);
    v8 = -[GEOPDVenueLabel detail](v4);
    self = [(GEOVenueLabel *)self initWithName:v6 shortName:v7 detail:v8];

    v5 = self;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_shortName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end