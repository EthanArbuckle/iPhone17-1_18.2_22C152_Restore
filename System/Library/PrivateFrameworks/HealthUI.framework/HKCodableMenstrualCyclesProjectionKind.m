@interface HKCodableMenstrualCyclesProjectionKind
- (BOOL)hasKind;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)kind;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKind:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableMenstrualCyclesProjectionKind

- (void)setKind:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  if (self->_kind) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)hasKind
{
  return self->_kind != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableMenstrualCyclesProjectionKind;
  v4 = [(HKCodableMenstrualCyclesProjectionKind *)&v8 description];
  v5 = [(HKCodableMenstrualCyclesProjectionKind *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  kind = self->_kind;
  if (kind) {
    [v3 setObject:kind forKey:@"kind"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableMenstrualCyclesProjectionKindReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  kind = self->_kind;
  if (kind) {
    [a3 setKind:kind];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_kind copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    kind = self->_kind;
    if ((unint64_t)kind | v4[1]) {
      char v6 = -[NSString isEqual:](kind, "isEqual:");
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
  return [(NSString *)self->_kind hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[HKCodableMenstrualCyclesProjectionKind setKind:](self, "setKind:");
  }
}

- (NSString)kind
{
  return self->_kind;
}

@end