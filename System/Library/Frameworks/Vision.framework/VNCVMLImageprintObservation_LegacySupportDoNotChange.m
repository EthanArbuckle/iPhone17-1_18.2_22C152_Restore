@interface VNCVMLImageprintObservation_LegacySupportDoNotChange
+ (BOOL)supportsSecureCoding;
- (VNCVMLImageprintObservation_LegacySupportDoNotChange)init;
- (VNCVMLImageprintObservation_LegacySupportDoNotChange)initWithCoder:(id)a3;
- (VNCVMLImageprintObservation_LegacySupportDoNotChange)initWithData:(id)a3;
- (id)serializeAsVNImageprintStateAndReturnError:(id *)a3;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNCVMLImageprintObservation_LegacySupportDoNotChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageprintVersion, 0);
  objc_storeStrong((id *)&self->_imageprintType, 0);
  objc_storeStrong((id *)&self->_imageprintDescriptor, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)serializeAsVNImageprintStateAndReturnError:(id *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", -[VNCVMLImageprintObservation_LegacySupportDoNotChange serializedLength](self, "serializedLength"));
  unint64_t v6 = [(VNCVMLImageprintObservation_LegacySupportDoNotChange *)self serializeStateIntoData:v5 startingAtByteOffset:0 error:a3];
  if (v6 && v6 == [(VNCVMLImageprintObservation_LegacySupportDoNotChange *)self serializedLength]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"state cannot be nil"];
      unint64_t v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v14 = 0;
    goto LABEL_10;
  }
  id v10 = v8;
  uint64_t v11 = [v10 mutableBytes];
  *(void *)&v19[12] = 0;
  *(void *)&v19[20] = 0;
  *(_DWORD *)v19 = -878245506;
  int v12 = [(VNCVMLImageprintObservation_LegacySupportDoNotChange *)self serializedLength];
  *(_DWORD *)&v19[4] = 1;
  *(_DWORD *)&v19[8] = v12;
  unint64_t v13 = [(MPImageDescriptor_LegacySupportDoNotChange *)self->_imageprintDescriptor serializeStateIntoData:v10 startingAtByteOffset:a4 + 28 error:a5];
  if (!v13) {
    goto LABEL_9;
  }
  *(_DWORD *)(v11 + v13 + a4 + 28) = 0;
  unint64_t v14 = v13 + 32;
  if (v13 + 32 != v12)
  {
    if (a5)
    {
      v17 = [NSString stringWithFormat:@"Unexpected size of serialized state of the object of type %@", objc_opt_class()];
      *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v17];
    }
    goto LABEL_9;
  }
  v15 = (_OWORD *)(v11 + a4);
  calculateChecksumMD5((char *)(v11 + a4 + 28), v13 + 4, &v19[12]);
  long long v16 = *(_OWORD *)v19;
  *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)&v19[12];
  _OWORD *v15 = v16;
LABEL_10:

  return v14;
}

- (unint64_t)serializedLength
{
  return [(MPImageDescriptor_LegacySupportDoNotChange *)self->_imageprintDescriptor serializedLength]
       + 32;
}

- (VNCVMLImageprintObservation_LegacySupportDoNotChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNCVMLImageprintObservation_LegacySupportDoNotChange;
  v5 = [(VNCVMLObservation_LegacySupportDoNotChange *)&v17 initWithCoder:v4];
  if (!v5) {
    goto LABEL_5;
  }
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLImageprintObservation_VersionCodingKey"];
  if (![v6 unsignedIntegerValue])
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLImageprintObservation_ImageprintDescriptorCodingKey"];
    imageprintDescriptor = v5->_imageprintDescriptor;
    v5->_imageprintDescriptor = (MPImageDescriptor_LegacySupportDoNotChange *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLImageprintObservation_UUIDCodingKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLImageprintObservation_ImageprintTypeCodingKey"];
    imageprintType = v5->_imageprintType;
    v5->_imageprintType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLImageprintObservation_ImageprintDescriptorColorGaborVersion"];
    imageprintVersion = v5->_imageprintVersion;
    v5->_imageprintVersion = (NSString *)v14;

LABEL_5:
    id v7 = v5;
    goto LABEL_6;
  }

  id v7 = 0;
LABEL_6:

  return v7;
}

- (VNCVMLImageprintObservation_LegacySupportDoNotChange)initWithData:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNCVMLImageprintObservation_LegacySupportDoNotChange;
  return [(VNCVMLObservation_LegacySupportDoNotChange *)&v4 initWithData:a3 forKey:@"CVMLImageprintObservation_ObjectCodingKey"];
}

- (VNCVMLImageprintObservation_LegacySupportDoNotChange)init
{
  v10.receiver = self;
  v10.super_class = (Class)VNCVMLImageprintObservation_LegacySupportDoNotChange;
  v2 = [(VNCVMLImageprintObservation_LegacySupportDoNotChange *)&v10 init];
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = 0;

    imageprintDescriptor = v3->_imageprintDescriptor;
    v3->_imageprintDescriptor = 0;

    imageprintType = v3->_imageprintType;
    v3->_imageprintType = (NSString *)@"CVMLImageprintObservation_ImageprintTypeColorGabor";

    imageprintVersion = v3->_imageprintVersion;
    v3->_imageprintVersion = 0;

    uint64_t v8 = v3;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end