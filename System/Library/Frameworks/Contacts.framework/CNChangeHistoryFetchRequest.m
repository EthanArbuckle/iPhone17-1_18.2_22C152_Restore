@interface CNChangeHistoryFetchRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)includeChangeAnchors;
- (BOOL)includeChangeIDs;
- (BOOL)includeExternalIDs;
- (BOOL)includeGroupChanges;
- (BOOL)includeImagesChanged;
- (BOOL)includeLabeledValueChanges;
- (BOOL)includeLinkingChanges;
- (BOOL)includeMeCardChanges;
- (BOOL)mutableObjects;
- (BOOL)shouldEnforceClientIdentifer;
- (BOOL)shouldUnifyResults;
- (BOOL)unifyResults;
- (CNChangeHistoryAnchor)startingAnchor;
- (CNChangeHistoryFetchRequest)init;
- (CNChangeHistoryFetchRequest)initWithClientIdentifier:(id)a3;
- (CNChangeHistoryFetchRequest)initWithCoder:(id)a3;
- (NSArray)additionalContactKeyDescriptors;
- (NSArray)excludedTransactionAuthors;
- (NSData)startingToken;
- (NSString)clientIdentifier;
- (NSString)containerIdentifier;
- (id)description;
- (int64_t)resultType;
- (void)acceptVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalContactKeyDescriptors:(NSArray *)additionalContactKeyDescriptors;
- (void)setContainerIdentifier:(id)a3;
- (void)setExcludedTransactionAuthors:(NSArray *)excludedTransactionAuthors;
- (void)setIncludeChangeAnchors:(BOOL)a3;
- (void)setIncludeChangeIDs:(BOOL)a3;
- (void)setIncludeExternalIDs:(BOOL)a3;
- (void)setIncludeGroupChanges:(BOOL)includeGroupChanges;
- (void)setIncludeImagesChanged:(BOOL)a3;
- (void)setIncludeLabeledValueChanges:(BOOL)a3;
- (void)setIncludeLinkingChanges:(BOOL)a3;
- (void)setIncludeMeCardChanges:(BOOL)a3;
- (void)setMutableObjects:(BOOL)mutableObjects;
- (void)setResultType:(int64_t)a3;
- (void)setShouldUnifyResults:(BOOL)shouldUnifyResults;
- (void)setStartingAnchor:(id)a3;
- (void)setStartingToken:(NSData *)startingToken;
- (void)setUnifyResults:(BOOL)a3;
@end

@implementation CNChangeHistoryFetchRequest

- (CNChangeHistoryFetchRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNChangeHistoryFetchRequest;
  v2 = [(CNChangeHistoryFetchRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_resultType = 2;
    v2->_shouldUnifyResults = 1;
    v4 = v2;
  }

  return v3;
}

- (CNChangeHistoryFetchRequest)initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNChangeHistoryFetchRequest;
  v5 = [(CNChangeHistoryFetchRequest *)&v11 init];
  objc_super v6 = v5;
  if (v5)
  {
    v5->_resultType = 2;
    uint64_t v7 = [v4 copy];
    clientIdentifier = v6->_clientIdentifier;
    v6->_clientIdentifier = (NSString *)v7;

    v6->_includeGroupChanges = 0;
    v6->_includeChangeAnchors = 0;
    v6->_includeChangeIDs = 0;
    v6->_includeExternalIDs = 0;
    v6->_includeImagesChanged = 0;
    v6->_includeLabeledValueChanges = 0;
    v6->_includeLinkingChanges = 0;
    v6->_includeMeCardChanges = 0;
    v6->_shouldUnifyResults = 1;
    v6->_mutableObjects = 0;
    v6->_enforceClientIdentifier = 1;
    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryFetchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNChangeHistoryFetchRequest;
  v5 = [(CNChangeHistoryFetchRequest *)&v23 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientIdentifier"];
    uint64_t v7 = [v6 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    v5->_shouldUnifyResults = [v4 decodeBoolForKey:@"_shouldUnifyResults"];
    v5->_includeGroupChanges = [v4 decodeBoolForKey:@"_includeGroupChanges"];
    v5->_includeChangeAnchors = [v4 decodeBoolForKey:@"_includeChangeAnchors"];
    v5->_includeChangeIDs = [v4 decodeBoolForKey:@"_includeChangeIDs"];
    v5->_includeExternalIDs = [v4 decodeBoolForKey:@"_includeExternalIDs"];
    v5->_includeImagesChanged = [v4 decodeBoolForKey:@"_includeImagesChanged"];
    v5->_includeLabeledValueChanges = [v4 decodeBoolForKey:@"_includeLabeledValueChanges"];
    v5->_includeLinkingChanges = [v4 decodeBoolForKey:@"_includeLinkingChanges"];
    v5->_includeMeCardChanges = [v4 decodeBoolForKey:@"_includeMeCardChanges"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_containerIdentifier"];
    uint64_t v10 = [v9 copy];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    v5->_enforceClientIdentifier = [v4 decodeBoolForKey:@"_enforceClientIdentifier"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startingToken"];
    uint64_t v13 = [v12 copy];
    startingToken = v5->_startingToken;
    v5->_startingToken = (NSData *)v13;

    v5->_resultType = [v4 decodeIntegerForKey:@"_resultType"];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_excludedTransactionAuthors"];
    uint64_t v19 = [v18 copy];
    excludedTransactionAuthors = v5->_excludedTransactionAuthors;
    v5->_excludedTransactionAuthors = (NSArray *)v19;

    v21 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  clientIdentifier = self->_clientIdentifier;
  id v5 = a3;
  [v5 encodeObject:clientIdentifier forKey:@"_clientIdentifier"];
  [v5 encodeBool:self->_shouldUnifyResults forKey:@"_shouldUnifyResults"];
  [v5 encodeBool:self->_includeGroupChanges forKey:@"_includeGroupChanges"];
  [v5 encodeBool:self->_includeChangeAnchors forKey:@"_includeChangeAnchors"];
  [v5 encodeBool:self->_includeChangeIDs forKey:@"_includeChangeIDs"];
  [v5 encodeBool:self->_includeExternalIDs forKey:@"_includeExternalIDs"];
  [v5 encodeBool:self->_includeImagesChanged forKey:@"_includeImagesChanged"];
  [v5 encodeBool:self->_includeLabeledValueChanges forKey:@"_includeLabeledValueChanges"];
  [v5 encodeBool:self->_includeLinkingChanges forKey:@"_includeLinkingChanges"];
  [v5 encodeBool:self->_includeMeCardChanges forKey:@"_includeMeCardChanges"];
  [v5 encodeObject:self->_containerIdentifier forKey:@"_containerIdentifier"];
  [v5 encodeBool:self->_enforceClientIdentifier forKey:@"_enforceClientIdentifier"];
  [v5 encodeObject:self->_startingToken forKey:@"_startingToken"];
  [v5 encodeInteger:self->_resultType forKey:@"_resultType"];
  [v5 encodeObject:self->_excludedTransactionAuthors forKey:@"_excludedTransactionAuthors"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendName:integerValue:", @"resultType", -[CNChangeHistoryFetchRequest resultType](self, "resultType"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryFetchRequest shouldUnifyResults](self, "shouldUnifyResults"));
  id v6 = (id)[v3 appendName:@"shouldUnifyResults" object:v5];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryFetchRequest includeGroupChanges](self, "includeGroupChanges"));
  id v8 = (id)[v3 appendName:@"includeGroupChanges" object:v7];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryFetchRequest includeExternalIDs](self, "includeExternalIDs"));
  id v10 = (id)[v3 appendName:@"includeExternalIDs" object:v9];

  objc_super v11 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryFetchRequest includeLabeledValueChanges](self, "includeLabeledValueChanges"));
  id v12 = (id)[v3 appendName:@"includeLabeledValueChanges" object:v11];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryFetchRequest includeLinkingChanges](self, "includeLinkingChanges"));
  id v14 = (id)[v3 appendName:@"includeLinkingChanges" object:v13];

  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryFetchRequest includeMeCardChanges](self, "includeMeCardChanges"));
  id v16 = (id)[v3 appendName:@"includeMeCardChanges" object:v15];

  v17 = [(CNChangeHistoryFetchRequest *)self containerIdentifier];
  id v18 = (id)[v3 appendName:@"containerIdentifier" object:v17];

  uint64_t v19 = [(CNChangeHistoryFetchRequest *)self startingAnchor];

  if (v19)
  {
    v20 = [(CNChangeHistoryFetchRequest *)self startingAnchor];
    id v21 = (id)[v3 appendName:@"startingAnchor" object:v20];
  }
  id v22 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"shouldEnforceClientIdentifier", -[CNChangeHistoryFetchRequest shouldEnforceClientIdentifer](self, "shouldEnforceClientIdentifer"));
  objc_super v23 = [(CNChangeHistoryFetchRequest *)self excludedTransactionAuthors];
  id v24 = (id)[v3 appendName:@"excludedTransactionAuthors" object:v23];

  v25 = [(CNChangeHistoryFetchRequest *)self clientIdentifier];
  id v26 = (id)[v3 appendName:@"clientIdentifier" object:v25];

  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryFetchRequest includeChangeAnchors](self, "includeChangeAnchors"));
  id v28 = (id)[v3 appendName:@"includeChangeAnchors" object:v27];

  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryFetchRequest includeChangeIDs](self, "includeChangeIDs"));
  id v30 = (id)[v3 appendName:@"includeChangeIDs" object:v29];

  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryFetchRequest includeImagesChanged](self, "includeImagesChanged"));
  id v32 = (id)[v3 appendName:@"includeImagesChanged" object:v31];

  v33 = [v3 build];

  return v33;
}

