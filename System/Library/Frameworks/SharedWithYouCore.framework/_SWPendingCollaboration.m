@interface _SWPendingCollaboration
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCollaborationContent:(id)a3;
- (NSArray)writableTypeIdentifiersForItemProvider;
- (NSString)description;
- (NSURL)fileURL;
- (_SWCollaborationMetadata)collaborationMetadata;
- (_SWPendingCollaboration)initWithCoder:(id)a3;
- (_SWPendingCollaboration)initWithFileAtURL:(id)a3;
- (_SWPendingCollaboration)initWithMetadata:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)processSigningQueue;
- (id)softSigningController;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCollaborationMetadata:(id)a3;
- (void)setFileURL:(id)a3;
@end

@implementation _SWPendingCollaboration

- (id)processSigningQueue
{
  if (processSigningQueue_onceToken != -1) {
    dispatch_once(&processSigningQueue_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)processSigningQueue_internalQueue;

  return v2;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.SharedWithYou.SWPendingCollaboration";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  if (![a4 isEqualToString:@"com.apple.SharedWithYou.SWPendingCollaboration"])
  {
    v8 = 0;
    id v9 = 0;
    if (!a5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v11 = 0;
  v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v11];
  id v9 = v11;
  if (a5) {
LABEL_5:
  }
    *a5 = v9;
LABEL_6:

  return v8;
}

- (id)softSigningController
{
  if (getSLCollaborationSigningControllerClass()
    && [getSLCollaborationSigningControllerClass() instancesRespondToSelector:sel_initWithTargetSerialQueue_synchronous_])
  {
    id v3 = objc_alloc((Class)getSLCollaborationSigningControllerClass());
    v4 = [(_SWPendingCollaboration *)self processSigningQueue];
    v5 = (void *)[v3 initWithTargetSerialQueue:v4 synchronous:1];

    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.SharedWithYou.SWPendingCollaboration";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.SharedWithYou.SWPendingCollaboration";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __103___SWPendingCollaboration_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v17[3] = &unk_1E54D8520;
  v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = (void (**)(void, void, void))MEMORY[0x18C13CAC0](v17);
  id v11 = [(_SWPendingCollaboration *)self collaborationMetadata];
  v12 = [v11 sourceProcessData];

  if (v12
    || ([(_SWPendingCollaboration *)self softSigningController],
        (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13 = [(_SWPendingCollaboration *)self collaborationMetadata];
    v14 = [v13 sourceProcessData];
    ((void (**)(void, void *, void))v10)[2](v10, v14, 0);
  }
  else
  {
    v13 = (void *)v15;
    v14 = [(_SWPendingCollaboration *)self collaborationMetadata];
    [v13 signSourceProcessWithMetadata:v14 timeout:v10 completion:5.0];
  }

  return 0;
}

- (_SWPendingCollaboration)initWithFileAtURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SWPendingCollaboration;
  id v6 = [(_SWPendingCollaboration *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fileURL, a3);
  }

  return v7;
}

- (_SWPendingCollaboration)initWithMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SWPendingCollaboration;
  id v6 = [(_SWPendingCollaboration *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collaborationMetadata, a3);
  }

  return v7;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(_SWPendingCollaboration *)self fileURL];
  [v3 appendFormat:@" fileURL=%@", v4];

  id v5 = [(_SWPendingCollaboration *)self collaborationMetadata];
  [v3 appendFormat:@" collaborationMetadata=%@", v5];

  [v3 appendString:@">"];
  id v6 = (void *)[v3 copy];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(_SWPendingCollaboration *)self isEqualToCollaborationContent:v4];

  return v5;
}

- (BOOL)isEqualToCollaborationContent:(id)a3
{
  id v7 = a3;
  id v8 = [(_SWPendingCollaboration *)self fileURL];
  if (!v8)
  {
    uint64_t v15 = [v7 fileURL];
    if (!v15)
    {
      uint64_t v15 = 0;
      int v9 = 0;
      goto LABEL_7;
    }
  }
  id v3 = [(_SWPendingCollaboration *)self fileURL];
  id v4 = [v7 fileURL];
  if ([v3 isEqual:v4])
  {
    int v9 = 1;
LABEL_7:
    id v11 = [(_SWPendingCollaboration *)self collaborationMetadata];
    if (v11 || ([v7 collaborationMetadata], (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = [(_SWPendingCollaboration *)self collaborationMetadata];
      v13 = [v7 collaborationMetadata];
      char v10 = [v12 isEqual:v13];

      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
      char v10 = 1;
    }

LABEL_13:
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v10 = 0;
LABEL_14:

LABEL_15:
  if (!v8) {

  }
  return v10;
}

- (unint64_t)hash
{
  id v3 = [(_SWPendingCollaboration *)self fileURL];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(_SWPendingCollaboration *)self collaborationMetadata];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(_SWPendingCollaboration *)self fileURL];

  id v5 = objc_alloc((Class)objc_opt_class());
  if (v4)
  {
    unint64_t v6 = [(_SWPendingCollaboration *)self fileURL];
    uint64_t v7 = [v5 initWithFileAtURL:v6];
  }
  else
  {
    unint64_t v6 = [(_SWPendingCollaboration *)self collaborationMetadata];
    uint64_t v7 = [v5 initWithMetadata:v6];
  }
  id v8 = (void *)v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SWPendingCollaboration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = NSStringFromSelector(sel_fileURL);
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  int v9 = NSStringFromSelector(sel_collaborationMetadata);
  char v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  if (v7) {
    id v11 = [(_SWPendingCollaboration *)self initWithFileAtURL:v7];
  }
  else {
    id v11 = [(_SWPendingCollaboration *)self initWithMetadata:v10];
  }
  v12 = v11;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_SWPendingCollaboration *)self fileURL];
  unint64_t v6 = NSStringFromSelector(sel_fileURL);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(_SWPendingCollaboration *)self collaborationMetadata];
  uint64_t v7 = NSStringFromSelector(sel_collaborationMetadata);
  [v4 encodeObject:v8 forKey:v7];
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end