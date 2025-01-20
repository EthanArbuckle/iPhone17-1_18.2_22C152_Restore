@interface BWStillImageInferences
- (BWStillImageInferences)init;
- (NSDictionary)inferenceAttachedMediaMetadata;
- (__CVBuffer)inferenceBufferForAttachedMediaKey:(id)a3;
- (id)description;
- (id)inferenceForAttachmentKey:(id)a3;
- (id)metadataForAttachedMediaKey:(id)a3;
- (void)addInference:(id)a3 inferenceAttachmentKey:(id)a4;
- (void)addInferenceAttachedMediaMetadata:(id)a3;
- (void)addInferenceBuffer:(__CVBuffer *)a3 metadata:(id)a4 inferenceAttachedMediaKey:(id)a5;
- (void)dealloc;
@end

@implementation BWStillImageInferences

- (BWStillImageInferences)init
{
  v4.receiver = self;
  v4.super_class = (Class)BWStillImageInferences;
  v2 = [(BWStillImageInferences *)&v4 init];
  if (v2)
  {
    v2->_inferenceBufferByAttachedMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_metadataByAttachedMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_inferenceByAttachmentKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageInferences;
  [(BWStillImageInferences *)&v3 dealloc];
}

- (void)addInferenceBuffer:(__CVBuffer *)a3 metadata:(id)a4 inferenceAttachedMediaKey:(id)a5
{
  [(NSMutableDictionary *)self->_inferenceBufferByAttachedMediaKey setObject:a3 forKeyedSubscript:a5];
  metadataByAttachedMediaKey = self->_metadataByAttachedMediaKey;
  [(NSMutableDictionary *)metadataByAttachedMediaKey setObject:a4 forKeyedSubscript:a5];
}

- (__CVBuffer)inferenceBufferForAttachedMediaKey:(id)a3
{
  return (__CVBuffer *)[(NSMutableDictionary *)self->_inferenceBufferByAttachedMediaKey objectForKeyedSubscript:a3];
}

- (id)metadataForAttachedMediaKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_metadataByAttachedMediaKey objectForKeyedSubscript:a3];
}

- (void)addInference:(id)a3 inferenceAttachmentKey:(id)a4
{
}

- (id)inferenceForAttachmentKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_inferenceByAttachmentKey objectForKeyedSubscript:a3];
}

- (void)addInferenceAttachedMediaMetadata:(id)a3
{
  inferenceAttachedMediaMetadata = self->_inferenceAttachedMediaMetadata;
  if (inferenceAttachedMediaMetadata != a3)
  {

    self->_inferenceAttachedMediaMetadata = (NSDictionary *)a3;
  }
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_inferenceByAttachmentKey;
  uint64_t v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [v5 length];
        v10 = @", ";
        if (!v9) {
          v10 = &stru_1EFA403E0;
        }
        v5 = (void *)[v5 stringByAppendingFormat:@"%@%@", v10, v8];
        v11 = (void *)[(NSMutableDictionary *)self->_inferenceByAttachmentKey objectForKeyedSubscript:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v5 = objc_msgSend(v5, "stringByAppendingFormat:", @":%lu", objc_msgSend(v11, "count"));
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v5 = objc_msgSend(v5, "stringByAppendingFormat:", @":%lu", objc_msgSend(v11, "count"));
        }
      }
      uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  return (id)[NSString stringWithFormat:@"<%@ %p>: inferenceBuffers:%@ inferenceAttachments:%@ inferenceAttachedMediaMetadata:%lu", objc_opt_class(), self, objc_msgSend((id)-[NSMutableDictionary allKeys](self->_inferenceBufferByAttachedMediaKey, "allKeys"), "componentsJoinedByString:", @",", v5, -[NSDictionary count](self->_inferenceAttachedMediaMetadata, "count")];
}

- (NSDictionary)inferenceAttachedMediaMetadata
{
  return self->_inferenceAttachedMediaMetadata;
}

@end