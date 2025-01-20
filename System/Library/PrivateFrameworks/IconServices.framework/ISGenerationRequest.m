@interface ISGenerationRequest
+ (BOOL)supportsSecureCoding;
- (ISConcreteIcon)icon;
- (ISGenerationRequest)init;
- (ISGenerationRequest)initWithCoder:(id)a3;
- (ISImageDescriptor)imageDescriptor;
- (NSUUID)lsDatabaseUUID;
- (id)_decorationRecipeKeyFromTypeIdentifier:(id)a3 position:(int64_t)a4;
- (id)generateImage;
- (id)generateImageReturningRecordIdentifiers:(id *)a3;
- (id)iconSpecificationFromRecipe:(id)a3;
- (unint64_t)lsDatabaseSequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setIcon:(id)a3;
- (void)setImageDescriptor:(id)a3;
- (void)setLsDatabaseSequenceNumber:(unint64_t)a3;
- (void)setLsDatabaseUUID:(id)a3;
@end

@implementation ISGenerationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISGenerationRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)ISGenerationRequest;
  v2 = [(ISGenerationRequest *)&v7 init];
  if (v2)
  {
    v5 = 0;
    unint64_t v6 = 0;
    objc_msgSend(MEMORY[0x1E4F22468], "_is_getSequenceNumber:andUUID:", &v6, &v5);
    v3 = v5;
    v2->_lsDatabaseSequenceNumber = v6;
    objc_storeStrong((id *)&v2->_lsDatabaseUUID, v3);
  }
  return v2;
}

