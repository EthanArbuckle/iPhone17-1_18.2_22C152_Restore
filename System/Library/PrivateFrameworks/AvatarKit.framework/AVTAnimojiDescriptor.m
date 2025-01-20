@interface AVTAnimojiDescriptor
+ (BOOL)supportsSecureCoding;
+ (unsigned)classIdentifier;
- (AVTAnimojiDescriptor)initWithAnimoji:(id)a3;
- (AVTAnimojiDescriptor)initWithCoder:(id)a3;
- (AVTAnimojiDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (AVTAnimojiDescriptor)initWithName:(id)a3;
- (NSString)name;
- (id)description;
- (void)encodeInDictionaryRepresentation:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
@end

@implementation AVTAnimojiDescriptor

- (AVTAnimojiDescriptor)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAnimojiDescriptor;
  v5 = [(AVTAnimojiDescriptor *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (AVTAnimojiDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v13 = 0;
  uint64_t v7 = objc_msgSend(v6, "avt_objectForKey:ofClass:didFail:error:", @"animoji", objc_opt_class(), &v13, a4);
  v8 = (void *)v7;
  if (v13) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    v10 = avt_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_20B819000, v10, OS_LOG_TYPE_DEFAULT, "can't unarchive animoji name from: %@", buf, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    self = [(AVTAnimojiDescriptor *)self initWithName:v7];
    v11 = self;
  }

  return v11;
}

- (AVTAnimojiDescriptor)initWithAnimoji:(id)a3
{
  id v4 = [a3 name];
  v5 = [(AVTAnimojiDescriptor *)self initWithName:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTAnimojiDescriptor;
  id v4 = a3;
  [(AVTAvatarDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"name", v5.receiver, v5.super_class);
}

- (AVTAnimojiDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAnimojiDescriptor;
  objc_super v5 = [(AVTAvatarDescriptor *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

+ (unsigned)classIdentifier
{
  return 1;
}

- (void)encodeInDictionaryRepresentation:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p, %@>", v5, self, self->_name];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end