@interface GEOPDGuideSummaryLayoutMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGuideSummaryLayoutMetadata

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuideSummaryLayoutMetadata;
  v4 = [(GEOPDGuideSummaryLayoutMetadata *)&v8 description];
  v5 = [(GEOPDGuideSummaryLayoutMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuideSummaryLayoutMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      int v5 = *(_DWORD *)(a1 + 8);
      if (v5)
      {
        if (v5 == 1)
        {
          v6 = @"GUIDE_SUMMARY_CELL_WITH_COVER_PHOTO";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 8));
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v6 = @"GUIDE_SUMMARY_CELL_WITH_THUMBNAIL";
      }
      if (a2) {
        v7 = @"guideSummaryType";
      }
      else {
        v7 = @"guide_summary_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGuideSummaryLayoutMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"guideSummaryType";
      }
      else {
        v6 = @"guide_summary_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"GUIDE_SUMMARY_CELL_WITH_THUMBNAIL"]) {
          int v9 = 0;
        }
        else {
          int v9 = [v8 isEqualToString:@"GUIDE_SUMMARY_CELL_WITH_COVER_PHOTO"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_14:

          goto LABEL_15;
        }
        int v9 = [v7 intValue];
      }
      *(unsigned char *)(a1 + 12) |= 1u;
      *(_DWORD *)(a1 + 8) = v9;
      goto LABEL_14;
    }
  }
LABEL_15:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGuideSummaryLayoutMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_guideSummaryType;
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
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_guideSummaryType == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_guideSummaryType;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  if (a1 && (v3[3] & 1) != 0)
  {
    *(_DWORD *)(a1 + 8) = v3[2];
    *(unsigned char *)(a1 + 12) |= 1u;
  }
}

@end