@interface CRHandleIntentCommand
- (INIntent)intent;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIntent:(id)a3;
@end

@implementation CRHandleIntentCommand

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRHandleIntentCommand;
  id v5 = -[CRBasicPayloadCommand copyWithZone:](&v9, sel_copyWithZone_);
  v6 = [(CRHandleIntentCommand *)self intent];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setIntent:v7];

  return v5;
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end