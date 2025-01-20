@interface BWInferenceMediaRequirement
- (BWInferenceMediaRequirement)initWithAttachedMediaKey:(id)a3;
- (BWInferenceMediaRequirement)initWithAttachedMediaKey:(id)a3 count:(unint64_t)a4;
- (BWInferenceMediaRequirement)initWithMediaRequirement:(id)a3;
- (NSString)attachedMediaKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation BWInferenceMediaRequirement

- (NSString)attachedMediaKey
{
  return self->_attachedMediaKey;
}

- (BWInferenceMediaRequirement)initWithMediaRequirement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceMediaRequirement;
  v4 = -[BWInferenceDataRequirement initWithDataRequirement:](&v6, sel_initWithDataRequirement_);
  if (v4)
  {
    v4->_attachedMediaKey = (NSString *)objc_msgSend((id)objc_msgSend(a3, "attachedMediaKey"), "copy");
    v4->_count = [a3 count];
  }
  return v4;
}

- (unint64_t)count
{
  return self->_count;
}

- (BWInferenceMediaRequirement)initWithAttachedMediaKey:(id)a3 count:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceMediaRequirement;
  objc_super v6 = [(BWInferenceDataRequirement *)&v8 init];
  if (v6)
  {
    v6->_attachedMediaKey = (NSString *)[a3 copy];
    v6->_count = a4;
  }
  return v6;
}

- (BWInferenceMediaRequirement)initWithAttachedMediaKey:(id)a3
{
  return [(BWInferenceMediaRequirement *)self initWithAttachedMediaKey:a3 count:1];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceMediaRequirement;
  [(BWInferenceMediaRequirement *)&v3 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@(%ld) %p; attachedMediaKey %@; count = %lu>",
               objc_opt_class(),
               [(BWInferenceDataRequirement *)self identifier],
               self,
               self->_attachedMediaKey,
               self->_count);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithMediaRequirement:self];
}

@end