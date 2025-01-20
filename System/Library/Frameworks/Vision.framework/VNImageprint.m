@interface VNImageprint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Class)requestClassAndReturnError:(id *)a3;
- (NSString)requestClassName;
- (VNImageprint)initWithCoder:(id)a3;
- (VNImageprint)initWithImageDescriptor:(id)a3 type:(unint64_t)a4 originatingRequestSpecifier:(id)a5;
- (VNImageprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5;
- (VNImageprint)initWithState:(id)a3 error:(id *)a4;
- (VNMPImageDescriptor)descriptor;
- (VNRequestSpecifier)originatingRequestSpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)distanceToImageprint:(id)a3 error:(id *)a4;
- (id)serializeStateAndReturnError:(id *)a3;
- (unint64_t)hash;
- (unint64_t)requestRevision;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation VNImageprint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setDescriptor:(id)a3
{
}

- (VNMPImageDescriptor)descriptor
{
  return self->_descriptor;
}

- (unint64_t)requestRevision
{
  v2 = [(VNImageprint *)self originatingRequestSpecifier];
  unint64_t v3 = [v2 requestRevision];

  return v3;
}

- (Class)requestClassAndReturnError:(id *)a3
{
  v4 = [(VNImageprint *)self originatingRequestSpecifier];
  v5 = [v4 requestClassAndReturnError:a3];

  return (Class)v5;
}

- (NSString)requestClassName
{
  v2 = [(VNImageprint *)self originatingRequestSpecifier];
  unint64_t v3 = [v2 requestClassName];

  return (NSString *)v3;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNImageprint *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(VNImageprint *)self type];
      if (v6 == [(VNImageprint *)v5 type]
        && ([(VNImageprint *)self originatingRequestSpecifier],
            v7 = objc_claimAutoreleasedReturnValue(),
            [(VNImageprint *)v5 originatingRequestSpecifier],
            v8 = objc_claimAutoreleasedReturnValue(),
            char v9 = [v7 isEqual:v8],
            v8,
            v7,
            (v9 & 1) != 0))
      {
        v10 = [(VNImageprint *)self descriptor];
        v11 = [(VNImageprint *)v5 descriptor];
        char v12 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNImageprint;
  id v3 = [(VNImageprint *)&v7 hash];
  v4 = [(VNImageprint *)self descriptor];
  uint64_t v5 = [v4 hash] ^ __ROR8__(v3, 51);

  return [(VNRequestSpecifier *)self->_originatingRequestSpecifier hash] ^ __ROR8__([(VNImageprint *)self type] ^ __ROR8__(v5, 51), 51);
}

- (id)serializeStateAndReturnError:(id *)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", -[VNImageprint serializedLength](self, "serializedLength"));
  if ([(VNImageprint *)self serializeStateIntoData:v5 startingAtByteOffset:0 error:a3])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[VNError errorWithCode:14 message:@"state cannot be nil"];
      unint64_t v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v19 = 0;
    goto LABEL_11;
  }
  id v10 = v8;
  uint64_t v11 = [v10 mutableBytes];
  *(void *)&v25[12] = 0;
  *(void *)&v25[20] = 0;
  *(void *)v25 = 0x3CBA7097ELL;
  int v12 = [(VNImageprint *)self serializedLength];
  unint64_t v13 = a4 + 28;
  *(_DWORD *)&v25[8] = v12;
  unint64_t v14 = [(VNMPImageDescriptor *)self->_descriptor serializeStateIntoData:v10 startingAtByteOffset:a4 + 28 error:a5];
  unint64_t v15 = v14;
  if (!v14) {
    goto LABEL_10;
  }
  unint64_t v16 = v14 + v13;
  *(_DWORD *)(v11 + v14 + v13) = self->_type;
  *(_DWORD *)(v14 + v13 + v11 + 4) = [(VNRequestSpecifier *)self->_originatingRequestSpecifier requestRevision];
  int v24 = 0;
  v17 = [(VNRequestSpecifier *)self->_originatingRequestSpecifier requestClassName];
  BOOL v18 = apple::vision::VNGetSerializingClassCodeForClassName((uint64_t)v17, (uint64_t)&v24, (uint64_t)a5);

  if (!v18) {
    goto LABEL_10;
  }
  *(_DWORD *)(v11 + v16 + 8) = v24;
  unint64_t v19 = v15 + 40;
  if (v15 + 40 != v12)
  {
    if (a5)
    {
      v22 = [NSString stringWithFormat:@"Unexpected size of serialized state of the object of type %@", objc_opt_class()];
      *a5 = +[VNError errorWithCode:9 message:v22];
    }
    goto LABEL_10;
  }
  v20 = (_OWORD *)(v11 + a4);
  calculateChecksumMD5((char *)(v11 + a4 + 28), v15 + 12, &v25[12]);
  long long v21 = *(_OWORD *)v25;
  *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)&v25[12];
  _OWORD *v20 = v21;