- (CNChangeHistoryAnchor)startingAnchor
{
  v3 = [CNChangeHistoryAnchor alloc];
  id v4 = [(CNChangeHistoryFetchRequest *)self startingToken];
  id v5 = [(CNChangeHistoryAnchor *)v3 initWithHistoryToken:v4 error:0];

  return v5;
}

- (void)setStartingAnchor:(id)a3
{
  id v4 = [a3 historyToken];
  [(CNChangeHistoryFetchRequest *)self setStartingToken:v4];
}

- (void)acceptVisitor:(id)a3
{
}

- (void)setUnifyResults:(BOOL)a3
{
  self->_shouldUnifyResults = a3;
}

- (BOOL)unifyResults
{
  return self->_shouldUnifyResults;
}

- (NSData)startingToken
{
  return self->_startingToken;
}

- (void)setStartingToken:(NSData *)startingToken
{
}

- (NSArray)additionalContactKeyDescriptors
{
  return self->_additionalContactKeyDescriptors;
}

- (void)setAdditionalContactKeyDescriptors:(NSArray *)additionalContactKeyDescriptors
{
}

- (BOOL)shouldUnifyResults
{
  return self->_shouldUnifyResults;
}

- (void)setShouldUnifyResults:(BOOL)shouldUnifyResults
{
  self->_shouldUnifyResults = shouldUnifyResults;
}

- (BOOL)mutableObjects
{
  return self->_mutableObjects;
}

- (void)setMutableObjects:(BOOL)mutableObjects
{
  self->_mutableObjects = mutableObjects;
}

- (BOOL)includeGroupChanges
{
  return self->_includeGroupChanges;
}

- (void)setIncludeGroupChanges:(BOOL)includeGroupChanges
{
  self->_includeGroupChanges = includeGroupChanges;
}

- (NSArray)excludedTransactionAuthors
{
  return self->_excludedTransactionAuthors;
}

- (void)setExcludedTransactionAuthors:(NSArray *)excludedTransactionAuthors
{
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (BOOL)shouldEnforceClientIdentifer
{
  return self->_enforceClientIdentifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (BOOL)includeChangeAnchors
{
  return self->_includeChangeAnchors;
}

- (void)setIncludeChangeAnchors:(BOOL)a3
{
  self->_includeChangeAnchors = a3;
}

- (BOOL)includeChangeIDs
{
  return self->_includeChangeIDs;
}

- (void)setIncludeChangeIDs:(BOOL)a3
{
  self->_includeChangeIDs = a3;
}

- (BOOL)includeExternalIDs
{
  return self->_includeExternalIDs;
}

- (void)setIncludeExternalIDs:(BOOL)a3
{
  self->_includeExternalIDs = a3;
}

- (BOOL)includeImagesChanged
{
  return self->_includeImagesChanged;
}

- (void)setIncludeImagesChanged:(BOOL)a3
{
  self->_includeImagesChanged = a3;
}

- (BOOL)includeLabeledValueChanges
{
  return self->_includeLabeledValueChanges;
}

- (void)setIncludeLabeledValueChanges:(BOOL)a3
{
  self->_includeLabeledValueChanges = a3;
}

- (BOOL)includeLinkingChanges
{
  return self->_includeLinkingChanges;
}

- (void)setIncludeLinkingChanges:(BOOL)a3
{
  self->_includeLinkingChanges = a3;
}

- (BOOL)includeMeCardChanges
{
  return self->_includeMeCardChanges;
}

- (void)setIncludeMeCardChanges:(BOOL)a3
{
  self->_includeMeCardChanges = a3;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_excludedTransactionAuthors, 0);
  objc_storeStrong((id *)&self->_additionalContactKeyDescriptors, 0);

  objc_storeStrong((id *)&self->_startingToken, 0);
}

@end