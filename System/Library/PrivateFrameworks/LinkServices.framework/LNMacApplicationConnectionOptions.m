@interface LNMacApplicationConnectionOptions
- (BOOL)isBackground;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeground;
- (LNMacApplicationConnectionOptions)init;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setBackground:(BOOL)a3;
@end

@implementation LNMacApplicationConnectionOptions

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

- (BOOL)isBackground
{
  return self->_background;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNMacApplicationConnectionOptions *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
    goto LABEL_10;
  }
  v6 = v4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = 0;
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNMacApplicationConnectionOptions;
  if (![(LNConnectionOptions *)&v10 isEqual:v6])
  {
LABEL_7:
    LOBYTE(v8) = 0;
    goto LABEL_8;
  }
  BOOL v7 = [(LNMacApplicationConnectionOptions *)self isBackground];
  BOOL v8 = v7 ^ [(LNMacApplicationConnectionOptions *)v6 isBackground] ^ 1;
LABEL_8:

LABEL_10:
  return v8;
}

- (unint64_t)hash
{
  return [(LNMacApplicationConnectionOptions *)self isBackground];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(LNConnectionOptions *)self authenticationPolicy];
  BOOL v7 = @"Force Unlock";
  if (!v6) {
    BOOL v7 = @"Default";
  }
  BOOL v8 = v7;
  if ([(LNMacApplicationConnectionOptions *)self isBackground]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(LNConnectionOptions *)self initiatesAudioSession]) {
    objc_super v10 = @"YES";
  }
  else {
    objc_super v10 = @"NO";
  }
  v11 = [v3 stringWithFormat:@"<%@: %p, authenticationPolicy: %@, background: %@, initiatesAudioSession: %@>", v5, self, v8, v9, v10];

  return (NSString *)v11;
}

- (BOOL)isForeground
{
  return ![(LNMacApplicationConnectionOptions *)self isBackground];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LNMacApplicationConnectionOptions;
  id v4 = [(LNConnectionOptions *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setBackground:", -[LNMacApplicationConnectionOptions isBackground](self, "isBackground"));
  return v4;
}

- (LNMacApplicationConnectionOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)LNMacApplicationConnectionOptions;
  v2 = [(LNMacApplicationConnectionOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_background = 1;
    id v4 = v2;
  }

  return v3;
}

@end