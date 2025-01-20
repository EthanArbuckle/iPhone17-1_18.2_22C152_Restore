@interface _INPBImageValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasData;
- (BOOL)hasHeight;
- (BOOL)hasProxyServiceIdentifier;
- (BOOL)hasRenderingMode;
- (BOOL)hasType;
- (BOOL)hasUri;
- (BOOL)hasValueMetadata;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (NSString)proxyServiceIdentifier;
- (NSString)uri;
- (_INPBImageValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (double)height;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)renderingModeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsRenderingMode:(id)a3;
- (int)StringAsType:(id)a3;
- (int)renderingMode;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasRenderingMode:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(double)a3;
- (void)setProxyServiceIdentifier:(id)a3;
- (void)setRenderingMode:(int)a3;
- (void)setType:(int)a3;
- (void)setUri:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)setWidth:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBImageValue

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  v5 = [(_INPBImageValue *)self data];
  v6 = [v4 data];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v7 = [(_INPBImageValue *)self data];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBImageValue *)self data];
    v10 = [v4 data];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  int v12 = [(_INPBImageValue *)self hasHeight];
  if (v12 != [v4 hasHeight]) {
    goto LABEL_34;
  }
  if ([(_INPBImageValue *)self hasHeight])
  {
    if ([v4 hasHeight])
    {
      double height = self->_height;
      [v4 height];
      if (height != v14) {
        goto LABEL_34;
      }
    }
  }
  v5 = [(_INPBImageValue *)self proxyServiceIdentifier];
  v6 = [v4 proxyServiceIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v15 = [(_INPBImageValue *)self proxyServiceIdentifier];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(_INPBImageValue *)self proxyServiceIdentifier];
    v18 = [v4 proxyServiceIdentifier];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  int v20 = [(_INPBImageValue *)self hasRenderingMode];
  if (v20 != [v4 hasRenderingMode]) {
    goto LABEL_34;
  }
  if ([(_INPBImageValue *)self hasRenderingMode])
  {
    if ([v4 hasRenderingMode])
    {
      int renderingMode = self->_renderingMode;
      if (renderingMode != [v4 renderingMode]) {
        goto LABEL_34;
      }
    }
  }
  int v22 = [(_INPBImageValue *)self hasType];
  if (v22 != [v4 hasType]) {
    goto LABEL_34;
  }
  if ([(_INPBImageValue *)self hasType])
  {
    if ([v4 hasType])
    {
      int type = self->_type;
      if (type != [v4 type]) {
        goto LABEL_34;
      }
    }
  }
  v5 = [(_INPBImageValue *)self uri];
  v6 = [v4 uri];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v24 = [(_INPBImageValue *)self uri];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBImageValue *)self uri];
    v27 = [v4 uri];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  v5 = [(_INPBImageValue *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v29 = [(_INPBImageValue *)self valueMetadata];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(_INPBImageValue *)self valueMetadata];
    v32 = [v4 valueMetadata];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  int v36 = [(_INPBImageValue *)self hasWidth];
  if (v36 == [v4 hasWidth])
  {
    if (![(_INPBImageValue *)self hasWidth]
      || ![v4 hasWidth]
      || (double width = self->_width, [v4 width], width == v38))
    {
      BOOL v34 = 1;
      goto LABEL_35;
    }
  }
LABEL_34:
  BOOL v34 = 0;
LABEL_35:

  return v34;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_data)
  {
    id v4 = [(_INPBImageValue *)self data];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"data"];
  }
  if ([(_INPBImageValue *)self hasHeight])
  {
    v6 = NSNumber;
    [(_INPBImageValue *)self height];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"height"];
  }
  if (self->_proxyServiceIdentifier)
  {
    v8 = [(_INPBImageValue *)self proxyServiceIdentifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"proxyServiceIdentifier"];
  }
  if ([(_INPBImageValue *)self hasRenderingMode])
  {
    uint64_t v10 = [(_INPBImageValue *)self renderingMode];
    if (v10 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v11 = off_1E551C1D8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"renderingMode"];
  }
  if ([(_INPBImageValue *)self hasType])
  {
    uint64_t v12 = [(_INPBImageValue *)self type];
    if (v12 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E551C1F0[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"type"];
  }
  if (self->_uri)
  {
    double v14 = [(_INPBImageValue *)self uri];
    uint64_t v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"uri"];
  }
  v16 = [(_INPBImageValue *)self valueMetadata];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"valueMetadata"];

  if ([(_INPBImageValue *)self hasWidth])
  {
    v18 = NSNumber;
    [(_INPBImageValue *)self width];
    int v19 = objc_msgSend(v18, "numberWithDouble:");
    [v3 setObject:v19 forKeyedSubscript:@"width"];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Data"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Bundle"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Proxy"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_proxyServiceIdentifier, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (double)width
{
  return self->_width;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (NSString)uri
{
  return self->_uri;
}

- (int)type
{
  return self->_type;
}

- (int)renderingMode
{
  return self->_renderingMode;
}

- (NSString)proxyServiceIdentifier
{
  return self->_proxyServiceIdentifier;
}

- (double)height
{
  return self->_height;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_data hash];
  if ([(_INPBImageValue *)self hasHeight])
  {
    double height = self->_height;
    double v5 = -height;
    if (height >= 0.0) {
      double v5 = self->_height;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v8 += (unint64_t)v7;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_proxyServiceIdentifier hash];
  if ([(_INPBImageValue *)self hasRenderingMode]) {
    uint64_t v10 = 2654435761 * self->_renderingMode;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBImageValue *)self hasType]) {
    uint64_t v11 = 2654435761 * self->_type;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_uri hash];
  unint64_t v13 = [(_INPBValueMetadata *)self->_valueMetadata hash];
  if ([(_INPBImageValue *)self hasWidth])
  {
    double width = self->_width;
    double v15 = -width;
    if (width >= 0.0) {
      double v15 = self->_width;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v18 += (unint64_t)v17;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = [+[_INPBImageValue allocWithZone:](_INPBImageValue, "allocWithZone:") init];
  long double v6 = (void *)[(NSData *)self->_data copyWithZone:a3];
  [(_INPBImageValue *)v5 setData:v6];

  if ([(_INPBImageValue *)self hasHeight])
  {
    [(_INPBImageValue *)self height];
    -[_INPBImageValue setHeight:](v5, "setHeight:");
  }
  double v7 = (void *)[(NSString *)self->_proxyServiceIdentifier copyWithZone:a3];
  [(_INPBImageValue *)v5 setProxyServiceIdentifier:v7];

  if ([(_INPBImageValue *)self hasRenderingMode]) {
    [(_INPBImageValue *)v5 setRenderingMode:[(_INPBImageValue *)self renderingMode]];
  }
  if ([(_INPBImageValue *)self hasType]) {
    [(_INPBImageValue *)v5 setType:[(_INPBImageValue *)self type]];
  }
  unint64_t v8 = (void *)[(NSString *)self->_uri copyWithZone:a3];
  [(_INPBImageValue *)v5 setUri:v8];

  id v9 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBImageValue *)v5 setValueMetadata:v9];

  if ([(_INPBImageValue *)self hasWidth])
  {
    [(_INPBImageValue *)self width];
    -[_INPBImageValue setWidth:](v5, "setWidth:");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBImageValue *)self data];
  double v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBImageValue)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBImageValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBImageValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBImageValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBImageValue *)self data];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  if ([(_INPBImageValue *)self hasHeight]) {
    PBDataWriterWriteDoubleField();
  }
  double v5 = [(_INPBImageValue *)self proxyServiceIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBImageValue *)self hasRenderingMode]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBImageValue *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = [(_INPBImageValue *)self uri];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBImageValue *)self valueMetadata];

  if (v7)
  {
    unint64_t v8 = [(_INPBImageValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBImageValue *)self hasWidth]) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBImageValueReadFrom(self, (uint64_t)a3);
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setWidth:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_double width = a3;
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (BOOL)hasUri
{
  return self->_uri != 0;
}

- (void)setUri:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  uri = self->_uri;
  self->_uri = v4;

  MEMORY[0x1F41817F8](v4, uri);
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E551C1F0[a3];
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int type = a3;
  }
}

- (int)StringAsRenderingMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Automatic"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AlwaysOriginal"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AlwaysTemplate"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)renderingModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551C1D8[a3];
  }

  return v3;
}

- (void)setHasRenderingMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRenderingMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRenderingMode:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int renderingMode = a3;
  }
}

- (BOOL)hasProxyServiceIdentifier
{
  return self->_proxyServiceIdentifier != 0;
}

- (void)setProxyServiceIdentifier:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  proxyServiceIdentifier = self->_proxyServiceIdentifier;
  self->_proxyServiceIdentifier = v4;

  MEMORY[0x1F41817F8](v4, proxyServiceIdentifier);
}

- (void)setHasHeight:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHeight:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double height = a3;
}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setData:(id)a3
{
  int v4 = (NSData *)[a3 copy];
  data = self->_data;
  self->_data = v4;

  MEMORY[0x1F41817F8](v4, data);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end