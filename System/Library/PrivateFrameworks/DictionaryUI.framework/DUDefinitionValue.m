@interface DUDefinitionValue
- (DUDefinitionValue)initWithDefinitionDictionary:(id)a3 term:(id)a4;
- (MAAsset)rawAsset;
- (NSAttributedString)definition;
- (NSDictionary)definitionElements;
- (NSString)localizedDictionaryName;
- (NSString)longDefinition;
- (NSString)term;
- (__CFArray)foundRecordRefs;
- (id)_HTMLDefinitionForType:(int64_t)a3;
- (id)description;
- (void)dealloc;
- (void)setFoundRecordRefs:(__CFArray *)a3;
- (void)setRawAsset:(id)a3;
@end

@implementation DUDefinitionValue

- (DUDefinitionValue)initWithDefinitionDictionary:(id)a3 term:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DUDefinitionValue;
  v8 = [(DUDefinitionValue *)&v15 init];
  if (v8)
  {
    v9 = [v6 localizedDictionaryName];
    uint64_t v10 = [v9 copy];
    localizedDictionaryName = v8->_localizedDictionaryName;
    v8->_localizedDictionaryName = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    term = v8->_term;
    v8->_term = (NSString *)v12;

    if ([v6 dictionaryRef])
    {
      [(NSString *)v8->_term length];
      v8->_foundRecordRefs = (__CFArray *)DCSCopyDefinitionRecords();
    }
  }

  return v8;
}

- (void)dealloc
{
  foundRecordRefs = self->_foundRecordRefs;
  if (foundRecordRefs)
  {
    CFRelease(foundRecordRefs);
    self->_foundRecordRefs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DUDefinitionValue;
  [(DUDefinitionValue *)&v4 dealloc];
}

- (NSAttributedString)definition
{
  definition = self->_definition;
  if (!definition)
  {
    if (self->_foundRecordRefs)
    {
      objc_super v4 = [(DUDefinitionValue *)self _HTMLDefinitionForType:2];
      v5 = [v4 dataUsingEncoding:10];

      id v6 = (void *)[objc_alloc(MEMORY[0x263F1C340]) initWithData:v5 options:0];
      id v7 = v6;
      if (v6)
      {
        v8 = [v6 attributedString];
        v9 = (NSAttributedString *)[v8 copy];
        uint64_t v10 = self->_definition;
        self->_definition = v9;
      }
      definition = self->_definition;
    }
    else
    {
      definition = 0;
    }
  }
  return definition;
}

- (NSString)longDefinition
{
  longDefinition = self->_longDefinition;
  if (!longDefinition)
  {
    if (self->_foundRecordRefs)
    {
      objc_super v4 = [(DUDefinitionValue *)self _HTMLDefinitionForType:1];
      v5 = (NSString *)[v4 copy];
      id v6 = self->_longDefinition;
      self->_longDefinition = v5;

      longDefinition = self->_longDefinition;
    }
    else
    {
      longDefinition = 0;
    }
  }
  return longDefinition;
}

- (NSDictionary)definitionElements
{
  if (!self->_definitionElements)
  {
    foundRecordRefs = self->_foundRecordRefs;
    if (foundRecordRefs)
    {
      CFIndex Count = CFArrayGetCount(foundRecordRefs);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        CFIndex v8 = 0;
        while (1)
        {
          CFArrayGetValueAtIndex(self->_foundRecordRefs, v8);
          v9 = (void *)DCSRecordCopyTextElements();
          if (v9)
          {
            uint64_t v10 = v9;
            v11 = (NSDictionary *)[v9 copy];
            CFRelease(v10);
          }
          else
          {
            v11 = 0;
          }
          if ([(NSDictionary *)v11 count]) {
            break;
          }

          if (v7 == ++v8) {
            goto LABEL_2;
          }
        }
        definitionElements = self->_definitionElements;
        self->_definitionElements = v11;
      }
    }
  }
LABEL_2:
  v3 = self->_definitionElements;
  return v3;
}

- (id)_HTMLDefinitionForType:(int64_t)a3
{
  foundRecordRefs = self->_foundRecordRefs;
  if (foundRecordRefs && (CFIndex Count = CFArrayGetCount(foundRecordRefs), Count >= 1))
  {
    CFIndex v6 = Count;
    CFIndex v7 = 0;
    for (CFIndex i = 0; i != v6; ++i)
    {
      CFArrayGetValueAtIndex(self->_foundRecordRefs, i);
      uint64_t v9 = DCSRecordCopyDefinition();
      if (v9)
      {
        uint64_t v10 = (const void *)v9;
        if (!v7)
        {
          CFIndex v7 = [MEMORY[0x263F089D8] stringWithCapacity:0];
        }
        [v7 appendString:v10];
        CFRelease(v10);
      }
    }
  }
  else
  {
    CFIndex v7 = 0;
  }
  return v7;
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  CFIndex v6 = [v3 stringWithFormat:@"%@<%p>: localizedDictionaryName: %@, term: %@", v5, self, self->_localizedDictionaryName, self->_term];

  return v6;
}

- (NSString)localizedDictionaryName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)term
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (MAAsset)rawAsset
{
  return self->_rawAsset;
}

- (void)setRawAsset:(id)a3
{
}

- (__CFArray)foundRecordRefs
{
  return self->_foundRecordRefs;
}

- (void)setFoundRecordRefs:(__CFArray *)a3
{
  self->_foundRecordRefs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAsset, 0);
  objc_storeStrong((id *)&self->_term, 0);
  objc_storeStrong((id *)&self->_localizedDictionaryName, 0);
  objc_storeStrong((id *)&self->_definitionElements, 0);
  objc_storeStrong((id *)&self->_longDefinition, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

@end