@interface GEOVLFFailureDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFailureReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFFailureDetails)initWithDictionary:(id)a3;
- (GEOVLFFailureDetails)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)failureReasonAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsFailureReason:(id)a3;
- (int)failureReason;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFailureReason:(int)a3;
- (void)setHasFailureReason:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFFailureDetails

- (int)failureReason
{
  if (*(unsigned char *)&self->_flags) {
    return self->_failureReason;
  }
  else {
    return 0;
  }
}

- (void)setFailureReason:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_failureReason = a3;
}

- (void)setHasFailureReason:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFailureReason
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)failureReasonAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F8D70[a3];
  }

  return v3;
}

- (int)StringAsFailureReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VLFFailureReason_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_BAD_IMAGE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_MAP_DATA_MISSING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_MAP_DATA_PENDING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_FAILED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_REJECTED_VIO"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_REJECTED_HEIGHT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_REJECTED_GRAVITY"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_REJECTED_GPS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_REJECTED_SCORE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_BAD_INPUT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_REJECTED_CONFIDENCE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_REJECTED_COVARIANCE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_DISCARDED_IMAGE_TILT"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_DISCARDED_IMAGE_GRAVITY"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_DISCARDED_IMAGE_CALIBRATION"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_DISCARDED_IMAGE_LOCATION_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"VLFFailureReason_POSE_DISCARDED_IMAGE_HORZ_UNCERTAINTY"])
  {
    int v4 = 17;
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
  v8.super_class = (Class)GEOVLFFailureDetails;
  int v4 = [(GEOVLFFailureDetails *)&v8 description];
  v5 = [(GEOVLFFailureDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFFailureDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      uint64_t v5 = *(int *)(a1 + 8);
      if (v5 >= 0x12)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53F8D70[v5];
      }
      if (a2) {
        v7 = @"failureReason";
      }
      else {
        v7 = @"failure_reason";
      }
      [v4 setObject:v6 forKey:v7];
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
  return -[GEOVLFFailureDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFFailureDetails)initWithDictionary:(id)a3
{
  return (GEOVLFFailureDetails *)-[GEOVLFFailureDetails _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"failureReason";
      }
      else {
        v6 = @"failure_reason";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"VLFFailureReason_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_BAD_IMAGE"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_MAP_DATA_MISSING"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_MAP_DATA_PENDING"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_FAILED"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_REJECTED_VIO"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_REJECTED_HEIGHT"])
        {
          uint64_t v9 = 6;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_REJECTED_GRAVITY"])
        {
          uint64_t v9 = 7;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_REJECTED_GPS"])
        {
          uint64_t v9 = 8;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_REJECTED_SCORE"])
        {
          uint64_t v9 = 9;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_BAD_INPUT"])
        {
          uint64_t v9 = 10;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_REJECTED_CONFIDENCE"])
        {
          uint64_t v9 = 11;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_REJECTED_COVARIANCE"])
        {
          uint64_t v9 = 12;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_DISCARDED_IMAGE_TILT"])
        {
          uint64_t v9 = 13;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_DISCARDED_IMAGE_GRAVITY"])
        {
          uint64_t v9 = 14;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_DISCARDED_IMAGE_CALIBRATION"])
        {
          uint64_t v9 = 15;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_DISCARDED_IMAGE_LOCATION_TYPE"])
        {
          uint64_t v9 = 16;
        }
        else if ([v8 isEqualToString:@"VLFFailureReason_POSE_DISCARDED_IMAGE_HORZ_UNCERTAINTY"])
        {
          uint64_t v9 = 17;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_48:

          goto LABEL_49;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setFailureReason:v9];
      goto LABEL_48;
    }
  }
LABEL_49:

  return a1;
}

- (GEOVLFFailureDetails)initWithJSON:(id)a3
{
  return (GEOVLFFailureDetails *)-[GEOVLFFailureDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFFailureDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFFailureDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  [(GEOVLFFailureDetails *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_failureReason;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_failureReason;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOVLFFailureDetails *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_failureReason == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_failureReason;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  [v4 readAll:0];
  if (v4[3])
  {
    self->_failureReason = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end