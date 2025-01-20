@interface WFUnsupportedContentLocation
+ (BOOL)supportsSecureCoding;
+ (id)locationWithIdentifier:(id)a3 serializedRepresentation:(id)a4;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)backingSerializedRepresentation;
- (NSString)description;
- (WFUnsupportedContentLocation)initWithCoder:(id)a3;
- (WFUnsupportedContentLocation)initWithIdentifier:(id)a3 serializedRepresentation:(id)a4;
- (id)localizedTitle;
- (id)wfSerializedRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFUnsupportedContentLocation

- (void).cxx_destruct
{
}

- (NSDictionary)backingSerializedRepresentation
{
  return self->_backingSerializedRepresentation;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFContentLocation *)self identifier];
  v7 = [v3 stringWithFormat:@"<%@: %p, identifier: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (id)wfSerializedRepresentation
{
  v2 = [(WFUnsupportedContentLocation *)self backingSerializedRepresentation];
  v3 = (void *)[v2 copy];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFUnsupportedContentLocation;
  id v4 = a3;
  [(WFContentLocation *)&v6 encodeWithCoder:v4];
  v5 = [(WFUnsupportedContentLocation *)self backingSerializedRepresentation];
  [v4 encodeObject:v5 forKey:@"backingSerializedRepresentation"];
}

- (WFUnsupportedContentLocation)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)WFUnsupportedContentLocation;
  id v3 = a3;
  id v4 = [(WFContentLocation *)&v13 initWithCoder:v3];
  v5 = (void *)MEMORY[0x263EFFA08];
  objc_super v6 = v4;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v8 = [v5 setWithArray:v7];
  v9 = [v3 decodeObjectOfClasses:v8 forKey:@"backingSerializedRepresentation"];

  v10 = [(WFContentLocation *)v6 identifier];
  v11 = [(WFUnsupportedContentLocation *)v6 initWithIdentifier:v10 serializedRepresentation:v9];

  return v11;
}

- (id)localizedTitle
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    v5 = "-[WFUnsupportedContentLocation localizedTitle]";
    _os_log_impl(&dword_216505000, v2, OS_LOG_TYPE_FAULT, "%s The UI should never attempt to display a WFUnsupportedContentLocation", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFContentLocation *)self identifier];
    uint64_t v6 = [v4 identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(WFContentLocation *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (WFUnsupportedContentLocation)initWithIdentifier:(id)a3 serializedRepresentation:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFUnsupportedContentLocation;
  v8 = [(WFContentLocation *)&v12 initWithIdentifier:a3 promptingBehaviour:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backingSerializedRepresentation, a4);
    v10 = v9;
  }

  return v9;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___WFUnsupportedContentLocation;
  id v4 = a3;
  v5 = objc_msgSendSuper2(&v9, sel_objectWithWFSerializedRepresentation_, v4);
  uint64_t v6 = objc_msgSend(v5, "identifier", v9.receiver, v9.super_class);
  id v7 = [a1 locationWithIdentifier:v6 serializedRepresentation:v4];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)locationWithIdentifier:(id)a3 serializedRepresentation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v7 serializedRepresentation:v6];

  return v8;
}

@end