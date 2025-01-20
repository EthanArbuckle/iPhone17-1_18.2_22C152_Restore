@interface SLAttachment
+ (BOOL)attachmentTypeRepresentsAnImage:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)needsAnotherPreviewGeneration;
- (BOOL)startedPayloadLoad;
- (NSItemProvider)itemProvider;
- (NSString)identifier;
- (NSString)typeIdentifier;
- (NSURL)payloadSourceFileURL;
- (SLAttachment)init;
- (SLAttachment)initWithCoder:(id)a3;
- (SLAttachment)initWithPayload:(id)a3 type:(int64_t)a4 previewImage:(id)a5;
- (UIImage)previewImage;
- (id)_uniqueIdentifier;
- (id)description;
- (id)payload;
- (int64_t)downsampleStatus;
- (int64_t)itemProviderPreviewType;
- (int64_t)previewType;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDownsampleStatus:(int64_t)a3;
- (void)setItemProvider:(id)a3;
- (void)setNeedsAnotherPreviewGeneration:(BOOL)a3;
- (void)setPayload:(id)a3;
- (void)setPayloadSourceFileURL:(id)a3;
- (void)setPayloadUpdateObserverWithBlock:(id)a3;
- (void)setPreviewImage:(id)a3;
- (void)setPreviewType:(int64_t)a3;
- (void)setPreviewUpdateObserverWithBlock:(id)a3;
- (void)setStartedPayloadLoad:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setTypeIdentifier:(id)a3;
@end

@implementation SLAttachment

- (SLAttachment)init
{
  return [(SLAttachment *)self initWithPayload:0 type:0 previewImage:0];
}

- (SLAttachment)initWithPayload:(id)a3 type:(int64_t)a4 previewImage:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SLAttachment;
  v11 = [(SLAttachment *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_payload, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_previewImage, a5);
    uint64_t v13 = [(SLAttachment *)v12 _uniqueIdentifier];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;
  }
  return v12;
}

- (id)_uniqueIdentifier
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  v4 = (__CFString *)CFUUIDCreateString(v2, v3);
  CFRelease(v3);

  return v4;
}

- (SLAttachment)initWithCoder:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLAttachment;
  v5 = [(SLAttachment *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    id v10 = [v8 setWithArray:v9];
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"payload"];
    [(SLAttachment *)v5 setPayload:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewImage"];
    [(SLAttachment *)v5 setPreviewImage:v12];

    -[SLAttachment setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
    -[SLAttachment setPreviewType:](v5, "setPreviewType:", [v4 decodeIntegerForKey:@"previewType"]);
    -[SLAttachment setDownsampleStatus:](v5, "setDownsampleStatus:", [v4 decodeIntegerForKey:@"downsampleStatus"]);
    uint64_t v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [&unk_1F1E40E28 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(&unk_1F1E40E28);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = [(SLAttachment *)self valueForKey:v9];
        [v4 encodeObject:v10 forKey:v9];
      }
      uint64_t v6 = [&unk_1F1E40E28 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[SLAttachment type](self, "type"), @"type");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SLAttachment previewType](self, "previewType"), @"previewType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SLAttachment downsampleStatus](self, "downsampleStatus"), @"downsampleStatus");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPreviewImage:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_previewImage, a3);
  previewUpdateObserver = (void (**)(void))self->_previewUpdateObserver;
  if (previewUpdateObserver) {
    previewUpdateObserver[2]();
  }
}

- (void)setPayload:(id)a3
{
  id v6 = a3;
  objc_storeStrong(&self->_payload, a3);
  payloadUpdateObserver = (void (**)(void))self->_payloadUpdateObserver;
  if (payloadUpdateObserver) {
    payloadUpdateObserver[2]();
  }
}

- (void)setPreviewUpdateObserverWithBlock:(id)a3
{
  self->_previewUpdateObserver = (id)MEMORY[0x1C876A6A0](a3, a2);

  MEMORY[0x1F41817F8]();
}

- (void)setPayloadUpdateObserverWithBlock:(id)a3
{
  self->_payloadUpdateObserver = (id)MEMORY[0x1C876A6A0](a3, a2);

  MEMORY[0x1F41817F8]();
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
  self->_itemProviderPreviewType = 0;
  if (self->_itemProvider)
  {
    uint64_t v5 = [(SLAttachment *)self itemProvider];
    id v6 = [v5 userInfo];
    id v9 = [v6 objectForKeyedSubscript:@"SLItemProviderHasPreview"];

    if (v9)
    {
      _SLLog(v3, 7, @"SLAttachment assigned itemProvider with SLItemProviderHasPreview %@");
      int v7 = objc_msgSend(v9, "BOOLValue", v9);
      int64_t v8 = 1;
      if (!v7) {
        int64_t v8 = 2;
      }
      self->_itemProviderPreviewType = v8;
    }
    else
    {
      _SLLog(v3, 7, @"SLAttachment assigned itemProvider with no SLItemProviderHasPreview.");
    }
  }
}

+ (BOOL)attachmentTypeRepresentsAnImage:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(SLAttachment *)self identifier];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[SLAttachment type](self, "type"));
  id v6 = [(SLAttachment *)self payload];
  int v7 = [(SLAttachment *)self previewImage];
  int64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[SLAttachment downsampleStatus](self, "downsampleStatus"));
  id v9 = [(SLAttachment *)self payloadSourceFileURL];
  id v10 = [v3 stringWithFormat:@"attachment %p { \n\t identifier=%@,\n\t type=%@,\n\t payload=%p,\n\t previewImage=%@,\n\t downsampleStatus=%@,\n\t payloadSourceFileURL=%@,\n", self, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (int64_t)previewType
{
  return self->_previewType;
}

- (void)setPreviewType:(int64_t)a3
{
  self->_previewType = a3;
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)payload
{
  return self->_payload;
}

- (NSURL)payloadSourceFileURL
{
  return self->_payloadSourceFileURL;
}

- (void)setPayloadSourceFileURL:(id)a3
{
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
}

- (int64_t)itemProviderPreviewType
{
  return self->_itemProviderPreviewType;
}

- (int64_t)downsampleStatus
{
  return self->_downsampleStatus;
}

- (void)setDownsampleStatus:(int64_t)a3
{
  self->_downsampleStatus = a3;
}

- (BOOL)startedPayloadLoad
{
  return self->_startedPayloadLoad;
}

- (void)setStartedPayloadLoad:(BOOL)a3
{
  self->_startedPayloadLoad = a3;
}

- (BOOL)needsAnotherPreviewGeneration
{
  return self->_needsAnotherPreviewGeneration;
}

- (void)setNeedsAnotherPreviewGeneration:(BOOL)a3
{
  self->_needsAnotherPreviewGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_payloadSourceFileURL, 0);
  objc_storeStrong(&self->_payload, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_payloadUpdateObserver, 0);

  objc_storeStrong(&self->_previewUpdateObserver, 0);
}

@end