@interface LNAssistantContext
+ (BOOL)supportsSecureCoding;
- (LNAssistantContext)initWithCoder:(id)a3;
- (LNAssistantContext)initWithSessionIdentifier:(id)a3;
- (LNAssistantContext)initWithSessionIdentifier:(id)a3 locale:(id)a4;
- (LNAssistantContext)initWithSessionIdentifier:(id)a3 requestIdentifier:(id)a4 locale:(id)a5;
- (NSString)locale;
- (NSString)requestIdentifier;
- (NSString)sessionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation LNAssistantContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (LNAssistantContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestIdentifier"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    self = [(LNAssistantContext *)self initWithSessionIdentifier:v5 requestIdentifier:v6 locale:v7];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAssistantContext *)self sessionIdentifier];
  [v4 encodeObject:v5 forKey:@"sessionIdentifier"];

  v6 = [(LNAssistantContext *)self requestIdentifier];
  [v4 encodeObject:v6 forKey:@"requestIdentifier"];

  id v7 = [(LNAssistantContext *)self locale];
  [v4 encodeObject:v7 forKey:@"locale"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNAssistantContext *)self sessionIdentifier];
  id v7 = [(LNAssistantContext *)self requestIdentifier];
  v8 = [(LNAssistantContext *)self locale];
  v9 = [v3 stringWithFormat:@"<%@: %p, sessionIdentifier: %@, requestIdentifier: %@, locale: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  v5 = [(LNAssistantContext *)self sessionIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setSessionIdentifier:v6];

  id v7 = [(LNAssistantContext *)self requestIdentifier];
  v8 = (void *)[v7 copy];
  [v4 setRequestIdentifier:v8];

  v9 = [(LNAssistantContext *)self locale];
  v10 = (void *)[v9 copy];
  [v4 setLocale:v10];

  return v4;
}

- (LNAssistantContext)initWithSessionIdentifier:(id)a3
{
  return [(LNAssistantContext *)self initWithSessionIdentifier:a3 requestIdentifier:0 locale:0];
}

- (LNAssistantContext)initWithSessionIdentifier:(id)a3 locale:(id)a4
{
  return [(LNAssistantContext *)self initWithSessionIdentifier:a3 requestIdentifier:0 locale:a4];
}

- (LNAssistantContext)initWithSessionIdentifier:(id)a3 requestIdentifier:(id)a4 locale:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNAssistantContext.m", 16, @"Invalid parameter not satisfying: %@", @"sessionIdentifier" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)LNAssistantContext;
  v12 = [(LNAssistantContext *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    sessionIdentifier = v12->_sessionIdentifier;
    v12->_sessionIdentifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    requestIdentifier = v12->_requestIdentifier;
    v12->_requestIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    locale = v12->_locale;
    v12->_locale = (NSString *)v17;

    v19 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end