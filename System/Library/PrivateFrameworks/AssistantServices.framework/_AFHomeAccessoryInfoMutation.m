@interface _AFHomeAccessoryInfoMutation
- (BOOL)getHasActiveThirdPartyMusicSubscription;
- (BOOL)getIsSpeaker;
- (BOOL)isDirty;
- (_AFHomeAccessoryInfoMutation)initWithBase:(id)a3;
- (id)getAssistantIdentifier;
- (id)getCategoryType;
- (id)getLoggingUniqueIdentifier;
- (id)getManufacturer;
- (id)getModel;
- (id)getName;
- (id)getRoomName;
- (id)getUniqueIdentifier;
- (int64_t)getSchemaCategoryType;
- (void)setAssistantIdentifier:(id)a3;
- (void)setCategoryType:(id)a3;
- (void)setHasActiveThirdPartyMusicSubscription:(BOOL)a3;
- (void)setIsSpeaker:(BOOL)a3;
- (void)setLoggingUniqueIdentifier:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setSchemaCategoryType:(int64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation _AFHomeAccessoryInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_loggingUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setSchemaCategoryType:(int64_t)a3
{
  self->_schemaCategoryType = a3;
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (int64_t)getSchemaCategoryType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0) {
    return self->_schemaCategoryType;
  }
  else {
    return [(AFHomeAccessoryInfo *)self->_base schemaCategoryType];
  }
}

- (void)setCategoryType:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getCategoryType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_categoryType;
  }
  else
  {
    v2 = [(AFHomeAccessoryInfo *)self->_base categoryType];
  }
  return v2;
}

- (void)setManufacturer:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getManufacturer
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_manufacturer;
  }
  else
  {
    v2 = [(AFHomeAccessoryInfo *)self->_base manufacturer];
  }
  return v2;
}

- (void)setHasActiveThirdPartyMusicSubscription:(BOOL)a3
{
  self->_hasActiveThirdPartyMusicSubscription = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (BOOL)getHasActiveThirdPartyMusicSubscription
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_hasActiveThirdPartyMusicSubscription;
  }
  else {
    return [(AFHomeAccessoryInfo *)self->_base hasActiveThirdPartyMusicSubscription];
  }
}

- (void)setIsSpeaker:(BOOL)a3
{
  self->_isSpeaker = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getIsSpeaker
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    return self->_isSpeaker;
  }
  else {
    return [(AFHomeAccessoryInfo *)self->_base isSpeaker];
  }
}

- (void)setAssistantIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getAssistantIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_assistantIdentifier;
  }
  else
  {
    v2 = [(AFHomeAccessoryInfo *)self->_base assistantIdentifier];
  }
  return v2;
}

- (void)setRoomName:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getRoomName
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_roomName;
  }
  else
  {
    v2 = [(AFHomeAccessoryInfo *)self->_base roomName];
  }
  return v2;
}

- (void)setModel:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getModel
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_model;
  }
  else
  {
    v2 = [(AFHomeAccessoryInfo *)self->_base model];
  }
  return v2;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getName
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_name;
  }
  else
  {
    v2 = [(AFHomeAccessoryInfo *)self->_base name];
  }
  return v2;
}

- (void)setLoggingUniqueIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getLoggingUniqueIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_loggingUniqueIdentifier;
  }
  else
  {
    v2 = [(AFHomeAccessoryInfo *)self->_base loggingUniqueIdentifier];
  }
  return v2;
}

- (void)setUniqueIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getUniqueIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_uniqueIdentifier;
  }
  else
  {
    v2 = [(AFHomeAccessoryInfo *)self->_base uniqueIdentifier];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFHomeAccessoryInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeAccessoryInfoMutation;
  v6 = [(_AFHomeAccessoryInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end