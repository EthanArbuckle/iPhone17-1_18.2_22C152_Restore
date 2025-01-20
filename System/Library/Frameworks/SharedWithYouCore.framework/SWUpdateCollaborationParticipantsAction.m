@interface SWUpdateCollaborationParticipantsAction
+ (BOOL)supportsSecureCoding;
+ (SWUpdateCollaborationParticipantsAction)actionWithMetadata:(id)a3 addedIdentities:(id)a4 removedIdentites:(id)a5;
- (BOOL)isEqualToAction:(id)a3;
- (NSArray)addedIdentities;
- (NSArray)removedIdentities;
- (SWCollaborationMetadata)collaborationMetadata;
- (SWUpdateCollaborationParticipantsAction)initWithCoder:(id)a3;
- (SWUpdateCollaborationParticipantsAction)initWithDestinationAction:(id)a3;
- (SWUpdateCollaborationParticipantsAction)initWithMetadata:(id)a3 addedIdentities:(id)a4 removedIdentites:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithBSActionSettings:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAddedIdentities:(id)a3;
- (void)setCollaborationMetadata:(id)a3;
- (void)setRemovedIdentities:(id)a3;
@end

@implementation SWUpdateCollaborationParticipantsAction

+ (SWUpdateCollaborationParticipantsAction)actionWithMetadata:(id)a3 addedIdentities:(id)a4 removedIdentites:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMetadata:v9 addedIdentities:v8 removedIdentites:v7];

  return (SWUpdateCollaborationParticipantsAction *)v10;
}

