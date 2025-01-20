@interface GEOEnhancedPlacement
- (GEOEnhancedPlacement)initWithBuildingIds:(id)a3 elevationInMeters:(id)a4 buildingHeightInMeters:(id)a5 buildingFaceAzimuth:(id)a6;
- (GEOEnhancedPlacement)initWithGEOPDEnhancedPlacement:(id)a3;
- (NSArray)buildingIds;
- (NSNumber)buildingFaceAzimuth;
- (NSNumber)buildingHeightInMeters;
- (NSNumber)elevationInMeters;
@end

@implementation GEOEnhancedPlacement

- (GEOEnhancedPlacement)initWithBuildingIds:(id)a3 elevationInMeters:(id)a4 buildingHeightInMeters:(id)a5 buildingFaceAzimuth:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GEOEnhancedPlacement;
  v14 = [(GEOEnhancedPlacement *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    buildingIds = v14->_buildingIds;
    v14->_buildingIds = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_elevationInMeters, a4);
    objc_storeStrong((id *)&v14->_buildingHeightInMeters, a5);
    objc_storeStrong((id *)&v14->_buildingFaceAzimuth, a6);
  }

  return v14;
}

- (GEOEnhancedPlacement)initWithGEOPDEnhancedPlacement:(id)a3
{
  v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (!v4)
  {
    v6 = (void *)[v5 initWithCapacity:0];
    v9 = (void *)[v6 copy];
    v16 = [(GEOEnhancedPlacement *)self initWithBuildingIds:v9 elevationInMeters:0 buildingHeightInMeters:0 buildingFaceAzimuth:0];
    goto LABEL_12;
  }
  v6 = (void *)[v5 initWithCapacity:v4[3]];
  if (v4[3])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[GEOPDEnhancedPlacement buildingIdAtIndex:]((uint64_t)v4, v7));
      [v6 addObject:v8];

      ++v7;
    }
    while (v7 < v4[3]);
  }
  v9 = (void *)[v6 copy];
  char v11 = *((unsigned char *)v4 + 56);
  if (v11)
  {
    id v12 = [NSNumber numberWithDouble:*((double *)v4 + 5)];
    char v13 = *((unsigned char *)v4 + 56);
    if ((v13 & 4) != 0)
    {
LABEL_7:
      LODWORD(v10) = *((_DWORD *)v4 + 13);
      v14 = [NSNumber numberWithFloat:v10];
      if ((v4[7] & 2) != 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else
  {
    id v12 = 0;
    char v13 = *((unsigned char *)v4 + 56);
    if ((v13 & 4) != 0) {
      goto LABEL_7;
    }
  }
  v14 = 0;
  if ((v13 & 2) != 0)
  {
LABEL_8:
    LODWORD(v10) = *((_DWORD *)v4 + 12);
    uint64_t v15 = [NSNumber numberWithFloat:v10];
    v16 = [(GEOEnhancedPlacement *)self initWithBuildingIds:v9 elevationInMeters:v12 buildingHeightInMeters:v14 buildingFaceAzimuth:v15];

    if ((v13 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  v16 = [(GEOEnhancedPlacement *)self initWithBuildingIds:v9 elevationInMeters:v12 buildingHeightInMeters:v14 buildingFaceAzimuth:0];
  if ((v13 & 4) != 0) {
LABEL_9:
  }

LABEL_10:
  if (v11) {

  }
LABEL_12:
  return v16;
}

- (NSArray)buildingIds
{
  return self->_buildingIds;
}

- (NSNumber)elevationInMeters
{
  return self->_elevationInMeters;
}

- (NSNumber)buildingHeightInMeters
{
  return self->_buildingHeightInMeters;
}

- (NSNumber)buildingFaceAzimuth
{
  return self->_buildingFaceAzimuth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildingFaceAzimuth, 0);
  objc_storeStrong((id *)&self->_buildingHeightInMeters, 0);
  objc_storeStrong((id *)&self->_elevationInMeters, 0);

  objc_storeStrong((id *)&self->_buildingIds, 0);
}

@end