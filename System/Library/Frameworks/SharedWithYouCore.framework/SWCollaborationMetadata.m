@interface SWCollaborationMetadata
+ (BOOL)supportsSecureCoding;
+ (SWCollaborationMetadata)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCollaborationMetadata:(id)a3;
- (CKContainerSetupInfo)containerSetupInfo;
- (NSArray)ckAppBundleIDs;
- (NSArray)defaultOptions;
- (NSArray)userSelectedOptions;
- (NSData)sourceProcessData;
- (NSDate)creationDate;
- (NSDictionary)handleToIdentityMap;
- (NSPersonNameComponents)initiatorNameComponents;
- (NSString)initiatorHandle;
- (NSString)originatingBundleIdentifier;
- (NSString)title;
- (SWCollaborationIdentifier)collaborationIdentifier;
- (SWCollaborationMetadata)initWithCoder:(id)a3;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(SWCollaborationIdentifier)collaborationIdentifier;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8 initiatorHandle:(id)a9 initiatorNameComponents:(id)a10;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 containerSetupInfo:(id)a8;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7 containerSetupInfo:(id)a8;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8 initiatorHandle:(id)a9 initiatorNameComponents:(id)a10;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9 containerSetupInfo:(id)a10 sourceProcessData:(id)a11;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7 containerSetupInfo:(id)a8;
- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7 containerSetupInfo:(id)a8 sourceProcessData:(id)a9;
- (SWCollaborationMetadata)initWithLocalIdentifier:(SWLocalCollaborationIdentifier)localIdentifier;
- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6;
- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9;
- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11;
- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6 initiatorHandle:(id)a7 initiatorNameComponents:(id)a8;
- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6;
- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9;
- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11;
- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11 containerSetupInfo:(id)a12 sourceProcessData:(id)a13;
- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 defaultOptions:(id)a7 creationDate:(id)a8 contentType:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11 ckAppBundleIDs:(id)a12 handleToIdentityMap:(id)a13 containerSetupInfo:(id)a14 sourceProcessData:(id)a15;
- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 initiatorHandle:(id)a7 initiatorNameComponents:(id)a8;
- (SWCollaborationShareOptions)defaultShareOptions;
- (SWCollaborationShareOptions)userSelectedShareOptions;
- (SWLocalCollaborationIdentifier)localIdentifier;
- (UTType)contentType;
- (_SWCollaborationMetadataType)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_commonInitWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 defaultOptions:(id)a7 creationDate:(id)a8 contentType:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11 ckAppBundleIDs:(id)a12 handleToIdentityMap:(id)a13 containerSetupInfo:(id)a14 sourceProcessData:(id)a15;
- (void)encodeWithCoder:(id)a3;
- (void)setCkAppBundleIDs:(id)a3;
- (void)setCollaborationIdentifier:(id)a3;
- (void)setContainerSetupInfo:(id)a3;
- (void)setDefaultOptions:(id)a3;
- (void)setDefaultShareOptions:(SWCollaborationShareOptions *)defaultShareOptions;
- (void)setHandleToIdentityMap:(id)a3;
- (void)setInitiatorHandle:(NSString *)initiatorHandle;
- (void)setInitiatorNameComponents:(NSPersonNameComponents *)initiatorNameComponents;
- (void)setOriginatingBundleIdentifier:(id)a3;
- (void)setSourceProcessData:(id)a3;
- (void)setTitle:(NSString *)title;
- (void)setType:(id)a3;
- (void)setUserSelectedOptions:(id)a3;
- (void)setUserSelectedShareOptions:(SWCollaborationShareOptions *)userSelectedShareOptions;
@end

@implementation SWCollaborationMetadata

