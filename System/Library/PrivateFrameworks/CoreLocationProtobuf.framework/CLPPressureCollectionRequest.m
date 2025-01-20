@interface CLPPressureCollectionRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLocation)pressureLocation;
- (CLPMeta)meta;
- (CLPPressure)pressure;
- (Class)responseClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMeta:(id)a3;
- (void)setPressure:(id)a3;
- (void)setPressureLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPPressureCollectionRequest

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPPressureCollectionRequest;
  v4 = [(CLPPressureCollectionRequest *)&v8 description];
  v5 = [(CLPPressureCollectionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  meta = self->_meta;
  if (meta)
  {
    v5 = [(CLPMeta *)meta dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"meta"];
  }
  pressure = self->_pressure;
  if (pressure)
  {
    v7 = [(CLPPressure *)pressure dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"pressure"];
  }
  pressureLocation = self->_pressureLocation;
  if (pressureLocation)
  {
    v9 = [(CLPLocation *)pressureLocation dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"pressureLocation"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPressureCollectionRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_meta) {
    -[CLPPressureCollectionRequest writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_pressure) {
    -[CLPPressureCollectionRequest writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_pressureLocation) {
    -[CLPPressureCollectionRequest writeTo:]();
  }
  PBDataWriterWriteSubmessage();
}

- (unsigned)requestTypeCode
{
  return 106;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  meta = self->_meta;
  id v5 = a3;
  [v5 setMeta:meta];
  [v5 setPressure:self->_pressure];
  [v5 setPressureLocation:self->_pressureLocation];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPMeta *)self->_meta copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(CLPPressure *)self->_pressure copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(CLPLocation *)self->_pressureLocation copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((meta = self->_meta, !((unint64_t)meta | v4[1])) || -[CLPMeta isEqual:](meta, "isEqual:"))
    && ((pressure = self->_pressure, !((unint64_t)pressure | v4[2]))
     || -[CLPPressure isEqual:](pressure, "isEqual:")))
  {
    pressureLocation = self->_pressureLocation;
    if ((unint64_t)pressureLocation | v4[3]) {
      char v8 = -[CLPLocation isEqual:](pressureLocation, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPMeta *)self->_meta hash];
  unint64_t v4 = [(CLPPressure *)self->_pressure hash] ^ v3;
  return v4 ^ [(CLPLocation *)self->_pressureLocation hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  meta = self->_meta;
  uint64_t v6 = v4[1];
  v11 = v4;
  if (meta)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPMeta mergeFrom:](meta, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPPressureCollectionRequest setMeta:](self, "setMeta:");
  }
  unint64_t v4 = v11;
LABEL_7:
  pressure = self->_pressure;
  uint64_t v8 = v4[2];
  if (pressure)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[CLPPressure mergeFrom:](pressure, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[CLPPressureCollectionRequest setPressure:](self, "setPressure:");
  }
  unint64_t v4 = v11;
LABEL_13:
  pressureLocation = self->_pressureLocation;
  uint64_t v10 = v4[3];
  if (pressureLocation)
  {
    if (v10) {
      -[CLPLocation mergeFrom:](pressureLocation, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[CLPPressureCollectionRequest setPressureLocation:](self, "setPressureLocation:");
  }

  MEMORY[0x1F41817F8]();
}

- (CLPMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

- (CLPPressure)pressure
{
  return self->_pressure;
}

- (void)setPressure:(id)a3
{
}

- (CLPLocation)pressureLocation
{
  return self->_pressureLocation;
}

- (void)setPressureLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressureLocation, 0);
  objc_storeStrong((id *)&self->_pressure, 0);

  objc_storeStrong((id *)&self->_meta, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPPressureCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 31832, "self->_meta != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPPressureCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 31837, "self->_pressure != nil");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[CLPPressureCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 31842, "self->_pressureLocation != nil");
}

@end