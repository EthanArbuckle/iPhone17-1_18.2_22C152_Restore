@interface AFEndpointInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFEndpointInfo)init;
- (AFEndpointInfo)initWithBuilder:(id)a3;
- (AFEndpointInfo)initWithCoder:(id)a3;
- (AFEndpointInfo)initWithDictionaryRepresentation:(id)a3;
- (AFEndpointInfo)initWithIdentifier:(id)a3 mediaRouteIdentifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)mediaRouteIdentifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFEndpointInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  mediaRouteIdentifier = self->_mediaRouteIdentifier;
  if (mediaRouteIdentifier) {
    [v4 setObject:mediaRouteIdentifier forKey:@"mediaRouteIdentifier"];
  }
  v7 = (void *)[v4 copy];

  return v7;
}

- (AFEndpointInfo)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKey:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    v8 = [v4 objectForKey:@"mediaRouteIdentifier"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    self = [(AFEndpointInfo *)self initWithIdentifier:v6 mediaRouteIdentifier:v9];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"AFEndpointInfo::identifier"];
  [v5 encodeObject:self->_mediaRouteIdentifier forKey:@"AFEndpointInfo::mediaRouteIdentifier"];
}

- (AFEndpointInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFEndpointInfo::identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFEndpointInfo::mediaRouteIdentifier"];

  v7 = [(AFEndpointInfo *)self initWithIdentifier:v5 mediaRouteIdentifier:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFEndpointInfo *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(AFEndpointInfo *)v5 identifier];
      identifier = self->_identifier;
      if (identifier == v6 || [(NSString *)identifier isEqual:v6])
      {
        v8 = [(AFEndpointInfo *)v5 mediaRouteIdentifier];
        mediaRouteIdentifier = self->_mediaRouteIdentifier;
        BOOL v10 = mediaRouteIdentifier == v8 || [(NSString *)mediaRouteIdentifier isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSString *)self->_mediaRouteIdentifier hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFEndpointInfo;
  id v5 = [(AFEndpointInfo *)&v8 description];
  id v6 = (void *)[v4 initWithFormat:@"%@ {identifier = %@, mediaRouteIdentifier = %@}", v5, self->_identifier, self->_mediaRouteIdentifier];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFEndpointInfo *)self _descriptionWithIndent:0];
}

- (AFEndpointInfo)initWithIdentifier:(id)a3 mediaRouteIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__AFEndpointInfo_initWithIdentifier_mediaRouteIdentifier___block_invoke;
  v12[3] = &unk_1E59257F0;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  BOOL v10 = [(AFEndpointInfo *)self initWithBuilder:v12];

  return v10;
}

void __58__AFEndpointInfo_initWithIdentifier_mediaRouteIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setIdentifier:v3];
  [v4 setMediaRouteIdentifier:*(void *)(a1 + 40)];
}

- (AFEndpointInfo)init
{
  return [(AFEndpointInfo *)self initWithBuilder:0];
}

- (AFEndpointInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFEndpointInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFEndpointInfo;
  id v5 = [(AFEndpointInfo *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFEndpointInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFEndpointInfoMutation *)v7 isDirty])
    {
      id v8 = [(_AFEndpointInfoMutation *)v7 getIdentifier];
      uint64_t v9 = [v8 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v9;

      v11 = [(_AFEndpointInfoMutation *)v7 getMediaRouteIdentifier];
      uint64_t v12 = [v11 copy];
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v12;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFEndpointInfoMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFEndpointInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFEndpointInfoMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFEndpointInfo);
      id v7 = [(_AFEndpointInfoMutation *)v5 getIdentifier];
      uint64_t v8 = [v7 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      BOOL v10 = [(_AFEndpointInfoMutation *)v5 getMediaRouteIdentifier];
      uint64_t v11 = [v10 copy];
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v11;
    }
    else
    {
      id v6 = (AFEndpointInfo *)[(AFEndpointInfo *)self copy];
    }
  }
  else
  {
    id v6 = (AFEndpointInfo *)[(AFEndpointInfo *)self copy];
  }

  return v6;
}

@end