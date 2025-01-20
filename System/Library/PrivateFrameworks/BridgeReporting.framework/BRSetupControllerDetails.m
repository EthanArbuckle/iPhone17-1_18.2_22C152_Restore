@interface BRSetupControllerDetails
- (NSNumber)controllerOrder;
- (NSNumber)timeStamp;
- (NSString)controllerName;
- (void)setControllerName:(id)a3;
- (void)setControllerOrder:(id)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation BRSetupControllerDetails

- (NSNumber)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (NSString)controllerName
{
  return self->_controllerName;
}

- (void)setControllerName:(id)a3
{
}

- (NSNumber)controllerOrder
{
  return self->_controllerOrder;
}

- (void)setControllerOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerOrder, 0);
  objc_storeStrong((id *)&self->_controllerName, 0);

  objc_storeStrong((id *)&self->_timeStamp, 0);
}

@end