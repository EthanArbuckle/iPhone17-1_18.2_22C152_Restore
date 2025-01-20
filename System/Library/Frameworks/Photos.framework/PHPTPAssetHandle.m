@interface PHPTPAssetHandle
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresConversion;
- (NSString)auxiliaryResourceFilenameMarker;
- (NSString)localIdentifier;
- (PHPTPAssetHandle)initWithResourceType:(int64_t)a3 orientation:(unsigned int)a4 localIdentifier:(id)a5 requiresConversion:(BOOL)a6;
- (id)description;
- (int64_t)resourceType;
- (unsigned)orientation;
@end

@implementation PHPTPAssetHandle

- (void).cxx_destruct
{
}

- (BOOL)requiresConversion
{
  return self->_requiresConversion;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (NSString)auxiliaryResourceFilenameMarker
{
  id v3 = 0;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int64_t resourceType = self->_resourceType;
  switch(resourceType)
  {
    case 5:
    case 6:
    case 10:
      v7 = (void *)PHAuxiliaryResourceFilenameMarkerRender;
      goto LABEL_10;
    case 7:
    case 9:
    case 17:
    case 18:
      goto LABEL_11;
    case 8:
    case 11:
    case 12:
      v7 = (void *)PHAuxiliaryResourceFilenameMarkerAdjustmentBase;
      goto LABEL_10;
    case 13:
    case 14:
    case 15:
    case 19:
    case 20:
      v5 = PLPTPGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int64_t v6 = self->_resourceType;
        int v9 = 134217984;
        int64_t v10 = v6;
        _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", (uint8_t *)&v9, 0xCu);
      }

      id v3 = 0;
      goto LABEL_11;
    case 16:
      v7 = (void *)PHAuxiliaryResourceFilenameMarkerOriginalAdjustment;
      goto LABEL_10;
    default:
      if (resourceType != 110) {
        goto LABEL_11;
      }
      v7 = (void *)PHAuxiliaryResourceFilenameMarkerAdjustmentSecondaryData;
LABEL_10:
      id v3 = v7;
LABEL_11:
      return (NSString *)v3;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    BOOL v6 = self->_resourceType == v5[2]
      && [(NSString *)self->_localIdentifier isEqualToString:v5[3]]
      && self->_requiresConversion == *((unsigned __int8 *)v5 + 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F8A7A8] descriptionBuilderWithObject:self];
  [v3 appendName:@"resourceType" typeCode:"q" value:&self->_resourceType];
  [v3 appendName:@"localIdentifier" typeCode:"@" value:&self->_localIdentifier];
  [v3 appendName:@"requiresConversion" typeCode:"B" value:&self->_requiresConversion];
  id v4 = [v3 build];

  return v4;
}

- (PHPTPAssetHandle)initWithResourceType:(int64_t)a3 orientation:(unsigned int)a4 localIdentifier:(id)a5 requiresConversion:(BOOL)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PHPTPAssetHandle;
  uint64_t v11 = [(PHPTPAssetHandle *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_int64_t resourceType = a3;
    uint64_t v13 = [v10 copy];
    localIdentifier = v12->_localIdentifier;
    v12->_localIdentifier = (NSString *)v13;

    v12->_requiresConversion = a6;
    v12->_orientation = a4;
  }

  return v12;
}

@end