+ (SWCollaborationMetadata)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (SWCollaborationMetadata *)+[SWCollaborationMetadata allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SWCollaborationMetadata;
    return (SWCollaborationMetadata *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (void)_commonInitWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 defaultOptions:(id)a7 creationDate:(id)a8 contentType:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11 ckAppBundleIDs:(id)a12 handleToIdentityMap:(id)a13 containerSetupInfo:(id)a14 sourceProcessData:(id)a15
{
  v71 = (NSPersonNameComponents *)a11;
  if (a3)
  {
    id v22 = a15;
    id v23 = a14;
    id v24 = a13;
    id v25 = a12;
    id v26 = a10;
    id v27 = a9;
    id v28 = a8;
    id v29 = a7;
    id v30 = a6;
    id v31 = a5;
    id v32 = a4;
    v33 = (NSString *)[a3 copy];
    localIdentifier = self->_localIdentifier;
    self->_localIdentifier = v33;
  }
  else
  {
    localIdentifier = self->_localIdentifier;
    self->_localIdentifier = (NSString *)&stru_1ED99C438;
    id v35 = a15;
    id v36 = a14;
    id v37 = a13;
    id v38 = a12;
    id v39 = a10;
    id v40 = a9;
    id v41 = a8;
    id v42 = a7;
    id v43 = a6;
    id v44 = a5;
    id v45 = a4;
  }

  v46 = (NSString *)[a4 copy];
  collaborationIdentifier = self->_collaborationIdentifier;
  self->_collaborationIdentifier = v46;

  v48 = (NSString *)[a5 copy];
  title = self->_title;
  self->_title = v48;

  v50 = (SWCollaborationShareOptions *)[a6 copy];
  defaultShareOptions = self->_defaultShareOptions;
  self->_defaultShareOptions = v50;

  v52 = (NSArray *)[a7 copy];
  defaultOptions = self->_defaultOptions;
  self->_defaultOptions = v52;

  v54 = (NSDate *)[a8 copy];
  creationDate = self->_creationDate;
  self->_creationDate = v54;

  v56 = (UTType *)[a9 copy];
  contentType = self->_contentType;
  self->_contentType = v56;

  v58 = (NSString *)[a10 copy];
  initiatorHandle = self->_initiatorHandle;
  self->_initiatorHandle = v58;

  initiatorNameComponents = self->_initiatorNameComponents;
  self->_initiatorNameComponents = v71;
  v72 = v71;

  v61 = (NSArray *)[a12 copy];
  ckAppBundleIDs = self->_ckAppBundleIDs;
  self->_ckAppBundleIDs = v61;

  v63 = (NSDictionary *)[a13 copy];
  handleToIdentityMap = self->_handleToIdentityMap;
  self->_handleToIdentityMap = v63;

  v65 = (CKContainerSetupInfo *)[a14 copy];
  containerSetupInfo = self->_containerSetupInfo;
  self->_containerSetupInfo = v65;

  v67 = (NSData *)[a15 copy];
  sourceProcessData = self->_sourceProcessData;
  self->_sourceProcessData = v67;

  v69 = +[_SWCollaborationMetadataType collaboration];
  type = self->_type;
  self->_type = v69;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 defaultOptions:(id)a7 creationDate:(id)a8 contentType:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11 ckAppBundleIDs:(id)a12 handleToIdentityMap:(id)a13 containerSetupInfo:(id)a14 sourceProcessData:(id)a15
{
  id v20 = a3;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  v37.receiver = self;
  v37.super_class = (Class)SWCollaborationMetadata;
  id v29 = [(SWCollaborationMetadata *)&v37 init];
  id v30 = v29;
  if (v29) {
    [(SWCollaborationMetadata *)v29 _commonInitWithLocalIdentifier:v20 collaborationIdentifier:v36 title:v35 defaultShareOptions:v34 defaultOptions:v33 creationDate:v21 contentType:v22 initiatorHandle:v23 initiatorNameComponents:v24 ckAppBundleIDs:v25 handleToIdentityMap:v26 containerSetupInfo:v27 sourceProcessData:v28];
  }

  return v30;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7 containerSetupInfo:(id)a8 sourceProcessData:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = [(SWCollaborationMetadata *)self init];
  if (v22)
  {
    id v23 = [v17 optionsGroups];
    [(SWCollaborationMetadata *)v22 _commonInitWithLocalIdentifier:0 collaborationIdentifier:v15 title:v16 defaultShareOptions:v17 defaultOptions:v23 creationDate:0 contentType:0 initiatorHandle:v18 initiatorNameComponents:v19 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:v20 sourceProcessData:v21];
  }
  return v22;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7 containerSetupInfo:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [(SWCollaborationMetadata *)self init];
  if (v20)
  {
    id v21 = [v16 optionsGroups];
    [(SWCollaborationMetadata *)v20 _commonInitWithLocalIdentifier:0 collaborationIdentifier:v14 title:v15 defaultShareOptions:v16 defaultOptions:v21 creationDate:0 contentType:0 initiatorHandle:v17 initiatorNameComponents:v18 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:v19 sourceProcessData:0];
  }
  return v20;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(SWCollaborationMetadata *)self init];
  if (v17)
  {
    id v18 = [v14 optionsGroups];
    [(SWCollaborationMetadata *)v17 _commonInitWithLocalIdentifier:0 collaborationIdentifier:v12 title:v13 defaultShareOptions:v14 defaultOptions:v18 creationDate:0 contentType:0 initiatorHandle:v15 initiatorNameComponents:v16 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];
  }
  return v17;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(SWCollaborationMetadata *)self init];
  if (v17)
  {
    id v18 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v14];
    [(SWCollaborationMetadata *)v17 _commonInitWithLocalIdentifier:0 collaborationIdentifier:v12 title:v13 defaultShareOptions:v18 defaultOptions:v14 creationDate:0 contentType:0 initiatorHandle:v15 initiatorNameComponents:v16 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];
  }
  return v17;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7 containerSetupInfo:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [(SWCollaborationMetadata *)self init];
  if (v20)
  {
    id v21 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v16];
    [(SWCollaborationMetadata *)v20 _commonInitWithLocalIdentifier:0 collaborationIdentifier:v14 title:v15 defaultShareOptions:v21 defaultOptions:v16 creationDate:0 contentType:0 initiatorHandle:v17 initiatorNameComponents:v18 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:v19 sourceProcessData:0];
  }
  return v20;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [v20 optionsGroups];
  id v24 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v22 title:v21 defaultShareOptions:v20 defaultOptions:v23 creationDate:v19 contentType:v18 initiatorHandle:v17 initiatorNameComponents:v16 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v24;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9 containerSetupInfo:(id)a10 sourceProcessData:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = [v23 optionsGroups];
  id v29 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v25 title:v24 defaultShareOptions:v23 defaultOptions:v26 creationDate:v22 contentType:v21 initiatorHandle:v20 initiatorNameComponents:v19 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:v18 sourceProcessData:v17];

  return v29;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v20];
  id v24 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v22 title:v21 defaultShareOptions:v23 defaultOptions:v20 creationDate:v19 contentType:v18 initiatorHandle:v17 initiatorNameComponents:v16 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v24;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v14 optionsGroups];
  id v18 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v16 title:v15 defaultShareOptions:v14 defaultOptions:v17 creationDate:v13 contentType:v12 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v18;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 containerSetupInfo:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v17];
  id v21 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v19 title:v18 defaultShareOptions:v20 defaultOptions:v17 creationDate:v16 contentType:v15 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:v14 sourceProcessData:0];

  return v21;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v14];
  id v18 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v16 title:v15 defaultShareOptions:v17 defaultOptions:v14 creationDate:v13 contentType:v12 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v18;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 optionsGroups];
  id v12 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v10 title:v9 defaultShareOptions:v8 defaultOptions:v11 creationDate:0 contentType:0 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v12;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v8];
  id v12 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v10 title:v9 defaultShareOptions:v11 defaultOptions:v8 creationDate:0 contentType:0 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v12;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [v17 optionsGroups];
  id v21 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v19 title:v18 defaultShareOptions:v17 defaultOptions:v20 creationDate:v16 contentType:v15 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:v14 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v21;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v17];
  id v21 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v19 title:v18 defaultShareOptions:v20 defaultOptions:v17 creationDate:v16 contentType:v15 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:v14 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v21;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 optionsGroups];
  id v15 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:v13 collaborationIdentifier:v12 title:v11 defaultShareOptions:v10 defaultOptions:v14 creationDate:0 contentType:0 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v15;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v10];
  id v15 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:v13 collaborationIdentifier:v12 title:v11 defaultShareOptions:v14 defaultOptions:v10 creationDate:0 contentType:0 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v15;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 initiatorHandle:(id)a7 initiatorNameComponents:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [v16 optionsGroups];
  id v21 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:v19 collaborationIdentifier:v18 title:v17 defaultShareOptions:v16 defaultOptions:v20 creationDate:0 contentType:0 initiatorHandle:v15 initiatorNameComponents:v14 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v21;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6 initiatorHandle:(id)a7 initiatorNameComponents:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v16];
  id v21 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:v19 collaborationIdentifier:v18 title:v17 defaultShareOptions:v20 defaultOptions:v16 creationDate:0 contentType:0 initiatorHandle:v15 initiatorNameComponents:v14 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v21;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [v19 optionsGroups];
  id v24 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:v22 collaborationIdentifier:v21 title:v20 defaultShareOptions:v19 defaultOptions:v23 creationDate:v18 contentType:v17 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:v16 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v24;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v19];
  id v24 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:v22 collaborationIdentifier:v21 title:v20 defaultShareOptions:v23 defaultOptions:v19 creationDate:v18 contentType:v17 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:v16 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v24;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11 containerSetupInfo:(id)a12 sourceProcessData:(id)a13
{
  id v29 = a13;
  id v18 = a12;
  id v28 = a11;
  id v27 = a10;
  id v19 = a9;
  id v20 = a8;
  id v26 = a7;
  id v21 = a6;
  id v25 = a5;
  id v22 = a4;
  id v23 = a3;
  id v31 = [v21 optionsGroups];
  id v33 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:v23 collaborationIdentifier:v22 title:v25 defaultShareOptions:v21 defaultOptions:v31 creationDate:v26 contentType:v20 initiatorHandle:v27 initiatorNameComponents:v28 ckAppBundleIDs:v19 handleToIdentityMap:0 containerSetupInfo:v18 sourceProcessData:v29];

  return v33;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = [v22 optionsGroups];
  id v29 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:v25 collaborationIdentifier:v24 title:v23 defaultShareOptions:v22 defaultOptions:v26 creationDate:v21 contentType:v20 initiatorHandle:v18 initiatorNameComponents:v17 ckAppBundleIDs:v19 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v29;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v22];
  id v29 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:v25 collaborationIdentifier:v24 title:v23 defaultShareOptions:v26 defaultOptions:v22 creationDate:v21 contentType:v20 initiatorHandle:v18 initiatorNameComponents:v17 ckAppBundleIDs:v19 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v29;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8 initiatorHandle:(id)a9 initiatorNameComponents:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = [v22 optionsGroups];
  id v26 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v24 title:v23 defaultShareOptions:v22 defaultOptions:v25 creationDate:v21 contentType:v20 initiatorHandle:v18 initiatorNameComponents:v17 ckAppBundleIDs:v19 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v26;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8 initiatorHandle:(id)a9 initiatorNameComponents:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:v22];
  id v26 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:v24 title:v23 defaultShareOptions:v25 defaultOptions:v22 creationDate:v21 contentType:v20 initiatorHandle:v18 initiatorNameComponents:v17 ckAppBundleIDs:v19 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];

  return v26;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(SWLocalCollaborationIdentifier)localIdentifier
{
  return [(SWCollaborationMetadata *)self initWithLocalIdentifier:localIdentifier collaborationIdentifier:0 title:0 defaultShareOptions:0 defaultOptions:0 creationDate:0 contentType:0 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(SWCollaborationIdentifier)collaborationIdentifier
{
  return [(SWCollaborationMetadata *)self initWithLocalIdentifier:0 collaborationIdentifier:collaborationIdentifier title:0 defaultShareOptions:0 defaultOptions:0 creationDate:0 contentType:0 initiatorHandle:0 initiatorNameComponents:0 ckAppBundleIDs:0 handleToIdentityMap:0 containerSetupInfo:0 sourceProcessData:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(SWCollaborationMetadata *)self collaborationIdentifier];
  [v3 appendFormat:@" collaborationIdentifier=%@", v4];

  v5 = [(SWCollaborationMetadata *)self title];
  [v3 appendFormat:@" title=%@", v5];

  objc_super v6 = [(SWCollaborationMetadata *)self defaultShareOptions];
  [v3 appendFormat:@" defaultShareOptions=%@", v6];

  v7 = [(SWCollaborationMetadata *)self userSelectedShareOptions];
  [v3 appendFormat:@" userSelectedShareOptions=%@", v7];

  id v8 = [(SWCollaborationMetadata *)self initiatorHandle];
  [v3 appendFormat:@" initiatorHandle=%@", v8];

  id v9 = [(SWCollaborationMetadata *)self initiatorNameComponents];
  [v3 appendFormat:@" initiatorNameComponents=%@", v9];

  id v10 = [(SWCollaborationMetadata *)self handleToIdentityMap];
  [v3 appendFormat:@" handleToIdentityMap=%@", v10];

  id v11 = [(SWCollaborationMetadata *)self type];
  [v3 appendFormat:@" type=%@", v11];

  [v3 appendString:@">"];
  id v12 = (void *)[v3 copy];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SWCollaborationMetadata *)self isEqualToCollaborationMetadata:v4];

  return v5;
}

