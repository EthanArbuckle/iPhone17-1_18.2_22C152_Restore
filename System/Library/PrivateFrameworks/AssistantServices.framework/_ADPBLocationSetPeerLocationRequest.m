@interface _ADPBLocationSetPeerLocationRequest
+ (unsigned)_ADPBLocationRequestType;
- (BOOL)hasCodedLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)codedLocation;
- (id)ad_location;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_ad_performForPeerLocationWithCompletion:(id)a3;
- (void)ad_setLocation:(id)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCodedLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBLocationSetPeerLocationRequest

- (void)_ad_performForPeerLocationWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(_ADPBLocationSetPeerLocationRequest *)self ad_location];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void).cxx_destruct
{
}

- (void)setCodedLocation:(id)a3
{
}

- (NSData)codedLocation
{
  return self->_codedLocation;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_ADPBLocationSetPeerLocationRequest setCodedLocation:](self, "setCodedLocation:");
  }
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_codedLocation hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    codedLocation = self->_codedLocation;
    if ((unint64_t)codedLocation | v4[1]) {
      unsigned __int8 v6 = -[NSData isEqual:](codedLocation, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_codedLocation copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  codedLocation = self->_codedLocation;
  if (codedLocation) {
    [a3 setCodedLocation:codedLocation];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_codedLocation) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      if (v6++ >= 9)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    if ((v7 >> 3) == 1)
    {
      PBReaderReadData();
      v13 = (NSData *)objc_claimAutoreleasedReturnValue();
      codedLocation = self->_codedLocation;
      self->_codedLocation = v13;
    }
    else
    {
      int v15 = PBReaderSkipValueWithTag();
      if (!v15) {
        return v15;
      }
    }
  }
  LOBYTE(v15) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  codedLocation = self->_codedLocation;
  if (codedLocation) {
    [v3 setObject:codedLocation forKey:@"coded_location"];
  }
  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_ADPBLocationSetPeerLocationRequest;
  v3 = [(_ADPBLocationSetPeerLocationRequest *)&v7 description];
  v4 = [(_ADPBLocationSetPeerLocationRequest *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasCodedLocation
{
  return self->_codedLocation != 0;
}

- (void)ad_setLocation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v5 encodeObject:v4 forKey:@"Location"];

    unsigned int v6 = [v5 encodedData];
    id v7 = [v6 copy];
  }
  else
  {
    id v7 = 0;
  }
  [(_ADPBLocationSetPeerLocationRequest *)self setCodedLocation:v7];
}

- (id)ad_location
{
  v2 = [(_ADPBLocationSetPeerLocationRequest *)self codedLocation];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v2 error:0];
    id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Location"];
    [v3 finishDecoding];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (unsigned)_ADPBLocationRequestType
{
  return 2;
}

@end