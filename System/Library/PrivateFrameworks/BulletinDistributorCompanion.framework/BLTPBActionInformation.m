@interface BLTPBActionInformation
- (BOOL)hasContext;
- (BOOL)hasContextNulls;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)context;
- (NSData)contextNulls;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContext:(id)a3;
- (void)setContextNulls:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBActionInformation

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasContextNulls
{
  return self->_contextNulls != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBActionInformation;
  v4 = [(BLTPBActionInformation *)&v8 description];
  v5 = [(BLTPBActionInformation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  context = self->_context;
  if (context) {
    [v3 setObject:context forKey:@"context"];
  }
  contextNulls = self->_contextNulls;
  if (contextNulls) {
    [v4 setObject:contextNulls forKey:@"contextNulls"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBActionInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_context)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_contextNulls)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_context)
  {
    objc_msgSend(v4, "setContext:");
    id v4 = v5;
  }
  if (self->_contextNulls)
  {
    objc_msgSend(v5, "setContextNulls:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_context copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_contextNulls copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((context = self->_context, !((unint64_t)context | v4[1]))
     || -[NSData isEqual:](context, "isEqual:")))
  {
    contextNulls = self->_contextNulls;
    if ((unint64_t)contextNulls | v4[2]) {
      char v7 = -[NSData isEqual:](contextNulls, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_context hash];
  return [(NSData *)self->_contextNulls hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[BLTPBActionInformation setContext:](self, "setContext:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[BLTPBActionInformation setContextNulls:](self, "setContextNulls:");
    id v4 = v5;
  }
}

- (NSData)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSData)contextNulls
{
  return self->_contextNulls;
}

- (void)setContextNulls:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextNulls, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end