@interface SASBoardServicesConfiguration
+ (id)configuration;
+ (id)new;
- (NSString)machServiceIdentifier;
- (NSString)presentationDomain;
- (NSString)presentationIdentifier;
- (NSString)signalDomain;
- (NSString)signalIdentifier;
- (SASBoardServicesConfiguration)init;
- (id)_init;
- (id)domainForService:(int64_t)a3;
- (id)identifierForService:(int64_t)a3;
- (void)setMachServiceIdentifier:(id)a3;
- (void)setPresentationDomain:(id)a3;
- (void)setPresentationIdentifier:(id)a3;
- (void)setSignalDomain:(id)a3;
- (void)setSignalIdentifier:(id)a3;
@end

@implementation SASBoardServicesConfiguration

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)SASBoardServicesConfiguration;
  v2 = [(SASBoardServicesConfiguration *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SASBoardServicesConfiguration *)v2 setMachServiceIdentifier:@"com.apple.siri.activation.service"];
    [(SASBoardServicesConfiguration *)v3 setPresentationDomain:@"com.apple.siri.activation"];
    [(SASBoardServicesConfiguration *)v3 setPresentationIdentifier:@"com.apple.siri.activation.presentation"];
    [(SASBoardServicesConfiguration *)v3 setSignalDomain:@"com.apple.siri.activation"];
    [(SASBoardServicesConfiguration *)v3 setSignalIdentifier:@"com.apple.siri.activation.signal"];
  }
  return v3;
}

- (SASBoardServicesConfiguration)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

+ (id)configuration
{
  if (qword_100171E60 != -1) {
    dispatch_once(&qword_100171E60, &stru_100144800);
  }
  v2 = (void *)qword_100171E58;

  return v2;
}

- (id)domainForService:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(SASBoardServicesConfiguration *)self signalDomain];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v3 = [(SASBoardServicesConfiguration *)self presentationDomain];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)identifierForService:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(SASBoardServicesConfiguration *)self signalIdentifier];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v3 = [(SASBoardServicesConfiguration *)self presentationIdentifier];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (NSString)machServiceIdentifier
{
  return self->_machServiceIdentifier;
}

- (void)setMachServiceIdentifier:(id)a3
{
}

- (NSString)presentationDomain
{
  return self->_presentationDomain;
}

- (void)setPresentationDomain:(id)a3
{
}

- (NSString)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void)setPresentationIdentifier:(id)a3
{
}

- (NSString)signalDomain
{
  return self->_signalDomain;
}

- (void)setSignalDomain:(id)a3
{
}

- (NSString)signalIdentifier
{
  return self->_signalIdentifier;
}

- (void)setSignalIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalIdentifier, 0);
  objc_storeStrong((id *)&self->_signalDomain, 0);
  objc_storeStrong((id *)&self->_presentationIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationDomain, 0);

  objc_storeStrong((id *)&self->_machServiceIdentifier, 0);
}

@end