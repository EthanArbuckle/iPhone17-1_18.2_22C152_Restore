@interface CHSConfiguredWidgetContainerDescriptorsBox
+ (BOOL)supportsSecureCoding;
- (CHSConfiguredWidgetContainerDescriptorsBox)initWithCoder:(id)a3;
- (CHSConfiguredWidgetContainerDescriptorsBox)initWithDescriptors:(id)a3;
- (NSArray)descriptors;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSConfiguredWidgetContainerDescriptorsBox

- (CHSConfiguredWidgetContainerDescriptorsBox)initWithDescriptors:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSConfiguredWidgetContainerDescriptorsBox;
  v5 = [(CHSConfiguredWidgetContainerDescriptorsBox *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CHSConfiguredWidgetContainerDescriptorsBox)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"descriptors"];

  v10 = __60__CHSConfiguredWidgetContainerDescriptorsBox_initWithCoder___block_invoke(v9, v8);

  if (v10)
  {
    self = [(CHSConfiguredWidgetContainerDescriptorsBox *)self initWithDescriptors:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __60__CHSConfiguredWidgetContainerDescriptorsBox_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    id v7 = v3;
  }
  else
  {
LABEL_12:
    id v7 = 0;
  }

  return v7;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void).cxx_destruct
{
}

@end