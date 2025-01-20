@interface _SWStartCollaborationActionResponse
+ (BOOL)supportsSecureCoding;
+ (id)responseWithURL:(id)a3 updatedMetadata:(id)a4;
- (BOOL)isEqualToActionResponse:(id)a3;
- (NSURL)url;
- (_SWCollaborationMetadata)updatedMetadata;
- (_SWStartCollaborationActionResponse)initWithCoder:(id)a3;
- (_SWStartCollaborationActionResponse)initWithDestinationResponse:(id)a3;
- (_SWStartCollaborationActionResponse)initWithURL:(id)a3 updatedMetadata:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithBSActionResponseSettings:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation _SWStartCollaborationActionResponse

+ (id)responseWithURL:(id)a3 updatedMetadata:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:v6 updatedMetadata:v5];

  return v7;
}

- (_SWStartCollaborationActionResponse)initWithURL:(id)a3 updatedMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SWStartCollaborationActionResponse;
  v9 = [(_SWActionResponse *)&v12 initWithSuccess:1 error:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_updatedMetadata, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SWStartCollaborationActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_SWStartCollaborationActionResponse;
  id v5 = [(_SWActionResponse *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector("url");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    objc_super v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v13 = NSStringFromSelector(sel_updatedMetadata);
    uint64_t v14 = [v4 decodeObjectOfClasses:v12 forKey:v13];
    updatedMetadata = v5->_updatedMetadata;
    v5->_updatedMetadata = (SWCollaborationMetadata *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_SWStartCollaborationActionResponse;
  id v4 = a3;
  [(_SWActionResponse *)&v9 encodeWithCoder:v4];
  id v5 = [(_SWStartCollaborationActionResponse *)self url];
  uint64_t v6 = NSStringFromSelector("url");
  [v4 encodeObject:v5 forKey:v6];

  updatedMetadata = self->_updatedMetadata;
  uint64_t v8 = NSStringFromSelector(sel_updatedMetadata);
  [v4 encodeObject:updatedMetadata forKey:v8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SWStartCollaborationActionResponse;
  id v4 = [(_SWActionResponse *)&v7 copyWithZone:a3];
  if (v4)
  {
    id v5 = [(_SWStartCollaborationActionResponse *)self url];
    [v4 setUrl:v5];

    objc_storeStrong(v4 + 4, self->_updatedMetadata);
  }
  return v4;
}

- (BOOL)isEqualToActionResponse:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SWStartCollaborationActionResponse;
  if ([(_SWActionResponse *)&v13 isEqualToActionResponse:v5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      updatedMetadata = self->_updatedMetadata;
      if ((unint64_t)updatedMetadata | v6[4]
        && !-[SWCollaborationMetadata isEqual:](updatedMetadata, "isEqual:"))
      {
        char v11 = 0;
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v8 = [(_SWStartCollaborationActionResponse *)self url];
      if (v8 || ([v6 url], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_super v9 = [(_SWStartCollaborationActionResponse *)self url];
        v10 = [v6 url];
        char v11 = [v9 isEqual:v10];

        if (v8)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        char v11 = 1;
      }

      goto LABEL_13;
    }
  }
  char v11 = 0;
LABEL_15:

  return v11;
}

- (_SWStartCollaborationActionResponse)initWithDestinationResponse:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SWStartCollaborationActionResponse;
  id v5 = [(_SWActionResponse *)&v18 initWithDestinationResponse:v4];
  if (v5)
  {
    uint64_t v6 = [v4 info];
    objc_super v7 = [v6 objectForSetting:2];

    uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
    objc_super v9 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    char v11 = [v9 setWithArray:v10];
    uint64_t v12 = [v8 unarchivedObjectOfClasses:v11 fromData:v7 error:0];
    updatedMetadata = v5->_updatedMetadata;
    v5->_updatedMetadata = (SWCollaborationMetadata *)v12;

    uint64_t v14 = [v4 info];
    uint64_t v15 = [v14 objectForSetting:3];
    url = v5->_url;
    v5->_url = (NSURL *)v15;
  }
  return v5;
}

- (void)encodeWithBSActionResponseSettings:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SWStartCollaborationActionResponse;
  id v4 = a3;
  [(_SWActionResponse *)&v7 encodeWithBSActionResponseSettings:v4];
  id v5 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_updatedMetadata, 1, 0, v7.receiver, v7.super_class);
  [v4 setObject:v5 forSetting:2];
  uint64_t v6 = [(_SWStartCollaborationActionResponse *)self url];
  [v4 setObject:v6 forSetting:3];
}

- (_SWCollaborationMetadata)updatedMetadata
{
  return (_SWCollaborationMetadata *)self->_updatedMetadata;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_updatedMetadata, 0);
}

@end