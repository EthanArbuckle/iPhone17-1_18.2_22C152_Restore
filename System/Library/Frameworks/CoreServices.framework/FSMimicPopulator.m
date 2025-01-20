@interface FSMimicPopulator
- (BOOL)populateHFSTypeAndCreatorWithError:(id *)a3;
- (BOOL)populateSimpleSelector:(SEL)a3 error:(id *)a4;
- (BOOL)populateValueForKey:(id)a3 error:(id *)a4;
- (FSMimic)mimic;
- (FSMimicPopulator)initWithNode:(id)a3;
- (void)populateHasChildNodeWithRelativePath:(id)a3;
@end

@implementation FSMimicPopulator

- (BOOL)populateSimpleSelector:(SEL)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (-[FSMimic hasObjectValueForSelector:](self->_mimic, "hasObjectValueForSelector:"))
  {
LABEL_2:
    LOBYTE(a4) = 1;
  }
  else
  {
    switch(categorizeSelector((objc_selector *)a3))
    {
      case 0:
        node = self->_node;
        mimic = self->_mimic;
        v20 = node;
        v21 = mimic;
        id v22 = [v20 a3];
        v23 = [NSNumber numberWithBool:v22];
        [(FSMimic *)v21 setObjectValue:v23 forSelector:a3];

        goto LABEL_2;
      case 1:
        v24 = self->_node;
        v25 = self->_mimic;
        v26 = objc_msgSend(v24, a3, a4);
        LOBYTE(a4) = v26 != 0;
        if (v26) {
          [(FSMimic *)v25 setObjectValue:v26 forSelector:a3];
        }

        return (char)a4;
      case 2:
        v10 = self->_mimic;
        v11 = self->_node;
        v12 = v10;
        LODWORD(v27) = 0;
        LODWORD(a4) = objc_msgSend(v11, a3, &v27, a4);
        if (a4)
        {
          v13 = [NSNumber numberWithUnsignedInt:LODWORD(v27)];
          [(FSMimic *)v12 setObjectValue:v13 forSelector:a3];
        }
        goto LABEL_16;
      case 3:
        v14 = self->_mimic;
        v11 = self->_node;
        v12 = v14;
        double v27 = 0.0;
        LODWORD(a4) = objc_msgSend(v11, a3, &v27, a4);
        if (a4)
        {
          v15 = [NSNumber numberWithUnsignedLongLong:*(void *)&v27];
          [(FSMimic *)v12 setObjectValue:v15 forSelector:a3];
        }
        goto LABEL_16;
      case 4:
        v16 = self->_mimic;
        v11 = self->_node;
        v12 = v16;
        double v27 = 0.0;
        LODWORD(a4) = objc_msgSend(v11, a3, &v27, a4);
        if (a4)
        {
          v17 = [NSNumber numberWithDouble:v27];
          [(FSMimic *)v12 setObjectValue:v17 forSelector:a3];
        }
LABEL_16:

        return (char)a4;
      case 5:
      case 6:
        if (!a4) {
          return (char)a4;
        }
        uint64_t v28 = *MEMORY[0x1E4F28228];
        v8 = NSStringFromSelector(a3);
        v29[0] = v8;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSMimicPopulator populateSimpleSelector:error:]", 487, v9);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
        LOBYTE(a4) = 0;
        break;
      default:
        goto LABEL_7;
    }
  }
  return (char)a4;
}

- (FSMimic)mimic
{
  return self->_mimic;
}

- (FSMimicPopulator)initWithNode:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FSMimicPopulator;
  v6 = [(FSMimicPopulator *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_node, a3);
    v8 = [FSMimic alloc];
    v9 = [v5 URL];
    uint64_t v10 = [(FSMimic *)v8 initWithURL:v9];
    mimic = v7->_mimic;
    v7->_mimic = (FSMimic *)v10;
  }
  return v7;
}

- (BOOL)populateValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v13 = 0;
  if ([(FSMimic *)self->_mimic hasResourceValueForKey:v6])
  {
    v7 = 0;
    BOOL v8 = 1;
  }
  else
  {
    BOOL v9 = [(FSNode *)self->_node getResourceValue:&v13 forKey:v6 options:3 error:a4];
    v7 = v13;
    if (v9)
    {
      if (!v13)
      {
        uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
        v11 = v13;
        objc_super v13 = (void *)v10;

        v7 = v13;
      }
      [(FSMimic *)self->_mimic setResourceValue:v7 forKey:v6];
      BOOL v8 = 1;
      v7 = v13;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimic, 0);

  objc_storeStrong((id *)&self->_node, 0);
}

- (BOOL)populateHFSTypeAndCreatorWithError:(id *)a3
{
  id v12 = 0;
  uint64_t v13 = 0;
  BOOL v5 = [(FSNode *)self->_node getHFSType:(char *)&v13 + 4 creator:&v13 error:&v12];
  id v6 = v12;
  v7 = v6;
  if (v5)
  {
    [(FSMimic *)self->_mimic setHFSType:HIDWORD(v13) creator:v13];
LABEL_3:
    BOOL v8 = 1;
    goto LABEL_10;
  }
  BOOL v9 = [v6 domain];
  if ([v9 isEqual:*MEMORY[0x1E4F28760]])
  {
    uint64_t v10 = [v7 code];

    if (v10 == -10813)
    {
      [(FSMimic *)self->_mimic setHFSTypesUnavailable];
      goto LABEL_3;
    }
  }
  else
  {
  }
  BOOL v8 = 0;
  if (a3) {
    *a3 = v7;
  }
LABEL_10:

  return v8;
}

- (void)populateHasChildNodeWithRelativePath:(id)a3
{
  id v4 = a3;
  if (-[FSNode childNodeWithRelativePathExists:](self->_node, "childNodeWithRelativePathExists:")) {
    [(FSMimic *)self->_mimic noteExtantChildNodeWithRelativePath:v4];
  }
}

@end