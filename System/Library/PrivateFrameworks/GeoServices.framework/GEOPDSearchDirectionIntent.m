@interface GEOPDSearchDirectionIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchDirectionIntent

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchDirectionIntent;
  v4 = [(GEOPDSearchDirectionIntent *)&v8 description];
  v5 = [(GEOPDSearchDirectionIntent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchDirectionIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = *(id *)(a1 + 8);
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"directionIntent";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"direction_intent";
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
  return -[GEOPDSearchDirectionIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchDirectionIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  if (self->_directionIntent) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDDirectionIntent *)self->_directionIntent copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    directionIntent = self->_directionIntent;
    if ((unint64_t)directionIntent | v4[1]) {
      char v6 = -[GEOPDDirectionIntent isEqual:](directionIntent, "isEqual:");
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
  return [(GEOPDDirectionIntent *)self->_directionIntent hash];
}

- (void).cxx_destruct
{
}

@end