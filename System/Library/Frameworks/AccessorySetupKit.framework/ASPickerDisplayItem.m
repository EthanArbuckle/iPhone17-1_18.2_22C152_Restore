@interface ASPickerDisplayItem
+ (BOOL)supportsSecureCoding;
- (ASDiscoveryDescriptor)descriptor;
- (ASPickerDisplayItem)initWithCoder:(id)a3;
- (ASPickerDisplayItem)initWithName:(id)a3 productImage:(id)a4 descriptor:(id)a5;
- (ASPickerDisplayItem)initWithXPCObject:(id)a3 error:(id *)a4;
- (BOOL)allowsRename;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (UIImage)productImage;
- (UTType)accessoryType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)resizedImage;
- (unint64_t)renameOptions;
- (unint64_t)setupOptions;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAllowsRename:(BOOL)a3;
- (void)setDescriptor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRenameOptions:(unint64_t)a3;
- (void)setSetupOptions:(unint64_t)a3;
@end

@implementation ASPickerDisplayItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPickerDisplayItem)initWithName:(id)a3 productImage:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ASPickerDisplayItem;
  v12 = [(ASPickerDisplayItem *)&v18 init];
  if (v12)
  {
    v13 = [MEMORY[0x263F08C38] UUID];
    uint64_t v14 = [v13 UUIDString];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v12->_productImage, a4);
    objc_storeStrong((id *)&v12->_descriptor, a5);
    v16 = v12;
  }

  return v12;
}

