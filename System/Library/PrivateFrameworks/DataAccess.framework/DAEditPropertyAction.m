@interface DAEditPropertyAction
+ (BOOL)supportsSecureCoding;
- (DAEditPropertyAction)initWithChangedItem:(id)a3 propertyName:(id)a4 value:(id)a5 propertyNamespace:(id)a6 serverId:(id)a7;
- (DAEditPropertyAction)initWithCoder:(id)a3;
- (NSString)propertyName;
- (NSString)propertyNamespace;
- (NSString)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAEditPropertyAction

- (DAEditPropertyAction)initWithChangedItem:(id)a3 propertyName:(id)a4 value:(id)a5 propertyNamespace:(id)a6 serverId:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)DAEditPropertyAction;
  v16 = [(DAAction *)&v19 initWithItemChangeType:10 changedItem:a3 serverId:a7];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_propertyName, a4);
    objc_storeStrong((id *)&v17->_propertyNamespace, a6);
    objc_storeStrong((id *)&v17->_value, a5);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAEditPropertyAction)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"DAAction.m" lineNumber:179 description:@"Who does non-keyed coding nowadays?"];
  }
  v15.receiver = self;
  v15.super_class = (Class)DAEditPropertyAction;
  v6 = [(DAAction *)&v15 initWithCoder:v5];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAPropertyName"];
    propertyName = v6->_propertyName;
    v6->_propertyName = (NSString *)v7;

    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAPropertyNamespace"];
    propertyNamespace = v6->_propertyNamespace;
    v6->_propertyNamespace = (NSString *)v9;

    uint64_t v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAPropertyValue"];
    value = v6->_value;
    v6->_value = (NSString *)v11;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"DAAction.m" lineNumber:190 description:@"Who does non-keyed coding nowadays?"];
  }
  v10.receiver = self;
  v10.super_class = (Class)DAEditPropertyAction;
  [(DAAction *)&v10 encodeWithCoder:v5];
  v6 = [(DAEditPropertyAction *)self value];
  [v5 encodeObject:v6 forKey:@"DAPropertyValue"];

  uint64_t v7 = [(DAEditPropertyAction *)self propertyNamespace];
  [v5 encodeObject:v7 forKey:@"DAPropertyNamespace"];

  v8 = [(DAEditPropertyAction *)self propertyName];
  [v5 encodeObject:v8 forKey:@"DAPropertyName"];
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)propertyNamespace
{
  return self->_propertyNamespace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyNamespace, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end