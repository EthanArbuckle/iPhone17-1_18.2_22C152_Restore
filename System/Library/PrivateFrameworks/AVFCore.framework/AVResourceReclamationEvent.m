@interface AVResourceReclamationEvent
- (AVResourceReclamationEvent)initWithEventIdentifier:(id)a3;
- (BOOL)happenedAfter:(id)a3;
- (BOOL)happenedBefore:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)copy;
- (id)eventIdentifier;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVResourceReclamationEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVResourceReclamationEvent;
  [(AVResourceReclamationEvent *)&v3 dealloc];
}

- (AVResourceReclamationEvent)initWithEventIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVResourceReclamationEvent;
  v4 = [(AVResourceReclamationEvent *)&v6 init];
  if (v4) {
    v4->_eventIdentifier = (NSNumber *)[a3 copy];
  }
  return v4;
}

- (id)copy
{
  return [(AVResourceReclamationEvent *)self copyWithZone:0];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  eventIdentifier = self->_eventIdentifier;
  uint64_t v6 = *((void *)a3 + 1);
  return [(NSNumber *)eventIdentifier isEqual:v6];
}

- (unint64_t)hash
{
  return [(NSNumber *)self->_eventIdentifier hash];
}

- (id)eventIdentifier
{
  return self->_eventIdentifier;
}

- (BOOL)happenedAfter:(id)a3
{
  if (!a3) {
    return 1;
  }
  unint64_t v4 = [(NSNumber *)self->_eventIdentifier unsignedLongLongValue];
  return v4 > objc_msgSend((id)objc_msgSend(a3, "eventIdentifier"), "unsignedLongLongValue");
}

- (BOOL)happenedBefore:(id)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t v4 = [(NSNumber *)self->_eventIdentifier unsignedLongLongValue];
  return v4 < objc_msgSend((id)objc_msgSend(a3, "eventIdentifier"), "unsignedLongLongValue");
}

@end