@interface HFActionNaturalLanguageOptions
- (BOOL)ignoreOptionalCharacteristics;
- (BOOL)useMediaContainersNotInContext;
- (HFActionNaturalLanguageOptions)initWithHome:(id)a3 formattingContext:(int64_t)a4;
- (HMHome)home;
- (NSSet)objectsInContext;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)accessoryCountType;
- (void)setAccessoryCountType:(unint64_t)a3;
- (void)setHome:(id)a3;
- (void)setIgnoreOptionalCharacteristics:(BOOL)a3;
- (void)setObjectsInContext:(id)a3;
- (void)setUseMediaContainersNotInContext:(BOOL)a3;
@end

@implementation HFActionNaturalLanguageOptions

- (HFActionNaturalLanguageOptions)initWithHome:(id)a3 formattingContext:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFActionNaturalLanguageOptions;
  v8 = [(HFSubstringNaturalLanguageOptions *)&v13 initWithFormattingContext:a4 formattingStyle:3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    uint64_t v10 = [MEMORY[0x263EFFA08] set];
    objectsInContext = v9->_objectsInContext;
    v9->_objectsInContext = (NSSet *)v10;

    v9->_useMediaContainersNotInContext = 0;
    v9->_ignoreOptionalCharacteristics = 0;
    v9->_accessoryCountType = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HFActionNaturalLanguageOptions;
  id v4 = [(HFSubstringNaturalLanguageOptions *)&v9 copyWithZone:a3];
  v5 = [(HFActionNaturalLanguageOptions *)self home];
  [v4 setHome:v5];

  objc_msgSend(v4, "setFormattingStyle:", -[HFSubstringNaturalLanguageOptions formattingStyle](self, "formattingStyle"));
  v6 = [(HFActionNaturalLanguageOptions *)self objectsInContext];
  id v7 = (void *)[v6 copy];
  [v4 setObjectsInContext:v7];

  objc_msgSend(v4, "setUseMediaContainersNotInContext:", -[HFActionNaturalLanguageOptions useMediaContainersNotInContext](self, "useMediaContainersNotInContext"));
  objc_msgSend(v4, "setIgnoreOptionalCharacteristics:", -[HFActionNaturalLanguageOptions ignoreOptionalCharacteristics](self, "ignoreOptionalCharacteristics"));
  return v4;
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
      v6 = (NSSet *)v8;
    }
    else
    {
      v6 = [MEMORY[0x263EFFA08] set];
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

- (NSSet)objectsInContext
{
  return self->_objectsInContext;
}

- (BOOL)useMediaContainersNotInContext
{
  return self->_useMediaContainersNotInContext;
}

- (void)setUseMediaContainersNotInContext:(BOOL)a3
{
  self->_useMediaContainersNotInContext = a3;
}

- (BOOL)ignoreOptionalCharacteristics
{
  return self->_ignoreOptionalCharacteristics;
}

- (void)setIgnoreOptionalCharacteristics:(BOOL)a3
{
  self->_ignoreOptionalCharacteristics = a3;
}

- (unint64_t)accessoryCountType
{
  return self->_accessoryCountType;
}

- (void)setAccessoryCountType:(unint64_t)a3
{
  self->_accessoryCountType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsInContext, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end