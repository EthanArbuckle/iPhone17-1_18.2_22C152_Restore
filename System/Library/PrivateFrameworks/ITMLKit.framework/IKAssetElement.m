@interface IKAssetElement
+ (BOOL)shouldParseChildDOMElements;
- (BOOL)infiniteDuration;
- (BOOL)isInfiniteDuration;
- (NSNumber)persistentID;
- (NSNumber)rentalAdamID;
- (NSString)actionParams;
- (NSString)adamID;
- (NSString)bookmarkID;
- (NSString)contentID;
- (NSString)externalID;
- (NSString)serviceID;
- (NSURL)extrasURL;
- (NSURL)url;
- (id)_numberForAttribute:(id)a3;
- (int64_t)keyDelivery;
- (int64_t)type;
@end

@implementation IKAssetElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (NSURL)url
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"src"];

  if ([v3 length])
  {
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (int64_t)type
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"type"];

  if ([v3 isEqualToString:@"file"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"hls"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)keyDelivery
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"keyDelivery"];
  unsigned int v4 = [v3 isEqualToString:@"itunes"];

  return v4;
}

- (BOOL)infiniteDuration
{
  v3 = [(IKViewElement *)self attributes];
  unsigned int v4 = [v3 objectForKeyedSubscript:@"type"];
  int v5 = [v4 isEqualToString:@"hls"];

  if (!v5) {
    return 0;
  }
  v6 = [(IKViewElement *)self attributes];
  v7 = [v6 objectForKeyedSubscript:@"infiniteDuration"];
  char v8 = objc_msgSend(v7, "ik_attributeBoolValue");

  return v8;
}

- (NSString)actionParams
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"actionParams"];

  return (NSString *)v3;
}

- (NSString)adamID
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"adamID"];

  return (NSString *)v3;
}

- (NSURL)extrasURL
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"extrasURL"];

  if ([v3 length])
  {
    unsigned int v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSString)bookmarkID
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"bookmarkID"];

  return (NSString *)v3;
}

- (NSString)contentID
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"contentID"];

  return (NSString *)v3;
}

- (NSString)externalID
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"externalID"];

  return (NSString *)v3;
}

- (NSNumber)persistentID
{
  return (NSNumber *)[(IKAssetElement *)self _numberForAttribute:@"persistentID"];
}

- (NSNumber)rentalAdamID
{
  return (NSNumber *)[(IKAssetElement *)self _numberForAttribute:@"rentalAdamID"];
}

- (NSString)serviceID
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"serviceID"];

  return (NSString *)v3;
}

- (id)_numberForAttribute:(id)a3
{
  id v4 = a3;
  int v5 = [(IKViewElement *)self attributes];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_5:
    char v8 = v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v6];
    goto LABEL_5;
  }
  char v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)isInfiniteDuration
{
  return self->_infiniteDuration;
}

@end