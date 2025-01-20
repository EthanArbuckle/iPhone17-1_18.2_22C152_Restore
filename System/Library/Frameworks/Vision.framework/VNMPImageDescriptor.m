@interface VNMPImageDescriptor
+ (BOOL)supportsSecureCoding;
+ (unint64_t)currentVersion;
- (BOOL)computeConvnetDescriptorForImageData:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)computeDescriptorForImageData:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)computeRegistrationFeaturesForImageData:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (NSData)rawColorGaborDescriptor;
- (NSString)externalImageId;
- (NSString)imageFilePath;
- (VNMPImageDescriptor)initWithCoder:(id)a3;
- (VNMPImageDescriptor)initWithImageData:(id)a3 andCustomQualityScore:(float)a4 context:(id)a5 error:(id *)a6;
- (VNMPImageDescriptor)initWithImageData:(id)a3 context:(id)a4 error:(id *)a5;
- (VNMPImageDescriptor)initWithRawColorGaborDescriptor:(id)a3;
- (VNMPImageDescriptor)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5;
- (float)computeFinalDescriptorBasedDistanceForColorDistance:(float)result andSceneClassifierDistance:(float)a4;
- (float)distanceFromDescriptor:(id)a3;
- (float)nextLeafDescriptorDistance;
- (float)nextLeafTotalDistance;
- (float)previousLeafDescriptorDistance;
- (float)previousLeafTotalDistance;
- (float)quality;
- (int64_t)descriptorId;
- (int64_t)exifTimestamp;
- (int64_t)nextLeafId;
- (int64_t)nextLeafTimestampDistance;
- (int64_t)previousLeafId;
- (int64_t)previousLeafTimestampDistance;
- (unint64_t)hash;
- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5;
- (unint64_t)serializedLength;
- (void)colorGaborDescriptor;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)imageRegistrationDescriptor;
- (void)sceneClassifierDescriptor;
- (void)setNextLeafDescriptorDistance:(float)a3;
- (void)setNextLeafId:(int64_t)a3;
- (void)setNextLeafTimestampDistance:(int64_t)a3;
- (void)setNextLeafTotalDistance:(float)a3;
- (void)setPreviousLeafDescriptorDistance:(float)a3;
- (void)setPreviousLeafId:(int64_t)a3;
- (void)setPreviousLeafTimestampDistance:(int64_t)a3;
- (void)setPreviousLeafTotalDistance:(float)a3;
@end

@implementation VNMPImageDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFilePath, 0);

  objc_storeStrong((id *)&self->_externalImageId, 0);
}

- (NSString)imageFilePath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPreviousLeafTotalDistance:(float)a3
{
  self->_previousLeafTotalDistance = a3;
}

- (float)previousLeafTotalDistance
{
  return self->_previousLeafTotalDistance;
}

- (void)setNextLeafTotalDistance:(float)a3
{
  self->_nextLeafTotalDistance = a3;
}

- (float)nextLeafTotalDistance
{
  return self->_nextLeafTotalDistance;
}

- (void)setPreviousLeafTimestampDistance:(int64_t)a3
{
  self->_previousLeafTimestampDistance = a3;
}

- (int64_t)previousLeafTimestampDistance
{
  return self->_previousLeafTimestampDistance;
}

- (void)setNextLeafTimestampDistance:(int64_t)a3
{
  self->_nextLeafTimestampDistance = a3;
}

- (int64_t)nextLeafTimestampDistance
{
  return self->_nextLeafTimestampDistance;
}

- (void)setPreviousLeafDescriptorDistance:(float)a3
{
  self->_previousLeafDescriptorDistance = a3;
}

- (float)previousLeafDescriptorDistance
{
  return self->_previousLeafDescriptorDistance;
}

- (void)setNextLeafDescriptorDistance:(float)a3
{
  self->_nextLeafDescriptorDistance = a3;
}

- (float)nextLeafDescriptorDistance
{
  return self->_nextLeafDescriptorDistance;
}

- (void)setNextLeafId:(int64_t)a3
{
  self->_nextLeafId = a3;
}

- (int64_t)nextLeafId
{
  return self->_nextLeafId;
}

- (void)setPreviousLeafId:(int64_t)a3
{
  self->_previousLeafId = a3;
}

- (int64_t)previousLeafId
{
  return self->_previousLeafId;
}

- (void)imageRegistrationDescriptor
{
  return self->_imageRegistrationDescriptor;
}

- (void)sceneClassifierDescriptor
{
  return self->_sceneClassifierDescriptor;
}

