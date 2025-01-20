@interface ADRoutingInfoMessage
- (ADCorePreferencesStoring)storage;
- (ADRoutingInfoMessage)initWithRoutingType:(unint64_t)a3 preferencesStore:(id)a4;
- (NSString)environmentURL;
- (NSString)payload;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)routingInfoType;
- (void)setRoutingInfoType:(unint64_t)a3;
- (void)setStorage:(id)a3;
@end

@implementation ADRoutingInfoMessage

- (ADRoutingInfoMessage)initWithRoutingType:(unint64_t)a3 preferencesStore:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ADRoutingInfoMessage;
  v8 = [(ADRoutingInfoMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_routingInfoType = a3;
    objc_storeStrong((id *)&v8->_storage, a4);
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADRoutingInfoMessage;
  v4 = [(ADRoutingInfoMessage *)&v8 description];
  v5 = [(ADRoutingInfoMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSString)environmentURL
{
  unint64_t v4 = [(ADRoutingInfoMessage *)self routingInfoType];
  if (v4 == 1)
  {
    v5 = [(ADRoutingInfoMessage *)self storage];
    v6 = v5;
    id v7 = @"GibraltarAdServerURL";
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    v5 = [(ADRoutingInfoMessage *)self storage];
    v6 = v5;
    id v7 = @"ToroAdServerURL";
  }
  v2 = [v5 stringForKey:v7];

LABEL_6:
  return (NSString *)v2;
}

- (id)dictionaryRepresentation
{
  if (MGGetBoolAnswer())
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v4 = [(ADRoutingInfoMessage *)self environmentURL];
    if (v4) {
      [v3 setObject:v4 forKey:@"environmentUrl"];
    }
    v5 = (void *)[v3 copy];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  return v5;
}

- (NSString)payload
{
  v2 = [(ADRoutingInfoMessage *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    uint64_t v15 = 0;
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:&v15];
    unint64_t v4 = v3;
    if (v15)
    {
      v5 = NSString;
      v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      objc_super v8 = [v5 stringWithFormat:@"[%@] RoutingInfo dictionary failed to serialize", v7];
      _ADLog(@"iAdServerRequestLogging", v8, 16);

      v9 = @"{}";
    }
    else
    {
      v9 = [v3 base64EncodedStringWithOptions:0];
    }
  }
  else
  {
    v10 = NSString;
    objc_super v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v10 stringWithFormat:@"[%@] RoutingInfo dictionary isn't a valid dictionary", v12];
    _ADLog(@"iAdServerRequestLogging", v13, 16);

    v9 = @"{}";
  }

  return (NSString *)v9;
}

- (unint64_t)routingInfoType
{
  return self->_routingInfoType;
}

- (void)setRoutingInfoType:(unint64_t)a3
{
  self->_routingInfoType = a3;
}

- (ADCorePreferencesStoring)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end