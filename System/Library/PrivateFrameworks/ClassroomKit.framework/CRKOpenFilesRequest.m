@interface CRKOpenFilesRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)autoAccept;
- (CRKOpenFilesRequest)initWithCoder:(id)a3;
- (NSData)previewImageData;
- (NSSet)fileItems;
- (NSString)senderName;
- (NSString)sourceBundleIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAccept:(BOOL)a3;
- (void)setFileItems:(id)a3;
- (void)setPreviewImageData:(id)a3;
- (void)setSenderName:(id)a3;
- (void)setSourceBundleIdentifier:(id)a3;
@end

@implementation CRKOpenFilesRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKOpenFilesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRKOpenFilesRequest;
  v5 = [(CATTaskRequest *)&v22 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"fileItems"];
    fileItems = v5->_fileItems;
    v5->_fileItems = (NSSet *)v9;

    v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"senderName"];
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v12;

    v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"previewImageData"];
    previewImageData = v5->_previewImageData;
    v5->_previewImageData = (NSData *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoAccept"];
    v5->_autoAccept = [v17 BOOLValue];

    v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"sourceBundleIdentifier"];
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CRKOpenFilesRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v10 encodeWithCoder:v4];
  v5 = [(CRKOpenFilesRequest *)self fileItems];
  [v4 encodeObject:v5 forKey:@"fileItems"];

  v6 = [(CRKOpenFilesRequest *)self senderName];
  [v4 encodeObject:v6 forKey:@"senderName"];

  uint64_t v7 = [(CRKOpenFilesRequest *)self previewImageData];
  [v4 encodeObject:v7 forKey:@"previewImageData"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKOpenFilesRequest autoAccept](self, "autoAccept"));
  [v4 encodeObject:v8 forKey:@"autoAccept"];

  uint64_t v9 = [(CRKOpenFilesRequest *)self sourceBundleIdentifier];
  [v4 encodeObject:v9 forKey:@"sourceBundleIdentifier"];
}

- (NSSet)fileItems
{
  return self->_fileItems;
}

- (void)setFileItems:(id)a3
{
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (void)setPreviewImageData:(id)a3
{
}

- (BOOL)autoAccept
{
  return self->_autoAccept;
}

- (void)setAutoAccept:(BOOL)a3
{
  self->_autoAccept = a3;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_senderName, 0);

  objc_storeStrong((id *)&self->_fileItems, 0);
}

@end