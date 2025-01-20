@interface CPVoiceControlTemplate
+ (BOOL)supportsSecureCoding;
- (CPVoiceControlTemplate)initWithCoder:(id)a3;
- (CPVoiceControlTemplate)initWithVoiceControlStates:(NSArray *)voiceControlStates;
- (NSArray)voiceControlStates;
- (NSString)activeStateIdentifier;
- (id)leadingNavigationBarButtons;
- (id)trailingNavigationBarButtons;
- (void)activateVoiceControlStateWithIdentifier:(NSString *)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setLeadingNavigationBarButtons:(id)a3;
- (void)setTrailingNavigationBarButtons:(id)a3;
@end

@implementation CPVoiceControlTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPVoiceControlTemplate)initWithVoiceControlStates:(NSArray *)voiceControlStates
{
  v4 = voiceControlStates;
  v14.receiver = self;
  v14.super_class = (Class)CPVoiceControlTemplate;
  v5 = [(CPTemplate *)&v14 init];
  if (v5)
  {
    if ([(NSArray *)v4 count] < 6)
    {
      v9 = v4;
      v6 = v5->_voiceControlStates;
      v5->_voiceControlStates = v9;
    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, 5);
      uint64_t v7 = [(NSArray *)v4 objectsAtIndexes:v6];
      v8 = v5->_voiceControlStates;
      v5->_voiceControlStates = (NSArray *)v7;
    }
    v10 = [(NSArray *)v4 firstObject];
    uint64_t v11 = [v10 identifier];
    activeStateIdentifier = v5->_activeStateIdentifier;
    v5->_activeStateIdentifier = (NSString *)v11;
  }
  return v5;
}

- (CPVoiceControlTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPVoiceControlTemplate;
  v5 = [(CPTemplate *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kCPVoiceControlStatesKey"];

    if ((unint64_t)[v9 count] < 6)
    {
      v13 = v9;
      voiceControlStates = v5->_voiceControlStates;
      v5->_voiceControlStates = v13;
    }
    else
    {
      voiceControlStates = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, 5);
      uint64_t v11 = [v9 objectsAtIndexes:voiceControlStates];
      v12 = v5->_voiceControlStates;
      v5->_voiceControlStates = (NSArray *)v11;
    }
    objc_super v14 = [(CPVoiceControlTemplate *)v5 voiceControlStates];
    v15 = [v14 firstObject];
    uint64_t v16 = [v15 identifier];
    activeStateIdentifier = v5->_activeStateIdentifier;
    v5->_activeStateIdentifier = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPVoiceControlTemplate;
  id v4 = a3;
  [(CPTemplate *)&v6 encodeWithCoder:v4];
  v5 = [(CPVoiceControlTemplate *)self voiceControlStates];
  [v4 encodeObject:v5 forKey:@"kCPVoiceControlStatesKey"];
}

- (void)activateVoiceControlStateWithIdentifier:(NSString *)identifier
{
  v5 = identifier;
  objc_storeStrong((id *)&self->_activeStateIdentifier, identifier);
  objc_super v6 = [(CPTemplate *)self templateProviderFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__CPVoiceControlTemplate_activateVoiceControlStateWithIdentifier___block_invoke;
  v9[3] = &unk_26430A7D0;
  v10 = v5;
  uint64_t v7 = v5;
  id v8 = (id)[v6 addSuccessBlock:v9];
}

uint64_t __66__CPVoiceControlTemplate_activateVoiceControlStateWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _activateStateWithIdentifier:*(void *)(a1 + 32)];
}

- (id)leadingNavigationBarButtons
{
  return 0;
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
}

- (id)trailingNavigationBarButtons
{
  return 0;
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
}

- (NSArray)voiceControlStates
{
  return self->_voiceControlStates;
}

- (NSString)activeStateIdentifier
{
  return self->_activeStateIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeStateIdentifier, 0);

  objc_storeStrong((id *)&self->_voiceControlStates, 0);
}

@end