- (void)colorGaborDescriptor
{
  return self->_colorGaborDescriptor;
}

- (float)quality
{
  return self->_quality;
}

- (int64_t)exifTimestamp
{
  return self->_exifTimestamp;
}

- (NSString)externalImageId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)descriptorId
{
  return self->_internalNonSerializedDescriptorId;
}

- (VNMPImageDescriptor)initWithRawColorGaborDescriptor:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VNMPImageDescriptor;
  v5 = [(VNMPImageDescriptor *)&v21 init];
  v6 = v5;
  if (v5)
  {
    v5->_internalNonSerializedDescriptorId = v7;
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    externalImageId = v6->_externalImageId;
    v6->_externalImageId = (NSString *)v9;

    imageFilePath = v6->_imageFilePath;
    v6->_imageFilePath = 0;

    v6->_colorGaborDescriptor = 0;
    *(void *)&long long v12 = -1;
    *((void *)&v12 + 1) = -1;
    *(_OWORD *)&v6->_nextLeafTimestampDistance = v12;
    *(_OWORD *)&v6->_previousLeafId = v12;
    __asm { FMOV            V0.4S, #-1.0 }
    *(_OWORD *)&v6->_nextLeafDescriptorDistance = _Q0;
    v6->_sceneClassifierDescriptor = 0;
    size_t v18 = [v4 length];
    v19 = malloc_type_malloc(v18, 0x1AB69656uLL);
    memcpy(v19, (const void *)[v4 bytes], v18);
    if (v19) {
      operator new();
    }
    syslog(5, "Constructing image descriptor failed");
  }

  return 0;
}

- (NSData)rawColorGaborDescriptor
{
  colorGaborDescriptor = self->_colorGaborDescriptor;
  if (colorGaborDescriptor
    && std::type_info::operator==[abi:ne180100]((uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE", (uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE"))
  {
    v3 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:colorGaborDescriptor[7] length:(*(uint64_t (**)(void *))(*colorGaborDescriptor + 104))(colorGaborDescriptor) freeWhenDone:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (float)computeFinalDescriptorBasedDistanceForColorDistance:(float)result andSceneClassifierDistance:(float)a4
{
  if (a4 >= 0.0) {
    return a4;
  }
  return result;
}

- (float)distanceFromDescriptor:(id)a3
{
  id v4 = a3;
  double v5 = (*(double (**)(void *, uint64_t))(*(void *)self->_colorGaborDescriptor + 88))(self->_colorGaborDescriptor, [v4 colorGaborDescriptor]);
  LODWORD(v6) = -1.0;
  [(VNMPImageDescriptor *)self computeFinalDescriptorBasedDistanceForColorDistance:v5 andSceneClassifierDistance:v6];
  float v8 = v7;

  return v8;
}

- (BOOL)computeRegistrationFeaturesForImageData:(id)a3 context:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)computeDescriptorForImageData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    *a5 = 0;
    operator new();
  }
  __assert_rtn("-[VNMPImageDescriptor computeDescriptorForImageData:context:error:]", "MPImageDescriptor.mm", 556, "error != nil");
}

- (BOOL)computeConvnetDescriptorForImageData:(id)a3 context:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNMPImageDescriptor *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      int64_t v6 = [(VNMPImageDescriptor *)self exifTimestamp];
      if (v6 != [(VNMPImageDescriptor *)v5 exifTimestamp]) {
        goto LABEL_9;
      }
      [(VNMPImageDescriptor *)self quality];
      float v8 = v7;
      [(VNMPImageDescriptor *)v5 quality];
      if (v8 != v9) {
        goto LABEL_9;
      }
      v10 = [(VNMPImageDescriptor *)self rawColorGaborDescriptor];
      v11 = [(VNMPImageDescriptor *)v5 rawColorGaborDescriptor];
      char v12 = VisionCoreEqualOrNilObjects();

      if ((v12 & 1) == 0) {
        goto LABEL_9;
      }
      colorGaborDescriptor = (const void **)self->_colorGaborDescriptor;
      v14 = (const void **)v5->_colorGaborDescriptor;
      if (colorGaborDescriptor == v14
        || (size_t v15 = (*((uint64_t (**)(const void **))*colorGaborDescriptor + 13))(colorGaborDescriptor),
            v15 == (*((uint64_t (**)(const void **))*v14 + 13))(v14))
        && !memcmp(colorGaborDescriptor[7], v14[7], v15))
      {
        BOOL v16 = 1;
      }
      else
      {
LABEL_9:
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  v3 = [(VNMPImageDescriptor *)self externalImageId];
  uint64_t v4 = [v3 hash];

  int64_t v5 = [(VNMPImageDescriptor *)self exifTimestamp];
  [(VNMPImageDescriptor *)self quality];
  float v7 = v6;
  float v8 = [(VNMPImageDescriptor *)self rawColorGaborDescriptor];
  uint64_t v9 = [v8 hash];

  uint64_t colorGaborDescriptor = (uint64_t)self->_colorGaborDescriptor;
  if (colorGaborDescriptor)
  {
    uint64_t v11 = *(void *)(colorGaborDescriptor + 56);
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)colorGaborDescriptor + 104))(colorGaborDescriptor);
    uint64_t colorGaborDescriptor = VNHashMemory(v11, v12);
  }
  uint64_t v13 = LODWORD(v7);
  if (v7 == 0.0) {
    uint64_t v13 = 0;
  }
  return colorGaborDescriptor ^ __ROR8__(v9 ^ __ROR8__(v13 ^ __ROR8__(v5 ^ __ROR8__(v4, 51), 51), 51), 51);
}

