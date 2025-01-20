@interface REDrawableQueueTexturePayload
+ (BOOL)supportsSecureCoding;
- (REDrawableQueuePayload)drawableQueue;
- (REDrawableQueueTexturePayload)initWithCoder:(id)a3;
- (REDrawableQueueTexturePayload)initWithDrawableQueue:(id)a3 placeholderTexture:(id)a4;
- (RESharedResourcePayload)placeholderTexture;
- (id)redactedDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REDrawableQueueTexturePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REDrawableQueueTexturePayload)initWithDrawableQueue:(id)a3 placeholderTexture:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)REDrawableQueueTexturePayload;
  v9 = [(RESharedResourcePayload *)&v17 init];
  p_isa = (id *)&v9->super.super.isa;
  if (v9
    && (p_drawableQueue = &v9->_drawableQueue,
        objc_storeStrong((id *)&v9->_drawableQueue, a3),
        objc_storeStrong(p_isa + 3, a4),
        !*p_drawableQueue))
  {
    v14 = *re::assetTypesLogObjects(v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_fault_impl(&dword_233120000, v14, OS_LOG_TYPE_FAULT, "Expected DrawableQueue payload to be non-nil", v16, 2u);
    }
    v13 = 0;
  }
  else
  {
    v13 = p_isa;
  }

  return v13;
}

- (REDrawableQueueTexturePayload)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)REDrawableQueueTexturePayload;
  v5 = [(RESharedResourcePayload *)&v18 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"drawableQueue"];
  drawableQueue = v5->_drawableQueue;
  v5->_drawableQueue = (REDrawableQueuePayload *)v6;

  if (v5->_drawableQueue)
  {
    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"placeholderTexture"];
    placeholderTexture = v5->_placeholderTexture;
    v5->_placeholderTexture = (RESharedResourcePayload *)v13;

LABEL_4:
    v15 = v5;
    goto LABEL_8;
  }
  v16 = *re::assetTypesLogObjects(v8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_fault_impl(&dword_233120000, v16, OS_LOG_TYPE_FAULT, "Failed to decode DrawableQueue object for %@", buf, 0xCu);
  }
  v15 = 0;
LABEL_8:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_drawableQueue forKey:@"drawableQueue"];
  [v4 encodeObject:self->_placeholderTexture forKey:@"placeholderTexture"];
}

- (id)redactedDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<REDrawableQueueTexturePayload: %p>", self);
}

- (REDrawableQueuePayload)drawableQueue
{
  return self->_drawableQueue;
}

- (RESharedResourcePayload)placeholderTexture
{
  return self->_placeholderTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderTexture, 0);
  objc_storeStrong((id *)&self->_drawableQueue, 0);
}

@end