@interface _SWCollaborationMetadataType
+ (BOOL)supportsSecureCoding;
+ (_SWCollaborationMetadataType)collaboration;
+ (_SWCollaborationMetadataType)event;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCollaborationMetadataType:(id)a3;
- (NSString)actionDescription;
- (NSString)typedIdentifier;
- (_SWCollaborationMetadataType)initWithCoder:(id)a3;
- (_SWCollaborationMetadataType)initWithTypedIdentifier:(id)a3 actionDescription:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionDescription:(id)a3;
- (void)setTypedIdentifier:(id)a3;
@end

@implementation _SWCollaborationMetadataType

+ (_SWCollaborationMetadataType)collaboration
{
  v2 = [_SWCollaborationMetadataType alloc];
  v3 = SWCoreFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"Collaborate" value:&stru_1ED99C438 table:@"SharedWithYouCore"];
  v5 = [(_SWCollaborationMetadataType *)v2 initWithTypedIdentifier:@"SWCollaborationMetadataTypeTypeIdentifierCollaboration" actionDescription:v4];

  return v5;
}

+ (_SWCollaborationMetadataType)event
{
  v2 = [_SWCollaborationMetadataType alloc];
  v3 = SWCoreFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"RSVP" value:&stru_1ED99C438 table:@"SharedWithYouCore"];
  v5 = [(_SWCollaborationMetadataType *)v2 initWithTypedIdentifier:@"SWCollaborationMetadataTypeTypeIdentifierEvent" actionDescription:v4];

  return v5;
}

- (_SWCollaborationMetadataType)initWithTypedIdentifier:(id)a3 actionDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SWCollaborationMetadataType;
  v8 = [(_SWCollaborationMetadataType *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(_SWCollaborationMetadataType *)v8 setTypedIdentifier:v6];
    [(_SWCollaborationMetadataType *)v9 setActionDescription:v7];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(_SWCollaborationMetadataType *)self isEqualToCollaborationMetadataType:v4];

  return v5;
}

- (BOOL)isEqualToCollaborationMetadataType:(id)a3
{
  id v7 = a3;
  v8 = [(_SWCollaborationMetadataType *)self typedIdentifier];
  if (!v8)
  {
    v15 = [v7 typedIdentifier];
    if (!v15)
    {
      v15 = 0;
      int v9 = 0;
      goto LABEL_7;
    }
  }
  v3 = [(_SWCollaborationMetadataType *)self typedIdentifier];
  id v4 = [v7 typedIdentifier];
  if ([v3 isEqual:v4])
  {
    int v9 = 1;
LABEL_7:
    objc_super v11 = [(_SWCollaborationMetadataType *)self actionDescription];
    if (v11 || ([v7 actionDescription], (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = [(_SWCollaborationMetadataType *)self actionDescription];
      v13 = [v7 actionDescription];
      char v10 = [v12 isEqual:v13];

      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
      char v10 = 1;
    }

LABEL_13:
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v10 = 0;
LABEL_14:

LABEL_15:
  if (!v8) {

  }
  return v10;
}

- (unint64_t)hash
{
  v3 = [(_SWCollaborationMetadataType *)self typedIdentifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(_SWCollaborationMetadataType *)self actionDescription];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_SWCollaborationMetadataType *)self typedIdentifier];
  unint64_t v6 = NSStringFromSelector(sel_typedIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(_SWCollaborationMetadataType *)self actionDescription];
  id v7 = NSStringFromSelector(sel_actionDescription);
  [v4 encodeObject:v8 forKey:v7];
}

- (_SWCollaborationMetadataType)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = NSStringFromSelector(sel_typedIdentifier);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  int v9 = NSStringFromSelector(sel_actionDescription);
  char v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  objc_super v11 = [(_SWCollaborationMetadataType *)self initWithTypedIdentifier:v7 actionDescription:v10];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(_SWCollaborationMetadataType *)self typedIdentifier];
  unint64_t v6 = [(_SWCollaborationMetadataType *)self actionDescription];
  id v7 = (void *)[v4 initWithTypedIdentifier:v5 actionDescription:v6];

  return v7;
}

- (NSString)typedIdentifier
{
  return self->_typedIdentifier;
}

- (void)setTypedIdentifier:(id)a3
{
}

- (NSString)actionDescription
{
  return self->_actionDescription;
}

- (void)setActionDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDescription, 0);

  objc_storeStrong((id *)&self->_typedIdentifier, 0);
}

@end