LABEL_11:

  return v19;
}

- (unint64_t)serializedLength
{
  return [(VNMPImageDescriptor *)self->_descriptor serializedLength] + 40;
}

- (VNImageprint)initWithState:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0;
  return [(VNImageprint *)self initWithState:a3 byteOffset:&v5 error:a4];
}

- (VNImageprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      id v15 = +[VNError errorWithCode:14 message:@"state cannot be nil"];
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v16 = 0;
    goto LABEL_57;
  }
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  unint64_t v12 = *a4;
  unint64_t v13 = (_OWORD *)(v11 + *a4);
  *(_OWORD *)v37 = *v13;
  *(_OWORD *)&v37[12] = *(_OWORD *)((char *)v13 + 12);
  *a4 = v12 + 28;
  if (*(_DWORD *)v37 != -878245506)
  {
    if ([v10 length] == 136)
    {
      v17 = [[VNMPImageDescriptor alloc] initWithRawColorGaborDescriptor:v10];
      if (v17)
      {
        BOOL v18 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:a5];
        if (v18)
        {
          self = [(VNImageprint *)self initWithImageDescriptor:v17 type:0 originatingRequestSpecifier:v18];
          unint64_t v16 = self;
        }
        else
        {
          unint64_t v16 = 0;
        }

        goto LABEL_31;
      }
      if (a5) {
        goto LABEL_27;
      }
    }
    else
    {
      unint64_t v19 = [[VNCVMLImageprintObservation_LegacySupportDoNotChange alloc] initWithData:v10];
      v17 = (VNMPImageDescriptor *)v19;
      if (v19)
      {
        v20 = [(VNCVMLImageprintObservation_LegacySupportDoNotChange *)v19 serializeAsVNImageprintStateAndReturnError:a5];
        *a4 = 0;
        self = [(VNImageprint *)self initWithState:v20 byteOffset:a4 error:a5];

        unint64_t v16 = self;
LABEL_31:

        goto LABEL_57;
      }
      if (a5)
      {
LABEL_27:
        +[VNError errorWithCode:2 message:@"Invalid format of VNImageprint serialized state"];
        unint64_t v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
    }
    unint64_t v16 = 0;
    goto LABEL_31;
  }
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  calculateChecksumMD5((char *)(v11 + 28), [v10 length] - 28, (unsigned __int8 *)&v35);
  if (*(void *)&v37[12] == v35 && *(void *)&v37[20] == v36)
  {
    long long v21 = [[VNMPImageDescriptor alloc] initWithState:v10 byteOffset:a4 error:a5];
    if (!v21) {
      goto LABEL_45;
    }
    unint64_t v22 = *a4;
    int v23 = *(_DWORD *)(v11 + *a4);
    unint64_t v24 = *a4 + 4;
    *a4 = v24;
    if (v23)
    {
      if (a5)
      {
        id v25 = +[VNError errorWithCode:9 message:@"Failed to deserialize requestRevision"];
LABEL_23:
        unint64_t v16 = 0;
        *a5 = v25;
LABEL_56:

        goto LABEL_57;
      }
      goto LABEL_45;
    }
    int v26 = *(_DWORD *)&v37[4];
    if ((*(_DWORD *)&v37[4] - 2) >= 2)
    {
      if (*(_DWORD *)&v37[4] != 1)
      {
        if (a5)
        {
          +[VNError errorForUnsupportedSerializingHeaderVersion:](VNError, "errorForUnsupportedSerializingHeaderVersion:");
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
LABEL_45:
        unint64_t v16 = 0;
        goto LABEL_56;
      }
      LODWORD(v27) = 1;
    }
    else
    {
      uint64_t v27 = *(unsigned int *)(v11 + v24);
      *a4 = v22 + 8;
      if (v26 == 3)
      {
        uint64_t v31 = *(unsigned int *)(v11 + v22 + 8);
        *a4 = v22 + 12;
        v32 = +[VNClassRegistrar classNameForClassCode:v31 error:a5];
        if (!v32
          || (+[VNRequestSpecifier specifierForRequestClassName:v32 revision:v27 error:a5], v29 = objc_claimAutoreleasedReturnValue(), v32, !v29))
        {
LABEL_48:
          v29 = 0;
          goto LABEL_51;
        }
LABEL_40:
        if (*a4 - v12 == *(unsigned int *)&v37[8])
        {
          v30 = [(VNImageprint *)self initWithImageDescriptor:v21 type:0 originatingRequestSpecifier:v29];
          if (v30)
          {
            self = v30;
            unint64_t v16 = self;
LABEL_55:

            goto LABEL_56;
          }
          if (a5)
          {
            id v28 = +[VNError errorWithCode:9 message:@"Failed to initialize VNImageprint object"];
            self = 0;
            goto LABEL_54;
          }
          self = 0;
        }
        else if (a5)
        {
          v33 = [NSString stringWithFormat:@"Unexpected size of deserialized state of the object of type %@", objc_opt_class()];
          *a5 = +[VNError errorWithCode:9 message:v33];
        }
LABEL_51:
        unint64_t v16 = 0;
        goto LABEL_55;
      }
      if (v26 != 2)
      {
        if (a5)
        {
          +[VNError errorForUnsupportedSerializingHeaderVersion:](VNError, "errorForUnsupportedSerializingHeaderVersion:");
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          v29 = 0;
LABEL_54:
          unint64_t v16 = 0;
          *a5 = v28;
          goto LABEL_55;
        }
        goto LABEL_48;
      }
    }
    v29 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:v27 error:a5];
    if (!v29) {
      goto LABEL_51;
    }
    goto LABEL_40;
  }
  if (!a5) {
    goto LABEL_16;
  }
  id v15 = +[VNError errorWithCode:9 message:@"Serialized and calculated MD5s don't match"];
