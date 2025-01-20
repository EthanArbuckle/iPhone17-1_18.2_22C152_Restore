@interface IDSServerMessagingOutgoingContext
- (IDSServerMessagingOutgoingContext)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (void)setIdentifier:(id)a3;
@end

@implementation IDSServerMessagingOutgoingContext

- (IDSServerMessagingOutgoingContext)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSServerMessagingOutgoingContext;
  v6 = [(IDSServerMessagingOutgoingContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end