- (void)dealloc
{
  uint64_t colorGaborDescriptor = self->_colorGaborDescriptor;
  if (colorGaborDescriptor) {
    (*(void (**)(void *, SEL))(*(void *)colorGaborDescriptor + 8))(colorGaborDescriptor, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)VNMPImageDescriptor;
  [(VNMPImageDescriptor *)&v4 dealloc];
}

- (VNMPImageDescriptor)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  if (!v8)
  {
    if (!a5) {
      goto LABEL_11;
    }
    v29 = +[VNMPUtils createErrorWithCode:3709 andMessage:@"state parameter cannot be nil"];
LABEL_9:
    *a5 = v29;
    goto LABEL_11;
  }
  *(void *)&long long v9 = -1;
  *((void *)&v9 + 1) = -1;
  *(_OWORD *)&self->_previousLeafId = v9;
  *(_OWORD *)&self->_nextLeafTimestampDistance = v9;
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)&self->_nextLeafDescriptorDistance = _Q0;
  size_t v15 = [MEMORY[0x1E4F29128] UUID];
  BOOL v16 = [v15 UUIDString];
  externalImageId = self->_externalImageId;
  self->_externalImageId = v16;

  uint64_t v18 = [v8 bytes];
  uint64_t v19 = v18;
  unint64_t v20 = *a4;
  unint64_t v21 = *a4 + 12;
  *a4 = v21;
  int64_t v22 = *(void *)(v18 + v21);
  *a4 = v20 + 20;
  self->_exifTimestamp = v22;
  self->_quality = *(float *)(v18 + *a4);
  unint64_t v23 = *a4;
  unint64_t v24 = *a4 + 4;
  *a4 = v24;
  int v25 = *(unsigned __int16 *)(v18 + v24);
  *a4 = v23 + 6;
  if (v25 != 1)
  {
    if (!a5) {
      goto LABEL_11;
    }
    v29 = +[VNMPUtils createErrorWithCode:3700 andMessage:@"Invalid state format"];
    goto LABEL_9;
  }
  size_t v26 = *(unsigned int *)(v18 + v23 + 6);
  *a4 = v23 + 10;
  v27 = malloc_type_malloc(v26, 0x9A4CDBC8uLL);
  if (v27)
  {
    memcpy(v27, (const void *)(v19 + *a4), v26);
    unint64_t v28 = *a4 + v26;
    *a4 = v28;
    *a4 = v28 + 4;
    *a4 = v28 + 8;
    operator new();
  }
  syslog(5, "Constructing image descriptor failed");
