@interface BWInferenceVideoRequirement
- (BOOL)isSatisfiedByRequirement:(id)a3;
- (BWInferenceVideoFormat)videoFormat;
- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 count:(unint64_t)a4;
- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4;
- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4 count:(unint64_t)a5;
- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4 videoStorageType:(int)a5;
- (BWInferenceVideoRequirement)initWithVideoRequirement:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)videoStorageType;
- (unint64_t)satisfactionHash;
- (void)dealloc;
@end

@implementation BWInferenceVideoRequirement

- (BWInferenceVideoRequirement)initWithVideoRequirement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceVideoRequirement;
  v4 = -[BWInferenceMediaRequirement initWithMediaRequirement:](&v6, sel_initWithMediaRequirement_);
  if (v4)
  {
    v4->_videoFormat = (BWInferenceVideoFormat *)objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "copy");
    v4->_videoStorageType = [a3 videoStorageType];
  }
  return v4;
}

- (BOOL)isSatisfiedByRequirement:(id)a3
{
  uint64_t v4 = [a3 satisfactionHash];
  return v4 == [(BWInferenceVideoRequirement *)self satisfactionHash];
}

- (unint64_t)satisfactionHash
{
  NSUInteger v3 = [(NSString *)[(BWInferenceMediaRequirement *)self attachedMediaKey] hash];
  return [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self videoFormat] hash] ^ v3;
}

- (BWInferenceVideoFormat)videoFormat
{
  return self->_videoFormat;
}

- (int)videoStorageType
{
  return self->_videoStorageType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithVideoRequirement:self];
}

- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4
{
  return [(BWInferenceVideoRequirement *)self initWithAttachedMediaKey:a3 videoFormat:a4 count:1];
}

- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4 count:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceVideoRequirement;
  objc_super v6 = [(BWInferenceMediaRequirement *)&v8 initWithAttachedMediaKey:a3 count:a5];
  if (v6) {
    v6->_videoFormat = (BWInferenceVideoFormat *)a4;
  }
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@(%ld) %p; attachedMediaKey = %@; videoFormat = %@; count = %lu>",
               objc_opt_class(),
               [(BWInferenceDataRequirement *)self identifier],
               self,
               [(BWInferenceMediaRequirement *)self attachedMediaKey],
               [(BWInferenceVideoRequirement *)self videoFormat],
               [(BWInferenceMediaRequirement *)self count]);
}

- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 count:(unint64_t)a4
{
  return 0;
}

- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4 videoStorageType:(int)a5
{
  self->_videoStorageType = a5;
  return [(BWInferenceVideoRequirement *)self initWithAttachedMediaKey:a3 videoFormat:a4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceVideoRequirement;
  [(BWInferenceMediaRequirement *)&v3 dealloc];
}

@end