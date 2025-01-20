@interface PKReplicaEntry
- (BOOL)inUse;
- (PKDrawingConcrete)drawing;
- (PKReplicaEntry)initWithCoder:(id)a3;
- (PKReplicaEntry)initWithReplicaUUIDIndex:(unsigned int)a3 clock:(unsigned int)a4 subclock:(unsigned int)a5 inUse:(BOOL)a6 forDrawing:(id)a7;
- (id)description;
- (unsigned)clock;
- (unsigned)replicaUUIDIndex;
- (unsigned)subclock;
- (void)encodeWithCoder:(id)a3;
- (void)setClock:(unsigned int)a3;
- (void)setDrawing:(id)a3;
- (void)setInUse:(BOOL)a3;
- (void)setReplicaUUIDIndex:(unsigned int)a3;
- (void)setSubclock:(unsigned int)a3;
@end

@implementation PKReplicaEntry

- (PKReplicaEntry)initWithReplicaUUIDIndex:(unsigned int)a3 clock:(unsigned int)a4 subclock:(unsigned int)a5 inUse:(BOOL)a6 forDrawing:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)PKReplicaEntry;
  result = [(PKReplicaEntry *)&v13 init];
  if (result)
  {
    result->_replicaUUIDIndex = a3;
    result->_clock = a4;
    result->_subclock = a5;
    result->_inUse = a6;
    result->_drawing = (PKDrawingConcrete *)a7;
  }
  return result;
}

- (PKReplicaEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKReplicaEntry;
  v5 = [(PKReplicaEntry *)&v7 init];
  if (v5)
  {
    v5->_replicaUUIDIndex = [v4 decodeInt64ForKey:@"ReplicaIndex"];
    v5->_clock = [v4 decodeInt64ForKey:@"ReplicaClock"];
    v5->_subclock = [v4 decodeInt64ForKey:@"ReplicaSubclock"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_replicaUUIDIndex forKey:@"ReplicaIndex"];
  [v4 encodeInt64:self->_clock forKey:@"ReplicaClock"];
  [v4 encodeInt64:self->_subclock forKey:@"ReplicaSubclock"];
}

- (id)description
{
  v2 = @"In Use";
  if (!self->_inUse) {
    v2 = @"Available";
  }
  return (id)[NSString stringWithFormat:@"Replica %d: %d.%d (%@)", self->_replicaUUIDIndex, self->_clock, self->_subclock, v2];
}

- (unsigned)replicaUUIDIndex
{
  return self->_replicaUUIDIndex;
}

- (void)setReplicaUUIDIndex:(unsigned int)a3
{
  self->_replicaUUIDIndex = a3;
}

- (unsigned)clock
{
  return self->_clock;
}

- (void)setClock:(unsigned int)a3
{
  self->_clock = a3;
}

- (unsigned)subclock
{
  return self->_subclock;
}

- (void)setSubclock:(unsigned int)a3
{
  self->_subclock = a3;
}

- (BOOL)inUse
{
  return self->_inUse;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (PKDrawingConcrete)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  self->_drawing = (PKDrawingConcrete *)a3;
}

@end