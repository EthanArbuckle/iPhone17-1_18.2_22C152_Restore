@interface CRNextCardCommand
- (CRCard)nextCard;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setNextCard:(id)a3;
@end

@implementation CRNextCardCommand

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRNextCardCommand;
  id v5 = -[CRBasicPayloadCommand copyWithZone:](&v9, sel_copyWithZone_);
  v6 = [(CRNextCardCommand *)self nextCard];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setNextCard:v7];

  return v5;
}

- (CRCard)nextCard
{
  return self->_nextCard;
}

- (void)setNextCard:(id)a3
{
}

- (void).cxx_destruct
{
}

@end