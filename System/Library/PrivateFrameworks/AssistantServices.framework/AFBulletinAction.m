@interface AFBulletinAction
- (AFBulletinAction)initWithBulletinAction:(id)a3;
- (BBAction)bbAction;
- (NSMutableSet)titleVariants;
- (NSString)bbActionID;
- (id)getTitleVariants;
- (void)addTitleVariant:(id)a3;
- (void)setTitleVariants:(id)a3;
@end

@implementation AFBulletinAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleVariants, 0);
  objc_storeStrong((id *)&self->_bbActionID, 0);
  objc_storeStrong((id *)&self->_bbAction, 0);
}

- (void)setTitleVariants:(id)a3
{
}

- (NSMutableSet)titleVariants
{
  return self->_titleVariants;
}

- (NSString)bbActionID
{
  return self->_bbActionID;
}

- (BBAction)bbAction
{
  return self->_bbAction;
}

- (id)getTitleVariants
{
  v2 = (void *)[(NSMutableSet *)self->_titleVariants copy];
  return v2;
}

- (void)addTitleVariant:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_titleVariants, "addObject:");
  }
}

- (AFBulletinAction)initWithBulletinAction:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFBulletinAction;
  v6 = [(AFBulletinAction *)&v14 init];
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    titleVariants = v6->_titleVariants;
    v6->_titleVariants = v7;

    objc_storeStrong((id *)&v6->_bbAction, a3);
    uint64_t v9 = [(BBAction *)v6->_bbAction identifier];
    bbActionID = v6->_bbActionID;
    v6->_bbActionID = (NSString *)v9;

    v11 = [(BBAction *)v6->_bbAction appearance];
    v12 = [v11 title];
    [(AFBulletinAction *)v6 addTitleVariant:v12];
  }
  return v6;
}

@end