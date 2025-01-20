@interface SWStartCollaborationAction
+ (BOOL)supportsSecureCoding;
+ (SWStartCollaborationAction)actionWithMetadata:(id)a3;
- (BOOL)isEqualToAction:(id)a3;
- (SWCollaborationMetadata)collaborationMetadata;
- (SWStartCollaborationAction)initWithCoder:(id)a3;
- (SWStartCollaborationAction)initWithDestinationAction:(id)a3;
- (SWStartCollaborationAction)initWithMetadata:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithBSActionSettings:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fulfillUsingURL:(NSURL *)url collaborationIdentifier:(SWCollaborationIdentifier)collaborationIdentifier;
- (void)fulfillUsingURL:(id)a3 updatedMetadata:(id)a4;
- (void)setCollaborationMetadata:(id)a3;
@end

@implementation SWStartCollaborationAction

+ (SWStartCollaborationAction)actionWithMetadata:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithMetadata:v4];

  return (SWStartCollaborationAction *)v5;
}

- (SWStartCollaborationAction)initWithMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWStartCollaborationAction;
  v6 = [(SWAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collaborationMetadata, a3);
  }

  return v7;
}

- (void)fulfillUsingURL:(NSURL *)url collaborationIdentifier:(SWCollaborationIdentifier)collaborationIdentifier
{
  v6 = collaborationIdentifier;
  v7 = url;
  id v8 = [(SWStartCollaborationAction *)self collaborationMetadata];
  [v8 setCollaborationIdentifier:v6];

  [(SWStartCollaborationAction *)self fulfillUsingURL:v7 updatedMetadata:v8];
}

- (void)fulfillUsingURL:(id)a3 updatedMetadata:(id)a4
{
  id v5 = +[_SWStartCollaborationActionResponse responseWithURL:a3 updatedMetadata:a4];
  [(SWAction *)self fulfillWithResponse:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWStartCollaborationAction)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SWStartCollaborationAction;
  id v5 = [(SWAction *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    id v8 = [v6 setWithArray:v7];
    objc_super v9 = NSStringFromSelector(sel_collaborationMetadata);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    collaborationMetadata = v5->_collaborationMetadata;
    v5->_collaborationMetadata = (SWCollaborationMetadata *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SWStartCollaborationAction;
  id v4 = a3;
  [(SWAction *)&v7 encodeWithCoder:v4];
  id v5 = [(SWStartCollaborationAction *)self collaborationMetadata];
  v6 = NSStringFromSelector(sel_collaborationMetadata);
  [v4 encodeObject:v5 forKey:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SWStartCollaborationAction;
  id v4 = [(SWAction *)&v7 copyWithZone:a3];
  if (v4)
  {
    id v5 = [(SWStartCollaborationAction *)self collaborationMetadata];
    [v4 setCollaborationMetadata:v5];
  }
  return v4;
}

- (BOOL)isEqualToAction:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SWStartCollaborationAction;
  if ([(SWAction *)&v12 isEqualToAction:v5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      objc_super v7 = [(SWStartCollaborationAction *)self collaborationMetadata];
      if (v7 || ([v6 collaborationMetadata], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v8 = [(SWStartCollaborationAction *)self collaborationMetadata];
        objc_super v9 = [v6 collaborationMetadata];
        char v10 = [v8 isEqual:v9];

        if (v7)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        char v10 = 1;
      }

      goto LABEL_10;
    }
  }
  char v10 = 0;
LABEL_11:

  return v10;
}

- (SWStartCollaborationAction)initWithDestinationAction:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 info];
  id v6 = [v5 objectForSetting:2];

  objc_super v7 = (void *)MEMORY[0x1E4F28DC0];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  char v10 = [v8 setWithArray:v9];
  v11 = [v7 unarchivedObjectOfClasses:v10 fromData:v6 error:0];

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)SWStartCollaborationAction;
    objc_super v12 = [(SWAction *)&v16 initWithDestinationAction:v4];
    objc_super v13 = v12;
    if (v12) {
      objc_storeStrong((id *)&v12->_collaborationMetadata, v11);
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithBSActionSettings:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SWStartCollaborationAction;
  id v4 = a3;
  [(SWAction *)&v8 encodeWithBSActionSettings:v4];
  id v5 = (void *)MEMORY[0x1E4F28DB0];
  id v6 = [(SWStartCollaborationAction *)self collaborationMetadata];
  objc_super v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];

  [v4 setObject:v7 forSetting:2];
}

- (SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end