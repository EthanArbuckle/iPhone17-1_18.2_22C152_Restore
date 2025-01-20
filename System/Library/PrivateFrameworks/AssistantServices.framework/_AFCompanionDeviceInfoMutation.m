@interface _AFCompanionDeviceInfoMutation
- (BOOL)getMeDevice;
- (BOOL)getMuxSupportCapability;
- (BOOL)getPeerToPeerHandoffCapability;
- (BOOL)getSyncMetadataCapability;
- (BOOL)isDirty;
- (_AFCompanionDeviceInfoMutation)initWithBase:(id)a3;
- (id)getAceHost;
- (id)getAssistantID;
- (id)getIdsIdentifier;
- (id)getProductPrefix;
- (id)getSiriLanguage;
- (id)getSpeechID;
- (id)getSyncMetadata;
- (void)setAceHost:(id)a3;
- (void)setAssistantID:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMeDevice:(BOOL)a3;
- (void)setMuxSupportCapability:(BOOL)a3;
- (void)setPeerToPeerHandoffCapability:(BOOL)a3;
- (void)setProductPrefix:(id)a3;
- (void)setSiriLanguage:(id)a3;
- (void)setSpeechID:(id)a3;
- (void)setSyncMetadata:(id)a3;
- (void)setSyncMetadataCapability:(BOOL)a3;
@end

@implementation _AFCompanionDeviceInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriLanguage, 0);
  objc_storeStrong((id *)&self->_syncMetadata, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_productPrefix, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_speechID, 0);
  objc_storeStrong((id *)&self->_assistantID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setSiriLanguage:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getSiriLanguage
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_siriLanguage;
  }
  else
  {
    v2 = [(AFCompanionDeviceInfo *)self->_base siriLanguage];
  }
  return v2;
}

- (void)setMeDevice:(BOOL)a3
{
  self->_meDevice = a3;
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (BOOL)getMeDevice
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0) {
    return self->_meDevice;
  }
  else {
    return [(AFCompanionDeviceInfo *)self->_base meDevice];
  }
}

- (void)setMuxSupportCapability:(BOOL)a3
{
  self->_muxSupportCapability = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (BOOL)getMuxSupportCapability
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0) {
    return self->_muxSupportCapability;
  }
  else {
    return [(AFCompanionDeviceInfo *)self->_base muxSupportCapability];
  }
}

- (void)setPeerToPeerHandoffCapability:(BOOL)a3
{
  self->_peerToPeerHandoffCapability = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (BOOL)getPeerToPeerHandoffCapability
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_peerToPeerHandoffCapability;
  }
  else {
    return [(AFCompanionDeviceInfo *)self->_base peerToPeerHandoffCapability];
  }
}

- (void)setSyncMetadataCapability:(BOOL)a3
{
  self->_syncMetadataCapability = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getSyncMetadataCapability
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    return self->_syncMetadataCapability;
  }
  else {
    return [(AFCompanionDeviceInfo *)self->_base syncMetadataCapability];
  }
}

- (void)setSyncMetadata:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getSyncMetadata
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_syncMetadata;
  }
  else
  {
    v2 = [(AFCompanionDeviceInfo *)self->_base syncMetadata];
  }
  return v2;
}

- (void)setAceHost:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getAceHost
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_aceHost;
  }
  else
  {
    v2 = [(AFCompanionDeviceInfo *)self->_base aceHost];
  }
  return v2;
}

- (void)setProductPrefix:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getProductPrefix
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_productPrefix;
  }
  else
  {
    v2 = [(AFCompanionDeviceInfo *)self->_base productPrefix];
  }
  return v2;
}

- (void)setIdsIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getIdsIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_idsIdentifier;
  }
  else
  {
    v2 = [(AFCompanionDeviceInfo *)self->_base idsIdentifier];
  }
  return v2;
}

- (void)setSpeechID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getSpeechID
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_speechID;
  }
  else
  {
    v2 = [(AFCompanionDeviceInfo *)self->_base speechID];
  }
  return v2;
}

- (void)setAssistantID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getAssistantID
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_assistantID;
  }
  else
  {
    v2 = [(AFCompanionDeviceInfo *)self->_base assistantID];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFCompanionDeviceInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFCompanionDeviceInfoMutation;
  v6 = [(_AFCompanionDeviceInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end