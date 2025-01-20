@interface SCATGestureFingersElement
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatPerformAction:(int)a3;
- (SCATGestureFingersElementDelegate)delegate;
- (id)scatSpeakableDescription;
- (void)scatDidBecomeFocused:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SCATGestureFingersElement

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (void)scatDidBecomeFocused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCATGestureFingersElement *)self delegate];
  [v5 fingersElement:self didBecomeFocused:v3];
}

- (BOOL)scatPerformAction:(int)a3
{
  if (a3 == 2010)
  {
    id v5 = [(SCATGestureFingersElement *)self delegate];
    [v5 didActivateFingersElement:self];
  }
  return a3 == 2010;
}

- (id)scatSpeakableDescription
{
  return sub_100040EC8(@"EXIT_MENU");
}

- (SCATGestureFingersElementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATGestureFingersElementDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end