- (BOOL)isEqualToCollaborationMetadata:(id)a3
{
  id v4 = a3;
  id v121 = [(SWCollaborationMetadata *)self collaborationIdentifier];
  if (v121
    || ([v4 collaborationIdentifier], (v102 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v5 = [(SWCollaborationMetadata *)self collaborationIdentifier];
    v100 = [v4 collaborationIdentifier];
    v101 = v5;
    int v6 = objc_msgSend(v5, "isEqual:");
    int v7 = 1;
    if (!v6)
    {
      BOOL v119 = 0;
      int v120 = 1;
      int v107 = 0;
      uint64_t v117 = 0;
      uint64_t v118 = 0;
      uint64_t v115 = 0;
      uint64_t v116 = 0;
      int v104 = 0;
      memset(v105, 0, sizeof(v105));
      uint64_t v113 = 0;
      uint64_t v114 = 0;
      memset(v103, 0, sizeof(v103));
      long long v111 = 0uLL;
      int v8 = 0;
      uint64_t v112 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      LOBYTE(v106) = 0;
      goto LABEL_5;
    }
  }
  else
  {
    v102 = 0;
    int v7 = 0;
  }
  v99 = [(SWCollaborationMetadata *)self localIdentifier];
  BOOL v119 = v99 == 0;
  int v120 = v7;
  if (v99 || ([v4 localIdentifier], (v95 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v17 = [(SWCollaborationMetadata *)self localIdentifier];
    v97 = [v4 localIdentifier];
    v98 = v17;
    if (!objc_msgSend(v17, "isEqual:"))
    {
      int v107 = 1;
      uint64_t v116 = 0;
      uint64_t v117 = 0;
      int v104 = 0;
      memset(v105, 0, sizeof(v105));
      uint64_t v114 = 0;
      uint64_t v115 = 0;
      uint64_t v112 = 0;
      uint64_t v113 = 0;
      memset(v103, 0, sizeof(v103));
      long long v111 = 0uLL;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      LOBYTE(v106) = 0;
      uint64_t v118 = 1;
      goto LABEL_5;
    }
    int v18 = 1;
  }
  else
  {
    v95 = 0;
    int v18 = 0;
  }
  v96 = [(SWCollaborationMetadata *)self title];
  LODWORD(v118) = v18;
  HIDWORD(v118) = v96 == 0;
  if (v96 || ([v4 title], (v91 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v19 = [(SWCollaborationMetadata *)self title];
    v93 = [v4 title];
    v94 = v19;
    if (!objc_msgSend(v19, "isEqual:"))
    {
      int v107 = 1;
      *(void *)v105 = 0;
      uint64_t v115 = 0;
      uint64_t v116 = 0;
      uint64_t v113 = 0;
      uint64_t v114 = 0;
      memset(v103, 0, sizeof(v103));
      long long v111 = 0uLL;
      int v8 = 0;
      uint64_t v112 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v104 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      LOBYTE(v106) = 0;
      uint64_t v117 = 1;
      goto LABEL_5;
    }
    int v20 = 1;
  }
  else
  {
    v91 = 0;
    int v20 = 0;
  }
  v92 = [(SWCollaborationMetadata *)self defaultShareOptions];
  LODWORD(v117) = v20;
  HIDWORD(v117) = v92 == 0;
  if (v92 || ([v4 defaultShareOptions], (v87 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v21 = [(SWCollaborationMetadata *)self defaultShareOptions];
    v89 = [v4 defaultShareOptions];
    v90 = v21;
    if (!objc_msgSend(v21, "isEqual:"))
    {
      int v107 = 1;
      int v104 = 0;
      *(void *)v105 = 0x100000000;
      uint64_t v114 = 0;
      uint64_t v115 = 0;
      uint64_t v112 = 0;
      uint64_t v113 = 0;
      memset(v103, 0, sizeof(v103));
      long long v111 = 0uLL;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      LOBYTE(v106) = 0;
      uint64_t v116 = 1;
      goto LABEL_5;
    }
    LODWORD(v116) = 1;
  }
  else
  {
    v87 = 0;
    LODWORD(v116) = 0;
  }
  uint64_t v22 = [(SWCollaborationMetadata *)self userSelectedShareOptions];
  HIDWORD(v116) = v22 == 0;
  v88 = (void *)v22;
  if (v22 || ([v4 userSelectedShareOptions], (v83 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v23 = [(SWCollaborationMetadata *)self userSelectedShareOptions];
    v85 = [v4 userSelectedShareOptions];
    v86 = v23;
    if (!objc_msgSend(v23, "isEqual:"))
    {
      int v107 = 1;
      uint64_t v113 = 0;
      uint64_t v114 = 0;
      memset(v103, 0, sizeof(v103));
      long long v111 = 0uLL;
      int v8 = 0;
      uint64_t v112 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      LOBYTE(v106) = 0;
      int v104 = 0;
      *(void *)v105 = 0x100000001;
      uint64_t v115 = 1;
      goto LABEL_5;
    }
    LODWORD(v115) = 1;
  }
  else
  {
    v83 = 0;
    LODWORD(v115) = 0;
  }
  uint64_t v24 = [(SWCollaborationMetadata *)self creationDate];
  HIDWORD(v115) = v24 == 0;
  v84 = (void *)v24;
  if (v24 || ([v4 creationDate], (v79 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v25 = [(SWCollaborationMetadata *)self creationDate];
    v81 = [v4 creationDate];
    v82 = v25;
    if (!objc_msgSend(v25, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      int v107 = 1;
      *(void *)v103 = 0;
      uint64_t v112 = 0;
      uint64_t v113 = 0;
      long long v111 = 0uLL;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      int v104 = 0;
      *(void *)v105 = 0x100000001;
      *(_DWORD *)&v103[8] = 1;
      uint64_t v114 = 1;
      goto LABEL_5;
    }
    LODWORD(v114) = 1;
  }
  else
  {
    v79 = 0;
    LODWORD(v114) = 0;
  }
  uint64_t v26 = [(SWCollaborationMetadata *)self contentType];
  HIDWORD(v114) = v26 == 0;
  v80 = (void *)v26;
  if (v26 || ([v4 contentType], (v75 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v27 = [(SWCollaborationMetadata *)self contentType];
    v77 = [v4 contentType];
    v78 = v27;
    if (!objc_msgSend(v27, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      int v107 = 1;
      *(void *)v103 = 0x100000000;
      long long v111 = 0uLL;
      int v8 = 0;
      uint64_t v112 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      int v104 = 0;
      *(void *)v105 = 0x100000001;
      *(_DWORD *)&v103[8] = 1;
      uint64_t v113 = 1;
      goto LABEL_5;
    }
    LODWORD(v113) = 1;
  }
  else
  {
    v75 = 0;
    LODWORD(v113) = 0;
  }
  uint64_t v28 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
  HIDWORD(v113) = v28 == 0;
  v76 = (void *)v28;
  if (v28 || ([v4 ckAppBundleIDs], (v71 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v29 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
    v73 = [v4 ckAppBundleIDs];
    v74 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      int v107 = 1;
      int v8 = 0;
      uint64_t v112 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      int v104 = 0;
      *(void *)v105 = 0x100000001;
      *(_DWORD *)&v103[8] = 1;
      *(void *)v103 = 0x100000001;
      long long v111 = 1uLL;
      goto LABEL_5;
    }
    LODWORD(v111) = 1;
  }
  else
  {
    v71 = 0;
    LODWORD(v111) = 0;
  }
  uint64_t v30 = [(SWCollaborationMetadata *)self initiatorHandle];
  HIDWORD(v112) = v30 == 0;
  v72 = (void *)v30;
  if (v30 || ([v4 initiatorHandle], (v67 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v31 = [(SWCollaborationMetadata *)self initiatorHandle];
    v69 = [v4 initiatorHandle];
    v70 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      int v107 = 1;
      int v9 = 0;
      LODWORD(v112) = 0;
      *(void *)((char *)&v111 + 4) = 0;
      int v10 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[4] = 1;
      *(_DWORD *)&v105[8] = 1;
      int v104 = 0;
      *(_DWORD *)v105 = 1;
      *(_DWORD *)&v103[4] = 1;
      *(_DWORD *)&v103[8] = 1;
      *(_DWORD *)v103 = 1;
      int v8 = 1;
      HIDWORD(v111) = 1;
      goto LABEL_5;
    }
    HIDWORD(v111) = 1;
  }
  else
  {
    v67 = 0;
    HIDWORD(v111) = 0;
  }
  uint64_t v32 = [(SWCollaborationMetadata *)self initiatorNameComponents];
  LODWORD(v112) = v32 == 0;
  v68 = (void *)v32;
  if (v32 || ([v4 initiatorNameComponents], (v63 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v33 = [(SWCollaborationMetadata *)self initiatorNameComponents];
    v65 = [v4 initiatorNameComponents];
    v66 = v33;
    if (!objc_msgSend(v33, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      int v107 = 1;
      int v10 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      int v104 = 0;
      *(void *)v105 = 0x100000001;
      *(_DWORD *)&v103[8] = 1;
      *(void *)v103 = 0x100000001;
      int v8 = 1;
      int v9 = 1;
      *(void *)((char *)&v111 + 4) = 1;
      goto LABEL_5;
    }
    DWORD1(v111) = 1;
  }
  else
  {
    v63 = 0;
    DWORD1(v111) = 0;
  }
  uint64_t v34 = [(SWCollaborationMetadata *)self handleToIdentityMap];
  DWORD2(v111) = v34 == 0;
  v64 = (void *)v34;
  if (v34 || ([v4 handleToIdentityMap], (v59 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v35 = [(SWCollaborationMetadata *)self handleToIdentityMap];
    v61 = [v4 handleToIdentityMap];
    v62 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      int v107 = 1;
      int v11 = 0;
      uint64_t v108 = 0;
      uint64_t v109 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[4] = 1;
      *(_DWORD *)&v105[8] = 1;
      int v104 = 0;
      *(_DWORD *)v105 = 1;
      *(_DWORD *)&v103[4] = 1;
      *(_DWORD *)&v103[8] = 1;
      *(_DWORD *)v103 = 1;
      int v8 = 1;
      int v9 = 1;
      int v10 = 1;
      uint64_t v110 = 1;
      goto LABEL_5;
    }
    LODWORD(v110) = 1;
  }
  else
  {
    v59 = 0;
    LODWORD(v110) = 0;
  }
  uint64_t v36 = [(SWCollaborationMetadata *)self sourceProcessData];
  HIDWORD(v110) = v36 == 0;
  v60 = (void *)v36;
  if (v36 || ([v4 sourceProcessData], (v55 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v37 = [(SWCollaborationMetadata *)self sourceProcessData];
    v57 = [v4 sourceProcessData];
    v58 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      int v107 = 1;
      int v12 = 0;
      uint64_t v108 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[4] = 1;
      *(_DWORD *)&v105[8] = 1;
      int v104 = 0;
      *(_DWORD *)v105 = 1;
      *(_DWORD *)&v103[4] = 1;
      *(_DWORD *)&v103[8] = 1;
      *(_DWORD *)v103 = 1;
      int v8 = 1;
      int v9 = 1;
      int v10 = 1;
      int v11 = 1;
      uint64_t v109 = 1;
      goto LABEL_5;
    }
    LODWORD(v109) = 1;
  }
  else
  {
    v55 = 0;
    LODWORD(v109) = 0;
  }
  uint64_t v38 = [(SWCollaborationMetadata *)self containerSetupInfo];
  HIDWORD(v109) = v38 == 0;
  v56 = (void *)v38;
  if (v38 || ([v4 containerSetupInfo], (v51 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v39 = [(SWCollaborationMetadata *)self containerSetupInfo];
    v53 = [v4 containerSetupInfo];
    v54 = v39;
    if (!objc_msgSend(v39, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      int v107 = 1;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[4] = 1;
      *(_DWORD *)&v105[8] = 1;
      int v104 = 0;
      *(_DWORD *)v105 = 1;
      *(_DWORD *)&v103[4] = 1;
      *(_DWORD *)&v103[8] = 1;
      *(_DWORD *)v103 = 1;
      int v8 = 1;
      int v9 = 1;
      int v10 = 1;
      int v11 = 1;
      int v12 = 1;
      uint64_t v108 = 1;
      goto LABEL_5;
    }
    LODWORD(v108) = 1;
  }
  else
  {
    v51 = 0;
    LODWORD(v108) = 0;
  }
  uint64_t v40 = [(SWCollaborationMetadata *)self userSelectedOptions];
  HIDWORD(v108) = v40 == 0;
  v52 = (void *)v40;
  if (v40 || ([v4 userSelectedOptions], (v47 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v41 = [(SWCollaborationMetadata *)self userSelectedOptions];
    v49 = [v4 userSelectedOptions];
    v50 = v41;
    if (!objc_msgSend(v41, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      int v107 = 1;
      int v14 = 0;
      int v15 = 0;
      *(_DWORD *)&v105[4] = 1;
      *(_DWORD *)&v105[8] = 1;
      *(_DWORD *)v105 = 1;
      *(_DWORD *)&v103[4] = 1;
      *(_DWORD *)&v103[8] = 1;
      *(_DWORD *)v103 = 1;
      int v8 = 1;
      int v9 = 1;
      int v10 = 1;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
      int v104 = 1;
      goto LABEL_5;
    }
    int v104 = 1;
  }
  else
  {
    v47 = 0;
    int v104 = 0;
  }
  uint64_t v42 = [(SWCollaborationMetadata *)self type];
  BOOL v45 = v42 == 0;
  v48 = (void *)v42;
  if (v42 || ([v4 type], (v46 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v43 = [(SWCollaborationMetadata *)self type];
    id v44 = [v4 type];
    LOBYTE(v106) = [v43 isEqual:v44];
    int v107 = 1;
    *(_DWORD *)&v105[4] = 1;
    *(_DWORD *)&v105[8] = 1;
    *(_DWORD *)v105 = 1;
    *(_DWORD *)&v103[4] = 1;
    *(_DWORD *)&v103[8] = 1;
    *(_DWORD *)v103 = 1;

    int v15 = v45;
    int v14 = 1;
    int v8 = 1;
    int v13 = 1;
    int v9 = 1;
    int v12 = 1;
    int v10 = 1;
    int v11 = 1;
  }
  else
  {
    v48 = 0;
    v46 = 0;
    LOBYTE(v106) = 1;
    int v107 = 1;
    *(_DWORD *)&v105[8] = 1;
    *(void *)v105 = 0x100000001;
    *(_DWORD *)&v103[8] = 1;
    *(void *)v103 = 0x100000001;
    int v8 = 1;
    int v9 = 1;
    int v10 = 1;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    int v14 = 1;
    int v15 = 1;
  }
LABEL_5:
  if (v15) {

  }
  if (v14) {
  if (v104)
  }
  {
  }
  if (HIDWORD(v108)) {

  }
  if (v13) {
  if (v108)
  }
  {
  }
  if (HIDWORD(v109)) {

  }
  if (v12) {
  if (v109)
  }
  {
  }
  if (HIDWORD(v110)) {

  }
  if (v11) {
  if (v110)
  }
  {
  }
  if (DWORD2(v111)) {

  }
  if (v10) {
  if (DWORD1(v111))
  }
  {
  }
  if (v112) {

  }
  if (v9) {
  if (HIDWORD(v111))
  }
  {
  }
  if (HIDWORD(v112)) {

  }
  if (v8) {
  if (v111)
  }
  {
  }
  if (HIDWORD(v113)) {

  }
  if (*(_DWORD *)v103) {
  if (v113)
  }
  {
  }
  if (HIDWORD(v114)) {

  }
  if (*(_DWORD *)&v103[4]) {
  if (v114)
  }
  {
  }
  if (HIDWORD(v115)) {

  }
  if (*(_DWORD *)&v103[8])
  {

    if (!v115) {
      goto LABEL_63;
    }
  }
  else if (!v115)
  {
LABEL_63:
    if (!HIDWORD(v116)) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }

  if (HIDWORD(v116)) {
LABEL_64:
  }

LABEL_65:
  if (*(_DWORD *)v105) {

  }
  if (v116)
  {
  }
  if (HIDWORD(v117)) {

  }
  if (*(_DWORD *)&v105[4])
  {

    if (!v117) {
      goto LABEL_73;
    }
  }
  else if (!v117)
  {
LABEL_73:
    if (!HIDWORD(v118)) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }

  if (HIDWORD(v118)) {
LABEL_74:
  }

LABEL_75:
  if (*(_DWORD *)&v105[8])
  {

    if (!v118) {
      goto LABEL_77;
    }
  }
  else if (!v118)
  {
LABEL_77:
    if (!v119) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }

  if (v119) {
LABEL_78:
  }

LABEL_79:
  if (v107) {

  }
  if (v120)
  {
  }
  if (!v121) {

  }
  return v106;
}

- (unint64_t)hash
{
  id v31 = [(SWCollaborationMetadata *)self collaborationIdentifier];
  uint64_t v3 = [v31 hash];
  uint64_t v30 = [(SWCollaborationMetadata *)self localIdentifier];
  uint64_t v4 = [v30 hash] ^ v3;
  id v29 = [(SWCollaborationMetadata *)self title];
  uint64_t v5 = [v29 hash];
  uint64_t v28 = [(SWCollaborationMetadata *)self defaultShareOptions];
  uint64_t v6 = v4 ^ v5 ^ [v28 hash];
  id v27 = [(SWCollaborationMetadata *)self userSelectedShareOptions];
  uint64_t v7 = [v27 hash];
  uint64_t v26 = [(SWCollaborationMetadata *)self creationDate];
  uint64_t v8 = v7 ^ [v26 hash];
  id v25 = [(SWCollaborationMetadata *)self contentType];
  uint64_t v9 = v6 ^ v8 ^ [v25 hash];
  int v10 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
  uint64_t v11 = [v10 hash];
  int v12 = [(SWCollaborationMetadata *)self initiatorHandle];
  uint64_t v13 = v11 ^ [v12 hash];
  int v14 = [(SWCollaborationMetadata *)self initiatorNameComponents];
  uint64_t v15 = v13 ^ [v14 hash];
  id v16 = [(SWCollaborationMetadata *)self handleToIdentityMap];
  uint64_t v17 = v9 ^ v15 ^ [v16 hash];
  int v18 = [(SWCollaborationMetadata *)self sourceProcessData];
  uint64_t v19 = [v18 hash];
  int v20 = [(SWCollaborationMetadata *)self containerSetupInfo];
  uint64_t v21 = v19 ^ [v20 hash];
  uint64_t v22 = [(SWCollaborationMetadata *)self type];
  unint64_t v23 = v17 ^ v21 ^ [v22 hash];

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v18 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int v20 = [(SWCollaborationMetadata *)self localIdentifier];
  uint64_t v15 = [(SWCollaborationMetadata *)self collaborationIdentifier];
  uint64_t v13 = [(SWCollaborationMetadata *)self title];
  uint64_t v17 = [(SWCollaborationMetadata *)self defaultShareOptions];
  id v16 = [(SWCollaborationMetadata *)self defaultOptions];
  int v14 = [(SWCollaborationMetadata *)self creationDate];
  int v12 = [(SWCollaborationMetadata *)self contentType];
  uint64_t v4 = [(SWCollaborationMetadata *)self initiatorHandle];
  uint64_t v5 = [(SWCollaborationMetadata *)self initiatorNameComponents];
  uint64_t v6 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
  uint64_t v7 = [(SWCollaborationMetadata *)self handleToIdentityMap];
  uint64_t v8 = [(SWCollaborationMetadata *)self containerSetupInfo];
  uint64_t v9 = [(SWCollaborationMetadata *)self sourceProcessData];
  uint64_t v19 = (void *)[v18 initWithLocalIdentifier:v20 collaborationIdentifier:v15 title:v13 defaultShareOptions:v17 defaultOptions:v16 creationDate:v14 contentType:v12 initiatorHandle:v4 initiatorNameComponents:v5 ckAppBundleIDs:v6 handleToIdentityMap:v7 containerSetupInfo:v8 sourceProcessData:v9];

  int v10 = [(SWCollaborationMetadata *)self type];
  [v19 setType:v10];

  return v19;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int v18 = +[SWCollaborationMetadata allocWithZone:a3];
  int v20 = [(SWCollaborationMetadata *)self localIdentifier];
  uint64_t v15 = [(SWCollaborationMetadata *)self collaborationIdentifier];
  uint64_t v13 = [(SWCollaborationMetadata *)self title];
  uint64_t v17 = [(SWCollaborationMetadata *)self defaultShareOptions];
  id v16 = [(SWCollaborationMetadata *)self defaultOptions];
  int v14 = [(SWCollaborationMetadata *)self creationDate];
  int v12 = [(SWCollaborationMetadata *)self contentType];
  uint64_t v4 = [(SWCollaborationMetadata *)self initiatorHandle];
  uint64_t v5 = [(SWCollaborationMetadata *)self initiatorNameComponents];
  uint64_t v6 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
  uint64_t v7 = [(SWCollaborationMetadata *)self handleToIdentityMap];
  uint64_t v8 = [(SWCollaborationMetadata *)self containerSetupInfo];
  uint64_t v9 = [(SWCollaborationMetadata *)self sourceProcessData];
  uint64_t v19 = [(SWCollaborationMetadata *)v18 initWithLocalIdentifier:v20 collaborationIdentifier:v15 title:v13 defaultShareOptions:v17 defaultOptions:v16 creationDate:v14 contentType:v12 initiatorHandle:v4 initiatorNameComponents:v5 ckAppBundleIDs:v6 handleToIdentityMap:v7 containerSetupInfo:v8 sourceProcessData:v9];

  int v10 = [(SWCollaborationMetadata *)self type];
  [(SWCollaborationMetadata *)v19 setType:v10];

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWCollaborationMetadata)initWithCoder:(id)a3
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = NSStringFromSelector(sel_collaborationIdentifier);
  v57 = [v3 decodeObjectOfClass:v4 forKey:v5];

  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(sel_localIdentifier);
  v55 = [v3 decodeObjectOfClass:v6 forKey:v7];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(sel_title);
  v53 = [v3 decodeObjectOfClass:v8 forKey:v9];

  int v10 = (void *)MEMORY[0x1E4F1CAD0];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  int v12 = [v10 setWithArray:v11];
  uint64_t v13 = NSStringFromSelector(sel_defaultShareOptions);
  v56 = [v3 decodeObjectOfClasses:v12 forKey:v13];

  int v14 = (void *)MEMORY[0x1E4F1CAD0];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  id v16 = [v14 setWithArray:v15];
  uint64_t v17 = NSStringFromSelector(sel_userSelectedShareOptions);
  v52 = [v3 decodeObjectOfClasses:v16 forKey:v17];

  uint64_t v18 = objc_opt_class();
  uint64_t v19 = NSStringFromSelector(sel_creationDate);
  v51 = [v3 decodeObjectOfClass:v18 forKey:v19];

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = NSStringFromSelector(sel_contentType);
  uint64_t v22 = [v3 decodeObjectOfClass:v20 forKey:v21];

  unint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  id v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  uint64_t v26 = NSStringFromSelector(sel_ckAppBundleIDs);
  id v27 = [v3 decodeObjectOfClasses:v25 forKey:v26];

  uint64_t v28 = objc_opt_class();
  id v29 = NSStringFromSelector(sel_initiatorHandle);
  uint64_t v30 = [v3 decodeObjectOfClass:v28 forKey:v29];

  uint64_t v31 = objc_opt_class();
  uint64_t v32 = NSStringFromSelector(sel_initiatorNameComponents);
  v50 = [v3 decodeObjectOfClass:v31 forKey:v32];

  id v33 = (void *)MEMORY[0x1E4F1CA80];
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  v58[2] = objc_opt_class();
  v58[3] = objc_opt_class();
  uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
  id v35 = [v33 setWithArray:v34];
  uint64_t v36 = NSStringFromSelector(sel_handleToIdentityMap);
  v49 = [v3 decodeObjectOfClasses:v35 forKey:v36];

  uint64_t v37 = objc_opt_class();
  uint64_t v38 = NSStringFromSelector(sel_containerSetupInfo);
  v48 = [v3 decodeObjectOfClass:v37 forKey:v38];

  uint64_t v39 = objc_opt_class();
  uint64_t v40 = NSStringFromSelector(sel_sourceProcessData);
  id v41 = [v3 decodeObjectOfClass:v39 forKey:v40];

  uint64_t v42 = objc_opt_class();
  id v43 = NSStringFromSelector(sel_type);
  id v44 = [v3 decodeObjectOfClass:v42 forKey:v43];

  BOOL v45 = [v56 optionsGroups];
  v46 = [(SWCollaborationMetadata *)self initWithLocalIdentifier:v55 collaborationIdentifier:v57 title:v53 defaultShareOptions:v56 defaultOptions:v45 creationDate:v51 contentType:v22 initiatorHandle:v30 initiatorNameComponents:v50 ckAppBundleIDs:v27 handleToIdentityMap:v49 containerSetupInfo:v48 sourceProcessData:v41];

  [(SWCollaborationMetadata *)v46 setUserSelectedShareOptions:v52];
  [(SWCollaborationMetadata *)v46 setType:v44];

  return v46;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SWCollaborationMetadata *)self collaborationIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_collaborationIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(SWCollaborationMetadata *)self localIdentifier];
  uint64_t v8 = NSStringFromSelector(sel_localIdentifier);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(SWCollaborationMetadata *)self title];
  int v10 = NSStringFromSelector(sel_title);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(SWCollaborationMetadata *)self defaultShareOptions];
  int v12 = NSStringFromSelector(sel_defaultShareOptions);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(SWCollaborationMetadata *)self userSelectedShareOptions];
  int v14 = NSStringFromSelector(sel_userSelectedShareOptions);
  [v4 encodeObject:v13 forKey:v14];

  uint64_t v15 = [(SWCollaborationMetadata *)self creationDate];
  id v16 = NSStringFromSelector(sel_creationDate);
  [v4 encodeObject:v15 forKey:v16];

  uint64_t v17 = [(SWCollaborationMetadata *)self contentType];
  uint64_t v18 = NSStringFromSelector(sel_contentType);
  [v4 encodeObject:v17 forKey:v18];

  uint64_t v19 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
  uint64_t v20 = NSStringFromSelector(sel_ckAppBundleIDs);
  [v4 encodeObject:v19 forKey:v20];

  uint64_t v21 = [(SWCollaborationMetadata *)self initiatorHandle];
  uint64_t v22 = NSStringFromSelector(sel_initiatorHandle);
  [v4 encodeObject:v21 forKey:v22];

  unint64_t v23 = [(SWCollaborationMetadata *)self initiatorNameComponents];
  uint64_t v24 = NSStringFromSelector(sel_initiatorNameComponents);
  [v4 encodeObject:v23 forKey:v24];

  id v25 = [(SWCollaborationMetadata *)self handleToIdentityMap];
  uint64_t v26 = NSStringFromSelector(sel_handleToIdentityMap);
  [v4 encodeObject:v25 forKey:v26];

  id v27 = [(SWCollaborationMetadata *)self sourceProcessData];
  uint64_t v28 = NSStringFromSelector(sel_sourceProcessData);
  [v4 encodeObject:v27 forKey:v28];

  id v29 = [(SWCollaborationMetadata *)self containerSetupInfo];
  uint64_t v30 = NSStringFromSelector(sel_containerSetupInfo);
  [v4 encodeObject:v29 forKey:v30];

  id v32 = [(SWCollaborationMetadata *)self type];
  uint64_t v31 = NSStringFromSelector(sel_type);
  [v4 encodeObject:v32 forKey:v31];
}

- (NSArray)userSelectedOptions
{
  return self->_userSelectedOptions;
}

- (void)setUserSelectedOptions:(id)a3
{
}

- (SWCollaborationShareOptions)userSelectedShareOptions
{
  return self->_userSelectedShareOptions;
}

- (void)setUserSelectedShareOptions:(SWCollaborationShareOptions *)userSelectedShareOptions
{
}

- (SWCollaborationIdentifier)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (void)setCollaborationIdentifier:(id)a3
{
}

- (SWLocalCollaborationIdentifier)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
}

- (SWCollaborationShareOptions)defaultShareOptions
{
  return self->_defaultShareOptions;
}

- (void)setDefaultShareOptions:(SWCollaborationShareOptions *)defaultShareOptions
{
}

- (NSString)initiatorHandle
{
  return self->_initiatorHandle;
}

- (void)setInitiatorHandle:(NSString *)initiatorHandle
{
}

- (NSPersonNameComponents)initiatorNameComponents
{
  return self->_initiatorNameComponents;
}

- (void)setInitiatorNameComponents:(NSPersonNameComponents *)initiatorNameComponents
{
}

- (NSArray)defaultOptions
{
  return self->_defaultOptions;
}

- (void)setDefaultOptions:(id)a3
{
}

- (NSArray)ckAppBundleIDs
{
  return self->_ckAppBundleIDs;
}

- (void)setCkAppBundleIDs:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (NSDictionary)handleToIdentityMap
{
  return self->_handleToIdentityMap;
}

- (void)setHandleToIdentityMap:(id)a3
{
}

- (NSString)originatingBundleIdentifier
{
  return self->_originatingBundleIdentifier;
}

- (void)setOriginatingBundleIdentifier:(id)a3
{
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
}

- (NSData)sourceProcessData
{
  return self->_sourceProcessData;
}

- (void)setSourceProcessData:(id)a3
{
}

- (_SWCollaborationMetadataType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_sourceProcessData, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_handleToIdentityMap, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_ckAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_defaultOptions, 0);
  objc_storeStrong((id *)&self->_initiatorNameComponents, 0);
  objc_storeStrong((id *)&self->_initiatorHandle, 0);
  objc_storeStrong((id *)&self->_defaultShareOptions, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_userSelectedShareOptions, 0);

  objc_storeStrong((id *)&self->_userSelectedOptions, 0);
}

@end