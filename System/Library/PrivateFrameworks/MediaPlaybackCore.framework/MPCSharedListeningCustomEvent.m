@interface MPCSharedListeningCustomEvent
- (MPCSharedListeningCustomEvent)initWithLocalizedMessage:(id)a3;
- (NSString)localizedMessage;
- (id)description;
@end

@implementation MPCSharedListeningCustomEvent

- (void).cxx_destruct
{
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<MPCSharedListeningCustomEvent: %p localizedMessage=\"%@\">", self, self->_localizedMessage];
}

- (MPCSharedListeningCustomEvent)initWithLocalizedMessage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCSharedListeningCustomEvent;
  v5 = [(MPCSharedListeningCustomEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    localizedMessage = v5->_localizedMessage;
    v5->_localizedMessage = (NSString *)v6;
  }
  return v5;
}

@end