@interface MFDOpenComposeDelegateConfiguration
- (BOOL)isEntitledDelegate;
- (MFDOpenComposeDelegateConfiguration)initWithIdentifier:(id)a3 delegateEndpoint:(id)a4 isEntitledDelegate:(BOOL)a5;
- (NSString)identifier;
- (NSXPCListenerEndpoint)delegateEndpoint;
- (id)description;
- (void)setDelegateEndpoint:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsEntitledDelegate:(BOOL)a3;
@end

@implementation MFDOpenComposeDelegateConfiguration

- (MFDOpenComposeDelegateConfiguration)initWithIdentifier:(id)a3 delegateEndpoint:(id)a4 isEntitledDelegate:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MFDOpenComposeDelegateConfiguration;
  v11 = [(MFDOpenComposeDelegateConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_delegateEndpoint, a4);
    v12->_isEntitledDelegate = a5;
  }

  return v12;
}

- (id)description
{
  v3 = [(MFDOpenComposeDelegateConfiguration *)self identifier];
  BOOL isEntitledDelegate = self->_isEntitledDelegate;
  uint64_t v5 = [(MFDOpenComposeDelegateConfiguration *)self delegateEndpoint];
  v6 = (void *)v5;
  CFStringRef v7 = @"entitled ";
  if (!isEntitledDelegate) {
    CFStringRef v7 = &stru_10013ED08;
  }
  v8 = +[NSString stringWithFormat:@"<MFDOpenComposeDelegateConfiguration: %p> identifier:%@ %@delegateEndpoint:%@", self, v3, v7, v5];

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSXPCListenerEndpoint)delegateEndpoint
{
  return self->_delegateEndpoint;
}

- (void)setDelegateEndpoint:(id)a3
{
}

- (BOOL)isEntitledDelegate
{
  return self->_isEntitledDelegate;
}

- (void)setIsEntitledDelegate:(BOOL)a3
{
  self->_BOOL isEntitledDelegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateEndpoint, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end