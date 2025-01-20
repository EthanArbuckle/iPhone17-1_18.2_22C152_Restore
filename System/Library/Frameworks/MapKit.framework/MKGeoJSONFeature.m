@interface MKGeoJSONFeature
- (NSArray)geometry;
- (NSData)properties;
- (NSString)identifier;
- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4;
- (id)_initWithProperties:(id)a3 geometry:(id)a4 identifier:(id)a5;
@end

@implementation MKGeoJSONFeature

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"type"];
    uint64_t v8 = _geoJSONObjectType((uint64_t)v7);

    if (v8 == 8)
    {
      v9 = [v6 objectForKeyedSubscript:@"geometry"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = +[MKGeoJSONDecoder _decodeGeometry:v9 error:a4];
        if (v10)
        {
LABEL_13:
          uint64_t v13 = [v6 objectForKeyedSubscript:@"properties"];
          if (!v13)
          {
            if (a4)
            {
              _errorWithReason(@"GeoJSON Feature objects must have a member with the name \"properties\"");
              v12 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v12 = 0;
            }
            goto LABEL_34;
          }
          v14 = (void *)v13;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {

            v14 = 0;
            v15 = 0;
          }
          else
          {
            uint64_t v17 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v14 options:4 error:a4];
            if (!v17)
            {
              v12 = 0;
              goto LABEL_33;
            }
            v15 = (void *)v17;
          }
          v18 = [v6 objectForKeyedSubscript:@"id"];
          if (v18)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = v18;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  _errorWithReason(@"Feature 'id' has invalid type");
                  v20 = 0;
                  v12 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v20 = 0;
                  v12 = 0;
                }
                goto LABEL_32;
              }
              id v19 = [v18 stringValue];
            }
            v20 = v19;
          }
          else
          {
            v20 = 0;
          }
          self = (MKGeoJSONFeature *)[(MKGeoJSONFeature *)self _initWithProperties:v15 geometry:v10 identifier:v20];
          v12 = self;
LABEL_32:

LABEL_33:
LABEL_34:

          goto LABEL_35;
        }
      }
      else if (a4)
      {
        if (v9) {
          v16 = @"Feature object has invalid geometry";
        }
        else {
          v16 = @"Feature object is missing geometry";
        }
        _errorWithReason(v16);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      v12 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if (a4)
    {
      v11 = @"Input is not a Feature GeoJSON object";
      goto LABEL_9;
    }
LABEL_10:
    v12 = 0;
    goto LABEL_36;
  }
  if (!a4) {
    goto LABEL_10;
  }
  v11 = @"Feature object must be a dictionary";
LABEL_9:
  _errorWithReason(v11);
  v12 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v12;
}

- (id)_initWithProperties:(id)a3 geometry:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MKGeoJSONFeature;
  v12 = [(MKGeoJSONFeature *)&v18 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_properties, a3);
    uint64_t v14 = [v10 copy];
    geometry = v13->_geometry;
    v13->_geometry = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_identifier, a5);
    v16 = v13;
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)properties
{
  return self->_properties;
}

- (NSArray)geometry
{
  return self->_geometry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end