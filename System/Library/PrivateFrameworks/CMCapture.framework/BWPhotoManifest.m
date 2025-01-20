@interface BWPhotoManifest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BWPhotoManifest)initWithCoder:(id)a3;
- (BWPhotoManifest)initWithDescriptors:(id)a3 captureRequestIdentifier:(id)a4;
- (NSArray)photoDescriptors;
- (NSString)captureRequestIdentifier;
- (id)description;
- (id)descriptorForIdentifier:(id)a3;
- (id)descriptorForSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (unint64_t)hash;
- (void)cannotProcessDepthPhotos;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BWPhotoManifest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWPhotoManifest)initWithDescriptors:(id)a3 captureRequestIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWPhotoManifest;
  v6 = [(BWPhotoManifest *)&v8 init];
  if (v6)
  {
    v6->_photoDescriptors = (NSArray *)[a3 copy];
    v6->_captureRequestIdentifier = (NSString *)[a4 copy];
    v6->_bufferPtrValueToPhotoDescriptorLock._os_unfair_lock_opaque = 0;
    v6->_bufferPtrValueToPhotoDescriptor = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPhotoManifest;
  [(BWPhotoManifest *)&v3 dealloc];
}

- (BWPhotoManifest)initWithCoder:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  return -[BWPhotoManifest initWithDescriptors:captureRequestIdentifier:](self, "initWithDescriptors:captureRequestIdentifier:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 2)), @"photoDescriptors"), objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"captureRequestIdentifier"));
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_photoDescriptors forKey:@"photoDescriptors"];
  captureRequestIdentifier = self->_captureRequestIdentifier;
  [a3 encodeObject:captureRequestIdentifier forKey:@"captureRequestIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v15 = v5;
    uint64_t v16 = v4;
    uint64_t v17 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(BWPhotoManifest *)self photoDescriptors];
      if (v11 == (NSArray *)[a3 photoDescriptors]
        || (int v12 = -[NSArray isEqual:](-[BWPhotoManifest photoDescriptors](self, "photoDescriptors"), "isEqual:", [a3 photoDescriptors])) != 0)
      {
        v13 = [(BWPhotoManifest *)self captureRequestIdentifier];
        if (v13 == (NSString *)[a3 captureRequestIdentifier]
          || (int v12 = -[NSString isEqual:](-[BWPhotoManifest captureRequestIdentifier](self, "captureRequestIdentifier"), "isEqual:", [a3 captureRequestIdentifier])) != 0)
        {
          LOBYTE(v12) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  return [(NSString *)self->_captureRequestIdentifier hash];
}

- (id)descriptorForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  photoDescriptors = self->_photoDescriptors;
  uint64_t v5 = [(NSArray *)photoDescriptors countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(photoDescriptors);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "photoIdentifier"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)photoDescriptors countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)descriptorForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_bufferPtrValueToPhotoDescriptorLock = &self->_bufferPtrValueToPhotoDescriptorLock;
  os_unfair_lock_lock(&self->_bufferPtrValueToPhotoDescriptorLock);
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  id v7 = (id)[(NSMutableDictionary *)self->_bufferPtrValueToPhotoDescriptor objectForKeyedSubscript:v6];
  if ([(NSArray *)self->_photoDescriptors count] == 1)
  {
    id v7 = [(NSArray *)self->_photoDescriptors objectAtIndexedSubscript:0];
    [(NSMutableDictionary *)self->_bufferPtrValueToPhotoDescriptor setObject:v7 forKeyedSubscript:v6];
  }
  else if (!v7)
  {
    int v8 = objc_msgSend((id)CMGetAttachment(a3, @"StillImageProcessingFlags", 0), "unsignedIntValue");
    v9 = (void *)[(NSArray *)self->_photoDescriptors mutableCopy];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v7 = *(id *)(*((void *)&v25 + 1) + 8 * v13);
        if ((v8 & ~[v7 processingFlags]) == 0) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_14;
        }
      }
      [(NSMutableDictionary *)self->_bufferPtrValueToPhotoDescriptor setObject:v7 forKeyedSubscript:v6];
      if (v7) {
        goto LABEL_25;
      }
    }
LABEL_14:
    long long v14 = (void *)[(NSMutableDictionary *)self->_bufferPtrValueToPhotoDescriptor allValues];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    photoDescriptors = self->_photoDescriptors;
    uint64_t v16 = [(NSArray *)photoDescriptors countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(photoDescriptors);
          }
          id v7 = *(id *)(*((void *)&v21 + 1) + 8 * i);
          if (([v14 containsObject:v7] & 1) == 0)
          {
            [(NSMutableDictionary *)self->_bufferPtrValueToPhotoDescriptor setObject:v7 forKeyedSubscript:v6];
            goto LABEL_25;
          }
        }
        uint64_t v17 = [(NSArray *)photoDescriptors countByEnumeratingWithState:&v21 objects:v29 count:16];
        id v7 = 0;
        if (v17) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v7 = 0;
    }
LABEL_25:
  }
  os_unfair_lock_unlock(p_bufferPtrValueToPhotoDescriptorLock);
  return v7;
}

- (void)cannotProcessDepthPhotos
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  photoDescriptors = self->_photoDescriptors;
  uint64_t v3 = [(NSArray *)photoDescriptors countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(photoDescriptors);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v7 processingFlags] & 0x40) == 0)
        {
          LODWORD(v8) = [v7 processingFlags];
          if (([v7 processingFlags] & 0x20) != 0) {
            LODWORD(v8) = v8 & 0xFFFFFFDF;
          }
          if (([v7 processingFlags] & 0x10) != 0) {
            uint64_t v8 = v8 & 0xFFFFFFEF;
          }
          else {
            uint64_t v8 = v8;
          }
          v9 = [BWPhotoDescriptor alloc];
          uint64_t v10 = [v7 photoIdentifier];
          uint64_t v11 = [v7 time];
          uint64_t v12 = [v7 timeZone];
          if (v7) {
            [v7 presentationTimeStamp];
          }
          else {
            memset(v16, 0, sizeof(v16));
          }
          uint64_t v13 = [(BWPhotoDescriptor *)v9 initWithPhotoIdentifier:v10 processingFlags:v8 time:v11 timeZone:v12 presentationTimeStamp:v16];
          [v15 addObject:v13];
        }
      }
      uint64_t v4 = [(NSArray *)photoDescriptors countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  self->_photoDescriptors = (NSArray *)[v15 copy];
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>:\n", objc_opt_class(), self];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  photoDescriptors = self->_photoDescriptors;
  uint64_t v5 = [(NSArray *)photoDescriptors countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(photoDescriptors);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)photoDescriptors countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSArray)photoDescriptors
{
  return self->_photoDescriptors;
}

- (NSString)captureRequestIdentifier
{
  return self->_captureRequestIdentifier;
}

@end