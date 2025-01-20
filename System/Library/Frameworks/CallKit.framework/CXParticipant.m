@interface CXParticipant
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToParticipant:(id)a3;
- (CXParticipant)initWithCoder:(id)a3;
- (CXParticipant)initWithName:(id)a3;
- (CXParticipant)initWithName:(id)a3 imageURL:(id)a4;
- (CXParticipant)initWithParticipant:(id)a3;
- (CXSandboxExtendedURL)sandboxExtendedImageURL;
- (NSString)name;
- (NSURL)imageURL;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)wrappedByObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setName:(id)a3;
- (void)setSandboxExtendedImageURL:(id)a3;
- (void)setWrappedByObject:(id)a3;
@end

@implementation CXParticipant

- (CXParticipant)initWithName:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXParticipant initWithName:]", @"name" format];
  }
  v9.receiver = self;
  v9.super_class = (Class)CXParticipant;
  v5 = [(CXParticipant *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (CXParticipant)initWithName:(id)a3 imageURL:(id)a4
{
  id v6 = a4;
  v7 = [(CXParticipant *)self initWithName:a3];
  v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = CXGetSandboxExtendedFileURL(v6);
    sandboxExtendedImageURL = v8->_sandboxExtendedImageURL;
    v8->_sandboxExtendedImageURL = (CXSandboxExtendedURL *)v9;
  }
  return v8;
}

- (CXParticipant)initWithParticipant:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXParticipant;
  v5 = [(CXParticipant *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 sandboxExtendedImageURL];
    sandboxExtendedImageURL = v5->_sandboxExtendedImageURL;
    v5->_sandboxExtendedImageURL = (CXSandboxExtendedURL *)v8;
  }
  return v5;
}

- (NSURL)imageURL
{
  v2 = [(CXParticipant *)self sandboxExtendedImageURL];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

- (void)setImageURL:(id)a3
{
  if (a3)
  {
    uint64_t v4 = CXGetSandboxExtendedFileURL(a3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(CXParticipant *)self setSandboxExtendedImageURL:v4];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [a1 unarchivedObjectClasses];
  uint64_t v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_name);
  [v5 encodeObject:name forKey:v6];

  sandboxExtendedImageURL = self->_sandboxExtendedImageURL;
  NSStringFromSelector(sel_sandboxExtendedImageURL);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:sandboxExtendedImageURL forKey:v8];
}

- (CXParticipant)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CXParticipant;
  id v5 = [(CXParticipant *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_name);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    objc_super v11 = NSStringFromSelector(sel_sandboxExtendedImageURL);
    v12 = [v4 decodeObjectOfClass:v10 forKey:v11];

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v4 connection], v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
      {
        sandboxExtendedImageURL = [v4 connection];
        v15 = [v12 URL];
        int v16 = objc_msgSend(sandboxExtendedImageURL, "cx_clientSandboxCanAccessFileURL:", v15);

        if (v16)
        {
          v17 = v12;
          p_super = &v5->_sandboxExtendedImageURL->super;
          v5->_sandboxExtendedImageURL = v17;
        }
        else
        {
          p_super = CXDefaultLog();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_impl(&dword_1A6E3A000, p_super, OS_LOG_TYPE_DEFAULT, "[WARN] Client does not have permission to access %@", buf, 0xCu);
          }
        }
      }
      else
      {
        v19 = v12;
        sandboxExtendedImageURL = v5->_sandboxExtendedImageURL;
        v5->_sandboxExtendedImageURL = v19;
      }
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CXParticipant allocWithZone:a3];

  return [(CXParticipant *)v4 initWithParticipant:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[CXMutableParticipant allocWithZone:a3];

  return [(CXParticipant *)v4 initWithParticipant:self];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_name);
  id v5 = [(CXParticipant *)self name];
  [v3 appendFormat:@" %@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_imageURL);
  id v7 = [(CXParticipant *)self imageURL];
  [v3 appendFormat:@" %@=%@", v6, v7];

  [v3 appendString:@">"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CXParticipant *)self name];
  uint64_t v4 = [v3 hash];
  id v5 = [(CXParticipant *)self sandboxExtendedImageURL];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CXParticipant *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CXParticipant *)self isEqualToParticipant:v4];
  }

  return v5;
}

- (BOOL)isEqualToParticipant:(id)a3
{
  id v4 = a3;
  name = self->_name;
  uint64_t v6 = [v4 name];
  if ((unint64_t)name | v6 && ![(NSString *)name isEqual:v6])
  {
    char v9 = 0;
  }
  else
  {
    sandboxExtendedImageURL = self->_sandboxExtendedImageURL;
    uint64_t v8 = [v4 sandboxExtendedImageURL];
    if ((unint64_t)sandboxExtendedImageURL | v8) {
      char v9 = [(CXSandboxExtendedURL *)sandboxExtendedImageURL isEqual:v8];
    }
    else {
      char v9 = 1;
    }
  }
  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CXSandboxExtendedURL)sandboxExtendedImageURL
{
  return self->_sandboxExtendedImageURL;
}

- (void)setSandboxExtendedImageURL:(id)a3
{
}

- (id)wrappedByObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_wrappedByObject);

  return WeakRetained;
}

- (void)setWrappedByObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_wrappedByObject);
  objc_storeStrong((id *)&self->_sandboxExtendedImageURL, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end