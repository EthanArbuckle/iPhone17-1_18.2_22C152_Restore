@interface NEPolicySessionFileHandle
- (NEPolicySessionFileHandle)initWithPolicySession:(id)a3;
- (NEPolicySessionFileHandle)initWithPolicySession:(id)a3 name:(id)a4;
- (NSString)name;
- (id)description;
- (id)dictionary;
- (id)initFromDictionary:(id)a3;
- (unint64_t)type;
@end

@implementation NEPolicySessionFileHandle

- (void).cxx_destruct
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)type
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v4 = [(NEPolicySessionFileHandle *)self name];
  v5 = [(NEFileHandle *)self handle];
  v6 = [v3 stringWithFormat:@"Policy Session %@ socket (%d)", v4, objc_msgSend(v5, "fileDescriptor")];

  return v6;
}

- (id)dictionary
{
  v6.receiver = self;
  v6.super_class = (Class)NEPolicySessionFileHandle;
  v3 = [(NEFileHandle *)&v6 dictionary];
  if (v3)
  {
    name = self->_name;
    if (name) {
      xpc_dictionary_set_string(v3, "session-name", [(NSString *)name UTF8String]);
    }
  }

  return v3;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEPolicySessionFileHandle;
  v5 = [(NEFileHandle *)&v10 initFromDictionary:v4];
  if (v5)
  {
    string = xpc_dictionary_get_string(v4, "session-name");
    if (string)
    {
      uint64_t v7 = [[NSString alloc] initWithCString:string encoding:4];
      v8 = (void *)v5[3];
      v5[3] = v7;
    }
  }

  return v5;
}

- (NEPolicySessionFileHandle)initWithPolicySession:(id)a3 name:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [a3 dupSocket];
  if ((v8 & 0x80000000) != 0)
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NEPolicySessionFileHandle;
    v9 = [(NEFileHandle *)&v13 initWithFileDescriptor:v8 launchOwnerWhenReadable:0];
    objc_super v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_name, a4);
    }
    self = v10;
    v11 = self;
  }

  return v11;
}

- (NEPolicySessionFileHandle)initWithPolicySession:(id)a3
{
  return [(NEPolicySessionFileHandle *)self initWithPolicySession:a3 name:@"default"];
}

@end