- (ASPickerDisplayItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASPickerDisplayItem *)self init];
  v6 = v5;
  if (v5)
  {
    if (v5->_allowsRename) {
      v5->_setupOptions |= 1uLL;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = [MEMORY[0x263F827E8] imageWithData:0];
    if (v9)
    {
      objc_storeStrong((id *)&v6->_productImage, v9);
      id v10 = v8;
      objc_opt_class();
      NSDecodeObjectIfPresent();

      id v11 = v10;
      if ([v11 containsValueForKey:@"rOp"]) {
        v6->_renameOptions = [v11 decodeIntegerForKey:@"rOp"];
      }

      id v12 = v11;
      if ([v12 containsValueForKey:@"pDop"]) {
        v6->_setupOptions = [v12 decodeIntegerForKey:@"pDop"];
      }

      v13 = v6;
    }
    else
    {
      uint64_t v23 = objc_opt_class();
      v30 = ASErrorF(1, (uint64_t)"%@ bad image data init failed", v24, v25, v26, v27, v28, v29, v23);
      [v8 failWithError:v30];

      v13 = 0;
    }
  }
  else
  {
    uint64_t v15 = objc_opt_class();
    v22 = ASErrorF(1, (uint64_t)"%@ init failed", v16, v17, v18, v19, v20, v21, v15);
    [v4 failWithError:v22];

    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  accessoryType = self->_accessoryType;
  if (accessoryType) {
    [v13 encodeObject:accessoryType forKey:@"aTe"];
  }
  if (self->_allowsRename) {
    [v13 encodeBool:1 forKey:@"aRm"];
  }
  descriptor = self->_descriptor;
  if (descriptor) {
    [v13 encodeObject:descriptor forKey:@"aDr"];
  }
  name = self->_name;
  if (name) {
    [v13 encodeObject:name forKey:@"dNm"];
  }
  id v7 = [(ASPickerDisplayItem *)self resizedImage];
  id v8 = UIImagePNGRepresentation(v7);
  if (v8) {
    [v13 encodeObject:v8 forKey:@"pImg"];
  }

  identifier = self->_identifier;
  if (identifier) {
    [v13 encodeObject:identifier forKey:@"pDid"];
  }
  unint64_t renameOptions = self->_renameOptions;
  id v11 = v13;
  if (renameOptions)
  {
    [v13 encodeInteger:renameOptions forKey:@"rOp"];
    id v11 = v13;
  }
  unint64_t setupOptions = self->_setupOptions;
  if (setupOptions)
  {
    [v13 encodeInteger:setupOptions forKey:@"pDop"];
    id v11 = v13;
  }
}

- (ASPickerDisplayItem)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ASPickerDisplayItem *)self init];
  if (!v7)
  {
    if (a4)
    {
      uint64_t v19 = [(id)objc_opt_class() description];
      ASErrorF(-6756, (uint64_t)"%@ init failed", v20, v21, v22, v23, v24, v25, (uint64_t)v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_25;
  }
  if (MEMORY[0x245670630](v6) != MEMORY[0x263EF8708])
  {
    if (a4)
    {
      ASErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v33);
      uint64_t v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_25:
    uint64_t v17 = 0;
    goto LABEL_19;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_20;
  }
  if (v7->_allowsRename) {
    v7->_setupOptions |= 1uLL;
  }
  objc_opt_class();
  if (!CUXPCDecodeObject() || !CUXPCDecodeNSString())
  {
LABEL_20:
    uint64_t v17 = 0;
    goto LABEL_18;
  }
  CUXPCDecodeNSData();
  uint64_t v14 = [MEMORY[0x263F827E8] imageWithData:0];
  if (!v14)
  {
    if (a4)
    {
      uint64_t v26 = [(id)objc_opt_class() description];
      ASErrorF(-6756, (uint64_t)"%@ bad image data init failed", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_28;
  }
  objc_storeStrong((id *)&v7->_productImage, v14);
  if (!CUXPCDecodeNSString())
  {
LABEL_28:
    uint64_t v17 = 0;
    goto LABEL_17;
  }
  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_unint64_t renameOptions = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_28;
  }
  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 != 6)
  {
    if (v16 != 5) {
      goto LABEL_16;
    }
    goto LABEL_28;
  }
  v7->_unint64_t setupOptions = 0;
LABEL_16:
  uint64_t v17 = v7;
LABEL_17:

LABEL_18:
LABEL_19:

  return v17;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  CUXPCEncodeObject();
  name = self->_name;
  id v6 = v4;
  id v7 = [(NSString *)name UTF8String];
  if (v7) {
    xpc_dictionary_set_string(v6, "dNm", v7);
  }

  uint64_t v8 = [(UTType *)self->_accessoryType identifier];
  id v9 = v6;
  id v10 = v8;
  uint64_t v11 = (const char *)[v10 UTF8String];
  if (v11) {
    xpc_dictionary_set_string(v9, "aTe", v11);
  }

  uint64_t v12 = [(ASPickerDisplayItem *)self resizedImage];
  uint64_t v13 = UIImagePNGRepresentation(v12);
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
    id v16 = v9;
    uint64_t v17 = [v15 bytes];
    if (v17) {
      uint64_t v18 = (const char *)v17;
    }
    else {
      uint64_t v18 = "";
    }
    xpc_dictionary_set_data(v16, "pImg", v18, [v15 length]);
  }
  identifier = self->_identifier;
  xpc_object_t xdict = v9;
  uint64_t v20 = [(NSString *)identifier UTF8String];
  if (v20) {
    xpc_dictionary_set_string(xdict, "pDid", v20);
  }

  uint64_t renameOptions = self->_renameOptions;
  if (renameOptions) {
    xpc_dictionary_set_uint64(xdict, "rOp", renameOptions);
  }
  uint64_t setupOptions = self->_setupOptions;
  if (setupOptions) {
    xpc_dictionary_set_uint64(xdict, "pDop", setupOptions);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(UTType *)self->_accessoryType copy];
  id v6 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v5;

  *(unsigned char *)(v4 + 8) = self->_allowsRename;
  uint64_t v7 = [(UIImage *)self->_productImage copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(ASDiscoveryDescriptor *)self->_descriptor copy];
  id v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_name copy];
  uint64_t v12 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v11;

  uint64_t v13 = [(NSString *)self->_identifier copy];
  uint64_t v14 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v13;

  *(void *)(v4 + 40) = self->_renameOptions;
  *(void *)(v4 + 48) = self->_setupOptions;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ASPickerDisplayItem *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (![(ASPickerDisplayItem *)v6 isMemberOfClass:objc_opt_class()])
    {
      BOOL v13 = 0;
LABEL_29:

      goto LABEL_30;
    }
    name = self->_name;
    uint64_t v8 = [(ASPickerDisplayItem *)v6 name];
    p_isa = name;
    id v10 = v8;
    uint64_t v11 = v10;
    if (p_isa == (NSString *)v10)
    {
    }
    else
    {
      if ((p_isa == 0) == (v10 != 0))
      {
        BOOL v13 = 0;
        id v16 = v10;
LABEL_26:

        goto LABEL_27;
      }
      int v12 = [(NSString *)p_isa isEqual:v10];

      if (!v12)
      {
        BOOL v13 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    descriptor = self->_descriptor;
    id v15 = [(ASPickerDisplayItem *)v6 descriptor];
    id v16 = descriptor;
    uint64_t v17 = v15;
    p_isa = (NSString *)&v17->super.isa;
    if (v16 == v17)
    {
    }
    else
    {
      if ((v16 == 0) == (v17 != 0))
      {

        goto LABEL_25;
      }
      BOOL v18 = [(ASDiscoveryDescriptor *)v16 isEqual:v17];

      if (!v18)
      {
        BOOL v13 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    identifier = self->_identifier;
    uint64_t v20 = [(ASPickerDisplayItem *)v6 identifier];
    uint64_t v21 = identifier;
    uint64_t v22 = v20;
    id v16 = v22;
    if (v21 == (NSString *)v22)
    {
    }
    else
    {
      if ((v21 == 0) == (v22 != 0))
      {

        goto LABEL_25;
      }
      int v23 = [(NSString *)v21 isEqual:v22];

      if (!v23) {
        goto LABEL_25;
      }
    }
    unint64_t renameOptions = self->_renameOptions;
    if (renameOptions == [(ASPickerDisplayItem *)v6 renameOptions])
    {
      unint64_t setupOptions = self->_setupOptions;
      BOOL v13 = setupOptions == [(ASPickerDisplayItem *)v6 setupOptions];
      goto LABEL_26;
    }
LABEL_25:
    BOOL v13 = 0;
    goto LABEL_26;
  }
  BOOL v13 = 1;
LABEL_30:

  return v13;
}

- (id)resizedImage
{
  v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 scale];
  double v5 = v4;

  double v6 = (double)CGImageGetWidth([(UIImage *)self->_productImage CGImage]) / v5;
  double v7 = (double)CGImageGetHeight([(UIImage *)self->_productImage CGImage]) / v5;
  double v8 = 180.0;
  if (v6 <= 180.0 && v7 <= 120.0)
  {
    int v12 = self->_productImage;
  }
  else
  {
    double v10 = v6 / v7;
    if (v10 <= 1.5)
    {
      double v11 = 120.0;
      double v8 = v10 * 120.0;
    }
    else
    {
      double v11 = 180.0 / v10;
    }
    BOOL v13 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v8, v11);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __35__ASPickerDisplayItem_resizedImage__block_invoke;
    v16[3] = &unk_265175538;
    v16[4] = self;
    *(double *)&v16[5] = v8;
    *(double *)&v16[6] = v11;
    uint64_t v14 = [v13 imageWithActions:v16];
    objc_msgSend(v14, "imageWithRenderingMode:", -[UIImage renderingMode](self->_productImage, "renderingMode"));
    int v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

uint64_t __35__ASPickerDisplayItem_resizedImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "drawInRect:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)description
{
  return [(ASPickerDisplayItem *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    double v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    double v4 = (__CFString *)0;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    uint64_t v19 = identifier;
    CUAppendF();
    double v6 = v4;

    double v4 = v6;
  }
  accessoryType = self->_accessoryType;
  if (accessoryType)
  {
    double v8 = accessoryType;
    uint64_t v20 = [(UTType *)v8 identifier];
    CUAppendF();
    uint64_t v9 = v4;

    double v4 = v9;
  }
  name = self->_name;
  if (name)
  {
    uint64_t v21 = name;
    CUAppendF();
    double v11 = v4;

    double v4 = v11;
  }
  descriptor = self->_descriptor;
  if (descriptor)
  {
    uint64_t v22 = descriptor;
    CUAppendF();
    BOOL v13 = v4;

    double v4 = v13;
  }
  if (self->_setupOptions)
  {
    int v23 = CUPrintFlags64();
    CUAppendF();
    uint64_t v14 = v4;

    double v4 = v14;
  }
  if (self->_renameOptions)
  {
    uint64_t v24 = CUPrintFlags64();
    CUAppendF();
    id v15 = v4;

    double v4 = v15;
  }
  id v16 = &stru_26F86DD88;
  if (v4) {
    id v16 = v4;
  }
  uint64_t v17 = v16;

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (UIImage)productImage
{
  return self->_productImage;
}

- (ASDiscoveryDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (unint64_t)renameOptions
{
  return self->_renameOptions;
}

- (void)setRenameOptions:(unint64_t)a3
{
  self->_unint64_t renameOptions = a3;
}

- (unint64_t)setupOptions
{
  return self->_setupOptions;
}

- (void)setSetupOptions:(unint64_t)a3
{
  self->_unint64_t setupOptions = a3;
}

- (UTType)accessoryType
{
  return self->_accessoryType;
}

- (BOOL)allowsRename
{
  return self->_allowsRename;
}

- (void)setAllowsRename:(BOOL)a3
{
  self->_allowsRename = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_productImage, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end