@interface CLPSatelliteReport
- (BOOL)hasGalileo;
- (BOOL)hasGlonass;
- (BOOL)hasGps;
- (BOOL)hasQzss;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPSatelliteInfo)galileo;
- (CLPSatelliteInfo)glonass;
- (CLPSatelliteInfo)gps;
- (CLPSatelliteInfo)qzss;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGalileo:(id)a3;
- (void)setGlonass:(id)a3;
- (void)setGps:(id)a3;
- (void)setQzss:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPSatelliteReport

- (BOOL)hasGps
{
  return self->_gps != 0;
}

- (BOOL)hasGlonass
{
  return self->_glonass != 0;
}

- (BOOL)hasQzss
{
  return self->_qzss != 0;
}

- (BOOL)hasGalileo
{
  return self->_galileo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPSatelliteReport;
  v4 = [(CLPSatelliteReport *)&v8 description];
  v5 = [(CLPSatelliteReport *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  gps = self->_gps;
  if (gps)
  {
    v5 = [(CLPSatelliteInfo *)gps dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"gps"];
  }
  glonass = self->_glonass;
  if (glonass)
  {
    v7 = [(CLPSatelliteInfo *)glonass dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"glonass"];
  }
  qzss = self->_qzss;
  if (qzss)
  {
    v9 = [(CLPSatelliteInfo *)qzss dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"qzss"];
  }
  galileo = self->_galileo;
  if (galileo)
  {
    v11 = [(CLPSatelliteInfo *)galileo dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"galileo"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPSatelliteReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_gps)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_glonass)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_qzss)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_galileo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_gps)
  {
    objc_msgSend(v4, "setGps:");
    id v4 = v5;
  }
  if (self->_glonass)
  {
    objc_msgSend(v5, "setGlonass:");
    id v4 = v5;
  }
  if (self->_qzss)
  {
    objc_msgSend(v5, "setQzss:");
    id v4 = v5;
  }
  if (self->_galileo)
  {
    objc_msgSend(v5, "setGalileo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPSatelliteInfo *)self->_gps copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(CLPSatelliteInfo *)self->_glonass copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(CLPSatelliteInfo *)self->_qzss copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(CLPSatelliteInfo *)self->_galileo copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((gps = self->_gps, !((unint64_t)gps | v4[3])) || -[CLPSatelliteInfo isEqual:](gps, "isEqual:"))
    && ((glonass = self->_glonass, !((unint64_t)glonass | v4[2]))
     || -[CLPSatelliteInfo isEqual:](glonass, "isEqual:"))
    && ((qzss = self->_qzss, !((unint64_t)qzss | v4[4])) || -[CLPSatelliteInfo isEqual:](qzss, "isEqual:")))
  {
    galileo = self->_galileo;
    if ((unint64_t)galileo | v4[1]) {
      char v9 = -[CLPSatelliteInfo isEqual:](galileo, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPSatelliteInfo *)self->_gps hash];
  unint64_t v4 = [(CLPSatelliteInfo *)self->_glonass hash] ^ v3;
  unint64_t v5 = [(CLPSatelliteInfo *)self->_qzss hash];
  return v4 ^ v5 ^ [(CLPSatelliteInfo *)self->_galileo hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  gps = self->_gps;
  uint64_t v6 = v4[3];
  v13 = v4;
  if (gps)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPSatelliteInfo mergeFrom:](gps, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPSatelliteReport setGps:](self, "setGps:");
  }
  unint64_t v4 = v13;
LABEL_7:
  glonass = self->_glonass;
  uint64_t v8 = v4[2];
  if (glonass)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[CLPSatelliteInfo mergeFrom:](glonass, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[CLPSatelliteReport setGlonass:](self, "setGlonass:");
  }
  unint64_t v4 = v13;
LABEL_13:
  qzss = self->_qzss;
  uint64_t v10 = v4[4];
  if (qzss)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[CLPSatelliteInfo mergeFrom:](qzss, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[CLPSatelliteReport setQzss:](self, "setQzss:");
  }
  unint64_t v4 = v13;
LABEL_19:
  galileo = self->_galileo;
  uint64_t v12 = v4[1];
  if (galileo)
  {
    if (v12) {
      -[CLPSatelliteInfo mergeFrom:](galileo, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[CLPSatelliteReport setGalileo:](self, "setGalileo:");
  }

  MEMORY[0x1F41817F8]();
}

- (CLPSatelliteInfo)gps
{
  return self->_gps;
}

- (void)setGps:(id)a3
{
}

- (CLPSatelliteInfo)glonass
{
  return self->_glonass;
}

- (void)setGlonass:(id)a3
{
}

- (CLPSatelliteInfo)qzss
{
  return self->_qzss;
}

- (void)setQzss:(id)a3
{
}

- (CLPSatelliteInfo)galileo
{
  return self->_galileo;
}

- (void)setGalileo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qzss, 0);
  objc_storeStrong((id *)&self->_gps, 0);
  objc_storeStrong((id *)&self->_glonass, 0);

  objc_storeStrong((id *)&self->_galileo, 0);
}

@end