@interface GEOResultRefinementTime
- (BOOL)isNextDay;
- (BOOL)isSelected;
- (GEOPDResultRefinementMetadata)metadata;
- (GEOResultRefinementTime)initWithDisplayName:(id)a3 timeStamp:(double)a4 metadata:(id)a5 isSelected:(BOOL)a6 isNextDay:(BOOL)a7;
- (GEOResultRefinementTime)initWithResultRefinementTime:(id)a3;
- (NSString)displayName;
- (double)timeStamp;
- (id)convertToGEOPDResultRefinementTime;
@end

@implementation GEOResultRefinementTime

- (GEOResultRefinementTime)initWithDisplayName:(id)a3 timeStamp:(double)a4 metadata:(id)a5 isSelected:(BOOL)a6 isNextDay:(BOOL)a7
{
  id v13 = a3;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)GEOResultRefinementTime;
  v15 = [(GEOResultRefinementTime *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayName, a3);
    v16->_timeStamp = a4;
    objc_storeStrong((id *)&v16->_metadata, a5);
    v16->_isSelected = a6;
    v16->_isNextDay = a7;
  }

  return v16;
}

- (GEOResultRefinementTime)initWithResultRefinementTime:(id)a3
{
  id v4 = a3;
  v5 = -[GEOPDResultRefinementTime displayName]((id *)v4);
  if (v4)
  {
    double v6 = *((double *)v4 + 5);
    v7 = -[GEOPDResultRefinementTime metadata]((id *)v4);
    BOOL v8 = *((unsigned char *)v4 + 60) != 0;
    BOOL v9 = *((unsigned char *)v4 + 61) != 0;
  }
  else
  {
    v7 = -[GEOPDResultRefinementTime metadata](0);
    BOOL v8 = 0;
    BOOL v9 = 0;
    double v6 = 0.0;
  }

  v10 = [(GEOResultRefinementTime *)self initWithDisplayName:v5 timeStamp:v7 metadata:v8 isSelected:v9 isNextDay:v6];
  return v10;
}

- (id)convertToGEOPDResultRefinementTime
{
  v3 = objc_alloc_init(GEOPDResultRefinementTime);
  BOOL v4 = [(GEOResultRefinementTime *)self isSelected];
  if (v3)
  {
    *(unsigned char *)&v3->_flags |= 0x40u;
    *(unsigned char *)&v3->_flags |= 2u;
    v3->_isSelected = v4;
  }
  v5 = [(GEOResultRefinementTime *)self displayName];
  -[GEOPDResultRefinementTime setDisplayName:]((uint64_t)v3, v5);

  double v6 = [(GEOResultRefinementTime *)self metadata];
  -[GEOPDResultRefinementTime setMetadata:]((uint64_t)v3, v6);

  [(GEOResultRefinementTime *)self timeStamp];
  if (v3)
  {
    *(unsigned char *)&v3->_flags |= 0x40u;
    *(unsigned char *)&v3->_flags |= 1u;
    v3->_timestamp = v7;
    BOOL v8 = [(GEOResultRefinementTime *)self isNextDay];
    *(unsigned char *)&v3->_flags |= 0x40u;
    *(unsigned char *)&v3->_flags |= 4u;
    v3->_usedNextDayForFilteration = v8;
  }
  else
  {
    [(GEOResultRefinementTime *)self isNextDay];
  }

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (GEOPDResultRefinementMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (BOOL)isNextDay
{
  return self->_isNextDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end