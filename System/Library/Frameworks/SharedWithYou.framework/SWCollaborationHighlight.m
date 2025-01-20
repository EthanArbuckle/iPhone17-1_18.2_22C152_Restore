@interface SWCollaborationHighlight
+ (BOOL)supportsSecureCoding;
+ (id)requiredSpotlightAttributeKeysforHighlightType:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSDictionary)earliestAttributionIdentifiers;
- (NSDictionary)handleToIdentityMap;
- (NSString)collaborationIdentifier;
- (NSString)fileProviderID;
- (NSString)title;
- (SLCollaborationHighlight)slCollaborationHighlight;
- (SWCollaborationHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4;
- (SWCollaborationHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 error:(id *)a4;
- (SWCollaborationHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5;
- (SWCollaborationHighlight)initWithCoder:(id)a3;
- (SWCollaborationHighlight)initWithDictionary:(id)a3;
- (SWCollaborationHighlight)initWithSLCollaborationHighlight:(id)a3;
- (SWCollaborationHighlight)initWithSLCollaborationHighlight:(id)a3 andType:(unsigned __int8)a4;
- (SWPersonIdentity)localIdentity;
- (SWPersonIdentityProof)localProofOfInclusion;
- (UTType)contentType;
- (id)URL;
- (id)attributions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)timestamp;
- (unint64_t)hash;
- (unsigned)highlightType;
- (void)encodeWithCoder:(id)a3;
- (void)setCollaborationIdentifier:(id)a3;
@end

@implementation SWCollaborationHighlight

- (SWCollaborationHighlight)initWithSLCollaborationHighlight:(id)a3
{
  id v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)SWCollaborationHighlight,
        v6 = [(SWHighlight *)&v9 initWithSLHighlight:v5],
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_slCollaborationHighlight, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SWCollaborationHighlight)initWithSLCollaborationHighlight:(id)a3 andType:(unsigned __int8)a4
{
  id v7 = a3;
  if (v7
    && (v11.receiver = self,
        v11.super_class = (Class)SWCollaborationHighlight,
        v8 = [(SWHighlight *)&v11 initWithSLHighlight:v7],
        (self = v8) != 0))
  {
    objc_storeStrong((id *)&v8->_slCollaborationHighlight, a3);
    self->_highlightType = a4;
    self = self;
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (SWCollaborationHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  v8 = (objc_class *)MEMORY[0x1E4FA5610];
  id v9 = a3;
  v10 = objc_msgSend([v8 alloc], "initWithCSSearchableItemUniqueIdentifier:forContentType:error:", v9, +[SWHighlight highlightContentTypeForType:](SWHighlight, "highlightContentTypeForType:", v6), a5);

  objc_super v11 = [(SWCollaborationHighlight *)self initWithSLCollaborationHighlight:v10 andType:v6];
  return v11;
}

- (SWCollaborationHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 containsString:@"at_"];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FA5610]) initWithCSSearchableItemUniqueIdentifier:v6 forContentType:v7 error:a4];

  id v9 = [(SWCollaborationHighlight *)self initWithSLCollaborationHighlight:v8 andType:v7];
  return v9;
}

- (SWCollaborationHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FA5610];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithCSSearchableItem:v7 error:a4];
  id v9 = [v7 uniqueIdentifier];

  uint64_t v10 = [v9 containsString:@"at_"];
  objc_super v11 = [(SWCollaborationHighlight *)self initWithSLCollaborationHighlight:v8 andType:v10];

  return v11;
}

- (SWCollaborationHighlight)initWithDictionary:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FA5610];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithDictionary:v5];
  id v7 = [v5 objectForKeyedSubscript:@"ct"];

  v8 = -[SWCollaborationHighlight initWithSLCollaborationHighlight:andType:](self, "initWithSLCollaborationHighlight:andType:", v6, [v7 containsString:@"at_"]);
  return v8;
}

+ (id)requiredSpotlightAttributeKeysforHighlightType:(unsigned __int8)a3
{
  v3 = (void *)MEMORY[0x1E4FA5610];
  uint64_t v4 = +[SWHighlight highlightContentTypeForType:a3];

  return (id)[v3 requiredSpotlightAttributeKeysforHighlightType:v4];
}

- (UTType)contentType
{
  v2 = (void *)MEMORY[0x1E4F442D8];
  v3 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  uint64_t v4 = [v3 contentType];
  id v5 = [v2 typeWithIdentifier:v4];

  return (UTType *)v5;
}

- (NSString)title
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 fileName];

  return (NSString *)v3;
}

- (id)URL
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 resourceURL];

  return v3;
}

- (id)attributions
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 attributions];

  return v3;
}

- (id)timestamp
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 timestamp];

  return v3;
}

- (NSString)collaborationIdentifier
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 collaborationIdentifier];

  return (NSString *)v3;
}

- (NSDictionary)earliestAttributionIdentifiers
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 earliestAttributionIdentifiers];

  return (NSDictionary *)v3;
}

- (SWPersonIdentity)localIdentity
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 localIdentity];

  return (SWPersonIdentity *)v3;
}

- (SWPersonIdentityProof)localProofOfInclusion
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 localProofOfInclusion];

  return (SWPersonIdentityProof *)v3;
}

- (NSDictionary)handleToIdentityMap
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 handleToIdentityMap];

  return (NSDictionary *)v3;
}

- (NSString)fileProviderID
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 fileProviderID];

  return (NSString *)v3;
}

- (NSDate)creationDate
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  v3 = [v2 creationDate];

  return (NSDate *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SWCollaborationHighlight;
  id v4 = a3;
  [(SWHighlight *)&v7 encodeWithCoder:v4];
  id v5 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  [v4 encodeObject:v5 forKey:@"slc"];

  id v6 = [(SWCollaborationHighlight *)self collaborationIdentifier];
  [v4 encodeObject:v6 forKey:@"slcid"];
}

- (SWCollaborationHighlight)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SWCollaborationHighlight;
  id v5 = [(SWHighlight *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slc"];
    slCollaborationHighlight = v5->_slCollaborationHighlight;
    v5->_slCollaborationHighlight = (SLCollaborationHighlight *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slcid"];
    collaborationIdentifier = v5->_collaborationIdentifier;
    v5->_collaborationIdentifier = (NSString *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  uint64_t v6 = (void *)[v4 initWithSLCollaborationHighlight:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
    objc_super v7 = [v5 slCollaborationHighlight];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = [(SWCollaborationHighlight *)self collaborationIdentifier];
      id v9 = [v5 collaborationIdentifier];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(SWCollaborationHighlight *)self slCollaborationHighlight];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)setCollaborationIdentifier:(id)a3
{
}

- (SLCollaborationHighlight)slCollaborationHighlight
{
  return self->_slCollaborationHighlight;
}

- (unsigned)highlightType
{
  return self->_highlightType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slCollaborationHighlight, 0);

  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
}

@end