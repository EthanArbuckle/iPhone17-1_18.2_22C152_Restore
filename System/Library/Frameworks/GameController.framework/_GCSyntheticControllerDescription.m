@interface _GCSyntheticControllerDescription
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescription:(id)a3;
- (NSCopying)controllerIdentifier;
- (NSString)persistentIdentifier;
- (_GCSyntheticControllerDescription)init;
- (_GCSyntheticControllerDescription)initWithControllerIdentifier:(id)a3 persistentIdentifier:(id)a4;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
@end

@implementation _GCSyntheticControllerDescription

- (_GCSyntheticControllerDescription)initWithControllerIdentifier:(id)a3 persistentIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_GCSyntheticControllerDescription;
  id v5 = a4;
  id v6 = a3;
  v7 = [(_GCSyntheticControllerDescription *)&v13 init];
  uint64_t v8 = objc_msgSend(v6, "copyWithZone:", 0, v13.receiver, v13.super_class);

  controllerIdentifier = v7->_controllerIdentifier;
  v7->_controllerIdentifier = (NSCopying *)v8;

  uint64_t v10 = [v5 copy];
  persistentIdentifier = v7->_persistentIdentifier;
  v7->_persistentIdentifier = (NSString *)v10;

  return v7;
}

- (_GCSyntheticControllerDescription)init
{
  return 0;
}

- (unint64_t)hash
{
  return [(NSCopying *)self->_controllerIdentifier hash];
}

- (BOOL)isEqualToDescription:(id)a3
{
  return [(NSCopying *)self->_controllerIdentifier isEqual:*((void *)a3 + 1)];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = [(_GCSyntheticControllerDescription *)self isEqualToDescription:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    char v5 = [(NSCopying *)self->_controllerIdentifier isEqual:v4];
  }
  BOOL v6 = v5;
LABEL_7:

  return v6;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ '%@'>", objc_opt_class(), self->_controllerIdentifier];
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  char v5 = +[NSString stringWithFormat:@"<%@ %p '%@'>", v4, self, self->_controllerIdentifier];

  return v5;
}

- (NSCopying)controllerIdentifier
{
  return (NSCopying *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)persistentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);

  objc_storeStrong((id *)&self->_controllerIdentifier, 0);
}

@end