@interface CCSIconElementRequest
+ (BOOL)supportsSecureCoding;
- (CCSIconElementRequest)initWithCoder:(id)a3;
- (CCSIconElementRequest)initWithIntent:(int64_t)a3 controlKind:(id)a4 controlType:(unint64_t)a5 extensionBundleIdentifier:(id)a6 containerBundleIdentifier:(id)a7 size:(unint64_t)a8;
- (CCSIconElementRequest)initWithIntent:(int64_t)a3 moduleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 moduleSize:(int64_t)a6;
- (CCSIconElementRequest)initWithIntent:(int64_t)a3 moduleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 size:(unint64_t)a6;
- (INIntent)intentConfiguration;
- (NSString)containerBundleIdentifier;
- (NSString)controlKind;
- (NSString)extensionBundleIdentifier;
- (NSString)moduleIdentifier;
- (id)_controlSizeString:(unint64_t)a3;
- (id)_controlTypeString:(unint64_t)a3;
- (id)description;
- (int64_t)elementType;
- (int64_t)intent;
- (int64_t)moduleSize;
- (unint64_t)controlType;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentConfiguration:(id)a3;
@end

@implementation CCSIconElementRequest

- (CCSIconElementRequest)initWithIntent:(int64_t)a3 moduleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 size:(unint64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CCSIconElementRequest;
  v13 = [(CCSIconElementRequest *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_elementType = 1;
    intentConfiguration = v13->_intentConfiguration;
    v13->_intent = a3;
    v13->_intentConfiguration = 0;

    objc_storeStrong((id *)&v14->_moduleIdentifier, a4);
    objc_storeStrong((id *)&v14->_containerBundleIdentifier, a5);
    v14->_size = a6;
  }

  return v14;
}

- (CCSIconElementRequest)initWithIntent:(int64_t)a3 moduleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 moduleSize:(int64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CCSIconElementRequest;
  v13 = [(CCSIconElementRequest *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_elementType = 0;
    intentConfiguration = v13->_intentConfiguration;
    v13->_intent = a3;
    v13->_intentConfiguration = 0;

    objc_storeStrong((id *)&v14->_moduleIdentifier, a4);
    objc_storeStrong((id *)&v14->_containerBundleIdentifier, a5);
    v14->_moduleSize = a6;
  }

  return v14;
}

- (CCSIconElementRequest)initWithIntent:(int64_t)a3 controlKind:(id)a4 controlType:(unint64_t)a5 extensionBundleIdentifier:(id)a6 containerBundleIdentifier:(id)a7 size:(unint64_t)a8
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CCSIconElementRequest;
  v18 = [(CCSIconElementRequest *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_elementType = 2;
    intentConfiguration = v18->_intentConfiguration;
    v18->_intentConfiguration = 0;

    v19->_intent = a3;
    objc_storeStrong((id *)&v19->_controlKind, a4);
    v19->_controlType = a5;
    objc_storeStrong((id *)&v19->_extensionBundleIdentifier, a6);
    objc_storeStrong((id *)&v19->_containerBundleIdentifier, a7);
    v19->_size = a8;
  }

  return v19;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = v3;
  unint64_t intent = self->_intent;
  if (intent > 3) {
    v6 = @"unknown";
  }
  else {
    v6 = off_2645B6390[intent];
  }
  [v3 appendString:v6 withName:@"kCSSIconElementRequestIntent"];
  v7 = [(INIntent *)self->_intentConfiguration intentDescription];
  [v4 appendString:v7 withName:@"kCSSIconElementRequestIntentConfiguration"];

  v8 = [(CCSIconElementRequest *)self _controlTypeString:self->_controlType];
  [v4 appendString:v8 withName:@"kCSSIconElementRequestControlType"];

  v9 = [(CCSIconElementRequest *)self _controlSizeString:self->_size];
  [v4 appendString:v9 withName:@"kCSSIconElementRequestSize"];

  v10 = NSStringFromCCSModuleSize(self->_moduleSize);
  [v4 appendString:v10 withName:@"kCSSIconElementRequestModuleSize"];

  [v4 appendString:self->_moduleIdentifier withName:@"kCSSIconElementRequestModuleIdentifier"];
  [v4 appendString:self->_controlKind withName:@"kCSSIconElementRequestControlKind"];
  [v4 appendString:self->_extensionBundleIdentifier withName:@"kCSSIconElementRequestExtensionBundleIdentifier"];
  [v4 appendString:self->_containerBundleIdentifier withName:@"kCSSIconElementRequestContainerBundleIdentifier"];
  unint64_t elementType = self->_elementType;
  if (elementType > 2) {
    id v12 = @"unknown";
  }
  else {
    id v12 = off_2645B63B0[elementType];
  }
  [v4 appendString:v12 withName:@"kCSSIconElementRequestElementType"];
  v13 = [v4 build];

  return v13;
}

- (CCSIconElementRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"kCSSIconElementRequestIntent"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"kCSSIconElementRequestElementType"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCSSIconElementRequestContainerBundleIdentifier"];
  switch(v6)
  {
    case 2:
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCSSIconElementRequestControlKind"];
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCSSIconElementRequestIntentConfiguration"];
      uint64_t v11 = [v4 decodeIntegerForKey:@"kCSSIconElementRequestControlType"];
      id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCSSIconElementRequestExtensionBundleIdentifier"];
      v13 = -[CCSIconElementRequest initWithIntent:controlKind:controlType:extensionBundleIdentifier:containerBundleIdentifier:size:]([CCSIconElementRequest alloc], "initWithIntent:controlKind:controlType:extensionBundleIdentifier:containerBundleIdentifier:size:", v5, v8, v11, v12, v7, [v4 decodeIntegerForKey:@"kCSSIconElementRequestSize"]);

      [(CCSIconElementRequest *)v13 setIntentConfiguration:v10];
      self = v10;
LABEL_8:

      self = v13;
      break;
    case 1:
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCSSIconElementRequestModuleIdentifier"];
      v9 = -[CCSIconElementRequest initWithIntent:moduleIdentifier:containerBundleIdentifier:size:]([CCSIconElementRequest alloc], "initWithIntent:moduleIdentifier:containerBundleIdentifier:size:", v5, v8, v7, [v4 decodeIntegerForKey:@"kCSSIconElementRequestSize"]);
      goto LABEL_7;
    case 0:
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCSSIconElementRequestModuleIdentifier"];
      v9 = -[CCSIconElementRequest initWithIntent:moduleIdentifier:containerBundleIdentifier:moduleSize:]([CCSIconElementRequest alloc], "initWithIntent:moduleIdentifier:containerBundleIdentifier:moduleSize:", v5, v8, v7, [v4 decodeIntegerForKey:@"kCSSIconElementRequestModuleSize"]);
LABEL_7:
      v13 = v9;
      goto LABEL_8;
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t intent = self->_intent;
  id v5 = a3;
  [v5 encodeInteger:intent forKey:@"kCSSIconElementRequestIntent"];
  [v5 encodeObject:self->_intentConfiguration forKey:@"kCSSIconElementRequestIntentConfiguration"];
  [v5 encodeInteger:self->_controlType forKey:@"kCSSIconElementRequestControlType"];
  [v5 encodeInteger:self->_size forKey:@"kCSSIconElementRequestSize"];
  [v5 encodeInteger:self->_moduleSize forKey:@"kCSSIconElementRequestModuleSize"];
  [v5 encodeObject:self->_moduleIdentifier forKey:@"kCSSIconElementRequestModuleIdentifier"];
  [v5 encodeObject:self->_controlKind forKey:@"kCSSIconElementRequestControlKind"];
  [v5 encodeObject:self->_extensionBundleIdentifier forKey:@"kCSSIconElementRequestExtensionBundleIdentifier"];
  [v5 encodeObject:self->_containerBundleIdentifier forKey:@"kCSSIconElementRequestContainerBundleIdentifier"];
  [v5 encodeInteger:self->_elementType forKey:@"kCSSIconElementRequestElementType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_controlTypeString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"CHSControlTypeUnknown";
  }
  else {
    return off_2645B63C8[a3 - 1];
  }
}

- (id)_controlSizeString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"CHSControlSize1x1";
  }
  else {
    return off_2645B63E0[a3 - 1];
  }
}

- (int64_t)intent
{
  return self->_intent;
}

- (INIntent)intentConfiguration
{
  return self->_intentConfiguration;
}

- (void)setIntentConfiguration:(id)a3
{
}

- (unint64_t)controlType
{
  return self->_controlType;
}

- (unint64_t)size
{
  return self->_size;
}

- (int64_t)moduleSize
{
  return self->_moduleSize;
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (NSString)controlKind
{
  return self->_controlKind;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (int64_t)elementType
{
  return self->_elementType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_controlKind, 0);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);

  objc_storeStrong((id *)&self->_intentConfiguration, 0);
}

@end