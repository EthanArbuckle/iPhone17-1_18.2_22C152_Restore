@interface MPPlaybackArchiveDisplayProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MPPlaybackArchiveDisplayProperties)initWithBlock:(id)a3;
- (MPPlaybackArchiveDisplayProperties)initWithCoder:(id)a3;
- (MPPlaybackArchiveDisplayProperties)initWithTitle:(id)a3 subtitle:(id)a4 artworkImageData:(id)a5;
- (NSData)artworkImageData;
- (NSMutableDictionary)storage;
- (NSString)description;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)artworkImageURL;
- (id)copyWithOptions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworkImageData:(id)a3;
- (void)setArtworkImageURL:(id)a3;
- (void)setStorage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MPPlaybackArchiveDisplayProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_artworkImageData, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setStorage:(id)a3
{
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (NSData)artworkImageData
{
  return self->_artworkImageData;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (void)setArtworkImageURL:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (self->_final)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MPPlaybackArchiveDisplayProperties.m" lineNumber:155 description:@"Attempt to mutate after finalization."];

    id v5 = v8;
  }
  v6 = [v5 absoluteString];
  [(NSMutableDictionary *)self->_storage setObject:v6 forKeyedSubscript:@"artworkImageURL"];
}

- (void)setArtworkImageData:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_final)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MPPlaybackArchiveDisplayProperties.m" lineNumber:150 description:@"Attempt to mutate after finalization."];

    id v5 = v9;
  }
  v6 = (NSData *)[v5 copy];
  artworkImageData = self->_artworkImageData;
  self->_artworkImageData = v6;
}

- (void)setSubtitle:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_final)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MPPlaybackArchiveDisplayProperties.m" lineNumber:145 description:@"Attempt to mutate after finalization."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v6;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_final)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MPPlaybackArchiveDisplayProperties.m" lineNumber:140 description:@"Attempt to mutate after finalization."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  title = self->_title;
  self->_title = v6;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_artworkImageData forKey:@"artworkImageData"];
  [v5 encodeObject:self->_storage forKey:@"storage"];
}

- (MPPlaybackArchiveDisplayProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPPlaybackArchiveDisplayProperties;
  id v5 = [(MPPlaybackArchiveDisplayProperties *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artworkImageData"];
    artworkImageData = v5->_artworkImageData;
    v5->_artworkImageData = (NSData *)v10;

    v12 = [v4 decodePropertyListForKey:@"storage"];
    v13 = (void *)[v12 mutableCopy];
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    storage = v5->_storage;
    v5->_storage = v15;

    v5->_final = 1;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v47 = v3 ^ 0x736F6D6570736575;
  uint64_t v49 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v51 = v3 ^ 0x6C7967656E657261;
  uint64_t v53 = v4 ^ 0x7465646279746573;
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = objc_claimAutoreleasedReturnValue();
  [v6 UTF8String];
  [v6 length];

  v7 = self->_title;
  [(NSString *)v7 UTF8String];
  [(NSString *)v7 length];

  uint64_t v8 = self->_subtitle;
  [(NSString *)v8 UTF8String];
  [(NSString *)v8 length];

  id v9 = self->_artworkImageData;
  [(NSData *)v9 bytes];
  [(NSData *)v9 length];

  uint64_t v10 = self->_storage;
  uint64_t v11 = [(NSMutableDictionary *)v10 hash];
  uint64_t v12 = (v47 + v49) ^ __ROR8__(v49, 51);
  uint64_t v13 = v51 + (v53 ^ v11);
  uint64_t v14 = __ROR8__(v53 ^ v11, 48);
  uint64_t v15 = (v13 ^ v14) + __ROR8__(v47 + v49, 32);
  uint64_t v16 = v15 ^ __ROR8__(v13 ^ v14, 43);
  uint64_t v17 = v13 + v12;
  uint64_t v52 = __ROR8__(v17, 32);
  uint64_t v54 = v16;
  uint64_t v48 = v15 ^ v11;
  uint64_t v50 = v17 ^ __ROR8__(v12, 47);

  uint64_t v18 = (v48 + v50) ^ __ROR8__(v50, 51);
  uint64_t v19 = v52 + (v54 ^ 0x800000000000000);
  uint64_t v20 = __ROR8__(v54 ^ 0x800000000000000, 48);
  uint64_t v21 = (v19 ^ v20) + __ROR8__(v48 + v50, 32);
  uint64_t v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
  uint64_t v23 = v19 + v18;
  uint64_t v24 = v23 ^ __ROR8__(v18, 47);
  uint64_t v25 = (v21 ^ 0x800000000000000) + v24;
  uint64_t v26 = v25 ^ __ROR8__(v24, 51);
  uint64_t v27 = (__ROR8__(v23, 32) ^ 0xFFLL) + v22;
  uint64_t v28 = __ROR8__(v22, 48);
  uint64_t v29 = __ROR8__(v25, 32) + (v27 ^ v28);
  uint64_t v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  uint64_t v31 = v26 + v27;
  uint64_t v32 = v31 ^ __ROR8__(v26, 47);
  uint64_t v33 = v32 + v29;
  uint64_t v34 = v33 ^ __ROR8__(v32, 51);
  uint64_t v35 = __ROR8__(v31, 32) + v30;
  uint64_t v36 = __ROR8__(v30, 48);
  uint64_t v37 = __ROR8__(v33, 32) + (v35 ^ v36);
  uint64_t v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
  uint64_t v39 = v34 + v35;
  uint64_t v40 = v39 ^ __ROR8__(v34, 47);
  uint64_t v41 = v40 + v37;
  uint64_t v42 = v41 ^ __ROR8__(v40, 51);
  uint64_t v43 = __ROR8__(v39, 32) + v38;
  uint64_t v44 = __ROR8__(v38, 48);
  uint64_t v45 = __ROR8__(v41, 32) + (v43 ^ v44);
  return (v42 + v43) ^ __ROR8__(v42, 47) ^ v45 ^ __ROR8__(v42 + v43, 32) ^ v45 ^ __ROR8__(v43 ^ v44, 43);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MPPlaybackArchiveDisplayProperties *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      title = self->_title;
      v7 = [(MPPlaybackArchiveDisplayProperties *)v5 title];
      if (title == v7)
      {
      }
      else
      {
        int v8 = [(NSString *)title isEqual:v7];

        if (!v8)
        {
          char v9 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      subtitle = self->_subtitle;
      uint64_t v11 = [(MPPlaybackArchiveDisplayProperties *)v5 subtitle];
      if (subtitle == v11)
      {
      }
      else
      {
        int v12 = [(NSString *)subtitle isEqual:v11];

        if (!v12)
        {
          char v9 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      artworkImageData = self->_artworkImageData;
      uint64_t v14 = [(MPPlaybackArchiveDisplayProperties *)v5 artworkImageData];
      if (artworkImageData == v14)
      {
      }
      else
      {
        int v15 = [(NSData *)artworkImageData isEqual:v14];

        if (!v15)
        {
          char v9 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      storage = self->_storage;
      uint64_t v17 = [(MPPlaybackArchiveDisplayProperties *)v5 storage];
      if (storage == v17) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSMutableDictionary *)storage isEqual:v17];
      }

      goto LABEL_21;
    }
    char v9 = 0;
  }
LABEL_24:

  return v9;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MPPlaybackArchiveDisplayProperties *)self title];
  id v6 = [(MPPlaybackArchiveDisplayProperties *)self subtitle];
  v7 = [(MPPlaybackArchiveDisplayProperties *)self artworkImageData];
  int v8 = [(MPPlaybackArchiveDisplayProperties *)self artworkImageURL];
  char v9 = [(MPPlaybackArchiveDisplayProperties *)self storage];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p title=%@ subtitle=%@ artworkImageData=%@ artworkImageURL=%@ storage=%@>", v4, self, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (id)copyWithOptions:(unint64_t)a3
{
  id v5 = [MPPlaybackArchiveDisplayProperties alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__MPPlaybackArchiveDisplayProperties_copyWithOptions___block_invoke;
  v11[3] = &unk_1E57F8D20;
  v11[4] = self;
  v11[5] = a3;
  id v6 = [(MPPlaybackArchiveDisplayProperties *)v5 initWithBlock:v11];
  v7 = [(MPPlaybackArchiveDisplayProperties *)self storage];
  uint64_t v8 = [v7 mutableCopy];
  id v9 = v6[5];
  v6[5] = (id)v8;

  if ((a3 & 0x10) != 0) {
    [v6[5] removeObjectForKey:@"artworkImageURL"];
  }
  return v6;
}

void __54__MPPlaybackArchiveDisplayProperties_copyWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 4) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 32) title];
    [v7 setTitle:v4];

    id v5 = [*(id *)(a1 + 32) subtitle];
    [v7 setSubtitle:v5];

    uint64_t v3 = *(void *)(a1 + 40);
  }
  if ((v3 & 8) == 0)
  {
    id v6 = [*(id *)(a1 + 32) artworkImageData];
    [v7 setArtworkImageData:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(MPPlaybackArchiveDisplayProperties *)self copyWithOptions:0];
}

- (MPPlaybackArchiveDisplayProperties)initWithTitle:(id)a3 subtitle:(id)a4 artworkImageData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__MPPlaybackArchiveDisplayProperties_initWithTitle_subtitle_artworkImageData___block_invoke;
  v16[3] = &unk_1E57F8CF8;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = [(MPPlaybackArchiveDisplayProperties *)self initWithBlock:v16];

  return v14;
}

void __78__MPPlaybackArchiveDisplayProperties_initWithTitle_subtitle_artworkImageData___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setSubtitle:a1[5]];
  [v4 setArtworkImageData:a1[6]];
}

- (MPPlaybackArchiveDisplayProperties)initWithBlock:(id)a3
{
  id v4 = (void (**)(id, MPPlaybackArchiveDisplayProperties *))a3;
  v9.receiver = self;
  v9.super_class = (Class)MPPlaybackArchiveDisplayProperties;
  id v5 = [(MPPlaybackArchiveDisplayProperties *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v5->_storage;
    v5->_storage = (NSMutableDictionary *)v6;

    v4[2](v4, v5);
    v5->_final = 1;
  }

  return v5;
}

- (NSURL)artworkImageURL
{
  v2 = [(NSMutableDictionary *)self->_storage objectForKey:@"artworkImageURL"];
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];

  return (NSURL *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end