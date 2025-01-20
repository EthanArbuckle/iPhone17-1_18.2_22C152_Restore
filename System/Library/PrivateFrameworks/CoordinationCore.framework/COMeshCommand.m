@interface COMeshCommand
+ (BOOL)supportsSecureCoding;
- (COMeshCommand)init;
- (COMeshCommand)initWithCoder:(id)a3;
- (COMeshNode)sender;
- (id)_sendingConstituent;
- (id)rapportOptions;
- (unint64_t)rapportTransactionID;
- (void)_setRapportOptions:(id)a3;
- (void)_setSender:(id)a3;
- (void)_setSendingConstituent:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMeshCommand

- (COMeshCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)COMeshCommand;
  return [(COMeshCommand *)&v3 init];
}

- (COMeshCommand)initWithCoder:(id)a3
{
  if ([a3 decodeIntegerForKey:@"version"] == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)COMeshCommand;
    return [(COMeshCommand *)&v5 init];
  }
  else
  {

    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COMeshNode)sender
{
  return (COMeshNode *)objc_getAssociatedObject(self, sel_sender);
}

- (id)rapportOptions
{
  return objc_getAssociatedObject(self, sel_rapportOptions);
}

- (unint64_t)rapportTransactionID
{
  v2 = [(COMeshCommand *)self rapportOptions];
  objc_super v3 = [v2 objectForKey:*MEMORY[0x263F62CA8]];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)_sendingConstituent
{
  objc_super v3 = [(COMeshCommand *)self sender];
  unint64_t v4 = v3;
  if (v3) {
    [v3 remote];
  }
  else {
  objc_super v5 = objc_getAssociatedObject(self, sel__sendingConstituent);
  }

  return v5;
}

- (void)_setSendingConstituent:(id)a3
{
}

- (void)_setSender:(id)a3
{
}

- (void)_setRapportOptions:(id)a3
{
}

@end