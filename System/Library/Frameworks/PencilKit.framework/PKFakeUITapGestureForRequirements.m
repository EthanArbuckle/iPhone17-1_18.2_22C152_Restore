@interface PKFakeUITapGestureForRequirements
- (BOOL)isEnabled;
@end

@implementation PKFakeUITapGestureForRequirements

- (BOOL)isEnabled
{
  v3 = [(PKFakeUITapGestureForRequirements *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(PKFakeUITapGestureForRequirements *)self delegate];
    char v6 = [v5 _scribbleInteractionIsEnabled:0];

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKFakeUITapGestureForRequirements;
    return [(PKFakeUITapGestureForRequirements *)&v8 isEnabled];
  }
}

@end