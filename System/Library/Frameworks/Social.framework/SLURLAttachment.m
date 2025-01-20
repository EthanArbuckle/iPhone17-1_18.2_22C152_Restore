@interface SLURLAttachment
- (SLURLAttachment)initWithURL:(id)a3 ofType:(int64_t)a4 preview:(id)a5;
- (SLURLAttachment)initWithURL:(id)a3 previewImage:(id)a4;
- (int64_t)urlType;
@end

@implementation SLURLAttachment

- (SLURLAttachment)initWithURL:(id)a3 previewImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isMusicStoreURL])
  {
    uint64_t v8 = 3;
  }
  else if ([v6 isAppStoreURL])
  {
    uint64_t v8 = 4;
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = [(SLURLAttachment *)self initWithURL:v6 ofType:v8 preview:v7];

  return v9;
}

- (SLURLAttachment)initWithURL:(id)a3 ofType:(int64_t)a4 preview:(id)a5
{
  id v6 = self;
  if (a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)SLURLAttachment;
    uint64_t v8 = -[SLAttachment initWithPayload:type:previewImage:](&v11, sel_initWithPayload_type_previewImage_);
    if (v8) {
      v8->_urlType = a4;
    }
    id v6 = v8;
    v9 = v6;
  }
  else
  {
    _SLLog(v5, 3, @"SLURLAttachment must be created with a non-nil URL.");
    v9 = 0;
  }

  return v9;
}

- (int64_t)urlType
{
  return self->_urlType;
}

@end