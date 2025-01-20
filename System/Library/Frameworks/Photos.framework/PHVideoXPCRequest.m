@interface PHVideoXPCRequest
+ (BOOL)supportsSecureCoding;
- (CGSize)size;
- (PHVideoRequestBehaviorSpec)behaviorSpec;
- (PHVideoXPCRequest)initWithCoder:(id)a3;
- (PHVideoXPCRequest)initWithTaskIdentifier:(id)a3 assetObjectID:(id)a4 size:(CGSize)a5 behavior:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHVideoXPCRequest

- (void).cxx_destruct
{
}

- (PHVideoRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PHVideoXPCRequest)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHVideoXPCRequest;
  v5 = [(PLResourceXPCRequest *)&v17 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    p_size = &v5->_size;
    [v4 decodeDoubleForKey:@"width"];
    v9 = v8;
    [v4 decodeDoubleForKey:@"height"];
    *(void *)&p_size->double width = v9;
    v6->_size.double height = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"behaviorSpec"];
    behaviorSpec = v6->_behaviorSpec;
    v6->_behaviorSpec = (PHVideoRequestBehaviorSpec *)v11;

    if (!v6->_behaviorSpec)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"behavior spec is required";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      v15 = [v13 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v14];
      [v4 failWithError:v15];

      v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHVideoXPCRequest;
  id v4 = a3;
  [(PLResourceXPCRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"width", self->_size.width, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"height" forKey:self->_size.height];
  [v4 encodeObject:self->_behaviorSpec forKey:@"behaviorSpec"];
}

- (PHVideoXPCRequest)initWithTaskIdentifier:(id)a3 assetObjectID:(id)a4 size:(CGSize)a5 behavior:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PHVideoXPCRequest;
  v13 = [(PLResourceXPCRequest *)&v16 initWithTaskIdentifier:a3 assetObjectID:a4];
  v14 = v13;
  if (v13)
  {
    v13->_size.CGFloat width = width;
    v13->_size.CGFloat height = height;
    objc_storeStrong((id *)&v13->_behaviorSpec, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end