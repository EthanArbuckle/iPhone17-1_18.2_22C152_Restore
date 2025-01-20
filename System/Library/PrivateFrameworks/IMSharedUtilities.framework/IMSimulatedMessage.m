@interface IMSimulatedMessage
+ (BOOL)supportsSecureCoding;
- (IMMessageItem)item;
- (IMSimulatedMessage)initWithCoder:(id)a3;
- (IMSimulatedMessage)initWithIMRemoteObjectSerializedDictionary:(id)a3;
- (NSArray)handles;
- (NSString)chatGUID;
- (NSString)groupID;
- (NSString)guid;
- (NSString)lastAddressedHandle;
- (id)_copyDictionaryRepresentation;
- (id)_initWithDictionaryRepresentation:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3;
- (void)setChatGUID:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setHandles:(id)a3;
- (void)setItem:(id)a3;
- (void)setLastAddressedHandle:(id)a3;
@end

@implementation IMSimulatedMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IMSimulatedMessage *)self item];
  [v4 encodeObject:v5 forKey:@"item"];

  v6 = [(IMSimulatedMessage *)self groupID];
  [v4 encodeObject:v6 forKey:@"groupID"];

  v7 = [(IMSimulatedMessage *)self chatGUID];
  [v4 encodeObject:v7 forKey:@"chatGUID"];

  v8 = [(IMSimulatedMessage *)self handles];
  [v4 encodeObject:v8 forKey:@"handles"];

  id v9 = [(IMSimulatedMessage *)self lastAddressedHandle];
  [v4 encodeObject:v9 forKey:@"lastAddressedHandle"];
}

- (IMSimulatedMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"item"];
  [(IMSimulatedMessage *)self setItem:v5];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
  [(IMSimulatedMessage *)self setGroupID:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chatGUID"];
  [(IMSimulatedMessage *)self setChatGUID:v7];

  v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"handles"];
  [(IMSimulatedMessage *)self setHandles:v8];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastAddressedHandle"];

  [(IMSimulatedMessage *)self setLastAddressedHandle:v9];
  return self;
}

- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(IMSimulatedMessage *)self _copyDictionaryRepresentation];
  [v4 setValuesForKeysWithDictionary:v5];
}

- (IMSimulatedMessage)initWithIMRemoteObjectSerializedDictionary:(id)a3
{
  return (IMSimulatedMessage *)MEMORY[0x1F4181798](self, sel__initWithDictionaryRepresentation_);
}

- (id)_initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMSimulatedMessage;
  id v5 = [(IMSimulatedMessage *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc(+[IMItem classForMessageItemDictionary:v4]);
    v7 = [v4 objectForKeyedSubscript:@"item"];
    v8 = (void *)[v6 initWithDictionary:v7];
    [(IMSimulatedMessage *)v5 setItem:v8];

    id v9 = [v4 objectForKeyedSubscript:@"groupID"];
    [(IMSimulatedMessage *)v5 setGroupID:v9];

    v10 = [v4 objectForKeyedSubscript:@"chatGUID"];
    [(IMSimulatedMessage *)v5 setChatGUID:v10];

    v11 = [v4 objectForKeyedSubscript:@"handles"];
    [(IMSimulatedMessage *)v5 setHandles:v11];

    v12 = [v4 objectForKeyedSubscript:@"lastAddressedHandle"];
    [(IMSimulatedMessage *)v5 setLastAddressedHandle:v12];
  }
  return v5;
}

- (id)_copyDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(IMSimulatedMessage *)self item];
  [v3 setObject:v4 forKeyedSubscript:@"item"];

  id v5 = [(IMSimulatedMessage *)self groupID];

  if (v5)
  {
    id v6 = [(IMSimulatedMessage *)self groupID];
    [v3 setObject:v6 forKeyedSubscript:@"groupID"];
  }
  v7 = [(IMSimulatedMessage *)self chatGUID];

  if (v7)
  {
    v8 = [(IMSimulatedMessage *)self chatGUID];
    [v3 setObject:v8 forKeyedSubscript:@"chatGUID"];
  }
  id v9 = [(IMSimulatedMessage *)self handles];

  if (v9)
  {
    v10 = [(IMSimulatedMessage *)self handles];
    [v3 setObject:v10 forKeyedSubscript:@"handles"];
  }
  v11 = [(IMSimulatedMessage *)self lastAddressedHandle];

  if (v11)
  {
    v12 = [(IMSimulatedMessage *)self lastAddressedHandle];
    [v3 setObject:v12 forKeyedSubscript:@"lastAddressedHandle"];
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (NSString)guid
{
  v2 = [(IMSimulatedMessage *)self item];
  id v3 = [v2 guid];

  return (NSString *)v3;
}

- (IMMessageItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void)setChatGUID:(id)a3
{
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (NSString)lastAddressedHandle
{
  return self->_lastAddressedHandle;
}

- (void)setLastAddressedHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAddressedHandle, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_chatGUID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end