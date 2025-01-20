@interface PTParticipant
- (BOOL)isEqual:(id)a3;
- (CXParticipant)underlyingParticipant;
- (NSString)name;
- (PTParticipant)initWithName:(NSString *)name image:(UIImage *)image;
- (UIImage)image;
- (id)imageFileURL;
- (unint64_t)hash;
@end

@implementation PTParticipant

- (PTParticipant)initWithName:(NSString *)name image:(UIImage *)image
{
  v6 = name;
  v7 = image;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"name must be a kind of NSString"];
  }
  if ([(NSString *)v6 length])
  {
    if (!v7) {
      goto LABEL_9;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"name length must be greater than 0"];
    if (!v7) {
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"image must be a UIImage"];
  }
LABEL_9:
  v14.receiver = self;
  v14.super_class = (Class)PTParticipant;
  v8 = [(PTParticipant *)&v14 init];
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v8->_image, image);
      v10 = _pttTemporaryFilesystemURLForImage(v7);
    }
    else
    {
      v10 = 0;
    }
    uint64_t v11 = [objc_alloc(MEMORY[0x263EFC940]) initWithName:v6 imageURL:v10];
    underlyingParticipant = v9->_underlyingParticipant;
    v9->_underlyingParticipant = (CXParticipant *)v11;

    [(CXParticipant *)v9->_underlyingParticipant setWrappedByObject:v9];
  }

  return v9;
}

- (UIImage)image
{
  return self->_image;
}

- (id)imageFileURL
{
  v2 = [(PTParticipant *)self underlyingParticipant];
  v3 = [v2 imageURL];

  return v3;
}

- (NSString)name
{
  v2 = [(PTParticipant *)self underlyingParticipant];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (unint64_t)hash
{
  v2 = [(PTParticipant *)self underlyingParticipant];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 underlyingParticipant];
    v6 = [(PTParticipant *)self underlyingParticipant];
    char v7 = [v6 isEqual:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (CXParticipant)underlyingParticipant
{
  return self->_underlyingParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingParticipant, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end