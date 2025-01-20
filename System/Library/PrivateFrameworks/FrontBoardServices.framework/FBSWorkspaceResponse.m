@interface FBSWorkspaceResponse
- (FBSSceneMessage)message;
- (FBSWorkspaceResponse)initWithXPCDictionary:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation FBSWorkspaceResponse

- (void).cxx_destruct
{
}

- (FBSSceneMessage)message
{
  return self->_message;
}

- (FBSWorkspaceResponse)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FBSWorkspaceResponse;
  if ([(FBSWorkspaceResponse *)&v6 init]) {
    BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  }

  return 0;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  if (a3) {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
}

- (void)setMessage:(id)a3
{
}

@end