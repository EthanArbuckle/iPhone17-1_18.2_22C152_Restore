@interface GEODirectionIntent
- (GEODirectionIntent)initWithDirectionIntent:(id)a3;
- (GEOResolvedItem)destination;
- (GEOResolvedItem)origin;
- (int)transportType;
@end

@implementation GEODirectionIntent

- (GEODirectionIntent)initWithDirectionIntent:(id)a3
{
  v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)GEODirectionIntent;
  v5 = [(GEODirectionIntent *)&v16 init];
  v6 = v5;
  if (v4 && v5)
  {
    -[GEOPDDirectionIntent _readOrigin]((uint64_t)v4);
    if (v4[4])
    {
      v7 = [GEOResolvedItem alloc];
      v8 = -[GEOPDDirectionIntent origin](v4);
      uint64_t v9 = [(GEOResolvedItem *)v7 initWithResolvedItem:v8];
      origin = v6->_origin;
      v6->_origin = (GEOResolvedItem *)v9;
    }
    -[GEOPDDirectionIntent _readDestination]((uint64_t)v4);
    if (v4[3])
    {
      v11 = [GEOResolvedItem alloc];
      v12 = -[GEOPDDirectionIntent destination](v4);
      uint64_t v13 = [(GEOResolvedItem *)v11 initWithResolvedItem:v12];
      destination = v6->_destination;
      v6->_destination = (GEOResolvedItem *)v13;
    }
    if ((_BYTE)v4[7]) {
      v6->_transportType = -[GEOPDDirectionIntent transportType]((uint64_t)v4);
    }
  }

  return v6;
}

- (GEOResolvedItem)origin
{
  return self->_origin;
}

- (GEOResolvedItem)destination
{
  return self->_destination;
}

- (int)transportType
{
  return self->_transportType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_origin, 0);
}

@end