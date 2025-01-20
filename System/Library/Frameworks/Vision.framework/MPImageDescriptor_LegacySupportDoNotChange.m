@interface MPImageDescriptor_LegacySupportDoNotChange
+ (BOOL)supportsSecureCoding;
- (MPImageDescriptor_LegacySupportDoNotChange)initWithCoder:(id)a3;
- (NSData)rawColorGaborDescriptor;
- (NSString)externalImageId;
- (NSString)imageFilePath;
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

@implementation MPImageDescriptor_LegacySupportDoNotChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFilePath, 0);
  objc_storeStrong((id *)&self->_rawColorGaborDescriptor, 0);

  objc_storeStrong((id *)&self->_externalImageId, 0);
}

- (NSString)imageFilePath
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSData)rawColorGaborDescriptor
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
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
  return self->_descriptorId;
}

- (void)dealloc
{
  colorGaborDescriptor = self->_colorGaborDescriptor;
  if (colorGaborDescriptor) {
    (*(void (**)(void *, SEL))(*(void *)colorGaborDescriptor + 8))(colorGaborDescriptor, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPImageDescriptor_LegacySupportDoNotChange;
  [(MPImageDescriptor_LegacySupportDoNotChange *)&v4 dealloc];
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  colorGaborDescriptor = (const void **)self->_colorGaborDescriptor;
  if (std::type_info::operator==[abi:ne180100]((uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE", (uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE"))
  {
    if (v8)
    {
      uint64_t v10 = [v8 mutableBytes];
      unint64_t v11 = [(MPImageDescriptor_LegacySupportDoNotChange *)self serializedLength];
      *(void *)(v10 + a4) = v11;
      if (colorGaborDescriptor)
      {
        *(_DWORD *)(a4 + v10 + 8) = 1;
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_externalImageId];
        if (v12)
        {
          *(void *)(v10 + a4 + 12) = self->_exifTimestamp;
          unint64_t v13 = a4 + v10;
          *(float *)(v13 + 20) = self->_quality;
          *(_WORD *)(v13 + 24) = 1;
          unsigned int v14 = (*((uint64_t (**)(const void **))*colorGaborDescriptor + 13))(colorGaborDescriptor);
          *(_DWORD *)(v13 + 26) = v14;
          memcpy((void *)(v10 + a4 + 30), colorGaborDescriptor[7], v14);
          v15 = (_DWORD *)(v10 + a4 + 30 + v14);
          _DWORD *v15 = colorGaborDescriptor[9];
          v15[1] = colorGaborDescriptor[8];
          if (v14 + 38 != v11)
          {
            if (a5)
            {
              v16 = [NSString stringWithFormat:@"Unexpected size of serialized state of the object of type %@", objc_opt_class()];
              *a5 = +[VNMPUtils createErrorWithCode:3196 andMessage:v16];
            }
            goto LABEL_17;
          }
        }
        else
        {
          if (!a5)
          {
LABEL_17:
            unint64_t v11 = 0;
            goto LABEL_18;
          }
          +[VNMPUtils createErrorWithCode:3710 andMessage:@"ERROR: invalid image Id format"];
          unint64_t v11 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_18:

        goto LABEL_19;
      }
      if (a5) {
        goto LABEL_14;
      }
    }
    else if (a5)
    {
LABEL_14:
      +[VNMPUtils createErrorWithCode:3196 andMessage:@"ERROR: state cannot be nil"];
      unint64_t v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  else if (a5)
  {
    v17 = [NSString stringWithUTF8String:"internal error"];
    *a5 = +[VNMPUtils createErrorWithCode:3710 andMessage:v17];
  }
  unint64_t v11 = 0;
LABEL_19:

  return v11;
}

- (unint64_t)serializedLength
{
  colorGaborDescriptor = self->_colorGaborDescriptor;
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
}

- (MPImageDescriptor_LegacySupportDoNotChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MPImageDescriptor_LegacySupportDoNotChange;
  v5 = [(MPImageDescriptor_LegacySupportDoNotChange *)&v35 init];
  v6 = v5;
  if (v5)
  {
    v5->_descriptorId = ++internalId;
    imageFilePath = v5->_imageFilePath;
    v5->_imageFilePath = 0;

    *(void *)&long long v8 = -1;
    *((void *)&v8 + 1) = -1;
    *(_OWORD *)&v6->_previousLeafId = v8;
    *(_OWORD *)&v6->_nextLeafTimestampDistance = v8;
    __asm { FMOV            V0.4S, #-1.0 }
    *(_OWORD *)&v6->_nextLeafDescriptorDistance = _Q0;
    v6->_sceneClassifierDescriptor = 0;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPImageDescriptor_externalImageId"];
    externalImageId = v6->_externalImageId;
    v6->_externalImageId = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = [v4 decodeObjectOfClass:v16 forKey:@"MPImageDescriptor_exifTimestamp"];
    v6->_exifTimestamp = [v17 longValue];

    v18 = [v4 decodeObjectOfClass:v16 forKey:@"MPImageDescriptor_quality"];
    [v18 floatValue];
    v6->_quality = v19;

    v20 = [v4 decodeObjectOfClass:v16 forKey:@"MPImageDescriptor_ColorGaborImageDescriptorBuffer_type"];
    int v21 = [v20 shortValue];

    if (v21)
    {
      if (v21 == 1)
      {
        v22 = [v4 decodeObjectOfClass:v16 forKey:@"MPImageDescriptor_ColorGaborImageDescriptorBuffer_lengthInBytes"];
        size_t v23 = [v22 longValue];

        v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPImageDescriptor_ColorGaborImageDescriptorBuffer_data"];
        if (v23 == [v24 length])
        {
          v25 = (const void *)[v24 bytes];
          v26 = malloc_type_malloc(v23, 0x2F410A4BuLL);
          v27 = v26;
          if (v26)
          {
            memcpy(v26, v25, v23);
            v28 = [v4 decodeObjectOfClass:v16 forKey:@"MPImageDescriptor_ColorGaborImageDescriptorBuffer_count"];
            uint64_t v29 = [v28 longValue];

            v30 = [v4 decodeObjectOfClass:v16 forKey:@"MPImageDescriptor_ColorGaborImageDescriptorBuffer_stride"];
            uint64_t v31 = [v30 longValue];

            if (v31 * v29 == v23) {
              operator new();
            }
            free(v27);
            v32 = (void *)[[NSString alloc] initWithFormat:@"Data integrity check failed when unarchiving an object of type: %@", objc_opt_class()];
            v33 = +[VNError errorForInternalErrorWithLocalizedDescription:v32];
            [v4 failWithError:v33];
          }
          else
          {
            syslog(5, "Constructing image descriptor failed");
          }
        }
        else
        {
          syslog(5, "Size mismatch for decoded image descriptor");
        }
      }
      else
      {
        syslog(5, "Unknown decoded image descriptor type");
      }
    }
  }

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end