LABEL_11:

  return 0;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t colorGaborDescriptor = (const void **)self->_colorGaborDescriptor;
  if (!std::type_info::operator==[abi:ne180100]((uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE", (uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE"))
  {
    if (a5)
    {
      size_t v15 = [NSString stringWithUTF8String:"internal error"];
      BOOL v16 = +[VNMPUtils createErrorWithCode:3710 andMessage:v15];
      goto LABEL_9;
    }
LABEL_10:
    unint64_t v11 = 0;
    goto LABEL_11;
  }
  if (!v8)
  {
    if (a5)
    {
      +[VNMPUtils createErrorWithCode:3196 andMessage:@"ERROR: state cannot be nil"];
      unint64_t v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v10 = [v8 mutableBytes];
  unint64_t v11 = [(VNMPImageDescriptor *)self serializedLength];
  *(void *)(v10 + a4) = v11;
  if (!colorGaborDescriptor)
  {
    if (!a5) {
      goto LABEL_10;
    }
    size_t v15 = [NSString stringWithFormat:@"MPImageDescriptor cannot be serialized without being created"];
    BOOL v16 = +[VNMPUtils createErrorWithCode:3196 andMessage:v15];
    goto LABEL_9;
  }
  *(_DWORD *)(v10 + a4 + 8) = +[VNMPImageDescriptor currentVersion];
  unint64_t v12 = a4 + v10;
  *(void *)(v12 + 12) = self->_exifTimestamp;
  *(float *)(v12 + 20) = self->_quality;
  *(_WORD *)(v12 + 24) = 1;
  unsigned int v13 = (*((uint64_t (**)(const void **))*colorGaborDescriptor + 13))(colorGaborDescriptor);
  *(_DWORD *)(v12 + 26) = v13;
  memcpy((void *)(v10 + a4 + 30), colorGaborDescriptor[7], v13);
  v14 = (_DWORD *)(v10 + a4 + 30 + v13);
  _DWORD *v14 = colorGaborDescriptor[9];
  v14[1] = colorGaborDescriptor[8];
  if (v13 + 38 != v11)
  {
    if (a5)
    {
      size_t v15 = [NSString stringWithFormat:@"Unexpected size of serialized state of the object of type %@", objc_opt_class()];
      BOOL v16 = +[VNMPUtils createErrorWithCode:3196 andMessage:v15];
LABEL_9:
      *a5 = v16;

      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

- (unint64_t)serializedLength
{
  uint64_t colorGaborDescriptor = self->_colorGaborDescriptor;
  if (colorGaborDescriptor) {
    return (*(uint64_t (**)(void *, SEL))(*(void *)colorGaborDescriptor + 104))(colorGaborDescriptor, a2)
  }
         + 38;
  else {
    return 10;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  objc_super v4 = [NSNumber numberWithLong:self->_exifTimestamp];
  [v14 encodeObject:v4 forKey:@"VNMPImageDescriptor_exifTimestamp"];

  *(float *)&double v5 = self->_quality;
  float v6 = [NSNumber numberWithFloat:v5];
  [v14 encodeObject:v6 forKey:@"VNMPImageDescriptor_quality"];

  uint64_t colorGaborDescriptor = self->_colorGaborDescriptor;
  if (colorGaborDescriptor)
  {
    if (!std::type_info::operator==[abi:ne180100]((uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE", (uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE"))goto LABEL_6; {
    id v8 = [NSNumber numberWithShort:1];
    }
    [v14 encodeObject:v8 forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_type"];

    uint64_t v9 = (*(uint64_t (**)(void *))(*colorGaborDescriptor + 104))(colorGaborDescriptor);
    uint64_t v10 = [NSNumber numberWithLong:v9];
    [v14 encodeObject:v10 forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_lengthInBytes"];

    unint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:colorGaborDescriptor[7] length:v9 freeWhenDone:0];
    [v14 encodeObject:v11 forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_data"];

    unint64_t v12 = [NSNumber numberWithLong:colorGaborDescriptor[9]];
    [v14 encodeObject:v12 forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_count"];

    unsigned int v13 = [NSNumber numberWithLong:colorGaborDescriptor[8]];
    [v14 encodeObject:v13 forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_stride"];
  }
  else
  {
    unsigned int v13 = [NSNumber numberWithShort:0];
    [v14 encodeObject:v13 forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_type"];
  }

LABEL_6:
}

- (VNMPImageDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(VNMPImageDescriptor *)self init];
  float v6 = v5;
  if (!v5) {
    goto LABEL_17;
  }
  *(void *)&long long v7 = -1;
  *((void *)&v7 + 1) = -1;
  *(_OWORD *)&v5->_previousLeafId = v7;
  *(_OWORD *)&v5->_nextLeafTimestampDistance = v7;
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)&v5->_nextLeafDescriptorDistance = _Q0;
  v5->_internalNonSerializedDescriptorId = v13;
  id v14 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v15 = [v14 UUIDString];
  externalImageId = v6->_externalImageId;
  v6->_externalImageId = (NSString *)v15;

  uint64_t v17 = objc_opt_class();
  uint64_t v18 = [v4 decodeObjectOfClass:v17 forKey:@"VNMPImageDescriptor_exifTimestamp"];
  v6->_exifTimestamp = [v18 longValue];

  uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:@"VNMPImageDescriptor_quality"];
  [v19 floatValue];
  v6->_quality = v20;

  unint64_t v21 = [v4 decodeObjectOfClass:v17 forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_type"];
  int v22 = [v21 shortValue];

  if (v22)
  {
    if (v22 != 1)
    {
      syslog(5, "Unknown decoded image descriptor type");
LABEL_17:
      v35 = 0;
      goto LABEL_18;
    }
    unint64_t v23 = [v4 decodeObjectOfClass:v17 forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_lengthInBytes"];
    size_t v24 = [v23 longValue];

    int v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_data"];
    if (v24 != [v25 length])
    {
      syslog(5, "Size mismatch for decoded image descriptor");
LABEL_16:

      goto LABEL_17;
    }
    size_t v26 = [v4 decodeObjectOfClass:v17 forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_count"];
    unint64_t v27 = [v26 unsignedLongValue];

    unint64_t v28 = [v4 decodeObjectOfClass:v17 forKey:@"VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_stride"];
    unint64_t v29 = [v28 unsignedLongValue];

    if (is_mul_ok(v29, v27))
    {
      if (v29 * v27 == v24)
      {
        v36 = (const void *)[v25 bytes];
        v37 = malloc_type_malloc(v24, 0x6F810886uLL);
        if (v37)
        {
          memcpy(v37, v36, v24);
          operator new();
        }
        v33 = +[VNError errorForMemoryAllocationFailureWithLocalizedDescription:@"unable to allocate descriptor data"];
        [v4 failWithError:v33];
        goto LABEL_15;
      }
      v33 = (void *)[[NSString alloc] initWithFormat:@"Data integrity check failed when unarchiving an object of type: %@", objc_opt_class()];
      v34 = +[VNError errorForInternalErrorWithLocalizedDescription:v33];
      [v4 failWithError:v34];
    }
    else
    {
      id v30 = [NSString alloc];
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      v33 = (void *)[v30 initWithFormat:@"Integer overflow occured when unarchiving an object of type: %@ stride: %zu count: %zu", v32, v29, v27];

      v34 = +[VNError errorForInternalErrorWithLocalizedDescription:v33];
      [v4 failWithError:v34];
    }

LABEL_15:
    goto LABEL_16;
  }
  v6->_uint64_t colorGaborDescriptor = 0;
  v35 = v6;
LABEL_18:

  return v35;
}

- (VNMPImageDescriptor)initWithImageData:(id)a3 andCustomQualityScore:(float)a4 context:(id)a5 error:(id *)a6
{
  result = [(VNMPImageDescriptor *)self initWithImageData:a3 context:a5 error:a6];
  if (result) {
    result->_quality = a4;
  }
  return result;
}

- (VNMPImageDescriptor)initWithImageData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)VNMPImageDescriptor;
  uint64_t v10 = [(VNMPImageDescriptor *)&v27 init];
  unint64_t v11 = v10;
  if (!v10) {
    goto LABEL_9;
  }
  v10->_internalNonSerializedDescriptorId = v12;
  uint64_t v13 = [v8 externalImageId];
  externalImageId = v11->_externalImageId;
  v11->_externalImageId = (NSString *)v13;

  uint64_t v15 = [v8 imageFilePath];
  imageFilePath = v11->_imageFilePath;
  v11->_imageFilePath = (NSString *)v15;

  *(void *)&long long v17 = -1;
  *((void *)&v17 + 1) = -1;
  *(_OWORD *)&v11->_previousLeafId = v17;
  *(_OWORD *)&v11->_nextLeafTimestampDistance = v17;
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)&v11->_nextLeafDescriptorDistance = _Q0;
  v11->_uint64_t colorGaborDescriptor = 0;
  v11->_sceneClassifierDescriptor = 0;
  [(VNMPImageDescriptor *)v11 computeDescriptorForImageData:v8 context:v9 error:a5];
  if (!*a5)
  {
    [(VNMPImageDescriptor *)v11 computeConvnetDescriptorForImageData:v8 context:v9 error:a5];
    if (*a5)
    {
      unint64_t v23 = @"ERROR: Could not compute the convnet-based image descriptor";
      goto LABEL_8;
    }
    [(VNMPImageDescriptor *)v11 computeRegistrationFeaturesForImageData:v8 context:v9 error:a5];
    if (*a5)
    {
      unint64_t v23 = @"ERROR: Could not compute image registration features";
      goto LABEL_8;
    }
LABEL_9:
    int v25 = v11;
    goto LABEL_10;
  }
  unint64_t v23 = @"ERROR: Could not compute the image descriptor";
LABEL_8:
  id v24 = +[VNMPUtils createErrorWithCode:3196 andMessage:v23];
  int v25 = 0;
LABEL_10:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)currentVersion
{
  return 2;
}

@end