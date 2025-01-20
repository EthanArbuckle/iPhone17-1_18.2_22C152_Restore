@interface MEMessageAction
+ (BOOL)supportsSecureCoding;
+ (MEMessageAction)flagActionWithFlag:(MEMessageActionFlag)flag;
+ (MEMessageAction)markAsReadAction;
+ (MEMessageAction)markAsUnreadAction;
+ (MEMessageAction)moveToArchiveAction;
+ (MEMessageAction)moveToJunkAction;
+ (MEMessageAction)moveToTrashAction;
+ (MEMessageAction)setBackgroundColorActionWithColor:(MEMessageActionMessageColor)color;
- (BOOL)isEqual:(id)a3;
- (MEMessageAction)initWithCoder:(id)a3;
- (MEMessageAction)initWithDestination:(id)a3 readStatus:(int64_t)a4 flagChange:(id)a5 messageColor:(int64_t)a6;
- (MEMessageActionDestination)destination;
- (MEMessageActionFlagChange)flagChange;
- (id)description;
- (int64_t)messageColor;
- (int64_t)readStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEMessageAction

+ (MEMessageAction)moveToTrashAction
{
  v2 = [MEMessageAction alloc];
  v3 = +[MEMessageActionDestination trash];
  v4 = [(MEMessageAction *)v2 initWithDestination:v3 readStatus:1 flagChange:0 messageColor:0];

  return v4;
}

+ (MEMessageAction)moveToArchiveAction
{
  v2 = [MEMessageAction alloc];
  v3 = +[MEMessageActionDestination archive];
  v4 = [(MEMessageAction *)v2 initWithDestination:v3 readStatus:0 flagChange:0 messageColor:0];

  return v4;
}

+ (MEMessageAction)moveToJunkAction
{
  v2 = [MEMessageAction alloc];
  v3 = +[MEMessageActionDestination junk];
  v4 = [(MEMessageAction *)v2 initWithDestination:v3 readStatus:0 flagChange:0 messageColor:0];

  return v4;
}

+ (MEMessageAction)markAsReadAction
{
  v2 = [[MEMessageAction alloc] initWithDestination:0 readStatus:1 flagChange:0 messageColor:0];
  return v2;
}

+ (MEMessageAction)markAsUnreadAction
{
  v2 = [[MEMessageAction alloc] initWithDestination:0 readStatus:2 flagChange:0 messageColor:0];
  return v2;
}

+ (MEMessageAction)flagActionWithFlag:(MEMessageActionFlag)flag
{
  v3 = [[MEMessageActionFlagChange alloc] initWithFlag:flag];
  v4 = [[MEMessageAction alloc] initWithDestination:0 readStatus:0 flagChange:v3 messageColor:0];

  return v4;
}

+ (MEMessageAction)setBackgroundColorActionWithColor:(MEMessageActionMessageColor)color
{
  v3 = [[MEMessageAction alloc] initWithDestination:0 readStatus:0 flagChange:0 messageColor:color];
  return v3;
}

- (MEMessageAction)initWithDestination:(id)a3 readStatus:(int64_t)a4 flagChange:(id)a5 messageColor:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MEMessageAction;
  v13 = [(MEMessageAction *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_destination, a3);
    v14->_readStatus = a4;
    objc_storeStrong((id *)&v14->_flagChange, a5);
    v14->_messageColor = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageAction)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"EFPropertyKey_readStatus"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_flagChange"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_destination"];
  v8 = -[MEMessageAction initWithDestination:readStatus:flagChange:messageColor:](self, "initWithDestination:readStatus:flagChange:messageColor:", v7, v5, v6, [v4 decodeIntegerForKey:@"EFPropertyKey_messageColor"]);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(MEMessageAction *)self destination];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_destination"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[MEMessageAction readStatus](self, "readStatus"), @"EFPropertyKey_readStatus");
  uint64_t v5 = [(MEMessageAction *)self flagChange];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_flagChange"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[MEMessageAction messageColor](self, "messageColor"), @"EFPropertyKey_messageColor");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    v7 = [(MEMessageAction *)self destination];
    v8 = [v6 destination];
    if (EFObjectsAreEqual())
    {
      v9 = [(MEMessageAction *)self flagChange];
      v10 = [v6 flagChange];
      if (EFObjectsAreEqual()
        && (int64_t v11 = -[MEMessageAction readStatus](self, "readStatus"), v11 == [v6 readStatus]))
      {
        int64_t v12 = [(MEMessageAction *)self messageColor];
        BOOL v13 = v12 == [v6 messageColor];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(MEMessageAction *)self destination];
  int64_t v5 = [(MEMessageAction *)self readStatus];
  id v6 = [(MEMessageAction *)self flagChange];
  v7 = [v3 stringWithFormat:@"Message Action: Destination: %@, Read Status: %ld, Flag Change: %@, Message Color: %ld", v4, v5, v6, -[MEMessageAction messageColor](self, "messageColor")];

  return v7;
}

- (MEMessageActionDestination)destination
{
  return self->_destination;
}

- (int64_t)readStatus
{
  return self->_readStatus;
}

- (MEMessageActionFlagChange)flagChange
{
  return self->_flagChange;
}

- (int64_t)messageColor
{
  return self->_messageColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagChange, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end