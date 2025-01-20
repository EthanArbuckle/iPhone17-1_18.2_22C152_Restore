@interface IDSOffGridModeOptions
+ (BOOL)supportsSecureCoding;
- (IDSOffGridModeOptions)init;
- (IDSOffGridModeOptions)initWithCoder:(id)a3;
- (NSString)entryPointSource;
- (void)encodeWithCoder:(id)a3;
- (void)setEntryPointSource:(id)a3;
@end

@implementation IDSOffGridModeOptions

- (IDSOffGridModeOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridModeOptions;
  return [(IDSOffGridModeOptions *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (IDSOffGridModeOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(IDSOffGridModeOptions);
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entry-point-source"];

  [(IDSOffGridModeOptions *)v5 setEntryPointSource:v6];
  return v5;
}

- (NSString)entryPointSource
{
  return self->_entryPointSource;
}

- (void)setEntryPointSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end