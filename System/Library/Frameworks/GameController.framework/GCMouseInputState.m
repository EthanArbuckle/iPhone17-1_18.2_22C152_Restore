@interface GCMouseInputState
- (GCButtonElement)primaryButton;
- (GCButtonElement)secondaryButton;
- (GCButtonElement)thirdButton;
- (GCCursorElement)cursor;
- (GCDirectionPadElement)scrollWheel;
- (NSArray)auxiliaryButtons;
- (id)scroll;
@end

@implementation GCMouseInputState

- (GCButtonElement)primaryButton
{
  return (GCButtonElement *)[(_GCDevicePhysicalInputFacade *)self objectForKeyedSubscript:@"Primary Button"];
}

- (GCButtonElement)secondaryButton
{
  return (GCButtonElement *)[(_GCDevicePhysicalInputFacade *)self objectForKeyedSubscript:@"Secondary Button"];
}

- (GCButtonElement)thirdButton
{
  return (GCButtonElement *)[(_GCDevicePhysicalInputFacade *)self objectForKeyedSubscript:@"Third Button"];
}

- (GCCursorElement)cursor
{
  return (GCCursorElement *)[(_GCDevicePhysicalInputFacade *)self objectForKeyedSubscript:@"Cursor"];
}

- (id)scroll
{
  return [(_GCDevicePhysicalInputFacade *)self objectForKeyedSubscript:@"Scroll Wheel"];
}

- (GCDirectionPadElement)scrollWheel
{
  return self->_scrollWheel;
}

- (NSArray)auxiliaryButtons
{
  return self->_auxiliaryButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryButtons, 0);

  objc_storeStrong((id *)&self->_scrollWheel, 0);
}

@end