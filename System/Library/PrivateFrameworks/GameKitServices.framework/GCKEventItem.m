@interface GCKEventItem
- ($152105ACA10D7302EB217028A84A31FC)event;
- (GCKEventItem)init;
- (GCKEventItem)initWithEvent:(id *)a3 remotePeer:(unsigned int)a4;
- (unsigned)pid;
- (void)dealloc;
- (void)setEvent:(id *)a3;
- (void)setPid:(unsigned int)a3;
@end

@implementation GCKEventItem

- (GCKEventItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCKEventItem;
  return [(GCKEventItem *)&v3 init];
}

- (GCKEventItem)initWithEvent:(id *)a3 remotePeer:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GCKEventItem;
  result = [(GCKEventItem *)&v7 init];
  if (result)
  {
    result->_event = a3;
    result->_pid = a4;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GCKEventItem;
  [(GCKEventItem *)&v2 dealloc];
}

- ($152105ACA10D7302EB217028A84A31FC)event
{
  return self->_event;
}

- (void)setEvent:(id *)a3
{
  self->_event = a3;
}

- (unsigned)pid
{
  return self->_pid;
}

- (void)setPid:(unsigned int)a3
{
  self->_pid = a3;
}

@end