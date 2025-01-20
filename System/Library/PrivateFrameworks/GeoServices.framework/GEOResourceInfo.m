@interface GEOResourceInfo
- (BOOL)shouldCheckForUpdateForResourceAtPath:(id)a3 useExtendedAttrs:(BOOL)a4 forceUpdateCheck:(BOOL)a5 log:(id)a6;
- (BOOL)validateResource:(id)a3 log:(id)a4;
- (BOOL)validateResourceAtPath:(id)a3 useExtendedAttrs:(BOOL)a4 log:(id)a5;
- (GEOResource)resource;
- (GEOResourceInfo)initWithResource:(id)a3;
- (NSArray)equivalentResources;
- (NSData)checksum;
- (NSString)eTag;
- (NSString)name;
- (id)description;
- (int)type;
- (int)validationMethod;
- (void)setETag:(id)a3;
- (void)setEquivalentResources:(id)a3;
@end

@implementation GEOResourceInfo

- (GEOResource)resource
{
  return self->_resource;
}

- (NSString)name
{
  return [(GEOResource *)self->_resource filename];
}

- (BOOL)shouldCheckForUpdateForResourceAtPath:(id)a3 useExtendedAttrs:(BOOL)a4 forceUpdateCheck:(BOOL)a5 log:(id)a6
{
  BOOL v8 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  int v12 = [(GEOResource *)self->_resource updateMethod];
  BOOL v13 = v12 == 1;
  if (v12 == 1 && v8)
  {
    v15 = GEOGetETagFromExtendedAttributes(v10);
    if ([v15 length])
    {
      if (!a5)
      {
        v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
        id v33 = 0;
        uint64_t v17 = *MEMORY[0x1E4F1C530];
        id v32 = 0;
        char v18 = [v16 getResourceValue:&v33 forKey:v17 error:&v32];
        id v19 = v33;
        id v20 = v32;
        if (v18)
        {
          [v19 timeIntervalSinceNow];
          double v22 = v21;
          [v19 timeIntervalSinceNow];
          if (v22 >= 0.0) {
            double v24 = v23;
          }
          else {
            double v24 = -v23;
          }
          if ([(GEOResource *)self->_resource hasTimeToLiveSeconds]) {
            double Double = (double)[(GEOResource *)self->_resource timeToLiveSeconds];
          }
          else {
            double Double = GEOConfigGetDouble(GeoServicesConfig_DefaultResourceTTL, (uint64_t)off_1E9114AF8);
          }
          double v28 = fmax(Double, 3600.0);

          if (v24 <= v28)
          {
            BOOL v13 = 0;
            goto LABEL_21;
          }
        }
        else
        {
          v26 = v11;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = [(GEOResourceInfo *)self name];
            *(_DWORD *)buf = 138543618;
            v35 = v27;
            __int16 v36 = 2112;
            id v37 = v20;
            _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_ERROR, "Unable to read modification time for resource %{public}@: %@", buf, 0x16u);
          }
        }
      }
      eTag = self->_eTag;
      p_eTag = &self->_eTag;
      if (!eTag) {
        objc_storeStrong((id *)p_eTag, v15);
      }
    }
    BOOL v13 = 1;
LABEL_21:
  }
  return v13;
}

- (NSArray)equivalentResources
{
  return self->_equivalentResources;
}

