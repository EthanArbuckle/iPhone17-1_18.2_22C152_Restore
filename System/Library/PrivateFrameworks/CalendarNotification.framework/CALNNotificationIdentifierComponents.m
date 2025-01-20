@interface CALNNotificationIdentifierComponents
- (CALNNotificationIdentifierComponents)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4;
- (NSString)sourceClientIdentifier;
- (NSString)sourceIdentifier;
- (id)description;
@end

@implementation CALNNotificationIdentifierComponents

- (CALNNotificationIdentifierComponents)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNNotificationIdentifierComponents;
  v8 = [(CALNNotificationIdentifierComponents *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sourceIdentifier = v8->_sourceIdentifier;
    v8->_sourceIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    sourceClientIdentifier = v8->_sourceClientIdentifier;
    v8->_sourceClientIdentifier = (NSString *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CALNNotificationIdentifierComponents *)self sourceIdentifier];
  id v6 = [(CALNNotificationIdentifierComponents *)self sourceClientIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@: %p>(sourceIdentifier = %@, sourceClientIdentifier = %@)", v4, self, v5, v6];

  return v7;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end