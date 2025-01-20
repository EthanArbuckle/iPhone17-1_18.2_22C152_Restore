@interface AFSiriHomeAutomationRequestInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSiriHomeAutomationRequestInfo)initWithCoder:(id)a3;
- (AFSiriHomeAutomationRequestInfo)initWithContext:(id)a3;
- (AFSiriHomeAutomationRequestInfo)initWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)context;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSiriHomeAutomationRequestInfo

- (void).cxx_destruct
{
}

- (NSData)context
{
  return self->_context;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AFSiriHomeAutomationRequestInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSiriHomeAutomationRequestInfo::context"];

  v6 = [(AFSiriHomeAutomationRequestInfo *)self initWithContext:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSiriHomeAutomationRequestInfo *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(AFSiriHomeAutomationRequestInfo *)v4 context];
      context = self->_context;
      BOOL v7 = context == v5 || [(NSData *)context isEqual:v5];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSData *)self->_context hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFSiriHomeAutomationRequestInfo;
  v5 = [(AFSiriHomeAutomationRequestInfo *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {context = (%llu bytes)}", v5, -[NSData length](self->_context, "length")];

  return v6;
}

- (id)description
{
  return [(AFSiriHomeAutomationRequestInfo *)self _descriptionWithIndent:0];
}

- (AFSiriHomeAutomationRequestInfo)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriHomeAutomationRequestInfo;
  v5 = [(AFSiriHomeAutomationRequestInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (NSData *)v6;
  }
  return v5;
}

- (AFSiriHomeAutomationRequestInfo)initWithIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10 = @"identifier";
  v11[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6];

  objc_super v8 = [(AFSiriHomeAutomationRequestInfo *)self initWithContext:v7];
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFSiriHomeAutomationRequestInfoMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFSiriHomeAutomationRequestInfoMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_AFSiriHomeAutomationRequestInfoMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(AFSiriHomeAutomationRequestInfo *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _AFSiriHomeAutomationRequestInfoMutation *))a3;
  id v4 = objc_alloc_init(_AFSiriHomeAutomationRequestInfoMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = [(_AFSiriHomeAutomationRequestInfoMutation *)v4 generate];

  return v5;
}

@end