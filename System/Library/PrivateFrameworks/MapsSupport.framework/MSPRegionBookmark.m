@interface MSPRegionBookmark
- (BOOL)hasRegion;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapRegion)region;
- (NSString)title;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRegion:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPRegionBookmark

- (BOOL)hasRegion
{
  return self->_region != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPRegionBookmark;
  v4 = [(MSPRegionBookmark *)&v8 description];
  v5 = [(MSPRegionBookmark *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  region = self->_region;
  if (region)
  {
    v5 = [(GEOMapRegion *)region dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"region"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    objc_super v8 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPRegionBookmarkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_region)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_region)
  {
    objc_msgSend(v4, "setRegion:");
    id v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(GEOMapRegion *)self->_region copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((region = self->_region, !((unint64_t)region | v4[2]))
     || -[GEOMapRegion isEqual:](region, "isEqual:")))
  {
    title = self->_title;
    if ((unint64_t)title | v4[3]) {
      char v7 = -[NSString isEqual:](title, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(GEOMapRegion *)self->_region hash];
  return [(NSString *)self->_title hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  region = self->_region;
  uint64_t v6 = v4[2];
  char v7 = v4;
  if (region)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOMapRegion mergeFrom:](region, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MSPRegionBookmark setRegion:](self, "setRegion:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[3]) {
    -[MSPRegionBookmark setTitle:](self, "setTitle:");
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_region, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end