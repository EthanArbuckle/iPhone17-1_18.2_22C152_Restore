@interface BMResourceContainer
+ (BOOL)supportsSecureCoding;
- (BMResourceContainer)initWithCoder:(id)a3;
- (BMResourceContainer)initWithURL:(id)a3;
- (BMResourceContainer)initWithURL:(id)a3 personaIdentifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainer:(id)a3;
- (BOOL)isInUserVault;
- (NSString)description;
- (NSString)personaIdentifier;
- (NSURL)url;
- (unint64_t)hash;
- (unsigned)availabilityState;
- (unsigned)containerType;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailabilityState:(unsigned __int8)a3;
@end

@implementation BMResourceContainer

- (unint64_t)hash
{
  v3 = [(NSURL *)self->_url path];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_personaIdentifier hash] ^ v4;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_personaIdentifier forKey:@"personaIdentifier"];
}

- (BMResourceContainer)initWithCoder:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaIdentifier"];
  if (v5) {
    self = [(BMResourceContainer *)self initWithURL:v5 personaIdentifier:v6];
  }
  if (!self)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Decoding failure";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v9 = [v7 errorWithDomain:@"Biome" code:-1 userInfo:v8];
    [v4 failWithError:v9];
  }
  return self;
}

- (BMResourceContainer)initWithURL:(id)a3 personaIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMResourceContainer;
  v9 = [(BMResourceContainer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_personaIdentifier, a4);
  }

  return v10;
}

- (BMResourceContainer)initWithURL:(id)a3
{
  return [(BMResourceContainer *)self initWithURL:a3 personaIdentifier:0];
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (BOOL)isInUserVault
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BMResourceContainer *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(BMResourceContainer *)self isEqualToContainer:v5];

  return v6;
}

- (BOOL)isEqualToContainer:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(NSURL *)self->_url path];
  id v7 = [v5 url];
  id v8 = [v7 path];
  if ([v6 isEqual:v8])
  {
    personaIdentifier = self->_personaIdentifier;
    v10 = personaIdentifier;
    if (!personaIdentifier)
    {
      v3 = [v5 personaIdentifier];
      if (!v3)
      {
        char v12 = 1;
LABEL_9:

        goto LABEL_10;
      }
      v10 = self->_personaIdentifier;
    }
    uint64_t v11 = [v5 personaIdentifier];
    char v12 = [(NSString *)v10 isEqual:v11];

    if (!personaIdentifier) {
      goto LABEL_9;
    }
  }
  else
  {
    char v12 = 0;
  }
LABEL_10:

  return v12;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (unsigned)containerType
{
  return 1;
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)BMResourceContainer;
  v3 = [(BMResourceContainer *)&v9 description];
  id v4 = v3;
  url = self->_url;
  if (self->_personaIdentifier)
  {
    BOOL v6 = [NSString stringWithFormat:@" persona: %@", self->_personaIdentifier];
    id v7 = [v4 stringByAppendingFormat:@" URL: %@%@", url, v6];
  }
  else
  {
    id v7 = [v3 stringByAppendingFormat:@" URL: %@%@", self->_url, &stru_1F0B3A038];
  }

  return (NSString *)v7;
}

- (unsigned)availabilityState
{
  return self->_availabilityState;
}

- (void)setAvailabilityState:(unsigned __int8)a3
{
  self->_availabilityState = a3;
}

@end