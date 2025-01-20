@interface _GEOTransitConnectionInfo
- (GEOMapItemIdentifier)itemIdentifier;
- (NSArray)labelItems;
- (NSString)name;
- (NSURL)urlToOpen;
- (_GEOTransitConnectionInfo)initWithConnection:(id)a3 providerID:(int)a4;
- (int)providerID;
- (unint64_t)muid;
@end

@implementation _GEOTransitConnectionInfo

- (_GEOTransitConnectionInfo)initWithConnection:(id)a3 providerID:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GEOTransitConnectionInfo;
  v8 = [(_GEOTransitConnectionInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_providerID = a4;
  }

  return v9;
}

- (unint64_t)muid
{
  connection = self->_connection;
  if (connection) {
    return connection->_muid;
  }
  else {
    return 0;
  }
}

- (NSString)name
{
  return -[GEOPDTransitConnection entityNameString]((id *)&self->_connection->super.super.isa);
}

- (NSArray)labelItems
{
  return (NSArray *)-[GEOPDTransitConnection transitLabels]((id *)&self->_connection->super.super.isa);
}

- (int)providerID
{
  return self->_providerID;
}

- (NSURL)urlToOpen
{
  v3 = [GEOMapURLBuilder alloc];
  v4 = [(_GEOTransitConnectionInfo *)self name];
  id v5 = [(GEOMapURLBuilder *)v3 initForInternalBusiness:v4 id:[(_GEOTransitConnectionInfo *)self muid] provider:[(_GEOTransitConnectionInfo *)self providerID]];

  v6 = -[GEOPDTransitConnection mapsId]((id *)&self->_connection->super.super.isa);
  id v7 = [v6 shardedId];
  int v8 = [v7 hasCenter];

  if (v8)
  {
    v9 = -[GEOPDTransitConnection mapsId]((id *)&self->_connection->super.super.isa);
    v10 = [v9 shardedId];
    objc_super v11 = [v10 center];
    [v11 coordinate];
    objc_msgSend(v5, "setBusinessCoordinate:");
  }
  [v5 setMapType:3];
  v12 = [v5 buildForWeb];

  return (NSURL *)v12;
}

- (GEOMapItemIdentifier)itemIdentifier
{
  v3 = [GEOMapItemIdentifier alloc];
  unint64_t v4 = [(_GEOTransitConnectionInfo *)self muid];
  uint64_t v5 = [(_GEOTransitConnectionInfo *)self providerID];
  v6 = -[GEOPDTransitConnection mapsId]((id *)&self->_connection->super.super.isa);
  id v7 = [v6 shardedId];
  int v8 = [v7 center];
  [v8 coordinate];
  v9 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](v3, "initWithMUID:resultProviderID:coordinate:", v4, v5);

  return v9;
}

- (void).cxx_destruct
{
}

@end