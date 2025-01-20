@interface VCMediaNegotiationBlobV2GeneralInfo
- (BOOL)hasAbSwitches;
- (BOOL)hasCname;
- (BOOL)hasNtpTime;
- (BOOL)hasScreenRes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CGSize)screenResolution;
- (NSString)cname;
- (VCMediaNegotiationBlobV2GeneralInfo)initWithCreationTime:(tagNTP)a3 screenResolution:(CGSize)a4 abSwitches:(unsigned int)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)ntpTime;
- (unsigned)abSwitches;
- (unsigned)screenRes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3 prefix:(id)a4;
- (void)setAbSwitches:(unsigned int)a3;
- (void)setCname:(id)a3;
- (void)setHasAbSwitches:(BOOL)a3;
- (void)setHasNtpTime:(BOOL)a3;
- (void)setHasScreenRes:(BOOL)a3;
- (void)setNtpTime:(unint64_t)a3;
- (void)setScreenRes:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2GeneralInfo

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobV2GeneralInfo *)self setCname:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2GeneralInfo;
  [(VCMediaNegotiationBlobV2GeneralInfo *)&v3 dealloc];
}

- (void)setNtpTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ntpTime = a3;
}

- (void)setHasNtpTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNtpTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCname
{
  return self->_cname != 0;
}

- (unsigned)abSwitches
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_abSwitches;
  }
  else {
    return 0;
  }
}

- (void)setAbSwitches:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_abSwitches = a3;
}

- (void)setHasAbSwitches:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAbSwitches
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setScreenRes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_screenRes = a3;
}

- (void)setHasScreenRes:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScreenRes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2GeneralInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2GeneralInfo description](&v3, sel_description), -[VCMediaNegotiationBlobV2GeneralInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_ntpTime), @"ntpTime");
  }
  cname = self->_cname;
  if (cname) {
    [v3 setObject:cname forKey:@"cname"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_abSwitches), @"abSwitches");
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_screenRes), @"screenRes");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2GeneralInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_cname) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_ntpTime;
    *((unsigned char *)a3 + 36) |= 1u;
  }
  if (self->_cname) {
    objc_msgSend(a3, "setCname:");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_abSwitches;
    *((unsigned char *)a3 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_screenRes;
    *((unsigned char *)a3 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_ntpTime;
    *(unsigned char *)(v5 + 36) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_cname copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_abSwitches;
    *(unsigned char *)(v6 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_screenRes;
    *(unsigned char *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_ntpTime != *((void *)a3 + 1)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    cname = self->_cname;
    if ((unint64_t)cname | *((void *)a3 + 3))
    {
      int v5 = -[NSString isEqual:](cname, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_abSwitches != *((_DWORD *)a3 + 4)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 2) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_screenRes != *((_DWORD *)a3 + 8)) {
        goto LABEL_19;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_ntpTime;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_cname hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_abSwitches;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_screenRes;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 36))
  {
    self->_ntpTime = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[VCMediaNegotiationBlobV2GeneralInfo setCname:](self, "setCname:");
  }
  char v5 = *((unsigned char *)a3 + 36);
  if ((v5 & 2) != 0)
  {
    self->_abSwitches = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 36);
  }
  if ((v5 & 4) != 0)
  {
    self->_screenRes = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)ntpTime
{
  return self->_ntpTime;
}

- (NSString)cname
{
  return self->_cname;
}

- (void)setCname:(id)a3
{
}

- (unsigned)screenRes
{
  return self->_screenRes;
}

- (VCMediaNegotiationBlobV2GeneralInfo)initWithCreationTime:(tagNTP)a3 screenResolution:(CGSize)a4 abSwitches:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v9 = [(VCMediaNegotiationBlobV2GeneralInfo *)self init];
  v10 = v9;
  if (v9)
  {
    [(VCMediaNegotiationBlobV2GeneralInfo *)v9 setNtpTime:a3.wide];
    if ([(VCMediaNegotiationBlobV2GeneralInfo *)v10 abSwitches] != v5) {
      [(VCMediaNegotiationBlobV2GeneralInfo *)v10 setAbSwitches:v5];
    }
    unsigned int v11 = height;
    if (width >= 0x10000 && v11 >= 0x10000)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          uint64_t v16 = v13;
          __int16 v17 = 2080;
          v18 = "-[VCMediaNegotiationBlobV2GeneralInfo(Utils) initWithCreationTime:screenResolution:abSwitches:]";
          __int16 v19 = 1024;
          int v20 = 29;
          __int16 v21 = 1024;
          int v22 = (int)width;
          __int16 v23 = 1024;
          int v24 = (int)height;
          _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Screen size error: %dx%d", (uint8_t *)&v15, 0x28u);
        }
      }

      return 0;
    }
    else
    {
      [(VCMediaNegotiationBlobV2GeneralInfo *)v10 setScreenRes:v11 | (width << 16)];
    }
  }
  return v10;
}

- (CGSize)screenResolution
{
  double v3 = (double)((int)[(VCMediaNegotiationBlobV2GeneralInfo *)self screenRes] >> 16);
  double v4 = (double)(__int16)[(VCMediaNegotiationBlobV2GeneralInfo *)self screenRes];
  double v5 = v3;
  result.double height = v4;
  result.double width = v5;
  return result;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(VCMediaNegotiationBlobV2GeneralInfo *)self ntpTime];
  [(VCMediaNegotiationBlobV2GeneralInfo *)self screenResolution];
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"[%lu] %@", objc_msgSend((id)-[VCMediaNegotiationBlobV2GeneralInfo data](self, "data"), "length"), a4];
  objc_msgSend(v12, "appendFormat:", @"General Info: ntpTime=%f screenResolution=%d/%d ABSwitches=0x%08x", NTPToMicro(v7), (int)v9, (int)v11, -[VCMediaNegotiationBlobV2GeneralInfo abSwitches](self, "abSwitches"));
  char v13 = [v12 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v14, v15, v16, v17, v18, v19, v13);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    __int16 v21 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v23 = v20;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCMediaNegotiationBlobV2GeneralInfo(Utils) printWithLogFile:prefix:]";
      __int16 v26 = 1024;
      int v27 = 61;
      __int16 v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

@end