@interface GEOFactoid
- (BOOL)canBeDisplayedInPlaceSummary;
- (BOOL)shouldUseStructuredData;
- (GEOColor)color;
- (GEOFactoid)initWithFactoid:(id)a3;
- (GEOMapItemIdentifier)placeIdentifier;
- (NSString)description;
- (NSString)symbolName;
- (NSString)title;
- (NSString)unstructuredValue;
- (double)value;
- (int)semantic;
- (int)unitType;
@end

@implementation GEOFactoid

- (GEOFactoid)initWithFactoid:(id)a3
{
  v5 = a3;
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    if (v5[56])
    {
      BOOL v7 = 0;
    }
    else
    {
      -[GEOPDFactoid _readText]((uint64_t)v5);
      BOOL v7 = *(void *)(v6 + 72) == 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }
  v8 = -[GEOPDFactoid placeNames]((id *)v6);
  uint64_t v9 = [v8 count];

  v10 = 0;
  if (v9) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v7;
  }
  if (v6 && !v11)
  {
    -[GEOPDFactoid _readTitle](v6);
    if (*(void *)(v6 + 80))
    {
      v15.receiver = self;
      v15.super_class = (Class)GEOFactoid;
      v12 = [(GEOFactoid *)&v15 init];
      v13 = v12;
      if (v12) {
        objc_storeStrong((id *)&v12->_factoid, a3);
      }
      self = v13;
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)title
{
  return -[GEOPDFactoid title]((id *)&self->_factoid->super.super.isa);
}

- (double)value
{
  factoid = self->_factoid;
  if (factoid && (*(_WORD *)&factoid->_flags & 1) != 0) {
    return factoid->_number;
  }
  else {
    return 1.79769313e308;
  }
}

- (GEOMapItemIdentifier)placeIdentifier
{
  v3 = [GEOMapItemIdentifier alloc];
  v4 = -[GEOPDFactoid placeId]((id *)&self->_factoid->super.super.isa);
  v5 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v4];

  return v5;
}

- (NSString)unstructuredValue
{
  v3 = -[GEOPDFactoid text]((id *)&self->_factoid->super.super.isa);
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(GEOPDFactoid *)self->_factoid bestLocalizedPlaceName];
  }
  v5 = v4;

  return (NSString *)v5;
}

- (int)semantic
{
  int result = -[GEOPDFactoid entryType]((uint64_t)self->_factoid);
  if ((result - 1) >= 5) {
    return 0;
  }
  return result;
}

- (int)unitType
{
  unsigned int v2 = -[GEOPDFactoid unit]((uint64_t)self->_factoid) - 1;
  if (v2 > 7) {
    return 0;
  }
  else {
    return dword_18A633590[v2];
  }
}

- (NSString)symbolName
{
  return -[GEOPDFactoid icon]((id *)&self->_factoid->super.super.isa);
}

- (BOOL)shouldUseStructuredData
{
  [(GEOFactoid *)self value];
  return v2 != 1.79769313e308;
}

- (BOOL)canBeDisplayedInPlaceSummary
{
  factoid = self->_factoid;
  return factoid && factoid->_canBeDisplayedInPlaceSummary;
}

- (GEOColor)color
{
  v3 = -[GEOPDFactoid color]((id *)&self->_factoid->super.super.isa);

  if (v3)
  {
    id v4 = [GEOColor alloc];
    v5 = -[GEOPDFactoid color]((id *)&self->_factoid->super.super.isa);
    uint64_t v6 = [(GEOColor *)v4 initWithColor:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(GEOPDFactoid *)self->_factoid description];
}

- (void).cxx_destruct
{
}

@end