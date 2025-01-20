@interface IDSUserDescription
+ (BOOL)supportsSecureCoding;
- (IDSUser)user;
- (IDSUserDescription)initWithCoder:(id)a3;
- (IDSUserDescription)initWithUser:(id)a3 properties:(id)a4;
- (IDSUserProperties)properties;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProperties:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation IDSUserDescription

- (IDSUserDescription)initWithUser:(id)a3 properties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSUserDescription;
  v9 = [(IDSUserDescription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    objc_storeStrong((id *)&v10->_properties, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSUserDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"user"];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prop"];

  v10 = [(IDSUserDescription *)self initWithUser:v8 properties:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  user = self->_user;
  id v5 = a3;
  [v5 encodeObject:user forKey:@"user"];
  [v5 encodeObject:self->_properties forKey:@"prop"];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p, user: %@, properties: %@>", objc_opt_class(), self, self->_user, self->_properties];
}

- (IDSUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (IDSUserProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end