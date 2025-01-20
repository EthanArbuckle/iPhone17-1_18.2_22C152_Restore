@interface BWInferenceMetadataRequirement
- (BWInferenceMetadataRequirement)initWithMetadataKeys:(id)a3;
- (BWInferenceMetadataRequirement)initWithMetadataKeys:(id)a3 mappingOption:(signed __int16)a4;
- (BWInferenceMetadataRequirement)initWithMetadataRequirement:(id)a3;
- (NSArray)metadataKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (signed)mappingOption;
- (void)dealloc;
@end

@implementation BWInferenceMetadataRequirement

- (BWInferenceMetadataRequirement)initWithMetadataRequirement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceMetadataRequirement;
  v4 = -[BWInferenceDataRequirement initWithDataRequirement:](&v6, sel_initWithDataRequirement_);
  if (v4)
  {
    v4->_metadataKeys = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "metadataKeys"), "copy");
    v4->_mappingOption = [a3 mappingOption];
  }
  return v4;
}

- (NSArray)metadataKeys
{
  return self->_metadataKeys;
}

- (signed)mappingOption
{
  return self->_mappingOption;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithMetadataRequirement:self];
}

- (BWInferenceMetadataRequirement)initWithMetadataKeys:(id)a3
{
  return [(BWInferenceMetadataRequirement *)self initWithMetadataKeys:a3 mappingOption:0];
}

- (BWInferenceMetadataRequirement)initWithMetadataKeys:(id)a3 mappingOption:(signed __int16)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceMetadataRequirement;
  objc_super v6 = [(BWInferenceDataRequirement *)&v8 init];
  if (v6)
  {
    v6->_metadataKeys = (NSArray *)[a3 copy];
    v6->_mappingOption = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceMetadataRequirement;
  [(BWInferenceMetadataRequirement *)&v3 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@(%ld) %p; metadataKeys = %@; mappingOption = %d>",
               objc_opt_class(),
               [(BWInferenceDataRequirement *)self identifier],
               self,
               self->_metadataKeys,
               self->_mappingOption);
}

@end