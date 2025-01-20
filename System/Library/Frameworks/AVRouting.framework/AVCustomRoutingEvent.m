@interface AVCustomRoutingEvent
- (AVCustomDeviceRoute)route;
- (AVCustomRoutingEvent)init;
- (AVCustomRoutingEventReason)reason;
- (BOOL)succeeded;
- (id)description;
- (void)dealloc;
- (void)setReason:(int64_t)a3;
- (void)setRoute:(id)a3;
- (void)setSucceeded:(BOOL)a3;
@end

@implementation AVCustomRoutingEvent

- (AVCustomRoutingEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVCustomRoutingEvent;
  return [(AVCustomRoutingEvent *)&v3 init];
}

- (void)dealloc
{
  self->_route = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVCustomRoutingEvent;
  [(AVCustomRoutingEvent *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  AVCustomRoutingEventReason v4 = [(AVCustomRoutingEvent *)self reason];
  if ((unint64_t)v4 > AVCustomRoutingEventReasonReactivate) {
    v5 = @"?";
  }
  else {
    v5 = off_264259D60[v4];
  }
  return (id)[v3 stringWithFormat:@"<reason: %@, route: %@>", v5, -[AVCustomRoutingEvent route](self, "route")];
}

- (void)setRoute:(id)a3
{
  self->_route = (AVCustomDeviceRoute *)a3;
}

- (AVCustomDeviceRoute)route
{
  return self->_route;
}

- (AVCustomRoutingEventReason)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

@end