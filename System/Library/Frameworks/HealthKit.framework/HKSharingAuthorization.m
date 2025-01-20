@interface HKSharingAuthorization
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSharingAuthorization)initWithAuthorizationIdentifier:(id)a3;
- (HKSharingAuthorization)initWithAuthorizationIdentifier:(id)a3 displayName:(id)a4 displaySubtitle:(id)a5;
- (HKSharingAuthorization)initWithCoder:(id)a3;
- (NSString)authorizationIdentifier;
- (NSString)displayName;
- (NSString)displaySubtitle;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSharingAuthorization

- (HKSharingAuthorization)initWithAuthorizationIdentifier:(id)a3 displayName:(id)a4 displaySubtitle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKSharingAuthorization;
  v11 = [(HKSharingAuthorization *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    authorizationIdentifier = v11->_authorizationIdentifier;
    v11->_authorizationIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    displayName = v11->_displayName;
    v11->_displayName = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    displaySubtitle = v11->_displaySubtitle;
    v11->_displaySubtitle = (NSString *)v16;
  }
  return v11;
}

- (HKSharingAuthorization)initWithAuthorizationIdentifier:(id)a3
{
  return [(HKSharingAuthorization *)self initWithAuthorizationIdentifier:a3 displayName:0 displaySubtitle:0];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p %@ %@ %@>", v5, self, self->_authorizationIdentifier, self->_displayName, self->_displaySubtitle];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_authorizationIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_displayName hash] ^ v3;
  return v4 ^ [(NSString *)self->_displaySubtitle hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  authorizationIdentifier = self->_authorizationIdentifier;
  v6 = (NSString *)v4[1];
  if (authorizationIdentifier != v6
    && (!v6 || !-[NSString isEqual:](authorizationIdentifier, "isEqual:")))
  {
    goto LABEL_11;
  }
  displayName = self->_displayName;
  id v8 = (NSString *)v4[2];
  if (displayName != v8 && (!v8 || !-[NSString isEqual:](displayName, "isEqual:"))) {
    goto LABEL_11;
  }
  displaySubtitle = self->_displaySubtitle;
  id v10 = (NSString *)v4[3];
  if (displaySubtitle == v10)
  {
    char v11 = 1;
    goto LABEL_12;
  }
  if (v10) {
    char v11 = -[NSString isEqual:](displaySubtitle, "isEqual:");
  }
  else {
LABEL_11:
  }
    char v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  authorizationIdentifier = self->_authorizationIdentifier;
  id v5 = a3;
  [v5 encodeObject:authorizationIdentifier forKey:@"AuthorizationIdentifier"];
  [v5 encodeObject:self->_displayName forKey:@"DisplayName"];
  [v5 encodeObject:self->_displaySubtitle forKey:@"DisplaySubtitle"];
}

- (HKSharingAuthorization)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AuthorizationIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplaySubtitle"];

  id v8 = [(HKSharingAuthorization *)self initWithAuthorizationIdentifier:v5 displayName:v6 displaySubtitle:v7];
  return v8;
}

- (NSString)authorizationIdentifier
{
  return self->_authorizationIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displaySubtitle
{
  return self->_displaySubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySubtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_authorizationIdentifier, 0);
}

@end