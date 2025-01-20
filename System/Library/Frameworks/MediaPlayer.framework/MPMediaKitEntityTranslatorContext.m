@interface MPMediaKitEntityTranslatorContext
- (MPMediaKitEntityRelationshipPayloadProvider)relationshipPayloadProvider;
- (NSString)personID;
- (void)setPersonID:(id)a3;
- (void)setRelationshipPayloadProvider:(id)a3;
@end

@implementation MPMediaKitEntityTranslatorContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipPayloadProvider, 0);

  objc_storeStrong((id *)&self->_personID, 0);
}

- (void)setRelationshipPayloadProvider:(id)a3
{
}

- (MPMediaKitEntityRelationshipPayloadProvider)relationshipPayloadProvider
{
  return self->_relationshipPayloadProvider;
}

- (void)setPersonID:(id)a3
{
}

- (NSString)personID
{
  return self->_personID;
}

@end