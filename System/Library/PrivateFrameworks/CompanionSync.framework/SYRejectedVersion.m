@interface SYRejectedVersion
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)inReplyTo;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)supportedVersionsCount;
- (unsigned)supportedVersions;
- (unsigned)supportedVersionsAtIndex:(unint64_t)a3;
- (void)addSupportedVersions:(unsigned int)a3;
- (void)clearSupportedVersions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHeader:(id)a3;
- (void)setInReplyTo:(id)a3;
- (void)setSupportedVersions:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation SYRejectedVersion

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SYRejectedVersion;
  [(SYRejectedVersion *)&v3 dealloc];
}

- (unint64_t)supportedVersionsCount
{
  return self->_supportedVersions.count;
}

- (unsigned)supportedVersions
{
  return self->_supportedVersions.list;
}

- (void)clearSupportedVersions
{
}

- (void)addSupportedVersions:(unsigned int)a3
{
}

- (unsigned)supportedVersionsAtIndex:(unint64_t)a3
{
  p_supportedVersions = &self->_supportedVersions;
  unint64_t count = self->_supportedVersions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_supportedVersions->list[a3];
}

- (void)setSupportedVersions:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYRejectedVersion;
  v4 = [(SYRejectedVersion *)&v8 description];
  v5 = [(SYRejectedVersion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(SYMessageHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  inReplyTo = self->_inReplyTo;
  if (inReplyTo) {
    [v3 setObject:inReplyTo forKey:@"inReplyTo"];
  }
  uint64_t v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"supportedVersions"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYRejectedVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYRejectedVersion writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_inReplyTo) {
    -[SYRejectedVersion writeTo:]();
  }
  PBDataWriterWriteStringField();
  p_supportedVersions = &self->_supportedVersions;
  if (p_supportedVersions->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < p_supportedVersions->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [v7 setHeader:self->_header];
  [v7 setInReplyTo:self->_inReplyTo];
  if ([(SYRejectedVersion *)self supportedVersionsCount])
  {
    [v7 clearSupportedVersions];
    unint64_t v4 = [(SYRejectedVersion *)self supportedVersionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addSupportedVersions:", -[SYRejectedVersion supportedVersionsAtIndex:](self, "supportedVersionsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  id v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_inReplyTo copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[4])) || -[SYMessageHeader isEqual:](header, "isEqual:"))
    && ((inReplyTo = self->_inReplyTo, !((unint64_t)inReplyTo | v4[5]))
     || -[NSString isEqual:](inReplyTo, "isEqual:")))
  {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_inReplyTo hash] ^ v3;
  return v4 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  header = self->_header;
  uint64_t v6 = v4[4];
  v10 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SYMessageHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SYRejectedVersion setHeader:](self, "setHeader:");
  }
  NSUInteger v4 = v10;
LABEL_7:
  if (v4[5])
  {
    -[SYRejectedVersion setInReplyTo:](self, "setInReplyTo:");
    NSUInteger v4 = v10;
  }
  uint64_t v7 = [v4 supportedVersionsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[SYRejectedVersion addSupportedVersions:](self, "addSupportedVersions:", [v10 supportedVersionsAtIndex:i]);
  }
}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)inReplyTo
{
  return self->_inReplyTo;
}

- (void)setInReplyTo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inReplyTo, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYRejectedVersion writeTo:]", "SYRejectedVersion.m", 154, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYRejectedVersion writeTo:]", "SYRejectedVersion.m", 159, "nil != self->_inReplyTo");
}

@end