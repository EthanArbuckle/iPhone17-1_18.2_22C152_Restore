@interface HealthAppLinkBuilder
- (BOOL)useExternalURLScheme;
- (HKProfileIdentifier)profileIdentifier;
- (HealthAppLinkBuilder)init;
- (HealthAppLinkBuilder)initWithHealthStore:(id)a3;
- (HealthAppLinkBuilder)initWithHealthStore:(id)a3 useExternalURLScheme:(BOOL)a4;
- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3;
- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3 source:(id)a4;
- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3 source:(id)a4 useExternalURLScheme:(BOOL)a5;
- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3 useExternalURLScheme:(BOOL)a4;
- (NSString)source;
- (void)setSource:(id)a3;
- (void)setUseExternalURLScheme:(BOOL)a3;
@end

@implementation HealthAppLinkBuilder

- (HealthAppLinkBuilder)init
{
  v3 = [MEMORY[0x1E4F2B358] primaryProfile];
  v4 = [(HealthAppLinkBuilder *)self initWithProfileIdentifier:v3];

  return v4;
}

- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3
{
  return [(HealthAppLinkBuilder *)self initWithProfileIdentifier:a3 source:0 useExternalURLScheme:0];
}

- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3 source:(id)a4
{
  return [(HealthAppLinkBuilder *)self initWithProfileIdentifier:a3 source:a4 useExternalURLScheme:0];
}

- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3 useExternalURLScheme:(BOOL)a4
{
  return [(HealthAppLinkBuilder *)self initWithProfileIdentifier:a3 source:0 useExternalURLScheme:a4];
}

- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3 source:(id)a4 useExternalURLScheme:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HealthAppLinkBuilder;
  v11 = [(HealthAppLinkBuilder *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_profileIdentifier, a3);
    objc_storeStrong((id *)&v12->_source, a4);
    v12->_useExternalURLScheme = a5;
  }

  return v12;
}

- (HealthAppLinkBuilder)initWithHealthStore:(id)a3
{
  v4 = [a3 profileIdentifier];
  v5 = [(HealthAppLinkBuilder *)self initWithProfileIdentifier:v4 source:0 useExternalURLScheme:0];

  return v5;
}

- (HealthAppLinkBuilder)initWithHealthStore:(id)a3 useExternalURLScheme:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [a3 profileIdentifier];
  v7 = [(HealthAppLinkBuilder *)self initWithProfileIdentifier:v6 source:0 useExternalURLScheme:v4];

  return v7;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (BOOL)useExternalURLScheme
{
  return self->_useExternalURLScheme;
}

- (void)setUseExternalURLScheme:(BOOL)a3
{
  self->_useExternalURLScheme = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
}

@end