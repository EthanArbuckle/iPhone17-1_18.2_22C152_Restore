@interface MSOpenMailComposeViewControllerContext
+ (BOOL)supportsSecureCoding;
+ (id)unarchiveFromData:(id)a3 error:(id *)a4;
- (MSOpenMailComposeViewControllerContext)initWithAutosaveIdentifier:(id)a3 compositionValues:(id)a4 attachments:(id)a5;
- (MSOpenMailComposeViewControllerContext)initWithCoder:(id)a3;
- (NSArray)attachments;
- (NSDictionary)compositionValues;
- (NSString)autosaveIdentifier;
- (NSString)hostApplicationBundleIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setCompositionValues:(id)a3;
- (void)setHostApplicationBundleIdentifier:(id)a3;
@end

@implementation MSOpenMailComposeViewControllerContext

- (MSOpenMailComposeViewControllerContext)initWithAutosaveIdentifier:(id)a3 compositionValues:(id)a4 attachments:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MSOpenMailComposeViewControllerContext;
  v12 = [(MSOpenMailComposeViewControllerContext *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_autosaveIdentifier, a3);
    uint64_t v14 = [v10 copy];
    compositionValues = v13->_compositionValues;
    v13->_compositionValues = (NSDictionary *)v14;

    uint64_t v16 = [v11 copy];
    attachments = v13->_attachments;
    v13->_attachments = (NSArray *)v16;
  }
  return v13;
}

+ (id)unarchiveFromData:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x263EFFA08]);
  v11[0] = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v8 = (void *)[v6 initWithArray:v7];

  id v9 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v8 fromData:v5 error:a4];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(MSOpenMailComposeViewControllerContext *)self autosaveIdentifier];
  [v8 encodeObject:v4 forKey:@"EFPropertyKey_autosaveIdentifier"];

  id v5 = [(MSOpenMailComposeViewControllerContext *)self compositionValues];
  [v8 encodeObject:v5 forKey:@"EFPropertyKey_compositionValues"];

  id v6 = [(MSOpenMailComposeViewControllerContext *)self attachments];
  [v8 encodeObject:v6 forKey:@"EFPropertyKey_attachments"];

  v7 = [(MSOpenMailComposeViewControllerContext *)self hostApplicationBundleIdentifier];
  [v8 encodeObject:v7 forKey:@"EFPropertyKey_hostApplicationBundleIdentifier"];
}

- (MSOpenMailComposeViewControllerContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MSOpenMailComposeViewControllerContext;
  id v5 = [(MSOpenMailComposeViewControllerContext *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_autosaveIdentifier"];
    autosaveIdentifier = v5->_autosaveIdentifier;
    v5->_autosaveIdentifier = (NSString *)v6;

    v28 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    NSClassFromString(&cfstr_Mfmailcomposec.isa);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v28, "setWithObjects:", v27, v26, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"EFPropertyKey_compositionValues"];
    compositionValues = v5->_compositionValues;
    v5->_compositionValues = (NSDictionary *)v16;

    v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    NSClassFromString(&cfstr_Mfmailcomposea.isa);
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"EFPropertyKey_attachments"];
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_hostApplicationBundleIdentifier"];
    hostApplicationBundleIdentifier = v5->_hostApplicationBundleIdentifier;
    v5->_hostApplicationBundleIdentifier = (NSString *)v23;
  }
  return v5;
}

- (NSString)autosaveIdentifier
{
  return self->_autosaveIdentifier;
}

- (NSDictionary)compositionValues
{
  return self->_compositionValues;
}

- (void)setCompositionValues:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSString)hostApplicationBundleIdentifier
{
  return self->_hostApplicationBundleIdentifier;
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_compositionValues, 0);

  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
}

@end