- (ISGenerationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ISGenerationRequest;
  v5 = [(ISGenerationRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageDescriptor"];
    imageDescriptor = v5->_imageDescriptor;
    v5->_imageDescriptor = (ISImageDescriptor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    icon = v5->_icon;
    v5->_icon = (ISConcreteIcon *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lsDatabaseUUID"];
    lsDatabaseUUID = v5->_lsDatabaseUUID;
    v5->_lsDatabaseUUID = (NSUUID *)v10;

    v5->_lsDatabaseSequenceNumber = [v4 decodeInt64ForKey:@"lsDatabaseSequenceNumber"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  imageDescriptor = self->_imageDescriptor;
  id v5 = a3;
  [v5 encodeObject:imageDescriptor forKey:@"imageDescriptor"];
  [v5 encodeObject:self->_icon forKey:@"icon"];
  [v5 encodeObject:self->_lsDatabaseUUID forKey:@"lsDatabaseUUID"];
  [v5 encodeInt64:self->_lsDatabaseSequenceNumber forKey:@"lsDatabaseSequenceNumber"];
}

- (ISConcreteIcon)icon
{
  return (ISConcreteIcon *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIcon:(id)a3
{
}

- (ISImageDescriptor)imageDescriptor
{
  return (ISImageDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImageDescriptor:(id)a3
{
}

- (NSUUID)lsDatabaseUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLsDatabaseUUID:(id)a3
{
}

- (unint64_t)lsDatabaseSequenceNumber
{
  return self->_lsDatabaseSequenceNumber;
}

- (void)setLsDatabaseSequenceNumber:(unint64_t)a3
{
  self->_lsDatabaseSequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsDatabaseUUID, 0);
  objc_storeStrong((id *)&self->_imageDescriptor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

- (id)_decorationRecipeKeyFromTypeIdentifier:(id)a3 position:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v5];
  objc_super v7 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.icon-decoration.emboss"];
  int v8 = [v6 conformsToType:v7];

  if (v8)
  {
    v9 = ISCenterEmbossRecipe;
LABEL_9:
    id v16 = objc_alloc_init(v9);
LABEL_10:
    v17 = v16;
    goto LABEL_11;
  }
  uint64_t v10 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.icon-decoration-position.trailing-bottom"];
  int v11 = [v6 conformsToType:v10];

  if (v11)
  {
    v9 = ISTrailingStatusBadgeRecipe;
    goto LABEL_9;
  }
  v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.icon-decoration-position.leading-bottom"];
  int v13 = [v6 conformsToType:v12];

  if (v13)
  {
    v9 = ISLeadingStatusBadgeRecipe;
    goto LABEL_9;
  }
  v14 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.icon-decoration.system"];
  int v15 = [v6 conformsToType:v14];

  if (v15)
  {
    v9 = ISGenericRecipe;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"com.apple.icon-decoration.folderbadge"] || a4 == 3)
  {
    id v16 = (id)objc_opt_new();
    goto LABEL_10;
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (id)generateImage
{
  return [(ISGenerationRequest *)self generateImageReturningRecordIdentifiers:0];
}

- (id)generateImageReturningRecordIdentifiers:(id *)a3
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v5 = [(ISGenerationRequest *)self imageDescriptor];
  uint64_t v6 = (void *)[v5 copy];

  v121 = self;
  objc_super v7 = [(ISGenerationRequest *)self icon];
  int v8 = _ISDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v134 = v7;
    __int16 v135 = 2112;
    v136 = v6;
    _os_log_impl(&dword_1AE771000, v8, OS_LOG_TYPE_INFO, "ISA_GENERATEING_IMAGE for %@ : %@", buf, 0x16u);
  }

  if (v6)
  {
    v9 = _ISPrepareISIconSignpostLog();
    BOOL v10 = os_signpost_enabled(v9);

    if (v10)
    {
      int v11 = [NSString stringWithUTF8String:"ISA_GENERATEING_IMAGE for %@ : %@"];
      v12 = objc_msgSend(NSString, "stringWithFormat:", v11, v7, v6);
      [v7 _eventPrepareISIconSignpost:v6 message:v12];
    }
  }
  int v13 = [v7 makeResourceProvider];
  v14 = v13;
  if (v13)
  {
    [v13 resolveIconResource];
    [v14 configureProviderFromDescriptor:v6];
    v120 = objc_alloc_init(ISCompositor);
    int v15 = [v14 customRecipe];

    if (v15)
    {
      id v16 = [v14 customRecipe];
    }
    else
    {
      id v16 = v14;
    }
    id v18 = v16;
    v19 = +[ISRecipeFactory factoryWithDescriptor:v6 resourceProvider:v14];
    uint64_t v20 = [v19 recipe];

    if ([v14 isGenericProvider]
      && ([v6 shape] == 5 || objc_msgSend(v6, "shape") == 6))
    {
      v21 = (void *)MEMORY[0x1E4F6F1F0];
      v22 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
      v23 = [v21 imageBagWithResourcesNamed:@"AppClipDefaultIcon" fromBundle:v22];
      [v14 setIconResource:v23];
    }
    if ([v6 shape] == 5
      || [v6 shape] == 6
      || ([v14 suggestedRecipe],
          v24 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v24,
          (isKindOfClass & 1) != 0))
    {
      [(ISCompositor *)v120 setRenderingMode:2];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ISCompositor *)v120 setRenderingMode:2];
    }
    v26 = [(ISGenerationRequest *)v121 iconSpecificationFromRecipe:v20];
    [v6 size];
    double v28 = v27;
    double v30 = v29;
    [v6 scale];
    v32 = objc_msgSend(v26, "imageSpecificationForSize:scale:", v28, v30, v31);
    [v32 size];
    double v34 = v33;
    [v26 maxSize];
    v111 = v26;
    if (v34 == v35 && ([v32 size], double v37 = v36, objc_msgSend(v26, "maxSize"), v37 == v38))
    {
      [v32 scale];
      double v40 = v39;
      [v26 maxScale];
      BOOL v109 = v40 == v41;
    }
    else
    {
      BOOL v109 = 0;
    }
    v113 = a3;
    v114 = v32;
    v42 = [v14 iconResource];
    objc_opt_class();
    char v43 = objc_opt_isKindOfClass();

    if (v43)
    {
      v44 = [v14 iconResource];
      [v44 updateDescriptorWithImageDescriptor:v6];
    }
    v118 = v6;
    v119 = v14;
    v115 = (void *)v20;
    v112 = v18;
    v110 = [[ISCompositorElement alloc] initWithRecipe:v20 resourceProvider:v18];
    -[ISCompositor addElement:](v120, "addElement:");
    v45 = objc_opt_new();
    v46 = [v7 decorations];
    [v45 addObjectsFromArray:v46];

    v47 = [MEMORY[0x1E4F223F8] coreTypesBundleRecord];
    v116 = [v47 bundleIdentifier];

    v117 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:@"com.apple.icon-decoration.system"];
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v48 = v45;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v122 objects:v132 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v123;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v123 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = *(void **)(*((void *)&v122 + 1) + 8 * i);
          uint64_t v54 = [v53 identifierKind];
          if (v54 == 1)
          {
            [v53 position];
            v57 = objc_opt_new();
            v71 = (void *)MEMORY[0x1E4F223F8];
            v72 = [v53 identifier];
            v66 = [v71 bundleRecordWithBundleIdentifier:v72 allowPlaceholder:1 error:0];

            uint64_t v73 = +[ISResourceProvider resourceWithRecord:v66 options:0];
            v68 = (void *)v73;
            if (v57) {
              BOOL v74 = v73 == 0;
            }
            else {
              BOOL v74 = 1;
            }
            if (!v74)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v68 updateDescriptorWithImageDescriptor:v118];
              }
              v128 = @"kISPrimaryResourceKey";
              v129 = v68;
              v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
              [(ISCompositor *)v120 addElementWithRecipe:v57 resources:v75];
            }
            goto LABEL_59;
          }
          if (v54 == 3)
          {
            v64 = [v53 identifier];
            v57 = -[ISGenerationRequest _decorationRecipeKeyFromTypeIdentifier:position:](v121, "_decorationRecipeKeyFromTypeIdentifier:position:", v64, [v53 position]);

            uint64_t v65 = [v53 compositorResource];
            v66 = (void *)v65;
            if (v57) {
              BOOL v67 = v65 == 0;
            }
            else {
              BOOL v67 = 1;
            }
            if (v67) {
              goto LABEL_60;
            }
            v126 = @"kISPrimaryResourceKey";
            uint64_t v127 = v65;
            v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
            v69 = v120;
            v70 = v57;
LABEL_58:
            [(ISCompositor *)v69 addElementWithRecipe:v70 resources:v68];
LABEL_59:

            goto LABEL_60;
          }
          if (v54 != 2) {
            continue;
          }
          v55 = [v119 decorationResources];
          v56 = [v53 uuid];
          v57 = [v55 objectForKeyedSubscript:v56];

          if (!v57)
          {
            v58 = (void *)MEMORY[0x1E4F22490];
            v59 = [v53 identifier];
            v60 = [v58 typeRecordWithIdentifier:v59];

            if ([v60 conformsToTypeRecord:v117]
              && ([v60 declaringBundleRecord],
                  v61 = objc_claimAutoreleasedReturnValue(),
                  [v61 bundleIdentifier],
                  v62 = objc_claimAutoreleasedReturnValue(),
                  int v63 = [v62 isEqualToString:v116],
                  v62,
                  v61,
                  !v63))
            {
              v57 = 0;
            }
            else
            {
              v57 = +[ISResourceProvider resourceWithRecord:v60 options:0];
            }
          }
          v76 = [v53 identifier];
          v66 = -[ISGenerationRequest _decorationRecipeKeyFromTypeIdentifier:position:](v121, "_decorationRecipeKeyFromTypeIdentifier:position:", v76, [v53 position]);

          if (v66 && v57)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v57 updateDescriptorWithImageDescriptor:v118];
            }
            v130 = @"kISPrimaryResourceKey";
            v131 = v57;
            v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
            v69 = v120;
            v70 = v66;
            goto LABEL_58;
          }
