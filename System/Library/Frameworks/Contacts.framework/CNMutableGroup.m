@interface CNMutableGroup
- (NSData)externalRepresentation;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)externalIdentifier;
- (NSString)externalModificationTag;
- (NSString)externalUUID;
- (NSString)identifier;
- (NSString)name;
- (id)copy;
- (id)freeze;
- (id)freezeWithSelfAsSnapshot;
- (int)iOSLegacyIdentifier;
- (void)adoptValuesFromAndSetSnapshot:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalRepresentation:(id)a3;
- (void)setExternalUUID:(id)a3;
- (void)setIOSLegacyIdentifier:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setName:(NSString *)name;
- (void)setSnapshot:(id)a3;
@end

@implementation CNMutableGroup

- (id)copy
{
  v3 = [CNGroup alloc];

  return [(CNGroup *)v3 initWithGroup:self];
}

- (NSString)identifier
{
  return self->super._identifier;
}

- (void)setIdentifier:(id)a3
{
  if (self->super._identifier != a3)
  {
    self->super._identifier = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)name
{
  return self->super._name;
}

- (void)setName:(NSString *)name
{
  if (self->super._name != name)
  {
    self->super._name = (NSString *)[(NSString *)name copy];
    MEMORY[0x1F41817F8]();
  }
}

- (int)iOSLegacyIdentifier
{
  return self->super._iOSLegacyIdentifier;
}

- (void)setIOSLegacyIdentifier:(int)a3
{
  self->super._iOSLegacyIdentifier = a3;
}

- (NSDate)creationDate
{
  return self->super._creationDate;
}

- (void)setCreationDate:(id)a3
{
  if (self->super._creationDate != a3)
  {
    self->super._creationDate = (NSDate *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSDate)modificationDate
{
  return self->super._modificationDate;
}

- (void)setModificationDate:(id)a3
{
  if (self->super._modificationDate != a3)
  {
    self->super._modificationDate = (NSDate *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)externalIdentifier
{
  return self->super._externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
  if (self->super._externalIdentifier != a3)
  {
    self->super._externalIdentifier = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSData)externalRepresentation
{
  return self->super._externalRepresentation;
}

- (void)setExternalRepresentation:(id)a3
{
  if (self->super._externalRepresentation != a3)
  {
    self->super._externalRepresentation = (NSData *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)externalModificationTag
{
  return self->super._externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
  if (self->super._externalModificationTag != a3)
  {
    self->super._externalModificationTag = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)externalUUID
{
  return self->super._externalUUID;
}

- (void)setExternalUUID:(id)a3
{
  if (self->super._externalUUID != a3)
  {
    self->super._externalUUID = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)adoptValuesFromAndSetSnapshot:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    v4 = [v12 name];
    [(CNMutableGroup *)self setName:v4];

    v5 = [v12 identifier];
    [(CNMutableGroup *)self setIdentifier:v5];

    -[CNMutableGroup setIOSLegacyIdentifier:](self, "setIOSLegacyIdentifier:", [v12 iOSLegacyIdentifier]);
    v6 = [v12 creationDate];
    [(CNMutableGroup *)self setCreationDate:v6];

    v7 = [v12 modificationDate];
    [(CNMutableGroup *)self setModificationDate:v7];

    v8 = [v12 externalIdentifier];
    [(CNMutableGroup *)self setExternalIdentifier:v8];

    v9 = [v12 externalRepresentation];
    [(CNMutableGroup *)self setExternalRepresentation:v9];

    v10 = [v12 externalModificationTag];
    [(CNMutableGroup *)self setExternalModificationTag:v10];

    v11 = [v12 externalUUID];
    [(CNMutableGroup *)self setExternalUUID:v11];
  }
  [(CNMutableGroup *)self setSnapshot:v12];
}

- (void)setSnapshot:(id)a3
{
  snapshot = self->super._snapshot;
  if (snapshot != a3)
  {
    self->super._snapshot = 0;
    id v5 = a3;

    v6 = (CNGroup *)[v5 copy];
    v7 = self->super._snapshot;
    self->super._snapshot = v6;
  }
}

- (id)freeze
{
  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

- (id)freezeWithSelfAsSnapshot
{
  v3 = [MEMORY[0x1E4F1CA98] null];
  [(CNMutableGroup *)self setSnapshot:v3];

  return [(CNMutableGroup *)self freeze];
}

@end