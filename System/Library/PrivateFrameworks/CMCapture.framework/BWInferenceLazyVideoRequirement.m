@interface BWInferenceLazyVideoRequirement
- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 count:(unint64_t)a4;
- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 preparedByAttachedMediaKey:(id)a4 count:(unint64_t)a5 videoFormatProvider:(id)a6;
- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 preparedByAttachedMediaKey:(id)a4 videoFormatProvider:(id)a5;
- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4 count:(unint64_t)a5;
- (BWInferenceLazyVideoRequirement)initWithLazyVideoRequirement:(id)a3;
- (NSString)preparedByAttachedMediaKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)prepareForInputInferenceVideoFormat:(id)a3;
- (void)dealloc;
@end

@implementation BWInferenceLazyVideoRequirement

- (NSString)preparedByAttachedMediaKey
{
  return self->_preparedByAttachedMediaKey;
}

- (int)prepareForInputInferenceVideoFormat:(id)a3
{
  if (self->super._videoFormat) {
    return 0;
  }
  videoFormatProvider = (uint64_t (**)(id, id))self->_videoFormatProvider;
  if (videoFormatProvider
    && (v5 = (BWInferenceVideoFormat *)(id)videoFormatProvider[2](videoFormatProvider, a3),
        (self->super._videoFormat = v5) != 0))
  {
    return 0;
  }
  else
  {
    return -31711;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithLazyVideoRequirement:self];
}

- (BWInferenceLazyVideoRequirement)initWithLazyVideoRequirement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceLazyVideoRequirement;
  v4 = -[BWInferenceVideoRequirement initWithVideoRequirement:](&v6, sel_initWithVideoRequirement_);
  if (v4)
  {
    v4->_preparedByAttachedMediaKey = (NSString *)objc_msgSend((id)objc_msgSend(a3, "preparedByAttachedMediaKey"), "copy");
    v4->_videoFormatProvider = (id)[*((id *)a3 + 7) copy];
  }
  return v4;
}

- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 preparedByAttachedMediaKey:(id)a4 videoFormatProvider:(id)a5
{
  return [(BWInferenceLazyVideoRequirement *)self initWithAttachedMediaKey:a3 preparedByAttachedMediaKey:a4 count:1 videoFormatProvider:a5];
}

- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 preparedByAttachedMediaKey:(id)a4 count:(unint64_t)a5 videoFormatProvider:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)BWInferenceLazyVideoRequirement;
  v8 = [(BWInferenceVideoRequirement *)&v10 initWithAttachedMediaKey:a3 videoFormat:0 count:a5];
  if (v8)
  {
    v8->_preparedByAttachedMediaKey = (NSString *)[a4 copy];
    v8->_videoFormatProvider = (id)[a6 copy];
  }
  return v8;
}

- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 count:(unint64_t)a4
{
  return 0;
}

- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4 count:(unint64_t)a5
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceLazyVideoRequirement;
  [(BWInferenceVideoRequirement *)&v3 dealloc];
}

- (id)description
{
  uint64_t v3 = [NSString stringWithFormat:@"<waiting for %@>", -[BWInferenceLazyVideoRequirement preparedByAttachedMediaKey](self, "preparedByAttachedMediaKey")];
  v4 = NSString;
  v5 = [(BWInferenceVideoRequirement *)self videoFormat];
  if (v5) {
    uint64_t v6 = (uint64_t)v5;
  }
  else {
    uint64_t v6 = v3;
  }
  uint64_t v7 = [v4 stringWithFormat:@"%@", v6];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@(%ld) %p; attachedMediaKey %@; videoFormat = %@; count = %lu>",
               objc_opt_class(),
               [(BWInferenceDataRequirement *)self identifier],
               self,
               [(BWInferenceMediaRequirement *)self attachedMediaKey],
               v7,
               [(BWInferenceMediaRequirement *)self count]);
}

@end