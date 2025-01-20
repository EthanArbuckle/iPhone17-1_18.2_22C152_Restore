@interface DMFFetchDeclarationCapabilitiesResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchDeclarationCapabilitiesResultObject)initWithCoder:(id)a3;
- (NSArray)supportedActivations;
- (NSArray)supportedAssets;
- (NSArray)supportedCommands;
- (NSArray)supportedConfigurations;
- (NSArray)supportedEvents;
- (NSArray)supportedMessages;
- (NSArray)supportedPredicates;
- (void)encodeWithCoder:(id)a3;
- (void)setSupportedActivations:(id)a3;
- (void)setSupportedAssets:(id)a3;
- (void)setSupportedCommands:(id)a3;
- (void)setSupportedConfigurations:(id)a3;
- (void)setSupportedEvents:(id)a3;
- (void)setSupportedMessages:(id)a3;
- (void)setSupportedPredicates:(id)a3;
@end

@implementation DMFFetchDeclarationCapabilitiesResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchDeclarationCapabilitiesResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)DMFFetchDeclarationCapabilitiesResultObject;
  v5 = [(CATTaskResultObject *)&v42 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"supportedCommands"];
    supportedCommands = v5->_supportedCommands;
    v5->_supportedCommands = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"supportedAssets"];
    supportedAssets = v5->_supportedAssets;
    v5->_supportedAssets = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"supportedConfigurations"];
    supportedConfigurations = v5->_supportedConfigurations;
    v5->_supportedConfigurations = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"supportedEvents"];
    supportedEvents = v5->_supportedEvents;
    v5->_supportedEvents = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"supportedActivations"];
    supportedActivations = v5->_supportedActivations;
    v5->_supportedActivations = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"supportedPredicates"];
    supportedPredicates = v5->_supportedPredicates;
    v5->_supportedPredicates = (NSArray *)v34;

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"supportedMessages"];
    supportedMessages = v5->_supportedMessages;
    v5->_supportedMessages = (NSArray *)v39;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)DMFFetchDeclarationCapabilitiesResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v12 encodeWithCoder:v4];
  v5 = [(DMFFetchDeclarationCapabilitiesResultObject *)self supportedCommands];
  [v4 encodeObject:v5 forKey:@"supportedCommands"];

  v6 = [(DMFFetchDeclarationCapabilitiesResultObject *)self supportedAssets];
  [v4 encodeObject:v6 forKey:@"supportedAssets"];

  uint64_t v7 = [(DMFFetchDeclarationCapabilitiesResultObject *)self supportedConfigurations];
  [v4 encodeObject:v7 forKey:@"supportedConfigurations"];

  v8 = [(DMFFetchDeclarationCapabilitiesResultObject *)self supportedEvents];
  [v4 encodeObject:v8 forKey:@"supportedEvents"];

  uint64_t v9 = [(DMFFetchDeclarationCapabilitiesResultObject *)self supportedActivations];
  [v4 encodeObject:v9 forKey:@"supportedActivations"];

  v10 = [(DMFFetchDeclarationCapabilitiesResultObject *)self supportedPredicates];
  [v4 encodeObject:v10 forKey:@"supportedPredicates"];

  v11 = [(DMFFetchDeclarationCapabilitiesResultObject *)self supportedMessages];
  [v4 encodeObject:v11 forKey:@"supportedMessages"];
}

- (NSArray)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
}

- (NSArray)supportedAssets
{
  return self->_supportedAssets;
}

- (void)setSupportedAssets:(id)a3
{
}

- (NSArray)supportedConfigurations
{
  return self->_supportedConfigurations;
}

- (void)setSupportedConfigurations:(id)a3
{
}

- (NSArray)supportedEvents
{
  return self->_supportedEvents;
}

- (void)setSupportedEvents:(id)a3
{
}

- (NSArray)supportedActivations
{
  return self->_supportedActivations;
}

- (void)setSupportedActivations:(id)a3
{
}

- (NSArray)supportedPredicates
{
  return self->_supportedPredicates;
}

- (void)setSupportedPredicates:(id)a3
{
}

- (NSArray)supportedMessages
{
  return self->_supportedMessages;
}

- (void)setSupportedMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMessages, 0);
  objc_storeStrong((id *)&self->_supportedPredicates, 0);
  objc_storeStrong((id *)&self->_supportedActivations, 0);
  objc_storeStrong((id *)&self->_supportedEvents, 0);
  objc_storeStrong((id *)&self->_supportedConfigurations, 0);
  objc_storeStrong((id *)&self->_supportedAssets, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
}

@end