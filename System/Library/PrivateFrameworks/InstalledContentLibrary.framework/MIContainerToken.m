@interface MIContainerToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isTransient;
- (MIContainerToken)initWithCoder:(id)a3;
- (MIContainerToken)initWithContainer:(id)a3;
- (NSData)serializedContainerRepresentation;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)containerURL;
- (id)description;
- (unint64_t)containerClass;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MIContainerToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIContainerToken)initWithContainer:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MIContainerToken;
  v5 = [(MIContainerToken *)&v15 init];
  if (v5)
  {
    v6 = [v4 rawContainer];
    if (v6)
    {
      uint64_t v7 = [v4 identifier];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v7;

      uint64_t v9 = [v4 personaUniqueString];
      personaUniqueString = v5->_personaUniqueString;
      v5->_personaUniqueString = (NSString *)v9;

      v5->_isTransient = [v4 isTransient];
      v5->_containerClass = [v4 containerClass];
      uint64_t v11 = [v6 serializedContainerRepresentation];
      serializedContainerRepresentation = v5->_serializedContainerRepresentation;
      v5->_serializedContainerRepresentation = (NSData *)v11;
    }
    else
    {
      uint64_t v13 = [v4 containerURL];
      serializedContainerRepresentation = v5->_containerURL;
      v5->_containerURL = (NSURL *)v13;
    }
  }
  return v5;
}

- (MIContainerToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MIContainerToken;
  v5 = [(MIContainerToken *)&v23 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"containerURL"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerURL"];
      containerURL = v5->_containerURL;
      v5->_containerURL = (NSURL *)v6;

      if (!v5->_containerURL)
      {
        uint64_t v9 = @"Serialized container did not encode containerURL";
        uint64_t v10 = 52;
LABEL_12:
        _CreateAndLogError((uint64_t)"-[MIContainerToken initWithCoder:]", v10, @"MIInstallerErrorDomain", 186, 0, 0, v9, v8, v22);
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v11;

      if (!v5->_identifier)
      {
        uint64_t v9 = @"Serialized container did not encode an identifier";
        uint64_t v10 = 58;
        goto LABEL_12;
      }
      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueString"];
      personaUniqueString = v5->_personaUniqueString;
      v5->_personaUniqueString = (NSString *)v13;

      v5->_isTransient = [v4 decodeBoolForKey:@"isTransient"];
      objc_super v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerClass"];
      v5->_containerClass = [v15 unsignedLongLongValue];

      if (v5->_containerClass - 15 <= 0xFFFFFFFFFFFFFFF1)
      {
        _CreateAndLogError((uint64_t)"-[MIContainerToken initWithCoder:]", 70, @"MIInstallerErrorDomain", 186, 0, 0, @"Serialized container encoded invalid class: %llu", v16, v5->_containerClass);
        v20 = LABEL_13:;
        [v4 failWithError:v20];

        v19 = 0;
        goto LABEL_14;
      }
      uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedContainerRepresentation"];
      serializedContainerRepresentation = v5->_serializedContainerRepresentation;
      v5->_serializedContainerRepresentation = (NSData *)v17;

      if (!v5->_serializedContainerRepresentation)
      {
        uint64_t v9 = @"Serialized container did not encode the MobileContainerManager serialization of the container";
        uint64_t v10 = 76;
        goto LABEL_12;
      }
    }
  }
  v19 = v5;
LABEL_14:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIContainerToken *)self serializedContainerRepresentation];

  if (v5)
  {
    uint64_t v6 = [(MIContainerToken *)self identifier];
    [v4 encodeObject:v6 forKey:@"identifier"];

    uint64_t v7 = [(MIContainerToken *)self personaUniqueString];
    [v4 encodeObject:v7 forKey:@"personaUniqueString"];

    objc_msgSend(v4, "encodeBool:forKey:", -[MIContainerToken isTransient](self, "isTransient"), @"isTransient");
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MIContainerToken containerClass](self, "containerClass"));
    [v4 encodeObject:v8 forKey:@"containerClass"];

    [(MIContainerToken *)self serializedContainerRepresentation];
  }
  else
  {
    [(MIContainerToken *)self containerURL];
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:");
}

- (id)description
{
  v3 = [(MIContainerToken *)self identifier];
  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  if (v3)
  {
    uint64_t v7 = [(MIContainerToken *)self personaUniqueString];
    BOOL v8 = [(MIContainerToken *)self isTransient];
    unint64_t v9 = [(MIContainerToken *)self containerClass];
    uint64_t v10 = 78;
    if (v8) {
      uint64_t v10 = 89;
    }
    uint64_t v11 = [v4 stringWithFormat:@"<%@ identity:%@/%@ isTransient:%c containerClass:%llu>", v6, v3, v7, v10, v9];
  }
  else
  {
    uint64_t v7 = [(MIContainerToken *)self containerURL];
    v12 = [v7 path];
    uint64_t v11 = [v4 stringWithFormat:@"<%@ containerPath:%@>", v6, v12];
  }
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isTransient
{
  return self->_isTransient;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (NSData)serializedContainerRepresentation
{
  return self->_serializedContainerRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedContainerRepresentation, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end