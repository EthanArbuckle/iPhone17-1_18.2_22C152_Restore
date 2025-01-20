@interface BMPBPhotosKnowledgeGraphEnrichmentLocation
- (BOOL)hasCity;
- (BOOL)hasCountry;
- (BOOL)hasEncodedLocation;
- (BOOL)hasState;
- (BOOL)hasStreet;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encodedLocation;
- (NSString)city;
- (NSString)country;
- (NSString)state;
- (NSString)street;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCity:(id)a3;
- (void)setCountry:(id)a3;
- (void)setEncodedLocation:(id)a3;
- (void)setState:(id)a3;
- (void)setStreet:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBPhotosKnowledgeGraphEnrichmentLocation

- (BOOL)hasStreet
{
  return self->_street != 0;
}

- (BOOL)hasCity
{
  return self->_city != 0;
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (BOOL)hasEncodedLocation
{
  return self->_encodedLocation != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBPhotosKnowledgeGraphEnrichmentLocation;
  v4 = [(BMPBPhotosKnowledgeGraphEnrichmentLocation *)&v8 description];
  v5 = [(BMPBPhotosKnowledgeGraphEnrichmentLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  street = self->_street;
  if (street) {
    [v3 setObject:street forKey:@"street"];
  }
  city = self->_city;
  if (city) {
    [v4 setObject:city forKey:@"city"];
  }
  state = self->_state;
  if (state) {
    [v4 setObject:state forKey:@"state"];
  }
  country = self->_country;
  if (country) {
    [v4 setObject:country forKey:@"country"];
  }
  encodedLocation = self->_encodedLocation;
  if (encodedLocation) {
    [v4 setObject:encodedLocation forKey:@"encodedLocation"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPhotosKnowledgeGraphEnrichmentLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_street)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_city)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_state)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_encodedLocation)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_street)
  {
    objc_msgSend(v4, "setStreet:");
    id v4 = v5;
  }
  if (self->_city)
  {
    objc_msgSend(v5, "setCity:");
    id v4 = v5;
  }
  if (self->_state)
  {
    objc_msgSend(v5, "setState:");
    id v4 = v5;
  }
  if (self->_country)
  {
    objc_msgSend(v5, "setCountry:");
    id v4 = v5;
  }
  if (self->_encodedLocation)
  {
    objc_msgSend(v5, "setEncodedLocation:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_street copyWithZone:a3];
  v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSString *)self->_city copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_state copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSString *)self->_country copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  uint64_t v14 = [(NSData *)self->_encodedLocation copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((street = self->_street, !((unint64_t)street | v4[5]))
     || -[NSString isEqual:](street, "isEqual:"))
    && ((city = self->_city, !((unint64_t)city | v4[1])) || -[NSString isEqual:](city, "isEqual:"))
    && ((state = self->_state, !((unint64_t)state | v4[4]))
     || -[NSString isEqual:](state, "isEqual:"))
    && ((country = self->_country, !((unint64_t)country | v4[2]))
     || -[NSString isEqual:](country, "isEqual:")))
  {
    encodedLocation = self->_encodedLocation;
    if ((unint64_t)encodedLocation | v4[3]) {
      char v10 = -[NSData isEqual:](encodedLocation, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_street hash];
  NSUInteger v4 = [(NSString *)self->_city hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_state hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_country hash];
  return v6 ^ [(NSData *)self->_encodedLocation hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[5]) {
    -[BMPBPhotosKnowledgeGraphEnrichmentLocation setStreet:](self, "setStreet:");
  }
  if (v4[1]) {
    -[BMPBPhotosKnowledgeGraphEnrichmentLocation setCity:](self, "setCity:");
  }
  if (v4[4]) {
    -[BMPBPhotosKnowledgeGraphEnrichmentLocation setState:](self, "setState:");
  }
  if (v4[2]) {
    -[BMPBPhotosKnowledgeGraphEnrichmentLocation setCountry:](self, "setCountry:");
  }
  if (v4[3]) {
    -[BMPBPhotosKnowledgeGraphEnrichmentLocation setEncodedLocation:](self, "setEncodedLocation:");
  }
}

- (NSString)street
{
  return self->_street;
}

- (void)setStreet:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSData)encodedLocation
{
  return self->_encodedLocation;
}

- (void)setEncodedLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_encodedLocation, 0);
  objc_storeStrong((id *)&self->_country, 0);

  objc_storeStrong((id *)&self->_city, 0);
}

@end