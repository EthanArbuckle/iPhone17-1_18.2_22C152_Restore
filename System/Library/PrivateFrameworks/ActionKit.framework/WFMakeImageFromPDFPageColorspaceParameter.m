@interface WFMakeImageFromPDFPageColorspaceParameter
- (WFAction)action;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)possibleStatesDidChange;
- (void)setAction:(id)a3;
@end

@implementation WFMakeImageFromPDFPageColorspaceParameter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  if ([a4 isEqualToString:@"WFMakeImageFromPDFPageImageFormat"])
  {
    [(WFMakeImageFromPDFPageColorspaceParameter *)self possibleStatesDidChange];
  }
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)[a3 value];
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (possibleStates)
  {
LABEL_10:
    v11 = possibleStates;
    goto LABEL_11;
  }
  v4 = [(WFMakeImageFromPDFPageColorspaceParameter *)self action];
  v5 = [v4 parameterStateForKey:@"WFMakeImageFromPDFPageImageFormat"];

  if (v5)
  {
    v6 = [v5 value];
    v7 = (void *)CGImageDestinationCopyImageFormats();

    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([v7 containsObject:@"kCGImageDestinationCanRGB"]) {
      [v8 addObject:@"RGB"];
    }
    if ([v7 containsObject:@"kCGImageDestinationCanCMYK"]) {
      [v8 addObject:@"CMYK"];
    }
    if ([v7 containsObject:@"kCGImageDestinationCanGray"]) {
      [v8 addObject:@"Gray"];
    }
    objc_msgSend(v8, "if_compactMap:", &__block_literal_global_31839);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_possibleStates;
    self->_possibleStates = v9;

    possibleStates = self->_possibleStates;
    goto LABEL_10;
  }
  v11 = 0;
LABEL_11:
  return v11;
}

id __59__WFMakeImageFromPDFPageColorspaceParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (id)defaultSerializedRepresentation
{
  v2 = [(WFMakeImageFromPDFPageColorspaceParameter *)self possibleStates];
  id v3 = [v2 firstObject];
  v4 = [v3 serializedRepresentation];

  return v4;
}

- (void)possibleStatesDidChange
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFMakeImageFromPDFPageColorspaceParameter;
  [(WFMakeImageFromPDFPageColorspaceParameter *)&v4 possibleStatesDidChange];
  [(WFMakeImageFromPDFPageColorspaceParameter *)self defaultSerializedRepresentationDidChange];
}

- (void)setAction:(id)a3
{
  p_action = &self->_action;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_action);
  [WeakRetained removeEventObserver:self];

  id v6 = objc_storeWeak((id *)p_action, obj);
  [obj addEventObserver:self];
}

@end