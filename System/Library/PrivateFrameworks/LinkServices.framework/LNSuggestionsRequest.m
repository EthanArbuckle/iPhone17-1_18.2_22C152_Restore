@interface LNSuggestionsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isExplicitRequest;
- (BOOL)isOnScreen;
- (LNSuggestionsRequest)initWithBundleIdentifier:(id)a3 onScreen:(BOOL)a4 explicitRequest:(BOOL)a5;
- (LNSuggestionsRequest)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSuggestionsRequest

- (void).cxx_destruct
{
}

- (BOOL)isExplicitRequest
{
  return self->_explicitRequest;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(LNSuggestionsRequest *)self bundleIdentifier];
  [v5 encodeObject:v4 forKey:@"bundleIdentifier"];

  objc_msgSend(v5, "encodeBool:forKey:", -[LNSuggestionsRequest isOnScreen](self, "isOnScreen"), @"onScreen");
  objc_msgSend(v5, "encodeBool:forKey:", -[LNSuggestionsRequest isExplicitRequest](self, "isExplicitRequest"), @"explicitRequest");
}

- (LNSuggestionsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  uint64_t v6 = [v4 decodeBoolForKey:@"onScreen"];
  uint64_t v7 = [v4 decodeBoolForKey:@"explicitRequest"];

  v8 = [(LNSuggestionsRequest *)self initWithBundleIdentifier:v5 onScreen:v6 explicitRequest:v7];
  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNSuggestionsRequest *)self bundleIdentifier];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p, bundleIdentifier: %@, onScreen: %d, explicitRequest: %d>", v5, self, v6, -[LNSuggestionsRequest isOnScreen](self, "isOnScreen"), -[LNSuggestionsRequest isExplicitRequest](self, "isExplicitRequest")];

  return v7;
}

- (LNSuggestionsRequest)initWithBundleIdentifier:(id)a3 onScreen:(BOOL)a4 explicitRequest:(BOOL)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LNSuggestionsRequest;
  v9 = [(LNSuggestionsRequest *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

    v9->_onScreen = a4;
    v9->_explicitRequest = a5;
    v12 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end