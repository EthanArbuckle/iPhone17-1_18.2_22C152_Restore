@interface CHSWidgetKeysBox
+ (BOOL)supportsSecureCoding;
- (CHSWidgetKeysBox)initWithCoder:(id)a3;
- (CHSWidgetKeysBox)initWithWidgetKeys:(id)a3;
- (NSArray)widgetKeys;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetKeysBox

- (CHSWidgetKeysBox)initWithWidgetKeys:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetKeysBox;
  v5 = [(CHSWidgetKeysBox *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    widgetKeys = v5->_widgetKeys;
    v5->_widgetKeys = (NSArray *)v6;
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

- (CHSWidgetKeysBox)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"_r"];

  v10 = __34__CHSWidgetKeysBox_initWithCoder___block_invoke(v9, v8);

  if (v10)
  {
    self = [(CHSWidgetKeysBox *)self initWithWidgetKeys:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __34__CHSWidgetKeysBox_initWithCoder___block_invoke(uint64_t a1, void *a2)
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

- (NSArray)widgetKeys
{
  return self->_widgetKeys;
}

- (void).cxx_destruct
{
}

@end