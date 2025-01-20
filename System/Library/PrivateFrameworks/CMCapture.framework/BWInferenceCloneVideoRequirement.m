@interface BWInferenceCloneVideoRequirement
- (BWInferenceCloneVideoRequirement)initWithAttachedMediaKey:(id)a3 sourceVideoRequirement:(id)a4;
- (BWInferenceCloneVideoRequirement)initWithCloneVideoRequirement:(id)a3;
- (BWInferenceVideoRequirement)sourceVideoRequirement;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)videoFormat;
- (void)dealloc;
@end

@implementation BWInferenceCloneVideoRequirement

- (id)videoFormat
{
  return [(BWInferenceVideoRequirement *)self->_sourceVideoRequirement videoFormat];
}

- (BWInferenceVideoRequirement)sourceVideoRequirement
{
  return self->_sourceVideoRequirement;
}

- (BWInferenceCloneVideoRequirement)initWithAttachedMediaKey:(id)a3 sourceVideoRequirement:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceCloneVideoRequirement;
  v5 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:](&v7, sel_initWithAttachedMediaKey_videoFormat_, a3, [a4 videoFormat]);
  if (v5) {
    v5->_sourceVideoRequirement = (BWInferenceVideoRequirement *)a4;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithCloneVideoRequirement:self];
}

- (BWInferenceCloneVideoRequirement)initWithCloneVideoRequirement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceCloneVideoRequirement;
  v4 = -[BWInferenceVideoRequirement initWithVideoRequirement:](&v6, sel_initWithVideoRequirement_);
  if (v4) {
    v4->_sourceVideoRequirement = (BWInferenceVideoRequirement *)(id)[a3 sourceVideoRequirement];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceCloneVideoRequirement;
  [(BWInferenceVideoRequirement *)&v3 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@(%ld) %p; attachedMediaKey = %@; sourceVideoRequirement = %@>",
               objc_opt_class(),
               [(BWInferenceDataRequirement *)self identifier],
               self,
               [(BWInferenceMediaRequirement *)self attachedMediaKey],
               [(BWInferenceCloneVideoRequirement *)self sourceVideoRequirement]);
}

@end