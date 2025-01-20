@interface PHCarPlayNumberPad
- (BOOL)canBecomeFocused;
- (PHCarPlayNumberPad)initWithUserInterfaceStyle:(int64_t)a3;
- (id)_linearFocusMovementSequences;
- (int64_t)currentlyFocusedButton;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)performTapActionDownForHighlightedKey;
- (void)setCurrentlyFocusedButton:(int64_t)a3;
@end

@implementation PHCarPlayNumberPad

- (PHCarPlayNumberPad)initWithUserInterfaceStyle:(int64_t)a3
{
  v5 = +[TPDialerNumberPad dialerNumberPadFullCharacters];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A75C4;
  v10[3] = &unk_1002CFC08;
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  int64_t v12 = a3;
  id v6 = v11;
  [v5 enumerateObjectsUsingBlock:v10];
  v9.receiver = self;
  v9.super_class = (Class)PHCarPlayNumberPad;
  v7 = [(PHCarPlayNumberPad *)&v9 initWithButtons:v6];

  return v7;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHCarPlayNumberPad;
  [(PHCarPlayNumberPad *)&v17 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  v7 = [v6 previouslyFocusedItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v9 = [v6 previouslyFocusedItem];
    v10 = [v9 buttonColor];
    [v9 setColor:v10];

    [(PHCarPlayNumberPad *)self setCurrentlyFocusedButton:13];
  }
  uint64_t v11 = [v6 nextFocusedItem];
  if (v11)
  {
    int64_t v12 = (void *)v11;
    v13 = [v6 nextFocusedItem];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if (v14)
    {
      v15 = [v6 nextFocusedItem];
      v16 = [v15 buttonColor];
      [v15 setColor:v16];

      -[PHCarPlayNumberPad setCurrentlyFocusedButton:](self, "setCurrentlyFocusedButton:", [v15 character]);
    }
  }
}

- (void)performTapActionDownForHighlightedKey
{
  if ((id)[(PHCarPlayNumberPad *)self currentlyFocusedButton] != (id)13)
  {
    id v3 = [(PHCarPlayNumberPad *)self delegate];
    [v3 phonePad:self appendString:[self currentlyFocusedButton]];
  }
}

- (id)_linearFocusMovementSequences
{
  v2 = [(PHCarPlayNumberPad *)self buttons];
  id v3 = +[_UIFocusLinearMovementSequence sequenceWithItems:v2 loops:0];
  id v6 = v3;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (int64_t)currentlyFocusedButton
{
  return self->_currentlyFocusedButton;
}

- (void)setCurrentlyFocusedButton:(int64_t)a3
{
  self->_currentlyFocusedButton = a3;
}

@end