@interface GDGraphVisualIdentifierRelationship
- (GDGraphVisualIdentifierRelationship)initWithVisualIdentifierField:(id)a3 associationReasonField:(id)a4 suggestedNameField:(id)a5 suggestedRelationshipToDeviceOwnerField:(id)a6 allVisualIdentifierField:(id)a7 allAssociationReasonField:(id)a8 allSuggestedNameField:(id)a9 allSuggestedRelationshipToDeviceOwnerField:(id)a10;
- (NSArray)allAssociationReason;
- (NSArray)allSuggestedName;
- (NSArray)allSuggestedRelationshipToDeviceOwner;
- (NSArray)allVisualIdentifier;
- (NSString)associationReason;
- (NSString)suggestedName;
- (NSString)suggestedRelationshipToDeviceOwner;
- (NSString)visualIdentifier;
@end

@implementation GDGraphVisualIdentifierRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSuggestedRelationshipToDeviceOwner, 0);
  objc_storeStrong((id *)&self->_allSuggestedName, 0);
  objc_storeStrong((id *)&self->_allAssociationReason, 0);
  objc_storeStrong((id *)&self->_allVisualIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedRelationshipToDeviceOwner, 0);
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->_associationReason, 0);

  objc_storeStrong((id *)&self->_visualIdentifier, 0);
}

- (NSArray)allSuggestedRelationshipToDeviceOwner
{
  return self->_allSuggestedRelationshipToDeviceOwner;
}

- (NSArray)allSuggestedName
{
  return self->_allSuggestedName;
}

- (NSArray)allAssociationReason
{
  return self->_allAssociationReason;
}

- (NSArray)allVisualIdentifier
{
  return self->_allVisualIdentifier;
}

- (NSString)suggestedRelationshipToDeviceOwner
{
  return self->_suggestedRelationshipToDeviceOwner;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (NSString)associationReason
{
  return self->_associationReason;
}

- (NSString)visualIdentifier
{
  return self->_visualIdentifier;
}

- (GDGraphVisualIdentifierRelationship)initWithVisualIdentifierField:(id)a3 associationReasonField:(id)a4 suggestedNameField:(id)a5 suggestedRelationshipToDeviceOwnerField:(id)a6 allVisualIdentifierField:(id)a7 allAssociationReasonField:(id)a8 allSuggestedNameField:(id)a9 allSuggestedRelationshipToDeviceOwnerField:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)GDGraphVisualIdentifierRelationship;
  v18 = [(GDGraphVisualIdentifierRelationship *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_visualIdentifier, a3);
    objc_storeStrong((id *)&v19->_associationReason, a4);
    objc_storeStrong((id *)&v19->_suggestedName, a5);
    objc_storeStrong((id *)&v19->_suggestedRelationshipToDeviceOwner, a6);
    objc_storeStrong((id *)&v19->_allVisualIdentifier, a7);
    objc_storeStrong((id *)&v19->_allAssociationReason, a8);
    objc_storeStrong((id *)&v19->_allSuggestedName, a9);
    objc_storeStrong((id *)&v19->_allSuggestedRelationshipToDeviceOwner, a10);
  }

  return v19;
}

@end