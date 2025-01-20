@interface ARUserProfile
+ (BOOL)isGuestProfileEnabled;
+ (id)defaultProfile;
- (ARUserProfile)initWithIdentifier:(id)a3 type:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (id)description;
- (int64_t)type;
@end

@implementation ARUserProfile

+ (id)defaultProfile
{
  v2 = [[ARUserProfile alloc] initWithIdentifier:@"Default" type:0x7FFFFFFFFFFFFFFFLL];
  return v2;
}

+ (BOOL)isGuestProfileEnabled
{
  return 0;
}

- (ARUserProfile)initWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARUserProfile;
  v8 = [(ARUserProfile *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_type = a4;
  }

  return v9;
}

- (id)description
{
  int64_t type = self->_type;
  v4 = @"PersistGuest";
  v5 = @"Default";
  if (type != 0x7FFFFFFFFFFFFFFFLL) {
    v5 = 0;
  }
  if (type != 2) {
    v4 = v5;
  }
  v6 = @"Enrolled";
  id v7 = @"Guest";
  if (type != 1) {
    id v7 = 0;
  }
  if (type) {
    v6 = v7;
  }
  if (type <= 1) {
    v8 = v6;
  }
  else {
    v8 = v4;
  }
  v9 = NSString;
  v10 = (objc_class *)objc_opt_class();
  objc_super v11 = NSStringFromClass(v10);
  v12 = [v9 stringWithFormat:@"<%@: %p: Identifier:%@, type:%@>", v11, self, self->_identifier, v8];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_type == v4[2]
    && [(NSString *)self->_identifier isEqualToString:v4[1]];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end