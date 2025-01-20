@interface QLTUbiquitousFileThumbnailRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldProvideFoldedGenericIcon;
- (FPItem)item;
- (QLTUbiquitousFileThumbnailRequest)initWithCoder:(id)a3;
- (QLTUbiquitousFileThumbnailRequest)initWithFPItem:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7;
- (id)computeContentType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation QLTUbiquitousFileThumbnailRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLTUbiquitousFileThumbnailRequest)initWithFPItem:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  v15 = [QLCacheFileProviderFileIdentifier alloc];
  v16 = [v14 itemID];
  v17 = [(QLCacheFileProviderFileIdentifier *)v15 initWithItemID:v16];

  v18 = [[QLThumbnailVersion alloc] initWithFPItem:v14 automaticallyGenerated:1];
  v19 = [[QLCacheFileProviderVersionedFileIdentifier alloc] initWithFileIdentifier:v17 version:v18];
  v20 = -[QLTThumbnailRequest initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:](self, "initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:", v19, v7, 0, 0, -1, width, height, a6, a5);
  v21 = v20;
  if (v20) {
    objc_storeStrong((id *)&v20->_item, a3);
  }

  return v21;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(FPItem *)self->_item providerID];
  BOOL v7 = [(FPItem *)self->_item itemIdentifier];
  v8 = [(FPItem *)self->_item displayName];
  [(QLTThumbnailRequest *)self size];
  uint64_t v10 = v9;
  [(QLTThumbnailRequest *)self size];
  v12 = (void *)[v3 initWithFormat:@"<%@:%p %@/%@ (%@) {%g, %g}>", v5, self, v6, v7, v8, v10, v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  item = self->_item;
  id v5 = a3;
  [v5 encodeObject:item forKey:@"it"];
  v6.receiver = self;
  v6.super_class = (Class)QLTUbiquitousFileThumbnailRequest;
  [(QLTThumbnailRequest *)&v6 encodeWithCoder:v5];
}

- (QLTUbiquitousFileThumbnailRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLTUbiquitousFileThumbnailRequest;
  id v5 = [(QLTThumbnailRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2050000000;
    objc_super v6 = (void *)getFPItemClass_softClass_0;
    uint64_t v16 = getFPItemClass_softClass_0;
    if (!getFPItemClass_softClass_0)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getFPItemClass_block_invoke_0;
      v12[3] = &unk_1E6009910;
      v12[4] = &v13;
      __getFPItemClass_block_invoke_0((uint64_t)v12);
      objc_super v6 = (void *)v14[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v13, 8);
    uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"it"];
    item = v5->_item;
    v5->_item = (FPItem *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLTUbiquitousFileThumbnailRequest;
  id v4 = [(QLTThumbnailRequest *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 12, self->_item);
  return v4;
}

- (id)computeContentType
{
  return (id)[(FPItem *)self->_item typeIdentifier];
}

- (BOOL)shouldProvideFoldedGenericIcon
{
  return [(FPItem *)self->_item isDownloaded];
}

- (FPItem)item
{
  return (FPItem *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
}

@end