@interface IRServiceToken
+ (BOOL)isServiceTokenValid:(id)a3 forClientIdentifier:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_combineServiceIdentifier:(id)a3 withPersonaUniqueIdentifier:(id)a4;
+ (id)_extractServiceIdentifierFromCombinedString:(id)a3;
+ (id)_serviceIdentifiersMapping;
+ (id)new;
+ (id)serviceTokenForServiceIdentifier:(id)a3;
+ (id)serviceTokenForServiceIdentifier:(id)a3 personaUniqueIdentifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (IRServiceToken)init;
- (IRServiceToken)initWithCoder:(id)a3;
- (IRServiceToken)initWithServiceIdentifier:(id)a3 servicePackage:(int64_t)a4;
- (NSString)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)servicePackage;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRServiceToken

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  serviceIdentifier = self->_serviceIdentifier;
  id v5 = a3;
  [v5 encodeObject:serviceIdentifier forKey:@"serviceIdentifier"];
  id v6 = [NSNumber numberWithInteger:self->_servicePackage];
  [v5 encodeObject:v6 forKey:@"servicePackage"];
}

+ (BOOL)isServiceTokenValid:(id)a3 forClientIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [a3 serviceIdentifier];
  if (v7)
  {
    v8 = [a1 _serviceIdentifiersMapping];
    v9 = [v8 objectForKeyedSubscript:v7];

    v10 = [v9 observerClientIdentifiers];
    char v11 = [v10 containsObject:v6];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (IRServiceToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IRServiceToken;
  id v5 = [(IRServiceToken *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceIdentifier"];
    if (v6)
    {
      uint64_t v7 = self;

      serviceIdentifier = v5->_serviceIdentifier;
      v5->_serviceIdentifier = (NSString *)v7;

      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"servicePackage"];
      id v6 = v9;
      if (v9)
      {
        int64_t v10 = (int)[(IRServiceToken *)v9 intValue];

        v5->_servicePackage = v10;
        id v6 = v5;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(IRServiceToken *)self serviceIdentifier];
    uint64_t v7 = [v5 serviceIdentifier];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      v9 = [(IRServiceToken *)self serviceIdentifier];
      int64_t v10 = [v5 serviceIdentifier];

      if (v9 != v10)
      {
        BOOL v8 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    int64_t v11 = [(IRServiceToken *)self servicePackage];
    BOOL v8 = v11 == [v5 servicePackage];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithServiceIdentifier:self->_serviceIdentifier servicePackage:self->_servicePackage];
  uint64_t v6 = [(NSString *)self->_serviceIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = [(IRServiceToken *)self servicePackage];
  return v5;
}

- (int64_t)servicePackage
{
  return self->_servicePackage;
}

- (IRServiceToken)initWithServiceIdentifier:(id)a3 servicePackage:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRServiceToken;
  BOOL v8 = [(IRServiceToken *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serviceIdentifier, a3);
    v9->_servicePackage = a4;
  }

  return v9;
}

+ (id)_serviceIdentifiersMapping
{
  v45[10] = *MEMORY[0x263EF8340];
  v44[0] = @"com.apple.mediaremoted";
  v2 = [IRServiceIdentifierMapping alloc];
  v43[0] = @"com.apple.mediaremoted";
  v43[1] = @"com.apple.MusicUIService";
  v43[2] = @"com.apple.springboard";
  v43[3] = @"com.apple.APSUIApp";
  v43[4] = @"com.apple.intelligentroutingclient";
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:5];
  v32 = [(IRServiceIdentifierMapping *)v2 initWithServicePackage:0 observerClientIdentifiers:v33];
  v45[0] = v32;
  v44[1] = @"com.apple.Music";
  v3 = [IRServiceIdentifierMapping alloc];
  v42[0] = @"com.apple.Music";
  v42[1] = @"com.apple.intelligentroutingclient";
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
  v30 = [(IRServiceIdentifierMapping *)v3 initWithServicePackage:0 observerClientIdentifiers:v31];
  v45[1] = v30;
  v44[2] = @"com.apple.TelephonyUtilities";
  id v4 = [IRServiceIdentifierMapping alloc];
  v41[0] = @"com.apple.TelephonyUtilities";
  v41[1] = @"com.apple.intelligentroutingclient";
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  v28 = [(IRServiceIdentifierMapping *)v4 initWithServicePackage:0 observerClientIdentifiers:v29];
  v45[2] = v28;
  v44[3] = @"com.apple.controlcenter";
  id v5 = [IRServiceIdentifierMapping alloc];
  v40[0] = @"com.apple.controlcenter";
  v40[1] = @"com.apple.intelligentroutingclient";
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
  v26 = [(IRServiceIdentifierMapping *)v5 initWithServicePackage:0 observerClientIdentifiers:v27];
  v45[3] = v26;
  v44[4] = @"com.apple.AVKit.RoutePickerViewService";
  uint64_t v6 = [IRServiceIdentifierMapping alloc];
  v39[0] = @"com.apple.AVKit.RoutePickerViewService";
  v39[1] = @"com.apple.intelligentroutingclient";
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
  v24 = [(IRServiceIdentifierMapping *)v6 initWithServicePackage:0 observerClientIdentifiers:v25];
  v45[4] = v24;
  v44[5] = @"com.apple.tvremoted";
  id v7 = [IRServiceIdentifierMapping alloc];
  v38[0] = @"com.apple.tvremoted";
  v38[1] = @"com.apple.mediaremoted";
  v38[2] = @"com.apple.MusicUIService";
  v38[3] = @"com.apple.springboard";
  v38[4] = @"com.apple.APSUIApp";
  v38[5] = @"com.apple.intelligentroutingclient";
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:6];
  v22 = [(IRServiceIdentifierMapping *)v7 initWithServicePackage:1 observerClientIdentifiers:v23];
  v45[5] = v22;
  v44[6] = @"com.apple.NeighborhoodActivityConduitService";
  BOOL v8 = [IRServiceIdentifierMapping alloc];
  v37[0] = @"com.apple.NeighborhoodActivityConduitService";
  v37[1] = @"com.apple.intelligentroutingclient";
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
  int64_t v10 = [(IRServiceIdentifierMapping *)v8 initWithServicePackage:1 observerClientIdentifiers:v9];
  v45[6] = v10;
  v44[7] = @"com.apple.intelligentroutingclient.Media";
  objc_super v11 = [IRServiceIdentifierMapping alloc];
  v36 = @"com.apple.intelligentroutingclient";
  objc_super v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  v13 = [(IRServiceIdentifierMapping *)v11 initWithServicePackage:0 observerClientIdentifiers:v12];
  v45[7] = v13;
  v44[8] = @"com.apple.intelligentroutingclient.AppleTVControl";
  v14 = [IRServiceIdentifierMapping alloc];
  v35 = @"com.apple.intelligentroutingclient";
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  v16 = [(IRServiceIdentifierMapping *)v14 initWithServicePackage:1 observerClientIdentifiers:v15];
  v45[8] = v16;
  v44[9] = @"com.apple.IntelligentRoutingHostTests.xctrunner";
  v17 = [IRServiceIdentifierMapping alloc];
  v34 = @"com.apple.IntelligentRoutingHostTests.xctrunner";
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  v19 = [(IRServiceIdentifierMapping *)v17 initWithServicePackage:0 observerClientIdentifiers:v18];
  v45[9] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:10];

  return v20;
}

