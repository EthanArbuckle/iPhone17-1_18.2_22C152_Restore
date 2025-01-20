@interface MSMessageLiveLayout
+ (BOOL)supportsSecureCoding;
- (MSMessageLiveLayout)init;
- (MSMessageLiveLayout)initWithAlternateLayout:(MSMessageTemplateLayout *)alternateLayout;
- (MSMessageLiveLayout)initWithCoder:(id)a3;
- (MSMessageTemplateLayout)alternateLayout;
- (NSArray)requiredCapabilities;
- (id)_sanitizedCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRequiredCapabilities:(id)a3;
@end

@implementation MSMessageLiveLayout

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSMessageLiveLayout)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = [NSString stringWithFormat:@"-init is unavailable. Please use -initWithAlternateLayout: instead."];
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (MSMessageLiveLayout)initWithAlternateLayout:(MSMessageTemplateLayout *)alternateLayout
{
  id v5 = alternateLayout;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"An alternate layout is required for display on devices that don't have this app installed." userInfo:0];
    objc_exception_throw(v10);
  }
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)MSMessageLiveLayout;
  v7 = [(MSMessageLayout *)&v11 _init];
  v8 = (MSMessageLiveLayout *)v7;
  if (v7) {
    objc_storeStrong(v7 + 2, alternateLayout);
  }

  return v8;
}

- (MSMessageLiveLayout)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v7 = [v4 setWithArray:v6];

  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"alternateLayout"];
  v9 = [(MSMessageLiveLayout *)self initWithAlternateLayout:v8];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v12 = [v10 setWithArray:v11];

  v13 = [v5 decodeObjectOfClasses:v12 forKey:@"requiredCapabilities"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MSMessageLiveLayout *)v9 setRequiredCapabilities:v13];
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  alternateLayout = self->_alternateLayout;
  id v5 = a3;
  [v5 encodeObject:alternateLayout forKey:@"alternateLayout"];
  [v5 encodeObject:self->_requiredCapabilities forKey:@"requiredCapabilities"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[MSMessageTemplateLayout copyWithZone:](self->_alternateLayout, "copyWithZone:");
  v6 = [+[MSMessageLiveLayout allocWithZone:a3] initWithAlternateLayout:v5];
  v7 = [(MSMessageLiveLayout *)self requiredCapabilities];
  [(MSMessageLiveLayout *)v6 setRequiredCapabilities:v7];

  return v6;
}

- (id)_sanitizedCopy
{
  uint64_t v3 = [MSMessageLiveLayout alloc];
  v4 = [(MSMessageLiveLayout *)self alternateLayout];
  id v5 = [v4 _sanitizedCopy];
  v6 = [(MSMessageLiveLayout *)v3 initWithAlternateLayout:v5];

  v7 = [(MSMessageLiveLayout *)self requiredCapabilities];
  [(MSMessageLiveLayout *)v6 setRequiredCapabilities:v7];

  return v6;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (MSMessageTemplateLayout)alternateLayout
{
  return self->_alternateLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateLayout, 0);

  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
}

@end