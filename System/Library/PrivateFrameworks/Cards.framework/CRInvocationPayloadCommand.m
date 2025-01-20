@interface CRInvocationPayloadCommand
- (NSString)invocationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setInvocationIdentifier:(id)a3;
@end

@implementation CRInvocationPayloadCommand

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRInvocationPayloadCommand;
  id v5 = -[CRBasicPayloadCommand copyWithZone:](&v9, sel_copyWithZone_);
  v6 = [(CRInvocationPayloadCommand *)self invocationIdentifier];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setInvocationIdentifier:v7];

  return v5;
}

- (NSString)invocationIdentifier
{
  return self->_invocationIdentifier;
}

- (void)setInvocationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end