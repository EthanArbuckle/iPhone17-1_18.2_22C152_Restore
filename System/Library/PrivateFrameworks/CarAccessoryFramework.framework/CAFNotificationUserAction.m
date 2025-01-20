@interface CAFNotificationUserAction
- (CAFNotificationUserAction)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)contentURLAction;
- (NSString)userVisibleLabel;
- (id)description;
@end

@implementation CAFNotificationUserAction

- (CAFNotificationUserAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAFNotificationUserAction;
  v5 = [(CAFNotificationUserAction *)&v13 init];
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
    id v9 = [v4 objectForKey:@"userVisibleLabel"];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      v10 = (NSString *)v9;
    }
    else {
      v10 = 0;
    }

    userVisibleLabel = v5->_userVisibleLabel;
    v5->_userVisibleLabel = v10;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"contentURLAction";
  v3 = [(CAFNotificationUserAction *)self contentURLAction];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v9[1] = @"userVisibleLabel";
  v10[0] = v4;
  v5 = [(CAFNotificationUserAction *)self userVisibleLabel];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF9D0] null];
  }
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {
  return (NSDictionary *)v7;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CAFNotificationUserAction *)self contentURLAction];
  id v6 = [(CAFNotificationUserAction *)self userVisibleLabel];
  v7 = [v3 stringWithFormat:@"<%@: %p { %@: %@, %@: %@ }>", v4, self, @"contentURLAction", v5, @"userVisibleLabel", v6];

  return v7;
}

- (NSString)contentURLAction
{
  return self->_contentURLAction;
}

- (NSString)userVisibleLabel
{
  return self->_userVisibleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleLabel, 0);
  objc_storeStrong((id *)&self->_contentURLAction, 0);
}

@end