- (SWUpdateCollaborationParticipantsAction)initWithMetadata:(id)a3 addedIdentities:(id)a4 removedIdentites:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  v12 = [(SWAction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collaborationMetadata, a3);
    objc_storeStrong((id *)&v13->_addedIdentities, a4);
    objc_storeStrong((id *)&v13->_removedIdentities, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWUpdateCollaborationParticipantsAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  v5 = [(SWAction *)&v27 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = NSStringFromSelector(sel_collaborationMetadata);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    collaborationMetadata = v5->_collaborationMetadata;
    v5->_collaborationMetadata = (SWCollaborationMetadata *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    objc_super v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v16 = NSStringFromSelector(sel_addedIdentities);
    uint64_t v17 = [v4 decodeObjectOfClasses:v15 forKey:v16];
    addedIdentities = v5->_addedIdentities;
    v5->_addedIdentities = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    v23 = NSStringFromSelector(sel_removedIdentities);
    uint64_t v24 = [v4 decodeObjectOfClasses:v22 forKey:v23];
    removedIdentities = v5->_removedIdentities;
    v5->_removedIdentities = (NSArray *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  id v4 = a3;
  [(SWAction *)&v11 encodeWithCoder:v4];
  v5 = [(SWUpdateCollaborationParticipantsAction *)self collaborationMetadata];
  v6 = NSStringFromSelector(sel_collaborationMetadata);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(SWUpdateCollaborationParticipantsAction *)self addedIdentities];
  id v8 = NSStringFromSelector(sel_addedIdentities);
  [v4 encodeObject:v7 forKey:v8];

  id v9 = [(SWUpdateCollaborationParticipantsAction *)self removedIdentities];
  uint64_t v10 = NSStringFromSelector(sel_removedIdentities);
  [v4 encodeObject:v9 forKey:v10];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  id v4 = [(SWAction *)&v9 copyWithZone:a3];
  if (v4)
  {
    v5 = [(SWUpdateCollaborationParticipantsAction *)self collaborationMetadata];
    [v4 setCollaborationMetadata:v5];

    v6 = [(SWUpdateCollaborationParticipantsAction *)self addedIdentities];
    [v4 setAddedIdentities:v6];

    uint64_t v7 = [(SWUpdateCollaborationParticipantsAction *)self removedIdentities];
    [v4 setRemovedIdentities:v7];
  }
  return v4;
}

- (BOOL)isEqualToAction:(id)a3
{
  id v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  if (![(SWAction *)&v29 isEqualToAction:v8]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v13 = 0;
    goto LABEL_32;
  }
  id v9 = v8;
  uint64_t v10 = [(SWUpdateCollaborationParticipantsAction *)self collaborationMetadata];
  if (v10 || ([v9 collaborationMetadata], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(SWUpdateCollaborationParticipantsAction *)self collaborationMetadata];
    objc_super v11 = [v9 collaborationMetadata];
    if (([v4 isEqual:v11] & 1) == 0)
    {

      char v13 = 0;
      goto LABEL_29;
    }
    v28 = v11;
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  uint64_t v14 = [(SWUpdateCollaborationParticipantsAction *)self addedIdentities];
  if (!v14)
  {
    v23 = [v9 addedIdentities];
    if (!v23)
    {
      int v26 = 0;
      int v27 = v12;
      v23 = 0;
      goto LABEL_20;
    }
  }
  v6 = [(SWUpdateCollaborationParticipantsAction *)self addedIdentities];
  v5 = [v9 addedIdentities];
  if ([v6 isEqual:v5])
  {
    int v26 = 1;
    int v27 = v12;
LABEL_20:
    objc_super v15 = [(SWUpdateCollaborationParticipantsAction *)self removedIdentities];
    if (v15 || ([v9 removedIdentities], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v24 = v4;
      v25 = v3;
      v16 = [(SWUpdateCollaborationParticipantsAction *)self removedIdentities];
      uint64_t v17 = [v9 removedIdentities];
      char v13 = [v16 isEqual:v17];

      if (v15)
      {

        id v4 = v24;
        v3 = v25;
        int v18 = v27;
        if (!v26) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      id v4 = v24;
      v3 = v25;
      int v18 = v27;
      uint64_t v20 = v22;
    }
    else
    {
      uint64_t v20 = 0;
      char v13 = 1;
      int v18 = v27;
    }

    if ((v26 & 1) == 0)
    {
LABEL_25:
      if (!v14) {

      }
      if (!v18) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
LABEL_24:

    goto LABEL_25;
  }

  if (v14) {
  else
  }

  char v13 = 0;
  if (v12)
  {
LABEL_28:
  }
LABEL_29:
  if (!v10) {

  }
LABEL_32:
  return v13;
}

- (SWUpdateCollaborationParticipantsAction)initWithDestinationAction:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 info];
  uint64_t v5 = [v4 objectForSetting:3];

  v6 = [v3 info];
  uint64_t v7 = [v6 objectForSetting:4];

  id v8 = [v3 info];
  v31 = [v8 objectForSetting:5];

  id v9 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  int v12 = [v10 setWithArray:v11];
  id v37 = 0;
  v35 = (void *)v5;
  char v13 = [v9 unarchivedObjectOfClasses:v12 fromData:v5 error:&v37];
  id v32 = v37;

  uint64_t v14 = (void *)MEMORY[0x1E4F28DC0];
  objc_super v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  int v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  v34 = (void *)v7;
  v19 = [v14 unarchivedObjectOfClasses:v18 fromData:v7 error:0];

  uint64_t v20 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
  v25 = [v20 unarchivedObjectOfClasses:v24 fromData:v31 error:0];

  if (v13)
  {
    v36.receiver = self;
    v36.super_class = (Class)SWUpdateCollaborationParticipantsAction;
    int v26 = [(SWAction *)&v36 initWithDestinationAction:v3];
    p_isa = (id *)&v26->super.super.isa;
    if (v26)
    {
      objc_storeStrong((id *)&v26->_collaborationMetadata, v13);
      objc_storeStrong(p_isa + 9, v19);
      objc_storeStrong(p_isa + 10, v25);
    }
    v28 = p_isa;
    objc_super v29 = v28;
  }
  else
  {
    objc_super v29 = 0;
    v28 = self;
  }

  return v29;
}

- (void)encodeWithBSActionSettings:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  id v4 = a3;
  [(SWAction *)&v14 encodeWithBSActionSettings:v4];
  uint64_t v5 = (void *)MEMORY[0x1E4F28DB0];
  v6 = [(SWUpdateCollaborationParticipantsAction *)self collaborationMetadata];
  uint64_t v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];

  id v8 = (void *)MEMORY[0x1E4F28DB0];
  id v9 = [(SWUpdateCollaborationParticipantsAction *)self addedIdentities];
  uint64_t v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];

  objc_super v11 = (void *)MEMORY[0x1E4F28DB0];
  int v12 = [(SWUpdateCollaborationParticipantsAction *)self removedIdentities];
  char v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];

  [v4 setObject:v7 forSetting:3];
  [v4 setObject:v10 forSetting:4];
  [v4 setObject:v13 forSetting:5];
}

- (SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
}

- (NSArray)addedIdentities
{
  return self->_addedIdentities;
}

- (void)setAddedIdentities:(id)a3
{
}

- (NSArray)removedIdentities
{
  return self->_removedIdentities;
}

- (void)setRemovedIdentities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedIdentities, 0);
  objc_storeStrong((id *)&self->_addedIdentities, 0);

  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
}

@end