LABEL_60:
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v122 objects:v132 count:16];
      }
      while (v50);
    }

    v77 = v114;
    [v114 size];
    double v79 = v78;
    double v81 = v80;
    uint64_t v6 = v118;
    [v118 size];
    double v83 = v82;
    [v118 size];
    if (v83 == v84)
    {
      v85 = v115;
      if (v81 != v79)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v114 size];
          double v87 = v86;
          [v114 size];
          double v89 = v88;
          [v114 size];
          BOOL v92 = v87 <= v89;
          if (v87 > v89) {
            double v81 = v90;
          }
          else {
            double v81 = v91;
          }
          if (v92) {
            double v79 = v91;
          }
          else {
            double v79 = v90;
          }
        }
      }
    }
    else
    {
      v85 = v115;
    }
    objc_opt_class();
    char v93 = objc_opt_isKindOfClass();
    double v94 = round(v79 * 1.18);
    double v95 = round(v81 * 1.18);
    if (v93) {
      double v96 = v94;
    }
    else {
      double v96 = v79;
    }
    if (v93) {
      double v97 = v95;
    }
    else {
      double v97 = v81;
    }
    [v114 scale];
    v99 = -[ISCompositor imageForSize:scale:](v120, "imageForSize:scale:", v96, v97, v98);
    [v114 minimumSize];
    objc_msgSend(v99, "setMinimumSize:");
    objc_msgSend(v99, "setIconSize:", v79, v81);
    v100 = [v99 bitmapData];
    id v101 = objc_alloc(MEMORY[0x1E4F6F1E8]);
    v102 = [v119 validationToken];
    v17 = (void *)[v101 initWithData:v100 uuid:0 validationToken:v102];

    [v17 setLargest:v109];
    if (v113)
    {
      uint64_t v103 = [v119 sourceRecordIdentifiers];
      if (v103
        && (v104 = (void *)v103,
            [v119 sourceRecordIdentifiers],
            v105 = objc_claimAutoreleasedReturnValue(),
            uint64_t v106 = [v105 count],
            v105,
            v104,
            v106))
      {
        id *v113 = [v119 sourceRecordIdentifiers];
      }
      else
      {
        v107 = _ISDefaultLog();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v134 = v119;
          __int16 v135 = 2112;
          v136 = v7;
          _os_log_impl(&dword_1AE771000, v107, OS_LOG_TYPE_DEFAULT, "Resource provider %@ for %@ has no record identifiers", buf, 0x16u);
        }
      }
      v77 = v114;
      v85 = v115;
    }

    v14 = v119;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)iconSpecificationFromRecipe:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    [v3 iconSpecification];
  }
  else {
  id v4 = [MEMORY[0x1E4F6F1E0] defaultIconSpecification];
  }

  return v4;
}

@end