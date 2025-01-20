@interface GEOStorefrontImagery
- (GEOOrientedPosition)position;
- (GEOStorefrontImagery)init;
- (GEOStorefrontImagery)initWithPhotoPosition:(id)a3;
- (NSArray)cameras;
- (double)groundAltitude;
- (unint64_t)identifier;
- (unint64_t)timestamp;
- (unsigned)bucketId;
- (unsigned)buildId;
- (unsigned)dataFormatVersion;
@end

@implementation GEOStorefrontImagery

- (GEOStorefrontImagery)init
{
  result = (GEOStorefrontImagery *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOStorefrontImagery)initWithPhotoPosition:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 hasImdataId] & 1) != 0
    && (([v5 hasPosition] & 1) != 0
     || [v5 hasTilePosition] && objc_msgSend(v5, "hasParentTile")))
  {
    if ([v5 hasBuild])
    {
      if ([v5 hasImageryTimestamp])
      {
        v6 = [v5 build];
        if (v6)
        {
          __int16 v7 = v6[54];

          if ((v7 & 4) != 0)
          {
            v43.receiver = self;
            v43.super_class = (Class)GEOStorefrontImagery;
            v8 = [(GEOStorefrontImagery *)&v43 init];
            if (v8)
            {
              *((void *)v8 + 1) = [v5 imdataId];
              v9 = [v5 build];
              if (v9) {
                int v10 = v9[20];
              }
              else {
                int v10 = 0;
              }
              *((_DWORD *)v8 + 4) = v10;

              v11 = [v5 build];
              if (v11) {
                int v12 = v11[21];
              }
              else {
                int v12 = 0;
              }
              *((_DWORD *)v8 + 22) = v12;

              v13 = [v5 build];
              if (v13) {
                int v14 = v13[19];
              }
              else {
                LOWORD(v14) = 0;
              }
              *((_WORD *)v8 + 10) = v14;

              if ([v5 hasPosition])
              {
                v15 = [v5 position];
                char v16 = GEOOrientedPositionFromPDPosition(v15, (uint64_t)(v8 + 40));

                if ((v16 & 1) == 0)
                {
LABEL_38:
                  v17 = 0;
LABEL_41:
                  self = (GEOStorefrontImagery *)v8;
                  goto LABEL_42;
                }
              }
              else
              {
                if (![v5 hasTilePosition]) {
                  goto LABEL_38;
                }
                v18 = [v5 tilePosition];
                v19 = [v5 parentTile];
                char v20 = GEOOrientedPositionFromPDTilePosition(v18, v19, (uint64_t)(v8 + 40));

                if ((v20 & 1) == 0) {
                  goto LABEL_38;
                }
              }
              uint64_t v21 = *((void *)v8 + 7);
              long long v39 = *(_OWORD *)(v8 + 40);
              uint64_t v40 = v21;
              uint64_t v22 = objc_msgSend(v5, "build", geo::Geocentric<double>::toCoordinate3D<geo::Degrees,double>((double *)&v39, &v41));
              v23 = (void *)v22;
              double v24 = 3.0;
              if (v22 && (*(_WORD *)(v22 + 108) & 0x10) != 0)
              {
                v25 = [v5 build];
                if (v25) {
                  double v24 = v25[23];
                }
                else {
                  double v24 = 0.0;
                }
              }
              *((double *)v8 + 4) = v42 - v24;
              *((void *)v8 + 3) = [v5 imageryTimestamp];
              v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "cameraMetadatasCount"));
              long long v37 = 0u;
              long long v38 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              v27 = objc_msgSend(v5, "cameraMetadatas", 0);
              uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v44 count:16];
              if (v28)
              {
                uint64_t v29 = *(void *)v36;
                while (2)
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v36 != v29) {
                      objc_enumerationMutation(v27);
                    }
                    v31 = [[GEOStorefrontCamera alloc] initWithCameraMetadata:*(void *)(*((void *)&v35 + 1) + 8 * i)];
                    if (!v31)
                    {

                      v17 = 0;
                      goto LABEL_40;
                    }
                    [v26 addObject:v31];
                  }
                  uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v44 count:16];
                  if (v28) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v32 = [v26 copy];
              v33 = (void *)*((void *)v8 + 10);
              *((void *)v8 + 10) = v32;

              v17 = v8;
LABEL_40:

              goto LABEL_41;
            }
            self = 0;
          }
        }
      }
    }
  }
  v17 = 0;
LABEL_42:

  return v17;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unsigned)buildId
{
  return self->_buildId;
}

- (unsigned)bucketId
{
  return self->_bucketId;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (double)groundAltitude
{
  return self->_groundAltitude;
}

- (GEOOrientedPosition)position
{
  long long v3 = *(_OWORD *)&self[1].position.z;
  *(_OWORD *)&retstr->position.x = *(_OWORD *)&self[1].position.x;
  *(_OWORD *)&retstr->position.z = v3;
  *(void *)&retstr->roll = *(void *)&self[1].roll;
  return self;
}

- (NSArray)cameras
{
  return self->_cameras;
}

- (unsigned)dataFormatVersion
{
  return self->_dataFormatVersion;
}

- (void).cxx_destruct
{
}

@end