@interface SGPSInteractionLookup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPSInteractionLookup:(id)a3;
- (NSString)detail;
- (SGPSInteractionLookup)initWithCoder:(id)a3;
- (SGPSInteractionLookup)initWithDetail:(id)a3;
- (id)description;
- (id)interactionInformation;
- (id)interactionString;
- (id)resolveAppNameForBundleId:(id)a3;
- (id)resourceBundle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGPSInteractionLookup

- (void).cxx_destruct
{
}

- (NSString)detail
{
  return self->_detail;
}

- (id)resourceBundle
{
  return (id)[MEMORY[0x1E4F28B50] bundleWithIdentifier:*MEMORY[0x1E4F5DEE0]];
}

- (id)description
{
  id v3 = [NSString alloc];
  detail = self->_detail;
  v5 = [(SGPSInteractionLookup *)self interactionString];
  v6 = (void *)[v3 initWithFormat:@"<SGPSInteractionLookup detail:%@\n interactionString: %@\n>", detail, v5];

  return v6;
}

- (BOOL)isEqualToPSInteractionLookup:(id)a3
{
  v4 = a3;
  if (v4)
  {
    v5 = self->_detail;
    v6 = v5;
    if (v5 == (NSString *)v4[1]) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSString isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGPSInteractionLookup *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGPSInteractionLookup *)self isEqualToPSInteractionLookup:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_detail hash];
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)resolveAppNameForBundleId:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1CB79B230]();
  v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  char v6 = [v5 applicationIsInstalled:v3];

  if (v6)
  {
    char v7 = [MEMORY[0x1E4F223C8] bundleRecordWithBundleIdentifier:v3 allowPlaceholder:1 error:0];
    v8 = [v7 localizedName];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v7 localizedShortName];
    }
    v11 = v10;

    if (v11) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  v12 = (void *)MEMORY[0x1CB79B230]();
  v13 = [v3 componentsSeparatedByString:@"."];
  v11 = [v13 lastObject];

LABEL_8:

  return v11;
}

- (id)interactionString
{
  return @"PeopleSuggester: Interaction Information compiled out";
}

- (id)interactionInformation
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (SGPSInteractionLookup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detail"];

  char v6 = [(SGPSInteractionLookup *)self initWithDetail:v5];
  return v6;
}

- (SGPSInteractionLookup)initWithDetail:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGPSInteractionLookup;
  v5 = [(SGPSInteractionLookup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    detail = v5->_detail;
    v5->_detail = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end