@interface HDUserDomainConceptPersistableProcessingState
+ (BOOL)fetchFromKeyValueDomain:(id)a3 stateOut:(id *)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
- (BOOL)persistInKeyValueDomain:(id)a3 error:(id *)a4;
- (HDUserDomainConceptPersistableProcessingState)init;
- (HDUserDomainConceptPersistableProcessingState)initWithAnchor:(int64_t)a3 ontologyVersion:(int64_t)a4 maximumPropertyType:(int64_t)a5;
- (HDUserDomainConceptPersistableProcessingState)initWithCoder:(id)a3;
- (int64_t)anchor;
- (int64_t)maximumPropertyType;
- (int64_t)ontologyVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDUserDomainConceptPersistableProcessingState

- (HDUserDomainConceptPersistableProcessingState)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDUserDomainConceptPersistableProcessingState)initWithAnchor:(int64_t)a3 ontologyVersion:(int64_t)a4 maximumPropertyType:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HDUserDomainConceptPersistableProcessingState;
  result = [(HDUserDomainConceptPersistableProcessingState *)&v9 init];
  if (result)
  {
    result->_anchor = a3;
    result->_ontologyVersion = a4;
    result->_maximumPropertyType = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDUserDomainConceptPersistableProcessingState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HDUserDomainConceptPersistableProcessingState;
  v5 = [(HDUserDomainConceptPersistableProcessingState *)&v7 init];
  if (v5)
  {
    v5->_anchor = [v4 decodeInt64ForKey:@"Anchor"];
    v5->_ontologyVersion = [v4 decodeIntegerForKey:@"OntologyVersion"];
    v5->_maximumPropertyType = [v4 decodeIntegerForKey:@"MaximumPropertyType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t anchor = self->_anchor;
  id v5 = a3;
  [v5 encodeInt64:anchor forKey:@"Anchor"];
  [v5 encodeInteger:self->_ontologyVersion forKey:@"OntologyVersion"];
  [v5 encodeInteger:self->_maximumPropertyType forKey:@"MaximumPropertyType"];
}

+ (BOOL)fetchFromKeyValueDomain:(id)a3 stateOut:(id *)a4 error:(id *)a5
{
  id v12 = 0;
  objc_super v7 = [a3 dataForKey:@"LastProcessedUserDomainConceptStateKey" error:&v12];
  id v8 = v12;
  objc_super v9 = v8;
  if (v7)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:0];
    }
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_7:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  if (a5)
  {
    BOOL v10 = 0;
    *a5 = v8;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v10 = 0;
  }
LABEL_8:

  return v10;
}

- (BOOL)persistInKeyValueDomain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
  if (v7) {
    char v8 = [v6 setData:v7 forKey:@"LastProcessedUserDomainConceptStateKey" error:a4];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (int64_t)anchor
{
  return self->_anchor;
}

- (int64_t)ontologyVersion
{
  return self->_ontologyVersion;
}

- (int64_t)maximumPropertyType
{
  return self->_maximumPropertyType;
}

@end