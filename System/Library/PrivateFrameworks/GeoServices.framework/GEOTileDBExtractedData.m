@interface GEOTileDBExtractedData
- (GEOTileDBExtractedData)initWithData:(id)a3;
- (GEOTileDBExtractedData)initWithData:(id)a3 externalResourceUUID:(id)a4;
- (GEOTileData)data;
- (NSUUID)externalResourceUUID;
@end

@implementation GEOTileDBExtractedData

- (GEOTileDBExtractedData)initWithData:(id)a3 externalResourceUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOTileDBExtractedData;
  v9 = [(GEOTileDBExtractedData *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_externalResourceUUID, a4);
    v11 = v10;
  }

  return v10;
}

- (GEOTileDBExtractedData)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOTileDBExtractedData;
  v6 = [(GEOTileDBExtractedData *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    id v8 = v7;
  }

  return v7;
}

- (NSUUID)externalResourceUUID
{
  return self->_externalResourceUUID;
}

- (GEOTileData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_externalResourceUUID, 0);
}

@end