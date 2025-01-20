@interface GEORPCarPlayAuxiliaryControl
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCarInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCarInfo)carInfo;
- (GEORPCarPlayAuxiliaryControl)initWithDictionary:(id)a3;
- (GEORPCarPlayAuxiliaryControl)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCarInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCarPlayAuxiliaryControl

- (BOOL)hasCarInfo
{
  return self->_carInfo != 0;
}

- (GEOCarInfo)carInfo
{
  return self->_carInfo;
}

- (void)setCarInfo:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCarPlayAuxiliaryControl;
  v4 = [(GEORPCarPlayAuxiliaryControl *)&v8 description];
  v5 = [(GEORPCarPlayAuxiliaryControl *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCarPlayAuxiliaryControl _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 carInfo];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"carInfo";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"car_info";
      }
      [v4 setObject:v7 forKey:v8];
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
  return -[GEORPCarPlayAuxiliaryControl _dictionaryRepresentation:](self, 1);
}

- (GEORPCarPlayAuxiliaryControl)initWithDictionary:(id)a3
{
  return (GEORPCarPlayAuxiliaryControl *)-[GEORPCarPlayAuxiliaryControl _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"carInfo";
      }
      else {
        v6 = @"car_info";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOCarInfo alloc];
        if (a3) {
          uint64_t v9 = [(GEOCarInfo *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOCarInfo *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setCarInfo:v9];
      }
    }
  }

  return a1;
}

- (GEORPCarPlayAuxiliaryControl)initWithJSON:(id)a3
{
  return (GEORPCarPlayAuxiliaryControl *)-[GEORPCarPlayAuxiliaryControl _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCarPlayAuxiliaryControlIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCarPlayAuxiliaryControlReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  if (self->_carInfo) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEORPCarPlayAuxiliaryControl *)self readAll:0];
  if (self->_carInfo) {
    objc_msgSend(v4, "setCarInfo:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOCarInfo *)self->_carInfo copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEORPCarPlayAuxiliaryControl *)self readAll:1];
    [v4 readAll:1];
    carInfo = self->_carInfo;
    if ((unint64_t)carInfo | v4[1]) {
      char v5 = -[GEOCarInfo isEqual:](carInfo, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEORPCarPlayAuxiliaryControl *)self readAll:1];
  carInfo = self->_carInfo;

  return [(GEOCarInfo *)carInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  carInfo = self->_carInfo;
  uint64_t v6 = v4[1];

  if (carInfo)
  {
    if (v6)
    {
      [(GEOCarInfo *)carInfo mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEORPCarPlayAuxiliaryControl *)self setCarInfo:v6];
  }
}

- (void).cxx_destruct
{
}

@end