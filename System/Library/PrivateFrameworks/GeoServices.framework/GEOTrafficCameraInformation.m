@interface GEOTrafficCameraInformation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCameraIdentifier;
- (BOOL)hasCameraType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTrafficCameraInformation)initWithDictionary:(id)a3;
- (GEOTrafficCameraInformation)initWithJSON:(id)a3;
- (NSString)cameraIdentifier;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)cameraTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsCameraType:(id)a3;
- (int)cameraType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCameraIdentifier:(id)a3;
- (void)setCameraType:(int)a3;
- (void)setHasCameraType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTrafficCameraInformation

- (BOOL)hasCameraIdentifier
{
  return self->_cameraIdentifier != 0;
}

- (NSString)cameraIdentifier
{
  return self->_cameraIdentifier;
}

- (void)setCameraIdentifier:(id)a3
{
}

- (int)cameraType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_cameraType;
  }
  else {
    return 0;
  }
}

- (void)setCameraType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_cameraType = a3;
}

- (void)setHasCameraType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCameraType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)cameraTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E4BC8[a3];
  }

  return v3;
}

- (int)StringAsCameraType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRAFFIC_CAMERA_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_CAMERA_TYPE_RED_LIGHT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_CAMERA_TYPE_SPEED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTrafficCameraInformation;
  int v4 = [(GEOTrafficCameraInformation *)&v8 description];
  v5 = [(GEOTrafficCameraInformation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficCameraInformation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 cameraIdentifier];
    if (v5)
    {
      if (a2) {
        v6 = @"cameraIdentifier";
      }
      else {
        v6 = @"camera_identifier";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v7 = *(int *)(a1 + 16);
      if (v7 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53E4BC8[v7];
      }
      if (a2) {
        v9 = @"cameraType";
      }
      else {
        v9 = @"camera_type";
      }
      [v4 setObject:v8 forKey:v9];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTrafficCameraInformation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTrafficCameraInformation)initWithDictionary:(id)a3
{
  return (GEOTrafficCameraInformation *)-[GEOTrafficCameraInformation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"cameraIdentifier";
      }
      else {
        v6 = @"camera_identifier";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setCameraIdentifier:v8];
      }
      if (a3) {
        v9 = @"cameraType";
      }
      else {
        v9 = @"camera_type";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 isEqualToString:@"TRAFFIC_CAMERA_TYPE_UNKNOWN"])
        {
          uint64_t v12 = 0;
        }
        else if ([v11 isEqualToString:@"TRAFFIC_CAMERA_TYPE_RED_LIGHT"])
        {
          uint64_t v12 = 1;
        }
        else if ([v11 isEqualToString:@"TRAFFIC_CAMERA_TYPE_SPEED"])
        {
          uint64_t v12 = 2;
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_23:

          goto LABEL_24;
        }
        uint64_t v12 = [v10 intValue];
      }
      [a1 setCameraType:v12];
      goto LABEL_23;
    }
  }
LABEL_24:

  return a1;
}

- (GEOTrafficCameraInformation)initWithJSON:(id)a3
{
  return (GEOTrafficCameraInformation *)-[GEOTrafficCameraInformation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficCameraInformationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficCameraInformationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_cameraIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOTrafficCameraInformation *)self readAll:0];
  if (self->_cameraIdentifier) {
    objc_msgSend(v4, "setCameraIdentifier:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 4) = self->_cameraType;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_cameraIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_cameraType;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOTrafficCameraInformation *)self readAll:1];
  [v4 readAll:1];
  cameraIdentifier = self->_cameraIdentifier;
  if ((unint64_t)cameraIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](cameraIdentifier, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_cameraType == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEOTrafficCameraInformation *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_cameraIdentifier hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_cameraType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  [v4 readAll:0];
  if (*((void *)v4 + 1)) {
    -[GEOTrafficCameraInformation setCameraIdentifier:](self, "setCameraIdentifier:");
  }
  if (v4[5])
  {
    self->_cameraType = v4[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end