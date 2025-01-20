@interface VOTElementDescriptionDataPackage
- (NSDictionary)lastSeenContextDescriptors;
- (NSDictionary)lastSeenLineAndColumn;
- (VOTCustomAction)customAction;
- (VOTElement)previousElement;
- (void)setCustomAction:(id)a3;
- (void)setLastSeenContextDescriptors:(id)a3;
- (void)setLastSeenLineAndColumn:(id)a3;
- (void)setPreviousElement:(id)a3;
@end

@implementation VOTElementDescriptionDataPackage

- (NSDictionary)lastSeenContextDescriptors
{
  return self->_lastSeenContextDescriptors;
}

- (void)setLastSeenContextDescriptors:(id)a3
{
}

- (NSDictionary)lastSeenLineAndColumn
{
  return self->_lastSeenLineAndColumn;
}

- (void)setLastSeenLineAndColumn:(id)a3
{
}

- (VOTCustomAction)customAction
{
  return self->_customAction;
}

- (void)setCustomAction:(id)a3
{
}

- (VOTElement)previousElement
{
  return self->_previousElement;
}

- (void)setPreviousElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousElement, 0);
  objc_storeStrong((id *)&self->_customAction, 0);
  objc_storeStrong((id *)&self->_lastSeenLineAndColumn, 0);

  objc_storeStrong((id *)&self->_lastSeenContextDescriptors, 0);
}

@end