- (BOOL)validateResourceAtPath:(id)a3 useExtendedAttrs:(BOOL)a4 log:(id)a5
{
  BOOL v6 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = [(GEOResourceInfo *)self validationMethod];
  if (v10 == 1)
  {
    v16 = +[GEOSignedResource validateResourceAtPath:v8];
    if (!v16)
    {
LABEL_18:
      BOOL v22 = 1;
      goto LABEL_28;
    }
  }
  else
  {
    if (v10) {
      goto LABEL_18;
    }
    id v11 = [(GEOResourceInfo *)self checksum];

    if (!v11) {
      goto LABEL_18;
    }
    if (v6)
    {
      int v12 = (__CFString *)v8;
      BOOL v13 = v9;
      v14 = GEOGetSHA1FromExtendedAttributes(v12);
      if ([v14 length])
      {
        id v15 = v14;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v30 = v12;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "Checksum not found in extended attributes for '%{private}@'. Calculating instead...", buf, 0xCu);
        }
        uint64_t v17 = GEOCalculateSHA1ForFile(v12);

        id v28 = 0;
        BOOL v18 = GEOSetSHA1OnExtendedAttribute(v12, v17, &v28);
        id v19 = (__CFString *)v28;
        if (!v18 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v19;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Failed to write checksum into extended attributes: %{public}@", buf, 0xCu);
        }
        id v15 = v17;
      }
    }
    else
    {
      GEOCalculateSHA1ForFile(v8);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v20 = [(GEOResourceInfo *)self checksum];
    char v21 = [v20 isEqualToData:v15];

    if (v21) {
      goto LABEL_18;
    }
    v16 = 0;
  }
  double v23 = v9;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = [(GEOResourceInfo *)self validationMethod];
    if (v24)
    {
      if (v24 == 1)
      {
        v25 = @"CMS";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v24);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v25 = @"SHA1";
    }
    v26 = [(GEOResourceInfo *)self name];
    *(_DWORD *)buf = 138543874;
    v30 = v25;
    __int16 v31 = 2114;
    id v32 = v26;
    __int16 v33 = 2112;
    v34 = v16;
    _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "Incorrect %{public}@ for cached resource %{public}@: %@", buf, 0x20u);
  }
  BOOL v22 = 0;
LABEL_28:

  return v22;
}

- (int)validationMethod
{
  int result = [(GEOResource *)self->_resource hasValidationMethod];
  if (result)
  {
    resource = self->_resource;
    return [(GEOResource *)resource validationMethod];
  }
  return result;
}

- (NSData)checksum
{
  return [(GEOResource *)self->_resource checksum];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eTag, 0);
  objc_storeStrong((id *)&self->_equivalentResources, 0);

  objc_storeStrong((id *)&self->_resource, 0);
}

- (NSString)eTag
{
  return self->_eTag;
}

- (int)type
{
  return [(GEOResource *)self->_resource resourceType];
}

- (GEOResourceInfo)initWithResource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOResourceInfo;
  BOOL v6 = [(GEOResourceInfo *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resource, a3);
    id v8 = v7;
  }

  return v7;
}

- (BOOL)validateResource:(id)a3 log:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(GEOResourceInfo *)self validationMethod];
  if (v8 == 1)
  {
    v14 = [(GEOResourceInfo *)self name];
    unint64_t v15 = +[GEOSignedResource typeForResourceByFileName:v14];

    BOOL v13 = +[GEOSignedResource validateResource:v15 withData:v6];
    if (v13) {
      goto LABEL_7;
    }
LABEL_11:
    BOOL v19 = 1;
    goto LABEL_16;
  }
  if (v8) {
    goto LABEL_11;
  }
  id v9 = [(GEOResourceInfo *)self checksum];

  if (!v9) {
    goto LABEL_11;
  }
  objc_super v10 = objc_msgSend(v6, "_geo_SHA1Hash");
  id v11 = [(GEOResourceInfo *)self checksum];
  char v12 = [v10 isEqualToData:v11];

  if (v12) {
    goto LABEL_11;
  }
  BOOL v13 = 0;
LABEL_7:
  v16 = v7;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = [(GEOResourceInfo *)self validationMethod];
    if (v17)
    {
      if (v17 == 1)
      {
        BOOL v18 = @"CMS";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
        BOOL v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      BOOL v18 = @"SHA1";
    }
    id v20 = [(GEOResourceInfo *)self name];
    *(_DWORD *)buf = 138543874;
    double v23 = v18;
    __int16 v24 = 2114;
    v25 = v20;
    __int16 v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "Incorrect %{public}@ for cached resource %{public}@: %@", buf, 0x20u);
  }
  BOOL v19 = 0;
LABEL_16:

  return v19;
}

- (id)description
{
  v3 = NSString;
  v4 = [(GEOResource *)self->_resource filename];
  id v5 = [(GEOResource *)self->_resource checksum];
  id v6 = objc_msgSend(v5, "_geo_hexString");
  id v7 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

  return v7;
}

- (void)setEquivalentResources:(id)a3
{
}

- (void)setETag:(id)a3
{
}

@end