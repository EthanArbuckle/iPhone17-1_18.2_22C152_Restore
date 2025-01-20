@interface GEOSpotlightSearchPunchIn
- (GEOSpotlightSearchPunchIn)initWithEncodedString:(id)a3;
- (NSString)completedSearchQuery;
- (NSString)originalSearchQuery;
- (NSString)spotlightEncodedString;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation GEOSpotlightSearchPunchIn

- (GEOSpotlightSearchPunchIn)initWithEncodedString:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOSpotlightSearchPunchIn;
  v6 = [(GEOSpotlightSearchPunchIn *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spotlightEncodedString, a3);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:0];
    v9 = [[GEOPDSPunchInHints alloc] initWithData:v8];
    punchInHints = v7->_punchInHints;
    v7->_punchInHints = v9;
  }
  return v7;
}

- (NSString)originalSearchQuery
{
  -[GEOPDSPunchInHints queryHints]((id *)&self->_punchInHints->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOPDSPunchInQueryHints originalSearchQuery](v2);

  return (NSString *)v3;
}

- (NSString)completedSearchQuery
{
  -[GEOPDSPunchInHints queryHints]((id *)&self->_punchInHints->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOPDSPunchInQueryHints completedSearchQuery](v2);

  return (NSString *)v3;
}

- (NSString)spotlightEncodedString
{
  return self->_spotlightEncodedString;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_spotlightEncodedString copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(GEOPDSPunchInHints *)self->_punchInHints copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightEncodedString, 0);

  objc_storeStrong((id *)&self->_punchInHints, 0);
}

@end