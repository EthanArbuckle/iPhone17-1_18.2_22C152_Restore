@interface ANSenderContext
- (BOOL)isValidDevice;
- (NSString)senderCorrelationIdentifier;
- (id)description;
- (void)setIsValidDevice:(BOOL)a3;
- (void)setSenderCorrelationIdentifier:(id)a3;
@end

@implementation ANSenderContext

- (id)description
{
  v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[ANSenderContext isValidDevice](self, "isValidDevice"));
  v5 = [(ANSenderContext *)self senderCorrelationIdentifier];
  v6 = [v3 stringWithFormat:@"Valid Device = %@, Sender Corr. ID = %@", v4, v5];

  return v6;
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (void)setSenderCorrelationIdentifier:(id)a3
{
}

- (BOOL)isValidDevice
{
  return self->_isValidDevice;
}

- (void)setIsValidDevice:(BOOL)a3
{
  self->_isValidDevice = a3;
}

- (void).cxx_destruct
{
}

@end