@interface ACActivityContentUpdate
- (ACActivityContent)content;
- (ACActivityContentUpdate)initWithIdentifier:(id)a3 descriptor:(id)a4 state:(int64_t)a5 content:(id)a6;
- (ACActivityDescriptor)descriptor;
- (NSString)identifier;
- (int64_t)state;
@end

@implementation ACActivityContentUpdate

- (ACActivityContentUpdate)initWithIdentifier:(id)a3 descriptor:(id)a4 state:(int64_t)a5 content:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ACActivityContentUpdate;
  v13 = [(ACActivityContentUpdate *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    descriptor = v13->_descriptor;
    v13->_descriptor = (ACActivityDescriptor *)v16;

    v13->_state = a5;
    uint64_t v18 = [v12 copy];
    content = v13->_content;
    v13->_content = (ACActivityContent *)v18;
  }
  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (ACActivityDescriptor)descriptor
{
  return self->_descriptor;
}

- (ACActivityContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end