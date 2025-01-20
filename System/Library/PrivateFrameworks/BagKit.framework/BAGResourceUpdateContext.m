@interface BAGResourceUpdateContext
+ (BOOL)supportsSecureCoding;
- (BAGResourceUpdateContext)initWithCoder:(id)a3;
- (BAGResourceUpdateContext)initWithLoadState:(unint64_t)a3 error:(id)a4;
- (NSError)error;
- (id)description;
- (unint64_t)loadState;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setLoadState:(unint64_t)a3;
@end

@implementation BAGResourceUpdateContext

- (BAGResourceUpdateContext)initWithLoadState:(unint64_t)a3 error:(id)a4
{
  id v8 = a4;
  if (!BAGIsValidLoadState(a3))
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGResourceUpdateContext.m", 22, @"Invalid parameter not satisfying: %@", @"BAGIsValidLoadState(loadState)" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)BAGResourceUpdateContext;
  v9 = [(BAGResourceUpdateContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_loadState = a3;
    objc_storeStrong((id *)&v9->_error, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAGResourceUpdateContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"loadState"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];

  v7 = [(BAGResourceUpdateContext *)self initWithLoadState:v5 error:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BAGResourceUpdateContext loadState](self, "loadState"), @"loadState");
  id v5 = [(BAGResourceUpdateContext *)self error];
  [v4 encodeObject:v5 forKey:@"error"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = BAGResourceLoadStateToString([(BAGResourceUpdateContext *)self loadState]);
  v6 = [(BAGResourceUpdateContext *)self error];
  v7 = [v3 stringWithFormat:@"<%@ : %p loadState: %@, error: %@>", v4, self, v5, v6];

  return v7;
}

- (unint64_t)loadState
{
  return self->_loadState;
}

- (void)setLoadState:(unint64_t)a3
{
  self->_loadState = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end