+ (id)serviceTokenForServiceIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [a1 _serviceIdentifiersMapping];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (v6) {
      id v7 = -[IRServiceToken initWithServiceIdentifier:servicePackage:]([IRServiceToken alloc], "initWithServiceIdentifier:servicePackage:", v4, [v6 servicePackage]);
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)serviceTokenForServiceIdentifier:(id)a3 personaUniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = 0;
  if (a3 && v6)
  {
    v9 = [a1 serviceTokenForServiceIdentifier:a3];
    int64_t v10 = v9;
    if (v9)
    {
      objc_super v11 = [v9 serviceIdentifier];
      objc_super v12 = [a1 _combineServiceIdentifier:v11 withPersonaUniqueIdentifier:v7];

      BOOL v8 = objc_msgSend(objc_alloc((Class)a1), "initWithServiceIdentifier:servicePackage:", v12, objc_msgSend(v10, "servicePackage"));
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", servicePackage: %ld", self->_servicePackage];
  [v6 appendFormat:@", serviceIdentifier: %@", self->_serviceIdentifier];
  [v6 appendString:@">"];
  return v6;
}

- (unint64_t)hash
{
  return self->_servicePackage ^ [(NSString *)self->_serviceIdentifier hash];
}

- (IRServiceToken)init
{
}

+ (id)new
{
}

+ (id)_combineServiceIdentifier:(id)a3 withPersonaUniqueIdentifier:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@/%@", a3, a4];
}

+ (id)_extractServiceIdentifierFromCombinedString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"/"];
  id v4 = [v3 firstObject];

  return v4;
}

@end