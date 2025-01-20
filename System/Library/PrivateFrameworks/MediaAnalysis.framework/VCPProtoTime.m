@interface VCPProtoTime
+ (VCPProtoTime)timeWithCMTime:(id *)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)timescale;
- (int64_t)epoch;
- (int64_t)value;
- (unint64_t)hash;
- (unsigned)flags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEpoch:(int64_t)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setTimescale:(int)a3;
- (void)setValue:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoTime

+ (VCPProtoTime)timeWithCMTime:(id *)a3
{
  v4 = objc_alloc_init(VCPProtoTime);
  [(VCPProtoTime *)v4 setValue:a3->var0];
  [(VCPProtoTime *)v4 setTimescale:a3->var1];
  [(VCPProtoTime *)v4 setFlags:a3->var2];
  [(VCPProtoTime *)v4 setEpoch:a3->var3];
  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeValue
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = [(VCPProtoTime *)self value];
  retstr->var1 = [(VCPProtoTime *)self timescale];
  retstr->var2 = [(VCPProtoTime *)self flags];
  result = [(VCPProtoTime *)self epoch];
  retstr->var3 = (int64_t)result;
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoTime;
  v4 = [(VCPProtoTime *)&v8 description];
  v5 = [(VCPProtoTime *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithLongLong:self->_value];
  [v3 setObject:v4 forKey:@"value"];

  v5 = [NSNumber numberWithInt:self->_timescale];
  [v3 setObject:v5 forKey:@"timescale"];

  v6 = [NSNumber numberWithUnsignedInt:self->_flags];
  [v3 setObject:v6 forKey:@"flags"];

  v7 = [NSNumber numberWithLongLong:self->_epoch];
  [v3 setObject:v7 forKey:@"epoch"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoTimeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 2) = self->_value;
  *((_DWORD *)a3 + 7) = self->_timescale;
  *((_DWORD *)a3 + 6) = self->_flags;
  *((void *)a3 + 1) = self->_epoch;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 2) = self->_value;
  *((_DWORD *)result + 7) = self->_timescale;
  *((_DWORD *)result + 6) = self->_flags;
  *((void *)result + 1) = self->_epoch;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_value == *((void *)v4 + 2)
    && self->_timescale == *((_DWORD *)v4 + 7)
    && self->_flags == *((_DWORD *)v4 + 6)
    && self->_epoch == *((void *)v4 + 1);

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_timescale) ^ (2654435761 * self->_value) ^ (2654435761 * self->_flags) ^ (2654435761 * self->_epoch);
}

- (void)mergeFrom:(id)a3
{
  self->_value = *((void *)a3 + 2);
  self->_timescale = *((_DWORD *)a3 + 7);
  self->_flags = *((_DWORD *)a3 + 6);
  self->_epoch = *((void *)a3 + 1);
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (int)timescale
{
  return self->_timescale;
}

- (void)setTimescale:(int)a3
{
  self->_timescale = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(int64_t)a3
{
  self->_epoch = a3;
}

@end