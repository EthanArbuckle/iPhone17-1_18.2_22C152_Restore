@interface PKMentionParticipant
+ (id)mentionWithDisplayName:(id)a3 identifier:(id)a4 color:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (NSString)identifier;
- (PKMentionParticipant)initWithDisplayName:(id)a3 identifier:(id)a4 color:(id)a5;
- (UIColor)color;
- (id)description;
@end

@implementation PKMentionParticipant

+ (id)mentionWithDisplayName:(id)a3 identifier:(id)a4 color:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[PKMentionParticipant alloc] initWithDisplayName:v9 identifier:v8 color:v7];

  return v10;
}

- (PKMentionParticipant)initWithDisplayName:(id)a3 identifier:(id)a4 color:(id)a5
{
  id v8 = (UIColor *)a5;
  v18.receiver = self;
  v18.super_class = (Class)PKMentionParticipant;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PKMentionParticipant *)&v18 init];
  uint64_t v12 = objc_msgSend(v10, "copy", v18.receiver, v18.super_class);

  displayName = v11->_displayName;
  v11->_displayName = (NSString *)v12;

  uint64_t v14 = [v9 copy];
  identifier = v11->_identifier;
  v11->_identifier = (NSString *)v14;

  color = v11->_color;
  v11->_color = v8;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 identifier];
    v6 = [(PKMentionParticipant *)self identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PKMentionParticipant *)self displayName];
  v6 = [(PKMentionParticipant *)self identifier];
  char v7 = [(PKMentionParticipant *)self color];
  id v8 = [v3 stringWithFormat:@"%@:%p, \"%@\", \"%@\", %@", v4, self, v5, v6, v7];

  return v8;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end