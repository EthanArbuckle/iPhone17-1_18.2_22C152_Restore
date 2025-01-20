@interface CLPLOGENTRYVISIONVLLocalizationDebugInfo
- (BOOL)hasMaps488Details;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLOGENTRYVISIONVLLocalizationMaps488Details)maps488Details;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMaps488Details:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONVLLocalizationDebugInfo

- (BOOL)hasMaps488Details
{
  return self->_maps488Details != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONVLLocalizationDebugInfo;
  v4 = [(CLPLOGENTRYVISIONVLLocalizationDebugInfo *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONVLLocalizationDebugInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  maps488Details = self->_maps488Details;
  if (maps488Details)
  {
    v5 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)maps488Details dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"maps488_details"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVLLocalizationDebugInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_maps488Details) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  maps488Details = self->_maps488Details;
  if (maps488Details) {
    [a3 setMaps488Details:maps488Details];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self->_maps488Details copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    maps488Details = self->_maps488Details;
    if ((unint64_t)maps488Details | v4[1]) {
      char v6 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details isEqual:](maps488Details, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self->_maps488Details hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  maps488Details = self->_maps488Details;
  uint64_t v6 = v4[1];
  if (maps488Details)
  {
    if (v6) {
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details mergeFrom:](maps488Details, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CLPLOGENTRYVISIONVLLocalizationDebugInfo setMaps488Details:](self, "setMaps488Details:");
  }

  MEMORY[0x1F41817F8]();
}

- (CLPLOGENTRYVISIONVLLocalizationMaps488Details)maps488Details
{
  return self->_maps488Details;
}

- (void)setMaps488Details:(id)a3
{
}

- (void).cxx_destruct
{
}

@end