@interface AFConversationInsertion
- (AFConversationInsertion)initWithConversationItemType:(int64_t)a3 aceObject:(id)a4 aceCommandIdentifier:(id)a5 transient:(BOOL)a6 supplemental:(BOOL)a7 immersiveExperience:(BOOL)a8 persistentAcrossInvocations:(BOOL)a9 indexPath:(id)a10;
- (AceObject)aceObject;
- (BOOL)isImmersiveExperience;
- (BOOL)isPersistentAcrossInvocations;
- (BOOL)isSupplemental;
- (BOOL)isTransient;
- (NSIndexPath)indexPath;
- (NSString)aceCommandIdentifier;
- (int64_t)conversationItemType;
@end

@implementation AFConversationInsertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_aceCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_aceObject, 0);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (BOOL)isPersistentAcrossInvocations
{
  return self->_persistentAcrossInvocations;
}

- (BOOL)isImmersiveExperience
{
  return self->_immersiveExperience;
}

- (BOOL)isSupplemental
{
  return self->_supplemental;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (NSString)aceCommandIdentifier
{
  return self->_aceCommandIdentifier;
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (int64_t)conversationItemType
{
  return self->_conversationItemType;
}

- (AFConversationInsertion)initWithConversationItemType:(int64_t)a3 aceObject:(id)a4 aceCommandIdentifier:(id)a5 transient:(BOOL)a6 supplemental:(BOOL)a7 immersiveExperience:(BOOL)a8 persistentAcrossInvocations:(BOOL)a9 indexPath:(id)a10
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)AFConversationInsertion;
  v20 = [(AFConversationInsertion *)&v27 init];
  v21 = v20;
  if (v20)
  {
    v20->_conversationItemType = a3;
    objc_storeStrong((id *)&v20->_aceObject, a4);
    uint64_t v22 = [v18 copy];
    aceCommandIdentifier = v21->_aceCommandIdentifier;
    v21->_aceCommandIdentifier = (NSString *)v22;

    v21->_transient = a6;
    v21->_supplemental = a7;
    v21->_immersiveExperience = a8;
    v21->_persistentAcrossInvocations = a9;
    uint64_t v24 = [v19 copy];
    indexPath = v21->_indexPath;
    v21->_indexPath = (NSIndexPath *)v24;
  }
  return v21;
}

@end