@interface CAFHistoricalNotificationUserAction
- (CAFHistoricalNotificationUserAction)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)contentURLAction;
- (NSString)symbolName;
- (NSString)userVisibleLabel;
- (id)description;
@end

@implementation CAFHistoricalNotificationUserAction

- (CAFHistoricalNotificationUserAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAFHistoricalNotificationUserAction;
  v5 = [(CAFHistoricalNotificationUserAction *)&v16 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKey:@"contentURLAction"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      v7 = (NSString *)v6;
    }
    else {
      v7 = 0;
    }

    contentURLAction = v5->_contentURLAction;
    v5->_contentURLAction = v7;

    objc_opt_class();
    id v9 = [v4 objectForKey:@"symbolName"];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      v10 = (NSString *)v9;
    }
    else {
      v10 = 0;
    }

    symbolName = v5->_symbolName;
    v5->_symbolName = v10;

    objc_opt_class();
    id v12 = [v4 objectForKey:@"userVisibleLabel"];
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
      v13 = (NSString *)v12;
    }
    else {
      v13 = 0;
    }

    userVisibleLabel = v5->_userVisibleLabel;
    v5->_userVisibleLabel = v13;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"contentURLAction";
  v3 = [(CAFHistoricalNotificationUserAction *)self contentURLAction];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v12[0] = v4;
  v11[1] = @"symbolName";
  v5 = [(CAFHistoricalNotificationUserAction *)self symbolName];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF9D0] null];
  }
  v12[1] = v6;
  v11[2] = @"userVisibleLabel";
  v7 = [(CAFHistoricalNotificationUserAction *)self userVisibleLabel];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x263EFF9D0] null];
  }
  v12[2] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v7) {

  }
  if (!v5) {
  if (!v3)
  }

  return (NSDictionary *)v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CAFHistoricalNotificationUserAction *)self contentURLAction];
  id v6 = [(CAFHistoricalNotificationUserAction *)self symbolName];
  v7 = [(CAFHistoricalNotificationUserAction *)self userVisibleLabel];
  v8 = [v3 stringWithFormat:@"<%@: %p { %@: %@, %@: %@, %@: %@ }>", v4, self, @"contentURLAction", v5, @"symbolName", v6, @"userVisibleLabel", v7];

  return v8;
}

- (NSString)contentURLAction
{
  return self->_contentURLAction;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)userVisibleLabel
{
  return self->_userVisibleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleLabel, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_contentURLAction, 0);
}

@end