@interface HFTriggerNaturalLanguageOptions
+ (HFTriggerNaturalLanguageOptions)optionsWithHome:(id)a3 nameType:(unint64_t)a4;
- (BOOL)shouldUseFirstPersonPronounIfPossible;
- (BOOL)shouldUseFullDayNames;
- (HFActionNaturalLanguageOptions)actionNaturalLanguageOptions;
- (HFTriggerNaturalLanguageOptions)initWithHome:(id)a3 nameType:(unint64_t)a4;
- (HFTriggerNaturalLanguageOptions)initWithHome:(id)a3 nameType:(unint64_t)a4 actions:(id)a5;
- (HMHome)home;
- (HMUser)locationEventUser;
- (NSArray)actions;
- (NSSet)objectsInContext;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)formattingStyle;
- (unint64_t)nameType;
- (void)_copyFromOptions:(id)a3;
- (void)setActionNaturalLanguageOptions:(id)a3;
- (void)setActions:(id)a3;
- (void)setFormattingStyle:(int64_t)a3;
- (void)setHome:(id)a3;
- (void)setLocationEventUser:(id)a3;
- (void)setNameType:(unint64_t)a3;
- (void)setObjectsInContext:(id)a3;
- (void)setShouldUseFirstPersonPronounIfPossible:(BOOL)a3;
- (void)setShouldUseFullDayNames:(BOOL)a3;
@end

@implementation HFTriggerNaturalLanguageOptions

- (HFTriggerNaturalLanguageOptions)initWithHome:(id)a3 nameType:(unint64_t)a4
{
  return [(HFTriggerNaturalLanguageOptions *)self initWithHome:a3 nameType:a4 actions:0];
}

- (HFTriggerNaturalLanguageOptions)initWithHome:(id)a3 nameType:(unint64_t)a4 actions:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HFTriggerNaturalLanguageOptions;
  v11 = [(HFNaturalLanguageOptions *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_nameType = a4;
    objc_storeStrong((id *)&v11->_home, a3);
    v12->_formattingStyle = 2;
    uint64_t v13 = [MEMORY[0x263EFFA08] set];
    objectsInContext = v12->_objectsInContext;
    v12->_objectsInContext = (NSSet *)v13;

    v12->_shouldUseFullDayNames = 0;
    v12->_shouldUseFirstPersonPronounIfPossible = 0;
    if ([v10 count])
    {
      objc_storeStrong((id *)&v12->_actions, a5);
      v15 = [[HFActionNaturalLanguageOptions alloc] initWithHome:v9 formattingContext:5];
      actionNaturalLanguageOptions = v12->_actionNaturalLanguageOptions;
      v12->_actionNaturalLanguageOptions = v15;
    }
  }

  return v12;
}

+ (HFTriggerNaturalLanguageOptions)optionsWithHome:(id)a3 nameType:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[HFTriggerNaturalLanguageOptions alloc] initWithHome:v5 nameType:a4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HFTriggerNaturalLanguageOptions;
  id v4 = [(HFNaturalLanguageOptions *)&v6 copyWithZone:a3];
  [v4 _copyFromOptions:self];
  return v4;
}

- (void)_copyFromOptions:(id)a3
{
  id v4 = a3;
  -[HFTriggerNaturalLanguageOptions setNameType:](self, "setNameType:", [v4 nameType]);
  id v5 = [v4 home];
  [(HFTriggerNaturalLanguageOptions *)self setHome:v5];

  objc_super v6 = [v4 actions];
  v7 = (void *)[v6 copy];
  [(HFTriggerNaturalLanguageOptions *)self setActions:v7];

  -[HFTriggerNaturalLanguageOptions setFormattingStyle:](self, "setFormattingStyle:", [v4 formattingStyle]);
  v8 = [v4 objectsInContext];
  id v9 = (void *)[v8 copy];
  [(HFTriggerNaturalLanguageOptions *)self setObjectsInContext:v9];

  id v10 = [v4 actionNaturalLanguageOptions];
  v11 = (void *)[v10 copy];
  [(HFTriggerNaturalLanguageOptions *)self setActionNaturalLanguageOptions:v11];

  -[HFTriggerNaturalLanguageOptions setShouldUseFullDayNames:](self, "setShouldUseFullDayNames:", [v4 shouldUseFullDayNames]);
  -[HFTriggerNaturalLanguageOptions setShouldUseFirstPersonPronounIfPossible:](self, "setShouldUseFirstPersonPronounIfPossible:", [v4 shouldUseFirstPersonPronounIfPossible]);
  id v12 = [v4 locationEventUser];

  [(HFTriggerNaturalLanguageOptions *)self setLocationEventUser:v12];
}

- (void)setObjectsInContext:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(NSSet *)self->_objectsInContext isEqual:v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    if (v8)
    {
      objc_super v6 = (NSSet *)v8;
    }
    else
    {
      objc_super v6 = [MEMORY[0x263EFFA08] set];
    }
    objectsInContext = self->_objectsInContext;
    self->_objectsInContext = v6;

    id v5 = v8;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (unint64_t)nameType
{
  return self->_nameType;
}

- (void)setNameType:(unint64_t)a3
{
  self->_nameType = a3;
}

- (BOOL)shouldUseFullDayNames
{
  return self->_shouldUseFullDayNames;
}

- (void)setShouldUseFullDayNames:(BOOL)a3
{
  self->_shouldUseFullDayNames = a3;
}

- (BOOL)shouldUseFirstPersonPronounIfPossible
{
  return self->_shouldUseFirstPersonPronounIfPossible;
}

- (void)setShouldUseFirstPersonPronounIfPossible:(BOOL)a3
{
  self->_shouldUseFirstPersonPronounIfPossible = a3;
}

- (int64_t)formattingStyle
{
  return self->_formattingStyle;
}

- (void)setFormattingStyle:(int64_t)a3
{
  self->_formattingStyle = a3;
}

- (HMUser)locationEventUser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationEventUser);
  return (HMUser *)WeakRetained;
}

- (void)setLocationEventUser:(id)a3
{
}

- (HFActionNaturalLanguageOptions)actionNaturalLanguageOptions
{
  return self->_actionNaturalLanguageOptions;
}

- (void)setActionNaturalLanguageOptions:(id)a3
{
}

- (NSSet)objectsInContext
{
  return self->_objectsInContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsInContext, 0);
  objc_storeStrong((id *)&self->_actionNaturalLanguageOptions, 0);
  objc_destroyWeak((id *)&self->_locationEventUser);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end