LABEL_11:
  unint64_t v16 = 0;
  *a5 = v15;
LABEL_57:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithImageDescriptor:type:originatingRequestSpecifier:", self->_descriptor, self->_type, self->_originatingRequestSpecifier);
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "vn_encodeCodingVersion:forKey:", 0, @"VNIp");
  [v5 encodeObject:self->_descriptor forKey:@"MPImDesc"];
  v4 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v5 encodeObject:v4 forKey:@"ipType"];

  [v5 encodeObject:self->_originatingRequestSpecifier forKey:@"ipOrgReq"];
}

- (VNImageprint)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNIp"))
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPImDesc"];
    if (!v5) {
      goto LABEL_3;
    }
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    char v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"ipType"];
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 unsignedIntegerValue];
      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ipOrgReq"];
      if (v13) {
        goto LABEL_7;
      }
      if (([v4 containsValueForKey:@"ipOrgReq"] & 1) == 0)
      {
        v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ipReqRev"];
        unint64_t v16 = v17;
        if (v17) {
          uint64_t v18 = [v17 unsignedIntegerValue];
        }
        else {
          uint64_t v18 = 1;
        }
        id v21 = 0;
        uint64_t v13 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:v18 error:&v21];
        id v19 = v21;
        v20 = v19;
        if (!v13)
        {
          [v4 failWithError:v19];

          BOOL v15 = 1;
          goto LABEL_8;
        }

LABEL_7:
        unint64_t v14 = [(VNImageprint *)self initWithImageDescriptor:v5 type:v12 originatingRequestSpecifier:v13];
        BOOL v15 = v14 == 0;
        unint64_t v16 = (void *)v13;
        self = v14;
LABEL_8:

        goto LABEL_11;
      }
    }
    BOOL v15 = 1;
LABEL_11:

    if (!v15)
    {
      self = self;
      id v5 = self;
      goto LABEL_3;
    }
  }
  id v5 = 0;
LABEL_3:

  return v5;
}

- (VNImageprint)initWithImageDescriptor:(id)a3 type:(unint64_t)a4 originatingRequestSpecifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VNImageprint;
  uint64_t v11 = [(VNImageprint *)&v15 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_descriptor, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_originatingRequestSpecifier, a5);
    uint64_t v13 = v12;
  }

  return v12;
}

- (id)distanceToImageprint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v13 = 0;
    unint64_t v14 = (float *)&v13;
    uint64_t v15 = 0x2020000000;
    int v16 = 2139095040;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__VNImageprint_distanceToImageprint_error___block_invoke;
    v10[3] = &unk_1E5B1ECB8;
    uint64_t v12 = &v13;
    v10[4] = self;
    id v11 = v6;
    if ((VNExecuteBlock(v10, (uint64_t)a4) & 1) == 0) {
      goto LABEL_6;
    }
    if (v14[6] != INFINITY)
    {
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithFloat:");
      goto LABEL_11;
    }
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"could not compute faceprint distance"];
      uint64_t v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_6:
      uint64_t v8 = 0;
    }
LABEL_11:

    _Block_object_dispose(&v13, 8);
    goto LABEL_12;
  }
  if (a4)
  {
    +[VNError errorWithCode:14 message:@"otherImageprint cannot be nil"];
    uint64_t v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_12:

  return v8;
}

uint64_t __43__VNImageprint_distanceToImageprint_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = [*(id *)(a1 + 40) descriptor];
  [v2 distanceFromDescriptor:v3];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;

  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end