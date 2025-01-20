@interface SWPerson
+ (BOOL)supportsSecureCoding;
- (NSData)customThumbnailImageData;
- (SWPerson)initWithCoder:(id)a3;
- (SWPerson)initWithHandle:(NSString *)handle identity:(SWPersonIdentity *)identity displayName:(NSString *)displayName thumbnailImageData:(NSData *)thumbnailImageData;
- (SWPerson)initWithHandle:(id)a3 displayName:(id)a4 thumbnailImageData:(id)a5;
- (SWPersonIdentity)identity;
- (id)contact;
- (id)displayName;
- (id)handle;
- (id)slPerson;
- (id)thumbnailImageData;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setSlPerson:(id)a3;
@end

@implementation SWPerson

- (SWPerson)initWithHandle:(NSString *)handle identity:(SWPersonIdentity *)identity displayName:(NSString *)displayName thumbnailImageData:(NSData *)thumbnailImageData
{
  v10 = handle;
  unint64_t v11 = identity;
  v12 = displayName;
  v13 = thumbnailImageData;
  if (!((unint64_t)v10 | v11)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"either handle or identity must be non-nil"];
  }
  id SLPersonClass = getSLPersonClass();
  if (![SLPersonClass instancesRespondToSelector:sel_initWithHandle_displayName_]
    || ![SLPersonClass instancesRespondToSelector:sel_handle]
    || ![SLPersonClass instancesRespondToSelector:sel_displayName]
    || ![SLPersonClass instancesRespondToSelector:sel_contact]
    || ([SLPersonClass instancesRespondToSelector:sel_thumbnailImageData] & 1) == 0)
  {
    p_super = SWFrameworkLogHandle();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      -[SWPerson initWithHandle:identity:displayName:thumbnailImageData:](p_super);
    }
    goto LABEL_12;
  }
  v20.receiver = self;
  v20.super_class = (Class)SWPerson;
  self = [(SWPerson *)&v20 init];
  if (self)
  {
    v15 = (void *)[objc_alloc((Class)SLPersonClass) initWithHandle:v10 displayName:v12];
    id slPerson = self->_slPerson;
    self->_id slPerson = v15;

    objc_storeStrong((id *)&self->_customThumbnailImageData, thumbnailImageData);
    v17 = (SWPersonIdentity *)(id)v11;
    p_super = &self->_identity->super;
    self->_identity = v17;
LABEL_12:
  }
  return self;
}

- (SWPerson)initWithHandle:(id)a3 displayName:(id)a4 thumbnailImageData:(id)a5
{
  return [(SWPerson *)self initWithHandle:a3 identity:0 displayName:a4 thumbnailImageData:a5];
}

- (id)handle
{
  v2 = [(SWPerson *)self slPerson];
  v3 = [v2 handle];

  return v3;
}

- (id)displayName
{
  v2 = [(SWPerson *)self slPerson];
  v3 = [v2 displayName];

  return v3;
}

- (id)contact
{
  v2 = [(SWPerson *)self slPerson];
  v3 = [v2 contact];

  return v3;
}

- (id)thumbnailImageData
{
  v3 = [(SWPerson *)self customThumbnailImageData];

  if (v3)
  {
    v4 = [(SWPerson *)self customThumbnailImageData];
  }
  else
  {
    v5 = [(SWPerson *)self slPerson];
    v4 = [v5 thumbnailImageData];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SWPerson *)self slPerson];
  v6 = NSStringFromSelector(sel_slPerson);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(SWPerson *)self customThumbnailImageData];
  v8 = NSStringFromSelector(sel_customThumbnailImageData);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(SWPerson *)self identity];
  v9 = NSStringFromSelector(sel_identity);
  [v4 encodeObject:v10 forKey:v9];
}

- (SWPerson)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SWPerson;
  v5 = [(SWPerson *)&v19 init];
  if (v5)
  {
    id SLPersonClass = getSLPersonClass();
    v7 = NSStringFromSelector(sel_slPerson);
    uint64_t v8 = [v4 decodeObjectOfClass:SLPersonClass forKey:v7];
    id slPerson = v5->_slPerson;
    v5->_id slPerson = (id)v8;

    uint64_t v10 = objc_opt_class();
    unint64_t v11 = NSStringFromSelector(sel_customThumbnailImageData);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    customThumbnailImageData = v5->_customThumbnailImageData;
    v5->_customThumbnailImageData = (NSData *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_identity);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    identity = v5->_identity;
    v5->_identity = (SWPersonIdentity *)v16;
  }
  return v5;
}

- (id)slPerson
{
  return self->_slPerson;
}

- (void)setSlPerson:(id)a3
{
}

- (NSData)customThumbnailImageData
{
  return self->_customThumbnailImageData;
}

- (SWPersonIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_customThumbnailImageData, 0);

  objc_storeStrong(&self->_slPerson, 0);
}

- (void)initWithHandle:(os_log_t)log identity:displayName:thumbnailImageData:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C0DE000, log, OS_LOG_TYPE_ERROR, "SLPerson soft link did not have expected selectors. Failing to initialize SWPerson.", v1, 2u);
}

@end