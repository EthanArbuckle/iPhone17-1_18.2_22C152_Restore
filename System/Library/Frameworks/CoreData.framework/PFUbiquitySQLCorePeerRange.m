@interface PFUbiquitySQLCorePeerRange
- (PFUbiquitySQLCorePeerRange)initWithOwningPeerID:(id)a3 entityName:(id)a4 rangeStart:(id)a5 rangeEnd:(id)a6 peerStart:(id)a7 peerEnd:(id)a8;
- (id)description;
- (void)dealloc;
@end

@implementation PFUbiquitySQLCorePeerRange

- (PFUbiquitySQLCorePeerRange)initWithOwningPeerID:(id)a3 entityName:(id)a4 rangeStart:(id)a5 rangeEnd:(id)a6 peerStart:(id)a7 peerEnd:(id)a8
{
  v14 = [(PFUbiquitySQLCorePeerRange *)self init];
  if (v14)
  {
    v14->_owningPeerID = (NSString *)a3;
    v14->_entityName = (NSString *)[a4 copy];
    v14->_rangeStart = (NSNumber *)a5;
    v14->_rangeEnd = (NSNumber *)a6;
    v14->_peerStart = (NSNumber *)a7;
    v14->_peerEnd = (NSNumber *)a8;
  }
  return v14;
}

- (void)dealloc
{
  self->_owningPeerID = 0;
  self->_entityName = 0;

  self->_rangeStart = 0;
  self->_rangeEnd = 0;

  self->_peerStart = 0;
  self->_peerEnd = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySQLCorePeerRange;
  [(PFUbiquitySQLCorePeerRange *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PFUbiquitySQLCorePeerRange;
  id v4 = [(PFUbiquitySQLCorePeerRange *)&v12 description];
  if (self)
  {
    owningPeerID = self->_owningPeerID;
    entityName = self->_entityName;
    rangeStart = self->_rangeStart;
    rangeEnd = self->_rangeEnd;
    peerStart = self->_peerStart;
    peerEnd = self->_peerEnd;
  }
  else
  {
    peerStart = 0;
    rangeStart = 0;
    owningPeerID = 0;
    entityName = 0;
    rangeEnd = 0;
    peerEnd = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\towningPeerID: %@\n\tentityName: %@\n\trangeStart: %@\n\trangeEnd: %@\n\tpeerStart: %@\n\tpeerEnd: %@\n", v4, owningPeerID, entityName, rangeStart, rangeEnd, peerStart, peerEnd];
}

@end