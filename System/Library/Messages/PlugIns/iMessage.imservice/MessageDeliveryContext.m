@interface MessageDeliveryContext
- (BOOL)fromMeToMe;
- (BOOL)isBackwardsCompatibleMessage;
- (BOOL)shouldDeactivate;
- (BOOL)success;
- (MessageDeliveryContext)initWithDisplayIDs:(id)a3 didSucceed:(BOOL)a4 error:(unsigned int)a5 isFromMeToMe:(BOOL)a6 shouldDeactivate:(BOOL)a7 isBackwardsCompatibleMessage:(BOOL)a8;
- (NSArray)displayIDs;
- (unsigned)error;
@end

@implementation MessageDeliveryContext

- (MessageDeliveryContext)initWithDisplayIDs:(id)a3 didSucceed:(BOOL)a4 error:(unsigned int)a5 isFromMeToMe:(BOOL)a6 shouldDeactivate:(BOOL)a7 isBackwardsCompatibleMessage:(BOOL)a8
{
  v14 = (NSArray *)a3;
  v18.receiver = self;
  v18.super_class = (Class)MessageDeliveryContext;
  v15 = [(MessageDeliveryContext *)&v18 init];
  displayIDs = v15->_displayIDs;
  v15->_displayIDs = v14;

  v15->_success = a4;
  v15->_error = a5;
  v15->_fromMeToMe = a6;
  v15->_shouldDeactivate = a7;
  v15->_isBackwardsCompatibleMessage = a8;
  return v15;
}

- (NSArray)displayIDs
{
  return self->_displayIDs;
}

- (BOOL)success
{
  return self->_success;
}

- (unsigned)error
{
  return self->_error;
}

- (BOOL)fromMeToMe
{
  return self->_fromMeToMe;
}

- (BOOL)shouldDeactivate
{
  return self->_shouldDeactivate;
}

- (BOOL)isBackwardsCompatibleMessage
{
  return self->_isBackwardsCompatibleMessage;
}

- (void).cxx_destruct
{
}

@end